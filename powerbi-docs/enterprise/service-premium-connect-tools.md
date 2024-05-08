---
title: Semantic model connectivity and management with the XMLA endpoint in Power BI
description: Describes Power BI Premium and Premium Per User semantic model connectivity from client applications and tools by using the XMLA endpoint.
author: kfollis
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 11/10/2023
ms.custom: ''
LocalizationGroup: Premium
---

# Semantic model connectivity with the XMLA endpoint

Power BI Premium, Premium Per User, and Power BI Embedded workspaces use an *XMLA endpoint* to support open-platform connectivity from Microsoft and third-party client applications and tools.

## XMLA endpoints

Workspaces use the [XML for Analysis](/analysis-services/xmla/xml-for-analysis-xmla-reference?view=power-bi-premium-current&preserve-view=true) (XMLA) protocol for communications between client applications and the engine that manages your Power BI workspaces and semantic models. These communications are through what are commonly called XMLA endpoints. XMLA is the communication protocol used by the Microsoft Analysis Services engine, which runs Power BI's semantic modeling, governance, lifecycle, and data management. Data sent over the XMLA protocol is fully encrypted.

By default, *read-only* connectivity using the endpoint is enabled for the **Semantic models workload** in a capacity. With read-only, data visualization applications and tools can query semantic model model data, metadata, events, and schema.

*Read-write* operations using the endpoint can be enabled. Read-write provides more semantic model management, governance, advanced semantic modeling, debugging, and monitoring. When enabled, semantic models have more parity with Azure Analysis Services and SQL Server Analysis Services enterprise grade tabular modeling tools and processes.

## Analysis Services server properties

Power BI Premium supports many Analysis Services server properties. To review these properties, refer to [Server properties in Analysis Services](/analysis-services/server-properties/server-properties-in-analysis-services).

## Terms of use

Using the XMLA endpoint is subject to:

**Single-user application** - The application uses a single user account or app identity to access a Power BI semantic model through the XMLA endpoint. Examples of single-user applications include developer tools, admin scripts, and automated processes. These applications can perform tasks such as data modeling and administrative tasks that alter the metadata of a semantic model, backup or restore operation, or trigger a data refresh. The user account or app identity that the client application uses to access a semantic model must have a valid Premium Per User (PPU) license unless the semantic model resides on a Premium capacity.

**Multi-user application** - The application provides multiple users with access to a Power BI semantic model. For example, a middle-tier application integrating a semantic model into a business solution and accessing the semantic model on behalf of its business users.

- Premium Per User (PPU) workspaces -  The application must require each user to sign in to Power BI. For each user, the application uses an access token to access the semantic models. The application can't use a service account or other app identity to perform tasks on behalf of individual users. Each user must have their own Power BI account for opening reports, accessing semantic models, and executing queries.
- For Premium workspaces, the application can use either a service account or app identity on behalf of end users without requiring each user to sign in to Power BI.

## Client applications and tools

Common applications and tools used with Azure Analysis Services and SQL Server Analysis Services that are now supported by Power BI Premium semantic models:

**Microsoft Excel** – Excel PivotTables are one of the most common tools used to summarize, analyze, explore, and present summary data from Power BI semantic models. Read-only is required for query operations. Requires the Click-to-Run version of Office 16.0.13612.10000 or higher.

**Visual Studio with Analysis Services projects** – Known as SQL Server Data Tools(SSDT). SSDT is an enterprise grade model authoring tool for Analysis Services tabular models. All Visual Studio 2017 and later editions including the free Community edition support Analysis Services projects extensions. Requires extension version 2.9.14 or higher to deploy tabular models to a Premium workspace. The model must be at the 1500 or higher compatibility level to deploy. Requires XMLA read-write on the semantic models workload. To learn more, see [Tools for Analysis Services](/analysis-services/tools-and-applications-used-in-analysis-services?view=power-bi-premium-current&preserve-view=true).

