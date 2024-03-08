---
title: "Connect to Snowflake and Databricks with Power Query Online"
description: Learn how to connect to Snowflake, Databricks and others with Power Query Online in Power BI Report Builder.
ms.date: 03/07/2024
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cookiemccray
---
# Connect to Snowflake, Databricks and others with Power Query Online in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In Power BI Report Builder, you can create paginated reports that are optimized for printing and sharing. You can connect to various data sources, such as SQL Server, Azure SQL Database, Dataverse, and more. But what if you want to connect to data sources that aren't natively supported by Power BI Report Builder, such as Snowflake, Databricks, AWS Redshift, and others? 

That's where Power Query Online comes in. Power Query Online is a data transformation and mashup engine that lets you access and transform data from hundreds of sources. You can use Power Query Online to connect to these data sources from Power BI Report Builder, and create datasets that you can use in your paginated reports. This is a new feature that is currently in preview, and we are excited to share it with you.  

## Prerequisites 

To use the new Get Data feature in Power BI Report Builder, you need to have the latest version of Power BI Report Builder installed on your machine. You can [download it].  

You also need to sign in to Power BI Report Builder with your Power BI account.

## Get started 

 

Follow these steps to connect to a data source using Power Query Online: 

- Select Get Data from the toolbar, or right-click on Data Sources or Datasets in the Report Data pane. 

 

    OR 

 

    OR 

 

 

After you select **Get data**, you must select the data source that you want to connect to from the list, or search for it by name or category. For example, select Snowflake, a cloud data warehouse service. 

A screenshot of a computer



 

Enter the required information to connect to the data source, such as the server name, database name, and authentication method.  

A screenshot of a computer



You can either use an existing shareable cloud connection or create a new connection. Learn more about shareable cloud connections. 

A screenshot of a computer



Once you select/create a connection, select **Next**. Select the tables that you want to use in your report and select Transform Data.  

A screenshot of a computer



This will open the Power Query Editor, where you can transform and load your data. All power query editor functionality is available. Learn more about Power Query. 

As an example, I merged 3 tables in the Power Query Editor to create a new merged table named **ALL_Merged**. 

A screenshot of a computer

> [!NOTE]
> The **Enable load** option must be selected for the dataset/table to be loaded correctly in Power BI Report builder. 

A screenshot of a computer



- Select **Create** to add the data source and the dataset to Power BI Report Builder. You will see a success message and you need to select **OK** for the dataset and data source to be created. 
- You can see the data source (**PowerQuery**) and the dataset in the Report Data pane, under Data Sources and Datasets respectively. You can also see the fields and the data types of the dataset in the Fields window. You can use these fields to design your paginated report. 

 

A screenshot of a computer

 

 

## Edit an RDL Dataset created using Get Data 

You can edit the RDL dataset via the Get Data experience. For this, right-click the dataset and select **Edit Mashup**. This will open the power query editor where you can edit the M query. 

<Add image> 

 
> [!NOTE]
> If you had defined a parameter, you may have to define it again if the field is not part of the new M- query. 

## Next steps 

Once you have a dataset that you created using Power Query Online, you can use it to create a paginated report in Power BI Report Builder, like you would with any other RDL dataset. You can use the report design tools, such as the Report Wizard, the Toolbox, the Properties window, and the Grouping pane, to design the layout, the data regions, the expressions, and the groups of your report. 

When you are done with the report design, you can save the report to your local machine, or publish it to the Power BI service, where you can share it with others, or view it in the Power BI mobile app. 

## Considerations and limitations

- Only one dataset per M query is supported unless other data source is **Enter data**. 

- The last query in the **Queries** window in the power query editor will be used to generate the RDL dataset.  

- Dataset (thus query name to execute) must be CLS compliant. 

- Gateway data sources aren't supported even though you connect in Mashup Editor 

- In the Power BI Service,  only OAuth2, Basic, and no auth (Enter Data) supported.  No SSO. 

- Parameters aren't automatically bound in Power BI Report builder. You must bind parameters like any other data source.

## Related content  

- [Use accessibility tools to create accessible paginated reports(Power BI Report Builder)](paginated-use-accessibility-tools.md)
- [Accessibility features in paginated reports (Power BI Report Builder)](paginated-create-accessible-reports.md)
- [Use accessibility tools to interact with paginated reports (Power BI Report Builder)](paginated-consume-accessible-reports.md)
