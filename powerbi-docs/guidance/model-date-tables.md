---
title: Design guidance for date tables in Power BI Desktop
description: Techniques and guidance for creating date tables in Power BI Desktop.
author: peter-myers
ms.author: v-pemyers
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/10/2024
---

# Design guidance for date tables in Power BI Desktop

This article describes good design practices for creating date tables in your data models when using Power BI Desktop.

A date table is the most common table used for analysis. It stores one row per date, and it supports the common requirement to filter or group by specific periods of dates, like years, quarters, or months.

What's more, in order to work with Data Analysis Expressions (DAX) [time intelligence functions](/dax/time-intelligence-functions-dax), your data model must have at least one _date table_. A date table is a model table that meets the following requirements:

> [!div class="checklist"]
> - It must have a column of data type **date** (or **date/time**)—known as the _date column_.
> - The date column must contain unique values.
> - The date column must not contain BLANKs.
> - The date column must not have any missing dates.
> - The date column must span full years. A year isn't necessarily a calendar year (January-December).
> - The date table must be [marked as a date table](../transform-model/desktop-date-tables.md#set-your-own-date-table).

You can use any of several techniques to add a date table to your model:

- [Use Auto date/time](#use-auto-datetime)
- [Connect with Power Query](#connect-with-power-query) (to an existing date dimension table)
- [Generate with Power Query](#generate-with-power-query)
- [Generate with DAX](#generate-with-dax)
- [Clone with DAX](#clone-with-dax)

> [!TIP]
> A date table is perhaps the most consistent feature you'll add to any of your data models. Within an organization a date table should be consistently defined. So, whatever technique you decide to use, we recommend you create a [Power BI Desktop template](../create-reports/desktop-templates.md) that includes a fully configured date table. Share the template with all data modelers in your organization. So, whenever someone develops a new data model, they can begin with a consistently defined date table.

## Use Auto date/time

The [Auto date/time](../transform-model/desktop-auto-date-time.md) option delivers convenient, fast, and easy-to-use time intelligence. Reports authors can work with time intelligence when filtering, grouping, and drilling down through calendar time periods.

We recommended that you keep the Auto date/time option enabled only when you work with calendar time periods, and when you have simplistic model requirements in relation to time. You might also use this option when creating ad hoc models or performing data exploration or profiling. This approach, however, doesn't support a single date table design that can propagate filters to multiple tables. For more information, see [Auto date/time guidance in Power BI Desktop](auto-date-time.md).

## Connect with Power Query

When your data source already has a date table, we recommend you use it as the source of your model date table. It's typically the case when you're connecting to a data warehouse, as it should already have a [date dimension table](/fabric/data-warehouse/dimensional-modeling-dimension-tables#date-dimension). This way, your model uses a single source of truth for time in your organization.

If you're developing a DirectQuery model and your data source doesn't include a date table, we strongly recommend you add a date table to the data source. It should meet all the modeling requirements of a date table. You can then use Power Query to connect to the date table. This way, your model calculations can use the DAX time intelligence capabilities.

## Generate with Power Query

You can generate a date table by using Power Query. For more information, see Chris Webb's blog entry [Generating A Date Dimension Table In Power Query](https://blog.crossjoin.co.uk/2013/11/19/generating-a-date-dimension-table-in-power-query/).

> [!TIP]
> If you don't have a data warehouse or other consistent definition for time in your organization, consider using Power Query to publish a [dataflow](../transform-model/dataflows/dataflows-introduction-self-service.md). Then, have all data modelers connect to the dataflow to add date tables to their models. The dataflow becomes the single source of truth for time in your organization.

If you need to generate a date table, consider doing it with DAX. You might find it's easier. What's more, it's likely to be more convenient, because DAX includes some built-in intelligence to simplify creating and managing date tables.

## Generate with DAX

You can generate a date table in your model by creating a calculated table using either the [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-function-dax) DAX function. Each function returns a single-column table of dates. You can then extend the calculated table with calculated columns to support your date interval filtering and grouping requirements.

- Use the `CALENDAR` function when you want to define a date range. You pass in two values: the start date and end date. These values can be defined by other DAX functions, like `MIN(Sales[OrderDate])` or `MAX(Sales[OrderDate])`.
- Use the `CALENDARAUTO` function when you want the date range to automatically encompass all dates stored in the model. You can pass in a single optional parameter that's the end month of the year (if your year is a calendar year, which ends in December, you don't need to pass in a value). It's a helpful function because it ensures that full years of dates are returned and so meets the requirement for a marked date table. What's more, you don't need to extend the table with rows for future years. That's because When a data refresh completes, it triggers the recalculation of the table. A recalculation automatically extends the date range of the table when dates for a new year are loaded into the model.

> [!TIP]
> For more information about creating calculated tables, including an example of how to create a date table, work through the [Add calculated tables and columns to Power BI Desktop models](/training/modules/dax-power-bi-add-calculated-tables/) learning module.
>
> Also, consider using a free open-source tool to help manage dates with DAX. For more information, see [Bravo for Power BI](https://www.sqlbi.com/tools/bravo-for-power-bi/).

## Clone with DAX

When your data model already has a date table and you need another date table—when date is a [role-playing dimension](star-schema.md#role-playing-dimensions) dimension, you can easily clone the existing date table. You can clone a table by creating a calculated table. The calculated table expression is simply the name of the existing date table.

For example, to create a `Ship Date` table that clones the `Date` table, use the following calculated table expression.

```dax
Ship Date = 'Date'
```

> [!NOTE]
> When you clone a table with DAX, it only creates columns. It does not apply any model properties from the cloned table, like formats or descriptions. Also, hierarchies aren't cloned.

## Related content

For more information related to this article, check out the following resources:

- [Auto date/time in Power BI Desktop](../transform-model/desktop-auto-date-time.md)
- [Auto date/time guidance in Power BI Desktop](auto-date-time.md)
- [Set and use date tables in Power BI Desktop](../transform-model/desktop-date-tables.md)
- [Self-service data prep in Power BI](../transform-model/dataflows/dataflows-introduction-self-service.md)
- [CALENDAR function (DAX)](/dax/calendar-function-dax)
- [CALENDARAUTO function (DAX)](/dax/calendarauto-function-dax)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
