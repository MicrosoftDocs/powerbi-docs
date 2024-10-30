---
title: Access the Power BI activity log
description: Guidance and sample PowerShell script code to work with the Power BI activity log.
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: sample
ms.custom: fabric-cat
ms.date: 04/25/2022
---

# Access the Power BI activity log

This article targets Power BI administrators who need to access and analyze data sourced from the [Power BI activity log](/power-bi/enterprise/service-admin-auditing). It focuses on the programmatic retrieval of Power BI activities by using the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) cmdlet from the Power BI Management module. Up to 30 days of history is available. This cmdlet uses the [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) Power BI REST API operation, which is an admin API. PowerShell cmdlets add a layer of abstraction on top of the underlying APIs. Therefore, the PowerShell cmdlet simplifies access to the Power BI activity log.

There are other manual and programmatic ways to retrieve Power BI activities. For more information, see the [Access user activity data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data).

Analyzing the Power BI activity log is crucial for governance, compliance, and to track [adoption](fabric-adoption-roadmap.md) efforts. For more information about the Power BI activity log, see [Track user activities in Power BI](/power-bi/enterprise/service-admin-auditing).

> [!TIP]
> We recommend that you fully review the [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md) article. This article covers planning, key decisions, prerequisites, and key solution development activities to consider when building an end-to-end auditing solution.

## Examples available

The goal of this article is to provide you with examples to help get you started. The examples include scripts that retrieve data from the activity log by using the Power BI Management PowerShell module.

> [!WARNING]
> The scripts aren't production-ready because they're intended only for educational purposes. You can, however, adapt the scripts for production purposes by adding logic for logging, error handling, alerting, and refactoring for code reuse and modularization.

Because they're intended for learning, the examples are simplistic, yet they're real-world. We recommend that you review all examples to understand how they apply slightly different techniques. Once you identify the type of activity data that you need, you can mix and match the techniques to produce a script that best suits your requirements.

This article includes the following examples.

