---
title: Using visual calculations in Power BI Desktop
description: Learn how to create visual calculations using Data Analysis Expressions (DAX) formulas in Power BI Desktop.
author: eric-urban
ms.author: eur
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 10/01/2025
LocalizationGroup: Model your data
no-loc: [RUNNINGSUM, MOVINGAVERAGE, COLLAPSE, COLLAPSEALL, EXPAND, EXPANDALL, PREVIOUS, NEXT, FIRST, LAST, LOOKUP, LOOKUPWITHTOTALS, ROWS, COLUMNS, ROWS COLUMNS, COLUMNS ROWS, NONE, HIGHESTPARENT, LOWESTPARENT, ISATLEVEL, RANGE, WINDOW, OFFSET, INDEX, ORDERBY]
---
# Using visual calculations (preview)

> [!NOTE]
> Visual calculations are currently in  **preview**.

A visual calculation is a DAX calculation defined and executed directly on a visual. Visual calculations make it easier to create calculations that were previously hard to create, leading to simpler DAX, easier maintenance, and better performance.

Here's an example visual calculation that defines a running sum for **Sales Amount**. Notice that the DAX required is straightforward:

```dax
Running sum = RUNNINGSUM([Sales Amount])
```

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-01.png" alt-text="Screenshot of DAX for visual calculations.":::

A calculation can refer to any data in the visual including columns, measures, or other visual calculations. This ability removes the complexity of the semantic model and simplifies the process of writing DAX. You can use visual calculations to complete common business calculations such as running sums or moving averages.

Visual calculations differ from the other calculations options in DAX:

* Visual calculations aren't stored in the model, and instead are stored on the visual. This means visual calculations can only refer to what's on the visual. Anything in the model must be added to the visual before the visual calculation can refer to it, freeing visual calculations from being concerned with the complexity of filter context and the model.

* Visual calculations combine the simplicity of context from calculated columns with the on-demand calculation flexibility from measures.

* Compared to measures, visual calculations operate on aggregated data instead of the detail level, often leading to performance benefits. When a calculation can be achieved either by a new measure or a visual calculation, the latter often leads to better performance.

* Since visual calculations are part of the visual, they can refer to the visual structure, which leads to more flexibility.

For a more in-depth comparison of ways of adding calculations in Power BI, see [Using calculations options in Power BI Desktop](desktop-calculations-options.md).

Once you enable visual calculations, you can:

* Add visual calculations to your reports
* Hide certain fields
* Create visual calculations quickly using templates
* Make flexible visual calculations by referring to the visual's axes

The following sections provide details about how each of the elements, described in the previous bullets, work with visual calculations.

## Enable visual calculations

Before September 2024, to use visual calculations, you must enable it in **Options and Settings** > **Options** > **Preview features**. Select **Visual calculations** and select **OK**. Visual calculations are enabled after Power BI Desktop is restarted.

From September 2024 onwards, this step is no longer necessary as visual calculations are enabled by default. While they're still in preview, you can use the above settings to disable visual calculations if preferred.

## Adding a visual calculation

To add a visual calculation, select a visual and then select the **New visual calculation** button in the ribbon:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-02.png" alt-text="Screenshot of selecting the new visual calculation button in the ribbon.":::

The visual calculations window opens in **Edit** mode. The **Edit** mode screen consists of three major sections, as shown from top to bottom in the following image:

* The **visual preview** which shows the visual you're working with
* A **formula bar** where you can add visual calculations
* The **visual matrix** which shows the data in the visual, and displays the results of visual calculations as you add them. Any styling or theming you apply to your visual isn't applied to the visual matrix.

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-03.png" alt-text="Screenshot showing areas of the visual calculations edit screen." lightbox="media/desktop-visual-calculations-overview/desktop-visual-calculations-03.png":::

To add a visual calculation, type the expression in the formula bar. For example, in a visual that contains **Sales Amount** and **Total Product Cost** by **Fiscal Year**, you can add a visual calculation that calculates the profit for each year by typing:

