---
title: Mastering the Execute DAX Queries REST API
description: A tutorial for the Execute DAX Queries REST API for Power BI semantic models. Learn how to use the Arrow format for high-performance DAX query execution.
ms.topic: tutorial
ms.date: 04/09/2026
#customer intent: As a developer, I want to learn how to use the Execute DAX Queries REST API so that I can retrieve query results in Apache Arrow format for high-performance analytics.
---

# Mastering the Execute DAX Queries REST API

The Execute DAX Queries API lets you run DAX queries against Power BI semantic models and retrieve results programmatically in [Apache Arrow IPC format](https://arrow.apache.org/docs/format/Columnar.html), a columnar binary format designed for high-performance analytics. By returning query results directly in Arrow format, the API eliminates serialization overhead and gives your application access to strongly typed, analysis-ready data.

:::image type="content" source="media/execute-dax-queries-arrow-overview.png" alt-text="Diagram showing the Execute DAX Queries REST API architecture. Client applications (Python, C#, PowerShell) send POST requests and receive Arrow IPC streams from the Power BI Service. The Arrow stream processing pipeline shows six client-side stages: Receive, Deserialize, Validate, Materialize, Transform, and Consume.":::

## Why Arrow?

The existing [Execute Queries](/rest/api/power-bi/datasets/execute-queries) endpoint returns results as JSON. The newer [Execute DAX Queries](/rest/api/power-bi/datasets/execute-dax-queries) endpoint returns results exclusively in Apache Arrow IPC format, a columnar binary format designed for high-performance analytics. The following table compares the two response formats:

| | JSON (Execute Queries API) | Arrow (Execute DAX Queries API) |
|---|---|---|
| **Format** | Row-oriented JSON | Columnar Arrow IPC |
| **Payload size** | Larger (string encoding overhead) | Smaller (binary, compressed) |
| **Type fidelity** | Lossy (everything is string/number) | Lossless (native date, decimal, int64) |
| **Deserialization** | Parse + type coerce | Zero-copy read into DataFrame |
| **Best for** | Small queries, simple integrations | Large result sets, analytics pipelines |

> [!TIP]
> Use the Execute DAX Queries API for any client application that can consume binary Arrow IPC streams — this includes Python (`pyarrow`), C# (`Apache.Arrow`), Java, Rust, Go, and other languages with Arrow library support. For low-code/no-code platforms, Power Automate flows, or other solutions that can only consume JSON, continue to use the older [Execute Queries](/rest/api/power-bi/datasets/execute-queries) API. Although the Execute Queries API lacks the advanced parameters available in Execute DAX Queries (such as `timeout` and `resultsetRowcountLimit`), it remains the appropriate choice when JSON output is required.

## Apache Arrow IPC format

Apache Arrow defines a language-independent columnar memory format that has been widely adopted across the data ecosystem, making it one of the most broadly supported data representations available. The Arrow IPC (Inter-Process Communication) streaming format wraps columnar record batches with schema metadata, enabling:

- **Zero-copy reads** — clients can map the response directly into memory without parsing or copying data between buffers.
- **Cross-language support** — native libraries exist for Python (`pyarrow`), C# (`Apache.Arrow`), Java, Rust, Go, JavaScript, and more, so you can consume results in virtually any language.
- **Efficient compression** — optional LZ4 compression reduces payload size further.
- **Schema-first design** — every Arrow stream starts with a schema message that declares column names, types, and metadata, so clients know the exact data layout before reading any rows.

## DAX to Arrow type mapping

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

## When to use the Arrow endpoint

Use the Arrow endpoint when you:

- Retrieve more than a few hundred rows from a semantic model.
- Feed results into pandas, polars, Spark, or other columnar processing frameworks.
- Build a mid-tier service that proxies DAX queries for downstream consumers.
- Need precise numeric or date types without manual type coercion.

For simple, small queries or quick ad-hoc lookups where JSON is preferred, the older [Execute Queries](/rest/api/power-bi/datasets/execute-queries) API remains a straightforward choice.

## Considerations and limitations

Before adopting the Execute DAX Queries API, review the following differences and constraints compared to the older Execute Queries API:

| | Execute Queries API | Execute DAX Queries API |
|---|---|---|
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
- [Tutorial: Build a mid-tier DAX query execution service](tutorial.md)
- [Best practices for the Execute DAX Queries REST API](best-practices.md)
- [Execute DAX Queries REST API reference](/rest/api/power-bi/datasets/execute-dax-queries)
- [Power BI REST APIs](/rest/api/power-bi/)
