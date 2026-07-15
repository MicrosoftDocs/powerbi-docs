---
title: Visual Calculations Overview
description: Learn what visual calculations are, how they behave, and how they differ from measures and calculated columns in Power BI Desktop.
author: kgremban
ms.author: kgremban
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 07/13/2026
ai-usage: ai-assisted
LocalizationGroup: Model your data
#customer intent: As a report author, I want to understand what visual calculations are and how they behave, so that I can decide when to use them instead of measures or calculated columns.
no-loc: [RUNNINGSUM, MOVINGAVERAGE, COLLAPSE, COLLAPSEALL, EXPAND, EXPANDALL, PREVIOUS, NEXT, FIRST, LAST, LOOKUP, LOOKUPWITHTOTALS, ROWS, COLUMNS, ROWS COLUMNS, COLUMNS ROWS, NONE, HIGHESTPARENT, LOWESTPARENT, ISATLEVEL, RANGE, WINDOW, OFFSET, INDEX, ORDERBY]
---

# Visual calculations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A visual calculation is a DAX calculation that you define and run directly on a visual, instead of adding it to the semantic model. Because a visual calculation works with the data already shown in the visual, you can express common business calculations - like running totals, moving averages, and period-over-period comparisons - without navigating filter context or model relationships. The result is usually shorter DAX that's easier to maintain and often performs better than an equivalent measure.

This article explains what visual calculations are, how they behave in the visual matrix, how the parameters that control them work, and how they differ from measures and calculated columns, so you can decide when a visual calculation is the right choice.

Here's an example visual calculation that defines a running sum for **Sales Amount**. The DAX required is straightforward:

```dax
Running sum = RUNNINGSUM([Sales Amount])
```

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-01.png" alt-text="Screenshot of DAX for visual calculations.":::

A calculation can refer to any data in the visual, including columns, measures, or other visual calculations. This ability removes the complexity of the semantic model and simplifies the process of writing DAX. You can use visual calculations to complete common business calculations such as running sums or moving averages.

Visual calculations differ from the other calculation options in DAX:

* Visual calculations aren't stored in the model. Instead, you store them on the visual. This limitation means visual calculations can only refer to what's on the visual. You must add anything in the model to the visual before the visual calculation can refer to it. This restriction frees visual calculations from being concerned with the complexity of filter context and the model.
* Visual calculations combine the simplicity of context from calculated columns with the on-demand calculation flexibility from measures.
* Compared to measures, visual calculations operate on aggregated data instead of the detail level, which often leads to performance benefits. When a calculation can be achieved either by a new measure or a visual calculation, the latter often leads to better performance.
* Since visual calculations are part of the visual, they can refer to the visual structure, which leads to more flexibility.

For a more in-depth comparison of ways of adding calculations in Power BI, see [Use calculations options in Power BI Desktop](desktop-calculations-options.md).

