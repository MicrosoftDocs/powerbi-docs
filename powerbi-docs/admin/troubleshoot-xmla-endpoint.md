---
title: Troubleshoot XMLA endpoint connectivity in Power BI
description: Describes how to troubleshoot connectivity through the XMLA endpoint in Power BI Premium.
author: Minewiskan
ms.author: kfollis
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 11/16/2020
ms.custom: seodec18, css_fy20Q4
LocalizationGroup: Premium
---

# Troubleshoot XMLA endpoint connectivity

XMLA endpoints in Power BI Premium rely on the native Analysis Services communication protocol for access to Power BI datasets. Because of this, XMLA endpoint troubleshooting is much the same as troubleshooting a typical Analysis Services connection. However, some differences around Power BI-specific dependencies apply.

## Before you begin

Before troubleshooting an XMLA endpoint scenario, be sure to review the basics covered in [Dataset connectivity with the XMLA endpoint](service-premium-connect-tools.md). Most common XMLA endpoint use cases are covered there. Other Power BI troubleshooting guides, such as [Troubleshoot gateways - Power BI](../connect-data/service-gateway-onprem-tshoot.md) and [Troubleshooting Analyze in Excel](../collaborate-share/desktop-troubleshooting-analyze-in-excel.md), can also be helpful.

## Enabling the XMLA endpoint

The XMLA endpoint can be enabled on both Power BI Premium and Power BI Embedded capacities. On smaller capacities, such as an A1 capacity with only 2.5 GB of memory, you might encounter an error in Capacity settings when trying to set the XMLA Endpoint to **Read/Write** and then selecting **Apply**. The error states "There was an issue with your workload settings. Try again in a little while.".

Here are a couple things to try:

- Limit the memory consumption of other services on the capacity, such as Dataflows, to 40% or less, or disable an unnecessary service completely.  
- Upgrade the capacity to a larger SKU. For example, upgrading from an A1 to an A3 capacity solves this configuration issue without having to disable Dataflows.

