---
title: Asynchronous refresh with the Power BI REST API 
description: Describes asynchronous refresh by using the Power BI REST API
author: minewiskan
ms.author: owend
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 12/08/2021
ms.custom: contperf-fy21q4
LocalizationGroup: 
---
# Asynchronous refresh with the Power BI REST API (Preview)

The Power BI REST API enables data-refresh operations to be carried out asynchronously. Asynchronous refresh eliminates the need for long-running HTTP connections from client applications.

> [!IMPORTANT]
> This feature is in **Preview**. When in preview, functionality and documentation are likely to change.

## Base URL

The base URL follows this format:

```http
https://api.powerbi.com/v1.0/myorg/groups/{groupId}/datasets/{datasetId}/refreshes 
```

By using the base URL, resources and operations can be appended based on parameters. Groups, Datasets, and Refreshes are *collections*. Group, Dataset, and Refresh are *objects*.

:::image type="content" source="media/asynchronous-refresh/pbi-async-refresh-flow.png" border="false" alt-text="Asynchronous refresh flow":::

## Requirements

- GroupId and DatasetId are required.

- The required permission scope is **Dataset.ReadWrite.All**. The number of refreshes is limited according to the general limitations for API-based refreshes for both Pro and Premium datasets.

## Authentication

All calls must be authenticated with a valid Azure Active Directory (OAuth 2) token in the Authorization header. The token must meet the following requirements:

- The token must be either a user token or an application service principal.
- The token must have the correct audience set to https://api.powerbi.com.
- The user or application must have sufficient permissions on the dataset.

REST API modifications do not change permissions as they are currently defined for dataset refreshes.

## POST

To perform a refresh operation, use the POST verb on the /refreshes collection to add a new *refresh* object to the collection. The **Location** header in the response includes the **refreshId**. Because the operation is asynchronous, a client application can disconnect and check the status later if required.

The body may resemble the following:

```json
{
    "type": "Full",
    "notifyOption": "MailOnFailure"
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

Only one refresh operation is accepted at a time for a dataset. If there's a current running refresh operation and another is submitted, a 409 Conflict HTTP status code is returned.

### Parameters

Specifying parameters is not required. If not specified, the default is applied.

|Name  |Type  |Default  |Description  |
|---------|---------|---------|---------|
|`notifyOption`     |  NotifyOption       |    `none`     |    Mail notification options (`success` and/or `failure`, or `none`)     |
|`type`    |      Enum    |    `automatic`      |    The type of processing to perform. Types are aligned with the TMSL refresh command types: `full`, `clearValues`, `calculate`, `dataOnly`, `automatic`, and `defragment`. <br>`Add` type is not supported.      |
|`commitMode`<sup>[1](#commit)</sup>     |   Enum       |    `transactional`     |     Determines if objects will be committed in batches or only when complete. Modes include: `transactional`, `partialBatch`.     |
|`maxParallelism`     |   Int       |   `10`     |   Determines the maximum number of threads on which to run processing commands in parallel. This value aligned with the `MaxParallelism` property that can be set in the TMSL `Sequence` command or by using other methods.       |
|`retryCount`     |       Int   |    `0`     |    Number of times the operation will retry before failing.      |
|`objects`     |    Array      |    Process the entire dataset      |    An array of objects to be processed. Each object includes `table` when processing the entire table, or `table` and `partition` when processing a partition. If no objects are specified, the entire dataset is refreshed.      |
|`applyRefreshPolicy`    |    Boolean     |    `true`     |   If an incremental refresh policy is defined, `applyRefreshPolicy` will determine if the policy is applied or not. If the policy is not applied, a **process full** operation will leave partition definitions unchanged and all partitions in the table will be fully refreshed. Modes are `true` or `false`.  |
|`effectiveDate`    |    Date     |    Current date     |   If an incremental refresh policy is applied, the `effectiveDate` parameter overrides the current date.       |

<a name="commit">1</a> - `commitMode` is equal to `partialBatch`. It's used when doing an initial load of large datasets that could take hours. If the refresh operation fails after successfully committing one or more batches, the successfully committed batches will remain committed and not rolled back.

### Response

```json
202 Accepted
```

The response also includes a Location response-header field to point the caller to the refresh operation that was just created/accepted. The Location is that of the new resource which was created by the request, which includes the `refreshId`:

```http
https://api.powerbi.com/v1.0/myorg/groups/{groupId}/datasets/{datasetId}/refreshes/{refreshId}
```

## Status

To check the status of a particular refresh operation requires the refreshId. The refreshId can be obtained by listing all the historical, current, and pending refresh operations for a dataset.

> [!NOTE]
> Power BI might drop additional requests if too many requests are sent in a short period of time. Power BI will perform a refresh, queue the next request, and drop all others. You cannot query status on requests that have been dropped. This is by design.

### GET /refreshes

Use the GET verb on the /refreshes collection to list historical, current, and pending refresh operations.

Here's an example of the response body:

```json
[
    {
        "refreshId": "1344a272-7893-4afa-a4b3-3fb87222fdac",
        "refreshType": "ViaApi",
        "startTime": "2020-12-07T02:06:57.1838734Z",
        "endTime": "2020-12-07T02:07:00.4929675Z",
        "status": "succeeded"
    },
    {
        "refreshId": "474fc5a0-3d69-4c5d-adb4-8a846fa5580b",
        "startTime": "2020-12-07T01:05:54.157324Z",
        "refreshType": "ViaApi",
        "endTime": "2020-12-07T01:05:57.353371Z",
        "status": "inProgress"
    }
    {
        "refreshId": "85a82498-2209-428c-b273-f87b3a1eb905",
        "refreshType": "ViaApi",
        "startTime": "2020-12-07T01:05:54.157324Z",
        "endTime": "2020-12-07T01:05:57.353371Z",
        "status": "notStarted"
    }
]

