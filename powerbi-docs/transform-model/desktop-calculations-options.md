---
title: Using calculations options in Power BI Desktop
description: Learn how to use various calculations in Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 02/16/2024
LocalizationGroup: Model your data
---
# Using calculations options in Power BI Desktop

Power BI provides five options for adding calculations into your Power BI report. Each of these options has benefits and limitations. It's important to understand these options and when to best use them.

## Options for calculations in Power BI

The following table shows the options available to add calculations in Power BI:

| Aspect | Custom column | Calculated column | Calculated table | Measure | Visual calculation |
| --- | --- | --- | --- | --- | --- |
| Language | M | DAX | DAX | DAX | DAX |
| Computed at | Data refresh | Data refresh | Data refresh | On demand | On demand |
| Persistence | Results saved | Results saved | Results saved | Calculated as required | Calculated as required |
| Context | Row | Row | Row | Filter | Visual |
| Stored in | Table | Model | Model | Model | Visual |
| Changes with user interaction in report | No | No | No | Yes | Yes |
| Usage | Slicers, filters, rows, columns | Slicers, filters, rows, columns | In a measure, calculated column, or visual calculation definition | Value in a visual and visual level filter | Value in a visual and visual level filter |

The following sections go into detail about the use of each of the calculation options listed in the previous table.

## Custom column (Power Query)

You can create your own custom columns using the Power Query M formula language. Similar to creating calculated columns in DAX, Power Query M custom columns have the following features and capabilities:

* Extend the table by evaluating an expression on a row-by-row basis
* Are static, meaning they don't change with the user interaction on the report
* Are computed as part of the data refresh and the results are stored in the model file, which means they take time to evaluate at data refresh, and increase the size of the model.

Although custom columns can aggregate rows from other tables, computed columns may result in better performance, since aggregation is done on the data source.

You can [learn more about custom columns.](/power-query/add-custom-column)

## Calculated column (DAX)

Calculated columns use DAX to define columns on a table, extending the table by evaluating an expression on a row-by-row basis. Calculated columns are static, meaning they don't change with the user interaction on the report. Calculated columns are calculated as part of the data refresh, and the results are stored in the model file, which means calculated columns take time to evaluate at data refresh, and increase the size of the model.

Calculated columns are stored in the model and can, unlike visual calculations and computed columns in Power Query (which are only processed during refresh), refer to other tables and relationships in the model.

Calculated columns can be used in slicers, filters, rows, and columns on a visual.

You can [learn more about calculated columns](desktop-calculated-columns.md).


## Measures

Measures use DAX to add calculations to your model, are calculated as-needed, and are responsive to the selections the user makes in the report. The results of measures aren't precalculated or stored on disk.

Measures can only be used as values in a visual, or in visual level filters.

You can [learn more about measures](desktop-measures.md).

## Calculated table

Most of the time, you create tables by importing data into your model from an external data source. Calculated tables let you add new tables based on data you've already loaded into the model, or let you create new tables using DAX. Calculated tables are best for intermediate calculations and data you want to store as part of the model, rather than calculating on the fly or as query results. For example, you might choose to *union* or *cross join* two existing tables.

Just like other tables, calculated tables can have relationships with other tables. Calculated table columns have data types, formatting, and can belong to a data category. You can name your columns whatever you want, and you can add them to report visualizations just like other fields. Calculated tables are recalculated when any of the tables from which they pull data are refreshed or updated.

You can [learn more about calculated tables](desktop-calculated-tables.md).

## Visual calculation

Visual calculations differ from the other calculations options in DAX in that they aren't stored in the model, and rather are stored on the visual. Visual calculations make it easier to create calculations that were previously hard to create, leading to simpler DAX, easier maintenance, and better performance.

Visual calculations can only refer to what's on the visual. Anything that's in the model needs to be added to the visual before the visual calculation can refer to it, which means that visual calculations don't have to worry about the complexity of filter context and the model. 

Visual calculations combine the simplicity of context from calculated columns with the on-demand calculation flexibility from measures. Compared to measures, visual calculations operate on aggregated data, instead of the detail level, often leading to performance benefits. Since visual calculations are part of the visual, they can refer to the visual structure, which leads to more flexibility.

You can [learn more about visual calculations](desktop-visual-calculations-overview.md).


## Next steps

The following articles may be useful when learning and using visual calculations: 

* [Custom columns in Power Query](/power-query/add-custom-column)
* [Calculated columns (DAX)](desktop-calculated-columns.md)
* [Create measures for data analysis in Power BI Desktop](desktop-measures.md)
* [Using visual calculations (preview)](desktop-visual-calculations-overview.md)
