---
title: Use Calculation Options in Power BI Desktop
description: Become familiar with calculation options in Power BI Desktop. Find out when to use which option to transform and analyze your data effectively.
author: eric-urban
ms.author: eur
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 11/04/2025
ai-usage: ai-assisted
LocalizationGroup: Model your data
# customer intent: As a Power BI user, I want to become familiar with calculation options in Power BI Desktop so that I can use the options to effectively transform and analyze my data.
---
# Use calculation options in Power BI Desktop

Power BI provides five options for adding calculations into your Power BI report. Each of these options has benefits and limitations. This article helps you understand these options and shows you when it's best to use each one.

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

The following sections provide detailed information about how to use the calculation options listed in the preceding table.

## Custom columns (Power Query)

You can create your own custom columns by using the Power Query M formula language. Custom columns are similar to calculated columns in Data Analysis Expressions (DAX). But custom columns are defined in Power Query before the data enters the model.

Custom columns have the following features and capabilities:

- They extend the table by evaluating an expression on a row-by-row basis.
- They're static, meaning they don't change when users interact with the report.
- They're computed as part of the data refresh, and the results are stored as part of the table structure in the model file. As a result, it takes time to evaluate them at data refresh, and they increase the size of the model.

Although custom columns can aggregate rows from other tables, calculated columns can deliver better performance, because with calculated columns, aggregation is done on the data source.

For more information about custom columns, see [Add a custom column](/power-query/add-custom-column).

## Calculated columns (DAX)

You can use DAX to define a calculated column to add to a table. Calculated columns are created based on data that's already in the model.

Calculated columns have the following features and capabilities:

- They extend the table by evaluating an expression on a row-by-row basis.
- They're static, meaning they don't change when users interact with the report.
- They're calculated as part of the data refresh, and the results are stored in the model file. As a result, it takes time to evaluate them at data refresh, and they increase the size of the model.

Calculated columns can refer to other tables and relationships in the model. In this way, calculated columns are unlike visual calculations and custom columns in Power Query, which are only processed during refresh.

You can use calculated columns in slicers, filters, rows, and columns on a visual.

For more information about calculated columns, see [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md).

## Measures

Measures use DAX to add calculations to your model. Measures are calculated as needed and are responsive to the selections the user makes in the report. The results of measures aren't precalculated or stored on disk.

You can use measures only as values in a visual or in visual-level filters.

For more information about measures, see [Create measures for data analysis in Power BI Desktop](desktop-measures.md).

## Calculated tables

Most of the time, you create tables by importing data into your model from an external data source. When you use calculated tables, you can add new tables based on data that's already in the model, or you can use DAX to create new tables. Calculated tables are best for intermediate calculations and data you want to store as part of the model, not data that you calculate on the fly or obtain from query results. For example, you might use a calculated table to apply a `UNION` or `CROSS JOIN` operator to two existing tables.

Just like other tables, calculated tables can have relationships with other tables. Calculated table columns have data types and formatting, and they can belong to a data category. You can name your columns whatever you want, and you can add them to report visualizations just like other fields. Calculated tables are recalculated when any of the tables that they pull data from are refreshed or updated.

For more information about calculated tables, see [Create calculated tables in Power BI Desktop](desktop-calculated-tables.md).

## Visual calculations

Visual calculations differ from the other calculation options in DAX in that visual calculations aren't stored in the model. Instead, visual calculations are stored on the visual. Visual calculations streamline the process of creating calculations. These calculations generally involve straightforward DAX, easier maintenance, and better performance.

Visual calculations can only refer to what's on the visual. Before a visual calculation can refer to data in the model, you need to add that data to the visual. As a result, when you use visual calculations, you don't have to take into account the complexity of filter context and the model.

Visual calculations combine the simplicity of context from calculated columns with the on-demand calculation flexibility from measures. Unlike measures, which operate on detail-level data, visual calculations operate on aggregated data, which often leads to performance benefits. Because visual calculations are part of a visual, they can refer to the visual structure, which leads to more flexibility.

For more information about visual calculations, see [Using visual calculations (preview)](desktop-visual-calculations-overview.md).

## Related content

- [Column and measure references](/dax/best-practices/dax-column-measure-references)
- [Learn DAX basics in Power BI Desktop](desktop-quickstart-learn-dax-basics.md)
- [Power Query M function reference](/powerquery-m/power-query-m-function-reference)
