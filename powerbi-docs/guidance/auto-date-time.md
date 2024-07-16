---
title: "Auto date/time guidance in Power BI Desktop"
description: Guidance for using auto date/time functionality in Power BI Desktop.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 07/02/2022
---

# Auto date/time guidance in Power BI Desktop

This article targets data modelers developing Import or Composite models in Power BI Desktop. It provides guidance, recommendations, and considerations when using Power BI Desktop _Auto date/time_ in specific situations. For an overview and general introduction to _Auto date/time_, see [Auto date/time in Power BI Desktop](../transform-model/desktop-auto-date-time.md).

The _Auto date/time_ option delivers convenient, fast, and easy-to-use time intelligence. Reports authors can work with time intelligence when filtering, grouping, and drilling down through calendar time periods.

## Considerations

The following bulleted list describes considerations—and possible limitations—related to the _Auto date/time_ option.

- **Applies to all or none:** When the _Auto date/time_ option is enabled, it applies to all date columns in Import tables that aren't the &quot;many&quot; side of a relationship. It can't be selectively enabled or disabled on a column-by-column basis.
- **Calendar periods only:** The year and quarter columns relate to calendar periods. It means that the year begins on January 1 and finishes on December 31. There's no ability to customize the year commencement (or completion) date.
- **Customization:** It's not possible to customize the values used to describe time periods. Further, it's not possible to add additional columns to describe other time periods, for example, weeks.
- **Year filtering:** The **Quarter**, **Month**, and **Day** column values don't include the year value. For example, the **Month** column contains the month names only (that is, January, February, etc.). The values are not fully self-describing, and in some report designs may not communicate the year filter context.

    That's why it's important that filters or grouping must take place on the **Year** column. When drilling down by using the hierarchy year will be filtered, unless the **Year** level is intentionally removed. If there's no filter or group by year, a grouping by month, for example, would summarize values across all years for that month.
- **Single table date filtering:** Because each date column produces its own (hidden) auto date/time table, it's not possible to apply a time filter to one table and have it propagate to multiple model tables. Filtering in this way is a common modeling requirement when reporting on multiple subjects (fact-type tables) like sales and sales budget. When using auto date/time, the report author will need to apply filters to each different date column.
- **Model size:** For each date column that generates a hidden auto date/time table, it will result in an increased model size and also extend the data refresh time.
- **Other reporting tools:** It isn't possible to work with auto date/time tables when:
  - Using [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md).
  - Using Power BI paginated report Analysis Services query designers.
  - Connecting to the model using non-Power BI report designers.

## Recommendations

We recommended that you keep the _Auto date/time_ option enabled only when you work with calendar time periods, and when you have simplistic model requirements in relation to time. Using this option can also be convenient when creating ad hoc models or performing data exploration or profiling.

When your data source already defines a date dimension table, this table should be used to consistently define time within your organization. It will certainly be the case if your data source is a data warehouse. Otherwise, you can generate date tables in your model by using the DAX [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-function-dax) functions. You can then add calculated columns to support the known time filtering and grouping requirements. This design approach may allow you to create a single date table that propagates to all fact-type tables, possibly resulting a single table to apply time filters. For further information on creating date tables, read the [Set and use date tables in Power BI Desktop](../transform-model/desktop-date-tables.md) article.

> [!TIP]
> For more information about creating calculated tables, including an example of how to create a date table, work through the [Add calculated tables and columns to Power BI Desktop models](/training/modules/dax-power-bi-add-calculated-tables/) learning module.

If the _Auto date/time_ option isn't relevant to your projects, we recommend that you disable the global _Auto date/time_ option. It will ensure that all new Power BI Desktop files you create won't enable the _Auto date/time_ option.

## Related content

For more information related to this article, check out the following resources:

- [Create date tables in Power BI Desktop](model-date-tables.md)
- [Auto date/time in Power BI Desktop](../transform-model/desktop-auto-date-time.md)
- [Set and use date tables in Power BI Desktop](../transform-model/desktop-date-tables.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
