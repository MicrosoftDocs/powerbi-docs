---
title: "Auto date/time guidance in Power BI Desktop"
description: "Guidance, recommendations, and considerations for using the auto date/time functionality in Power BI Desktop."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.custom: fabric-cat
ms.date: 12/11/2025
ai-usage: ai-assisted
#customer intent: As a Power BI Desktop user, I want to understand the considerations and recommendations for using the auto date/time functionality so that I can effectively work with time intelligence in my reports.
---

# Auto date/time guidance in Power BI Desktop

This article is for data modelers who develop Import or Composite models in Power BI Desktop. It provides guidance, recommendations, and considerations when using Power BI Desktop _Auto date/time_ in specific situations.

> [!NOTE]
> For an overview and general introduction to Auto date/time, see [Auto date/time in Power BI Desktop](../transform-model/desktop-auto-date-time.md).

The _Auto date/time_ option provides convenient, fast, and easy-to-use time intelligence. Report authors can work with time intelligence when filtering, grouping, and drilling down through calendar time periods.

## Considerations

Keep these considerations and limitations in mind when using the _Auto date/time_ option:

- **Applies to all or none**: When you enable the _Auto date/time_ option, it applies to all date columns in Import tables that aren't on the "many" side of a relationship. You can't enable or disable it for individual columns.
- **Calendar periods only**: The year and quarter columns use calendar periods, with years starting on January 1 and ending on December 31. You can't customize the year start or end dates.
- **Customization**: You can't customize time period values or add columns for other time periods like weeks.
- **Year filtering**: The `Quarter`, `Month`, and `Day` column values don't include the year. For example, the `Month` column shows only month names (January, February, and so on). The values don't fully describe the context and might not clearly communicate the year filter in some report designs.
  - That's why it's important that filters or grouping must take place on the `Year` column. When drilling down by using the hierarchy, the year is filtered, unless the `Year` level is intentionally removed. If there's no filter or group by year, a grouping by month, for example, summarizes values across all years for that month.
- **Single table date filtering**: Because each date column creates its own (hidden) auto date/time table, you can't apply a time filter to one table and have it propagate to multiple model tables. Filtering in this way is a common modeling requirement when reporting on multiple subjects ([fact tables](star-schema.md#fact-tables)) like sales and sales budget. When using auto date/time, the report author needs to apply filters to each different date column.
- **Model size**: Each date column that generates a hidden auto date/time table increases the model size and also extends the data refresh time.
- **Other reporting tools**: You can't work with auto date/time tables when:
  - Using [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md).
  - Using Power BI paginated report Analysis Services query designers.
  - Connecting to the model by using non-Power BI report designers.

## Recommendations

Keep the _Auto date/time_ option enabled only when you work with calendar time periods and have simplistic model requirements related to time. Using this option can also be convenient when creating ad hoc models or performing data exploration or profiling.

When your data source already defines a date [dimension table](star-schema.md#dimension-tables), use this table to consistently define time within your organization. This table is typically present if your data source is a data warehouse. Otherwise, you can generate date tables in your model by using the DAX [CALENDAR](/dax/calendar-function-dax) or [CALENDARAUTO](/dax/calendarauto-function-dax) functions. You can then add calculated columns to support the known time filtering and grouping requirements. This design approach might allow you to create a single date table that propagates to all fact tables, possibly resulting in a single table to apply time filters. For further information on creating date tables, read the [Set and use date tables in Power BI Desktop](../transform-model/desktop-date-tables.md) article.

> [!TIP]
> For more information about creating calculated tables, including an example of how to create a date table, work through the [Add calculated tables and columns to Power BI Desktop models](/training/modules/dax-power-bi-add-calculated-tables/) learning module.

If the _Auto date/time_ option isn't relevant to your projects, disable the global _Auto date/time_ option. It ensures that all new Power BI Desktop files you create don't enable the _Auto date/time_ option.

## Related content

For more information related to this article, check out the following resources:

- [Design guidance for date tables in Power BI Desktop](model-date-tables.md)
- [Auto date/time in Power BI Desktop](../transform-model/desktop-auto-date-time.md)
- [Set and use date tables in Power BI Desktop](../transform-model/desktop-date-tables.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