Table and matrix visuals also expose visual calculations through the custom totals experience, which lets you change what the total row shows without writing DAX. For more information, see the [table](../visuals/power-bi-visualization-tables.md#custom-totals) and [matrix](../visuals/power-bi-visualization-matrix-visual.md#custom-totals) visual articles.

To learn how to add or edit a visual calculation, see [Create visual calculations](desktop-visual-calculations-create.md).

## How visual calculations work

You create visual calculations in **Edit** mode, which opens over the selected visual. The edit surface has three parts: a preview of the visual, a formula bar for the DAX expression, and a visual matrix that displays results as you type.

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-03.png" alt-text="Screenshot showing areas of the visual calculations edit screen." lightbox="media/desktop-visual-calculations-overview/desktop-visual-calculations-03.png":::

Because you store a visual calculation on the visual, it can reference anything on the visual - columns, measures, or other visual calculations - but nothing else in the model. Most visual calculations evaluate row-by-row against the visual matrix, so aggregation functions like [SUM](/dax/sum-function-dax) are usually unnecessary. You can't use functions that depend on model relationships - [USERELATIONSHIP](/dax/userelationship-function-dax), [RELATED](/dax/related-function-dax), and [RELATEDTABLE](/dax/relatedtable-function-dax).

After you add a visual calculation, it appears in the field list on the visual and renders on the visual itself.

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-06.png" alt-text="Screenshot of visual calculations being displayed on the visual.":::

## DAX functions available in visual calculations

Many existing DAX functions work in visual calculations. Because visual calculations work within the confines of the visual matrix, functions that rely on model relationships such as [USERELATIONSHIP](/dax/userelationship-function-dax), [RELATED](/dax/related-function-dax), or [RELATEDTABLE](/dax/relatedtable-function-dax) aren't available.

Visual calculations also introduce a set of functions specific to visual calculations. Many of these functions are easier-to-use shortcuts to DAX window functions.

| Function | Description | Example | Shortcut to |
| --- | --- | --- | --- |
| [COLLAPSE](/dax/collapse-function-dax) | The calculation is evaluated at a higher level of the axis. | Percent of parent = DIVIDE([Sales Amount], COLLAPSE([Sales Amount], ROWS)) | N/A |
| [COLLAPSEALL](/dax/collapseall-function-dax) | The calculation is evaluated at the total level of the axis. | Percent of grand total = DIVIDE([Sales Amount], COLLAPSEALL([Sales Amount], ROWS)) | N/A |
| [EXPAND](/dax/expand-function-dax) | The calculation is evaluated at a lower level of the axis. | Average of children = EXPAND(AVERAGE([Sales Amount]), ROWS) | N/A |
| [EXPANDALL](/dax/expandall-function-dax) | The calculation is evaluated at the leaf level of the axis. | Average of leaf level = EXPANDALL(AVERAGE([Sales Amount]), ROWS) | N/A |
| [FIRST](/dax/first-function-dax) | Refers to the first row of an axis. | ProfitVSFirst = [Profit] - FIRST([Profit]) | [INDEX(1)](/dax/index-function-dax) |
| [ISATLEVEL](/dax/isatlevel-function-dax) | Reports whether a specified column is present at the current level. | IsFiscalYearAtLevel = ISATLEVEL([Fiscal Year]) | N/A |
| [LAST](/dax/last-function-dax) | Refers to the last row of an axis. | ProfitVSLast = [Profit] - LAST([Profit]) | [INDEX(-1)](/dax/index-function-dax) |
| [LOOKUP](/dax/lookup-function-dax) | Evaluates an expression in the visual matrix using the current context. | LookupSalesFor2025WithContext = LOOKUP(SUM([Sales]), [Year], "2025") | N/A |
| [LOOKUPWITHTOTALS](/dax/lookupwithtotals-function-dax) | Evaluates an expression in the visual matrix with totals. | LookupSalesFor2025WithTotals = LOOKUPWITHTOTALS(SUM([Sales]), [Year], "2025") | N/A |
| [MOVINGAVERAGE](/dax/movingaverage-function-dax) | Adds a moving average on an axis. | MovingAverageSales = MOVINGAVERAGE([Sales Amount], 2) | [WINDOW](/dax/window-function-dax) |
| [NEXT](/dax/next-function-dax) | Refers to a next row of an axis. | ProfitVSNext = [Profit] - NEXT([Profit]) | [OFFSET(1)](/dax/offset-function-dax) |
| [PREVIOUS](/dax/previous-function-dax) | Refers to a previous row of an axis. | ProfitVSPrevious = [Profit] - PREVIOUS([Profit]) | [OFFSET(-1)](/dax/offset-function-dax) |
| [RANGE](/dax/range-function-dax) | Refers to a slice of rows of an axis. | AverageSales = AVERAGEX(RANGE(1), [Sales Amount]) | [WINDOW](/dax/window-function-dax) |
| [RUNNINGSUM](/dax/runningsum-function-dax) | Adds a running sum on an axis. | RunningSumSales = RUNNINGSUM([Sales Amount]) | [WINDOW](/dax/window-function-dax) |

## Parameters that control calculation flow

Some visual calculation functions accept optional parameters that control how the calculation traverses the visual matrix:

* **:::no-loc text="Axis":::** and **:::no-loc text="Reset":::** are specific to visual calculations. They reference the visual structure rather than specific fields.
* **:::no-loc text="OrderBy":::** and **:::no-loc text="PartitionBy":::** also work in calculated columns and measures. They reference fields directly.

The following sections describe each parameter and when to use one over another.

### :::no-loc text="Axis":::

Many functions have an optional **:::no-loc text="Axis":::** parameter, which you can use only in visual calculations. The :::no-loc text="Axis"::: parameter influences how the visual calculation traverses the visual matrix. The :::no-loc text="Axis"::: parameter defaults to the first axis in the visual. For many visuals, the first axis is :::no-loc text="ROWS":::, which means that the visual calculation is evaluated row-by-row in the visual matrix, from top to bottom. The following table shows the valid values for the :::no-loc text="Axis"::: parameter:

| :::no-loc text="Axis"::: icon | :::no-loc text="Axis"::: name | Description |
| --- | --- | --- |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-10.png" border="false"::: | :::no-loc text="ROWS"::: | Calculates vertically across rows from top to bottom. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-11.png" border="false":::  | :::no-loc text="COLUMNS"::: | Calculates horizontally across columns from left to right. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-12.png" border="false":::  | :::no-loc text="ROWS COLUMNS"::: | Calculates vertically across rows from top to bottom, continuing column by column from left to right. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-13.png" border="false":::  | :::no-loc text="COLUMNS ROWS"::: | Calculates horizontally across columns from left to right, continuing row by row from top to bottom. |

> [!NOTE]
> If you specify an axis that isn't present on the visual, the calculation ignores that axis.

### :::no-loc text="Reset":::

Many functions include an optional **:::no-loc text="Reset":::** parameter that you can use only in visual calculations. The :::no-loc text="Reset"::: parameter controls if and when the function resets its value to 0 or switches to a different scope while traversing the visual matrix. It controls this behavior by partitioning the target column. As calculations occur within a partition, how the column is divided into partitions determines if a calculation resets.

The default value for the :::no-loc text="Reset"::: parameter is **:::no-loc text="NONE":::**, which means the visual calculation never restarts.

The :::no-loc text="Reset"::: parameter accepts different types of values:

* Integers
* Column references
* Special [synonyms](#reset-parameter-synonyms): :::no-loc text="HIGHESTPARENT":::, :::no-loc text="LOWESTPARENT":::, :::no-loc text="NONE":::

In every case, the parameter specifies a single level in the visual calculation hierarchy (the target level). However, how the calculation interprets this level can vary.

The :::no-loc text="Reset"::: behavior operates in two different modes: [absolute](#absolute-reset-mode) and [relative](#relative-reset-mode).

When you use integer values for the parameter or their equivalents :::no-loc text="NONE":::, :::no-loc text="HIGHESTPARENT":::, and :::no-loc text="LOWESTPARENT":::, you can choose between these two modes by the integer's signal: positive values perform a reset in absolute mode, and negative values perform a reset in relative mode (and zero does no reset at all, the default behavior).

If you specify a column reference, you're also operating in absolute mode. These values determine how the target column is partitioned and therefore if it resets. The following sections describe these two modes:

#### Absolute reset mode

Absolute mode is a behavior of the :::no-loc text="Reset"::: parameter in visual calculations. This mode indicates that the calculation should partition by the target column and all those columns above it. This rule applies at every level in the calculation. At levels above the target column (where the target column isn't present, and possibly other columns), the calculation partitions by the remaining columns available.
The positive integer value identifies the target column starting from the top (the top column is 1, the next is 2, and so on). It goes up to N (the number of columns in the hierarchy), and any higher values are trimmed down. Alternatively, you can specify the column directly.

For example, consider a visual calculation with these hierarchy levels: Year, Quarter, Month, and Day. The following table shows how the calculation partitions at each level depending on the value of :::no-loc text="Reset"::::

|Level / value |:::no-loc text="Reset"::: = 1 or Year|:::no-loc text="Reset"::: = 2 or Quarter|:::no-loc text="Reset"::: = 3 or Month|:::no-loc text="Reset"::: = 4 or Day|
|--|--|--|--|--|
|Day level|Year|Quarter and Year|Month, Quarter and Year|Day, Month, Quarter and Year|
|Month level|Year|Quarter and Year|Month, Quarter and Year|Month, Quarter and Year|
|Quarter level|Year|Quarter and Year|Quarter and Year|Quarter and Year|
|Year level|Year|Year|Year|Year|
|Grand total level|None|None|None|None|

#### Relative reset mode

Relative mode is a behavior of the :::no-loc text="Reset"::: parameter in visual calculations. Given a negative integer value –X, at each level the calculation partitions by all columns X levels or more above it in the hierarchy (or doesn't partition at all if no such level exists).
Valid values for this mode are between -1 and -N+1 (where N is the number of columns in the hierarchy), and any lower values are trimmed up.
Again, consider a visual calculation with these hierarchy levels: Year, Quarter, Month, and Day. The following table shows how the calculation partitions at each level depending on the value of :::no-loc text="Reset":::

|Level / value |:::no-loc text="Reset"::: = -1|:::no-loc text="Reset"::: = -2|:::no-loc text="Reset"::: = -3|
|--|--|--|--|
|Day level|Month, Quarter and Year|Quarter and Year|Year|
|Month level|Quarter and Year|Year|None|
|Quarter level|Year|None|None|
|Year level|None|None|None|
|Grand total level|None|None|None|

#### Reset parameter synonyms

The :::no-loc text="Reset"::: parameter also provides the following synonyms:

* **:::no-loc text="NONE":::** is the default value. It doesn't reset the calculation and is equivalent to 0.
* **:::no-loc text="HIGHESTPARENT":::** performs an absolute reset by the highest level and is equivalent to 1.
* **:::no-loc text="LOWESTPARENT":::** performs a relative reset by the immediate parent and is equivalent to -1.

#### Examples of using the Reset parameter

Consider a visual calculation with these hierarchy levels: Year, Quarter, Month, and Day. The following visual calculations are equivalent and return the sum of *Sales Amount* that restarts for every year, regardless of the level the calculation is evaluated on (see [absolute reset mode](#absolute-reset-mode)):

```dax
RUNNINGSUM([Sales Amount], HIGHESTPARENT)
```

```dax
RUNNINGSUM([Sales Amount], 1)
```

```dax
RUNNINGSUM([Sales Amount], [Year])
```

In contrast, the following visual calculations both return the sum of *Sales Amount* that starts from 0 for every immediate parent, which depends on which level the calculation is evaluated on (see [relative reset mode](#relative-reset-mode)).

```dax
RUNNINGSUM([Sales Amount], LOWESTPARENT)
```

```dax
RUNNINGSUM([Sales Amount], -1)
```

Finally, this visual calculation does **not** reset, and continues adding the *Sales Amount* value for each day to the previous values, without restarting.

```dax
RUNNINGSUM([Sales Amount])
```

### :::no-loc text="OrderBy"::: and :::no-loc text="PartitionBy":::

The :::no-loc text="OrderBy"::: parameter accepts [ORDERBY](/dax/orderby-function-dax), and the :::no-loc text="PartitionBy"::: parameter accepts [PARTITIONBY](/dax/partitionby-function-dax). Unlike :::no-loc text="Axis"::: and :::no-loc text="Reset":::, you can use these parameters in calculated columns, measures, and visual calculations, and they refer to fields directly.

Not all functions provide these parameters. Visual calculation-exclusive functions don't provide a :::no-loc text="PartitionBy"::: parameter. Window functions only provide a :::no-loc text="Reset"::: parameter if you use them in a visual calculation. The :::no-loc text="Relation"::: parameter on window functions is available whether or not you use it in a visual calculation, but it only accepts an :::no-loc text="Axis"::: if you use it in a visual calculation.

### Choose between these parameters

You don't need to specify all of these parameters, and you can combine them. To decide which parameter to use:

* Prefer :::no-loc text="Axis"::: and :::no-loc text="Reset"::: when you want field-agnostic behavior that follows the visual structure. Referring to the visual structure is more flexible than explicitly referencing fields.
* Use :::no-loc text="OrderBy"::: and :::no-loc text="PartitionBy"::: when you want to pin the calculation to specific fields regardless of the visual layout.
* Use :::no-loc text="PartitionBy"::: instead of :::no-loc text="Reset"::: when the axis has only one level. :::no-loc text="Reset"::: expects multiple levels on the axis, so it doesn't work when there's only one field or when multiple fields exist in a single level on the axis.

### Parameter pickers

Parameter pickers make it easy to select values for parameters in visual calculation functions. For example, in the following image, you see the **Look up a value with totals** template loaded:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-parameter-picker.png" alt-text="Screenshot showing the parameter picker." lightbox="media/desktop-visual-calculations-overview/desktop-visual-calculations-parameter-picker.png":::

You can also activate the parameter pickers by using the **CTRL+SPACE** keyboard shortcut.

## Visual calculation templates

Visual calculations include templates to make it easier to write common calculations. The template button in visual calculations edit mode opens a menu of available templates.

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-08.png" alt-text="Screenshot of using templates for visual calculations.":::

The following templates are available:

* **Running sum.** Calculates the sum of values, adding the current value to the preceding values. Uses the :::no-loc text="RUNNINGSUM"::: function.
* **Moving average.** Calculates an average of a set of values in a given window by dividing the sum of the values by the size of the window. Uses the :::no-loc text="MOVINGAVERAGE"::: function.
* **Percent of parent.** Calculates the percentage of a value relative to its parent. Uses the :::no-loc text="COLLAPSE"::: function.
* **Percent of grand total.** Calculates the percentage of a value relative to all values, using the :::no-loc text="COLLAPSEALL"::: function.
* **Average of children.** Calculates the average value of the set of child values. Uses the :::no-loc text="EXPAND"::: function.
* **Versus previous.** Compares a value to a preceding value, using the :::no-loc text="PREVIOUS"::: function.
* **Versus next.** Compares a value to a subsequent value, using the :::no-loc text="NEXT"::: function.
* **Versus first.** Compares a value to the first value, using the :::no-loc text="FIRST"::: function.
* **Versus last.** Compares a value to the last value, using the :::no-loc text="LAST"::: function.
* **Look up a value with context.** Find a value or evaluate an expression on the visual matrix within the current context, using the :::no-loc text="LOOKUP"::: function.
* **Look up a value with totals.** Find a value or evaluate an expression on the visual matrix with totals, using the :::no-loc text="LOOKUPWITHTOTALS"::: function.

## Hide fields on the visual

In visual calculations edit mode, you can hide fields from the visual just like you hide columns and tables in the modeling view. For example, to show only the *Profit* visual calculation, hide *Sales Amount* and *Total Product Cost* from view.

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-07.png" alt-text="Screenshot of hiding elements from a visual's view.":::

Hiding fields doesn't remove them from the visual or from the visual matrix, so your visual calculations can still refer to them and continue to work. A hidden field still appears on the visual matrix but isn't shown on the resulting visual. Only include hidden fields if they're necessary for your visual calculations to work.

## Format a visual calculation

Format a visual calculation by using data types and formatting options, or by using a [custom visual level format string](../create-reports/desktop-custom-format-strings.md). The **Data format** options in the General section of the formatting pane control the format.

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-format-strings.png" alt-text="Screenshot of the visual calculations edit mode showing a visual calculation that returns a percentage formatted as a percentage.":::

## Considerations and limitations

### Unsupported visual types

Visual calculations and hidden fields don't work with the following visuals:

* Slicer, R visual, Python visual
* Key Influencers, Decomposition Tree, Q&A, Smart Narrative
* Metrics, Paginated Report, Power Apps, Power Automate
* Small multiples, Play axis on Scatter chart
* Custom visuals

### Unsupported features

The following features aren't available with visual calculations:

* Filtering, sorting, or [changing aggregations](../create-reports/service-aggregates.md#change-how-a-numeric-field-is-aggregated)
* Self-referencing (a calculation can't refer to itself)
* Copy/paste or reuse across visuals
* [Data categories](desktop-data-categorization.md), [data limits](../visuals/power-bi-data-points.md), or [show items with no data](../create-reports/desktop-show-items-no-data.md)
* [Dynamic format strings](../create-reports/desktop-dynamic-format-strings.md) (can't set or use as format string)
* [Personalization](../explore-reports/end-user-personalize-visuals.md) of visual calculations or hidden fields
* *See records* drill-through
* IntelliSense in Power BI embedded

### Publishing and sharing limitations

* Can't pin to [dashboards](../create-reports/service-dashboards.md)
* Can't use [Publish to web](../collaborate-share/service-publish-to-web.md)
* Data exports exclude visual calculation results; hidden fields only appear in [underlying data](../visuals/power-bi-visualization-export-data.md) exports

### Other limitations

* [Field parameters](../create-reports/power-bi-field-parameters.md) work with visual calculations but have some limitations.
* Live connections to SQL Server Analysis Services require version 2025 or later.

## Related content

For more information on using visual calculations, see the following resources:

* [Create visual calculations](desktop-visual-calculations-create.md)
* [Training module: Create visual calculations in Power BI Desktop](/training/modules/power-bi-visual-calculations/)
* [Use calculations options in Power BI Desktop](desktop-calculations-options.md)
* [Create measures for data analysis in Power BI Desktop](desktop-measures.md)
* [Create and format table visualizations in Power BI](../visuals/power-bi-visualization-tables.md) - includes custom totals, which are powered by visual calculations.
