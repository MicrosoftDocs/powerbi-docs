---
title: "Create an embedded data source and embedded dataset for a paginated report in the Power BI service | Microsoft Docs"
description: In this article, you learn how to create an embedded dataset in a paginated report in the Power BI service.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: conceptual
ms.date: 08/20/2018
ms.author: maggies
---
# Create an embedded data source and embedded dataset for a paginated report in the Power BI service
Embedded datasets are contained in a single paginated report, for use in that report. To create a dataset, you need a data source. Currently, paginated reports published to the Power BI service need embedded datasets and embedded data sources. You create the embedded data source and dataset in Report Builder, while you're creating your report. Here's how you can create both by using the wizards in Report Builder.
  
## Create the embedded data source
  
1.  Start Report Builder from your computer.  
  
     The **Getting Started** dialog box opens.  
  
     "Report Builder Get Started" image
  
     If the **Getting Started** dialog box doesn't open, select **File** > **New**. The **New Report or Dataset** dialog box is similar to the **Getting Started** dialog box.  
  
2.  In the left pane, verify that **New Report** is selected.  
  
3.  In the right pane, select any of the wizards. 
  
4.  In the **Choose a dataset** page, select **Create a dataset** > **Next**.  
  
5.  In the **Choose a connection to a data source** page, select **New**.  
  
6. In the **Data Source Properties** dialog box, give the data source a name, using characters and underscores.
  
7.  Select the **Select connection type**. Currently, paginated reports in Power BI can connect to these data sources:

    - Azure SQL Database and Data Warehouse
    - SQL Server (via a gateway)
    - SQL Server Analysis Services (via a gateway)
  
8.  Select **Build** next to the **Connection string** box.  

1. Enter the **Server name** and authentication information, then **Select a database name**.

10. Select **Test Connection**. 

    If everything is correct, you see a **Test connection succeeded** message.

11. Select **OK**, then **OK** again.

1. In the **Choose a connection to a data source** page, make sure your new data source is selected (you see "(in this Report)" below the name) > select **Next**.  
  
  
## Create the embedded dataset
  
1. In the **Design a query** page, select tables and fields in this view. You can also select **Text** to write a query using the query language of the data source or **Import** to import the query from an existing report.  

2. Add filters or parameters and group or aggregate the fields.

1. Select **Run Query** to test it, then select **Next**. 

1. Depending on which wizard you selected, **Arrange fields** and **Choose the layout** for your table, matrix, chart, or map.

5. In a table or matrix, expanding and collapsing groups isn't currently supported, so clear **Expand/collapse groups**.
  
6. Select **Next**. On the **Preview** page, you see the fields and layout you've chosen. Select **Finish**. 
  
   The data source, dataset, and dataset field collection appear in the Report Data pane, and you can continue designing your paginated report.  
 
 
## Next steps 

[What are paginated reports in Power BI Premium? (Preview)](paginated-reports-report-builder-power-bi.md)  
