---
title: PowerShell cmdlets, REST APIs, and .NET Client libraries for administrators
description: Learn about the ways you can administer Power BI through scripts and programming APIs.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 09/09/2019
LocalizationGroup: Administration
---

# PowerShell cmdlets, REST APIs, and .NET Client library for Power BI administration
Power BI enables administrators to script common tasks with PowerShell cmdlets. It also exposes REST APIs and provides a .NET client library for developing administrative solutions. This topic shows a list of cmdlets and the corresponding APIs and REST API endpoint. For more information, see:

- PowerShell [download](https://www.powershellgallery.com/packages/MicrosoftPowerBIMgmt/) and [documentation](/powershell/power-bi/overview?view=powerbi-ps&preserve-view=true)
- REST API [documentation](/rest/api/power-bi/admin)
- .NET Client library [download](https://www.nuget.org/packages/Microsoft.PowerBI.Api/)

> Cmdlets below should be called with `-Scope Organization` to operate against the tenant for administration.

| **Cmdlet name** | **Aliases** | **API** | **REST API endpoint** | **Description** |
| --- | --- | --- | --- | --- |
| `Get-PowerBIDatasource` | N/A | `Datasets_GetDataSourcesAsAdmin` | /v1.0/myorg/admin/datasets/{datasetkey}/datasources | Gets the data sources for a given dataset. |
| `Get-PowerBIDataset` | N/A | `Datasets_GetDatasetsAsAdmin` | /v1.0/myorg/admin/datasets | Gets the full list of datasets in a Power BI tenant. |
| `Get-PowerBIWorkspace` | `Get-PowerBIGroup` | `Groups_GetGroupsAsAdmin` | /v1.0/myorg/admin/groups | Gets the full list of workspaces in a Power BI tenant. |
| `Add-PowerBIWorkspaceUser` | `Add-PowerBIGroupUser` | `Groups_AddUserAsAdmin` | /v1.0/myorg/admin/groups/{groupId}/users | Adds a user as a member to a given workspace. |
| `Remove-PowerBIWorkspaceUser` | `Remove-PowerBIGroupUser` | `Groups_DeleteUserAsAdmin` | /v1.0/myorg/admin/groups/{groupId}/users/{user} | Removes a user from the membership list of a given workspace. |
| `Restore-PowerBIWorkspace` |`Restore-PowerBIGroup` | `Groups_RestoreDeletedGroupAsAdmin` | /v1.0/myorg/admin/groups/{groupId}/restore | Restores a deleted workspace. |
| `Set-PowerBIWorkspace` |`Set-PowerBIGroup` | `Groups_UpdateGroupAsAdmin` | /v1.0/myorg/admin/groups/{groupId} | Updates the properties of a given workspace. |
| `Get-PowerBIDataset -WorkspaceId` | N/A | `Groups_GetDatasetsAsAdmin` | /v1.0/myorg/admin/groups/{group\_id}/datasets | Gets the datasets within a given workspace. |
| `Get-PowerBIReport` | N/A | `Reports_GetReportsAsAdmin` | /v1.0/myorg/admin/reports | Gets the full list of reports in a Power BI tenant. |
| `Get-PowerBIDashboard` | N/A | `Dashboards_GetDashboardsAsAdmin` | /v1.0/myorg/admin/dashboards | Gets the full list of dashboards in a Power BI tenant. |
| `Get-PowerBIDashboard -WorkspaceId` | N/A | `Groups_GetDashboardsAsAdmin` | /v1.0/myorg/admin/groups/{group\_id}/dashboards | Gets the dashboards within a given workspace. |
| `Get-PowerBITile` | `Get-PowerBIDashboardTile` | `Dashboards_GetTilesAsAdmin` | /v1.0/myorg/admin/dashboards/{dashboard\_id}/tiles | Gets the tiles of a given dashboard. |
| `Get-PowerBIReport` | N/A | `Groups_GetReportsAsAdmin` | /v1.0/myorg/admin/groups/{group\_id}/reports | Gets the reports within a given workspace. |
| `Get-PowerBIImport` | N/A | `Imports_GetImportsAsAdmin` | /v1.0/myorg/admin/imports | Gets the full list of imports in a Power BI tenant. |
| `Connect-PowerBIServiceAccount` | `Login-PowerBI` &  `Login-PowerBIServiceAccount` | N/A | N/A | Login to Power BI and start a session. |
| `Disconnect-PowerBIServiceAccount` | `Logout-PowerBI` & `Logout-PowerBIServiceAccount` | N/A | N/A | Logout of Power BI and close the existing session. |
| `Invoke-PowerBIRestMethod`| N/A | N/A | N/A | Send arbitrary REST API calls to Power BI. |
| `Get-PowerBIAccessToken`| N/A | N/A | N/A | Obtain the Power BI access token in a session. |
| `Resolve-PowerBIError`| N/A | N/A | N/A | Get detailed error information for unsuccessful cmdlet calls. |