---
title: Track user activities in Power BI
description: Learn how to use Power BI activity logs to monitor and track user activities in Power BI.
author: kfollis
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 12/25/2023
ms.custom: licensing support,fabric
LocalizationGroup: Administration
---

# Track user activities in Power BI

Knowing who is taking what action on which item in Power BI can be critical in helping your organization fulfill its requirements, like meeting regulatory compliance and records management. This article discusses the Power BI [activity log](#activity-log) which is based on Power BI REST APIs.

You can track Microsoft Fabric user activities, including Power BI operations, using the [audit log](/fabric/admin/track-user-activities).

## Prerequisites

* You have to be a global administrator or a Power BI administrator

* Install the [Power BI Management cmdlets](https://www.powershellgallery.com/packages/MicrosoftPowerBIMgmt) locally, or use the Power BI Management cmdlets in Azure Cloud Shell.

## Activity log

The Power BI activity log contains complete copy of the Power BI activities in a JSON array. You can find a list of all the Power BI activities in the Fabric [operation list](/fabric/admin/operation-list).

### ActivityEvents REST API

You can use an administrative application based on the Power BI REST APIs to export activity events into a blob store or SQL database. You can then build a custom usage report on top of the exported data. In the **ActivityEvents** REST API call, you must specify a start date and end date and optionally a filter to select activities by activity type or user ID. Because the activity log could contain a large amount of data, the **ActivityEvents** API currently only supports downloading up to one day of data per request. In other words, the start date and end date must specify the same day, as in the following example. Make sure you specify the `DateTime` values in Coordinated Universal Time (UTC) format.

```http
https://api.powerbi.com/v1.0/myorg/admin/activityevents?startDateTime='2019-08-31T00:00:00'&endDateTime='2019-08-31T23:59:59'
```

If the number of entries is large, the **ActivityEvents** API returns only around 5,000 to 10,000 entries and a continuation token. Call the **ActivityEvents** API again with the continuation token to get the next batch of entries, and so forth, until you've gotten all entries and no longer receive a continuation token. The following example shows how to use the continuation token:

```http
https://api.powerbi.com/v1.0/myorg/admin/activityevents?continuationToken='%2BRID%3ARthsAIwfWGcVAAAAAAAAAA%3D%3D%23RT%3A4%23TRC%3A20%23FPC%3AARUAAAAAAAAAFwAAAAAAAAA%3D'
```

If the results include a continuation token, continue to call the API using that token to get the rest of the data until a continuation token is no longer returned. It's possible for a call to return a continuation token without any event entries. The following example shows how to loop with a continuation token returned in the response:

```
while(response.ContinuationToken != null)
{
   // Store the activity event results in a list for example
    completeListOfActivityEvents.AddRange(response.ActivityEventEntities);

    // Make another call to the API with continuation token
    response = GetPowerBIActivityEvents(response.ContinuationToken)
}
completeListOfActivityEvents.AddRange(response.ActivityEventEntities);
```
If the time span between `startDateTime` and `endDateTime` exceeds 1 hour, it takes multiple requests to download the data through `continuationUri` in response.

The following example shows how to download data for 1 hour and 5 minutes:

```http
GET https://wabi-staging-us-east-redirect.analysis.windows.net/v1.0/myorg/admin/activityevents?startDateTime='2020-08-13T07:55:00Z'&endDateTime='2020-08-13T09:00:00Z'
{
  "activityEventEntities": […],
  "continuationUri": https://wabi-staging-us-east-redirect.analysis.windows.net/v1.0/myorg/admin/activityevents?continuationToken='LDIwMjAtMDgtMTNUMDc6NTU6MDBaLDIwMjAtMDgtMTNUMDk6MDA6MDBaLDEsLA%3D%3D',
  "continuationToken": "LDIwMjAtMDgtMTNUMDc6NTU6MDBaLDIwMjAtMDgtMTNUMDk6MDA6MDBaLDEsLA%3D%3D",
  "lastResultSet": false
}

GET https://wabi-staging-us-east-redirect.analysis.windows.net/v1.0/myorg/admin/activityevents?continuationToken='LDIwMjAtMDgtMTNUMDc6NTU6MDBaLDIwMjAtMDgtMTNUMDk6MDA6MDBaLDEsLA%3D%3D'
{
  "activityEventEntities": [],
  "continuationUri": null,
  "continuationToken": null,
  "lastResultSet": false
}
```

To learn more about using the Power BI REST API, including examples of how to get audit activity events, see [Admin - Get Activity Events](/rest/api/power-bi/admin/getactivityevents) in the Power BI REST API reference documentation.

### Get-PowerBIActivityEvent cmdlet

Download activity events by using the Power BI Management cmdlets for PowerShell. The [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) cmdlet automatically handles the continuation token for you. The `Get-PowerBIActivityEvent` cmdlet takes a *StartDateTime* and an *EndDateTime* parameter with the same restrictions as the **ActivityEvents** REST API. In other words, the start date and end date must reference the same date value because you can only retrieve the activity data for one day at a time.

The following script demonstrates how to download all Power BI activities. The command converts the results from JSON into .NET objects for straightforward access to individual activity properties. These examples show the smallest and largest timestamps possible for a day to ensure no events are missed:

```powershell
Login-PowerBI

$activities = Get-PowerBIActivityEvent -StartDateTime '2019-08-31T00:00:00' -EndDateTime '2019-08-31T23:59:59' | ConvertFrom-Json

$activities.Count
$activities[0]

```

### Filter activity data

You can filter activity events by activity type and user ID. The following script demonstrates how to download only the event data for the **ViewDashboard** activity. For additional information about supported parameters, use the command `Get-Help Get-PowerBIActivityEvent`.

```powershell
Login-PowerBI

$activities = Get-PowerBIActivityEvent -StartDateTime '2019-08-31T00:00:00' -EndDateTime '2019-08-31T23:59:59' -ActivityType 'ViewDashboard' | ConvertFrom-Json

$activities.Count
$activities[0]

```

> [!NOTE]
> A PowerShell sample is available to help you learn how to filter and retrieve Power BI activity log events. For more information, see [Access the Power BI activity log](../guidance/admin-activity-log.md).

## Related content

* [Track user activities in Microsoft Fabric](/fabric/admin/track-user-activities)

* [Operation list](/fabric/admin/operation-list)
