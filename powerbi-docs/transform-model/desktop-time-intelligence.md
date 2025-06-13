---
title: Implementing time-based calculations in Power BI
description: Learn how to use time intelligence to implement time-based calculations
author: jeroenterheerdt
ms.author: jterh
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 06/13/2025
LocalizationGroup: Model your data
---
# Implementing time-based calculations in Power BI

Power BI offers multiple tools to perform time-based calculations which either rely on automatic date tables or date tables you add.

The auto-date/time feature automatically creates hidden date tables for each date field in your data model. While this is a convenient option for simple models, it is not recommended for more complex scenarios and larger models. For those, it is preferable to create a dedicated table for more flexibility. 
For more information about this automatic behavior, see [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md).

While this is a convenient option for simple models, it is not recommended for more complex scenarios and larger models. For those, it is preferable to create a dedicated table for more flexibility.

For most models, it is recommended to add a date table (or more in some scenarios). Many data analysts prefer to create their own date tables, which is fine.

There are multiple ways of creating such a table, including:

- **Power Query M**. You can use the [List.Dates](/powerquery-m/list-dates) function. [See below for an example](#creating-a-date-table-using-built-in-tools).
- **DAX**. You can use the [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-funciton-dax) functions to generate a basic calculated date table. You can of course also use a more advanced DAX statement to create a date table. [An example is provided below](#creating-a-date-table-using-built-in-tools).
- **External tools**.
- **Loading from a source**, such as a source system, a file or another Power BI semantic model.
Which option is best for you depends on various factors and is beyond the scope of this tutorial.

## Working with a time-based calculations
Assuming you are not using [auto date/time](desktop-auto-date-time.md), there are two alternative ways of working with [Time intelligence functions in Power BI](/dax/time-intelligence-functions-dax) to perform time-based calculations:

- [**Classic**](#classic). This is the easiest option and works great for Gregorian or shifted Gregorian calendars but has limited flexibility for calendars that are structured differently or for week-based calculations. This requires you to [set the date table](desktop-date-tables.md).

- [**Calendar based (preview)**](#modern-calendar-based-preview). This is a newer option requires a bit more work to set up. However, it also gives you better performance, more flexibility to work with non-Gregorian calendars and the ability to perform week-based calculations. This option does not require you to [set the table as a date table](desktop-date-tables.md), except if you are planning to [connect Excel Pivot Tables to your semantic model](https://support.microsoft.com/office/create-a-pivottable-from-power-bi-datasets-31444a04-9c38-4dd7-9a45-22848c666884).

## Classic

This option requires you to have a date table in your model and [set it accordingly](desktop-date-tables.md). After you have done so, you can use the [time intelligence functions](/dax/time-intelligence-functions-dax) and refer to your date table. For example, if you have a date table called **Date** in your model that you set as your date table which contains a Date column then you can use:

```dax
SAMEPERIODLASTYEAR('Date'[Date])
```

While this is an fast and easy approach, there are a number of downsides compared to the more [modern, calendar-based approach](#modern-calendar-based-preview):

- it requires you set the date table
- it only works with models that have at least one dedicated date table
- it is less flexible as it it is optimized for Gregorian or shifted Gregorian calendars, such as fiscal years that start on the first of July but still follow a Gregorian calendar
- it does not provide week-based calculations
- in specific scenarios, time-based calculations do not perform well.

We recommend you use the [modern, calendar-based](#modern-calendar-based-preview) approach.

## Modern (Calendar-based) (preview)

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
