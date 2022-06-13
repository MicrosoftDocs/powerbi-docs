---
title: Get started with datamarts (preview)
description: Begin using datamarts with sample data and examples
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 05/24/2022
LocalizationGroup: Data from files
---

# Get started with datamarts

This article describes how to get started using datamarts, including various sample data that can jump-start your experience. You'll learn about sample datasets you can use with datamarts, how to create datamarts from scratch, how to rename or delete a datamart, and other helpful information to get you acquainted and proficient with datamarts.

## Sample data

You can use the following various types of sample data to explore datamarts. All of the following resources contain free sample data:

* [Eight Departmental Samples in Excel workbook format](/power-bi/create-reports/sample-datasets), which are Excel versions of the Power BI built-in samples containing the datasets from numerous use cases:
    * Customer profitability
    * IT spend analysis
    * Human resources
    * Opportunity analysis
    * Procurement analysis
    * Retail analysis
    * Sales and marketing supplier quality analysis

* A [financial data sample workbook](/power-bi/create-reports/sample-financial-download), which is a simple flat table in an Excel file available for download. It contains anonymous data with fictitious products including sales divided by segments and region.
* An Excel workbook version of the [AdventureWorks dimensional model](/power-bi/create-reports/desktop-dimensional-model-report), in a tutorial that walks you through creating a Power BI report with the data.
* [COVID 19 world data](https://github.com/CSSEGISandData/COVID-19) is based on data from Johns Hopkins University. Before publishing this data, we recommend reviewing the [disclaimers article](/power-bi/create-reports/sample-covid-19-us).
* [Northwind Traders OData feed](https://services.odata.org/Northwind/Northwind.svc), data from a fictitious organization that manages orders, products, customers, suppliers, and many other aspects of a small business.

You can also start using datamarts from any dataflow you currently have as well. Starting from an existing dataflow will copy data into your datamart, at which point you can apply other transformations or just use it as a data source to explore datamarts.


## Create a datamart

To create a datamart, navigate to your existing Power BI Premium Gen 2, Premium per capacity (PPC), or Premium Per User (PPU) workspace. Datamarts require a Premium Gen2 subscription. In your Premium Gen 2 workspace, select **+ New** and then select **Datamart (Preview) to create a datamart.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-01.png" alt-text="Screenshot of create new datamart.":::

It usually takes approximately 20 seconds to provision a new datamart. Once initialized, you can load data into your datamart. For more information about getting data into a datamart, see the [get and transform data](#get-and-transform-data) section in this article.


## Access or load an existing datamart

To access an existing datamart, navigate to your Power BI Premium Gen 2 workspace and find your datamart from the overall list of data items in your workspace, as shown in the following image. 

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-02.png" alt-text="Screenshot of finding an existing datamart from all items.":::

You can also select the **Datamarts (Preview)** tab in your Premium Gen 2 workspace, and see a list of available datamarts.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-03.png" alt-text="Screenshot of select datamart from list of datamarts.":::

Select the datamart name to load the datamart.

## Manage datamart refresh

You can refresh a datamart in two ways: 

1.	From the datamart context menu, select **Refresh now** or select **Scheduled refresh**.

    :::image type="content" source="media/datamarts-get-started/datamarts-get-started-04.png" alt-text="Screenshot of datamart context menu for refresh.":::

2.	From the datamart settings page, select **Scheduled refresh**

    :::image type="content" source="media/datamarts-get-started/datamarts-get-started-05.png" alt-text="Screenshot of scheduled refresh for a datamart in the settings page.":::

To set up incremental refresh for a datamart, select the table for which you want to set up incremental refresh for in the datamart editor. In the **Table tools** ribbon, select the **Incremental refresh** icon, and a right pane appears enabling you to configure incremental refresh for the selected table.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-06.png" alt-text="Screenshot of configure incremental refresh for a table in a datamart.":::

## Rename a datamart

There are two ways to rename a datamart:

First, from within the **Datamart editor**, select the datamart name from the top of the editor and edit the datamart name in the window that appears, as shown in the following image. Click on the ribbon outside of the rename window to save the new name.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-07.png" alt-text="Screenshot of renaming a datamart.":::

Alternatively, you can change the datamart name from the workspace list view. Select the more menu (...) next to the datamart name in the workspace view. 

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-08.png" alt-text="Screenshot of selecting the context menu from a datamart in the workspace.":::

From the menu that appears, select *Rename*.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-09.png" alt-text="Screenshot of renaming a datamart from the workspace.":::

When you rename a datamart, the auto-generated dataset based on that datamart is also automatically renamed.


## Delete a datamart

To delete a datamart, navigate to the workspace and find the datamart you want to delete. Select the more menu (...) and select *Delete* from the menu that appears.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-10.png" alt-text="Screenshot of deleting a datamart from the workspace.":::

Datamart deletion is *not* immediate, and requires a few days to complete.

## Get and transform data

There are many ways to connect to data and transform it in a datamart. For general information about data in Power BI, see [connect to data in Power BI](/power-bi/connect-data/).

To load data into your datamart, open your datamart (or create a new datamart) and select **Get Data**.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-11.png" alt-text="Screenshot of connecting to data for a datamart.":::

If you choose to get data from another source, a data source selection window appears where you can select from a multitude of data sources. 

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-12.png" alt-text="Screenshot of different data sources for a datamart.":::


You can also drag and drop files from your computer to load data into your datamart, such as Excel files. Some data sources may require parameters or connection strings to properly connect.

Once connected, select the tables you want to load into your datamart. You can apply transformations to your selected data and load the data into the datamart. Once the data is loaded, the tables are imported into your datamart. You can monitor the  progress in the status bar.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-13.png" alt-text="Screenshot of loading data for a datamart.":::

For each table you select, a corresponding view is created in the datamart that appears in the **Object explorer** in **Data View**.


## Model data

To model your data, navigate to **Model view** by selecting on the **Model View** icon at the bottom of the window, as shown in the following image.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-14.png" alt-text="Screenshot of the model view icon.":::

### Create a measure

To create a [measure](../desktop-measures.md) (a measure is a collection of standardized metrics) select the table in the **Table Explorer** and select the **New Measure** button in the ribbon, as shown in the following image.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-15.png" alt-text="Screenshot of creating a measure.":::

Enter the measure into the formula bar and specify the table and the column to which it applies. The formula bar lets you enter your measure. Similar to Power BI Desktop, the DAX editing experience in datamarts presents a rich editor complete with auto-complete for formulas (intellisense). The DAX editor enables you to easily develop measures right in datamart, making it a more effective single source for business logic, semantics, and business critical calculations.

You can expand the table to find the measure in the table.

### Create a relationship

To create a relationship in a datamart, select the **Model view** and select your datamart, then drag the column from one table to the column on the other table to initiate the relationship. In the window that appears, configure the relationship properties.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-16.png" alt-text="Screenshot of creating a relationship.":::

Select the **Confirm** button when your relationship is complete to save the relationship information.

### Hide elements from downstream reporting

You can hide elements of your datamart from downstream reporting by selecting **Data view** and right-clicking on the column or table you want to hide. Then select **Hide in report view** from the menu that appears to hide the item from downstream reporting.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-17.png" alt-text="Screenshot of hiding an element from downstream reporting.":::

You can also hide the entire table and individual columns by using the **Model view** canvas options, as shown in the following image.

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-18.png" alt-text="Screenshot of hiding an entire table from downstream reporting.":::



### Access auto-generated datasets

To access auto-generated datasets, go to the Premium Gen 2 workspace and find the dataset that matches the name of the datamart. 

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-19.png" alt-text="Screenshot of finding a dataset.":::

To load the dataset, click the name of the dataset. 

:::image type="content" source="media/datamarts-get-started/datamarts-get-started-20.png" alt-text="Screenshot of loading a dataset." lightbox="media/datamarts-get-started/datamarts-get-started-20.png":::


## Next steps
This article provided sample data and instructions on how to create and interact with datamarts. 

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Understand datamarts](datamarts-understand.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Create reports with datamarts](datamarts-create-reports.md)
* [Access control in datamarts](datamarts-access-control.md)
* [Datamart administration](datamarts-administration.md)

For more information about dataflows and transforming data, see the following articles:
* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)




