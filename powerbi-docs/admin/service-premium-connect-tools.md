---
title: Dataset connectivity and management with the XMLA endpoint in Power BI Premium (Preview) 
description: Describes how to connect to datasets in Power BI Premium from client applications and tools.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 06/04/2020
ms.custom: seodec18

LocalizationGroup: Premium
---

# Dataset connectivity with the XMLA endpoint (Preview)

Power BI Premium workspaces and datasets at the 1500 and higher compatibility level support open-platform connectivity from Microsoft and third-party client applications and tools by using an *XMLA endpoint*.

> [!NOTE]
> This feature is in **Preview**. Features in Preview should not be used in a production environment. Certain functionality, support, and documentation is limited.  Refer to the [Microsoft Online Services Terms (OST)](https://www.microsoft.com/licensing/product-licensing/products?rtc=1) for details.

## What's an XMLA endpoint?

Power BI Premium uses the [XML for Analysis](https://docs.microsoft.com/analysis-services/xmla/xml-for-analysis-xmla-reference?view=power-bi-premium-current) (XMLA) protocol for communications between client applications and the engine that manages your Power BI workspaces and datasets. These communications are through what are commonly referred to as XMLA endpoints. XMLA is the same communication protocol used by the Microsoft Analysis Services engine, which under the hood, runs Power BI's semantic modeling, governance, lifecycle, and data management.

By default, *read-only* connectivity using the endpoint is enabled for the **Datasets workload** in a capacity. With read-only, data visualization applications and tools can query dataset model data, metadata, events, and schema. *Read-write* operations using the endpoint can be enabled providing additional dataset management, governance, advanced semantic modeling, debugging, and monitoring. With read-write enabled, Power BI Premium datasets have more parity with Azure Analysis Services and SQL Server Analysis Services enterprise grade tabular modeling tools and processes.

> [!NOTE]
> It's recommended you use the modern workspace experience, especially when connecting to your datasets by using the XMLA endpoint. Operations such as creating or deleting datasets are not supported with classic workspaces. To upgrade classic workspaces to the modern experience, see [Upgrade classic workspaces in Power BI](../collaborate-share/service-upgrade-workspaces.md).

## Data modeling and management tools

These are some of the most common tools used with Azure Analysis Services and SQL Server Analysis Services, and now supported by Power BI Premium datasets:

**Visual Studio with Analysis Services projects** – Also known as SQL Server Data Tools, or simply **SSDT**, is an enterprise grade model authoring tool for Analysis Services tabular models. Analysis Services projects extensions are supported on all Visual Studio 2017 and later editions, including the free Community edition. Extension version 2.9.6 or higher is required to deploy tabular models to a Premium workspace. When deploying to a Premium workspace, the model must be at the 1500 or higher compatibility level. XMLA read-write is required on the datasets workload. To learn more, see [Tools for Analysis Services](https://docs.microsoft.com/analysis-services/tools-and-applications-used-in-analysis-services?view=power-bi-premium-current).

**SQL Server Management Studio (SSMS)** - Supports DAX, MDX, and XMLA queries. Perform fine-grain refresh operations and scripting of dataset metadata by using the [Tabular Model Scripting Language](https://docs.microsoft.com/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference) (TMSL). Read-only is required for query operations. Read-write is required for scripting metadata. Requires SSMS version 18.4 or above. Download [here](https://docs.microsoft.com/sql/ssms/download-sql-server-management-studio-ssms).

**SQL Server Profiler** – Installed with SSMS, this tool provides tracing and debugging of dataset events. While officially deprecated for SQL Server, Profiler continues to be included in SSMS and remains supported for Analysis Services and Power BI Premium. XMLA read-only is required. To learn more, see [SQL Server Profiler for Analysis Services](https://docs.microsoft.com/analysis-services/instances/use-sql-server-profiler-to-monitor-analysis-services?view=power-bi-premium-current).

**Analysis Services Deployment Wizard** – Installed with SSMS, this tool provides deployment of Visual Studio authored tabular model projects to Analysis Services and Power BI Premium workspaces. It can be run interactively or from the command line for automation. XMLA read-write is required. To learn more, see [Analysis Services Deployment Wizard](https://docs.microsoft.com/analysis-services/deployment/deploy-model-solutions-using-the-deployment-wizard?view=power-bi-premium-current).

**PowerShell cmdlets** – Analysis Services cmdlets can be used to automate dataset management tasks like refresh operations. XMLA read-write is required. Version **21.1.18221** or higher of the [SqlServer PowerShell module](https://www.powershellgallery.com/packages/SqlServer/) is required. Azure Analysis Services cmdlets in the Az.AnalysisServices module are not supported for Power BI Premium. To learn more, see [Analysis Services PowerShell Reference](https://docs.microsoft.com/analysis-services/powershell/analysis-services-powershell-reference?view=power-bi-premium-current).

**Power BI Report Builder** - A tool for authoring paginated reports. Create a report definition that specifies what data to retrieve, where to get it, and how to display it. You can preview your report in Report Builder and then publish your report to the Power BI service. XMLA read-only is required. To learn more, see [Power BI Report Builder](https://docs.microsoft.com/power-bi/report-builder-power-bi).

**Tabular Editor** - An open-source tool for creating, maintaining, and managing tabular models using an intuitive, lightweight editor. A hierarchical view shows all objects in your tabular model. Objects are organized by display folders with support for multi-select property editing and DAX syntax highlighting. XMLA read-only is required for query operations. Read-write is required for metadata operations. To learn more, see [tabulareditor.github.io](https://tabulareditor.github.io/).

**DAX Studio** – An open-source tool for DAX authoring, diagnosis, performance tuning, and analysis. Features include object browsing, integrated tracing, query execution breakdowns with detailed statistics, DAX syntax highlighting and formatting. XMLA read-only is required for query operations. To learn more, see [daxstudio.org](https://daxstudio.org/).

**ALM Toolkit** - An open-source schema compare tool for Power BI datasets, most often used for application lifecycle management (ALM) scenarios. Perform deployment across environments and retain incremental refresh historical data. Diff and merge metadata files, branches and repos. Reuse common definitions between datasets. Read-only is required for query operations. Read-write is required for metadata operations. To learn more, see [alm-toolkit.com](http://alm-toolkit.com/).

**Microsoft Excel** – Excel PivotTables are one of the most common tools used to summarize, analyze, explore, and present summary data from Power BI datasets. Read-only is required for query operations. Click-to-Run version of Office 16.0.11326.10000 or higher is required.

**Third party** - Includes client data visualization applications and tools that can connect to, query, and consume datasets in Power BI Premium. Most tools require the latest versions of MSOLAP client libraries, but some may use ADOMD. Read-only or read-write XMLA Endpoint is dependent on the operations.

### Client libraries

Client applications don't communicate directly with the XMLA endpoint. Instead, they use *client libraries* as an abstraction layer. These are the same client libraries applications use to connect to Azure Analysis Services and SQL Server Analysis Services. Microsoft applications like Excel, SQL Server Management Studio (SSMS), and  Analysis Services projects extension for Visual Studio install all three client libraries and update them along with regular application and extension updates. Developers can also use the client libraries to build custom applications. In some cases, particularly with third-party applications, if not installed with the application, it may be necessary to install newer versions of the client libraries. Client libraries are updated monthly. To learn more, see [Client libraries for connecting to Analysis Services](https://docs.microsoft.com/azure/analysis-services/analysis-services-data-providers).

## Supported write operations

Dataset metadata is exposed through the client libraries based on the Tabular Object Model (TOM) for developers to build custom applications. This enables Visual Studio and open-source community tools like Tabular Editor to provide additional data modeling and deployment capabilities supported by the Analysis Services engine but not yet supported in Power BI Desktop. Additional data modeling functionality includes:

- [Calculation groups](https://docs.microsoft.com/analysis-services/tabular-models/calculation-groups?view=power-bi-premium-current) for calculation reusability and simplified consumption of complex models.

- [Metadata translations](https://docs.microsoft.com/analysis-services/tabular-models/translations-in-tabular-models-analysis-services?view=power-bi-premium-current) to support multi-language reports and datasets.

- [Perspectives](https://docs.microsoft.com/analysis-services/tabular-models/perspectives-ssas-tabular?view=power-bi-premium-current) to define focused, business-domain specific views of dataset metadata.

Object level security (OLS) is not yet supported in Power BI Premium datasets.

## Optimize datasets for write operations

When using the XMLA endpoint for dataset management with write operations, it's recommended you enable the dataset for large models. This reduces the overhead of write operations, which can make them considerably faster. For datasets over 1 GB in size (after compression), the difference can be significant. To learn more, see [Large models in Power BI Premium](service-premium-large-models.md).

## Enable XMLA read-write

By default, a Premium capacity has the XMLA Endpoint property setting enabled for read-only. This means applications can only query a dataset. For applications to perform write operations, the XMLA Endpoint property must be enabled for read-write. The XMLA Endpoint property setting for a capacity is configured in the **Datasets workload**. The XMLA Endpoint setting applies to *all workspaces and datasets* assigned to the capacity.

### To enable read-write for a capacity

1. In the Admin portal, click **Capacity settings** > **Power BI Premium** > capacity name.
2. Expand **Workloads**. In the **XMLA Endpoint** setting, select **Read Write**.

    ![Enable XMLA endpoint](media/service-premium-connect-tools/xmla-endpoint-enable.png)

## Connecting to a Premium workspace

Workspaces assigned to a dedicated capacity have a connection string in URL format like this, `powerbi://api.powerbi.com/v1.0/[tenant name]/[workspace name]`.

Applications connecting to the workspace use the URL as it were an Analysis Services server name. For example, `powerbi://api.powerbi.com/v1.0/contoso.com/Sales Workspace`.

Users with UPNs in the same tenant (not B2B) can replace the tenant name with `myorg`. For example, `powerbi://api.powerbi.com/v1.0/myorg/Sales Workspace`.

B2B users must specify their organization UPN in tenant name. For example, `powerbi://api.powerbi.com/v1.0/fabrikam.com/Sales Workspace`.

### To get the workspace connection URL

In workspace **Settings** > **Premium** > **Workspace Connection**, click **Copy**.

![Workspace connection string](media/service-premium-connect-tools/xmla-endpoint-workspace-connection.png)


## Connection requirements

### Initial catalog

With some tools, such as SQL Server Profiler, you may need to specify an *Initial Catalog*. Specify a dataset (database) in your workspace. In the **Connect to Server** dialog, click **Options** > **Connection Properties** > **Connect to database**, enter the dataset name.

### Duplicate workspace names

[New workspaces](../collaborate-share/service-new-workspaces.md) (created using the new workspace experience) in Power BI impose validation to disallow creation or renaming workspaces with duplicate names. Workspaces that have not been migrated can result in duplicate names. When connecting to a workspace with the same name as another workspace, you may get the following error:

**Cannot connect to powerbi://api.powerbi.com/v1.0/[tenant name]/[workspace name].**

To work around this error, in addition to the workspace name, specify the ObjectIDGuid, which can be copied from the workspace objectID in the URL. Append the objectID to the connection URL. For example,  
'powerbi://api.powerbi.com/v1.0/myorg/Contoso Sales - 9d83d204-82a9-4b36-98f2-a40099093830'.

### Duplicate dataset name

When connecting to a dataset with the same name as another dataset in the same workspace, append the dataset guid to the dataset name. You can get both dataset name and guid when connected to the workspace in SSMS.

### Delay in datasets shown

When connecting to a workspace, changes from new, deleted, and renamed datasets can take up to a few minutes to appear.

### Unsupported datasets

The following datasets are not accessible by the XMLA endpoint. These datasets will not appear under the workspace in SSMS or in other tools:

- Datasets based on a live connection to an Azure Analysis Services or SQL Server Analysis Services model. 
- Datasets based on a live connection to a Power BI dataset in another workspace. To learn more, see [Intro to datasets across workspaces](../connect-data/service-datasets-across-workspaces.md).
- Datasets with Push data by using the REST API.
- Excel workbook datasets.

## Security

In addition to the XMLA Endpoint property being enabled read-write by the capacity admin, the tenant-level **Export data** setting in the Power BI Admin Portal, also required for Analyze in Excel, must be enabled.

![Enable Export data](media/service-premium-connect-tools/xmla-endpoint-export-data.png)

Access through the XMLA endpoint will honor security group membership set at the workspace/app level.

Workspace contributors and above have write access to the dataset and are therefore equivalent to Analysis Services database admins. They can deploy new datasets from Visual Studio and execute TMSL scripts in SSMS.

Operations that require Analysis Services server admin permissions (rather than database admin) such as server-level traces and user impersonation using the [EffectiveUserName](https://docs.microsoft.com/analysis-services/instances/connection-string-properties-analysis-services?view=power-bi-premium-current#bkmk_auth) connection-string property are not supported in Power BI Premium at this time.

Other users who have [Build permission](../connect-data/service-datasets-build-permissions.md) on a dataset are equivalent to Analysis Services database readers. They can connect to and browse datasets for data consumption and visualization. Row-level security (RLS) rules are honored and they cannot see internal dataset metadata.

### Model roles

Dataset metadata through the XMLA endpoint can create, modify or delete model roles from a dataset, including setting row-level security (RLS) filters. Model roles in Power BI are used only for RLS. Use the Power BI security model to control permissions beyond RLS.

The following limitations apply when working with dataset roles through the XMLA endpoint:

- **During the public preview, you cannot specify role membership for a dataset by using the XMLA endpoint**. Instead, specify role members on the Row-Level Security page for a dataset in the Power BI service.
- The only permission for a role that can be set for Power BI datasets is the Read permission. Build permission for a dataset is required for read access through the XMLA endpoint, regardless of the existence of dataset roles. Use the Power BI security model to control permissions beyond RLS.
- Object-level security (OLS) rules are not currently supported in Power BI.

### Setting data-source credentials

Metadata specified through the XMLA endpoint can create connections to data sources, but cannot set data-source credentials. Instead, credentials can be set in the dataset settings page in the Power BI Service.

### Service principals

Azure service principals can be used to perform unattended resource and service level operations. To learn more, see [Automate Premium workspace and dataset tasks with service principals](service-premium-service-principal.md).

## Deploy model projects from Visual Studio (SSDT)

Deploying a tabular model project in Visual Studio to a Power BI Premium workspace is much the same as deploying to an Azure or SQL Server Analysis Services server. The only differences are in the Deployment Server property specified for the project, and how data source credentials are specified so processing operations can import data from data sources into the new dataset on the workspace.

> [!IMPORTANT]
> During public preview, role memberships cannot be specified by tools using the XMLA endpoint. If your model project fails to deploy, make sure there are no users specified in any roles. After the model has successfully deployed, specify users for dataset roles in the Power BI service. To learn more, see [Model roles](#model-roles) earlier in this article.

To deploy a tabular model project authored in Visual Studio, you must first set the workspace connection URL in the project **Deployment Server** property. In Visual Studio, in **Solution Explorer**, right-click the project > **Properties**. In the **Server** property, paste the workspace connection URL.

![Deployment property](media/service-premium-connect-tools/xmla-endpoint-ssdt-deploy-property.png)

When the Deployment Server property has been specified, the project can then be deployed.

**When deployed the first time**, a dataset is created in the workspace by using metadata from the model.bim. As part of the deployment operation, after the dataset has been created in the workspace from model metadata, processing to load data into the dataset from data sources will fail.

Processing fails because unlike when deploying to an Azure or SQL Server Analysis Server instance, where data source credentials are prompted for as part of the deployment operation, when deploying to a Premium workspace data source credentials cannot be specified as part of the deployment operation. Instead, after metadata deployment has succeeded and the dataset has been created, data source credentials are then specified in the Power BI Service in dataset settings. In the workspace, click **Datasets** > **Settings** > **Data source credentials** > **Edit credentials**.

![Data source credentials](media/service-premium-connect-tools/xmla-endpoint-datasource-credentials.png)

When data source credentials are specified, you can then refresh the dataset in the Power BI service, configure schedule refresh, or process (refresh) from SQL Server Management Studio to load data into the dataset.

The deployment **Processing Option** property specified in the project in Visual Studio is observed. However, if a data source has not yet had credentials specified in the Power BI service, even if the metadata deployment succeeds, processing will fail. You can set the property to **Do Not Process**, preventing an attempt to process as part of the deployment, but you might want to set the property back to **Default** because once the data source credentials are specified in the data source settings for the new dataset, processing as part of subsequent deployment operations will then succeed.

## Connect with SSMS

Using SSMS to connect to a workspace is just like connecting to an Azure or SQL Server Analysis Services server. The only difference is you specify the workspace URL in server name, and you must use **Active Directory - Universal with MFA** authentication.

### Connect to a workspace by using SSMS

1. In SQL Server Management Studio, click **Connect** > **Connect to Server**.

2. In **Server Type**, select **Analysis Services**. In **Server name**, enter the workspace URL. In **Authentication**, select **Active Directory - Universal with MFA**, and then in **User name**, enter your organizational user ID.

    ![Connect to server in SSMS](media/service-premium-connect-tools/xmla-endpoint-connect-server.png)

When connected, the workspace is shown as an Analysis Services server, and datasets in the workspace are shown as databases.  

![SSMS](media/service-premium-connect-tools/xmla-endpoint-ssms.png)

To learn more about using SSMS to script metadata, see [Create Analysis Services scripts](https://docs.microsoft.com/analysis-services/instances/create-analysis-services-scripts-in-management-studio?view=power-bi-premium-current) and [Tabular Model Scripting Language (TMSL)](https://docs.microsoft.com/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=power-bi-premium-current).

## Dataset refresh

The XMLA endpoint enables a wide range of scenarios for fine-grain refresh capabilities using SSMS, automation with PowerShell, [Azure Automation](https://docs.microsoft.com/azure/automation/automation-intro), and [Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-overview) using TOM. You can, for example, refresh certain [incremental refresh](service-premium-incremental-refresh.md) historical partitions without having to reload all historical data.

Unlike configuring refresh in the Power BI service, refresh operations through the XMLA endpoint are not limited to 48 refreshes per day, and the [scheduled refresh timeout](../connect-data/refresh-troubleshooting-refresh-scenarios.md#scheduled-refresh-timeout) is not imposed.

## Dynamic Management Views (DMV)

Analysis Services [DMVs](https://docs.microsoft.com/analysis-services/instances/use-dynamic-management-views-dmvs-to-monitor-analysis-services) provide visibility of dataset metadata, lineage, and resource usage. DMVs available for querying in Power BI through the XMLA endpoint are limited to, at most, those that require database-admin permissions. Some DMVs for example are not accessible because they require Analysis Services server-admin permissions.

## Power BI Desktop authored datasets

### Enhanced metadata

XMLA write operations on datasets authored in Power BI Desktop and published to a Premium workspace require enhanced metadata is enabled. To learn more, see [Enhanced dataset metadata](../connect-data/desktop-enhanced-dataset-metadata.md).

> [!CAUTION]
> At this time, a write operation on a dataset authored in Power BI Desktop will prevent it from being downloaded back as a PBIX file. Be sure to retain your original PBIX file.

### Data-source declaration

When connecting to data sources and querying data, Power BI Desktop uses Power Query M expressions as inline data source declarations. While supported in Power BI Premium workspaces, Power Query M inline data-source declaration is not supported by Azure Analysis Services or SQL Server Analysis Services. Instead, Analysis Services data modeling tools like Visual Studio create metadata using *structured* and/or *provider* data source declarations. With the XMLA endpoint, Power BI Premium also supports structured and provider data sources, but not as part of Power Query M inline data source declarations in Power BI Desktop models. To learn more, see [Understanding providers](https://docs.microsoft.com/azure/analysis-services/analysis-services-datasource#understanding-providers).

### Power BI Desktop in live connect mode

Power BI Desktop can connect to a Power BI Premium dataset using a live connection. When using a live connection, data doesn't need to be replicated locally, making it easier for users to consume semantic models. There are two ways users can connect:

By selecting **Power BI datasets**, and then selecting a dataset to create a report. This is the **recommended** way for users to connect live to datasets. This method provides an improved discover experience showing the endorsement level of datasets. Users don't need to find and keep track of workspace URLs. To find a dataset, users simply type in the dataset name or scroll to find the dataset they're looking for.

![Connect live to dataset](media/service-premium-connect-tools/dataset-live-connect.png)

The other way users can connect is by using **Get Data** > **Analysis Services**, specify a Power BI Premium workspace name as a URL,  select **Connect live**, and then in Navigator, select a dataset . In this case, Power BI Desktop uses the XMLA endpoint to connect live to the dataset as though it were an Analysis Services data model. 

![Connect live to Analysis Services dataset](media/service-premium-connect-tools/as-live-connect.png)

Organizations that have existing reports connected live to Analysis Services data models intending to migrate to Power BI premium datasets only have to change the server name URL in **Transform data** > **Data source settings**.

> [!NOTE]
> During XMLA read-write public preview, when using Power BI Desktop to connect to a Power BI Premium dataset by using **Get Data** > **Analysis Services**, and selecting the **Connect live** option, publishing a report to the Power BI service is not yet supported.

## Audit logs

When applications connect to a workspace, access through XMLA endpoints is logged in the Power BI audit logs with the following operations:

|Operation friendly name   |Operation name   |
|---------|---------|
|Connected to Power BI dataset from an external application      |  ConnectFromExternalApplication        |
|Requested Power BI dataset refresh from an external application      | RefreshDatasetFromExternalApplication        |
|Created Power BI dataset from an external application      |  CreateDatasetFromExternalApplication        |
|Edited Power BI dataset from an external application     |  EditDatasetFromExternalApplication        |
|Deleted Power BI dataset from an external application      |  DeleteDatasetFromExternalApplication        |

To learn more, see [Auditing Power BI](service-admin-auditing.md).

## See also

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)




