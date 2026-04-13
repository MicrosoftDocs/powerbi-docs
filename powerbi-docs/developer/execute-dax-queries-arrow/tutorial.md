---
title: "Tutorial: Build a mid-tier DAX query execution service"
description: Build a service that accepts DAX queries, executes them against Power BI semantic models via the Arrow endpoint, and returns results to downstream consumers.
ms.topic: tutorial
ms.date: 04/09/2026
#customer intent: As a developer, I want to build a mid-tier service that proxies DAX queries so that I can centralize authentication, enforce governance, and serve Arrow-formatted results to multiple consumers.
---

# Tutorial: Build a mid-tier DAX query execution service

In this tutorial, you build a mid-tier service that:

- Accepts DAX queries from client applications.
- Authenticates to Power BI using a service principal.
- Executes queries against semantic models via the Arrow endpoint.
- Returns results to downstream consumers in Arrow or service-converted formats (JSON, CSV, Parquet).

## Prerequisites

- A Power BI workspace with a semantic model containing sample data.
- A Microsoft Entra app registration with a client secret or certificate.
- The service principal added as a workspace member with **Contributor** (or higher) role.
- The **Allow service principals to use Power BI APIs** tenant setting enabled.

### [Python](#tab/python)

- Python 3.10 or later.
- Dependencies:

  ```bash
  pip install fastapi uvicorn msal pyarrow pandas
  ```

### [C#](#tab/csharp)

- .NET 8 SDK or later.
- Dependencies:

  ```bash
  dotnet new webapi -n DaxQueryService
  cd DaxQueryService
  dotnet add package Microsoft.Identity.Client
  dotnet add package Apache.Arrow
  ```

---

## Step 1: Set up the project

Create the project structure and configure settings for your service principal credentials.

### [Python](#tab/python)

Create a file named `config.py` with your service principal credentials:

```python
# config.py
TENANT_ID = "YOUR_TENANT_ID"
CLIENT_ID = "YOUR_APP_CLIENT_ID"
CLIENT_SECRET = "YOUR_CLIENT_SECRET"
POWERBI_SCOPE = "https://analysis.windows.net/powerbi/api/.default"
```

Create the main application file `app.py`:

```python
# app.py
from fastapi import FastAPI

app = FastAPI(title="DAX Query Service")

@app.get("/health")
def health():
    return {"status": "ok"}
```

### [C#](#tab/csharp)

After creating the project with `dotnet new webapi`, add your credentials to `appsettings.json`:

```json
{
  "PowerBI": {
    "TenantId": "YOUR_TENANT_ID",
    "ClientId": "YOUR_APP_CLIENT_ID",
    "ClientSecret": "YOUR_CLIENT_SECRET",
    "Scope": "https://analysis.windows.net/powerbi/api/.default"
  }
}
```

Update `Program.cs` with the basic structure:

```csharp
// Program.cs
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/health", () => Results.Ok(new { status = "ok" }));

app.Run();
```

---

## Step 2: Implement token caching

Acquire and cache tokens using MSAL's confidential client to avoid per-request authentication overhead.

### [Python](#tab/python)

Add a token provider module `auth.py`:

```python
# auth.py
from msal import ConfidentialClientApplication
import config

_app = ConfidentialClientApplication(
    client_id=config.CLIENT_ID,
    client_credential=config.CLIENT_SECRET,
    authority=f"https://login.microsoftonline.com/{config.TENANT_ID}",
)

def get_access_token() -> str:
    """Acquire a token from cache or Microsoft Entra ID."""
    result = _app.acquire_token_for_client(
        scopes=[config.POWERBI_SCOPE]
    )
    if "access_token" not in result:
        raise RuntimeError(f"Token acquisition failed: {result.get('error_description')}")
    return result["access_token"]
```

MSAL automatically caches the token in memory. Subsequent calls to `acquire_token_for_client` return the cached token until it expires.

### [C#](#tab/csharp)

Create `TokenService.cs`:

