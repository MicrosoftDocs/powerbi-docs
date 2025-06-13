---
title: Set and use date tables in Power BI Desktop
description: Learn what date tables are, how to use them, and why you might want to set your tables as date tables in Power BI Desktop.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 02/26/2025
LocalizationGroup: Model your data
---
# Set and use date tables in Power BI Desktop

**Power BI Desktop** works behind the scenes to automatically identify columns that represent dates, and then creates date hierarchies and other enabling metadata for your model, on your behalf. You can then use those built-in hierarchies when creating report features like visuals, tables, quick measures, slicers, and so on. Power BI Desktop generates this data by creating hidden tables on your behalf, which you can then use for your reports and DAX expressions.

For more information about this automatic behavior, see [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md).

While this is a convenient option for simple models, it is not recommended for more complex scenarios and larger models. For those, it is preferable to create a dedicated table for more flexibility. 

For most models, it is recommended to add a date table (or more in some scenarios). Many data analysts prefer to create their own date tables, which is fine.

There are multiple ways of creating such a table, including:

- **Power Query M**. You can use the [List.Dates](/powerquery-m/list-dates) function. [See below for an example](#creating-a-date-table-using-built-in-tools).
- **DAX**. You can use the [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-funciton-dax) functions to generate a basic calculated date table. You can of course also use a more advanced DAX statement to create a date table. [An example is provided below](#creating-a-date-table-using-built-in-tools).
- **External tools**.
- **Loading from a source**, such as a source system, a file or another Power BI semantic model.
Which option is best for you depends on various factors and is beyond the scope of this tutorial.

# TODO
# need to explain custom calendars and why mark as date table is no longer required if you use that. Basically, you either use custom calendars _or_ mark as date table, except for specific scenarios (Excel pivot tables and....?).
# then also need to detail how to create a calendar, explain what categories, key and associated columns and and time-related columns are....

After you have created or loaded the date table in you semantic model, you can specify the table you want your model to use as its **date table** in Power BI Desktop, and then create date-related visuals, tables, quick measures, and so on, by using that table's date data. When you specify your own date table, you control the date hierarchies created in your model, and use them in **quick measures** and other operations that use your model's date table.

:::image type="content" source="media/desktop-date-tables/date-tables_01.png" alt-text="Screenshot of Power BI Desktop showing the Mark as date table dialog box.":::

## Benefits of setting your own date table

The [Time intelligence functions in Power BI](/dax/time-intelligence-functions-dax) require some understanding of date calculations in your model. Setting your own date table or using [auto date/time](desktop-auto-date-time.md) enables these functions to work. There are specific situations in which you do need set your own date table:

- The relationships between the date table and other tables in your model are based on columns of a different data type than Datetime. For example, if you load data from a source such as a data warehouse, specific columns that represent dates are often provided. These columns (also called surrogate keys) are often stored as a whole number and formatted as yyyy-mm-dd (for example: *20241231* to represent the 31st of December 2024). If you have relationships between the date table and other tables in your model that use such columns, you'll need to set your own date table in order use the time intelligence capabilities.
- If you want to use [advanced date filters in Excel PivotTables or PivotCharts](https://support.microsoft.com/office/filter-dates-in-a-pivottable-or-pivotchart-571cc416-ba4d-4005-a01e-3d99306ccefc) based on Power BI data. 

## Set your own date table

To set a **date table**, select the table you want to use as a date table in the **Fields** pane, then right-click the table and choose **Mark as date table > Mark as date table** in the menu that appears, as shown in the following image.

:::image type="content" source="media/desktop-date-tables/date-tables_02.png" alt-text="Screenshot of Power BI Desktop showing Mark as date table filter options in the Fields pane.":::

You can also select the table and then choose **Mark as date table** from the **Table tools** ribbon, shown here.

:::image type="content" source="media/desktop-date-tables/date-tables_02b.png" alt-text="Screenshot of Power BI Desktop showing the Mark as date table button and options filter.":::

When you specify your own **date table**, Power BI Desktop performs the following validations of that column and its data, to ensure that the data:

* Contains unique values.
* Contains no null values.
* Contains contiguous date values (from beginning to end).
* If it's a **Date/Time** data type, it has the same timestamp across each value.

There are two likely scenarios for creating your own date table, either of which is a reasonable approach:

* The first scenario is when you use a canonical, or basic date table and hierarchy. This scenario would use a table in your data that meets the previously described validation criteria for a date table.

* The second scenario is where you use a table from Analysis Services, for example, with a *dim date* field that you want to use as your date table.

After you specify a date table, you can select which column in that table is the date column. You can specify which column to use by selecting the table in the **Fields** pane, then right-click the table and choose **Mark as date table > Date table settings**. The following window appears, where you can select the column to use as the date table from the dropdown.

:::image type="content" source="media/desktop-date-tables/date-tables_03.png" alt-text="Screenshot of Power BI Desktop showing the Mark as date table dialog box with an important note.":::

It's important to note that when you specify your own date table, **Power BI Desktop** doesn't auto-create the hierarchies that it would otherwise build into your model on your behalf. If you later deselect your date table (and no longer have a manually set date table), Power BI Desktop recreates the automatically created built-in date tables for you, for the date columns in the table.

Also important to note is that when you mark a table as a date table, Power BI Desktop removes the built-in (automatically created) date table. And any visuals or DAX expressions you previously created based on those built-in tables will no longer work properly.

## Mark your date table as the appropriate data type

When you specify your own **date table**, you need to make sure the data type is properly set. You want to set the **Data type** to **Date/Time** or **Date**. Take the following steps to do so:

1. Select your **date table** from the **Fields** pane, expand it if necessary, and then choose the column to be used as the date.

    :::image type="content" source="media/desktop-date-tables/date-tables_04.png" alt-text="Screenshot of Power BI Desktop showing the Date filter in the Fields pane.":::

2. On the **Column tools** tab, select **Data type** and then choose the dropdown arrow to show available data types.

    :::image type="content" source="media/desktop-date-tables/date-tables_05.png" alt-text="Screenshot of Power BI Desktop showing the Modeling tab with the Data Type filter selected.":::

3. Specify the data type for your column.

## Creating a date table using built-in tools

The following examples create a date table from 1st of January 2010 to 31st of December 2030 using either Power Query M or DAX. It includes the following columns: Year, Month Number, Month Name, Month Year, Quarter, Year Quarter, Day and Date.

### Power Query M

```powerquery-m
let
    StartDate = #date(2010, 1, 1),
    EndDate = #date(2030, 12, 31),
    NumberOfDays = Duration.Days(EndDate - StartDate) + 1,
    DateList = List.Dates(StartDate, NumberOfDays, #duration(1,0,0,0)),
    DateTable = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}),
    AddYear = Table.AddColumn(DateTable, "Year", each Date.Year([Date]), Int64.Type),
    AddMonthNumber = Table.AddColumn(AddYear, "Month Number", each Date.Month([Date]), Int64.Type),
    AddMonthName = Table.AddColumn(AddMonthNumber, "Month Name", each Date.ToText([Date], "MMMM"), type text),
    AddMonthYear = Table.AddColumn(AddMonthName, "Month Year", each Date.ToText([Date], "MMM yyyy"), type text),
    AddQuarter = Table.AddColumn(AddMonthYear, "Quarter", each "Q" & Text.From(Date.QuarterOfYear([Date])), type text),
    AddYearQuarter = Table.AddColumn(AddQuarter, "Year Quarter", each Text.From(Date.Year([Date])) & " Q" & Text.From(Date.QuarterOfYear([Date])), type text),
    AddDay = Table.AddColumn(AddYearQuarter, "Day", each Date.Day([Date]), Int64.Type)
in
    AddDay
```

### DAX

```dax
DateTable =
ADDCOLUMNS (
    CALENDAR ( DATE ( 2010, 1, 1 ), DATE ( 2030, 12, 31 ) ),
    "Year", YEAR ( [Date] ),
    "Month Number", MONTH ( [Date] ),
    "Month Name", FORMAT ( [Date], "MMMM" ),
    "Month Year", FORMAT ( [Date], "MMM YYYY" ),
    "Quarter", "Q" & FORMAT ( [Date], "Q" ),
    "Year Quarter",
        FORMAT ( [Date], "YYYY" ) & " Q"
            & FORMAT ( [Date], "Q" ),
    "Day", DAY ( [Date] ),
    "Date", [Date]
)
```
## Related content

For more information related to this article, see the following resources:

* [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md)
* [Design guidance for date tables in Power BI Desktop](../guidance/model-date-tables.md)
* [Data types in Power BI Desktop](../connect-data/desktop-data-types.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
* Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
