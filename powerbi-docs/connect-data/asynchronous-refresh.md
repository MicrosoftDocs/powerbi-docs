---
title: Enhanced refresh with Power BI REST API 
description: Describes enhanced refresh by using the Power BI REST API
author: minewiskan
ms.author: owend
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 11/06/2022
ms.custom: contperf-fy21q4
LocalizationGroup: 
---

# Enhanced refresh with Power BI REST API

By using any programming language that supports REST calls, you can perform dataset refresh operations by using the Power BI REST API.

Optimizing refresh for large and complex partitioned datasets have traditionally been invoked with programming methods using TOM (Tabular Object Model), PowerShell cmdlets, or TMSL (Tabular Model Scripting Language). However, these methods can require often unreliable, long-running HTTP connections.

The Power BI Refresh Dataset REST API enables dataset-refresh operations to be carried out asynchronously. Long-running HTTP connections from client applications aren't necessary. Compared to standard refresh operations, ***Enhanced refresh*** with the Refresh Dataset REST API provides more customization options and features beneficial for large models:

- Batched commits
- Table and partition-level refresh
- Apply incremental refresh policies
- Get refresh operation details
- Cancel refresh operations

> [!NOTE]
> * During preview, this feature was known as Asynchronous refresh with REST API. However, in Power BI, a standard refresh using the Refresh Dataset REST API by its inherent nature also runs asynchronously.
> * Refresh operations performed by the enhanced refresh Power BI REST API do not automatically refresh tile caches. Tile caches are only refreshed when a user accesses the report.

## Base URL

The base URL follows this format:

```http
https://api.powerbi.com/v1.0/myorg/groups/{groupId}/datasets/{datasetId}/refreshes 
```

By using the base URL, resources and operations can be appended based on parameters. Groups, Datasets, and Refreshes are *collections*. Group, Dataset, and Refresh are *objects*.

:::image type="content" source="media/asynchronous-refresh/pbi-async-refresh-flow.png" border="false" alt-text="Asynchronous refresh flow":::

## Requirements

- Datasets in Power BI Premium, Premium per user, and Power BI Embedded.

- GroupId and DatasetId are required.

- The required permission scope is **Dataset.ReadWrite.All**. The number of refreshes is limited according to the general limitations for API-based refreshes for both Pro and Premium datasets.

## Authentication

All calls must be authenticated with a valid Azure Active Directory (OAuth 2) token in the Authorization header. The token must meet the following requirements:

- The token must be either a user token or an application service principal.
- The token must have the correct audience set to https://api.powerbi.com.
- The user or application must have sufficient permissions on the dataset.

REST API modifications don't change permissions as they're currently defined for dataset refreshes.

## POST /refreshes

To perform a refresh operation, use the POST verb on the /refreshes collection to add a new *refresh* object to the collection. The Location header in the response includes the **requestId**. Because the operation is asynchronous, a client application can disconnect and check the status later if necessary.

Sample request

```http
POST https://api.powerbi.com/v1.0/myorg/groups/f089354e-8366-4e18-aea3-4cb4a3a50b48/datasets/cfafbeb1-8037-4d0c-896e-a46fb27ff229/refreshes
```

The body may resemble the following:

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

Only one refresh operation at a time is accepted for a dataset. If there's a current running refresh operation and another is submitted, a 400 Conflict HTTP status code is returned.

### Parameters

To perform an ***enhanced*** refresh operation, **you must specify one or more parameters** in the Request Body. Additional parameters can specify the default or an optional value. When specified, all other parameters are applied to the operation using the default value. If no additional parameters are specified, other parameters won't be applied and a standard refresh operation is performed.

