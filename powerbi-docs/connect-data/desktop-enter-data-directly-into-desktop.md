---
title: Enter data directly into Power BI Desktop
description: Find out how to easily add data directly into Power BI Desktop to use that data in your reports and visualizations.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/05/2023
LocalizationGroup: Connect to data
---
# Enter data directly into Power BI Desktop

With Power BI Desktop, you can enter data directly and use that data in your reports and visualizations. For example, you can copy portions of a workbook or web page, then paste it into Power BI Desktop.

To enter data directly into Power BI Desktop in the form of a new table, select **Enter data** from the **Home** ribbon.

![Screenshot shows the Enter Data item to select in the Home ribbon.](media/desktop-enter-data-directly-into-desktop/enter-data-directly_1.png)

Power BI Desktop might attempt to make minor transformations on the data, if appropriate, just like it does when you load data from any source. For example, in the following case it promoted the first row of data to headers.

![Screenshot shows the Create Table dialog with added data where the first row is column titles.](media/desktop-enter-data-directly-into-desktop/enter-data-directly_2.png)

If you want to shape the data you entered or pasted, select **Edit** to open **Power Query Editor**. You can shape and transform the data before bringing it into Power BI Desktop. Select **Load** to import the data as it appears.

When you select **Load**, Power BI Desktop creates a new table from your data, and makes it available in the **Fields** pane. In the following image, Power BI Desktop shows your new table, called **Table**, and the two fields within that table that were created.

![Screenshot shows the table created with the two fields loaded into Power BI Desktop.](media/desktop-enter-data-directly-into-desktop/enter-data-directly_3.png)

And that’s it. It's that easy to enter data into Power BI Desktop.

You're now ready to use the data in Power BI Desktop. You can create visuals, reports, or interact with any other data you might want to connect with and import, such as Excel workbooks, databases, or any other data source.

> [!NOTE]
> To update, add, or delete data within items created by **Enter Data**, changes must be made in Power BI Desktop, and published.
> Data updates cannot be made directly from the Power BI service.

## Related content

There are all sorts of data you can connect to using Power BI Desktop. For more information on data sources, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](/power-query/connectors/excel)
* [Connect to CSV files in Power BI Desktop](/power-query/connectors/text-csv)
