---
title: Best practices for the Execute DAX Queries REST API
description: Performance tips, error handling patterns, and production guidance for using the Execute DAX Queries API with Apache Arrow format.
ms.topic: concept
ms.date: 04/09/2026
#customer intent: As a developer, I want to follow best practices when using the Arrow endpoint so that my queries are reliable, performant, and well-architected.
---

# Best practices for the Execute DAX Queries REST API

Follow these recommendations to get the most out of the Execute DAX Queries REST API in production workloads.

## Choose the right endpoint

> [!NOTE]
> The Execute DAX Queries API is available only for semantic models that reside on a Power BI capacity (Premium, Fabric, or Embedded). Semantic models without a capacity assignment are not supported.

Power BI offers two REST APIs for executing DAX queries. Choose the one that matches your client's capabilities:

- **[Execute DAX Queries](/rest/api/power-bi/datasets/execute-dax-queries) (Arrow)** — Use whenever your client application can consume binary Arrow IPC streams. Arrow delivers smaller payloads, lossless type fidelity, and zero-copy deserialization into columnar frameworks like pandas, Polars, and Apache Spark. This API also supports advanced parameters like `timeout`, `skipCompression`, and `resultsetRowcountLimit`. Requires Premium or Fabric capacity.
- **[Execute Queries](/rest/api/power-bi/datasets/execute-queries) (JSON)** — Use when your consumer is a low-code/no-code platform, Power Automate flow, or any tool that can only parse JSON. This API works on Pro, PPU, and Premium/Fabric capacities but has a hard limit of 100,000 rows and 1,000,000 values per query.

As a general rule, if your result set exceeds a few hundred rows, feeds into an analytics pipeline, or requires precise type fidelity, use the Execute DAX Queries API with Arrow.

## Optimize DAX queries for the Arrow endpoint

Efficient DAX reduces both query execution time and response payload size:

- **Return only the columns you need.** Use `SELECTCOLUMNS` or explicit column lists instead of returning entire tables. Every extra column adds to the schema and record batch size.
- **Prefer `SUMMARIZECOLUMNS` over `ADDCOLUMNS` with `FILTER`.** `SUMMARIZECOLUMNS` produces more efficient query plans in the VertiPaq engine.
- **Use `TOPN` to limit rows.** When you only need the top results, `TOPN` pushes the limit into the engine rather than transferring all rows and filtering client-side.
- **Avoid complex calculated columns in queries.** Measures and aggregations are fine, but row-level calculations on large tables can slow execution significantly.
- **Combine multiple `EVALUATE` statements in a single request.** The Execute DAX Queries API supports multiple `EVALUATE` statements inside one `query` string, each returning a separate result set. This avoids the overhead of separate HTTP round trips.

## Manage authentication efficiently

- **Cache and reuse tokens.** Use MSAL's built-in token cache to avoid calling Microsoft Entra ID on every request. For confidential client flows, MSAL caches tokens automatically when you reuse the same `ConfidentialClientApplication` instance.
- **Use confidential client credentials for services.** For unattended mid-tier services, use client credentials (client secret or certificate) instead of delegated user tokens. This avoids dependency on a signed-in user session.
- **Prefer managed identities in Azure.** When your service runs in Azure (App Service, Functions, AKS), use a managed identity to eliminate credential management entirely.
- **Handle token expiration gracefully.** Access tokens typically expire after one hour. Check for `401 Unauthorized` responses and refresh the token before retrying.

## Handle errors and retries

The Execute DAX Queries API can return errors in two ways:

1. **HTTP-level errors** — Standard HTTP status codes with a JSON error body. Common codes:

   | Status code | Meaning | Action |
   |---|---|---|
   | `400` | Bad request (invalid DAX, missing parameters) | Fix the request — don't retry. |
   | `401` | Unauthorized (expired or invalid token) | Refresh the token and retry once. |
   | `403` | Forbidden (insufficient permissions) | Verify the caller has Build and Read permissions on the semantic model. |
   | `429` | Too many requests (throttled) | Wait for the duration in the `Retry-After` header, then retry. |
   | `500` / `502` / `503` | Transient server errors | Retry with exponential backoff. |

1. **Stream-level errors** — HTTP 200 with an error rowset embedded in the Arrow response. Check the Arrow schema metadata for `IsError=true` and read the `FaultCode` and `FaultString` metadata values, plus the error rows for detailed location info.

For transient errors, implement exponential backoff with jitter. Start at one second, double on each retry, and cap at 30 seconds. Limit retries to three or four attempts.

## Control result set size

Large result sets consume memory on both the capacity in the service and the calling client. Each request is bound by the capacity's memory limit.

To keep result sets manageable:

- **Set `resultsetRowcountLimit` in the request body.** This enforces a server-side row limit per result set. If you know your consumer only needs 10,000 rows, set the limit explicitly.
- **Use `TOPN` in your DAX query.** `TOPN` limits rows at the engine level, which is more efficient than truncating client-side.
- **Process record batches incrementally.** Arrow responses are split into record batches of up to 100,000 rows. In Python, iterate over batches with `reader.read_next_batch()` instead of calling `reader.read_all()` when working with large results, to keep memory usage constant.

## Secure your mid-tier service

If you build a mid-tier service that proxies DAX queries for downstream consumers:

- **Validate caller identity.** Authenticate incoming requests with Microsoft Entra ID or another identity provider before forwarding queries to Power BI. Never expose the Execute DAX Queries endpoint as an open proxy.
- **Enforce least privilege.** Grant the service principal only the permissions it needs (Build and Read on specific semantic models). Don't use workspace admin or tenant admin roles for API access.
- **Don't embed credentials in code.** Store client secrets in Azure Key Vault or use managed identities. Rotate secrets on a regular schedule.
- **Sanitize DAX input.** If your mid-tier accepts DAX query text from callers, validate the input to prevent injection of unexpected operations.
- **Use the `effectiveUsername` parameter with care.** This parameter applies Row-Level Security on behalf of a specific user. Ensure the calling identity is authorized to impersonate the specified user.

## Monitor and log

Track the health and performance of your API usage:

- **Log query metadata** — Record the query text, response size, HTTP status, and duration for each request. This helps identify slow queries and unexpected error spikes.
- **Monitor throttling rates** — Track `429` responses as a percentage of total requests. A rising trend indicates you need to reduce request frequency or spread load across time.
- **Measure deserialization time** — For Arrow responses, log the time spent reading and materializing record batches separately from the HTTP round-trip time. This helps distinguish network latency from client-side processing.
- **Use Application Insights or equivalent** — If your mid-tier runs in Azure, enable Application Insights to get dependency tracking, failure alerts, and end-to-end distributed tracing.
- **Track token cache hit rates** — Low cache hit rates mean frequent token acquisition calls, which add latency and are a sign of misconfigured MSAL caching.

## Related content

- [Mastering the Execute DAX Queries API](overview.md)
- [Get started with the Execute DAX Queries REST API](get-started.md)
- [Tutorial: Build a mid-tier DAX query execution service](tutorial.md)