```csharp
// TokenService.cs
using Microsoft.Identity.Client;

public class TokenService
{
    private readonly IConfidentialClientApplication _app;
    private readonly string[] _scopes;

    public TokenService(IConfiguration config)
    {
        var section = config.GetSection("PowerBI");
        _scopes = new[] { section["Scope"]! };

        _app = ConfidentialClientApplicationBuilder
            .Create(section["ClientId"])
            .WithClientSecret(section["ClientSecret"])
            .WithAuthority(AzureCloudInstance.AzurePublic, section["TenantId"])
            .Build();
    }

    public async Task<string> GetAccessTokenAsync()
    {
        var result = await _app.AcquireTokenForClient(_scopes).ExecuteAsync();
        return result.AccessToken;
    }
}
```

Register it as a singleton in `Program.cs`:

```csharp
builder.Services.AddSingleton<TokenService>();
```

---

## Step 3: Build the query execution layer

Create a service class that sends DAX queries to the Arrow endpoint and returns deserialized record batches.

### [Python](#tab/python)

Create `dax_client.py`:

```python
# dax_client.py
import io
import pyarrow as pa
import requests
from auth import get_access_token

API_BASE = "https://api.powerbi.com/v1.0/myorg"


class DaxQueryResult:
    """Wraps one or more Arrow tables from a single API call."""

    def __init__(self, tables: list[pa.Table], errors: list[dict]):
        self.tables = tables
        self.errors = errors


def execute_dax(group_id: str, dataset_id: str, query: str,
                timeout: int = 120) -> DaxQueryResult:
    """Execute a DAX query and return parsed Arrow tables."""
    url = f"{API_BASE}/groups/{group_id}/datasets/{dataset_id}/executeDaxQueries"
    headers = {
        "Authorization": f"Bearer {get_access_token()}",
        "Content-Type": "application/json",
    }
    body = {"query": query, "timeout": timeout}

    resp = requests.post(url, headers=headers, json=body)
    resp.raise_for_status()

    tables, errors = [], []
    stream = io.BytesIO(resp.content)

    while stream.tell() < len(resp.content):
        try:
            reader = pa.ipc.open_stream(stream)
            batches = []
            try:
                while True:
                    batches.append(reader.read_next_batch())
            except StopIteration:
                pass

            metadata = {
                k.decode(): v.decode()
                for k, v in (reader.schema.metadata or {}).items()
            }

            if metadata.get("IsError") == "true":
                error_table = pa.Table.from_batches(batches, schema=reader.schema)
                errors.append({
                    "fault_code": metadata.get("FaultCode"),
                    "fault_string": metadata.get("FaultString"),
                    "details": error_table.to_pandas().to_dict(orient="records"),
                })
            elif metadata.get("IsExecMetrics") != "true":
                tables.append(
                    pa.Table.from_batches(batches, schema=reader.schema)
                )
        except pa.ArrowInvalid:
            break

    return DaxQueryResult(tables=tables, errors=errors)
```

### [C#](#tab/csharp)

Create `DaxClient.cs`:

```csharp
// DaxClient.cs
using System.Net.Http.Headers;
using Apache.Arrow;
using Apache.Arrow.Ipc;

public class DaxClient
{
    private const string ApiBase = "https://api.powerbi.com/v1.0/myorg";
    private readonly HttpClient _http = new();
    private readonly TokenService _tokenService;

    public DaxClient(TokenService tokenService)
    {
        _tokenService = tokenService;
    }

    public async Task<List<RecordBatch>> ExecuteDaxAsync(
        string groupId, string datasetId, string query, int timeout = 120)
    {
        var url = $"{ApiBase}/groups/{groupId}/datasets/{datasetId}/executeDaxQueries";
        var token = await _tokenService.GetAccessTokenAsync();

        _http.DefaultRequestHeaders.Authorization =
            new AuthenticationHeaderValue("Bearer", token);

        var body = new StringContent(
            System.Text.Json.JsonSerializer.Serialize(
                new { query, timeout }),
            System.Text.Encoding.UTF8,
            "application/json");

        var response = await _http.PostAsync(url, body);
        response.EnsureSuccessStatusCode();

        var batches = new List<RecordBatch>();
        using var stream = await response.Content.ReadAsStreamAsync();
        using var reader = new ArrowStreamReader(stream);

        while (true)
        {
            var batch = await reader.ReadNextRecordBatchAsync();
            if (batch == null) break;
            batches.Add(batch);
        }

        return batches;
    }
}
```

