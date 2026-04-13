---
title: "Tutorial: Build a .NET mid-tier service with the Execute DAX Queries REST API"
description: Modify an existing .NET mid-tier DAX query service to use the Execute DAX Queries REST API with Apache Arrow IPC format instead of XMLA/ADOMD.
ms.topic: tutorial
ms.date: 04/13/2026
#customer intent: As a .NET developer, I want to convert an existing XMLA-based mid-tier service to use the Arrow endpoint so that I can take advantage of streaming Arrow IPC responses for high-performance DAX query execution.
---

# Tutorial: Build a .NET mid-tier service with the Execute DAX Queries REST API

In this tutorial, you take the [Microsoft.Samples.XMLA.ExecuteQueries](https://github.com/dbrownems/Microsoft.Samples.XMLA.ExecuteQueries) sample — a .NET Web API that proxies DAX queries through the XMLA endpoint using ADOMD.NET — and modify it to use the [Execute DAX Queries REST API](/rest/api/power-bi/datasets/execute-dax-queries), which returns results in Apache Arrow IPC format. The sample provides the mid-tier framework (routing, rate limiting, health probe). This tutorial shows you how to replace the XMLA/ADOMD query execution plumbing with REST API calls and Arrow IPC response handling.

## Prerequisites

- .NET 8 SDK or later.
- A Power BI workspace on Premium or Fabric capacity with at least one semantic model.
- A Microsoft Entra app registration with a client secret.
- The service principal added as a workspace member with **Contributor** (or higher) role.
- The following tenant settings enabled:
  - **Dataset Execute Queries REST API** and **Allow service principals to use Power BI APIs** (under **Developer settings**).
  - **Allow XMLA endpoints and Analyze in Excel with on-premises semantic models** (under **Integration settings**).

For details on the sample service architecture, see the [sample README](https://github.com/dbrownems/Microsoft.Samples.XMLA.ExecuteQueries#readme).

## Before you begin

The sample service uses the XMLA endpoint with ADOMD.NET. This tutorial converts it to use the Execute DAX Queries REST API, which returns results in Apache Arrow IPC format. Both approaches let you run DAX queries against Power BI semantic models, but they differ in important ways.

| | XMLA / ADOMD.NET | Execute DAX Queries REST API |
|---|---|---|
| **Protocol** | XMLA over HTTPS (proprietary binary) | Standard REST (HTTP POST / response) |
| **Client library** | `Microsoft.AnalysisServices.AdomdClient` — Windows-oriented (.NET Core package available but limited cross-platform support), manages sessions and connections | `HttpClient` + `Apache.Arrow` — lightweight, cross-platform, stateless |
| **Authentication** | Connection string with access token; connection-level session | Bearer token per request; no session state |
| **Response format** | Tabular rowsets parsed by the ADOMD client library | Apache Arrow IPC — a columnar binary format with broad ecosystem support (Python, R, Spark, DuckDB) |
| **Connection management** | Requires pooling to amortize session setup cost | Stateless HTTP — no pooling needed; MSAL handles token caching |
| **Best for** | Legacy integrations, MDX queries, fine-grained session control | New services where you want a simpler HTTP integration, columnar performance, or cross-language consumers |

Choose the **Execute DAX Queries REST API** when you're building a new service or your downstream consumers can benefit from Arrow IPC (for example, analytics pipelines, Python notebooks, or columnar databases). Keep **XMLA/ADOMD** if you need MDX support or rely on session-level features like calculated members scoped to a session.

## Step 1: Clone and verify the sample

Clone the repository and confirm it compiles:

```bash
git clone https://github.com/dbrownems/Microsoft.Samples.XMLA.ExecuteQueries.git
cd Microsoft.Samples.XMLA.ExecuteQueries
dotnet build
```

The solution contains two projects: the mid-tier service (`Microsoft.Samples.XMLA.ExecuteQueries`) and a load test client (`Tester`). You don't need to run the original service against a live workspace — just verify the build succeeds before making changes.

## Step 2: Update NuGet dependencies

In the `Microsoft.Samples.XMLA.ExecuteQueries` project, remove the ADOMD.NET package and add packages for the Arrow API:

```bash
cd Microsoft.Samples.XMLA.ExecuteQueries
dotnet remove package Microsoft.AnalysisServices.AdomdClient.NetCore.retail.amd64
dotnet add package Apache.Arrow
dotnet add package Microsoft.Identity.Client
```

Keep the `Microsoft.PowerBI.Api` package if you want to reuse its request/response model types; otherwise remove it and define your own DTOs.

## Step 3: Replace ADOMD connection pooling with MSAL token caching

The sample uses `AdomdConnectionPool.cs` to pool XMLA connections. The Arrow API is a stateless REST endpoint, so you replace connection pooling with MSAL token caching.

Create a new file `TokenService.cs`:

```csharp
using Microsoft.Identity.Client;

public class TokenService
{
    private readonly IConfidentialClientApplication _app;
    private readonly string[] _scopes =
        { "https://analysis.windows.net/powerbi/api/.default" };

    public TokenService(IConfiguration config)
    {
        _app = ConfidentialClientApplicationBuilder
            .Create(config["PowerBI:ClientId"])
            .WithClientSecret(config["PowerBI:ClientSecret"])
            .WithAuthority(AzureCloudInstance.AzurePublic,
                config["PowerBI:TenantId"])
            .Build();
    }

    public async Task<string> GetAccessTokenAsync()
    {
        var result = await _app
            .AcquireTokenForClient(_scopes).ExecuteAsync();
        return result.AccessToken;
    }
}
```

MSAL caches tokens automatically — subsequent calls return the cached token until it expires.

Delete `AdomdConnectionPool.cs` and `AdomdExtensions.cs`. They're no longer needed.

## Step 4: Update the query handler to call the Arrow API

In `Handlers.cs`, replace the ADOMD query execution with an HTTP call to the Execute DAX Queries endpoint.

Remove all ADOMD references (`AdomdConnectionPool`, `AdomdConnection`, `AdomdCommand`, `WrappedConnection`). Change the handler's injected dependencies to `TokenService` and `HttpClient` instead of connection pools and workspace lookups.

Build the REST API URL from the workspace and dataset GUIDs already available in the route parameters:

```csharp
var url = $"https://api.powerbi.com/v1.0/myorg/groups/{workspaceId}"
        + $"/datasets/{datasetId}/executeDaxQueries";
```

POST the DAX query with a JSON request body:

```csharp
var token = await tokenService.GetAccessTokenAsync();

using var request = new HttpRequestMessage(HttpMethod.Post, url);
request.Headers.Authorization =
    new AuthenticationHeaderValue("Bearer", token);
request.Content = new StringContent(
    JsonSerializer.Serialize(new { query, timeout = 120 }),
    Encoding.UTF8, "application/json");

var response = await httpClient.SendAsync(
    request, HttpCompletionOption.ResponseHeadersRead);
response.EnsureSuccessStatusCode();
```

Use `HttpCompletionOption.ResponseHeadersRead` so the response body streams without buffering — this matters for large result sets.

## Step 5: Handle the Arrow IPC response

The Execute DAX Queries API returns one or more Arrow IPC streams concatenated in the response body. Each stream includes schema metadata that indicates its purpose:

- **Data result** — the query results (no special metadata flags).
- **Error result** — `IsError=true` in the schema metadata, with `FaultCode` and `FaultString` values.
- **Execution metrics** — `IsExecMetrics=true` (if you requested metrics via the `executionMetrics` parameter).

Replace `DataResult.cs` with logic that handles the Arrow response. If your mid-tier simply forwards Arrow IPC to downstream consumers, stream the bytes through without deserialization:

```csharp
context.Response.ContentType = "application/vnd.apache.arrow.stream";
await response.Content.CopyToAsync(context.Response.Body);
```

If you need to inspect results or convert formats, deserialize the Arrow stream with `ArrowStreamReader`:

```csharp
using var stream = await response.Content.ReadAsStreamAsync();
using var reader = new ArrowStreamReader(stream);

while (true)
{
    var batch = await reader.ReadNextRecordBatchAsync();
    if (batch == null) break;
    // Process batch — convert to JSON, filter rows, etc.
}
```

Check the schema metadata to detect error responses:

```csharp
var metadata = reader.Schema.Metadata;
if (metadata.TryGetValue("IsError", out var isError)
    && isError == "true")
{
    var faultCode = metadata.GetValueOrDefault(
        "FaultCode", "Unknown");
    var faultString = metadata.GetValueOrDefault(
        "FaultString", "Unknown error");
    // Return error to caller
}
```

## Step 6: Simplify workspace configuration

The sample's `appsettings.json` configures XMLA endpoints and dataset name lookups because ADOMD connects by catalog name. The Arrow REST API uses workspace and dataset GUIDs directly from the request URL, so the configuration is simpler.

Update `appsettings.json` with your service principal credentials and remove the XMLA-specific fields:

```json
{
  "PowerBI": {
    "TenantId": "YOUR_TENANT_ID",
    "ClientId": "YOUR_APP_CLIENT_ID",
    "ClientSecret": "YOUR_CLIENT_SECRET"
  }
}
```

The `Workspaces` section with `XmlaEndpoint` and `Datasets` arrays is no longer needed. You can delete `Workspace.cs` and `Dataset.cs`, or repurpose the `Datasets` list as an allowlist for governance (restricting which datasets the service can query).

## Step 7: Register services and update routing

In `Program.cs`, replace the ADOMD pool and workspace registrations with the new services:

```csharp
builder.Services.AddSingleton<TokenService>();
builder.Services.AddHttpClient();
```

Update the route to match the Execute DAX Queries endpoint pattern:

```csharp
app.MapPost(
    "/v1.0/myorg/groups/{workspaceId:Guid}"
    + "/datasets/{datasetId:Guid}/executeDaxQueries",
    Handlers.ExecuteDaxQueriesInGroup);
```

The existing rate limiter, health probe, and request counter from the sample remain useful as-is.

## Step 8: Test the service

Run the service:

```bash
dotnet run --project Microsoft.Samples.XMLA.ExecuteQueries
```

From another terminal, send a DAX query:

```bash
curl -X POST https://localhost:3000/v1.0/myorg/groups/YOUR_WORKSPACE_ID/datasets/YOUR_DATASET_ID/executeDaxQueries \
  -H "Content-Type: application/json" \
  -d '{"query": "EVALUATE TOPN(5, '\''DimProduct'\'')"}'
```

The response is a binary Arrow IPC stream. Save it to a file and inspect with Python:

```bash
curl -s -o result.arrow https://localhost:3000/v1.0/myorg/groups/YOUR_WORKSPACE_ID/datasets/YOUR_DATASET_ID/executeDaxQueries \
  -H "Content-Type: application/json" \
  -d '{"query": "EVALUATE TOPN(5, '\''DimProduct'\'')"}'

python -c "
import pyarrow as pa
reader = pa.ipc.open_stream('result.arrow')
table = reader.read_all()
print(table.schema)
print(table.to_pandas())
"
```

## Summary of changes

| Original file | Action |
|---|---|
| `AdomdConnectionPool.cs` | **Delete** — replaced by MSAL token caching in `TokenService.cs` |
| `AdomdExtensions.cs` | **Delete** — JSON streaming logic no longer needed |
| `DataResult.cs` | **Rewrite** — stream Arrow IPC through, or deserialize with `ArrowStreamReader` |
| `Handlers.cs` | **Rewrite** — HTTP POST to Execute DAX Queries API instead of ADOMD execution |
| `Workspace.cs` / `Dataset.cs` | **Simplify or delete** — REST API uses GUIDs, not catalog names |
| `Program.cs` | **Update** — register `TokenService` and `IHttpClientFactory`; update route |
| `appsettings.json` | **Simplify** — service principal credentials only; remove XMLA config |
| `.csproj` | **Update** — remove ADOMD package; add `Apache.Arrow` and `Microsoft.Identity.Client` |

## Clean up resources

When you're done testing:

1. Stop the local service (press **Ctrl+C** in the terminal).
1. If you created a Microsoft Entra app registration solely for this tutorial, navigate to the [Azure portal](https://portal.azure.com) and delete it.
1. Remove the service principal from the Power BI workspace if it's no longer needed.

## Related content

- [Mastering the Execute DAX Queries API](overview.md)
- [Get started with the Execute DAX Queries REST API](get-started.md)
- [Best practices for the Execute DAX Queries REST API](best-practices.md)
- [Microsoft.Samples.XMLA.ExecuteQueries sample (GitHub)](https://github.com/dbrownems/Microsoft.Samples.XMLA.ExecuteQueries)
