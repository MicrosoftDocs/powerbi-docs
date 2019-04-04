---
title: Data View in Power BI Desktop
description: Data View in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Model your data
---
# Data View in Power BI Desktop
**Data View** helps you inspect, explore, and understand data in your **Power BI Desktop** model. It's different from how you view tables, columns, and data in **Query Editor**. With Data View, you’re looking at your data *after* it has been loaded into the model.

When you’re modeling your data, sometimes you want to see what’s actually in a table or column without creating a visual on the report canvas, often right down to the row level. This is especially useful when you’re creating measures and calculated columns, or you need to identify a data type or data category.

Let’s take a closer look at some of the elements found in **Data View**.

![Data view in Power BI Desktop](media/desktop-data-view/dataview_fullscreen.png)

1. **Data View icon** – Select this icon to enter Data View.

2. **Data Grid** – This shows the selected table and all columns and rows in it. Columns hidden from **Report View** are greyed out. You can right-click on a column for options.

3. **Modeling ribbon** – Here you can manage relationships, create calculations, change data type, format, data category for a column.

4. **Formula bar** – Enter DAX formulas for Measures and Calculated columns.

5. **Search** – Search for a table or column in your model.

6. **Fields list** – Select a table or column to view in the data grid.

## Filtering in Data View

You can also filter and sort data in **Data View**. Each column shows an icon that identifies the sort direction (if applied).

![Sort and filter in Data view in Power BI Desktop](media/desktop-data-view/dataview_sort-and-filter.png)

You can filter individual values, or use advanced filtering based on the data in the column. 

> [!NOTE]
> When a Power BI model is created in a different culture than your current user interface (for example, the model was created in US English and you are viewing it in Spanish), the search box will not appear in the Data View user interface for anything other than text fields.
