---
title: "Create embedded data sources for paginated reports in the Power BI service"
description: In this article, you learn how to create and modify an embedded data source in a paginated report in the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 10/19/2021
---

# Create an embedded data source for paginated reports in the Power BI service

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)] 

In this article, you learn how to create and modify an embedded data source for a paginated report in the Power BI service. You define an embedded data source in a single report, and use it only in that report. Paginated reports published to the Power BI service can't use shared datasets and data sources. Here are some of the data sources you can connect to:

- Azure SQL Database and Azure Synapse Analytics (via Basic and oAuth)
- Azure Analysis Services (via SSO)
- SQL Server via a gateway
- Power BI datasets
- Oracle
- Teradata

See [Supported data sources for Power BI paginated reports](paginated-reports-data-sources.md) for a complete list.

Paginated reports connect to on-premises data sources by way of a [Power BI gateway](../connect-data/service-gateway-onprem.md). You set up the gateway after you publish the report to the Power BI service.

See [Understanding report data in Power BI Report Builder](report-builder-data.md) for more background.


## Prerequisites 

- To publish a Power BI paginated report to the Power BI service, you need a [Power BI Pro](../fundamentals/service-self-service-signup-for-power-bi.md) license, or [Premium Per User (PPU)](../admin/service-premium-per-user-faq.yml) license, and write access to a workspace in a Power BI Premium capacity.

## Create an embedded data source
  
1. Open Power BI Report Builder.

1. On the toolbar in the Report Data pane, select **New** > **Data Source**. The **Data Source Properties** dialog box opens.

   ![New Data Source](media/paginated-reports-embedded-data-source/power-bi-paginated-new-data-source.png)
  
1. In the **Name** text box, type a name for the data source or accept the default.  
  
1. Select **Use a connection embedded in my report**.  
  
1. From the **Select connection type** list, select a data source type. 

1. Specify a connection string by using one of these methods:  
  
   - Type the connection string directly in the **Connection string** text box. 
  
   - Select **Build** to open the **Connection Properties** dialog box for the data source you chose in step 2.  
  
     Fill in the fields in the **Connection Properties** dialog box as appropriate for the data source type. Connection properties include the type of data source, the name of the data source, and the credentials to use. After you specify values in this dialog box, select **Test Connection** to verify that the data source is available and that the credentials you specified are correct.  
  
1. Select **Credentials**.  
  
   Specify the credentials to use for this data source. The owner of the data source chooses the type of credentials that are supported. For more information, see [Specify Credential and Connection Information for Report Data Sources](/sql/reporting-services/report-data/specify-credential-and-connection-information-for-report-data-sources).
  
1. Select **OK**.  
  
   The data source appears in the Report Data pane.

## Considerations and limitations

Paginated reports connecting to Power BI datasets follow the rules for shared datasets in Power BI with some minor changes.  For users to properly view paginated reports using Power BI datasets, and to ensure row-level security (RLS) is enabled and enforced for your viewers, make sure you follow these rules:

### Classic apps and workspaces

- .rdl in same workspace as dataset (same owner): Supported
- .rdl in different workspace as dataset (same owner): Supported
- Shared .rdl: You need Read permission assigned for each user viewing the report at the dataset level
- Shared app: You need Read permission assigned for each user viewing the report at the dataset level
- .rdl in same workspace as dataset (different user): Supported
- .rdl in different workspace as dataset (different user):You need Read permission assigned for each user viewing the report at the dataset level
- Role-level security: You need Read permission assigned for each user viewing the report at the dataset level to have it enforced.

### New experience apps and workspaces

- .rdl in same workspace as dataset: Supported
- .rdl in different workspace as dataset (same owner): Supported
- Shared .rdl: You need Read permission assigned for each user viewing the report at the dataset level
- Shared app: You need Read permission assigned for each user viewing the report at the dataset level
- .rdl in same workspace as dataset (different user) - Supported
- .rdl in different workspace as dataset (different user): You need Read permission assigned for each user viewing the report at the dataset level
- Role-level security: You need Read permission assigned for each user viewing the report at the dataset level to have it enforced

## Next steps

- [Create an embedded dataset for a paginated report in the Power BI service](paginated-reports-create-embedded-dataset.md)
- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)
