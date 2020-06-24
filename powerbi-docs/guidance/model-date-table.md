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

This article targets you as a data modeler working with Power BI Desktop. It describes good design practices for creating date table in your data models.

To work with [time intelligence Data Analysis Expressions (DAX) functions](/dax/time-intelligence-functions-dax), there's a prerequisite model requirement: You must have at least one _date table_ in your model. A date table is a table that meets the following requirements:

> [!div class="checklist"]
> - It must have a column of data type date (or date/time)—known as the date column.
> - The date column must contain unique values.
> - The date column must not contain BLANKs.
> - The date column must not have any missing dates.
> - The date column must span full years. A year isn't necessarily a calendar year (January-December).
> - The date table must be [marked as a date table](../transform-model/desktop-date-tables.md#setting-your-own-date-table).

There are several techniques to add a date table to your model:

- Use auto date/time
- Use Power Query to connect to a date dimension table
- Use Power Query to generate a date table
- Use DAX to generate a date table

## Use auto date/time

The [Auto date/time](../transform-model/desktop-auto-date-time.md) option delivers convenient, fast, and easy-to-use time intelligence. Reports authors can work with time intelligence when filtering, grouping, and drilling down through calendar time periods.

We recommended that you keep the Auto date/time option enabled only when you work with calendar time periods, and when you have simplistic model requirements in relation to time. Using this option can also be convenient when creating ad hoc models or performing data exploration or profiling. This approach, however, doesn't support a single date table design that can propagate filters to multiple tables. For more information, see [Auto date/time guidance in Power BI Desktop](auto-date-time.md).

## Connect with Power Query

When your data source already has a date table, we recommend you use it as the source of your model date table. It's typically the case when you're connecting to a data warehouse, as it will have a date dimension table. This way, your model leverages a single source of truth for time in your organization.

If you're developing a DirectQuery model and your data source doesn't include a date table, we strongly recommend you add a date table to the data source. It should meet all the modeling requirements of a date table. You can then create a model table that connects to the date table. This way, your model calculations can leverage the DAX time intelligence capabilities.

## Generate with Power Query

You can generate a date table using Power Query. Here are two blog entries that show you how:

- [Creating a Date Dimension with a Power Query Script](https://www.mattmasson.com/2014/02/creating-a-date-dimension-with-a-power-query-script/) by Matt Masson
- [Generating A Date Dimension Table In Power Query](https://blog.crossjoin.co.uk/2013/11/19/generating-a-date-dimension-table-in-power-query/) by Chris Webb

> [!TIP]
> Consider using Power Query to publishing a [dataflow](../transform-model/service-dataflows-overview.md). The dataflow can become the single source of truth for time in your organization.

However, if you need to generate a date table, you might find it's easier to do so with DAX. DAX includes some built-in intelligence to simplify creating date tables.

## Generate with DAX

You can generate a date table in your model by creating a calculated table using either the DAX [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-function-dax) functions. Each function returns a single-column table of dates. You can then extend the table with calculated columns to support the known date interval filtering and grouping requirements.

- Use the CALENDAR function when you want to define a date range. You pass in two values: the start date and end date. These values can be defined by other DAX functions, like `MIN(Sales[OrderDateKey])` or `MAX(Sales[OrderDateKey])`.
- Use the CALENDARAUTO function when you want the date range to automatically encompass all dates stored in the model. You can pass in a single optional parameter that's the end month of the year (if your year is a calendar year, which ends in December, you don't need to pass in a value). It's a helpful function, because it ensures that full years of dates are returned. What's more, when a data refresh completes it triggers the recalculation of the table that can result in it extending its date range to the next year—you don't need to manage extending the table to future years.

## Clone with DAX

When your model already has a date table and you need additional date tables, you can easily clone a table by creating a calculated table. It could be the case when date is a [role playing dimension](star-schema.md#role-playing-dimensions). The calculated table expression is simply the name of the date table.

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