```dax
Profit = [Sales Amount] – [Total Product Cost]
```

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-04.png" alt-text="Screenshot of entering a visual calculation.":::

By default, most visual calculations on a visual are evaluated row-by-row, like a calculated column. In the previous example, for each row of the visual matrix the current *Sales Amount* and *Total Product Cost* are subtracted, and the result is returned in the *Profit* column. Although possible, there's no need to add an aggregation function like [SUM](/dax/sum-function-dax) as you would in a measure. In fact, it's better not to add such aggregates when they're not necessary, so you can more easily distinguish between measures and visual calculation expressions.

As you add visual calculations, they're shown in the list of fields on the visual:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-05.png" alt-text="Screenshot of visual calculations being displayed in the list of fields on the visual.":::

Additionally, the visual calculation is shown on the visual:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-06.png" alt-text="Screenshot of visual calculations being displayed on the visual.":::

You can use many existing DAX functions in visual calculations. Functions specific to visual calculations are also available. Because visual calculations work within the confines of the visual matrix, functions that rely on model relationships such as [USERELATIONSHIP](/dax/userelationship-function-dax), [RELATED](/dax/related-function-dax) or [RELATEDTABLE](/dax/relatedtable-function-dax) can't be used.

## Hiding fields from the visual

In visual calculations edit mode, you can hide fields from the visual just like you can hide columns and tables in the modeling view. For example, if you wanted to only show the *Profit* visual calculation, you can hide *Sales Amount* and *Total Profit* cost from view:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-07.png" alt-text="Screenshot of hiding elements from a visual's view.":::

Hiding fields doesn't remove them from the visual or from the visual matrix, so your visual calculations can still refer to them and continue to work. A hidden field is still shown on the visual matrix but isn't shown on the resulting visual. It's a recommended practice to only include hidden fields if they're necessary for your visual calculations to work.

## Using templates

Visual calculations include templates to make it easier to write common calculations. You can find templates by selecting the template button and choosing a template to work with:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-08.png" alt-text="Screenshot of using templates for visual calculations.":::

You can also create a templated visual calculation from the ribbon by clicking the bottom part of the **New Visual Calculation** button.

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

Selecting a template inserts the template in the formula bar. You can use these templates as starting points. You can also add your own expressions without relying on templates.

## Parameter pickers
Parameter pickers make it easy to select values for parameters in visual calculations functions. For example, here we loaded the **Look up a value with totals** template:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-parameter-picker.png" alt-text="Screenshot showing the parameter picker." lightbox="media/desktop-visual-calculations-overview/desktop-visual-calculations-parameter-picker.png":::

You can also activate the parameter pickers using the **CTRL+SPACE** keyboard shortcut.


## :::no-loc text="Axis":::

Many functions have an optional **:::no-loc text="Axis":::** parameter, which can only be used in visual calculations. :::no-loc text="Axis"::: influences how the visual calculation traverses the visual matrix. The :::no-loc text="Axis"::: parameter is set to the first axis in the visual by default. For many visuals the first axis is :::no-loc text="ROWS":::, which means that the visual calculation is evaluated row-by-row in the visual matrix, from top to bottom. The following table shows the valid values for the :::no-loc text="Axis"::: parameter:

| :::no-loc text="Axis"::: icon | :::no-loc text="Axis"::: name | Description |
| --- | --- | --- |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-10.png" border="false"::: | :::no-loc text="ROWS"::: | Calculates vertically across rows from top to bottom. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-11.png" border="false":::  | :::no-loc text="COLUMNS"::: | Calculates horizontally across columns from left to right. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-12.png" border="false":::  | :::no-loc text="ROWS COLUMNS"::: | Calculates vertically across rows from top to bottom, continuing column by column from left to right. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-13.png" border="false":::  | :::no-loc text="COLUMNS ROWS"::: | Calculates horizontally across columns from left to right, continuing row by row from top to bottom. |

