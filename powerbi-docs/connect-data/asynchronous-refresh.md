---
title: Enhanced refresh with the Power BI REST API 
description: Learn how to do enhanced dataset refreshes by using the Power BI Refresh Dataset REST API.
author: minewiskan
ms.author: owend
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 02/10/2023
ms.custom: contperf-fy21q4
LocalizationGroup: 
---

# Enhanced refresh with the Power BI REST API

You can use any programming language that supports REST calls to do dataset refresh operations by using the Power BI Refresh Dataset REST API.

Optimized refresh for large and complex partitioned datasets is traditionally invoked with programming methods that use TOM (Tabular Object Model), PowerShell cmdlets, or TMSL (Tabular Model Scripting Language). However, these methods require long-running HTTP connections that can be unreliable.

The Power BI Refresh Dataset REST API enables dataset refresh operations to be carried out asynchronously. Long-running HTTP connections from client applications aren't necessary. Compared to standard refresh operations, *enhanced refresh* with the REST API provides more customization options and the following features that are helpful for large models:

- Batched commits
- Table and partition-level refresh
- Incremental refresh policies
- `GET` refresh details
- Refresh cancellation

> [!NOTE]
> - Previously, this feature was called *asynchronous refresh with REST API*. However, a standard refresh that uses the Refresh Dataset REST API also runs asynchronously by its inherent nature.
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

- A dataset in Power BI Premium, Premium per user, or Power BI Embedded.
- A group ID and dataset ID to use in the request URL.
- **Dataset.ReadWrite.All** permission scope. The number of refreshes is limited per the general limitations for API-based refreshes for Pro and Premium datasets.

## Authentication

All calls must authenticate with a valid Azure Active Directory (Azure AD) OAuth 2 token in the Authorization header. The token must meet the following requirements:

- Be either a user token or an application service principal.
- Have the audience set to `https://api.powerbi.com`.
- Be used by a user or application that has sufficient permissions on the dataset.

> [!NOTE]
> REST API modifications don't change currently defined permissions for dataset refreshes.

## POST /refreshes

To do a refresh, use the POST verb on the /refreshes collection to add a new refresh object to the collection. The Location header in the response includes the `requestId`. Because the operation is asynchronous, a client application can disconnect and use the `requestId` to check the status later if necessary.

The following code shows a sample request:

```http
POST https://api.powerbi.com/v1.0/myorg/groups/f089354e-8366-4e18-aea3-4cb4a3a50b48/datasets/cfafbeb1-8037-4d0c-896e-a46fb27ff229/refreshes
```

The request body might resemble the following code:

```json
{
    "type": "Full",
    "commitMode": "transactional",
    "maxParallelism": 2,
    "retryCount": 2,
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
> Only one refresh operation at a time is accepted for a dataset. If there's a current running refresh and another request is submitted, a `400 Conflict` HTTP status code returns.

### Parameters

To perform an enhanced refresh operation, you must specify one or more parameters in the request body. Parameters can specify the default or an optional value. When parameters are specified, all other parameters apply to the operation with the default values. If no parameters are specified, other parameters aren't applied and a standard refresh operation is done.

|Name  |Type  |Default  |Description  |
|---------|---------|---------|---------|
|`type`    |      Enum    |    `automatic`      |    The type of processing to perform. Types are aligned with the TMSL refresh command types: `full`, `clearValues`, `calculate`, `dataOnly`, `automatic`, and `defragment`. The `add` type isn't supported.      |
|`commitMode`    |   Enum       |    `transactional`     |     Determines whether to commit objects in batches or only when complete. Modes include `transactional` and `partialBatch`.     |
|`maxParallelism`     |   Int       |   `10`     |   Determines the maximum number of threads to run processing commands in parallel. This value aligns with the `MaxParallelism` property that can be set in the TMSL `Sequence` command or by using other methods.       |
|`retryCount`     |       Int   |    `0`     |    Number of times the operation retries before failing.      |
|`objects`     |    Array      |    Entire dataset      |    An array of objects to process. Each object includes `table` when processing the entire table, or `table` and `partition` when processing a partition. If no objects are specified, the entire dataset refreshes.      |
|`applyRefreshPolicy`    |    Boolean     |    `true`     |   Modes are `true` or `false`. If an incremental refresh policy is defined, determines whether to apply the policy. If the policy isn't applied, a `process full` operation leaves partition definitions unchanged and fully refreshes all partitions in the table. <br><br>If `commitMode` is `transactional`, `applyRefreshPolicy` can be `true` or `false`. If `commitMode` is `partialBatch`, `applyRefreshPolicy` must be `false`, and `applyRefreshPolicy` set to `true` isn't supported. |
|`effectiveDate`    |    Date     |    Current date     |   If an incremental refresh policy is applied, the `effectiveDate` parameter overrides the current date.       |

### Response

```json
202 Accepted
```

The response also includes a Location response-header field to point the caller to the refresh operation that was just created and accepted. The Location is the location of the new resource the request created, which includes the `requestId` that some enhanced refresh operations require. For example, in the following response, `requestId` is the last identifier in the response `87f31ef7-1e3a-4006-9b0b-191693e79e9e`.

```json
x-ms-request-id: 87f31ef7-1e3a-4006-9b0b-191693e79e9e
Location: https://api.powerbi.com/v1.0/myorg/groups/f089354e-8366-4e18-aea3-4cb4a3a50b48/datasets/cfafbeb1-8037-4d0c-896e-a46fb27ff229/refreshes/87f31ef7-1e3a-4006-9b0b-191693e79e9e
```

## GET /refreshes

Use the GET verb on the /refreshes collection to list historical, current, and pending refresh operations.

The following code shows an example of a response body:

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
        "endTime": "2020-12-07T01:05:57.353371Z",
        "status": "Unknown",
        "extendedStatus": "InProgress"
    }
    {
        "requestId": "85a82498-2209-428c-b273-f87b3a1eb905",
        "refreshType": "ViaEnhancedApi",
        "startTime": "2020-12-07T01:05:54.157324Z",
        "endTime": "2020-12-07T01:05:57.353371Z",
        "status": "Unknown",
        "extendedStatus": "NotStarted"
    }
]

```

