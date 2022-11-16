---
title: Automate Power BI Premium workspace and dataset tasks with service principals
description: Learn how to use service principals for automating Power BI Premium workspace and dataset management tasks.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 11/16/2022
LocalizationGroup: Premium
---

# Automate Premium workspace and dataset tasks with service principals

Service principals are an Azure Active Directory (Azure AD) *app registration* you create within your tenant to perform unattended resource and service level operations. They're a unique type of user identity with an app name, application ID, tenant ID, and *client secret* or certificate for a password.

Power BI Premium uses the same service principal functionality as Power BI Embedded. To learn more, see [Embedding Power BI content with service principals](../developer/embedded/embed-service-principal.md).

In **Power BI Premium**, you can use service principals with the [XMLA endpoint](service-premium-connect-tools.md) to automate dataset management tasks such as provisioning workspaces, deploying models, and dataset refresh with:

- PowerShell
- Azure Automation
- Azure Logic Apps
- Custom client applications

Only [New workspaces](../collaborate-share/service-new-workspaces.md) support XMLA endpoint connections using service principals. Classic workspaces aren't supported. A service principal has only those permissions necessary to perform tasks on workspaces where it's assigned. Permissions are assigned through workspace access, much like regular UPN accounts.

To perform write operations, the capacity's **Datasets workload** must have the [XMLA endpoint enabled for read-write](service-premium-connect-tools.md#enable-xmla-read-write). Datasets published from Power BI Desktop should have the [Enhanced metadata format](../connect-data/desktop-enhanced-dataset-metadata.md) feature enabled.

## Create a service principal

Service principals are created as an app registration in the Azure portal or by using PowerShell. When creating your service principal, be sure to copy and save separately the app name, Application (client) ID, Directory (tenant) ID, and client secret. For steps on how to create a service principal, see:

[Create service principal - Azure portal](/azure/active-directory/develop/howto-create-service-principal-portal)
[Create service principal - PowerShell](/azure/active-directory/develop/howto-authenticate-service-principal-powershell)

## Create an Azure AD security group

By default, service principals have access to any tenant settings for which they're enabled. Depending on your admin settings, access can include specific security groups or the entire organization.

To restrict service principal access to specific tenant settings, you can allow access to specific security groups. Alternatively, you can create a dedicated security group for service principals, and exclude it from the desired tenant settings. To create a security group and add a service principal, see [Create a basic group and add members using Azure Active Directory](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal).

## Enable service principals

Before you can start using service principals in Power BI, an admin must enable service principal access in the Power BI admin portal.

1. Go to the Power BI **Admin portal**, select **Tenant settings**.
1. Scroll to **Developer settings**, expand **Allow service principals to use Power BI APIs**.
1. Select **Enabled**.
1. To apply permissions to a security group, select **Specific security groups (Recommended)**.
1. Enter the group name.
1. Select **Apply**.

![Screenshot of the admin portal with tenant settings selected. Allow service principals to use Power BI APIs is expanded with enabled highlighted.](media/service-premium-service-principal/admin-portal.png)

## Workspace access

In order for your service principal to have the necessary permissions to perform Premium workspace and dataset operations, add the service principal as a workspace Member or Admin. Using Workspace access in the Power BI service is described here, but you can also use the [Add Group User REST API](/rest/api/power-bi/groups/addgroupuser).

1. In the Power BI service, for a workspace, select **More** > **Workspace access**.

    ![Screenshot showing a list of workspaces. The more icon and workspace access are highlighted.](media/service-premium-service-principal/workspace-access.png)

2. Search by application name, Add the service principal as an **Admin** or **Member** to the workspace.

    ![Screenshot of the access dialog showing a service principal name. Admin is selected.](media/service-premium-service-principal/add-service-principal-in-the-UI.png)

## Connection strings for the XMLA endpoint

After creating a service principal, enabled service principals for your tenant, and added the service principal to Workspace access, you can use it as a user identity in connection strings with the XMLA endpoint. The difference is, instead of the User ID and Password parameters you specify the application ID, tenant ID, and application secret.

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

Invoke-ProcessTable -Server "powerbi://api.powerbi.com/v1.0/myorg/myworkspace" -TableName "mytable" -DatabaseName "mydataset" -RefreshType "Full" -ServicePrincipal -ApplicationId $AppId -TenantId $TenantId -Credential $Credential
```

### AMO and ADOMD

When connecting with client applications and web apps, [AMO and ADOMD client libraries](/azure/analysis-services/analysis-services-data-providers) version 15.1.42.26 (June 2020) and higher installable packages from NuGet support service principals in connection strings using the following syntax: `app:AppID` and password or `cert:thumbprint`.

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
[Azure Automation](/azure/automation)  
[Azure Logic Apps](/azure/logic-apps/)  
[Power BI REST APIs](/rest/api/power-bi/)