```

#### Response parameters

|Name  |Type  |Description  |
|---------|---------|---------|
|`request`     |    Guid     |    The identifier of the Refresh request. Required to query for individual status or cancel an ongoing refresh.
     |
|`refreshType`   |   RefreshType      |    `OnDemand` indicates refresh was triggered interactively through the Power BI portal. <br>`Scheduled` indicates refresh was triggered by the dataset refresh schedule setting. <br>`ViaApi` indicates refresh was triggered by an API call.   |
|`startTime`     |    string     |    `DateTime` of start.     |
|`endTime`     |   string      |    `DateTime` of end.     |
|`status`     |  string       |   `Failed` indicates the refresh operation failed. serviceExceptionJson will contain the error. <br>`Unknown` indicates a completion state that cannot be determined. `endTime` will be empty with this status. <br>`Completed`\*  indicates refresh completed successfully.  <br>`Disabled` indicates refresh was disabled by Selective Refresh.  |
|`extendedStatus`     |    string     |   Augments the status property to provide additional information. <br>`Status` indicates Unknown. <br>`NotStarted` indicates the operation has not yet started. <br>`InProgress` indicates the refresh operation is in progress.       |
|`serviceExceptionJson`     |   string      |    Failure error code in json format (not empty only on error).     |

\* In Azure Analysis Services, this status result is 'succeeded'. If migrating an Azure Analysis Services solution to Power BI, you may have to modify your solutions.

#### Limiting the number of refresh operations returned

The Power BI REST API supports limiting the requested number of entries in the refresh history by using the optional **$top** parameter. If not specified, the default is all available entries.

```http
GET https://api.powerbi.com/v1.0/myorg/datasets/{datasetId}/refreshes?$top={$top}      
```

### GET /refreshes/<refreshId>

To check the status of a refresh operation, use the GET verb on the refreshId. Here's an example of the response body. If the operation is in progress, `inProgress` is returned in status.

```json
{
    "startTime": "2020-12-07T02:06:57.1838734Z",
    "endTime": "2020-12-07T02:07:00.4929675Z",
    "type": "full",
    "status": "inProgress",
    "currentRefreshType": "full",
    "objects": [
        {
            "table": "DimCustomer",
            "partition": "DimCustomer",
            "status": "inProgress"
        },
        {
            "table": "DimDate",
            "partition": "DimDate",
            "status": "inProgress"
        }
    ]
}

```

### DELETE /refreshes/<refreshId>

To cancel an in-progress refresh operation, use the DELETE verb on the refresh ID.

**Example needed!!!**

## Code sample

Here's a C# code sample to get you started, [RestApiSample on GitHub](https://github.com/Microsoft/Analysis-Services/tree/master/RestApiSample).

### To use the code sample

1. Clone or download the repo. Open the RestApiSample solution.
1. Find the line **client.BaseAddress = …** and provide your [base URL](#base-url).

The code sample uses [service principal](#service-principal) authentication.