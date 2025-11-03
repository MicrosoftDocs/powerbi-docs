---
title: Use Calculation Options in Power BI Desktop
description: Learn how to use various calculation options in Power BI Desktop, including custom columns, calculated columns, calculated tables, measures, and visual calculations to transform and analyze your data effectively.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Model your data
---
# Use calculation options in Power BI Desktop

Power BI provides five options for adding calculations into your Power BI report. Each of these options has benefits and limitations. It's important to understand these options and when to best use them.

## Options for calculations in Power BI

The following table shows the options that are available for adding calculations in Power BI:

| Aspect | Custom column | Calculated column | Calculated table | Measure | Visual calculation |
| --- | --- | --- | --- | --- | --- |
| Language | M | DAX | DAX | DAX | DAX |
| Computed at | Data refresh | Data refresh | Data refresh | On demand | On demand |
| Persistence | Results saved | Results saved | Results saved | Calculated as required | Calculated as required |
| Context | Row | Row | Row | Filter | Visual |
| Stored in | Table | Model | Model | Model | Visual |
| Changes with user interaction in report | No | No | No | Yes | Yes |
| Usage | Slicers, filters, rows, columns | Slicers, filters, rows, columns | In a measure, calculated column, or visual calculation definition | Value in a visual and visual-level filter | Value in a visual and visual-level filter |

The following sections provide detailed information about the use of each of the calculation options listed in the previous table.

## Custom column (Power Query)

You can create your own custom columns by using the Power Query M formula language. Power Query M custom columns are similar to calculated columns in Data Analysis Expressions (DAX). Custom columns have the following features and capabilities:

- They extend the table by evaluating an expression on a row-by-row basis.
- They're static, meaning they don't change with the user interaction on the report.
- They're computed as part of the data refresh, and the results are stored in the model file. As a result, it takes time to evaluate them at data refresh, and they increase the size of the model.

Although custom columns can aggregate rows from other tables, calculated columns can deliver better performance, because with calculated columns, aggregation is done on the data source.

For more information about custom columns, see [Add a custom column](/power-query/add-custom-column).

## Calculated column (DAX)

Calculated columns use DAX to define columns on a table. In this way, they extend the table by evaluating an expression on a row-by-row basis. Calculated columns are static, meaning they don't change when users interact with the report. Calculated columns are calculated as part of the data refresh, and the results are stored in the model file. As a result, it takes time to evaluate calculated columns at data refresh, and they increase the size of the model.

Calculated columns are stored in the model and can refer to other tables and relationships in the model. In this way, calculated columns are unlike visual calculations and computed columns in Power Query, which are only processed during refresh.

You can use calculated columns in slicers, filters, rows, and columns on a visual.

For more information about calculated columns, see [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md).

## Measures

Measures use DAX to add calculations to your mode. Measures are calculated as needed and are responsive to the selections the user makes in the report. The results of measures aren't precalculated or stored on disk.

You can use measures only as values in a visual or in visual-level filters.

For more information about measures, see [Create measures for data analysis in Power BI Desktop](desktop-measures.md).

## Calculated table

Most of the time, you create tables by importing data into your model from an external data source. When you use calculated tables, you can add new tables based on data that's already loaded into the model, or you can use DAX to create new tables. Calculated tables are best for intermediate calculations and data you want to store as part of the model, not calculate on the fly or obtain from query results. For example, you might use a calculated table to apply a `UNION` or `CROSS JOIN` operator to two existing tables.

Just like other tables, calculated tables can have relationships with other tables. Calculated table columns have data types and formatting, and they can belong to a data category. You can name your columns whatever you want, and you can add them to report visualizations just like other fields. Calculated tables are recalculated when any of the tables from which they pull data are refreshed or updated.

For more information about calculated tables, see [Create calculated tables in Power BI Desktop](desktop-calculated-tables.md).

## Visual calculation

Visual calculations differ from the other calculation options in DAX in that visual calculations aren't stored in the model. Instead, visual calculations are stored on the visual. Visual calculations make it easier to create calculations that were previously hard to create, leading to simpler DAX, easier maintenance, and better performance.

Visual calculations can only refer to what's on the visual. Anything that's in the model needs to be added to the visual before the visual calculation can refer to it, which means that visual calculations don't have to worry about the complexity of filter context and the model.

Visual calculations combine the simplicity of context from calculated columns with the on-demand calculation flexibility from measures. Compared to measures, visual calculations operate on aggregated data, instead of the detail level, often leading to performance benefits. Since visual calculations are part of the visual, they can refer to the visual structure, which leads to more flexibility.

You can [learn more about visual calculations](desktop-visual-calculations-overview.md).

## Related content

- [Custom columns in Power Query](/power-query/add-custom-column)
- [Calculated columns (DAX)](desktop-calculated-columns.md)
- [Create measures for data analysis in Power BI Desktop](desktop-measures.md)
- [Using visual calculations (preview)](desktop-visual-calculations-overview.md)
