---
title: "Tutorial: High-volume Python extraction in Fabric notebooks"
description: Build a Microsoft Fabric notebook that queries multiple semantic models with Execute DAX Queries, materializes Arrow results as pandas DataFrames, and incrementally merges them into a Delta table for Direct Lake analytics.
ms.topic: tutorial
ms.date: 04/22/2026
ai-usage: ai-assisted
#customer intent: As a data scientist or analytics engineer, I want to query multiple semantic models directly into pandas and incrementally persist the results to Delta so that I can reduce serialization overhead and keep Direct Lake scenarios performant.
---

# Tutorial: High-volume Python extraction in Fabric notebooks

In this tutorial, you build a Microsoft Fabric notebook that extracts data from multiple Power BI semantic models by using the [Execute DAX Queries REST API](/rest/api/power-bi/datasets/execute-dax-queries). You deserialize Arrow IPC responses into pandas DataFrames, compare and combine model outputs, and incrementally merge results into a Delta table in OneLake.

This pattern is designed for data scientists and analytics engineers who need high-throughput extraction with low parsing overhead.

## Why this pattern works

Compared to JSON-based extraction, Arrow IPC reduces CPU and memory overhead on the client side because you avoid repeated JSON parsing and object materialization. You can read Arrow buffers directly into a tabular in-memory representation and convert to pandas with fewer transformation steps.

When you persist result sets incrementally to Delta, you also avoid full table rewrites. This approach helps reduce capacity-unit (CU) usage while keeping downstream Direct Lake scenarios current.

## What you build

In one Fabric notebook, you:

1. Query two semantic models with DAX.
1. Materialize each response as a pandas DataFrame.
1. Compare or combine the DataFrames.
1. Incrementally merge changes into a Delta table.
1. Validate that Direct Lake consumers can pick up the updated data.

## Prerequisites

- A Fabric or Premium capacity workspace.
- At least two semantic models you want to compare or combine.
- Build and Read permissions on each semantic model.
- A Fabric notebook attached to a lakehouse where you can create and update Delta tables.
- Python packages:

  ```python
  %pip install msal requests pyarrow pandas
  ```

- Tenant settings enabled:
  - **Dataset Execute Queries REST API**.
  - **Allow service principals to use Power BI APIs** if you use app-only authentication.

## Fabric notebook flow

The notebook performs these steps:

1. Acquire an access token.
1. Execute DAX against multiple semantic models.
1. Deserialize Arrow responses into pandas DataFrames.
1. Normalize schemas and compare or combine DataFrames.
1. Incrementally merge results into a Delta table.
1. Validate data availability for Direct Lake consumption.

## Step 1: Acquire an Entra Id token for the current user

In the first code cell, define semantic model targets and acquire a token.

```python
import notebookutils  # available in every Fabric notebook runtime

# Power BI resource URI — must match this exact value
PBI_RESOURCE = "https://analysis.windows.net/powerbi/api"

# Acquire an Entra Id token for the current user (or workspace identity)
# using the notebook's built-in credential provider.
access_token = notebookutils.credentials.getToken(PBI_RESOURCE)
if access_token is None:
    raise RuntimeError(f"Token acquisition failed")
```

## Step 2: Execute DAX queries across semantic models

Define a helper that executes DAX and returns a pandas DataFrame from Arrow IPC.

```python
import io
import pandas as pd
import pyarrow as pa

from datetime import datetime, timezone

def execute_dax_to_pandas(workspace_id: str, dataset_id: str, query: str) -> pd.DataFrame:
    url = (
        f"https://api.powerbi.com/v1.0/myorg/groups/{workspace_id}"
        f"/datasets/{dataset_id}/executeDaxQueries"
    )
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    body = {
        "query": query,
        "resultsetRowcountLimit": 500000
    }

    response = requests.post(url, headers=headers, json=body, timeout=180)
    response.raise_for_status()

    reader = pa.ipc.open_stream(io.BytesIO(response.content))
    table = reader.read_all()
    return table.to_pandas()
```

In the next code cell, run a model-specific DAX query for each model and tag provenance:

```python
dax_query = """
EVALUATE
SUMMARIZECOLUMNS(
    'Date'[Date],
    'Product'[ProductKey],
    "NetSales", [Net Sales],
    "Units", [Units]
)
"""

models = [
    {
        "name": "YOUR_FIRST_SEMANTIC_MODEL",
        "workspace_id": "YOUR_WORKSPACE_ID_1",
        "dataset_id": "YOUR_DATASET_ID_1"
    },
    {
        "name": "YOUR_SECOND_SEMANTIC_MODEL",
        "workspace_id": "YOUR_WORKSPACE_ID_2",
        "dataset_id": "YOUR_DATASET_ID_2"
    }
]

frames = []
for m in models:
    df = execute_dax_to_pandas(m["workspace_id"], m["dataset_id"], dax_query)
    df["model_name"] = m["name"]
    df["extract_utc"] = datetime.now(timezone.utc)
    frames.append(df)

print(f"Extracted {len(frames)} DataFrames.")
```

## Step 3: Compare and combine DataFrames

Normalize key columns, then compare model outputs or combine them into a single analytical set.

```python
for i, df in enumerate(frames):
    df["Date"] = pd.to_datetime(df["Date"], utc=True)
    df["ProductKey"] = df["ProductKey"].astype("int64")
    frames[i] = df

combined_df = pd.concat(frames, ignore_index=True)

# Example comparison: variance between models by date and product
comparison_df = (
    combined_df
    .pivot_table(
        index=["Date", "ProductKey"],
        columns="model_name",
        values="NetSales",
        aggfunc="sum"
    )
    .reset_index()
)

if "sales_model" in comparison_df and "inventory_model" in comparison_df:
    comparison_df["netsales_delta"] = (
        comparison_df["sales_model"] - comparison_df["inventory_model"]
    )

display(comparison_df.head(20))
```

## Step 4: Incrementally merge to a Delta table

Use a Delta merge keyed on business-grain columns. This pattern updates changed rows and inserts new rows without rewriting the full table.

```python
# In Fabric notebooks, Spark is available by default.
spark_df = spark.createDataFrame(combined_df)
spark_df.createOrReplaceTempView("stg_semantic_extract")

spark.sql("""
CREATE TABLE IF NOT EXISTS lakehouse.analytics.semantic_extract_delta
USING DELTA
AS
SELECT * FROM stg_semantic_extract WHERE 1 = 0
""")

spark.sql("""
MERGE INTO lakehouse.analytics.semantic_extract_delta AS tgt
USING stg_semantic_extract AS src
ON  tgt.Date = src.Date
AND tgt.ProductKey = src.ProductKey
AND tgt.model_name = src.model_name
WHEN MATCHED THEN UPDATE SET *
WHEN NOT MATCHED THEN INSERT *
""")
```

> [!TIP]
> For very large extraction windows, partition the target Delta table by date and process in bounded slices. This approach improves merge efficiency and helps control CU usage.

## Step 5: Validate Direct Lake readiness

Confirm that the Delta table is updated and queryable:

```python
spark.sql("""
SELECT model_name, COUNT(*) AS row_count, MAX(extract_utc) AS latest_extract
FROM lakehouse.analytics.semantic_extract_delta
GROUP BY model_name
""").show(truncate=False)
```

After the Delta table is updated, Direct Lake semantic models that reference that table can pick up the new data through normal synchronization behavior.

## Suggested Fabric notebook cell layout

Use this cell layout to keep the workflow maintainable:

1. Markdown cell: scenario, model IDs, and table target.
1. Python cell: package imports and token acquisition.
1. Python cell: DAX execution helper.
1. Python cell: extract data from each semantic model.
1. Python cell: compare/combine pandas DataFrames.
1. Python cell: write staging DataFrame to Spark and run Delta `MERGE`.
1. Python cell: validate row counts and latest extraction timestamps.

## Performance guidance

- Keep DAX scoped to only required columns and rows.
- Use `resultsetRowcountLimit` and DAX filters to bound extraction windows.
- Favor incremental merges over full refresh writes.
- Reuse a single MSAL client and token cache per notebook session.
- Prefer Arrow end-to-end for extraction to avoid JSON parse overhead in Python.
- Track extraction duration, payload size, and merge duration as operational metrics.

## Troubleshooting

- **401 Unauthorized**: Validate tenant, client credentials, and scope.
- **403 Forbidden**: Confirm semantic model Build and Read permissions.
- **HTTP 429**: Add retry with exponential backoff and jitter.
- **Schema drift between models**: Normalize column names and data types before merge.
- **Large memory usage in pandas**: Process model outputs in batches or aggregate in DAX before extraction.

## Related content

- [Mastering the Execute DAX Queries API](overview.md)
- [Get started with the Execute DAX Queries REST API](get-started.md)
- [Tutorial: Build a .NET mid-tier service with the Execute DAX Queries REST API](dotnet-midtier-service.md)
- [Best practices for the Execute DAX Queries REST API](best-practices.md)