|Name  |Type  |Default  |Description  |
|---------|---------|---------|---------|
|`type`    |      Enum    |    `automatic`      |    The type of processing to perform. Types are aligned with the TMSL refresh command types: `full`, `clearValues`, `calculate`, `dataOnly`, `automatic`, and `defragment`. <br>`Add` type isn't supported.      |
|`commitMode`    |   Enum       |    `transactional`     |     Determines if objects will be committed in batches or only when complete. Modes include: `transactional`, `partialBatch`.     |
|`maxParallelism`     |   Int       |   `10`     |   Determines the maximum number of threads on which to run processing commands in parallel. This value aligned with the `MaxParallelism` property that can be set in the TMSL `Sequence` command or by using other methods.       |
|`retryCount`     |       Int   |    `0`     |    Number of times the operation will retry before failing.      |
|`objects`     |    Array      |    Process the entire dataset      |    An array of objects to be processed. Each object includes `table` when processing the entire table, or `table` and `partition` when processing a partition. If no objects are specified, the entire dataset is refreshed.      |
|`applyRefreshPolicy`    |    Boolean     |    `true`     |   If an incremental refresh policy is defined, `applyRefreshPolicy` will determine if the policy is applied or not. If the policy isn't applied, a **process full** operation will leave partition definitions unchanged and all partitions in the table will be fully refreshed. Modes are `true` or `false`. <br><br>Supported behavior: <br>If `commitMode` = `transactional`, <br> then `applyRefreshPolicy` = `true` or `false`. <br>If `commitMode` = `partialBatch`, <br>then `applyRefreshPolicy` = `false`. <br><br>Unsupported behavior: <br>If `commitMode` = `partialBatch`, <br>then `applyRefreshPolicy` = `true`. |
|`effectiveDate`    |    Date     |    Current date     |   If an incremental refresh policy is applied, the `effectiveDate` parameter overrides the current date.       |

### Response

```json
202 Accepted
```

The response also includes a location response-header field to point the caller to the refresh operation that was just created/accepted. Location is that of the new resource created by the request, which includes the `requestId` required for some enhanced refresh operations. For example, in the following response, `requestId` is the last identifier in the response, `87f31ef7-1e3a-4006-9b0b-191693e79e9e`.

```json
x-ms-request-id: 87f31ef7-1e3a-4006-9b0b-191693e79e9e
Location: https://api.powerbi.com/v1.0/myorg/groups/f089354e-8366-4e18-aea3-4cb4a3a50b48/datasets/cfafbeb1-8037-4d0c-896e-a46fb27ff229/refreshes/87f31ef7-1e3a-4006-9b0b-191693e79e9e
```

## GET /refreshes

Use the GET verb on the /refreshes collection to list historical, current, and pending refresh operations.

Here's an example of the response body:

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
> Power BI might drop additional requests if too many requests are sent in a short period of time. Power BI will perform a refresh, queue the next request, and drop all others. By design, you can't query status on requests that have been dropped.

### Response properties

|Name  |Type  |Description  |
|---------|---------|---------|
|`requestId`     |    Guid     |    The identifier of the refresh request. `requestId` is required to query for individual refresh operation status or delete (cancel) an in-progress refresh operation. |
|`refreshType`   |   RefreshType      |    `OnDemand` indicates refresh was triggered interactively through the Power BI portal. <br>`Scheduled` indicates refresh was triggered by the dataset refresh schedule setting. <br>`ViaApi` indicates refresh was triggered by an API call. <br>`ViaEnhancedApi` indicates an enhanced refresh triggered by an API call.   |
|`startTime`     |    string     |    DateTime of start.     |
|`endTime`     |   string      |    DateTime of end.     |
|`status`     |  string       |   `Completed`\*  indicates the refresh operation completed successfully. <br>`Failed` indicates the refresh operation failed. <br>`Unknown` indicates a completion state that can't be determined. `endTime` will be empty with this status.   <br>`Disabled` indicates refresh was disabled by selective refresh. <br>`Cancelled` indicates refresh was cancelled successfully. |
|`extendedStatus`     |    string     |   Augments the status property to provide additional information.     |

\* In Azure Analysis Services, this status result is 'succeeded'. If migrating an Azure Analysis Services solution to Power BI, you may have to modify your solutions.

### Limit the number of refresh operations returned

