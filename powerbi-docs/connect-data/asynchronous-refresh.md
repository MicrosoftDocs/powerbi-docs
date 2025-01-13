---
title: Enhanced refresh with the Power BI REST API
description: Learn how to do enhanced semantic model refreshes by using the Power BI Refresh Dataset REST API.
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 01/07/2025
---

# Enhanced refresh with the Power BI REST API

You can use any programming language that supports REST calls to do semantic model refresh operations by using the Power BI Refresh Dataset REST API.

Optimized refresh for large and complex partitioned models is traditionally invoked with programming methods that use TOM (Tabular Object Model), PowerShell cmdlets, or TMSL (Tabular Model Scripting Language). However, these methods require long-running HTTP connections that can be unreliable.

The Power BI Refresh Dataset REST API can carry out model refresh operations asynchronously, so long-running HTTP connections from client applications aren't necessary. Compared to standard refresh operations, *enhanced refresh* with the REST API provides more customization options and the following features that are helpful for large models:

- Batched commits
- Table and partition-level refresh
- Applying incremental refresh policies
- `GET` refresh details
- Refresh cancellation
- Timeout configuration

> [!NOTE]
> - Previously, enhanced refresh was called *asynchronous refresh with REST API*. However, a standard refresh that uses the Refresh Dataset REST API also runs asynchronously by its inherent nature.
> - Enhanced Power BI REST API refresh operations don't automatically refresh tile caches. Tile caches refresh only when a user accesses a report.

## Base URL

The base URL is in the following format:

```http
https://api.powerbi.com/v1.0/myorg/groups/{groupId}/datasets/{datasetId}/refreshes 
```

You can append resources and operations to the base URL based on parameters. In the following diagram, **Groups**, **Datasets**, and **Refreshes** are *collections*. **Group**, **Dataset**, and **Refresh** are *objects*.

:::image type="content" source="media/asynchronous-refresh/pbi-async-refresh-flow.png" border="false" alt-text="Diagram that shows asynchronous refresh flow.":::

## Requirements

You need the following requirements to use the REST API:

- A semantic model in Power BI Premium, Premium per user, or Power BI Embedded.
- A group ID and dataset ID to use in the request URL.
- **Dataset.ReadWrite.All** permission scope.

The number of refreshes is limited per the general limitations for API-based refreshes for Pro and Premium models.

## Authentication

All calls must authenticate with a valid Microsoft Entra ID OAuth 2 token in the Authorization header. The token must meet the following requirements:

- Be either a user token or an application service principal.
- Have the audience correctly set to `https://api.powerbi.com`.
- Be used by a user or application that has sufficient permissions on the model.

> [!NOTE]
> REST API modifications don't change currently defined permissions for model refreshes.

## POST /refreshes

To do a refresh, use the POST verb on the /refreshes collection to add a new refresh object to the collection. The Location header in the response includes the `requestId`. Because the operation is asynchronous, a client application can disconnect and use the `requestId` to check the status later if necessary.

The following code shows a sample request:

```http
POST https://api.powerbi.com/v1.0/myorg/groups/f089354e-8366-4e18-aea3-4cb4a3a50b48/datasets/cfafbeb1-8037-4d0c-896e-a46fb27ff229/refreshes
```

The request body might resemble the following example:

```json
{
    "type": "Full",
    "commitMode": "transactional",
    "maxParallelism": 2,
    "retryCount": 2,
    "timeout": "02:00:00",
    "objects": [
        {
            "table": "DimCustomer",
            "partition": "DimCustomer"
        },
        {
            "table": "DimDate"
        }
    ]
}

```

> [!NOTE]
> The service accepts only one refresh operation at a time for a model. If there's a current running refresh and another request is submitted, a `400 Bad Request` HTTP status code returns.

### Parameters

To do an enhanced refresh operation, you must specify one or more parameters in the request body. Specified parameters can specify the default or an optional value. When the request specifies parameters, all other parameters apply to the operation with their default values. If the request specifies no parameters, all parameters use their default values, and a standard refresh operation occurs.