Keep in-mind, you must also enable the tenant-level [Export data setting](service-premium-connect-tools.md#security) in the Power BI Admin Portal. This setting is also required for the Analyze in Excel feature.

## Establishing a client connection

After enabling the XMLA endpoint, it's a good idea to test connectivity to a workspace on the capacity. To learn more, see [Connecting to a Premium workspace](service-premium-connect-tools.md#connecting-to-a-premium-workspace). Also, be sure to read the section [Connection requirements](service-premium-connect-tools.md#connection-requirements) for helpful tips and information about current XMLA connectivity limitations.

### Connecting with a service principal

If you've enabled tenant settings to allow service principals to use Power BI APIs, as described in [Enable service principals](service-premium-service-principal.md#enable-service-principals), you can connect to an XMLA endpoint by using a service principal. Keep in mind the service principal requires the same level of access permissions at the workspace or dataset level as regular users.

To use a service principal, be sure to specify the application identity information in the connection string as:

- `User ID=<app:appid@tenantid>`
- `Password=<application secret>`

For example:

`Data Source=powerbi://api.powerbi.com/v1.0/myorg/Contoso;Initial Catalog=PowerBI_Dataset;User ID=app:91ab91bb-6b32-4f6d-8bbc-97a0f9f8906b@19373176-316e-4dc7-834c-328902628ad4;Password=6drX...;`

If you receive the following error:

"We cannot connect to the dataset due to incomplete account information. For service principals, make sure you specify the tenant ID together with the app ID using the format app:\<appId>@\<tenantId>, then try again."

Make sure you specify the tenant ID together with the app ID using the correct format.

It's also valid to specify the app ID without the tenant ID. However, in this case, you must replace the `myorg` alias in the data source URL with the actual tenant ID. Power BI can then locate the service principal in the correct tenant. But, as a best practice, use the `myorg` alias and specify the tenant ID together with the app ID in the User ID parameter.

### Connecting with Azure Active Directory B2B

With support for Azure Active Directory (Azure AD) business-to-business (B2B) in Power BI, you can provide external guest users with access to datasets over the XMLA endpoint. Make sure the [Share content with external users](service-admin-portal.md#export-and-sharing-settings) setting is enabled in the Power BI Admin portal. To learn more, see [Distribute Power BI content to external guest users with Azure AD B2B](service-admin-azure-ad-b2b.md).

## Deploying a dataset

You can deploy a tabular model project in Visual Studio (SSDT) to a Power BI Premium workspace much the same as to Azure Analysis Services. However, when deploying to a Power BI Premium workspace, there are some additional considerations. Be sure to review the section [Deploy model projects from Visual Studio (SSDT)](service-premium-connect-tools.md#deploy-model-projects-from-visual-studio-ssdt) in the Dataset connectivity with the XMLA endpoint article.

### Deploying a new model

In the default configuration, Visual Studio attempts to process the model as part of the deployment operation to load data into the dataset from the data sources. As described in [Deploy model projects from Visual Studio (SSDT)](service-premium-connect-tools.md#deploy-model-projects-from-visual-studio-ssdt), this operation can fail because data source credentials cannot be specified as part of the deployment operation. Instead, if credentials for your data source aren't already defined for any of your existing datasets, you must specify the data source credentials in the dataset settings using the Power BI user interface (**Datasets** > **Settings** > **Data source credentials** > **Edit credentials**). Having defined the data source credentials, Power BI can then apply the credentials to this data source automatically for any new dataset, after metadata deployment has succeeded and the dataset has been created.

If Power BI cannot bind your new dataset to data source credentials, you will receive an error stating "Cannot process database. Reason: Failed to save modifications to the server." with the error code "DMTS_DatasourceHasNoCredentialError", as shown below:

:::image type="content" source="media/troubleshoot-xmla-endpoint/deploy-refresh-error.png" alt-text="Model deployment error":::

To avoid the processing failure, set the **Deployment Options** > **Processing Options** to **Do not Process**, as shown in the following image. Visual Studio  then deploys only metadata. You can then configure the data source credentials, and click on **Refresh now** for the dataset in the Power BI user interface. For information about troubleshooting processing issues, see the section [Refreshing a dataset](#refreshing-a-dataset) later in this article.

:::image type="content" source="media/troubleshoot-xmla-endpoint/do-not-process.png" alt-text="Do not process option":::

### New project from an existing dataset

Creating a new tabular project in Visual Studio by importing the metadata from an existing dataset on a Power BI Premium workspace is not supported. However, you can connect to the dataset by using SQL Server Management Studio, script out the metadata, and reuse it in other tabular projects.

## Migrating a dataset to Power BI

It's recommended you specify the 1500 (or higher) compatibility level for tabular models. This compatibility level supports the most capabilities and data source types. Later compatibility levels are backwards compatible with earlier levels.

### Supported data providers

At the 1500 compatibility level, Power BI supports the following data source types:

- Provider data sources (legacy with a connection string in the model metadata).
- Structured data sources (introduced with the 1400 compatibility level).
- Inline M declarations of data sources (as Power BI Desktop declares them).

It's recommended you use structured data sources, which Visual Studio creates by default when going through the Import data flow. However, if you are planning to migrate an existing model to Power BI that uses a provider data source, make sure the provider data source relies on a supported data provider. Specifically, the Microsoft OLE DB Driver for SQL Server and any third-party ODBC drivers. For OLE DB Driver for SQL Server, you must switch the data source definition to the .NET Framework Data Provider for SQL Server. For third-party ODBC drivers that might be unavailable in the Power BI service, you must switch to a structured data source definition instead.

It's also recommended you replace the outdated Microsoft OLE DB Driver for SQL Server (SQLNCLI11) in your SQL Server data source definitions with the .NET Framework Data Provider for SQL Server.

The following table provides an example of a .NET Framework Data Provider for SQL Server connection string replacing a corresponding connection string for the OLE DB Driver for SQL Server.

|OLE DB Driver for SQL Server  |.NET Framework Data Provider for SQL Server   |
|---------|---------|
|`Provider=SQLNCLI11;Data Source=sqldb.database.windows.net;Initial Catalog=AdventureWorksDW;Trusted_Connection=yes;`    |   `Data Source=sqldb.database.windows.net;Initial Catalog=AdventureWorksDW2016;Integrated Security=SSPI;Encrypt=true;TrustServerCertificate=false`       |

### Cross-referencing partition sources

Just as there are multiple data source types, there are also multiple partition source types a tabular model can include to import data into a table. Specifically, a partition can use a query partition source or an M partition source. These partition source types, in turn, can reference provider data sources or structured data sources. While tabular models in Azure Analysis Services support cross-referencing these various data source and partition types, Power BI enforces a more strict relationship. Query partition sources must reference provider data sources, and M partition sources must reference structured data sources. Other combinations are not supported in Power BI. If you want to migrate a cross-referencing dataset, the following table describes supported configurations:  

|Data source   |Partition source   |Comments   |Supported in Power BI Premium with XMLA endpoint   |
|---------|---------|---------|---------|
|Provider data source      |   Query partition source      |   The AS engine uses the cartridge-based connectivity stack to access the data source.       |     Yes     |
|Provider data source      |   M partition source       |   The AS engine translates the provider data source into a generic structured data source and then uses the Mashup engine to import the data.       |    No     |
|Structured data source      |     Query partition source     |    The AS engine wraps the native query on the partition source into an M expression and then uses the Mashup engine to import the data.      |    No     |
|Structured data source      |    M partition source      |     The AS engine uses the Mashup engine to import the data.     |   Yes      |

## Refreshing a dataset

XMLA endpoints enable you to perform refresh operations against tabular models as well as datasets created in Power BI Desktop. To support the latter, make sure you specify the Enhanced storage format setting. This setting is required if you want to perform processing or other read/write operations by using the XMLA endpoint. You can find the setting in Power BI Desktop under Preview features. After setting, publish your PBIX solution again to your Power BI Premium workspace.  

Power BI returns the following error if you perform a refresh via the XMLA endpoint against a model without enhanced metadata: "The operation is only supported on model with property 'DefaultPowerBIDataSourceVersion' set to 'PowerBI_V3' in Power BI Premium."

### Data sources and impersonation

Impersonation settings you can define for provider data sources are not relevant for Power BI. Power BI uses a different mechanism based on dataset settings to manage data source credentials. For this reason, make sure you select **Service Account** if you are creating a Provider Data Source.

:::image type="content" source="media/troubleshoot-xmla-endpoint/impersonate-services-account.png" alt-text="Impersonate service account":::

### Fine-grained processing

When triggering a scheduled refresh or on-demand refresh in Power BI, Power BI typically refreshes the entire dataset. In many cases, it's more efficient to perform refreshes more selectively. You can perform fine-grained processing tasks in SQL Server Management Studio (SSMS) as shown below, or by using third-party tools or scripts.

:::image type="content" source="media/troubleshoot-xmla-endpoint/process-tables.png" alt-text="Process tables in SSMS":::

### Overrides in Refresh TMSL command

Overrides in [Refresh command (TMSL)](/analysis-services/tmsl/refresh-command-tmsl) allow users choosing a different partition query definition or data source definition for the refresh operation. Currently, **overrides are not supported** in Power BI Premium. An error,  "Out-of-line binding is not allowed in Power BI Premium. For additional information, see 'XMLA read/write support' in the product documentation." is returned.

## Errors in SSMS - Premium Gen 2

### Query execution

When connected to a workspace in a [Premium Gen2](service-premium-what-is.md#power-bi-premium-generation-2-preview) capacity, SQL Server Management Studio may display the following error:

```
Executing the query ...
Error -1052311437:
```

This occurs because client libraries installed with SSMS v18.7.1 do not support session tracing. This will be resolved in an upcoming release of SSMS.

### Refresh operations

When using SSMS v18.7.1 or lower to perform a long running (>1 min) refresh operation on a dataset in a Premium Gen2 capacity, SSMS may display an error like the following even though the refresh operation succeeds:

```
Executing the query ...
Error -1052311437:
The remote server returned an error: (400) Bad Request.

Technical Details:
RootActivityId: 3716c0f7-3d01-4595-8061-e6b2bd9f3428
Date (UTC): 11/13/2020 7:57:16 PM
Run complete
```

This is due to a known issue in the client libraries where the status of the refresh request is incorrectly tracked. This will be resolved in an upcoming release of SSMS.

## See also

[Dataset connectivity with the XMLA endpoint](service-premium-connect-tools.md)  
[Automate Premium workspace and dataset tasks with service principals](service-premium-service-principal.md)  
[Troubleshooting Analyze in Excel](../collaborate-share/desktop-troubleshooting-analyze-in-excel.md)  
[Tabular model solution deployment](/analysis-services/deployment/tabular-model-solution-deployment?view=power-bi-premium-current&preserve-view=true)
