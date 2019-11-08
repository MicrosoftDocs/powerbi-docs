---
title: "Auto date/time in Power BI Desktop"
description: Understand auto date/time functionality in Power BI Desktop.
author: peter-myers
manager: asaxton
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 10/23/2019
ms.author: v-pemyer
---

# Auto date/time in Power BI Desktop

This article targets data modelers developing Import or Composite models in Power BI Desktop.

## Background

_Auto date/time_ is a data load option in Power BI Desktop. The purpose of this option is to support convenient time intelligence reporting based on date columns loaded into a model. Specifically, it allows report authors to filter, group, and drill down by using calendar time periods without requiring the modeler to explicitly develop them. Calendar time periods include years, quarters, months, and days.

When the option is enabled, Power BI Desktop creates a hidden auto date/time table for each date column, providing all of the following conditions are true:

- The table storage mode is Import
- The column data type is date or date/time
- The column isn't the "many" side of a model relationship

## How it works

Each auto date/time table is in fact a [calculated table](desktop-calculated-tables.md) that generates rows of data by using the DAX [CALENDAR](/dax/calendar-function-dax) function. Each table also includes six calculated columns: **Day**, **MonthNo**, **Month**, **QuarterNo**, **Quarter**, and **Year**.

> [!NOTE]
> The column names and values are translated and formatted according to the [model language](supported-languages-countries-regions.md#choose-the-language-for-the-model-in-power-bi-desktop).

A relationship is also created between the auto date/time table's **Date** column and the model date column.

The auto date/time table is loaded with full calendar years encompassing all date values stored in the model date column. For example, if the earliest value in a date column is March 20, 2016 and the latest value is October 23, 2019, the table would contain 1,461 rows. It represents one row for each date in the four calendar years 2016 to 2019. When the model is refreshed, each auto date/time table is also refreshed to ensure that it always contains dates that encompass the date column values.

If it was possible to see the rows of an auto date/time table, they may look like this:

![Example of what rows of an auto date/time table may look like. Displays seven columns: Date, Day, MonthNo, Month, QuarterNo, Quarter, and Year. Displays 10 rows of data describing dates from January 1, 2019 to January 10, 2019.](media/desktop-auto-date-time/auto-date-time-hidden-table-example-rows.png)

> [!NOTE]
> Auto date/time tables are permanently hidden, even from modelers. They cannot be seen in the **Fields** pane or the Model view diagram, and its rows cannot be seen in Data view. Also, the table and its column cannot be directly referenced by DAX expressions.

The table also defines a hierarchy, providing visuals with a drill down path through year, quarter, month, and day levels.

If it was possible to see an auto date/time table in the Model view diagram, it may look like this (related columns are highlighted):

![Example of what a hidden auto date/time table may look like. Displays two tables: Sales and LocalDateTime table. The tables are related based on the Sales table OrderDate column and the LocalDateTime table Date column. The LocalDateTime defines seven columns: Date, Day, Month, MonthNo, Quarter, QuarterNo, Year, and a single hierarchy. The hierarchy is named Date Hierarchy and consists of four levels: Year, Quarter, Month, and Day.](media/desktop-auto-date-time/auto-date-time-hidden-table-example-diagram.png)

## Work with auto date/time

When an auto date/time table exists for a date column (and that column is visible), report authors won't find that column as a field in the **Fields** pane. Instead, they'll find an expandable object that has the name of the date column. You can easily identify it because it's adorned with a calendar icon. When the report authors expands the calendar object, they'll find a hierarchy named **Date Hierarchy**. After they expand the hierarchy, they'll find four levels: **Year**, **Quarter**, **Month**, and **Day**.

![Example of the Fields pane, with the Sales table expanded open. It contains an OrderDate field, adorned with the calendar icon. It's expanded open and contains a hierarchy named Date Hierarchy. It, too, is expanded and contains four levels: Year, Quarter, Month, and Day.](media/desktop-auto-date-time/auto-date-time-fields-pane-example.png)

The auto date/time generated hierarchy can be used to configure a visual in exactly the same way that regular hierarchies can be used. Visuals can be configured by using the entire **Date Hierarchy** hierarchy, or specific levels of the hierarchy.

There is, however, one added capability not supported by regular hierarchies. When the auto date/time hierarchy—or a level from the hierarch—is added to a visual well, the report author can toggle between using the hierarchy or the date column. This approach makes sense for some visuals, when all you require is the date column, not the hierarchy and its levels. You start by configuring the visual field (right-click the visual field, or click the down-arrow), and then use the context menu to switch between the date column or the date hierarchy.

![Example of a visual field configuration for the OrderDate hierarchy. The open context menu  displays two options allowing the toggling to use the OrderDate column or the Date Hierarchy.](media/desktop-auto-date-time/auto-date-time-configure-visuals-fields.png)

Lastly, model calculations, written in DAX, can reference a date column directly, or the hidden auto date/time table columns indirectly.

Formula written in Power BI Desktop can reference a date column in the usual way. The auto date/time table columns, however, must be referenced by using a special extended syntax. You start by first referencing the date column, and then following it by a period (.). The formula bar auto complete will then allow you to select a column from the auto date/time table.

![Example of entering a DAX measure expression in the formula bar. The formula so far reads Date Count = COUNT(Sales[OrderDate]. and an auto complete list presents all seven columns from the hidden auto date/time table. These columns are: Date, Day, Month, MonthNo, Quarter, QuarterNo, and Year.](media/desktop-auto-date-time/auto-date-time-dax-auto-complete.png)

In Power BI Desktop, a valid measure expression could read:

```dax
Date Count = COUNT(Sales[OrderDate].[Date])
```

> [!NOTE]
> While this measure expression is valid in Power BI Desktop, it's not correct DAX syntax. Internally, Power BI Desktop transposes your expression to reference the true (hidden) auto date/time table column.

## Configure auto date/time option

Auto date/time can be configured _globally_ or for the _current file_. The global option applies to new Power BI Desktop files, and it can be turned on or off at any time. For a new installation of Power BI Desktop, both options default to on.

The current file option, too, can also be turned on or off at any time. When turned on, auto date/time tables are created. When turned off, any auto date/time tables are removed from the model.

> [!CAUTION]
> Take care when turning the current file option off, as this will remove the auto date/time tables. Be sure to fix any broken report filters or visuals that had been configured to use them.

In Power BI Desktop select _File > Options and settings > Options_, and then select either the **Global** or **Current File** page. On either page, the option exists under the **Time intelligence** section.

![Configuring Power BI Desktop options. The Data Load page from the GLOBAL group is selected. In the Time Intelligence section, the Auto date/time for new files option is checked on.](media/desktop-auto-date-time/auto-date-time-configure-global-options.png)

## Next steps

For more information about auto date/time and related topics, check out the following resources:

- [Set and use date tables in Power BI Desktop](desktop-date-tables.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