|Name  |Type  |Default  |Description  |
|---------|---------|---------|---------|
|`type`    |      Enum    |    `automatic`      |    The type of processing to perform. Types align with the TMSL refresh command types: `full`, `clearValues`, `calculate`, `dataOnly`, `automatic`, and `defragment`. The `add` type isn't supported.      |
|`commitMode`    |   Enum       |    `transactional`     |     Determines whether to commit objects in batches or only when complete. Modes are `transactional` and `partialBatch`. When using `partialBatch` the refresh operation doesn’t occur within one transaction. Each command is committed individually. If there’s a failure, the model might be empty or include only a subset of the data. To safeguard against failure and keep the data that was in the model before the operation started, execute the operation with `commitMode = transactional`.     |
|`maxParallelism`     |   Int       |   `10`     |   Determines the maximum number of threads that can run the processing commands in parallel. This value aligns with the `MaxParallelism` property that can be set in the TMSL `Sequence` command or by using other methods.       |
|`retryCount`     |       Int   |    `0`     |    Number of times the operation retries before failing.      |
|`objects`     |    Array      |    Entire model      |    An array of objects to process. Each object includes `table` when processing an entire table, or `table` and `partition` when processing a partition. If no objects are specified, the entire model refreshes.      |
|`applyRefreshPolicy`    |    Boolean     |    `true`     |   If an incremental refresh policy is defined, determines whether to apply the policy. Modes are `true` or `false`. If the policy isn't applied, the full process leaves partition definitions unchanged, and fully refreshes all partitions in the table. <br><br>If `commitMode` is `transactional`, `applyRefreshPolicy` can be `true` or `false`. If `commitMode` is `partialBatch`, `applyRefreshPolicy` of `true` isn't supported, and `applyRefreshPolicy` must be set to `false`.|
|`effectiveDate`    |    Date     |    Current date     |   If an incremental refresh policy is applied, the `effectiveDate` parameter overrides the current date. If not specified, the current day is determined using time zone configuration under ['Refresh'](/power-bi/connect-data/incremental-refresh-overview#current-date-and-time).      |
|`timeout`    |    String     |    05:00:00 (5 hours)     |   If a `timeout` is specified, each data refresh attempt on the semantic model adheres to that timeout. A single refresh request can include multiple attempts if `retryCount` is specified, which may cause the total refresh duration to exceed the specified timeout. For instance, setting a `timeout` of 1 hour with a `retryCount` of 2 could result in a total refresh duration of up to 3 hours. Users can adjust the `timeout` to shorten the refresh duration for faster failure detection or extend it beyond the default 5 hours for more complex data refreshes. However, the total refresh duration, including retries, can't exceed 24 hours.     |

### Response

```json
202 Accepted
```

The response also includes a `Location` response-header field to point the caller to the refresh operation that was created and accepted. The `Location` is the location of the new resource the request created, which includes the `requestId` that some enhanced refresh operations require. For example, in the following response, `requestId` is the last identifier in the response `87f31ef7-1e3a-4006-9b0b-191693e79e9e`.

```json
x-ms-request-id: 87f31ef7-1e3a-4006-9b0b-191693e79e9e
Location: https://api.powerbi.com/v1.0/myorg/groups/f089354e-8366-4e18-aea3-4cb4a3a50b48/datasets/cfafbeb1-8037-4d0c-896e-a46fb27ff229/refreshes/87f31ef7-1e3a-4006-9b0b-191693e79e9e
```

## GET /refreshes

Use the GET verb on the /refreshes collection to list historical, current, and pending refresh operations.

The response body might look like the following example:

```json
[
    {
        "requestId": "1344a272-7893-4afa-a4b3-3fb87222fdac",
        "refreshType": "ViaEnhancedApi",
        "startTime": "2020-12-07T02:06:57.1838734Z",
        "endTime": "2020-12-07T02:07:00.4929675Z",
        "status": "Completed",
        "extendedStatus": "Completed"
    },
    {
        "requestId": "474fc5a0-3d69-4c5d-adb4-8a846fa5580b",
        "startTime": "2020-12-07T01:05:54.157324Z",
        "refreshType": "ViaEnhancedApi",
        "status": "Unknown"
    }
    {
        "requestId": "85a82498-2209-428c-b273-f87b3a1eb905",
        "refreshType": "ViaEnhancedApi",
        "startTime": "2020-12-07T01:05:54.157324Z",
        "status": "Unknown",
        "extendedStatus": "NotStarted"
    }
]

```

> [!NOTE]
> Power BI might drop requests if there are too many requests in a short period of time. Power BI does a refresh, queues the next request, and drops all others. By design, you can't query status on dropped requests.

### Response properties

|Name  |Type  |Description  |
|---------|---------|---------|
|`requestId`     |    Guid     |    The identifier of the refresh request. You need `requestId` to query for individual refresh operation status or cancel an in-progress refresh operation. |
|`refreshType`   |   String      |    `OnDemand` indicates the refresh was triggered interactively through the Power BI portal.<br>`Scheduled` indicates that a model refresh schedule triggered the refresh. <br>`ViaApi` indicates that an API call triggered the refresh. <br>`ViaEnhancedApi` indicates that an API call triggered an enhanced refresh.|
|`startTime`     |    String     |    Date and time of refresh start.     |
|`endTime`     |   String      |    Date and time of refresh end.     |
|`status`     |  String       |   `Completed`  indicates the refresh operation completed successfully. <br>`Failed` indicates the refresh operation failed. <br>`Unknown` indicates that the completion state can't be determined. With this status, `endTime` is empty.   <br>`Disabled` indicates that the refresh was disabled by selective refresh. <br>`Cancelled` indicates the refresh was canceled successfully.|
|`extendedStatus`     |    String     |   Augments the `status` property to provide more information.     |

> [!NOTE]
> In Azure Analysis Services, the completed `status` result is `succeeded`. If you migrate an Azure Analysis Services solution to Power BI, you might have to modify your solutions.

### Limit the number of refresh operations returned

The Power BI REST API supports limiting the requested number of entries in the refresh history by using the optional `$top` parameter. If not specified, the default is all available entries.

```http
GET https://api.powerbi.com/v1.0/myorg/groups/{groupId}/datasets/{datasetId}/refreshes?$top={$top}      
```

## GET /refreshes/\<requestId>

To check the status of a refresh operation, use the GET verb on the refresh object by specifying the `requestId`. If the operation is in progress, `status` returns `InProgress`, as in the following example response body:

```json
{
    "startTime": "2020-12-07T02:06:57.1838734Z",
    "endTime": "2020-12-07T02:07:00.4929675Z",
    "type": "Full",
    "status": "InProgress",
    "currentRefreshType": "Full",
    "objects": [
        {
            "table": "DimCustomer",
            "partition": "DimCustomer",
            "status": "InProgress"
        },
        {
            "table": "DimDate",
            "partition": "DimDate",
            "status": "InProgress"
        }
    ]
}

```

## DELETE /refreshes/\<requestId>

To cancel an in-progress enhanced refresh operation, use the DELETE verb on the refresh object by specifying the `requestId`.

For example,

```http
DELETE https://api.powerbi.com/v1.0/myorg/groups/f089354e-8366-4e18-aea3-4cb4a3a50b48/datasets/cfafbeb1-8037-4d0c-896e-a46fb27ff229/refreshes/1344a272-7893-4afa-a4b3-3fb87222fdac
```

## Considerations and limitations

The refresh operation has the following considerations and limitations:

#### Standard refresh operations

- You can't cancel scheduled or on-demand model refreshes that were triggered by selecting the refresh button in the portal, using `DELETE /refreshes/<requestId>`.
- Scheduled and on-demand model refreshes that were triggered by selecting the refresh button in the portal, don't support getting refresh operation details using `GET /refreshes/<requestId>`.
- Get details and Cancel are new operations for enhanced refresh only. Standard refresh doesn't support these operations.

#### Power BI Embedded

If capacity is paused manually in the Power BI portal or by using PowerShell, or a system outage occurs, the status of any ongoing enhanced refresh operation remains `InProgress` for a maximum of six hours. If the capacity resumes within six hours, the refresh operation resumes automatically. If the capacity resumes after longer than six hours, the refresh operation might return a timeout error. You must then restart the refresh operation.

#### Semantic model eviction

Power BI uses dynamic memory management to optimize capacity memory. If the model is evicted from memory during a refresh operation, the following error might return:

```json
{
    "messages": [
        {
            "code": "0xC11C0020",
            "message": "Session cancelled because it is connected to a database that has been evicted to free up memory for other operations",
            "type": "Error"
        }
    ]
}

```

The solution is to rerun the refresh operation. To learn more about dynamic memory management and model eviction, see [Model eviction](../enterprise/service-premium-large-models.md#semantic-model-eviction).

#### Refresh operation time limits

A refresh operation may include multiple attempts if `retryCount` is specified. Each attempt has a default timeout of 5 hours, which can be adjusted using the `timeout` parameter. The total refresh duration, including retries, must not exceed 24 hours.

If `retryCount` specifies a number, a new refresh operation starts with the timeout limit. The service retries this operation until it either succeeds, reaches the `retryCount` limit, or hits the 24-hour maximum from the first attempt.

You can adjust the `timeout` to shorten the refresh duration for faster failure detection or extend it beyond the default 5 hours for more complex data refreshes.

When planning your semantic model refresh with the Refresh Dataset REST API, consider time limits and the retryCount parameter. A refresh may exceed the timeout if the initial attempt fails and retryCount is set to 1 or more. If you request a refresh with "retryCount": 1, and the first attempt fails after 4 hours, a second attempt begins. If this succeeds in 3 hours, the total time for the refresh is 7 hours.

If refresh operations regularly fail, exceed the timeout time limit, or exceed your desired successful refresh operation time, consider reducing the amount of data being refreshed from the data source. You can split refresh into multiple requests, for example a request for each table. You can also specify partialBatch in the commitMode parameter.

## Code sample

For a C# code sample to get you started, see [RestApiSample](https://github.com/Microsoft/Analysis-Services/tree/master/RestApiSample) on GitHub.

To use the code sample:

1. Clone or download the repo.
1. Open the RestApiSample solution.
1. Find the line `client.BaseAddress = …` and provide your [base URL](#base-url).

The code sample uses service principal authentication.

## Related content

- [Power BI Refresh Dataset REST API](/rest/api/power-bi/datasets/refresh-dataset)  
- [Use the Power BI REST APIs](/rest/api/power-bi/)  
