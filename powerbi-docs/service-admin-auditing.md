---
title: Using auditing within your organization
description: Learn how you can use auditing with Power BI to monitor and investigate actions taken. You can use the Security and compliance center or use PowerShell.
services: powerbi
documentationcenter: ''
author: guyinacube
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 12/12/2017
ms.author: asaxton

---
# Using auditing within your organization

<iframe width="560" height="315" src="https://www.youtube.com/embed/zj4kA39jV_4?showinfo=0" frameborder="0" allowfullscreen></iframe>

Learn how you can use auditing with Power BI to monitor and investigate actions taken. You can use the Security and Compliance Center or use PowerShell.

Knowing who is taking what action on which item in your Power BI tenant can be critical in helping your organization fulfill its requirements, such as meeting regulatory compliance and records management.

You can filter the audit data by date range, user, dashboard, report, dataset and activity type. You can also download the activities in a csv (comma separated value) file to analyze offline.

> [!NOTE]
> The auditing feature in Power BI is in preview and is available in all data regions.

## Requirements
You must meet these requirements to access audit logs:

- To access the auditing section of the Office 365 Security & Compliance Center, you must have an Exchange Online license (included with Office 365 Enterprise E3 and E5 subscriptions).
- You must either be a global admin or have an Exchange admin role that provides access to the audit log. 

  Exchange admin roles are controlled through the Exchange admin center. For more information, see [Permissions in Exchange Online](https://technet.microsoft.com/library/jj200692(v=exchg.150).aspx).

- If you have access to the audit log but are not a global admin or Power BI Service admin, you will not have access to the Power BI Admin portal. In this case, you must get a direct link to the Office 365 Security & Compliance Center.

## Enabling auditing functionality in the Power BI admin portal

You will need to enable auditing for your organization in order to work with the reports. You can do this within the tenant settings of the admin portal.

1. Select the **gear icon** in the upper right.

2. Select **Admin Portal**.
   
   ![](media/service-admin-auditing/powerbi-admin.png)

3. Select **Tenant settings**.
   
   ![](media/service-admin-auditing/powerbi-admin-tenant-settings.png)

4. Switch on **Create audit logs for internal activity auditing and compliance purposes**.

5. Select **Apply**.

Power BI will start logging various activities that your users perform in Power BI. The logs take up to 48 hours to show up in the O365 Security & Compliance Center. For more information about what activities are logged, see [List of activities audited by Power BI](#list-of-activities-audited-by-power-bi).

> [!NOTE]
> To enable auditing for Power BI in your tenant, you need at least one exchange mailbox license in your tenant.

## Accessing your audit logs

To audit your Power BI logs, you must visit the O365 Security & Compliance Center.

1. Select the **gear icon** in the upper right.

2. Select **Admin Portal**.
   
   ![](media/service-admin-auditing/powerbi-admin.png)

3. Select **Audit logs**.
 
4. Select **Go to O365 Admin Center**.
   
   ![](media/service-admin-auditing/audit-log-o365-admin-center.png)

Alternatively, you can browse to [Office 365 | Security & Compliance](https://protection.office.com/#/unifiedauditlog).

> [!NOTE]
> To provide non-administrator accounts with access to the audit log, you will need to assign permissions within the Exchange Online Admin Center. For example, you could assign a user to an existing role group, such as Organization Management, or you could create a new role group with the Audit Logs role. For more information, see [Permissions in Exchange Online](https://technet.microsoft.com/library/jj200692\(v=exchg.150\).aspx).

## Search only Power BI activities

You can restrict results to only Power BI activities by doing the following.

1. On the **Audit log search** page, select the drop down for **Activities** under **Search**.

2. Select **PowerBI activities**.
   
   ![](media/service-admin-auditing/audit-log-search-filter-by-powerbi.png)

3. Select anywhere outside of the selection box to close it.

Your searches will now be filtered to only Power BI activities.

## Search the audit logs by date

You can search the logs by date range using the “Start date” and “End date” field. The last seven days are selected by default. The date and time are presented in Coordinated Universal Time (UTC) format. The maximum date range that you can specify is 90 days. An error is displayed if the selected date range is greater than 90 days.

> [!NOTE]
> If you're using the maximum date range of 90 days, select the current time for the Start date. Otherwise, you'll receive an error saying that the start date is earlier than the end date. If you've turned on auditing within the last 90 days, the maximum date range can't start before the date that auditing was turned on.

![](media/service-admin-auditing/search-audit-log-by-date.png)

## Search the audit logs by users

You can search for audit log entries for activities performed by specific users. To do this, enter one or more user names in the “Users” field.  This would be the username that they sign into Power BI with. It looks like an email address.
Leave this box blank to return entries for all users (and service accounts) in your organization.

![](media/service-admin-auditing/search-audit-log-by-user.png)

## Viewing search results

Once you hit the search button, the search results are loaded and after a few moments they are displayed under Results. When the search is finished, the number of results found is displayed. 

> [!NOTE]
> A maximum of 1000 events will be displayed; if more than 1000 events meet the search criteria, the newest 1000 events are displayed.

The results contain the following information about each event returned by the search.

| **Column** | **Definition** |
| --- | --- |
| Date |The date and time (in UTC format) when the event occurred. |
| IP address |The IP address of the device that was used when the activity was logged. The IP address is displayed in either an IPv4 or IPv6 address format. |
| User |The user (or service account) who performed the action that triggered the event. |
| Activity |The activity performed by the user. This value corresponds to the activities that you selected in the Activitiesdrop down list. For an event from the Exchange admin audit log, the value in this column is an Exchange cmdlet. |
| Item |The object that was created or modified as a result of the corresponding activity. For example, the file that was viewed or modified or the user account that was updated. Not all activities have a value in this column. |
| Detail |Additional detail about an activity. Again, not all activities will have a value. |

> [!NOTE]
> Select a column header under Results to sort the results. You can sort the results from A to Z or Z to A. Click the Date header to sort the results from oldest to newest or newest to oldest.

## View the details for an event

You can view more details about an event by selecting the event record in the list of search results. A details page is displayed that contains the detailed properties from the event record. The properties that are displayed depend on the Office 365 service in which the event occurs. To display additional details, select **More information**.

The following table provides details on that you may see displayed.

| **Parameter or Event** | **Description** | **Additional Details** |
| --- | --- | --- |
| Downloaded Power BI report |This activity is logged every time a report is downloaded |Report Name, Dataset Name |
| Create report |This activity is logged every time a new report is created. |Report Name, Dataset Name |
| Edit Report |This activity is logged every time a report is edited. |Report Name, Dataset Name |
| Create dataset |This activity is logged every time a dataset is created. |Dataset Name, DataConnectivityMode |
| Delete Dataset |This activity is logged every time a dataset is deleted. |Dataset Name, DataConnectivityMode |
| Create Power BI app |This acitivity is logged every time a Power BI app is created |App name, Permissions, Workspace Name |
| Install Power BI app |This activity is logged every time a Power AI app installed |App name |
| Update Power BI app |This activity is logged every time a Power app in updated |App name, Permissions, Workspace Name |
| Started Power BI extended trial |This activity is logged every time an user accepts the extended pro trial that runs until May 31 2018 | |
| Analyzed Power BI dataset |This activity is logged every time a Power BI dataset is analyzed in Excel. | |
| Created Power BI gateway |This activity is logged every time a new gateway is created. |Gateway Name, Gateway Type |
| Deleted Power BI gateway |This activity is logged every time a gateway is deleted. |Gateway Name, Gateway Type |
| Added Data source to Power BI gateway |This activity is logged every time a data source in added to the gateway |Gateway Name, Gateway Type, Datasource Name, Datasource Type |
| Removed data source from Power BI gateway |This activity is logged every time a data source is removed from a gateway |Gateway Name, Gateway Type, Datasource Name, Datasource Type |
| Changed Power BI gateway admins |This activity is logged every time the admins of a gateway are changed (added/removed) |Gateway Name, Users Added, Users Removed |
| Changed Power IB gateway data source users |This activity is logged every time the users of a gateway are changed (added/removed) |Gateway Name, Users Added, Users Removed |
| SetScheduledRefresh |This activity is logged every time a new refresh is scheduled for a dataset |Dataset Name, Refresh Frequency (in minutes) |

## Using PowerShell to search

You can use PowerShell to access the audit logs based on your login. This is done by accessing Exchange Online. Here is an example of a command to pull Power BI audit log entries.

> [!NOTE]
> In order to use the New-PSSession command, your account needs to have an Exchange Online license assigned to it and you need access to the audit log for your tenant.

```
Set-ExecutionPolicy RemoteSigned

$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session
Search-UnifiedAuditLog -StartDate 9/11/2016 -EndDate 9/15/2016 -RecordType PowerBI -ResultSize 1000 | Format-Table | More
```

For more information on connecting to Exchange Online, see [Connect to Exchange Online PowerShell](https://technet.microsoft.com/library/jj984289\(v=exchg.160\).aspx).

For more information about parameters and usage of the Search-UnifiedAuditLog command, see [Search-UnifiedAuditLog](https://technet.microsoft.com/library/mt238501\(v=exchg.160\).aspx).

To see an example of using PowerShell to search the audit log and then assign Power BI Pro licenses based on entries, see [Using Power BI audit log and PowerShell to assign Power BI Pro licenses](https://powerbi.microsoft.com/blog/using-power-bi-audit-log-and-powershell-to-assign-power-bi-pro-licenses/).

## Export the Power BI audit log

You can export the Power BI audit log to a csv file.

1. Select **Export results**.

2. Select either **Save loaded results** or **Download all results**.
   
   ![](media/service-admin-auditing/export-auditing-results.png)

## Record and user types

Audit log entries will have a RecordType and UserType as part of the details for the entry. All Power BI entries will have a RecordType of 20.

For a full listing, see [Detailed properties in the Office 365 audit log](https://support.office.com/article/Detailed-properties-in-the-Office-365-audit-log-ce004100-9e7f-443e-942b-9b04098fcfc3)

## List of activities audited by Power BI

| Activity | Description | Additional details |
| --- | --- | --- |
| CreateDashboard |This activity is logged every time a new dashboard is created. |- Dashboard name. |
| EditDashboard |This activity is logged every time a dashboard is renamed. |- Dashboard name. |
| DeleteDashboard |This activity is logged every time a dashboard is deleted. |- Dashboard name. |
| PrintDashboard |This event is logged every time that a dashboard is printed. |- Dashboard name.<br/>- Dataset name |
| ShareDashboard |This activity is logged every time a dashboard is shared. |- Dashboard name.<br/>-Recipient Email.<br/>- Dataset name.<br>- Reshare permissions. |
| ViewDashboard |This activity is logged every time a dashboard is viewed. |- Dashboard name. |
| ExportTile |This event is logged every time data is exported from a dashboard tile. |- Tile name.<br/>- Dataset name. |
| DeleteReport |This activity is logged every time a report is deleted. |- Report name. |
| ExportReport |This event is logged every time data is exported from a report tile. |- Report name.<br/>- Dataset name. |
| PrintReport |This event is logged every time that a report is printed. |- Report name.<br/>- Dataset name. |
| PublishToWebReport |This event is logged every time that a report is Published To Web. |- Report Name.<br/>- Dataset name. |
| ViewReport |This activity is logged every time a report is viewed. |- Report name. |
| ExploreDataset |This event is logged every time you explore a dataset by selected it. |- Dataset name |
| DeleteDataset |This event is logged every time a dataset is deleted. |- Dataset name. |
| CreateOrgApp |This activity is logged every time an organizational content pack is created. |- Organizational Content Pack name.<br/>- Dashbaord names.<br/>- Report names.<br/>- Dataset names. |
| CreateGroup |This activity is fired every time a group is created. |- Group name. |
| AddGroupMembers |This activity is logged every time a member is added to a Power BI group workspace. |- Group name.<br/>- Email addresses. |
| UpdatedAdminFeatureSwitch |This event is logged every time an admin feature switch is changed. |- Switch name.<br/>- New switch state. |
| OptInForProTrial |This event is logged when a user choses to try Power BI Pro within the service. |- email address |

## Next steps

[Power BI Admin Portal](service-admin-portal.md)  
[Power BI Premium - what is it?](service-premium.md)  
[Purchasing Power BI Pro](service-admin-purchasing-power-bi-pro.md)  
[Permissions in Exchange Online](https://technet.microsoft.com/library/jj200692\(v=exchg.150\).aspx)  
[Connect to Exchange Online PowerShell](https://technet.microsoft.com/library/jj984289\(v=exchg.160\).aspx)  
[Search-UnifiedAuditLog](https://technet.microsoft.com/library/mt238501\(v=exchg.160\).aspx)  
[Detailed properties in the Office 365 audit log](https://support.office.com/article/Detailed-properties-in-the-Office-365-audit-log-ce004100-9e7f-443e-942b-9b04098fcfc3)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)