---
title: PowerShell cmdlets, REST APIs, and .NET SDK for administrators
description: Learn about the ways you can administer Power BI through scripts and programming APIs.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-admin
ms.topic: overview
ms.date: 06/25/2018
ms.author: mblythe

LocalizationGroup: Administration
---

# PowerShell cmdlets, REST APIs, and .NET SDK for Power BI administration
Power BI enables administrators to script common tasks with PowerShell cmdlets. It also exposes REST APIs and provides a .NET SDK for developing administrative solutions. This topic shows a list of cmdlets and the corresponding SDK method and REST API endpoint. For more information, see:

- PowerShell [download](https://www.powershellgallery.com/packages/MicrosoftPowerBIMgmt/) and [documentation](https://docs.microsoft.com/powershell/power-bi/overview?view=powerbi-ps)
- REST API [documentation](https://docs.microsoft.com/rest/api/power-bi/admin)
- .NET SDK [download](https://www.nuget.org/packages/Microsoft.PowerBI.Api/)

> Cmdlets below should be called with `-Scope Organization` to operate against the tenant for administration.

| **Cmdlet name** | **Aliases** | **SDK method** | **REST API endpoint** | **Description** |
| --- | --- | --- | --- | --- |
| **Get-PowerBIDatasource** | N/A | Datasets\_GetDataSourcesAsAdmin | /v1.0/myorg/admin/datasets/{datasetkey}/datasources | Gets the data sources for a given dataset. |
| **Get-PowerBIDataset** | N/A | Datasets\_GetDatasetsAsAdmin | /v1.0/myorg/admin/datasets | Gets the full list of datasets in a Power BI tenant. |
| **Get-PowerBIWorkspace** | **Get-PowerBIGroup** | Groups\_GetGroupsAsAdmin | /v1.0/myorg/admin/groups | Gets the full list of workspaces in a Power BI tenant. |
| **Add-PowerBIWorkspaceUser** | **Add-PowerBIGroupUser** |Groups\_AddUserAsAdmin | /v1.0/myorg/admin/groups/{groupId}/users | Adds a user as a member to a given workspace. |
| **Remove-PowerBIWorkspaceUser** | **Remove-PowerBIGroupUser** | Groups\_DeleteUserAsAdmin | /v1.0/myorg/admin/groups/{groupId}/users/{user} | Removes a user from the membership list of a given workspace. |
| **Restore-PowerBIWorkspace** |**Restore-PowerBIGroup** | Groups\_RestoreDeletedGroupAsAdmin | /v1.0/myorg/admin/groups/{groupId}/restore | Restores a deleted workspace. |
| **Set-PowerBIWorkspace** |**Set-PowerBIGroup** | Groups\_UpdateGroupAsAdmin | /v1.0/myorg/admin/groups/{groupId} | Updates the properties of a given workspace. |
| **Get-PowerBIDataset -WorkspaceId** | N/A | Groups\_GetDatasetsAsAdmin | /v1.0/myorg/admin/groups/{group\_id}/datasets | Gets the datasets within a given workspace. |
| **Get-PowerBIReport** | N/A | Reports\_GetReportsAsAdmin | /v1.0/myorg/admin/reports | Gets the full list of reports in a Power BI tenant. |
| **Get-PowerBIDashboard** | N/A | Dashboards\_GetDashboardsAsAdmin | /v1.0/myorg/admin/dashboards | Gets the full list of dashboards in a Power BI tenant. |
| **Get-PowerBIDashboard -WorkspaceId** | N/A | Groups\_GetDashboardsAsAdmin | /v1.0/myorg/admin/groups/{group\_id}/dashboards | Gets the dashboards within a given workspace. |
| **Get-PowerBITile** | **Get-PowerBIDashboardTile** | Dashboards\_GetTilesAsAdmin | /v1.0/myorg/admin/dashboards/{dashboard\_id}/tiles | Gets the tiles of a given dashboard. |
| **Get-PowerBIReport** | N/A | Groups\_GetReportsAsAdmin | /v1.0/myorg/admin/groups/{group\_id}/reports | Gets the reports within a given workspace. |
| **Get-PowerBIImport** | N/A | Imports\_GetImportsAsAdmin | /v1.0/myorg/admin/imports | Gets the full list of imports in a Power BI tenant. |
| **Connect-PowerBIServiceAccount** | **Login-PowerBI** &  **Login-PowerBIServiceAccount** | N/A | N/A | Login to Power BI and start a session. |
| **Disconnect-PowerBIServiceAccount** | **Logout-PowerBI** & **Logout-PowerBIServiceAccount** | N/A | N/A | Logout of Power BI and close the existing session. |
| **Invoke-PowerBIRestMethod**| N/A | N/A | N/A | Send arbitrary REST API calls to Power BI. |
| **Get-PowerBIAccessToken**| N/A | N/A | N/A | Obtain the Power BI access token in a session. |
| **Resolve-PowerBIError**| N/A | N/A | N/A | Get detailed error information for unsuccessful cmdlet calls. |
