---
title: Track user activities in Power BI
description: Learn how you can use activity logs and auditing with Power BI to monitor and investigate actions taken.
author: mgblythe
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 10/04/2019
ms.author: mblythe
ms.custom: seodec18

LocalizationGroup: Administration
---

# Track user activities in Power BI

Knowing who is taking what action on which item in your Power BI tenant can be critical in helping your organization fulfill its requirements, like meeting regulatory compliance and records management. With Power BI, you have two options to track user activity: The [Power BI activity log](#use-the-activity-log) and the [unified Office 365 audit log](#use-the-audit-log). These logs both contain a complete copy of the [Power BI auditing data](#operations-available-in-the-audit-and-activity-logs), but there are several key differences, as summarized in the following table.

| **Unified Office 365 audit log** | **Power BI activity log** |
| --- | --- |
| Includes events from SharePoint Online, Exchange Online, Dynamics 365, and other services in addition to the Power BI auditing events. | Includes only the Power BI auditing events. |
| Only users with View-Only Audit Logs or Audit Logs permissions have access, such as global admins and auditors. | Global admins and Power BI service admins have access. |
| Global admins and auditors can search the unified audit log by using Office 365 Security & Compliance Center, the Microsoft 365 Security Center, and the Microsoft 365 Compliance Center. | There's no user interface to search the activity log yet. |
| Global admins and auditors can download audit log entries by using Office 365 Management APIs and cmdlets. | Global admins and Power BI service admins can download activity log entries by using a Power BI REST API and management cmdlet. |

## Use the activity log

As a Power BI service admin, you can analyze usage for all Power BI resources at the tenant level by using custom reports based on the Power BI activity log. You can download the activities by using a REST API or PowerShell cmdlet. You can also filter the activity data by date range, user, and activity type.

### Requirements

You must meet these requirements to access the Power BI activity log:

- You must either be a global admin or a Power BI service admin.
- You have installed the [Power BI Management cmdlets](https://www.powershellgallery.com/packages/MicrosoftPowerBIMgmt) locally or use the Power BI Management cmdlets in Azure Cloud Shell.

### ActivityEvents REST API

You can use an administrative application based on the Power BI REST APIs to export activity events into a blob store or SQL database. You can then build a custom usage report on top of the exported data. In the **ActivityEvents** REST API call, you must specify a start date and end date and optionally a filter to select activities by activity type or user ID. Because the activity log could contain a large amount of data, the **ActivityEvents** API currently only supports downloading up to one day of data per request. In other words, the start date and end date must specify the same day, as in the following example. Make sure you specify the DateTime values in UTC format.

```
https://api.powerbi.com/v1.0/myorg/admin/activityevents?startDateTime='2019-08-31T00:00:00'&endDateTime='2019-08-31T23:59:59'
```

If the number of entries is large, the **ActivityEvents** API returns only up to 5,000 entries and a continuation token. You must then call the **ActivityEvents** API again with the continuation token to obtain the next 5,000 entries, and so forth, until you have retrieved all entries and no longer receive a continuation token. The following example shows how to use the continuation token.

```
https://api.powerbi.com/v1.0/myorg/admin/activityevents?continuationToken=' %2BRID%3ARthsAIwfWGcVAAAAAAAAAA%3D%3D%23RT%3A4%23TRC%3A20%23FPC%3AARUAAAAAAAAAFwAAAAAAAAA%3D'
```

### Get-PowerBIActivityEvents cmdlet

It is straightforward to download activity events by using the Power BI Management cmdlets for PowerShell, which include a **Get-PowerBIActivityEvents** cmdlet that automatically handles the continuation token for you. The **Get-PowerBIActivityEvents** cmdlet takes a StartDateTime and an EndDateTime parameter with the same restrictions as the **ActivityEvents** REST API. In other words, the start date and end date must reference the same date value because you can only retrieve the activity data for one day at a time.

The following script demonstrates how to download all Power BI activities. The command converts the results from JSON into .NET objects for straightforward access to individual activity properties.

```powershell
Login-PowerBI

$activities = Get-PowerBIActivityEvents -StartDateTime '2019-08-31T00:00:00' -EndDateTime '2019-08-31T23:59:59' | ConvertFrom-Json

$activities.Count
$activities[0]

```

### Filter activity data

You can filter activity events by activity type and user ID. The following script demonstrates how to download only the event data for the **ViewDashboard** activity. For additional information about supported parameters, use the command `Get-Help Get-PowerBIActivityEvents`.

```powershell
Login-PowerBI

$activities = Get-PowerBIActivityEvents -StartDateTime '2019-08-31T00:00:00' -EndDateTime '2019-08-31T23:59:59' -ActivityType 'ViewDashboard' | ConvertFrom-Json

$activities.Count
$activities[0]

```

## Use the audit log

You work with auditing in the Office 365 Security & Compliance Center or use PowerShell. Auditing relies on functionality in Exchange Online, which is automatically provisioned to support Power BI.

You can filter the audit data by date range, user, dashboard, report, dataset, and activity type. You can also download the activities in a csv (comma-separated value) file to analyze offline.

### Audit log requirements

You must meet these requirements to access audit logs:

- You must either be a global admin or assigned the Audit Logs or View-Only Audit Logs role in Exchange Online to access the audit log. By default, the Compliance Management and Organization Management role groups come with these roles assigned on the **Permissions** page in the Exchange admin center.

    To provide non-admin accounts with access to the audit log, you must add the user as a member of one of these role groups. If you want to do it another way, you can create a custom role group in the Exchange admin center, assign the Audit Logs or View-Only Audit Logs role to this group, and then add the non-admin account to the new role group. For more information, see [Manage role groups in Exchange Online](/Exchange/permissions-exo/role-groups).

    If you can't access the Exchange admin center from the Microsoft 365 admin center, go to https://outlook.office365.com/ecp and sign in using your credentials.

- If you have access to the audit log but aren't a global admin or Power BI Service admin, you won't have access to the Power BI Admin portal. In this case, you must use a direct link to the [Office 365 Security & Compliance Center](https://sip.protection.office.com/#/unifiedauditlog).

### Access your audit logs

To access logs, first make sure to enable logging in Power BI. For more information, see [Audit logs](service-admin-portal.md#audit-logs) in the admin portal documentation. There can be up to a 48 hour delay between the time you enable auditing and when you can view audit data. If you don't see data immediately, check the audit logs later. There can be a similar delay between getting permission to view audit logs and being able to access the logs.

The Power BI audit logs are available directly through the [Office 365 Security & Compliance Center](https://sip.protection.office.com/#/unifiedauditlog). There's also a link from the Power BI admin portal:

1. In Power BI, select the **gear icon** in the upper-right corner, then select **Admin portal**.

   ![Screenshot of the gear drop-down menu with the Admin portal option called out.](media/service-admin-auditing/powerbi-admin.png)

1. Select **Audit logs**.

1. Select **Go to O365 Admin Center**.

   ![Screenshot of the Admin portal with the Audit logs option and the Go to Microsoft O365 Admin Center options called out.](media/service-admin-auditing/audit-log-o365-admin-center.png)

### Search only Power BI activities

Restrict results to only Power BI activities by following these steps. For a list of activities, see the list of [activities audited by Power BI](#operations-available-in-the-audit-and-activity-logs) later in this article.

1. On the **Audit log search** page, under **Search**, select the drop-down for **Activities**.

2. Select **Power BI activities**.

   ![Screenshot of Audit log search with Power BI activities called out.](media/service-admin-auditing/audit-log-search-filter-by-powerbi.png)

3. Select anywhere outside of the selection box to close it.

Your searches will only return Power BI activities.

### Search the audit logs by date

You can search the logs by date range using the **Start date** and **End date** fields. The default selection is the past seven days. The display presents the date and time in Coordinated Universal Time (UTC) format. The maximum date range that you can specify is 90 days. 

You'll receive an error if the selected date range is greater than 90 days. If you're using the maximum date range of 90 days, select the current time for **Start date**. Otherwise, you'll receive an error saying that the start date is earlier than the end date. If you've turned on auditing within the last 90 days, the date range can't start before the date that auditing was turned on.

![Screenshot of Audit log search with Start Date and End Date options called out.](media/service-admin-auditing/search-audit-log-by-date.png)

### Search the audit logs by users

You can search for audit log entries for activities done by specific users. Enter one or more user names in the **Users** field. The user name looks like an email address. It's the account that users log into Power BI with. Leave this box blank to return entries for all users (and service accounts) in your organization.

![Search by users](media/service-admin-auditing/search-audit-log-by-user.png)

### View search results

After you select **Search**, the search results load. After a few moments, they display under **Results**. When the search finishes, the display shows the number of results found. **Audit log search** displays a maximum of 1000 events. If more than 1000 events meet the search criteria, the app displays the newest 1000 events.

#### View the main results

The **Results** area has the following information for each event returned by the search. Select a column header under **Results** to sort the results.

| **Column** | **Definition** |
| --- | --- |
| Date |The date and time (in UTC format) when the event occurred. |
| IP address |The IP address of the device used for the logged activity. The app displays the IP address in either an IPv4 or IPv6 address format. |
| User |The user (or service account) who performed the action that triggered the event. |
| Activity |The activity performed by the user. This value corresponds to the activities that you selected in the **Activities** drop down list. For an event from the Exchange admin audit log, the value in this column is an Exchange cmdlet. |
| Item |The object created or modified because of the corresponding activity. For example, the  viewed or modified file, or the updated user account. Not all activities have a value in this column. |
| Detail |Additional detail about an activity. Again, not all activities have a value. |

#### View the details for an event

To view more details about an event, select the event record in the list of search results. A **Details** page appears that has the detailed properties from the event record. The **Details** page displays properties depending on the Office 365 service in which the event occurs.

To display these details, select **More information**. All Power BI entries have a value of 20 for the RecordType property. For information about other properties, see [Detailed properties in the audit log](/office365/securitycompliance/detailed-properties-in-the-office-365-audit-log/).

   ![Screenshot of the audit details dialog with the More information option called out.](media/service-admin-auditing/audit-details.png)

### Export search results

To export the Power BI audit log to a CSV file, follow these steps.

1. Select **Export results**.

1. Select either **Save loaded results** or **Download all results**.

    ![Screenshot of the Export results option.](media/service-admin-auditing/export-auditing-results.png)

### Use PowerShell to search audit logs

You can also use PowerShell to access the audit logs based on your login. The following example shows how to connect to Exchange Online PowerShell and then use the [Search-UnifiedAuditLog](/powershell/module/exchange/policy-and-compliance-audit/search-unifiedauditlog?view=exchange-ps/) command to pull Power BI audit log entries. To run the script, an admin must assign you the appropriate permissions, as described in the [Requirements](#requirements) section.

```powershell
Set-ExecutionPolicy RemoteSigned

$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session
Search-UnifiedAuditLog -StartDate 9/11/2018 -EndDate 9/15/2018 -RecordType PowerBI -ResultSize 1000 | Format-Table | More
```

### Use PowerShell to export audit logs

You can also use PowerShell to export the results of your audit logs search. The following example shows how to send from the [Search-UnifiedAuditLog](/powershell/module/exchange/policy-and-compliance-audit/search-unifiedauditlog?view=exchange-ps/) command, and export the results using the [Export-Csv](/powershell/module/microsoft.powershell.utility/export-csv) cmdlet. To run the script, an admin must assign you the appropriate permissions, as described in the [Requirements](#requirements) section.

```powershell
$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session
Search-UnifiedAuditLog -StartDate 9/11/2019 -EndDate 9/15/2019 -RecordType PowerBI -ResultSize 5000 |
Export-Csv -Path "c:\temp\PowerBIAuditLog.csv" -NoTypeInformation

Remove-PSSession $Session
```

For more information on connecting to Exchange Online, see [Connect to Exchange Online PowerShell](/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/connect-to-exchange-online-powershell/). For another example of using PowerShell with audit logs, see [Using Power BI audit log and PowerShell to assign Power BI Pro licenses](https://powerbi.microsoft.com/blog/using-power-bi-audit-log-and-powershell-to-assign-power-bi-pro-licenses/).

## Operations available in the audit and activity logs

The following operations are available in both the audit and activity logs.

| Friendly name                                     | Operation name                              | Notes                                  |
|---------------------------------------------------|---------------------------------------------|------------------------------------------|
| Added data source to Power BI gateway             | AddDatasourceToGateway                      |                                          |
| Added Power BI folder access                      | AddFolderAccess                             | Not currently used                       |
| Added Power BI group members                      | AddGroupMembers                             |                                          |
| Admin attached dataflow storage account to tenant | AdminAttachedDataflowStorageAccountToTenant | Not currently used                       |
| Analyzed Power BI dataset                         | AnalyzedByExternalApplication               |                                          |
| Analyzed Power BI report                          | AnalyzeInExcel                              |                                          |
| Binded Power BI dataset to gateway                | BindToGateway                               |                                          |
| Changed capacity state                            | ChangeCapacityState                         |                                          |
| Changed capacity user assignment                  | UpdateCapacityUsersAssignment               |                                          |
| Changed Power BI dataset connections              | SetAllConnections                           |                                          |
| Changed Power BI gateway admins                   | ChangeGatewayAdministrators                 |                                          |
| Changed Power BI gateway data source users        | ChangeGatewayDatasourceUsers                |                                          |
| Created organizational Power BI content pack      | CreateOrgApp                                |                                          |
| Created Power BI app                              | CreateApp                                   |                                          |
| Created Power BI dashboard                        | CreateDashboard                             |                                          |
| Created Power BI dataflow                         | CreateDataflow                              |                                          |
| Created Power BI dataset                          | CreateDataset                               |                                          |
| Created Power BI email subscription               | CreateEmailSubscription                     |                                          |
| Created Power BI folder                           | CreateFolder                                |                                          |
| Created Power BI gateway                          | CreateGateway                               |                                          |
| Created Power BI group                            | CreateGroup                                 |                                          |
| Created Power BI report                           | CreateReport                                |                                          |
| Dataflow migrated to external storage account     | DataflowMigratedToExternalStorageAccount    | Not currently used                       |
| Dataflow permissions added                        | DataflowPermissionsAdded                    | Not currently used                       |
| Dataflow permissions removed                      | DataflowPermissionsRemoved                  | Not currently used                       |
| Deleted organizational Power BI content pack      | DeleteOrgApp                                |                                          |
| Deleted Power BI comment                          | DeleteComment                               |                                          |
| Deleted Power BI dashboard                        | DeleteDashboard                             | Not currently used                       |
| Deleted Power BI dataflow                         | DeleteDataflow                              | Not currently used                       |
| Deleted Power BI dataset                          | DeleteDataset                               |                                          |
| Deleted Power BI email subscription               | DeleteEmailSubscription                     |                                          |
| Deleted Power BI folder                           | DeleteFolder                                |                                          |
| Deleted Power BI folder access                    | DeleteFolderAccess                          | Not currently used                       |
| Deleted Power BI gateway                          | DeleteGateway                               |                                          |
| Deleted Power BI group                            | DeleteGroup                                 |                                          |
| Deleted Power BI report                           | DeleteReport                                |                                          |
| Discovered Power BI dataset data sources          | GetDatasources                              |                                          |
| Downloaded Power BI report                        | DownloadReport                              |                                          |
| Edited Power BI certification permission          | EditCertificationPermission                 | Not currently used                       |
| Edited Power BI dashboard                         | EditDashboard                               | Not currently used                       |
| Edited Power BI dataset                           | EditDataset                                 |                                          |
| Edited Power BI dataset properties                | EditDatasetProperties                       | Not currently used                       |
| Edited Power BI report                            | EditReport                                  |                                          |
| Exported Power BI dataflow                        | ExportDataflow                              |                                          |
| Exported Power BI report visual data              | ExportReport                                |                                          |
| Exported Power BI tile data                       | ExportTile                                  |                                          |
| Failed to add dataflow permissions                | FailedToAddDataflowPermissions              | Not currently used                       |
| Failed to remove dataflow permissions             | FailedToRemoveDataflowPermissions           | Not currently used                       |
| Generated Power BI dataflow SAS token             | GenerateDataflowSasToken                    |                                          |
| Generated Power BI Embed Token                    | GenerateEmbedToken                          |                                          |
| Imported file to Power BI                         | Import                                      |                                          |
| Installed Power BI app                            | InstallApp                                  |                                          |
| Migrated workspace to a capacity                  | MigrateWorkspaceIntoCapacity                |                                          |
| Posted Power BI comment                           | PostComment                                 |                                          |
| Printed Power BI dashboard                        | PrintDashboard                              |                                          |
| Printed Power BI report page                      | PrintReport                                 |                                          |
| Published Power BI report to web                  | PublishToWebReport                          |                                          |
| Received Power BI dataflow secret from Key Vault  | ReceiveDataflowSecretFromKeyVault           | Not currently used                       |
| Removed data source from Power BI gateway         | RemoveDatasourceFromGateway                 |                                          |
| Removed Power BI group members                    | DeleteGroupMembers                          |                                          |
| Removed workspace from a capacity                 | RemoveWorkspacesFromCapacity                |                                          |
| Renamed Power BI dashboard                        | RenameDashboard                             |                                          |
| Requested Power BI dataflow refresh               | RequestDataflowRefresh                      | Not currently used                       |
| Requested Power BI dataset refresh                | RefreshDataset                              |                                          |
| Retrieved Power BI workspaces                     | GetWorkspaces                               |                                          |
| Set scheduled refresh on Power BI dataflow        | SetScheduledRefreshOnDataflow               |                                          |
| Set scheduled refresh on Power BI dataset         | SetScheduledRefresh                         |                                          |
| Shared Power BI dashboard                         | ShareDashboard                              |                                          |
| Shared Power BI report                            | ShareReport                                 |                                          |
| Started Power BI extended trial                   | OptInForExtendedProTrial                    | Not currently used                       |
| Started Power BI trial                            | OptInForProTrial                            |                                          |
| Took over a Power BI datasource                   | TakeOverDatasource                          |                                          |
| Took over Power BI dataset                        | TakeOverDataset                             |                                          |
| Unpublished Power BI app                          | UnpublishApp                                |                                          |
| Update capacity resource governance settings      | UpdateCapacityResourceGovernanceSettings    | Not currently in Microsoft 365 admin center |
| Updated capacity admin                            | UpdateCapacityAdmins                        |                                          |
| Updated capacity display name                     | UpdateCapacityDisplayName                   |                                          |
| Updated organization's Power BI settings          | UpdatedAdminFeatureSwitch                   |                                          |
| Updated Power BI app                              | UpdateApp                                   |                                          |
| Updated Power BI dataflow                         | UpdateDataflow                              |                                          |
| Updated Power BI dataset data sources             | UpdateDatasources                           |                                          |
| Updated Power BI dataset parameters               | UpdateDatasetParameters                     |                                          |
| Updated Power BI email subscription               | UpdateEmailSubscription                     |                                          |
| Updated Power BI folder                           | UpdateFolder                                |                                          |
| Updated Power BI folder access                    | UpdateFolderAccess                          |                                          |
| Updated Power BI gateway data source credentials  | UpdateDatasourceCredentials                 |                                          |
| Viewed Power BI dashboard                         | ViewDashboard                               |                                          |
| Viewed Power BI dataflow                          | ViewDataflow                                |                                          |
| Viewed Power BI report                            | ViewReport                                  |                                          |
| Viewed Power BI tile                              | ViewTile                                    |                                          |
| Viewed Power BI usage metrics                     | ViewUsageMetrics                            |                                          |
|                                                   |                                             |                                          |

## Next steps

[What is Power BI administration?](service-admin-administering-power-bi-in-your-organization.md)  

[Power BI Admin Portal](service-admin-portal.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)