The Power BI REST API supports limiting the requested number of entries in the refresh history by using the optional **$top** parameter. If not specified, the default is all available entries.

```http
GET https://api.powerbi.com/v1.0/myorg/datasets/{datasetId}/refreshes?$top={$top}      
```

## GET /refreshes/\<requestId\>

To check the status of a refresh operation, use the GET verb on the refresh object by specifying the **requestId**. Here's an example of the response body. If the operation is in progress, `inProgress` is returned in status.

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

## DELETE /refreshes/\<requestId\>

To cancel an in-progress refresh operation, use the DELETE verb on the refresh object by specifying the `requestId`.

For example,

```http
DELETE https://api.powerbi.com/v1.0/myorg/groups/f089354e-8366-4e18-aea3-4cb4a3a50b48/datasets/cfafbeb1-8037-4d0c-896e-a46fb27ff229/refreshes/1344a272-7893-4afa-a4b3-3fb87222fdac
``````

## Limitations

#### Non-enhanced refresh operations

Scheduled and on-demand (manual) dataset refreshes can't be canceled by using `DELETE /refreshes/<requestId>`.

Scheduled and on-demand (manual) dataset refreshes don't support getting refresh operation details by using `GET /refreshes/<requestId>`.

Get Details and Cancel are new operations for enhanced refresh only. They aren't supported for non-enhanced refresh operations.

#### Power BI Embedded

If a capacity is paused manually in the Portal or by using PowerShell, or a system outage occurs, if there's an on-going enhanced refresh operation the status of the refresh will stay in `In-Progress` for the maximum of six hours. If the capacity is resumed within six hours, the refresh operation will resume automatically. If the capacity is resumed after more than six hours, the refresh operation may return a time-out error. The refresh operation must then be run again.

#### Refresh operation time limits

The maximum amount of time for a *single refresh operation* is five hours. If the refresh operation does not successfully complete within the five-hour limit and `"retryCount"` is not specified, or `"retryCount": 0,` is specified in the request body, a timeout error is returned. If 1 or more is specified in `"retryCount"`, a new refresh operation with a five-hour limit is started. If subsequent retry operations fail, the service will continue to retry successful completion of a refresh operation up to the greater of the number of retries specified in `"retryCount"`, or the enhanced refresh processing time limit of 24 hours from the beginning of the first refresh operation of the request.

When determining your dataset refresh solution by using enhanced refresh with the Refresh Dataset REST API, it's important to keep these time limits and the retryCount parameter in mind. A successful completion of a refresh operation can exceed five hours if an initial refresh operation fails and 1 or more is specified in `"retryCount"`. For example, if you request a refresh operation with `"retryCount": 1,`, and the initial retry operation fails at four hours from start time, a second refresh operation for that request is attempted. If that second refresh operation succeeds in three hours, the total time for successful execution of the refresh request is seven hours. If refresh operations regularly fail, exceed the five-hour time limit, or exceed your desired successful refresh operation times, consider reducing the amount of data being refreshed from the data source, split refresh into multiple requests, for example, a request for each table, or try specifying partialBatch in the commitMode parameter.

## Troubleshooting

#### Problem - Dataset eviction

Power BI uses dynamic memory management to optimize capacity memory. If during a refresh operation the dataset is evicted from memory, the following error may be returned:

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

#### Solution: Run the refresh operation again

To learn more about Dynamic memory management and dataset eviction, see [Dataset eviction](../enterprise/service-premium-large-models.md#dataset-eviction).

## Code sample

Here's a C# code sample to get you started, [RestApiSample on GitHub](https://github.com/Microsoft/Analysis-Services/tree/master/RestApiSample).

### To use the code sample

1. Clone or download the repo. Open the RestApiSample solution.
1. Find the line **client.BaseAddress = …** and provide your [base URL](#base-url).

The code sample uses service principal authentication.

## See also
[Power BI Refresh Dataset REST API](/rest/api/power-bi/datasets/refresh-dataset)  
[Using the Power BI REST APIs](/rest/api/power-bi/)  
