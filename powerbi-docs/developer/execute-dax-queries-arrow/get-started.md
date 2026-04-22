---
title: Get started with the Execute DAX Queries REST API
description: Run your first DAX query against a Power BI semantic model and retrieve results in Apache Arrow format using Python, C#, or PowerShell.
ms.topic: quickstart
ms.date: 04/09/2026
#customer intent: As a developer, I want to quickly run a DAX query and get Arrow-formatted results so that I can evaluate the API for my use case.
---

# Get started with the Execute DAX Queries REST API

In this quickstart, you authenticate to Power BI, execute a DAX query against a semantic model, and deserialize the Arrow response into a local data structure.

## Prerequisites

- A Power BI workspace with at least one semantic model.
- **Build** and **Read** permissions on the semantic model.
- A Microsoft Entra app registration (or use interactive authentication for testing).

### [Python](#tab/python)

- Python 3.10 or later.
- Install dependencies:

  ```bash
  pip install msal pyarrow pandas
  ```

### [C#](#tab/csharp)

- .NET 8 SDK or later.
- Install dependencies:

  ```bash
  dotnet add package Microsoft.Identity.Client
  dotnet add package Apache.Arrow
  ```

### [PowerShell](#tab/powershell)

- PowerShell 7.4 or later.
- Install the `MSAL.PS` module:

  ```powershell
  Install-Module -Name MSAL.PS -Scope CurrentUser
  ```

---

## Step 1: Authenticate

Acquire a bearer token with the `https://analysis.windows.net/powerbi/api/.default` scope.

### [Python](#tab/python)

```python
from msal import PublicClientApplication

client_id = "YOUR_APP_CLIENT_ID"
authority = "https://login.microsoftonline.com/YOUR_TENANT_ID"
scopes = ["https://analysis.windows.net/powerbi/api/.default"]

app = PublicClientApplication(client_id, authority=authority)
result = app.acquire_token_interactive(scopes=scopes)

access_token = result["access_token"]
```

### [C#](#tab/csharp)

```csharp
using Microsoft.Identity.Client;

var clientId = "YOUR_APP_CLIENT_ID";
var tenantId = "YOUR_TENANT_ID";
var scopes = new[] { "https://analysis.windows.net/powerbi/api/.default" };

var app = PublicClientApplicationBuilder
    .Create(clientId)
    .WithAuthority(AzureCloudInstance.AzurePublic, tenantId)
    .WithRedirectUri("http://localhost")
    .Build();

var result = await app.AcquireTokenInteractive(scopes).ExecuteAsync();
var accessToken = result.AccessToken;
```

### [PowerShell](#tab/powershell)

```powershell
$clientId = "YOUR_APP_CLIENT_ID"
$tenantId = "YOUR_TENANT_ID"
$scopes = @("https://analysis.windows.net/powerbi/api/.default")

$token = Get-MsalToken -ClientId $clientId -TenantId $tenantId -Scopes $scopes -Interactive
$accessToken = $token.AccessToken
```

---

## Step 2: Execute a DAX query

Send a POST request to the Execute Queries Arrow endpoint with a simple `EVALUATE` statement.

### [Python](#tab/python)

```python
import io
import pyarrow as pa
import requests

group_id = "YOUR_WORKSPACE_ID"
dataset_id = "YOUR_DATASET_ID"

url = (f"https://api.powerbi.com/v1.0/myorg/groups/{group_id}"
       f"/datasets/{dataset_id}/executeDaxQueries")

headers = {
    "Authorization": f"Bearer {access_token}",
    "Content-Type": "application/json",
}

body = {"query": "EVALUATE TOPN(5, 'DimProduct')"}

response = requests.post(url, headers=headers, json=body)
response.raise_for_status()

reader = pa.ipc.open_stream(io.BytesIO(response.content))
table = reader.read_all()
df = table.to_pandas()

print(df)
```

### [C#](#tab/csharp)

```csharp
using System.Net.Http.Headers;
using Apache.Arrow;
using Apache.Arrow.Ipc;

var groupId = "YOUR_WORKSPACE_ID";
var datasetId = "YOUR_DATASET_ID";

var url = $"https://api.powerbi.com/v1.0/myorg/groups/{groupId}"
        + $"/datasets/{datasetId}/executeDaxQueries";

using var client = new HttpClient();
client.DefaultRequestHeaders.Authorization =
    new AuthenticationHeaderValue("Bearer", accessToken);

var body = new StringContent(
    """{"query": "EVALUATE TOPN(5, 'DimProduct')"}""",
    System.Text.Encoding.UTF8,
    "application/json");

var response = await client.PostAsync(url, body);
response.EnsureSuccessStatusCode();

using var stream = await response.Content.ReadAsStreamAsync();
using var reader = new ArrowStreamReader(stream);

var batch = await reader.ReadNextRecordBatchAsync();
Console.WriteLine($"Rows: {batch.Length}, Columns: {batch.ColumnCount}");
```

### [PowerShell](#tab/powershell)

```powershell
$groupId = "YOUR_WORKSPACE_ID"
$datasetId = "YOUR_DATASET_ID"

$url = "https://api.powerbi.com/v1.0/myorg/groups/$groupId" +
       "/datasets/$datasetId/executeDaxQueries"

$headers = @{
    "Authorization" = "Bearer $accessToken"
    "Content-Type"  = "application/json"
}

$body = @{ query = "EVALUATE TOPN(5, 'DimProduct')" } | ConvertTo-Json

$response = Invoke-WebRequest -Uri $url -Method Post -Headers $headers -Body $body

# Save the binary Arrow stream to a file for inspection
$arrowFile = "result.arrow"
[System.IO.File]::WriteAllBytes($arrowFile, $response.Content)
Write-Host "Arrow stream saved to $arrowFile ($($response.Content.Length) bytes)"
```

---

## Step 3: Inspect the results

### [Python](#tab/python)

```python
# Print the Arrow schema (column names and types)
print(table.schema)

# Show the first few rows as a pandas DataFrame
print(df.head())

# Access a specific column
print(table.column("ProductName").to_pylist()[:5])
```

### [C#](#tab/csharp)

```csharp
// Print the schema (column names and types)
for (var i = 0; i < batch.Schema.FieldsList.Count; i++)
{
    var field = batch.Schema.FieldsList[i];
    Console.WriteLine($"  {field.Name}: {field.DataType}");
}

// Print the first row's values
for (var i = 0; i < batch.ColumnCount; i++)
{
    var column = batch.Column(i);
    Console.Write($"{batch.Schema.FieldsList[i].Name}=");
    Console.Write(column.GetType().GetMethod("GetValue")?.Invoke(column, new object[] { 0 }));
    Console.Write("  ");
}
```

### [PowerShell](#tab/powershell)

```powershell
# Use Python with pyarrow to read the saved Arrow file
python -c @"
import pyarrow as pa
reader = pa.ipc.open_stream('result.arrow')
table = reader.read_all()
print(table.schema)
print(table.to_pandas().head())
"@
```

---

## Clean up resources

If you created a Microsoft Entra app registration solely for testing, navigate to the [Azure portal](https://portal.azure.com) and delete it. Access tokens expire automatically and don't need manual revocation.

## Related content

- [Mastering the Execute DAX Queries API](overview.md)
- [Tutorial: Build a mid-tier DAX query execution service](dotnet-midtier-service.md)
- [Tutorial: High-volume Python extraction for data science](python-high-volume-data-extraction.md)
- [Best practices for the Execute DAX Queries REST API](best-practices.md)