> [!NOTE]
> Power BI might drop requests if too many requests are sent in a short period of time. Power BI does a refresh, queues the next request, and drops all others. By design, you can't query status on dropped requests.

### Response properties

|Name  |Type  |Description  |
|---------|---------|---------|
|`requestId`     |    Guid     |    The identifier of the refresh request. You need `requestId` to query for individual refresh operation status or cancel an in-progress refresh operation. |
|`refreshType`   |   Enum      |    `OnDemand` indicates the refresh was triggered interactively through the Power BI portal.<br>`Scheduled` indicates the refresh was triggered by the dataset refresh schedule. <br>`ViaApi` indicates the refresh was triggered by an API call. <br>`ViaEnhancedApi` indicates that an enhanced refresh was triggered by an API call.   |
|`startTime`     |    Date     |    Date and time of refresh start.     |
|`endTime`     |   Date      |    Date and time of refresh end.     |
|`status`     |  Enum       |   `Completed`  indicates the refresh operation completed successfully. <br>`Failed` indicates the refresh operation failed. <br>`Unknown` indicates that the completion state can't be determined. With this status, `endTime` is empty.   <br>`Disabled` indicates the refresh was disabled by selective refresh. <br>`Cancelled` indicates the refresh was cancelled successfully.|
|`extendedStatus`     |    String     |   Augments the `status` property to provide more information.     |

> [!NOTE]
> In Azure Analysis Services, the completed `status` result is `succeeded`. If you migrate an Azure Analysis Services solution to Power BI, you might have to modify your solutions.

### Limit the number of refresh operations returned

The Power BI REST API supports limiting the requested number of entries in the refresh history by using the optional `$top` parameter. If not specified, the default is all available entries.

```http
GET https://api.powerbi.com/v1.0/myorg/datasets/{datasetId}/refreshes?$top={$top}      
```

## GET /refreshes/\<requestId>

To check the status of a refresh operation, use the GET verb on the refresh object by specifying the `requestId`. If the operation is in progress, `status` returns`InProgress`. The following code shows an example of a response body:

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

## Limitations

The refresh operation has the following limitations:

### Standard refresh operations

- You can't cancel scheduled or on-demand manual dataset refreshes by using `DELETE /refreshes/<requestId>`.
- Scheduled and on-demand manual dataset refreshes don't support getting refresh operation details by using `GET /refreshes/<requestId>`.
- Get details and Cancel are new operations for enhanced refresh only. Standard refresh doesn't support these operations.

### Power BI Embedded

If capacity is paused manually in the Power BI portal or by using PowerShell, or a system outage occurs, the status of any ongoing enhanced refresh operation remains `InProgress` for a maximum of six hours. If the capacity resumes within six hours, the refresh operation resumes automatically. If the capacity resumes after longer than six hours, the refresh operation might return a timeout error. The refresh operation must then be run again.

### Dataset eviction issue

Power BI uses dynamic memory management to optimize capacity memory. If the dataset is evicted from memory during a refresh operation, the following error might return:

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

The solution is to rerun the refresh operation. To learn more about dynamic memory management and dataset eviction, see [Dataset eviction](../enterprise/service-premium-large-models.md#dataset-eviction).

## Code sample

For a C# code sample to get you started, see [RestApiSample](https://github.com/Microsoft/Analysis-Services/tree/master/RestApiSample) on GitHub.

To use the code sample:

1. Clone or download the repo.
1. Open the RestApiSample solution.
1. Find the line `client.BaseAddress = …` and provide your [base URL](#base-url).

The code sample uses service principal authentication.

## See also

- [Power BI Refresh Dataset REST API](/rest/api/power-bi/datasets/refresh-dataset)  
- [Use the Power BI REST APIs](/rest/api/power-bi/)  
