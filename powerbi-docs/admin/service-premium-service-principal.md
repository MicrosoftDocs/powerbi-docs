---
title: Automate Power BI Premium workspace and dataset tasks with service principals | Microsoft Docs
description: Learn how service principals can be used for automating Power BI Premium workspace and dataset administrative tasks.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 05/12/2020

LocalizationGroup: Premium
---
# Automation with service principals

Service principals are an Azure Active Directory *app registration* you create within your tenant to perform unattended resource and service level operations. They're a unique type of user identity with an app name, application ID, tenant ID, and *client secret* or certificate for a password.  In Power BI, service principals can be used with [New workspaces](../collaborate-share/service-new-workspaces.md) assigned to a Power BI Premium capacity. The capacity Datasets workload must have the [Analysis Services protocol enabled](service-premium-connect-tools.md#enable-xmla-read-write) for read-write.

When enabled for the Datasets workload, service principals are used with PowerShell unattended mode, custom client applications, and web apps to automate common tasks. For example, provisioning workspaces, deploying models, and data refresh can all be automated by using service principals. A service principal has only those permissions necessary to perform tasks for workspaces which it is assigned. Permissions are assigned to service principals through workspace Access, much like regular UPN accounts.

> [!NOTE]
> This feature is in **Preview**. Features in Preview should not be used in a production environment. Certain functionality, support, and documentation is limited.  Refer to the [Microsoft Online Services Terms (OST)](https://www.microsoft.com/licensing/product-licensing/products?rtc=1) for details.

## Create a service principal

Service principals are created as an app registration in the Azure portal or by using PowerShell. When creating your service principal, be sure to copy and save separately the app name, Application (client) ID, Directory (tenant) ID, and client secret. For steps how to create a service principal, see:

[Create service principal - Azure portal](https://docs.microsoft.com/azure/active-directory/develop/howto-create-service-principal-portal)   
[Create service principal - PowerShell](https://docs.microsoft.com/azure/active-directory/develop/howto-authenticate-service-principal-powershell)

## Enable service principals

Before using service principals in Power BI, an admin must first enable service principal access in the Power BI admin portal.

In the Power BI **Admin portal** > **Tenant settings**, expand **Allow service principals to use Power BI APIs**, and then click **Enabled**.

![Workspace settings](media/service-premium-service-principal/admin-portal.png)

## Workspace access

In order for your service principal to have the necessary permissions to perform workspace and dataset operations, you must add the service principal as a workspace Member or Admin. Using Workspace access in the Power BI service is described here, but you can also use the [Add Group User REST API](https://docs.microsoft.com/rest/api/power-bi/groups/addgroupuser).

1. In the Power BI service, for a workspace, select **More** > **Workspace access**.

    ![Workspace settings](media/service-premium-service-principal/workspace-access.png)

2. Search by application name, Add the service principal as an **Admin** or **Member** to the workspace.

    ![Workspace admin](media/service-premium-service-principal/add-service-principal-in-the-UI.png)

## Connection strings

Once you've created a service principal, enabled service principals for your tenant, and added the service principal to Workspace access, you can use it as a user identity in connection strings. The difference is for the User ID and Password parameters you specify the application ID and application secret. For example,

`Data Source=powerbi://api.powerbi.com/v1.0/myorg/<workspace name>; Initial Catalog=<dataset name>;User ID=app:<appId>@<tenantId>;Password=<app_secret>;`

### PowerShell

#### Using SQLServer module

In the following example, AppId, TenantId, and AppSecret are used to authenticate a dataset refresh operation:

```powershell
Param (
        [Parameter(Mandatory=$true)] [String] $AppId,
        [Parameter(Mandatory=$true)] [String] $TenantId,
        [Parameter(Mandatory=$true)] [String] $AppSecret
       )
$PWord = ConvertTo-SecureString -String $AppSecret -AsPlainText -Force

$Credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $AppId, $PWord

Invoke-ProcessTable -Server "powerbi://api.powerbi.com/v1.0/myorg/myworkspace" -TableName "mytable" -Database "mydataset" -RefreshType "Full" -ServicePrincipal -ApplicationId $AppId -TenantId $TenantId -Credential $Credential
```

### AMO and ADOMD

When connecting with client applications and web apps, [AMO and ADOMD client libraries](https://docs.microsoft.com/azure/analysis-services/analysis-services-data-providers) version 15.0.2 and higher installable packages from NuGet support service principals in connection strings using the following syntax: `app:AppID` and password or `cert:thumbprint`.

In the following example, `appID` and a `password` are used to perform a model database refresh operation:

```csharp
string appId = "xxx";
string authKey = "yyy";
string connString = $"Provider=MSOLAP;Data source=powerbi://api.powerbi.com/v1.0/<tenant>/<workspacename>;Initial catalog=<datasetname>;User ID=app:{appId};Password={authKey};";
Server server = new Server();
server.Connect(connString);
Database db = server.Databases.FindByName("adventureworks");
Table tbl = db.Model.Tables.Find("DimDate");
tbl.RequestRefresh(RefreshType.Full);
db.Model.SaveChanges();
```

## Next steps

[Dataset connectivity with the XMLA endpoint](service-premium-connect-tools.md)  