Register in `Program.cs`:

```csharp
builder.Services.AddSingleton<DaxClient>();
```

---

## Step 4: Expose the API endpoint

Create an HTTP endpoint that accepts a DAX query and dataset ID, and returns results.

### [Python](#tab/python)

Add the query endpoint to `app.py`:

```python
# app.py
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from dax_client import execute_dax

app = FastAPI(title="DAX Query Service")


class QueryRequest(BaseModel):
    group_id: str
    dataset_id: str
    query: str
    timeout: int = 120


@app.post("/query")
def run_query(req: QueryRequest):
    result = execute_dax(req.group_id, req.dataset_id, req.query, req.timeout)

    if result.errors:
        raise HTTPException(status_code=400, detail=result.errors)

    if not result.tables:
        return {"tables": []}

    return {
        "tables": [
            {
                "schema": [
                    {"name": f.name, "type": str(f.type)}
                    for f in table.schema
                ],
                "rows": table.to_pandas().to_dict(orient="records"),
                "row_count": table.num_rows,
            }
            for table in result.tables
        ]
    }


@app.get("/health")
def health():
    return {"status": "ok"}
```

### [C#](#tab/csharp)

Add the query endpoint to `Program.cs`:

```csharp
// Program.cs
using System.Text.Json;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<TokenService>();
builder.Services.AddSingleton<DaxClient>();

var app = builder.Build();

app.MapGet("/health", () => Results.Ok(new { status = "ok" }));

app.MapPost("/query", async (QueryRequest req, DaxClient client) =>
{
    var batches = await client.ExecuteDaxAsync(
        req.GroupId, req.DatasetId, req.Query, req.Timeout);

    var tables = batches.Select(batch => new
    {
        Schema = batch.Schema.FieldsList.Select(f => new
        {
            f.Name,
            Type = f.DataType.Name
        }),
        RowCount = batch.Length
    });

    return Results.Ok(new { tables });
});

app.Run();

public record QueryRequest(
    string GroupId,
    string DatasetId,
    string Query,
    int Timeout = 120);
```

---

## Step 5: Add response format negotiation

The Execute DAX Queries API always returns Arrow IPC. Your mid-tier service can convert the Arrow results to other formats before returning them to downstream consumers. Let clients request their preferred format—Arrow IPC (default), JSON, CSV, or Parquet—via the `Accept` header.

### [Python](#tab/python)

Add format conversion to `app.py`. The client sends an `Accept` header to request a specific format:

```python
# app.py (add to imports)
import io
import pyarrow as pa
import pyarrow.parquet as pq
from fastapi import Request
from fastapi.responses import Response, StreamingResponse


@app.post("/query/formatted")
def run_query_formatted(req: QueryRequest, request: Request):
    result = execute_dax(req.group_id, req.dataset_id, req.query, req.timeout)

    if result.errors:
        raise HTTPException(status_code=400, detail=result.errors)
    if not result.tables:
        raise HTTPException(status_code=204, detail="No results")

    table = result.tables[0]
    accept = request.headers.get("Accept", "application/json")

    if "application/vnd.apache.arrow.stream" in accept:
        sink = pa.BufferOutputStream()
        writer = pa.ipc.new_stream(sink, table.schema)
        writer.write_table(table)
        writer.close()
        return Response(
            content=sink.getvalue().to_pybytes(),
            media_type="application/vnd.apache.arrow.stream",
        )

    if "text/csv" in accept:
        return Response(
            content=table.to_pandas().to_csv(index=False),
            media_type="text/csv",
        )

    if "application/parquet" in accept:
        buf = io.BytesIO()
        pq.write_table(table, buf)
        return Response(
            content=buf.getvalue(),
            media_type="application/parquet",
        )

    # Default: JSON
    return {
        "schema": [{"name": f.name, "type": str(f.type)} for f in table.schema],
        "rows": table.to_pandas().to_dict(orient="records"),
    }
```

### [C#](#tab/csharp)

Add a formatted endpoint to `Program.cs`:

```csharp
app.MapPost("/query/formatted", async (QueryRequest req, DaxClient client,
    HttpContext context) =>
{
    var batches = await client.ExecuteDaxAsync(
        req.GroupId, req.DatasetId, req.Query, req.Timeout);

    if (batches.Count == 0)
        return Results.NoContent();

    var accept = context.Request.Headers.Accept.ToString();

    if (accept.Contains("application/vnd.apache.arrow.stream"))
    {
        // Return raw Arrow IPC stream
        var memStream = new MemoryStream();
        var writer = new Apache.Arrow.Ipc.ArrowStreamWriter(
            memStream, batches[0].Schema);
        foreach (var batch in batches)
            await writer.WriteRecordBatchAsync(batch);
        await writer.WriteEndAsync();

        return Results.File(
            memStream.ToArray(),
            "application/vnd.apache.arrow.stream");
    }

    if (accept.Contains("text/csv"))
    {
        // Convert to CSV using a simple column-based approach
        var sb = new System.Text.StringBuilder();
        var schema = batches[0].Schema;
        sb.AppendLine(string.Join(",",
            schema.FieldsList.Select(f => f.Name)));
        foreach (var batch in batches)
        {
            for (var row = 0; row < batch.Length; row++)
            {
                var values = new List<string>();
                for (var col = 0; col < batch.ColumnCount; col++)
                {
                    var array = batch.Column(col);
                    var getter = array.GetType().GetMethod("GetValue");
                    values.Add(getter?.Invoke(array,
                        new object[] { row })?.ToString() ?? "");
                }
                sb.AppendLine(string.Join(",", values));
            }
        }
        return Results.Text(sb.ToString(), "text/csv");
    }

    // Default: JSON metadata
    return Results.Ok(new
    {
        tables = batches.Select(b => new
        {
            schema = b.Schema.FieldsList
                .Select(f => new { f.Name, Type = f.DataType.Name }),
            rowCount = b.Length
        })
    });
});
```

---

## Step 6: Add input validation and governance

Validate incoming DAX queries and enforce governance policies (allowed datasets, query complexity limits, row caps).

### [Python](#tab/python)

Create a governance module `governance.py`:

```python
# governance.py
import re

# Datasets that the service is allowed to query
ALLOWED_DATASETS: dict[str, set[str]] = {
    # group_id -> set of dataset_ids
    "YOUR_WORKSPACE_ID": {
        "ALLOWED_DATASET_ID_1",
        "ALLOWED_DATASET_ID_2",
    },
}

MAX_ROW_LIMIT = 100_000
BLOCKED_KEYWORDS = re.compile(
    r"\b(DEFINE\s+TABLE|DATATABLE|GENERATESERIES)\b", re.IGNORECASE
)


def validate_request(group_id: str, dataset_id: str, query: str) -> str | None:
    """Return an error message if the request violates governance rules."""
    allowed = ALLOWED_DATASETS.get(group_id)
    if allowed is None or dataset_id not in allowed:
        return f"Dataset {dataset_id} in workspace {group_id} is not in the allowlist."

    if not query.strip():
        return "Query must not be empty."

    if BLOCKED_KEYWORDS.search(query):
        return "Query contains blocked DAX functions."

    return None
```

Update the endpoint in `app.py` to call the validator:

```python
from governance import validate_request, MAX_ROW_LIMIT

@app.post("/query")
def run_query(req: QueryRequest):
    error = validate_request(req.group_id, req.dataset_id, req.query)
    if error:
        raise HTTPException(status_code=403, detail=error)

    result = execute_dax(req.group_id, req.dataset_id, req.query, req.timeout)

    if result.errors:
        raise HTTPException(status_code=400, detail=result.errors)

    return {
        "tables": [
            {
                "schema": [{"name": f.name, "type": str(f.type)} for f in t.schema],
                "rows": t.to_pandas().head(MAX_ROW_LIMIT).to_dict(orient="records"),
                "row_count": min(t.num_rows, MAX_ROW_LIMIT),
                "truncated": t.num_rows > MAX_ROW_LIMIT,
            }
            for t in result.tables
        ]
    }
```

### [C#](#tab/csharp)

Create `GovernanceService.cs`:

```csharp
// GovernanceService.cs
using System.Text.RegularExpressions;

public class GovernanceService
{
    public const int MaxRowLimit = 100_000;

    // Workspace -> allowed dataset IDs
    private static readonly Dictionary<string, HashSet<string>> AllowedDatasets = new()
    {
        ["YOUR_WORKSPACE_ID"] = new()
        {
            "ALLOWED_DATASET_ID_1",
            "ALLOWED_DATASET_ID_2",
        },
    };

    private static readonly Regex BlockedKeywords = new(
        @"\b(DEFINE\s+TABLE|DATATABLE|GENERATESERIES)\b",
        RegexOptions.IgnoreCase | RegexOptions.Compiled,
        TimeSpan.FromSeconds(1));

    public string? Validate(string groupId, string datasetId, string query)
    {
        if (!AllowedDatasets.TryGetValue(groupId, out var allowed)
            || !allowed.Contains(datasetId))
            return $"Dataset {datasetId} in workspace {groupId} is not in the allowlist.";

        if (string.IsNullOrWhiteSpace(query))
            return "Query must not be empty.";

        if (BlockedKeywords.IsMatch(query))
            return "Query contains blocked DAX functions.";

        return null;
    }
}
```

Register and use it in `Program.cs`:

```csharp
builder.Services.AddSingleton<GovernanceService>();

app.MapPost("/query", async (QueryRequest req, DaxClient client,
    GovernanceService governance) =>
{
    var error = governance.Validate(req.GroupId, req.DatasetId, req.Query);
    if (error != null)
        return Results.Problem(error, statusCode: 403);

    var batches = await client.ExecuteDaxAsync(
        req.GroupId, req.DatasetId, req.Query, req.Timeout);

    return Results.Ok(new
    {
        tables = batches.Select(b => new
        {
            schema = b.Schema.FieldsList.Select(f => new
                { f.Name, Type = f.DataType.Name }),
            rowCount = Math.Min(b.Length, GovernanceService.MaxRowLimit),
            truncated = b.Length > GovernanceService.MaxRowLimit
        })
    });
});
```

---

## Step 7: Test the service

Run the service locally and execute queries against it.

### [Python](#tab/python)

Start the service:

```bash
uvicorn app:app --reload --port 8000
```

Send a test query:

```bash
curl -X POST http://localhost:8000/query \
  -H "Content-Type: application/json" \
  -d '{
    "group_id": "YOUR_WORKSPACE_ID",
    "dataset_id": "YOUR_DATASET_ID",
    "query": "EVALUATE TOPN(5, '\''DimProduct'\'')"
  }'
```

Request CSV format:

```bash
curl -X POST http://localhost:8000/query/formatted \
  -H "Content-Type: application/json" \
  -H "Accept: text/csv" \
  -d '{
    "group_id": "YOUR_WORKSPACE_ID",
    "dataset_id": "YOUR_DATASET_ID",
    "query": "EVALUATE TOPN(5, '\''DimProduct'\'')"
  }'
```

### [C#](#tab/csharp)

Start the service:

```bash
dotnet run
```

Send a test query:

```bash
curl -X POST http://localhost:5000/query \
  -H "Content-Type: application/json" \
  -d '{
    "groupId": "YOUR_WORKSPACE_ID",
    "datasetId": "YOUR_DATASET_ID",
    "query": "EVALUATE TOPN(5, '\''DimProduct'\'')"
  }'
```

Request Arrow IPC format:

```bash
curl -X POST http://localhost:5000/query/formatted \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.apache.arrow.stream" \
  -o result.arrow \
  -d '{
    "groupId": "YOUR_WORKSPACE_ID",
    "datasetId": "YOUR_DATASET_ID",
    "query": "EVALUATE TOPN(5, '\''DimProduct'\'')"
  }'
```

---

## Clean up resources

When you're done testing:

1. Stop the local service (press **Ctrl+C** in the terminal).
1. If you created a Microsoft Entra app registration solely for this tutorial, navigate to the [Azure portal](https://portal.azure.com) and delete it.
1. Remove the service principal from the Power BI workspace if it's no longer needed.

## Related content

- [Mastering the Execute DAX Queries API](overview.md)
- [Get started with the Execute DAX Queries REST API](get-started.md)
- [Best practices for the Execute DAX Queries REST API](best-practices.md)
