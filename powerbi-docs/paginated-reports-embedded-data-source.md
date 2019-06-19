---
title: "Embedded data sources for paginated reports in the Power BI service"
description: In this article, you learn how to create and modify an embedded data source in a paginated report in the Power BI service.
author: maggiesMSFT
ms.author: maggies
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 06/06/2019
---

# Create an embedded data source for paginated reports in the Power BI service

In this article, you learn how to create and modify an embedded data source for a paginated report in the Power BI service. You define an embedded data source in a single report, and use it only in that report. Currently, paginated reports published to the Power BI service need embedded datasets and embedded data sources, and can connect to these data sources:

- Azure Analysis Services
- Azure SQL Database and 
- Azure SQL Data Warehouse
- SQL Server
- SQL Server Analysis Services
- Oracle 
- Teradata 

For the following data sources, use the [SQL Server Analysis Services connection](service-premium-connect-tools.md) option:

- Power BI Premium datasets

Paginated reports connect to on-premises data sources by way of a [Power BI gateway](service-gateway-getting-started.md). You set up the gateway after you publish the report to the Power BI service.

See [Report Data in Power BI Report Builder](report-builder-data.md) for more detailed information.

## Create an embedded data source
  
1. Open Power BI Report Builder.

1. On the toolbar in the Report Data pane, select **New** > **Data Source**. The **Data Source Properties** dialog box opens.

    ![New Data Source](media/paginated-reports-embedded-data-source/power-bi-paginated-new-data-source.png)
  
2.  In the **Name** text box, type a name for the data source or accept the default.  
  
3.  Select **Use a connection embedded in my report**.  
  
1.  From the **Select connection type** list, select a data source type. 

1.  Specify a connection string by using one of these methods:  
  
    -   Type the connection string directly in the **Connection string** text box. 
  
    -   Select the expression (**fx)** button to create an expression that evaluates to a connection string. In the **Expression** dialog box, type the expression in the Expression pane. Select **OK**. 
  
    -   Select **Build** to open the **Connection Properties** dialog box for the data source you chose in step 2.  
  
        Fill in the fields in the **Connection Properties** dialog box as appropriate for the data source type. Connection properties include the type of data source, the name of the data source, and the credentials to use. After you specify values in this dialog box, select **Test Connection** to verify that the data source is available and that the credentials you specified are correct.  
  
4.  Select **Credentials**.  
  
     Specify the credentials to use for this data source. The owner of the data source chooses the type of credentials that are supported. For more information, see [Specify Credential and Connection Information for Report Data Sources](https://docs.microsoft.com/sql/reporting-services/report-data/specify-credential-and-connection-information-for-report-data-sources).
  
5.  Select **OK**.  
  
     The data source appears in the Report Data pane.  
     
## Limitations and Considerations

Paginated reports connecting to Power BI datasets follow the rules for shared datasets in Power BI with some minor changes.  For users to properly view paginated reports using Power BI datasets, and to ensure  row-level security (RLS) is enabled and enforced for your viewers, make sure you follow these rules:

### Classic apps and app workspaces

RDL in same workspace as dataset (same owner)	- Supported
RDL in different workspace as dataset (same owner)	- Supported
Shared Rdl	- You need build permissions assigned for each user viewing the report at the dataset level
Shared App	- You need build permissions assigned for each user viewing the report at the dataset level
RDL in same workspace as dataset (different user)	- Supported
RDL in different workspace as dataset (different user)	- You need build permissions assigned for each user viewing the report at the dataset level
Role level security	- You need build permissions assigned for each user viewing the report at the dataset level to have it enforced.

Apps/App Workspace (New Experience)

RDL in same workspace as dataset - Supported
RDL in different workspace as dataset (same owner)	- Supported
Shared Rdl	- You need build permissions assigned for each user viewing the report at the dataset level
Shared App	-  You need build permissions assigned for each user viewing the report at the dataset level
RDL in same workspace as dataset (different user) - Supported
RDL in different workspace as dataset (different user)	- - You need build permissions assigned for each user viewing the report at the dataset level
Role level security - You need build permissions assigned for each user viewing the report at the dataset level to have it enforced

## Next steps

- [Create an embedded dataset for a paginated report in the Power BI service](paginated-reports-create-embedded-dataset.md)
- [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)
