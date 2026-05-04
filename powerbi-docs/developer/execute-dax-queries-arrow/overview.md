---
title: Understand the Execute DAX Queries REST API
description: An introduction to the Execute DAX Queries REST API for Power BI semantic models. Learn how to use the Arrow format for high-performance DAX query execution.
ms.topic: overview
ms.date: 05/04/2026
#customer intent: As a developer, I want to learn how to use the Execute DAX Queries REST API so that I can retrieve query results in Apache Arrow format for high-performance analytics.
---

# Understand the Execute DAX Queries REST API

The Execute DAX Queries API lets you run DAX queries against Power BI semantic models and retrieve results programmatically in [Apache Arrow IPC format](https://arrow.apache.org/docs/format/Columnar.html), a columnar binary format designed for high-performance analytics. By returning query results directly in Arrow format, the API eliminates serialization overhead and gives your application access to strongly typed, analysis-ready data.

:::image type="content" source="media/execute-dax-queries-arrow-overview.png" alt-text="Diagram showing the Execute DAX Queries REST API architecture. Client applications (Python, C#, PowerShell) send POST requests and receive Arrow IPC streams from the Power BI Service. The Arrow stream processing pipeline shows six client-side stages: Receive, Deserialize, Validate, Materialize, Transform, and Consume.":::

## What is the Execute DAX Queries API?

The [Execute DAX Queries](/rest/api/power-bi/datasets/execute-dax-queries) API is a REST endpoint that accepts a DAX query string, runs it against a Power BI semantic model, and returns the results in Apache Arrow IPC format. The API supports advanced parameters such as `timeout` and `resultsetRowcountLimit`.

### Apache Arrow IPC format

Apache Arrow defines a language-independent columnar memory format that is widely adopted across the data ecosystem, making it one of the most broadly supported data representations available. The Arrow IPC (Inter-Process Communication) streaming format wraps columnar record batches with schema metadata, enabling:

- **Zero-copy reads** — clients can map the response directly into memory without parsing or copying data between buffers.
- **Cross-language support** — native libraries exist for Python (`pyarrow`), C# (`Apache.Arrow`), Java, Rust, Go, JavaScript, and more, so you can consume results in virtually any language.
- **Efficient compression** — optional LZ4 compression reduces payload size further.
- **Schema-first design** — every Arrow stream starts with a schema message that declares column names, types, and metadata, so clients know the exact data layout before reading any rows.

### DAX to Arrow type mapping

The Execute DAX Queries API maps DAX data types to Arrow types as follows:

| DAX type | Arrow type | Notes |
|---|---|---|
| Integer (whole number) | `int64` | Direct 64-bit integer |
| Decimal | `double` | Double-precision floating point |
| Currency (fixed decimal) | `decimal128(19, 4)` | Lossless four-decimal-place precision |
| Double | `double` | Double-precision floating point |
| DateTime | `date64` | Milliseconds since Unix epoch |
| Boolean | `bool` | |
| String | `utf8` | Dictionary-encoded by default for efficiency |
| Binary | `binary` | |
| Variant | `dense_union` | Union of int64, currency, bool, date64, float64, utf8 |

## Choose between Execute DAX Queries and Execute Queries

Power BI offers two REST APIs for running DAX queries against semantic models. Choose the one that matches your client's capabilities and workload requirements.

### Response format

The [Execute Queries](/rest/api/power-bi/datasets/execute-queries) endpoint returns results as JSON. The [Execute DAX Queries](/rest/api/power-bi/datasets/execute-dax-queries) endpoint returns results in Apache Arrow IPC format, a columnar binary format designed for high-performance analytics. The following table compares the two response formats:

| | JSON (Execute Queries API) | Arrow (Execute DAX Queries API) |
|---|---|---|
| **Format** | Row-oriented JSON | Columnar Arrow IPC |
| **Payload size** | Larger (string encoding overhead) | Smaller (binary, compressed) |
| **Type fidelity** | Lossy (everything is string/number) | Lossless (native date, decimal, int64) |
| **Deserialization** | Parse + type coerce | Zero-copy read into DataFrame |
| **Best for** | Small queries, simple integrations | Large result sets, analytics pipelines |

### When to use each endpoint

We recommend that you use the Execute DAX Queries API for any client application that can consume binary Arrow IPC streams — this includes Python (`pyarrow`), C# (`Apache.Arrow`), Java, Rust, Go, and other languages with Arrow library support.

If you're not sure which endpoint is right for you, consider the following guidance.

Use the **Execute DAX Queries** (Arrow) endpoint when you:

- Retrieve more than a few hundred rows from a semantic model.
- Feed results into pandas, polars, Spark, or other columnar processing frameworks.
- Build a mid-tier service that proxies DAX queries for downstream consumers.
- Need precise numeric or date types without manual type coercion.
- Want to use advanced parameters like `timeout` and `resultsetRowcountLimit`.

Use the **Execute Queries** (JSON) endpoint when you:

- Build on a low-code/no code platform, Power Automate flow, or any tool that can only parse JSON.
- Run small, ad-hoc lookups where JSON is preferred.
- Work with semantic models on Pro or PPU capacity.

### Considerations and limitations

Before adopting the Execute DAX Queries API, review the following differences and constraints compared to the older Execute Queries API:

| | Execute Queries API | Execute DAX Queries API |
| --- | --- | --- |
| **Endpoint** | `executeQueries` | `executeDaxQueries` |
| **Capacity requirement** | Works on Pro, PPU, and Premium/Fabric | Premium or Fabric capacity only |
| **Tenant settings** | **Dataset Execute Queries REST API** (under **Developer settings**) | **Dataset Execute Queries REST API**, **Allow service principals to use Power BI APIs** (under **Developer settings**), and **Allow XMLA endpoints and Analyze in Excel with on-premises semantic models** (under **Integration settings**) |
| **Query input** | `queries[]` array (one query per call) | Single `query` string (multiple `EVALUATE` statements allowed) |
| **Response formats** | JSON only | Arrow IPC only |
| **Additional parameters** | Limited | `timeout`, `resultsetRowcountLimit`, `schemaOnly`, `executionMetrics`, `memoryLimit` |
| **Streaming** | Not streamed | Streamed end-to-end (chunked transfer) |
| **Result size limits** | Hard limit of 100,000 rows and 1,000,000 values per query | No fixed row or value limit (use `resultsetRowcountLimit` to cap if needed) |
| **Pagination** | Not supported | Not supported — use `TOPN` or `resultsetRowcountLimit` for large results |
| **Arrow library required** | No (JSON only) | Yes — an Arrow library (such as `pyarrow` or `Apache.Arrow`) is required to deserialize the response |

## Related content

- [Get started with the Execute DAX Queries REST API](get-started.md)
- [Tutorial: Build a mid-tier DAX query execution service](dotnet-mid-tier-service.md)
- [Tutorial: High-volume Python extraction for data science](python-high-volume-data-extraction.md)
- [Best practices for the Execute DAX Queries REST API](best-practices.md)
- [Execute DAX Queries REST API reference](/rest/api/power-bi/datasets/execute-dax-queries)
- [Power BI REST APIs](/rest/api/power-bi/)
