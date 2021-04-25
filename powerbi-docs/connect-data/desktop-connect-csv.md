---
title: Connect to CSV files in Power BI Desktop
description: Easily connect to and use CSV file data in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 04/19/2021
LocalizationGroup: Connect to data
---
# Connect to CSV files in Power BI Desktop
Connecting to a comma-separated value (*CSV*) file from Power BI Desktop is a lot like connecting to an Excel workbook. Both are easy, and this article steps you through how to connect to any CSV file to which you have access.

To start with, from Power BI Desktop select **Get Data** > **Text/CSV** from the **Home** ribbon.

![Screenshot of Get Data menu.](media/desktop-connect-csv/connect-to-csv_1.png)

Select your CSV file from the **Open** dialog that appears.

![Screenshot of Open dialog.](media/desktop-connect-csv/connect-to-csv_2.png)

When you select **Open**, Power BI Desktop accesses the file and determines certain file attributes, such as the file origin, delimiter type, and how many rows should be used to detect the data types in the file.

These file attributes and options are shown in the drop-down selections at the top of the **CSV import** dialog window, shown below. You can change any of these detected settings manually, by choosing another option from any of the drop-down selectors.

![Screenshot of the C S V import dialog window.](media/desktop-connect-csv/connect-to-csv_3.png)

When you’re satisfied with the selections, you can select **Load** to import the file into Power BI Desktop, or you can select **Edit** to open **Power Query Editor** and further shape or transform the data before importing it.

Once you load the data into Power BI Desktop, you see the table and its columns (which are presented as Fields in Power BI Desktop) in the **Fields** pane, along the right of the Report view in Power BI Desktop.

![Screenshot of Power B I Desktop window showing the Fields pane.](media/desktop-connect-csv/connect-to-csv_4.png)

That’s all you have to do – the data from your CSV file is now in Power BI Desktop.

You can use that data in Power BI Desktop to create visuals, reports, or interact with any other data you might want to connect with and import, such as Excel workbooks, databases, or any other data source.

> [!IMPORTANT]
> When you import a CSV file, Power BI Desktop generates a *columns=x* (where *x* is the number of columns in the CSV file during initial import) as a step in Power Query Editor. If you subsequently add more columns and the data source is set to refresh, any columns beyond the initial *x* count of columns are not refreshed. 


## Next steps
There are all sorts of data you can connect to using Power BI Desktop. For more information on data sources, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data Sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and Combine Data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](desktop-connect-excel.md)   
* [Enter data directly into Power BI Desktop](desktop-enter-data-directly-into-desktop.md)   