**SQL Server Management Studio (SSMS)** - Supports DAX, MDX, and XMLA queries. Perform fine-grain refresh operations and scripting of semantic model metadata using the [Tabular Model Scripting Language](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference) (TMSL). Requires read-only for query operations. Requires read-write for scripting metadata. Requires SSMS version **18.9** or higher. [Download SSMS](/sql/ssms/download-sql-server-management-studio-ssms).

**SQL Server Profiler** – SQL Server Profiler installs with SSMS, it allows tracing and debugging of semantic model events. Although officially deprecated for SQL Server, Profiler is still included in SSMS and remains supported for Analysis Services and Power BI. Requires SQL Server Profiler version **18.9** or higher. Users must specify the semantic model ([initial catalog](#initial-catalog)) when connecting with the XMLA endpoint. To learn more, see [SQL Server Profiler for Analysis Services](/analysis-services/instances/use-sql-server-profiler-to-monitor-analysis-services?view=power-bi-premium-current&preserve-view=true).

**Analysis Services Deployment Wizard** – Installed with SSMS, this tool provides deployment of Visual Studio authored tabular model projects to Analysis Services and Premium workspaces. It can be run interactively or from the command line for automation. XMLA read-write is required. To learn more, see [Analysis Services Deployment Wizard](/analysis-services/deployment/deploy-model-solutions-using-the-deployment-wizard?view=power-bi-premium-current&preserve-view=true).

**PowerShell cmdlets** – Use Analysis Services cmdlets to automate semantic model management tasks like refresh operations. Requires XMLA read-write. Requires version **21.1.18256** or higher of the [SqlServer PowerShell module](https://www.powershellgallery.com/packages/SqlServer/). Azure Analysis Services cmdlets in the Az.AnalysisServices module aren't supported for Power BI semantic models. To learn more, see [Analysis Services PowerShell Reference](/analysis-services/powershell/analysis-services-powershell-reference?view=power-bi-premium-current&preserve-view=true).

**Power BI Report Builder** - A tool for authoring paginated reports. Create a report definition that specifies the data to retrieve, where to get it, and how to display it. You can preview your report in Report Builder and then publish your report to the Power BI service. Requires XMLA read-only. To learn more, see [Power BI Report Builder](../paginated-reports/report-builder-power-bi.md).

**Tabular Editor** - An open-source tool for creating, maintaining, and managing tabular models using an intuitive, lightweight editor. A hierarchical view shows all objects in your tabular model. Organizes objects by display folders with support for multi-select property editing and DAX syntax highlighting. Requires XMLA read-only for query operations. Requires read-write for metadata operations. To learn more, see [tabulareditor.github.io](https://github.com/TabularEditor/tabulareditor.github.io).

**DAX Studio** – An open-source tool for DAX authoring, diagnosis, performance tuning, and analysis. Features include object browsing, integrated tracing, query execution breakdowns with detailed statistics, DAX syntax highlighting and formatting. Requires XMLA read-only for query operations. To learn more, see [daxstudio.org](https://daxstudio.org/).

**ALM Toolkit** - An open-source schema compare tool for Power BI semantic models, most often used for application lifecycle management (ALM) scenarios. Perform deployment across environments and retain incremental refresh historical data. Diff and merge metadata files, branches, and repos. Reuse common definitions between semantic models. Requires read-only for query operations. Requires read-write for metadata operations. To learn more, see [alm-toolkit.com](http://alm-toolkit.com/).

**Third party** - Includes client data visualization applications and tools that can connect to, query, and consume semantic models in Premium workspaces. Most tools require the latest versions of MSOLAP client libraries, but some can use ADOMD. Read-only or read-write XMLA endpoint is dependent on the operations.

### Client libraries

Client applications and tools don't communicate directly with the XMLA endpoint. Instead, they use *client libraries* as an abstraction layer. These are the same client libraries that applications use to connect to Azure Analysis Services and SQL Server Analysis Services. Microsoft applications like Excel, SQL Server Management Studio (SSMS), and Analysis Services projects extension for Visual Studio install all three client libraries and update them along with regular application and extension updates. Developers can use the client libraries to build custom applications. In some cases, particularly with third-party applications, if not installed with the application, it might be necessary to install newer versions of the client libraries. Client libraries are updated monthly. To learn more, see [Client libraries for connecting to Analysis Services](/azure/analysis-services/analysis-services-data-providers).

## Optimize semantic models for write operations by enabling large models

When using the XMLA endpoint for semantic model management with write operations, it's recommended you enable the semantic model for large models. This reduces the overhead of write operations, which can make them considerably faster. For semantic models over 1 GB (after compression), the difference can be significant. To learn more, see [Large models in Power BI Premium](service-premium-large-models.md).

## Enable XMLA read-write

By default, Premium capacity or Premium Per User semantic model workloads have the XMLA endpoint property setting enabled for read-only. This means applications can only query a semantic model. For applications to perform write operations, the XMLA Endpoint property must be enabled for read-write.

### To enable read-write for a Premium capacity

1. Select **Settings** > **Admin portal**.
1. In the Admin portal, select **Capacity settings** > **Power BI Premium** > capacity name.
1. Expand **Workloads**. In the **XMLA Endpoint** setting, select **Read Write**. The XMLA Endpoint setting applies to *all workspaces and semantic models* assigned to the capacity.

    :::image type="content" source="media/service-premium-connect-tools/xmla-endpoint-enable.png" alt-text="Screenshot showing the XMLA endpoint settings. Read write is selected.":::

### To enable read-write for Premium Per User

1. Select **Settings** > **Admin portal**.
1. In the Admin portal, select **Premium Per User**.
1. Expand **Semantic model workload settings**. In the **XMLA Endpoint** setting, select **Read Write**.

## Connecting to a Premium workspace

Workspaces assigned to a capacity have a connection string in URL format. For example:

`powerbi://api.powerbi.com/v1.0/[tenant name]/[workspace name]`.

Applications connecting to the workspace use the URL as if it were an Analysis Services server name. For example:

`powerbi://api.powerbi.com/v1.0/contoso.com/Sales Workspace`.

Users with UPNs in the same tenant (not B2B) can replace the tenant name with `myorg`. For example:

`powerbi://api.powerbi.com/v1.0/myorg/Sales Workspace`.

B2B users must specify their organization UPN in tenant name. For example:

`powerbi://api.powerbi.com/v1.0/fabrikam.com/Sales Workspace`.

To determine the primary domain name and ID of a Power BI tenant, sign into the Azure portal, select Microsoft Entra ID from the main menu, and then note the information on the Microsoft Entra Overview page. For more information, see [Find the Microsoft Entra tenant ID and primary domain name](/partner-center/find-ids-and-domain-names).

> [!NOTE]
> Connecting to a [**My Workspace**](../consumer/end-user-workspaces.md#types-of-workspaces) by using the XMLA endpoint is currently not supported.

### To get the workspace connection URL

In workspace **Settings** > **Premium** > **Workspace Connection**, select **Copy**.

:::image type="content" source="media/service-premium-connect-tools/xmla-endpoint-workspace-connection.png" alt-text="Screenshot showing the settings page. The workspace connection section is highlighted.":::

## Connection requirements

### Initial catalog

With some tools, such as SQL Server Profiler, you must specify an *Initial Catalog*, which is the semantic model (database) to connect to in your workspace. In the **Connect to Server** dialog, select **Options** > **Connection Properties** > **Connect to database**, enter the semantic model name.

:::image type="content" source="media/service-premium-connect-tools/sql-profiler-connection-properties.png" alt-text="Screenshot showing the SQL Server Profiler connect to server dialog. The connect to database section is highlighted.":::

### Duplicate workspace names

[Workspaces](../collaborate-share/service-new-workspaces.md) in Power BI validation prevents the creation or renaming of workspaces with duplicate names. When connecting to a workspace with the same name as another workspace, you might get the following message:

**Cannot connect to `powerbi://api.powerbi.com/v1.0/[tenant name]/[workspace name]`.**

To work around, in addition to the workspace name specify the ObjectIDGuid. You can copy the ObjectIDGuid from the workspace objectID in the URL. Append the objectID to the connection URL. For example:

`powerbi://api.powerbi.com/v1.0/myorg/Contoso Sales - 9d83d204-82a9-4b36-98f2-a40099093830`.

### Duplicate semantic model name

To connect to a semantic model with the same name as another semantic model in the same workspace, append the semantic model guid to the semantic model name. You can get both semantic model name and guid when connected to the workspace in SSMS.

### Delay in semantic models shown

When you connect to a workspace, changes from new, deleted, and renamed semantic models can take up to a few minutes to appear.

### Unsupported semantic models

The following semantic models aren't accessible by using the XMLA endpoint. These semantic models won't appear under the workspace in SSMS or in other tools:

- Semantic models based on a live connection to an Azure Analysis Services or SQL Server Analysis Services model.
- Semantic models based on a live connection to a Power BI semantic model in another workspace. To learn more, see [Intro to semantic models across workspaces](../connect-data/service-datasets-across-workspaces.md).
- Semantic models with Push data by using the REST API.
- Semantic models in My Workspace.
- Excel workbook semantic models.

### Server/workspace alias

Server name aliases, supported in Azure Analysis Services aren't supported for Premium workspaces.

## Security

In addition to the XMLA Endpoint property being enabled read-write by the capacity admin, the tenant-level setting **Allow XMLA endpoints and Analyze in Excel with on-premises semantic models** must be enabled in the admin portal. If you need to generate Analyze in Excel (AIXL) files that connect to the XMLA endpoint, the tenant-level setting ***Users can work with semantic models in Excel using a live connection** should also be enabled. These settings are both enabled by default.

**Allow XMLA endpoints and Analyze in Excel with on-premises semantic models** is an Integration setting.

:::image type="content" source="media/service-premium-connect-tools/allow-xmla-endpoints.png" alt-text="Integration setting allow XMLA endpoints.":::

**Users can work with semantic models in Excel using a live connection** is an Export and sharing setting.

:::image type="content" source="media/service-premium-connect-tools/allow-live-connections.png" alt-text="Export and sharing setting allow live connections.":::

The following table describes the implications of both settings:

|Setting  |Allow XMLA endpoints and Analyze in Excel with on-premises semantic models = **disabled**  |Allow XMLA endpoints and Analyze in Excel with on-premises semantic models = **enabled**  |
|---------|---------|---------|
|**Users can work with semantic models in Excel using a live connection** = disabled     |XMLA *disallowed*, Analyze in Excel *disallowed*, AIXL for on-premises semantic models *disallowed*         |XMLA *allowed*, Analyze in Excel *disallowed*, AIXL for on-premises semantic models *allowed*         |
|**Users can work with semantic models in Excel using a live connection** = enabled     | XMLA *disallowed*, Analyze in Excel *allowed*, AIXL for on-premises semantic models *disallowed*        | XMLA *allowed*, Analyze in Excel *allowed*, AIXL for on-premises semantic models *allowed*        |

Access through the XMLA endpoint will honor security group membership set at the workspace/app level.

Workspace contributors and above have Write semantic model permissions, which are effectively the same as Analysis Services database admins. They can deploy new semantic models from Visual Studio and execute TMSL scripts in SSMS.

Users with Build semantic model permissions are equivalent to Analysis Services database readers. They can connect to and browse semantic models for data consumption and visualization. Row-level security (RLS) rules are honored and they cannot see internal semantic model metadata.

Operations that require Analysis Services server admin permissions (rather than database admin) in general are not supported.

### Impersonation

User impersonation by using the [EffectiveUserName connection string property](/analysis-services/instances/connection-string-properties-analysis-services?view=power-bi-premium-current&preserve-view=true#bkmk_auth)  is supported when connecting to Premium workspace semantic models. The account specified in EffectiveUserName must be in the tenant's Microsoft Entra ID and must have both **Read** and **Build** permissions for the semantic model being connected to. If the account doesn't have both Read and Build permissions, Power BI can't impersonate the user account. The connection will fail, and an error is returned.

You can also perform impersonation by specifying one or more workspace roles in the [Roles connection string property](/analysis-services/instances/connection-string-properties-analysis-services?view=power-bi-premium-current&preserve-view=true#roles). With the Roles property, you can test downgrading role members with Write permissions to Read permissions. The following Role permissions apply depending on the account of the user signed in:

- If the user performing impersonation *is* a workspace admin, which is effectively the same as a server admin in Analysis Services, they do not need to be a member of any of the specified roles.

- If the user performing impersonation  *is not* a workspace admin, they must belong to one or more of the specified roles, otherwise a user not found or no permissions type error is returned.

### Model roles

With the XMLA endpoint, roles, role membership, row-level security (RLS), and object-level security (OLS) can be defined for users in the tenant's Microsoft Entra ID. Model roles in Power BI are used only for RLS and OLS. Use the Power BI security model to control permissions beyond RLS and OLS.

For tabular model projects authored in Visual Studio, roles can be defined by using Role Manager in the model designer. For semantic models in Power BI, roles can be defined in Power BI Desktop prior to publishing to the service. Role membership is specified in the Power BI service. SSMS can also be used to create and manage roles. In most cases, role object definitions can be scripted by using TMSL to create or modify the [Roles object](/analysis-services/tmsl/roles-object-tmsl?view=power-bi-premium-current&preserve-view=true). TMSL scripts can be executed in SSMS or with the [Invoke-ASCmd](/powershell/module/sqlserver/invoke-ascmd?view=sqlserver-ps&preserve-view=true) PowerShell cmdlet.

The following limitations apply when working with roles through the XMLA endpoint:

- The only permission for a role that can be set for semantic models is Read permission. Other permissions are granted using the Power BI security model.
- Service Principals do not work with RLS and OLS, and cannot be added as model role members.
- Build permission for a semantic model is required for read access through the XMLA endpoint, regardless of the existence of semantic model roles.

### Setting data source credentials

Metadata specified through the XMLA endpoint can create connections to data sources, but cannot set data source credentials. Instead, credentials can be set in the semantic model settings page in the Power BI Service.

### Service principals

Service principals are a Microsoft Entra app registration you create within your tenant to perform unattended resource and service level operations. They're a unique type of user identity with an app name, application ID, tenant ID, and client secret or certificate for a password. Power BI Premium uses the same service principal functionality as Power BI Embedded.

Service principals can be used with the XMLA endpoint to automate semantic model management tasks such as provisioning workspaces, deploying models, and semantic model refresh with:

- PowerShell
- Azure Automation
- Azure Logic Apps
- Custom client applications

To learn more, see [Automate Premium workspace and semantic model tasks with service principals](service-premium-service-principal.md).

## Deploy model projects from Visual Studio (SSDT)

Deploying a tabular model project in Visual Studio to a Premium workspace is much the same as deploying to an Azure or SQL Server Analysis Services server. The only differences are in the Deployment Server property specified for the project, and how data source credentials are specified so processing operations can import data from data sources into the new semantic model on the workspace.

To deploy a tabular model project authored in Visual Studio, set the workspace connection URL in the project **Deployment Server** property. In Visual Studio, in **Solution Explorer**, right-click the project > **Properties**. In the **Server** property, paste the workspace connection URL.

:::image type="content" source="media/service-premium-connect-tools/xmla-endpoint-ssdt-deploy-property.png" alt-text="Screenshot of the configuration window. Server is highlighted in the main pane. OK is selected.":::

When the Deployment Server property is specified, the project can be deployed.

**When deployed the first time**, a semantic model is created in the workspace by using metadata from the model.bim. As part of the deployment operation, after the semantic model is created in the workspace from model metadata, processing to load data into the semantic model from data sources will fail.

Processing fails because unlike deploying to an Azure or SQL Server Analysis Server instance, where you are prompted for data source credentials as part of the deployment operation, when deploying to a Premium workspace data source credentials cannot be specified as part of the deployment operation. Instead, after metadata deployment has succeeded and the semantic model is created, data source credentials are then specified in the Power BI Service in semantic model settings. In the workspace, select **Semantic models** > **Settings** > **Data source credentials** > **Edit credentials**.

:::image type="content" source="media/service-premium-connect-tools/xmla-endpoint-datasource-credentials.png" alt-text="Screenshot showing data source credentials dialog. Fields that can be edited are highlighted.":::

When data source credentials are specified, you can then refresh the semantic model in the Power BI service, configure schedule refresh, or process (refresh) from SQL Server Management Studio to load data into the semantic model.

The deployment **Processing Option** property specified in the project in Visual Studio is observed. However, if a data source has not had credentials specified in the Power BI service, even if the metadata deployment succeeds, processing will fail. You can set the property to **Do Not Process**, preventing any attempts to process as part of the deployment. You might want to set the property back to **Default** because once the data source credentials are specified in the data source settings for the new semantic model, processing as part of subsequent deployment operations will then succeed.

## Connect with SSMS

Using SSMS to connect to a workspace is just like connecting to an Azure or SQL Server Analysis Services server. The only difference is you specify the workspace URL in server name, and you must use **Active Directory - Universal with MFA** authentication.

### Connect to a workspace by using SSMS

1. In SQL Server Management Studio, select **Connect** > **Connect to Server**.

2. In **Server Type**, select **Analysis Services**. In **Server name**, enter the workspace URL. In **Authentication**, select **Active Directory - Universal with MFA**, and then in **User name**, enter your organizational user ID.

    :::image type="content" source="media/service-premium-connect-tools/xmla-endpoint-connect-server.png" alt-text="Screenshot of the connect to server dialog. Server type, name and authentication are highlighted. Connect is selected.":::

When connected, the workspace is shown as an Analysis Services server, and semantic models in the workspace are shown as databases.  

:::image type="content" source="media/service-premium-connect-tools/xmla-endpoint-ssms.png" alt-text="Screenshot of the Microsoft SQL Server Management Studio window. Object Explorer is in the main pane.":::

To learn more about using SSMS to script metadata, see:

- [Create Analysis Services scripts](/analysis-services/instances/create-analysis-services-scripts-in-management-studio?view=power-bi-premium-current&preserve-view=true)
- [Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=power-bi-premium-current&preserve-view=true)

## Semantic model refresh

The XMLA endpoint enables a wide range of scenarios for fine-grain refresh capabilities using SSMS, automation with PowerShell, [Azure Automation](/azure/automation/automation-intro), and [Azure Functions](/azure/azure-functions/functions-overview) using TOM. For example, you can refresh certain [incremental refresh](../connect-data/incremental-refresh-overview.md) historical partitions without having to reload all historical data.

Unlike configuring refresh in the Power BI service, refresh operations through the XMLA endpoint are not limited to 48 refreshes per day, and the [scheduled refresh timeout](../connect-data/refresh-troubleshooting-refresh-scenarios.md#scheduled-refresh-time-out) is not imposed.

Date, time, and status for semantic model refresh operations that include a write transaction through the XMLA endpoint are recorded and shown in semantic model Refresh history.

>[!NOTE]
>Refresh operations performed by the XMLA endpoint don't automatically refresh tile caches. Tile caches are only refreshed when a user accesses the report.

:::image type="content" source="media/service-premium-connect-tools/refresh-history-via-xmla.png" alt-text="Screenshot showing the refresh history screen. The item, via XMLA endpoint, is highlighted.":::

## Dynamic Management Views (DMV)

Analysis Services [DMVs](/analysis-services/instances/use-dynamic-management-views-dmvs-to-monitor-analysis-services) provide visibility of semantic model metadata, lineage, and resource usage. DMVs available for querying in Power BI through the XMLA endpoint are limited to, at most, those that require database-admin permissions. Some DMVs, for example,  aren't accessible because they require Analysis Services server-admin permissions.

## Power BI Desktop authored semantic models

### Enhanced metadata

XMLA write operations on semantic models authored in Power BI Desktop and published to a Premium workspace require enhanced metadata. To learn more, see [Enhanced semantic model metadata](../connect-data/desktop-enhanced-dataset-metadata.md).

> [!CAUTION]
> At this time, a write operation on a semantic model authored in Power BI Desktop prevents it from being downloaded back as a PBIX file. Be sure to retain your original PBIX file.

### data source declaration

When connecting to data sources and querying data, Power BI Desktop uses Power Query M expressions as inline data source declarations. While supported in Premium workspaces, Power Query M inline data source declaration isn't supported by Azure Analysis Services or SQL Server Analysis Services. Instead, Analysis Services data modeling tools like Visual Studio create metadata using *structured* or *provider* data source declarations. With the XMLA endpoint, Premium also supports structured and provider data sources, but not as part of Power Query M inline data source declarations in Power BI Desktop models. To learn more, see [Understanding providers](/azure/analysis-services/analysis-services-datasource#understanding-providers).

### Power BI Desktop in live connect mode

Power BI Desktop can connect to a Power BI Premium semantic model using a live connection. Using a live connection, data doesn't need to be replicated locally making it easier for users to consume semantic models. There are two ways users can connect:

- Select **Power BI semantic models**, and then select a semantic model to create a report. This is the **recommended** way for users to connect live to semantic models. This method provides an improved discover experience showing the endorsement level of semantic models. Users don't need to find and keep track of workspace URLs. To find a semantic model, users simply type in the semantic model name or scroll to find the semantic model they're looking for.

  :::image type="content" source="media/service-premium-connect-tools/dataset-live-connect.png" alt-text="Screenshot of the Power BI Desktop, Power BI semantic models is highlighted in the ribbon. The select semantic model dialog is in the main pane. ":::

- Using **Get Data** > **Analysis Services**, specify a Power BI Premium workspace name as a URL,  select **Connect live**, and then in Navigator, select a semantic model. In this case, Power BI Desktop uses the XMLA endpoint to connect live to the semantic model as though it were an Analysis Services data model.

  :::image type="content" source="media/service-premium-connect-tools/as-live-connect.png" alt-text="Screenshot of Power BI Desktop Analysis Services is selected. Connect live is highlighted in the analysis services database dialog.":::

Organizations that have existing reports connected live to Analysis Services data models, and intend to migrate to Premium semantic models only have to change the server name URL in **Transform data** > **Data source settings**.

## Audit logs

When applications connect to a workspace, access through XMLA endpoints is logged in the Power BI audit logs with the following operations:

|Operation friendly name   |Operation name   |
|---------|---------|
|Connected to Power BI semantic model from an external application      |  ConnectFromExternalApplication        |
|Requested Power BI semantic model refresh from an external application      | RefreshDatasetFromExternalApplication        |
|Created Power BI semantic model from an external application      |  CreateDatasetFromExternalApplication        |
|Edited Power BI semantic model from an external application     |  EditDatasetFromExternalApplication        |
|Deleted Power BI semantic model from an external application      |  DeleteDatasetFromExternalApplication        |

To learn more, see [Auditing Power BI](../admin/service-admin-auditing.md).

## Related content

For more information related to this article, see:

- [Power BI usage scenarios: Advanced data model management](../guidance/powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