> [!NOTE]
> If you specify an axis that isn't present on the visual, that axis is ignored.

## :::no-loc text="Reset":::

Many functions have an optional **:::no-loc text="Reset":::** parameter that is available in visual calculations only. :::no-loc text="Reset"::: influences if and when the function resets its value to 0 or switches to a different scope while traversing the visual matrix. It does this by partitioning the target column. As calculations are performed within a partition, how the column is divided in partitions decides if a calculation resets.
The :::no-loc text="Reset"::: parameter is set to **:::no-loc text="NONE":::** by default, which means the visual calculation is never restarted.
The :::no-loc text="Reset"::: parameter accepts different types of values:
* integers
* column references
* Special [synonyms](#synonyms): :::no-loc text="HIGHESTPARENT":::, :::no-loc text="LOWESTPARENT":::, :::no-loc text="NONE":::

In every case it specifies a single level in the visual calculation hierarchy (let’s call it the target level). However, how this level is interpreted in the calculation can vary.
The :::no-loc text="Reset"::: behavior operates in two different modes: [absolute](#absolute-mode) and [relative](#relative-mode).

When using integer values for the parameter or their equivalents :::no-loc text="NONE":::, :::no-loc text="HIGHESTPARENT"::: and :::no-loc text="LOWESTPARENT":::, you can choose between these two modes via the integer’s signal: positive values perform a reset in absolute mode, and negative values perform a reset in relative mode (and zero does no reset at all, the default behavior).

If you specify a column reference, you're also operating in absolute mode. These values determine how the target column is partitioned and therefore if it resets. These two modes are described in the following section:

### Absolute mode
This mode indicates that the calculation should be partitioned by the target column and all those above it, and this applies at every level in the calculation. At levels above the target (where the target column isn’t present, and possibly others), the calculation is partitioned by the remaining columns available.
The positive integer value identifies the target column starting from the top (the top column is 1, the next is 2, etc.). It goes up to N (the number of columns in the hierarchy), and any higher values are trimmed down. Alternatively, one can also specify the column directly.

For example, consider a visual calculation with these hierarchy levels: Year, Quarter, Month, and Day. The following table shows how the calculation will be partitioned at each level depending on the value of :::no-loc text="Reset"::::

|Level / value |:::no-loc text="Reset"::: = 1 or Year|:::no-loc text="Reset"::: = 2 or Quarter|:::no-loc text="Reset"::: = 3 or Month|:::no-loc text="Reset"::: = 4 or Day|
|--|--|--|--|--|
|Day level|Year|Quarter and Year|Month, Quarter and Year|Day, Month, Quarter and Year|
|Month level|Year|Quarter and Year|Month, Quarter and Year|Month, Quarter and Year|
|Quarter level|Year|Quarter and Year|Quarter and Year|Quarter and Year|
|Year level|Year|Year|Year|Year|
|Grand total level|None|None|None|None|

### Relative mode
Given a negative integer value –X, at each level the calculation is partitioned by all columns X levels or more above it in the hierarchy (or not partitioned at all if no such level exists).
Valid values for this mode are between -1 and -N+1 (where N is the number of columns in the hierarchy), and any lower values are trimmed up.
Again, consider the visual calculation described earlier. The table below shows how the calculation will be partitioned at each level depending on the value of Reset:

|Level / value |:::no-loc text="Reset"::: = -1|:::no-loc text="Reset"::: = -2|:::no-loc text="Reset"::: = -3|
|--|--|--|--|
|Day level|Month, Quarter and Year|Quarter and Year|Year|
|Month level|Quarter and Year|Year|None|
|Quarter level|Year|None|None|
|Year level|None|None|None|
|Grand total level|None|None|None|

### Synonyms
:::no-loc text="Reset"::: also provides the following synonyms:
* **:::no-loc text="NONE":::** is the default value. It doesn't reset the calculation and is equivalent to 0.
* **:::no-loc text="HIGHESTPARENT":::** performs an absolute reset by the highest level and is Equivalent to 1.
* **:::no-loc text="LOWESTPARENT":::** performs a relative reset by the immediate parent and is equivalent to -1.

### Examples of using :::no-loc text="Reset":::
For example, consider the visual calculation described earlier. The visual calculations are equivalent and return the sum of *Sales Amount* that restarts for every year, regardless of the level the calculation is evaluated on (see [absolute mode](#absolute-mode)):

```dax
RUNNINGSUM([Sales Amount], HIGHESTPARENT)
```

```dax
RUNNINGSUM([Sales Amount], 1)
```

```dax
RUNNINGSUM([Sales Amount], [Year])
```

In contrast, the following visual calculations both return the sum of *Sales Amount* that starts from 0 for every immediate parent, which depends on which level the calculation is evaluated on (see [relative mode](#relative-mode)).

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

## :::no-loc text="Axis":::, :::no-loc text="Reset":::, :::no-loc text="OrderBy"::: and :::no-loc text="PartitionBy":::

The :::no-loc text="Axis":::, :::no-loc text="Reset":::, :::no-loc text="OrderBy"::: (accepts [ORDERBY](/dax/orderby-function-dax)), and the :::no-loc text="PartitionBy"::: (accepts [PARTITIONBY](/dax/partitionby-function-dax)) parameters can be used to influence how a calculation is evaluated. They don't all have to be specified and can be used in combination with each other. Not all functions provide them, as visual calculations exclusive functions do not provide a :::no-loc text="PartitionBy"::: parameter. Window functions only provide a :::no-loc text="Reset"::: parameter if used in a visual calculation. The :::no-loc text="Relation"::: parameter on window functions is available regardless if used in a visual calculation or not, but only accepts an :::no-loc text="Axis"::: if used in a visual calculation.

:::no-loc text="Axis"::: and :::no-loc text="Reset"::: reference the visual structure. The :::no-loc text="OrderBy"::: and :::no-loc text="PartitionBy"::: parameters can be used in calculated columns, measures, and visual calculations and refer to fields. While they perform the same function, they're different in the level of abstraction provided; referring to the visual structure is more flexible than the explicit referencing to fields using :::no-loc text="OrderBy"::: or :::no-loc text="PartitionBy":::.

:::no-loc text="Reset"::: expects there to be multiple levels on the axis. In case you don't have multiple levels on the axis, either because there's only one field or multiple fields in one single level on the axis, you can use :::no-loc text="PartitionBy":::.

You can think of :::no-loc text="OrderBy"::: and :::no-loc text="PartitionBy"::: as pinning field references down by explicitly specifying fields, where :::no-loc text="Axis"::: and :::no-loc text="Reset"::: are field agnostic – they refer to the structure and whatever field happens to be on the structure that is getting used.

## Available functions

You can use many of the existing DAX functions in visual calculations. Since visual calculations work within the confines of the visual matrix, functions that rely on model relationships such as [USERELATIONSHIP](/dax/userelationship-function-dax), [RELATED](/dax/related-function-dax) or [RELATEDTABLE](/dax/relatedtable-function-dax) aren't available.

Visual calculations also introduce a set of functions specific to visual calculations. Many of these functions are easier to use shortcuts to DAX window functions.

| Function | Description | Example | Shortcut to |
| --- | --- | --- | --- |
| [COLLAPSE](/dax/collapse-function-dax) | Calculation is evaluated at a higher level of the axis. | Percent of parent = DIVIDE([Sales Amount], COLLAPSE([Sales Amount], ROWS)) | N/A |
| [COLLAPSEALL](/dax/collapseall-function-dax) | Calculation is evaluated at the total level of the axis. | Percent of grand total = DIVIDE([Sales Amount], COLLAPSEALL([Sales Amount], ROWS)) | N/A |
| [EXPAND](/dax/expand-function-dax) | Calculation is evaluated at a lower level of the axis. | Average of children = EXPAND(AVERAGE([Sales Amount]), ROWS) | N/A |
| [EXPANDALL](/dax/expandall-function-dax) | Calculation is evaluated at the leaf level of the axis. | Average of leaf level = EXPANDALL(AVERAGE([Sales Amount]), ROWS) | N/A |
| [FIRST](/dax/first-function-dax) | Refers to the first row of an axis. | ProfitVSFirst = [Profit] – FIRST([Profit]) | [INDEX(1)](/dax/index-function-dax) |
| [ISATLEVEL](/dax/isatlevel-function-dax) | Reports whether a specified column is present at the current level. | IsFiscalYearAtLevel = ISATLEVEL([Fiscal Year]) | N/A |
| [LAST](/dax/last-function-dax) | Refers to the last row of an axis. | ProfitVSLast = [Profit] – LAST([Profit]) | [INDEX(-1)](/dax/index-function-dax) |
| [LOOKUP](/dax/lookup-function-dax)| Evaluate expression in visual matrix using the current context. | LookupSalesFor2025WithContext = LOOKUP(SUM([Sales]) [Year], "2025")| N/A |
| [LOOKUPWITHTOTALS](/dax/lookupwithtotals-function-dax)| Evaluate expression in visual matrix with totals. | LookupSalesFor2025WithTotals = LOOKUPWITHTOTALS(SUM([Sales]), [Year], "2025")| N/A|
| [MOVINGAVERAGE](/dax/movingaverage-function-dax) | Adds a moving average on an axis. | MovingAverageSales = MOVINGAVERAGE([Sales Amount], 2) | [WINDOW](/dax/window-function-dax) |
| [NEXT](/dax/next-function-dax) | Refers to a next row of an axis. | ProfitVSNext = [Profit] – NEXT([Profit]) | [OFFSET(1)](/dax/offset-function-dax) |
| [PREVIOUS](/dax/previous-function-dax) | Refers to a previous row of an axis. | ProfitVSPrevious = [Profit] – PREVIOUS([Profit]) | [OFFSET(-1)](/dax/offset-function-dax) |
| [RANGE](/dax/range-function-dax) | Refers to a slice of rows of an axis. | AverageSales = AVERAGEX(RANGE(1), [Sales Amount]) | [WINDOW](/dax/window-function-dax) |
| [RUNNINGSUM](/dax/runningsum-function-dax) | Adds a running sum on an axis. | RunningSumSales = RUNNINGSUM([Sales Amount]) | [WINDOW](/dax/window-function-dax) |

## Formatting visual calculations

You can format a visual calculation using data types and formatting options. You can also set a [custom visual level format string](../create-reports/desktop-custom-format-strings.md). Use the **Data format** options in the General section of the formatting pane for your visual to set the format:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-format-strings.png" alt-text="Screenshot of the visual calculations edit mode showing a visual calculation that returns a percentage formatted as a percentage.":::
## Example 1: Using visual calculation to return a Hex color code for conditional formatting

Step 1: Select the visual you would like to use the conditional formatting in:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-01.png" alt-text="Screenshot of a table visual with two columns Value and Progress.":::

Step 2: Select the **New visual calculation** button under the **Home** Tab:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-02.png" alt-text="Screenshot of the button to create a visual calculation in the Power BI Home Tab.":::

Step 3: Write your visual calculation. Here's an IF statement to return either green or red based on a measure being more than .5:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-03.png" alt-text="Screenshot of DAX code listed out in the visual calculation editor.":::

```dax
Conditional Hex Code = IF ( [Progress] > .5, "#5BA300", "#E91C1C" )
```

Step 4: Expand the Formatting pane and select **Properties**:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-04.png" alt-text="Screenshot of the formatting pane showing that you should select properties.":::

Step 5: Expand the **Data Format** section, select your visual calculation, and set both the Data Type and format to **Text**:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-05.png" alt-text="Screenshot of the formatting pane showing you should apply a data type to your visual calculation of text.":::

Step 6: Before exiting the visual calculation editor select the hide icon next to the visual calculation in the build section to hide it:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-06.png" alt-text="Screenshot of the build pane showing how to select a button to hide the visual calculation you're creating.":::

Step 7: Use it in a conditional formatting section: 

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-07.png" alt-text="Screenshot of a conditional formatting window where the visual calculation is selected.":::

Step 8: Exit the visual calculation editor by clicking the **Back to report** button:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-08.png" alt-text="Screenshot of the button you push to exit out of the visual calculation editor. Text is: Back to report.":::

Step 9: Enjoy your conditional formatted visual!

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-09.png" alt-text="Screenshot of the table from the first screenshot now with conditional formatting applied.":::

## Considerations and limitations

Visual calculations are currently in preview, and during preview, you should be aware of the following considerations and limitations:

* Not all visual types are supported. Use the visual calculations edit mode to change visual type. Also, custom visuals haven't been tested with visual calculations or hidden fields.
* The following visual types and visual properties have been tested and found not to work with visual calculations or hidden fields:
  * Slicer
  * R visual
  * Python visual
  * Key Influencers
  * Decomposition Tree
  * Q&A
  * Smart Narrative
  * Metrics
  * Paginated Report
  * Power Apps
  * Power Automate
  * Small multiples
  * Play axis on Scatter chart
* Performance of this feature isn't representative of the end product.
* Reuse of visual calculations using copy/paste or other mechanisms isn't available.
* You can't filter on visual calculations.
* A visual calculation can't refer to itself on the same or different detail level.
* [Personalization](../explore-reports/end-user-personalize-visuals.md) of visual calculations or hidden fields isn't available.
* You can't pin a visual that uses visual calculations or hidden fields to [a dashboard](../create-reports/service-dashboards.md).
* You can't use the [Publish to web](../collaborate-share/service-publish-to-web.md) functionality with reports that use visual calculations or hidden fields.
* When exporting data from visuals, visual calculation results aren't included in the [underlying data](../visuals/power-bi-visualization-export-data.md) export. Hidden fields are never included in the export, except when exporting the [underlying data](../visuals/power-bi-visualization-export-data.md).
* You can't use the *see records* drill-through functionality with visuals that use visual calculations or hidden fields.
* You can't set [data categories](desktop-data-categorization.md) on visual calculations.
* You can't [change aggregations](../create-reports/service-aggregates.md#change-how-a-numeric-field-is-aggregated) on visual calculations.
* You can't change the sort order for visual calculations.
* Live connections to SQL Server Analysis Services versions released before version 2025 aren't supported.
* Although you can use [field parameters](../create-reports/power-bi-field-parameters.md) with visual calculations, they have some limitations.
* [Show items with no data](../create-reports/desktop-show-items-no-data.md) isn't available with visual calculations.
* You can't use [data limits](../visuals/power-bi-data-points.md) with visual calculations.
* You can't set a [dynamic format string](../create-reports/desktop-dynamic-format-strings.md) on a visual calculation nor use a visual calculation as a dynamic format string for a field or measure.
* IntelliSense isn't available in Power BI embedded.

## Related content

For more information on using visual calculations, see the following resources:

* [Create visual calculations in Power BI Desktop (Training module)](/training/modules/power-bi-visual-calculations/)
* [Using calculations options in Power BI Desktop](desktop-calculations-options.md)
* [Create measures for data analysis in Power BI Desktop](desktop-measures.md)
* [WINDOW DAX function](/dax/window-function-dax)
* [OFFSET DAX function](/dax/offset-function-dax)
* [INDEX DAX function](/dax/index-function-dax)
* [ORDERBY DAX function](/dax/orderby-function-dax)
