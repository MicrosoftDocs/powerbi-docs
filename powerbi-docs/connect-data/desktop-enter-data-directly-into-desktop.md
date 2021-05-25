---
title: Enter data directly into Power BI Desktop
description: Easily add data directly into Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 05/14/2020
LocalizationGroup: Connect to data
---
# Enter data directly into Power BI Desktop

With Power BI Desktop, you can enter data directly and use that data in your reports and visualizations. For example, you can copy portions of a workbook or web page, then paste it into Power BI Desktop.

To enter data directly into Power BI Desktop in the form of a new table, select **Enter data** from the **Home** ribbon.

![Select Enter Data in Home](media/desktop-enter-data-directly-into-desktop/enter-data-directly_1.png)

Power BI Desktop may attempt to make minor transformations on the data, if appropriate, just like it does when you load data from any source. For example, in the following case it promoted the first row of data to headers.

![Data with the first row as column titles](media/desktop-enter-data-directly-into-desktop/enter-data-directly_2.png)

If you want to shape the data you entered or pasted, select **Edit** to open **Power Query Editor**. You can shape and transform the data before bringing it into Power BI Desktop. Select **Load** to import the data as it appears.

When you select **Load**, Power BI Desktop creates a new table from your data, and makes it available in the **Fields** pane. In the following image, Power BI Desktop shows my new table, called *Table1*, and the two fields within that table that were created.

![Fields loaded into Power BI Desktop](media/desktop-enter-data-directly-into-desktop/enter-data-directly_3.png)

And that’s it. It's that easy to enter data into Power BI Desktop.

You're now ready to use the data in Power BI Desktop. You can create visuals, reports, or interact with any other data you might want to connect with and import, such as Excel workbooks, databases, or any other data source.

> [!NOTE]
> To update, add, or delete data within items created by **Enter Data**, changes must be made in Power BI Desktop, and published.
> Data updates cannot be made directly from the Power BI service.

## Next steps

There are all sorts of data you can connect to using Power BI Desktop. For more information on data sources, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Data sources in Power BI Desktop](desktop-data-sources.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Connect to Excel workbooks in Power BI Desktop](desktop-connect-excel.md)
* [Connect to CSV files in Power BI Desktop](desktop-connect-csv.md)