| **Example name** | **Type of activity data** |
| --- | --- |
| [Authenticate with the Power BI service](#example-1-authenticate-with-the-power-bi-service) | N/A |
| [View all activities for a user for one day](#example-2-view-all-activities-for-a-user-for-one-day) | All |
| [View an activity for N days](#example-3-view-an-activity-for-n-days) | Share report (link or direct access) |
| [View three activities for N days](#example-4-view-three-activities-for-n-days) | Create app, update app, and install app |
| [View all activities for a workspace for one day](#example-5-view-all-activities-for-a-workspace-for-one-day) | All |
| [Export all activities for the previous N days](#example-6-export-all-activities-for-previous-n-days) | All |

For simplicity, most of the examples output their result to the screen. For instance, in Visual Studio Code, the data is output to the [terminal panel](https://code.visualstudio.com/docs/terminal/basics), which holds a buffer set of data in memory.

Most of the examples retrieve raw JSON data. Working with the raw JSON data has many advantages.

- All of the information that's available for each activity event is returned. That's helpful for you to learn what data is available. Keep in mind that the contents of an API response differs depending on the actual activity event. For example, the data available for a _CreateApp_ event is different to the _ViewReport_ event.
- Because data that's available in the activity log changes as Power BI evolves over time, you can expect the API responses to change too. That way, new data that's introduced won't be missed. Your process is also more resilient to change and less likely to fail.
- The details of an API response can differ for the Power BI commercial cloud and the [national/regional clouds](/azure/active-directory/develop/authentication-national-cloud#Overview).
- If you have different team members (such as data engineers) who get involved with this process, simplifying the initial process to extract the data makes it easier for multiple teams to work together.

> [!TIP]
> We recommend that you keep your scripts that extract data as simple as possible. Therefore, avoid parsing, filtering, or formatting the activity log data as it's extracted. This approach uses an _ELT_ methodology, which has separate steps to Extract, Load, and Transform data. This article only focuses on the first step, which is concerned with extracting the data.

## Requirements

To use the example scripts, you must meet the following requirements.

- **PowerShell client tool:** Use your preferred tool for running PowerShell commands. All examples were tested by using the [PowerShell extension](https://code.visualstudio.com/docs/languages/powershell) for Visual Studio Code with PowerShell 7. For information about client tools and PowerShell versions, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).
- **Power BI Management module:** Install all [Power BI PowerShell modules](/powershell/power-bi/overview). If you previously installed them, we recommend that you update the modules to ensure that you're using the latest published version.
- **Fabric administrator role:** The example scripts are designed to use an interactive authentication flow. Therefore, the user running the PowerShell example scripts must sign in to use the Power BI REST APIs. To retrieve activity log data, the authenticating user must belong to the [Power BI administrator](/power-bi/admin/service-admin-role) role (because retrieving activity events is done with an [admin API](/rest/api/power-bi/admin)). Service principal authentication is out of scope for these learning examples.

The remainder of this article includes sample scripts that show you different ways to retrieve activity log data.

## Example 1: Authenticate with the Power BI service

All Power BI REST API operations require you to sign in. _Authentication_ (who is making the request) and _authorization_ (what the user has permission to do) are managed by the Microsoft identity platform. The following example uses the [Connect-PowerBIServiceAccount](/powershell/module/microsoftpowerbimgmt.profile/connect-powerbiserviceaccount) cmdlet from the [Power BI Management module](/powershell/power-bi/overview). This cmdlet supports a simple method to sign in.

### Sample request 1

The first script redirects you to a browser to complete the sign in process. User accounts that have multi-factor authentication (MFA) enabled are able to use this interactive authentication flow to sign in.

```powershell
Connect-PowerBIServiceAccount
```

> [!IMPORTANT]
> Users without Power BI administrator privileges can't run any of the sample scripts that follow in this article. [Power BI administrators](/power-bi/admin/service-admin-role) have permission to manage the Power BI service and to retrieve tenant-wide metadata (such as activity log data). Although using service principal authentication is out of scope for these examples, we strongly recommend that you set up a [service principal](/fabric/admin/metadata-scanning-enable-read-only-apis) for production-ready, unattended scripts that will run on a schedule.
>
> Be sure to sign in before running any of the following scripts.

## Example 2: View all activities for a user for one day

Sometimes you need to check all the activities that a specific user performed on a specific day.

> [!TIP]
> When extracting data from the activity log by using the PowerShell cmdlet, each request can extract data for one day (a maximum of 24 hours). Therefore, the goal of this example is to start simply by checking one user for one day. There are other examples later in this article that show you how to use a loop to export data for multiple days.

### Sample request 2

This script declares two PowerShell variables to make it easier to reuse the script:

- `$UserEmailAddr`: The email address for the user you're interested in.
- `$ActivityDate`: The date you're interested in. The format is YYYY-MM-DD (ISO 8601 format). You can't request a date earlier than 30 days before the current date.

```powershell
#Input values before running the script:
$UserEmailAddr = 'jordan@contoso.com'
$ActivityDate = '2023-03-15'
#----------------------------------------------------------------------
#View activity events:
Get-PowerBIActivityEvent `
    -StartDateTime ($ActivityDate + 'T00:00:00.000') `
    -EndDateTime ($ActivityDate + 'T23:59:59.999') `
    -User $UserEmailAddr
```

> [!NOTE]
> You might notice a backtick (\`) character at the end of some of the lines in the PowerShell scripts. In PowerShell, one way you can use the backtick character is as a line continuation character. We've used it to improve the readability of the scripts in this article.

> [!TIP]
> In the script, each of the [PowerShell variables](/powershell/module/microsoft.powershell.core/about/about_variables) correlate to a required or optional [parameter](/powershell/module/microsoft.powershell.core/about/about_parameters) value in the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) cmdlet. For example, the value you assign to the `$UserEmailAddr` variable is passed to the `-User` parameter. Declaring PowerShell variables in this way is a lightweight approach to avoid hard-coding values that could change in your script. That's a good habit to adopt, and it will be useful as your scripts become more complex. [PowerShell parameters](/powershell/module/microsoft.powershell.core/about/about_parameters?view=powershell-7.3&preserve-view=true) are more robust than variables, but they're out of scope for this article.

### Sample response 2

Here's a sample JSON response. It includes two activities that the user performed:

- The first activity shows that a user viewed a report.
- The second activity shows that an administrator exported data from the Power BI activity log.

```json
[
  {
    "Id": "10af656b-b5a2-444c-bf67-509699896daf",
    "RecordType": 20,
    "CreationTime": "2023-03-15T15:18:30Z",
    "Operation": "ViewReport",
    "OrganizationId": "927c6607-8060-4f4a-a5f8-34964ac78d70",
    "UserType": 0,
    "UserKey": "100FFF92C7717B",
    "Workload": "PowerBI",
    "UserId": "jordan@contoso.com",
    "ClientIP": "192.168.1.1",
    "Activity": "ViewReport",
    "ItemName": "Gross Margin Analysis",
    "WorkSpaceName": "Sales Analytics",
    "DatasetName": "Sales Data",
    "ReportName": "Gross Margin Analysis",
    "WorkspaceId": "e380d1d0-1fa6-460b-9a90-1a5c6b02414c",
    "ObjectId": "Gross Margin Analysis",
    "DatasetId": "cfafbeb1-8037-4d0c-896e-a46fb27ff229",
    "ReportId": "94e57e92-Cee2-486d-8cc8-218c97200579",
    "ArtifactId": "94e57e92-Cee2-486d-8cc8-218c97200579",
    "ArtifactName": "Gross Margin Analysis",
    "IsSuccess": true,
    "ReportType": "PowerBIReport",
    "RequestId": "53451b83-932b-f0b0-5328-197133f46fa4",
    "ActivityId": "beb41a5d-45d4-99ee-0e1c-b99c451e9953",
    "DistributionMethod": "Workspace",
    "ConsumptionMethod": "Power BI Web",
    "SensitivityLabelId": "e3dd4e72-5a5d-4a95-b8b0-a0b52b827793",
    "ArtifactKind": "Report"
  },
  {
    "Id": "5c913f29-502b-4a1a-a089-232edaf176f7",
    "RecordType": 20,
    "CreationTime": "2023-03-15T17:22:00Z",
    "Operation": "ExportActivityEvents",
    "OrganizationId": "927c6607-8060-4f4a-a5f8-34964ac78d70",
    "UserType": 2,
    "UserKey": "100FFF92C7717B",
    "Workload": "PowerBI",
    "UserId": "jordan@contoso.com",
    "ClientIP": "192.168.1.1",
    "UserAgent": "MicrosoftPowerBIMgmt/1.2.1111.0",
    "Activity": "ExportActivityEvents",
    "IsSuccess": true,
    "RequestId": "2af6a22d-6f24-4dc4-a26a-5c234ab3afad",
    "ActivityId": "00000000-0000-0000-0000-000000000000",
    "ExportEventStartDateTimeParameter": "2023-03-17T00:00:00Z",
    "ExportEventEndDateTimeParameter": "2023-03-17T23:59:59.999Z"
  }
]
```

> [!TIP]
> Extracting the Power BI activity log data is also a logged operation, as shown in the previous response. When you analyze user activities, you might want to omit administrator activities—or analyze them separately.

## Example 3: View an activity for N days

Sometimes you might want to investigate one specific type of activity for a series of days. This example shows how to retrieve [per-item report sharing](/power-bi/collaborate-share/service-share-dashboards) activities. It uses a loop to retrieve activities from the previous seven days.

### Sample request 3

The script declares two variables:

- `$ActivityType`: The [operation name](/power-bi/enterprise/service-admin-auditing#operations-available-in-the-audit-and-activity-logs) for the activity that you're investigating.
- `$NbrOfDaysToCheck`: How many days you're interested in checking. It performs a loop working backward from the current day. The maximum value allowed is 30 days (because the earliest date that you can retrieve is 30 days before the current day).

```powershell
#Input values before running the script:
$ActivityType = 'ShareReport' 
$NbrOfDaysToCheck = 7 
#-----------------------------------------------------------------------

#Use today to start counting back the number of days to check:
$DayUTC = (([datetime]::Today.ToUniversalTime()).Date)

#Iteratively loop through each of the last N days to view events:
For($LoopNbr=0; $LoopNbr -le $NbrOfDaysToCheck; $LoopNbr++)
{
    $PeriodStart=$DayUTC.AddDays(-$LoopNbr)
    $ActivityDate=$PeriodStart.ToString("yyyy-MM-dd")
    Write-Verbose "Checking $ActivityDate" -Verbose 

    #Check activity events once per loop (once per day):
    Get-PowerBIActivityEvent `
        -StartDateTime ($ActivityDate + 'T00:00:00.000') `
        -EndDateTime ($ActivityDate + 'T23:59:59.999') `
        -ActivityType $ActivityType 
}
```

> [!TIP]
> You can use this looping technique to check any of the [operations](/power-bi/enterprise/service-admin-auditing#operations-available-in-the-audit-and-activity-logs) recorded in the activity log.

### Sample response 3

Here's a sample JSON response. It includes two activities that the user performed:

- The first activity shows that a sharing link for a user was created. Note that the _SharingAction_ value differs depending on whether the user created a link, edited a link, or deleted a link. For brevity, only one type of sharing link activity is shown in the response.
- The second activity shows that direct access sharing for a group was created. Note that the _SharingInformation_ value differs depending on the action taken. For brevity, only one type of direct access sharing activity is shown in the response.

```json
[
  {
    "Id": "be7506e1-2bde-4a4a-a210-bc9b156142c0",
    "RecordType": 20,
    "CreationTime": "2023-03-15T19:52:42Z",
    "Operation": "ShareReport",
    "OrganizationId": "927c6607-8060-4f4a-a5f8-34964ac78d70",
    "UserType": 0,
    "UserKey": "900GGG12D2242A",
    "Workload": "PowerBI",
    "UserId": "morgan@contoso.com",
    "ClientIP": "192.168.1.1",
    "UserAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0",
    "Activity": "ShareReport",
    "ItemName": "Call Center Stats",
    "WorkSpaceName": "Sales Analytics",
    "SharingInformation": [
      {
        "RecipientEmail": "ellis@contoso.com",
        "RecipientName": "Turner",
        "ObjectId": "fc9bbc6c-e39b-44cb-9c8a-d37d5665ec57",
        "ResharePermission": "ReadReshare",
        "UserPrincipalName": "ellis@contoso.com"
      }
    ],
    "WorkspaceId": "e380d1d0-1fa6-460b-9a90-1a5c6b02414c",
    "ObjectId": "Call Center Stats",
    "Datasets": [
      {
        "DatasetId": "fgagrwa3-9044-3e1e-228f-k24bf72gg995",
        "DatasetName": "Call Center Data"
      }
    ],
    "ArtifactId": "81g22w11-vyy3-281h-1mn3-822a99921541",
    "ArtifactName": "Call Center Stats",
    "IsSuccess": true,
    "RequestId": "7d55cdd3-ca3d-a911-5e2e-465ac84f7aa7",
    "ActivityId": "4b8b53f1-b1f1-4e08-acdf-65f7d3c1f240",
    "SharingAction": "CreateShareLink",
    "ShareLinkId": "J_5UZg-36m",
    "ArtifactKind": "Report",
    "SharingScope": "Specific People"
  },
  {
    "Id": "b4d567ac-7ec7-40e4-a048-25c98d9bc304",
    "RecordType": 20,
    "CreationTime": "2023-03-15T11:57:26Z",
    "Operation": "ShareReport",
    "OrganizationId": "927c6607-8060-4f4a-a5f8-34964ac78d70",
    "UserType": 0,
    "UserKey": "900GGG12D2242A",
    "Workload": "PowerBI",
    "UserId": "morgan@contoso.com",
    "ClientIP": "69.132.26.0",
    "UserAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0",
    "Activity": "ShareReport",
    "ItemName": "Gross Margin Analysis",
    "WorkSpaceName": "Sales Analytics",
    "SharingInformation": [
      {
        "RecipientName": "SalesAndMarketingGroup-NorthAmerica",
        "ObjectId": "ba21f28b-6226-4296-d341-f059257a06a7",
        "ResharePermission": "Read"
      }
    ],
    "CapacityId": "1DB44EEW-6505-4A45-B215-101HBDAE6A3F",
    "CapacityName": "Shared On Premium - Reserved",
    "WorkspaceId": "e380d1d0-1fa6-460b-9a90-1a5c6b02414c",
    "ObjectId": "Gross Margin Analysis",
    "Datasets": [
      {
        "DatasetId": "cfafbeb1-8037-4d0c-896e-a46fb27ff229",
        "DatasetName": "Sales Data"
      }
    ],
    "ArtifactId": "94e57e92-Cee2-486d-8cc8-218c97200579",
    "ArtifactName": "Gross Margin Analysis",
    "IsSuccess": true,
    "RequestId": "82219e60-6af0-0fa9-8599-c77ed44fff9c",
    "ActivityId": "1d21535a-257e-47b2-b9b2-4f875b19855e",
    "SensitivityLabelId": "16c065f5-ba91-425e-8693-261e40ccdbef",
    "SharingAction": "Direct",
    "ArtifactKind": "Report",
    "SharingScope": "Specific People"
  }
]
```

> [!NOTE]
> This JSON response shows that the data structure is different based on the type of event. Even the same type of event can have different characteristics that produce a slightly different output. As recommended earlier in this article, you should get accustomed to retrieving the raw data.

## Example 4: View three activities for N days

Sometimes you might want to investigate several related activities. This example shows how to retrieve three specific activities for the previous seven days. It focuses on activities related to [Power BI apps](/power-bi/consumer/end-user-apps) including creating an app, updating an app, and installing an app.

### Sample request 4

The script declares the following variables:

- `$NbrOfDaysToCheck`: How many days you're interested in checking. It performs a loop that works backward from the current day. The maximum value allowed is 30 days (because the earliest date that you can retrieve is 30 days before the current day).
- `$Activity1`: The [operation name](/power-bi/enterprise/service-admin-auditing#operations-available-in-the-audit-and-activity-logs) for the first activity that you're investigating. In this example, it's searching for Power BI app creation activities.
- `$Activity2`: The second operation name. In this example, it's searching for Power BI app update activities.
- `$Activity3`: The third operation name. In this example, it's searching for Power BI app installation activities.

You can only retrieve activity events for one activity at a time. So, the script searches for each operation separately. It combines the search results into a variable named `$FullResults`, which it then outputs to the screen.

> [!CAUTION]
> Running many loops many times greatly increases the likelihood of API _throttling_. Throttling can happen when you exceed the number of requests you're allowed to make in a given time period. The [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) operation is limited to 200 requests per hour. When you design your scripts, take care not to retrieve the original data more times than you need. Generally, it's a better practice to extract all of the raw data once per day and then query, transform, filter, or format that data separately.

The script shows results for the current day.

> [!NOTE]
> To retrieve results for the previous day only—avoiding partial day results—see the [Export all activities for previous N days](#example-6-export-all-activities-for-previous-n-days) example.)

```powershell
#Input values before running the script:
$NbrOfDaysToCheck = 7
$Activity1 = 'CreateApp'
$Activity2 = 'UpdateApp'
$Activity3 = 'InstallApp'
#-----------------------------------------------------------------------
#Initialize array which will contain the full resultset:
$FullResults = @() 

#Use today to start counting back the number of days to check:
$DayUTC = (([datetime]::Today.ToUniversalTime()).Date)

#Iteratively loop through each day (<Initilize> ; <Condition> ; <Repeat>)
#Append each type of activity to an array:
For($LoopNbr=0; $LoopNbr -le $NbrOfDaysToCheck; $LoopNbr++)
{
    $PeriodStart=$DayUTC.AddDays(-$LoopNbr)
    $ActivityDate=$PeriodStart.ToString("yyyy-MM-dd")
    Write-Verbose "Checking $ActivityDate" -Verbose 

    #Get activity 1 and append its results into the full resultset:
    $Activity1Results = @()
    $Activity1Results += Get-PowerBIActivityEvent `
        -StartDateTime ($ActivityDate+'T00:00:00.000') `
        -EndDateTime ($ActivityDate+'T23:59:59.999') `
        -ActivityType $Activity1 | ConvertFrom-Json
    If ($null -ne $Activity1Results) {$FullResults += $Activity1Results}
    
    #Get activity 2 and append its results into the full resultset:
    $Activity2Results = @()
    $Activity2Results += Get-PowerBIActivityEvent `
        -StartDateTime ($ActivityDate+'T00:00:00.000') `
        -EndDateTime ($ActivityDate+'T23:59:59.999') `
        -ActivityType $Activity2 | 
    ConvertFrom-Json
    If ($null -ne $Activity2Results) {$FullResults += $Activity2Results}  

    #Get activity 3 and append its results into the full resultset:
    $Activity3Results = @()
    $Activity3Results += Get-PowerBIActivityEvent `
        -StartDateTime ($ActivityDate+'T00:00:00.000') `
        -EndDateTime ($ActivityDate+'T23:59:59.999') `
        -ActivityType $Activity3 | 
    ConvertFrom-Json
    If ($null -ne $Activity3Results) {$FullResults += $Activity3Results}
    
}  
#Convert all of the results back to a well-formed JSON object:
$FullResults = $FullResults | ConvertTo-Json

#Display results on the screen:
$FullResults
```

### Sample response 4

Here's a sample JSON response. It includes three activities that the user performed:

- The first activity shows a Power BI app was created.
- The second activity shows that a Power BI app was updated.
- The third activity shows that a Power BI app was installed by a user.

> [!WARNING]
> The response only includes the user permissions that were modified. For example, it's possible that three audiences could've been created in a _CreateApp_ event. In the _UpdateApp_ event, if only one audience changed, then only one audience would appear in the _OrgAppPermission_ data. For that reason, relying on the _UpdateApp_ event for tracking all app permissions is incomplete because the activity log only shows what's changed.
>
> For a snapshot of all Power BI app permissions, use the [Get App Users as Admin](/rest/api/power-bi/admin/apps-get-app-users-as-admin) API operation instead.

```json
[
  {
    "Id": "65a26480-981a-4905-b3aa-cbb3df11c7c2",
    "RecordType": 20,
    "CreationTime": "2023-03-15T18:42:13Z",
    "Operation": "CreateApp",
    "OrganizationId": "927c6607-8060-4f4a-a5f8-34964ac78d70",
    "UserType": 0,
    "UserKey": "100FFF92C7717B",
    "Workload": "PowerBI",
    "UserId": "jordan@contoso.com",
    "ClientIP": "192.168.1.1",
    "UserAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0",
    "Activity": "CreateApp",
    "ItemName": "Sales Reconciliations App",
    "WorkSpaceName": "Sales Reconciliations",
    "OrgAppPermission": {
      "recipients": "Sales Reconciliations App(Entire Organization)",
      "permissions": "Sales Reconciliations App(Read,CopyOnWrite)"
    },
    "WorkspaceId": "9325a31d-067e-4748-a592-626d832c8001",
    "ObjectId": "Sales Reconciliations App",
    "IsSuccess": true,
    "RequestId": "ab97a4f1-9f5e-4a6f-5d50-92c837635814",
    "ActivityId": "9bb54a9d-b688-4028-958e-4d7d21ca903a",
    "AppId": "42d60f97-0f69-470c-815f-60198956a7e2"
  },
  {
    "Id": "a1dc6d26-b006-4727-bac6-69c765b7978f",
    "RecordType": 20,
    "CreationTime": "2023-03-16T18:39:58Z",
    "Operation": "UpdateApp",
    "OrganizationId": "927c6607-8060-4f4a-a5f8-34964ac78d70",
    "UserType": 0,
    "UserKey": "100GGG12F9921B",
    "Workload": "PowerBI",
    "UserId": "morgan@contoso.com",
    "ClientIP": "192.168.1.1",
    "UserAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0",
    "Activity": "UpdateApp",
    "ItemName": "Sales Analytics",
    "WorkSpaceName": "Sales Analytics",
    "OrgAppPermission": {
      "recipients": "Sales Reps Audience(SalesAndMarketingGroup-NorthAmerica,SalesAndMarketingGroup-Europe)",
      "permissions": "Sales Reps Audience(Read,CopyOnWrite)"
    },
    "WorkspaceId": "c7bffcd8-8156-466a-a88f-0785de2c8b13",
    "ObjectId": "Sales Analytics",
    "IsSuccess": true,
    "RequestId": "e886d122-2c09-4189-e12a-ef998268b864",
    "ActivityId": "9bb54a9d-b688-4028-958e-4d7d21ca903a",
    "AppId": "c03530c0-db34-4b66-97c7-34dd2bd590af"
  },
  {
    "Id": "aa002302-313d-4786-900e-e68a6064df1a",
    "RecordType": 20,
    "CreationTime": "2023-03-17T18:35:22Z",
    "Operation": "InstallApp",
    "OrganizationId": "927c6607-8060-4f4a-a5f8-34964ac78d70",
    "UserType": 0,
    "UserKey": "100HHH12F4412A",
    "Workload": "PowerBI",
    "UserId": "ellis@contoso.com",
    "ClientIP": "192.168.1.1",
    "UserAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0",
    "Activity": "InstallApp",
    "ItemName": "Sales Reconciliations App",
    "ObjectId": "Sales Reconciliations App",
    "IsSuccess": true,
    "RequestId": "7b3cc968-883f-7e13-081d-88b13f6cfbd8",
    "ActivityId": "9bb54a9d-b688-4028-958e-4d7d21ca903a"
  }
]
```

## Example 5: View all activities for a workspace for one day

Sometimes you might want to investigate activities related to a specific workspace. This example retrieves all activities for all users for one day. It then filters the results so that you can focus on analyzing activities from one [workspace](powerbi-implementation-planning-workspaces-overview.md).

### Sample request 5

The script declares two variables:

- `$ActivityDate`: The date you're interested in. The format is YYYY-MM-DD. You can't request a date earlier than 30 days before the current date.
- `$WorkspaceName`: The name of the workspace you're interested in.

The script stores the results in the `$Results` variable. It then converts the JSON data to an object so the results can be parsed. It then filters the results to retrieve five specific columns. The _CreationTime_ data is renamed as _ActivityDateTime_. The results are filtered by the workspace name, then output to the screen.

There isn't a parameter for the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) cmdlet that allows you to specify a workspace when checking the activity log (earlier examples in this article used PowerShell parameters to set a specific user, date, or activity name). In this example, the script retrieves all of the data and then parses the JSON response to filter the results for a specific workspace.

> [!CAUTION]
> If you're in a large organization that has hundreds or thousands of activities per day, filtering the results after they've been retrieved can be very inefficient. Bear in mind that the [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) operation is limited to 200 requests per hour.
>
> To avoid API throttling (when you exceed the number of requests that you're allowed to make in a given time period), don't retrieve the original data more than you need to. You can continue to work with the filtered results without running the script to retrieve the results again. For ongoing needs, it's a better practice to extract all of the data once per day and then query it many times.

```powershell
#Input values before running the script:
$ActivityDate = '2023-03-22'
$WorkspaceName = 'Sales Analytics'
#----------------------------------------------------------------------
#Run cmdlet to check activity events and store intermediate results:
$Events = Get-PowerBIActivityEvent `
    -StartDateTime ($ActivityDate+'T00:00:00.000') `
    -EndDateTime ($ActivityDate+'T23:59:59.999')
    
#Convert from JSON so we can parse the data:
$ConvertedResults = $Events | ConvertFrom-Json

#Obtain specific attributes and save to a PowerShell object:
$FilteredResults = $ConvertedResults `
    | 
    Select-Object `
    @{Name="ActivityDateTime";Expression={$PSItem.CreationTime}}, ` #alias name
    Activity, `
    UserId, `
    ArtifactName, `
    WorkspaceName `
    | 
    #Filter the results:
    Where-Object {($PSItem.WorkspaceName -eq $WorkspaceName)}

#View the filtered results:
$FilteredResults 

#Optional - Save back to JSON format:
#$FilteredResults = $FilteredResults | ConvertTo-Json -Depth 10
#$FilteredResults
```

### Sample response 5

Here are the filtered results, which include a small subset of properties. The format is easier to read for occasional analysis. However, we recommend that you convert it back to JSON format if you plan to store the results.

> [!NOTE]
> After converting the JSON results to a PowerShell object, time values are converted to local time. The original audit data is always recorded in Coordinated Universal Time (UTC) time, so we recommend that you get accustomed to using only UTC time.

```output
ActivityDateTime : 4/25/2023 3:18:30 PM
Activity         : ViewReport
UserId           : jordan@contoso.com
ArtifactName     : Gross Margin Analysis
WorkSpaceName    : Sales Analytics

CreationTime     : 4/25/2023 5:32:10 PM
Activity         : ShareReport
UserId           : ellis@contoso.com
ArtifactName     : Call Center Stats
WorkSpaceName    : Sales Analytics

CreationTime     : 4/25/2023 9:03:05 PM
Activity         : ViewReport
UserId           : morgan@contoso.com
ArtifactName     : Call Center Stats
WorkSpaceName    : Sales Analytics
```

> [!TIP]
> You can use this technique to filter results by any property in the results. For example, you can use a specific event `RequestId` to analyze just one specific event.

## Example 6: Export all activities for previous N days

Sometimes you might want to export all activity data to a file so that you can work with the data outside of PowerShell. This example retrieves all activities for all users for up to 30 days. It exports the data to one JSON file per day.

> [!IMPORTANT]
> Activity log data is available for a maximum of 30 days. It's important that you export and retain the data so you can do historical analysis. If you don't currently export and store the activity log data, we strongly recommend that you prioritize doing so.

### Sample request 6

The script retrieves all activities for a series of days. It declares three variables:

- `$NbrDaysDaysToExtract`: How many days you're interested in exporting. It performs a loop, working backward from the previous day. The maximum value allowed is 30 days (because the earliest date that you can retrieve is 30 days before the current day).
- `$ExportFileLocation`: The folder path where you want to save the files. The folder must exist before running the script. Don't include a backslash (\\) character at the end of the folder path (because it's automatically added at runtime). We recommend that you use a separate folder to store raw data files.
- `$ExportFileName`: The prefix for each file name. Because one file per day is saved, the script adds a suffix to indicate the data contained in the file, and the date and time the data was retrieved. For example, if you ran a script at 9am (UTC) on April 25, 2023 to extract activity data for April 23, 2023, the file name would be: PBIActivityEvents-20230423-202304250900. Although the folder structure where it's stored is helpful, each file name should  be fully self-describing.

We recommend that you extract data that's at least one day before the current day. That way, you avoid retrieving partial day events, and you can be confident that each export file contains the full 24 hours of data.

The script gathers up to 30 days of data, through to the previous day. Timestamps for audited events are always in UTC. We recommend that you build all of your auditing processes based on UTC time rather than your local time.

The script produces one JSON file per day. The suffix of the file name includes the timestamp (in UTC format) of the extracted data. If you extract the same day of data more than once, the suffix in the file name helps you identify the newer file.

```powershell
#Input values before running the script:
$NbrDaysDaysToExtract = 7
$ExportFileLocation = 'C:\Power-BI-Raw-Data\Activity-Log'
$ExportFileName = 'PBIActivityEvents'
#--------------------------------------------

#Start with yesterday for counting back to ensure full day results are obtained:
[datetime]$DayUTC = (([datetime]::Today.ToUniversalTime()).Date).AddDays(-1) 

#Suffix for file name so we know when it was written:
[string]$DateTimeFileWrittenUTCLabel = ([datetime]::Now.ToUniversalTime()).ToString("yyyyMMddHHmm")

#Loop through each of the days to be extracted (<Initilize> ; <Condition> ; <Repeat>)
For($LoopNbr=0 ; $LoopNbr -lt $NbrDaysDaysToExtract ; $LoopNbr++)
{
    [datetime]$DateToExtractUTC=$DayUTC.AddDays(-$LoopNbr).ToString("yyyy-MM-dd")

    [string]$DateToExtractLabel=$DateToExtractUTC.ToString("yyyy-MM-dd")
    
    #Create full file name:
    [string]$FullExportFileName = $ExportFileName `
    + '-' + ($DateToExtractLabel -replace '-', '') `
    + '-' + $DateTimeFileWrittenUTCLabel `
    + '.json' 

    #Obtain activity events and store intermediary results:
    [psobject]$Events=Get-PowerBIActivityEvent `
        -StartDateTime ($DateToExtractLabel+'T00:00:00.000') `
        -EndDateTime ($DateToExtractLabel+'T23:59:59.999')

    #Write one file per day:
    $Events | Out-File "$ExportFileLocation\$FullExportFileName"

    Write-Verbose "File written: $FullExportFileName" -Verbose 
}
Write-Verbose "Extract of Power BI activity events is complete." -Verbose
```

There are several advantages to using the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) PowerShell cmdlet rather than the [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) REST API operation.

- The cmdlet allows you to request one day of activity each time you make a call by using the cmdlet. Whereas when you communicate with the API directly, you can only request one hour per API request.
- The cmdlet handles continuation tokens for you. If you use the API directly, you need to check the continuation token to determine whether there are any more results to come. Some APIs need to use pagination and continuation tokens for performance reasons when they return a large amount of data. They return the first set of records, then with a continuation token you can make a subsequent API call to retrieve the next set of records. You continue calling the API until a continuation token isn't returned. Using the continuation token is a way to consolidate multiple API requests so that you can consolidate a logical set of results. For an example of using a continuation token, see [Activity Events REST API](/rest/api/power-bi/admin/get-activity-events#get-the-next-set-of-audit-activity-events-by-sending-the-continuation-token-to-the-api-example).
- The cmdlet handles Microsoft Entra ID access token expirations for you. After you've authenticated, your access token expires after one hour (by default). In this case, the cmdlet automatically requests a refresh token for you. If you communicate with the API directly, you need to request a refresh token.

For more information, see [Choose APIs or PowerShell cmdlets](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#choose-apis-or-powershell-cmdlets).

> [!NOTE]
> A sample response is omitted because it's an output similar to the responses shown in the previous examples.

## Related content

For more information related to this article, check out the following resources:

- [Track user activities in Power BI](/power-bi/enterprise/service-admin-auditing)
- Power BI implementation planning: [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md)
- Fabric adoption roadmap: [Auditing and monitoring](fabric-adoption-roadmap-system-oversight.md#auditing-and-monitoring)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
