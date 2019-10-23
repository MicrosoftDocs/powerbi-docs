---
title: "Auto date/time guidance in Power BI Desktop"
description: Guidance for using auto date/time functionality in Power BI Desktop.
author: peter-myers
manager: asaxton
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 10/23/2019
ms.author: v-pemyer
---

# Auto date/time guidance in Power BI Desktop

This article targets data modelers developing Import or Composite models in Power BI Desktop.

This article is not intended to provide a complete discussion on the Power BI Desktop _Auto date/time_ option. For an introduction, refer to the [Auto date/time in Power BI Desktop](../desktop-auto-date-time.md) article.

## Benefits

The _Auto date/time_ option has been designed to deliver convenient, fast and easy-to-use time intelligence when filtering, grouping and drilling down through calendar time periods.

## Limitations

The following bulleted list describes limitations related to the _Auto date/time_ option.

- **Applies to all or none:** When the _Auto date/time_ option is enabled, it applies to all date columns in Import tables that are not the &quot;many&quot; side of a relationship. It cannot be selectively enabled or disabled on a column-by-column basis.
- **Calendar periods only:** The year and quarter columns relate to calendar periods. This means the year begins on January 1 and finishes on December 31. There is no ability to customize the year commencement (or completion) date.
- **Does not support customization:** It is not possible to customize the values used to describe the time periods. Further, it is not possible to add additional columns to describe other time periods, for example, weeks.
- **Column values do not describe the year:** The **Quarter** , **Month** and **Day** column values do not include the year value. For example, the **Month** column contains the month names only (i.e. January, February, etc.). The values are therefore not self-describing, and in some report designs may lack a visual year context.
 
    It is therefore very important that filters or grouping must take place on the **Year** column. When drilling down using the hierarchy, this will always be the case, unless the **Year** level is removed. If there is no filter or group by year, a grouping by month, for example, would summarize values across all years for that month.
- **Does not support single table date filtering:** Because each date column produces its own (hidden) auto date/time table, it is not possible to apply a time filter to one table and have it propagate to multiple model tables. This is a common modeling requirement when reporting on multiple subjects (fact-type tables) like sales and sales budget. Using auto date/time, the report author will need to apply filters to each different date column.
- **Increases the model size:** For each date column that generates a hidden auto date/time table, it will result in an increased model size and also extend the data refresh time.

## Recommendations

It is recommended to keep the _Auto date/time_ option enabled only when you work with calendar time periods, and when you have simplistic model requirements in relation to time. Using this option can also be convenient when creating ad hoc models or performing data exploration or profiling.

When your data source already defines a date dimension, this should be used to consistently define time within your organization. This will certainly be the case if your data source is a data warehouse. Otherwise, you can generate date tables in your model by using the DAX [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-function-dax) functions, and by adding calculated columns to support the known time filtering and grouping requirements. This design approach may allow you to create a single date table that propagates to all fact-type tables, resulting a single table to apply time filters. For further information on creating date tables, read the [Set and use date tables in Power BI Desktop](../desktop-date-tables.md) article.

If the _Auto date/time_ option is not relevant to your projects, we recommend that you disable the global _Auto date/time_ option. This will ensure all new Power BI Desktop files you create will not enable the _Auto date/time_ option.

## Next steps

For more information about auto date/time and related topics, check out the following resources:

- [Auto date/time in Power BI Desktop](../desktop-auto-date-time.md)
- [Set and use date tables in Power BI Desktop](../desktop-date-tables.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
