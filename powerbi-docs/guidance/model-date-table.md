---
title: Create a date table in Power BI Desktop
description: Guidance for creating a date table in Power BI Desktop.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/24/2020
ms.author: v-pemyer
---

# Create a date table in Power BI Desktop

This article targets you as a data modeler working with Power BI Desktop. It describes good design practices for creating date tables in your data models.

To work with [time intelligence Data Analysis Expressions (DAX) functions](/dax/time-intelligence-functions-dax), there's a prerequisite model requirement: You must have at least one _date table_ in your model. A date table is a table that meets the following requirements:

> [!div class="checklist"]
> - It must have a column of data type date (or date/time)—known as the _date column_.
> - The date column must contain unique values.
> - The date column must not contain BLANKs.
> - The date column must not have any missing dates.
> - The date column must span full years. A year isn't necessarily a calendar year (January-December).
> - The date table must be [marked as a date table](../transform-model/desktop-date-tables.md#setting-your-own-date-table).

You can use any of several techniques to add a date table to your model:

- Use the Auto date/time option
- Use Power Query to connect to a date dimension table
- Use Power Query to generate a date table
- Use DAX to generate a date table
- Use DAX to clone an existing date table

## Use Auto date/time

The [Auto date/time](../transform-model/desktop-auto-date-time.md) option delivers convenient, fast, and easy-to-use time intelligence. Reports authors can work with time intelligence when filtering, grouping, and drilling down through calendar time periods.

We recommended that you keep the Auto date/time option enabled only when you work with calendar time periods, and when you have simplistic model requirements in relation to time. Using this option can also be convenient when creating ad hoc models or performing data exploration or profiling. This approach, however, doesn't support a single date table design that can propagate filters to multiple tables. For more information, see [Auto date/time guidance in Power BI Desktop](auto-date-time.md).

## Connect with Power Query

When your data source already has a date table, we recommend you use it as the source of your model date table. It's typically the case when you're connecting to a data warehouse, as it will have a date dimension table. This way, your model leverages a single source of truth for time in your organization.

If you're developing a DirectQuery model and your data source doesn't include a date table, we strongly recommend you add a date table to the data source. It should meet all the modeling requirements of a date table. You can then use Power Query to connect to the date table. This way, your model calculations can leverage the DAX time intelligence capabilities.

## Generate with Power Query

You can generate a date table using Power Query. Here are two blog entries that show you how:

- [Creating a Date Dimension with a Power Query Script](https://www.mattmasson.com/2014/02/creating-a-date-dimension-with-a-power-query-script/) by Matt Masson
- [Generating A Date Dimension Table In Power Query](https://blog.crossjoin.co.uk/2013/11/19/generating-a-date-dimension-table-in-power-query/) by Chris Webb

> [!TIP]
> If you don't have a data warehouse or other consistent definition for time in your organization, consider using Power Query to publish a [dataflow](../transform-model/service-dataflows-overview.md). Then, have all data modelers connect to the dataflow to add date tables to their models. The dataflow becomes the single source of truth for time in your organization.

If you need to generate a date table, consider doing it with DAX. You might find it's easier. What's more, it's likely to be more convenient, because DAX includes some built-in intelligence to simplify creating and managing date tables.

## Generate with DAX

You can generate a date table in your model by creating a calculated table using either the [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-function-dax) DAX functions. Each function returns a single-column table of dates. You can then extend the calculated table with calculated columns to support the known date interval filtering and grouping requirements.

- Use the CALENDAR function when you want to define a date range. You pass in two values: the start date and end date. These values can be defined by other DAX functions, like `MIN(Sales[OrderDate])` or `MAX(Sales[OrderDate])`.
- Use the CALENDARAUTO function when you want the date range to automatically encompass all dates stored in the model. You can pass in a single optional parameter that's the end month of the year (if your year is a calendar year, which ends in December, you don't need to pass in a value). It's a helpful function, because it ensures that full years of dates are returned. What's more, you don't need to manage extending the table to future years: When a data refresh completes it triggers the recalculation of the table. A recalculation will automatically extend the table's date range when dates for a new year are loaded into the model.

## Clone with DAX

When your model already has a date table and you need an additional date table, you can easily clone the existing date table. It's the case when date is a [role playing dimension](star-schema.md#role-playing-dimensions). You clone a table by creating a calculated table. The calculated table expression is simply the name of the existing date table.

## Next steps

For more information related to this article, check out the following resources:

- [Auto date/time in Power BI Desktop](../transform-model/desktop-auto-date-time.md)
- [Auto date/time guidance in Power BI Desktop](auto-date-time.md)
- [Set and use date tables in Power BI Desktop](../transform-model/desktop-date-tables.md)
- [Self-service data prep in Power BI](../transform-model/service-dataflows-overview.md)
- [CALENDAR function (DAX)](/dax/calendar-function-dax)
- [CALENDARAUTO function (DAX)](/dax/calendarauto-function-dax)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
