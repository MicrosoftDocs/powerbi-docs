---
title: Using visual calculations in Power BI Desktop
description: Learn how to create visual calculations using Data Analysis Expressions (DAX) formulas in Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 02/16/2024
LocalizationGroup: Model your data
---
# Using visual calculations (preview)

> [!NOTE]
> Visual calculations are currently in  **preview**.

A visual calculation is a DAX calculation that's defined and executed directly on a visual. Visual calculations make it easier to create calculations that were previously hard to create, leading to simpler DAX, easier maintenance, and better performance.

Here's an example visual calculation that defines a running sum for **Sales Amount**. Notice that the DAX required is straightforward:

`Running sum = RUNNINGSUM([Sales Amount])`

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-01.png" alt-text="Screenshot of DAX for visual calculations.":::

A calculation can refer to any data in the visual including columns, measures, or other visual calculations, which removes the complexity of the semantic model and simplifies the process of writing DAX. You can use visual calculations to complete common business calculations such as running sums or moving averages.

Visual calculations differ from the other calculations options in DAX:

* Visual calculations aren't stored in the model, and instead are stored on the visual, which means visual calculations can only refer to what's on the visual. Anything in the model must be added to the visual before the visual calculation can refer to it, freeing visual calculations from being concerned with the complexity of filter context and the model.

* Visual calculations combine the simplicity of context from calculated columns with the on-demand calculation flexibility from measures.

* Compared to measures, visual calculations operate on aggregated data instead of the detail level, often leading to performance benefits. When a calculation can be achieved either by a new measure or a visual calculation, the latter often leads to better performance.

* Since visual calculations are part of the visual, they can refer to the visual structure which leads to more flexibility.

For a more in-depth comparison of ways of adding calculations in Power BI, see [Using calculations options in Power BI Desktop](desktop-calculations-options.md).

Once you enable visual calculations, you can:

* Add visual calculations to your reports
* Hide certain fields
* Create visual calculations quickly using templates
* Make flexible visual calculations by referring to the visual's axes

The following sections provide details about how each of the elements, described in the previous bullets, work with visual calculations.

## Enable visual calculations

To use visual calculations, you must enable it in **Options and Settings** > **Options** > **Preview features**. Select **Visual calculations** and select **OK**. Visual calculations are enabled after Power BI Desktop is restarted.

## Adding a visual calculation

To add a visual calculation, select a visual and then select the **New calculation** button in the ribbon:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-02.png" alt-text="Screenshot of selecting the new calculation button in the ribbon.":::

The visual calculations window opens in **Edit** mode. The **Edit** mode screen consists of three major sections, as shown from top to bottom in the following image:

* The **visual preview** which shows the visual you're working with
* A **formula bar** where you can add visual calculations
* The **visual matrix** which shows the data in the visual, and displays the results of visual calculations as you add them

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-03.png" alt-text="Screenshot showing areas of the visual calculations edit screen.":::

To add a visual calculation, type the expression in the formula bar. For example, in a visual that contains **Sales Amount** and **Total Product Cost** by **Fiscal Year**, you can add a visual calculation that calculates the profit for each year by simply typing: *Profit = [Sales Amount] – [Total Product Cost]*.

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-04.png" alt-text="Screenshot of entering a visual calculation.":::

By default, most visual calculations on a visual are evaluated row-by-row, like a calculated column. In the previous example, for each row of the visual matrix the current *Sales Amount* and *Total Product Cost* are subtracted, and the result is returned in the *Profit* column. Although possible, there's no need to add an aggregation function like [SUM](/dax/sum-function-dax) as you would in a measure. In fact, it's better not to add such aggregates when they're not necessary, so you can more easily distinguish between measures and visual calculation expressions.

As you add visual calculations, they're shown in the list of fields on the visual:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-05.png" alt-text="Screenshot of visual calculations being displayed in the list of fields on the visual.":::

Additionally, the visual calculation is shown on the visual:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-06.png" alt-text="Screenshot of visual calculations being displayed on the visual.":::

You can use many existing DAX functions in visual calculations. Functions specific to visual calculations are also available. Since visual calculations work within the confines of the visual matrix, functions that rely on model relationships such as [USERELATIONSHIP](/dax/userelationship-function-dax), [RELATED](/dax/related-function-dax) or [RELATEDTABLE](/dax/relatedtable-function-dax) can't be used.

## Hiding fields from the visual

In visual calculations edit mode, you can hide fields from the visual just like you can hide columns and tables in the modeling view. For example, if you wanted to only show the *Profit* visual calculation, you can hide *Sales Amount* and *Total Profit* cost from view:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-07.png" alt-text="Screenshot of hiding elements from a visual's view.":::

Hiding fields doesn't remove them from the visual or from the visual matrix, so your visual calculations can still refer to them and continue to work. A hidden field is still shown on the visual matrix but is simply not shown on the resulting visual. It's a recommended practice to only include hidden fields if they're necessary for your visual calculations to work.

## Using templates

Visual calculations include templates to make it easier to write common calculations. You can find templates by selecting the template button and choosing a template to work with:

:::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-08.png" alt-text="Screenshot of using templates for visual calculations.":::

The following templates are available:

* **Running sum.** Calculates the sum of values, adding the current value to the preceding values. Uses the RUNNINGSUM function.
* **Moving average.** Calculates an average of a set of values in a given window by dividing the sum of the values by the size of the window. Uses the MOVINGAVERAGE function.
* **Percent of parent.** Calculates the percentage of a value relative to its parent. Uses the COLLAPSE function.
* **Percent of grand total.** Calculates the percentage of a value relative to all values, using the COLLAPSEALL function.
* **Average of children.** Calculates the average value of the set of child values. Uses the EXPAND function.
* **Versus previous.** Compares a value to a preceding value, using the PREVIOUS function.
* **Versus next.** Compares a value to a subsequent value, using the NEXT function.
* **Versus first.** Compares a value to the first value, using the FIRST function.
* **Versus last.** Compares a value to the last value, using the LAST function.

Selecting a template inserts the template in the formula bar. You can use these templates as starting points. You can also add your own expressions without relying on templates.

## Axis

Many functions have an optional **Axis** parameter, which can only be used in visual calculations. Axis influences how the visual calculation traverses the visual matrix. The Axis parameter is set to the first axis in the visual by default. For many visuals the first axis is ROWS, which means that the visual calculation is evaluated row-by-row in the visual matrix, from top to bottom. The following table shows the valid values for the Axis parameter:

| Axis icon | Axis name | Description |
| --- | --- | --- |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-10.png" border="false"::: | ROWS | Calculates vertically across rows from top to bottom. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-11.png" border="false":::  | COLUMNS | Calculates horizontally across columns from left to right. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-12.png" border="false":::  | ROWS COLUMNS | Calculates vertically across rows from top to bottom, continuing column by column from left to right. |
| :::image type="icon" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-13.png" border="false":::  | COLUMNS ROWS | Calculates horizontally across columns from left to right, continuing row by row from top to bottom. |

> [!NOTE]
> You can only use axis values that are available in the visual you're working on. Not all visuals provide all axes, and some visuals provide no axes.

## Reset

Many functions have an optional **Reset** parameter that is available in visual calculations only. Reset influences if and when the function resets its value to 0 or switches to a different scope while traversing the visual matrix. The Reset parameter is set to None by default, which means the visual calculation is never restarted. Reset expects there to be multiple levels on the axis. If there's only one level on the axis, you can use [PARTITIONBY](/dax/partitionby-function-dax). The following list describes the only valid values for the Reset parameter:

* **NONE** is the default value and doesn't reset the calculation.
* **HIGHESTPARENT** resets the calculation when the value of the highest parent on the axis changes.
* **LOWESTPARENT** resets the calculations when the value of the lowest parent on the axis changes.
* A numerical value, referring to the fields on the axis, with the highest field being one.

To understand HIGHESTPARENT and LOWESTPARENT, consider an axis that has three fields on multiple levels: Year, Quarter, and Month. The HIGHESTPARENT is Year, while the lowest parent is Quarter. For example, a visual calculation that is defined as *RUNNINGSUM([Sales Amount], HIGHESTPARENT)* or *RUNNINGSUM([Sales Amount], 1)* returns a running sum of *Sales Amount* that starts from 0 for every year. A visual calculation defined as *RUNNINGSUM([Sales Amount], LOWESTPARENT)* or *RUNNINGSUM([Sales Amount], 2)* returns a running sum of *Sales Amount* that starts from 0 for every Quarter. Lastly, a visual calculation that is defined as *RUNNINGSUM([Sales Amount])* does **not** reset, and will continue adding the *Sales Amount* value for each month to the previous values, without restarting.

## Axis and Reset vs ORDERBY and PARTITIONBY

Axis, Reset, [ORDERBY](/dax/orderby-function-dax), and [PARTITIONBY](/dax/partitionby-function-dax) are four functions that can be used in pairs or together to influence how a calculation is evaluated. They form two pairs that are often used together:

* Axis and Reset
* ORDERBY and PARTITIONBY

Axis and Reset are only available for functions that can be used in visual calculations and can only be used in a visual calculation, as they reference the visual structure. ORDERBY and PARTITIONBY are functions that can be used in calculated columns, measures, and visual calculations and refer to fields. While they perform the same function, they're different in the level of abstraction provided; referring to the visual structure is more flexible than the explicit referencing to fields using ORDERBY or PARTITIONBY.

Reset expects there to be multiple levels on the axis. In case you don't have multiple levels on the axis, either because there's only one field or multiple fields in one single level on the axis, you can use PARTITIONBY.

Specifying either pair works well, but you can also specify Axis, ORDERBY and/or PARTITIONBY together, in which case the values specified for ORDERBY and PARTITIONBY override the values dictated by Axis. Reset can't be combined with ORDERBY and PARTITIONBY.

You can think of the ORDERBY and PARTITIONBY pair as pinning field references down by explicitly specifying fields, where Axis and Reset are field agnostic – they refer to the structure and whatever field happens to be on the structure that is getting used.

## Available functions

You can use many of the existing DAX functions in visual calculations. Since visual calculations work within the confines of the visual matrix, functions that rely on model relationships such as [USERELATIONSHIP](/dax/userelationship-function-dax), [RELATED](/dax/related-function-dax) or [RELATEDTABLE](/dax/relatedtable-function-dax) aren't available.

Visual calculations also introduce a set of functions specific to visual calculations. Many of these functions are easier to use shortcuts to DAX window functions:

| Function | Description | Example | Shortcut to |
| --- | --- | --- | --- |
| COLLAPSE | Calculation is evaluated at a higher level of the axis. | Percent of parent = DIVIDE([Sales Amount], COLLAPSE([Sales Amount], ROWS)) | N/A |
| COLLAPSEALL | Calculation is evaluated at the total level of the axis. | Percent of grand total = DIVIDE([Sales Amount], COLLAPSEALL([Sales Amount], ROWS)) | N/A |
| EXPAND | Calculation is evaluated at a lower level of the axis. | Average of children = EXPAND(AVERAGE([Sales Amount]), ROWS) | N/A |
| EXPANDALL | Calculation is evaluated at the leaf level of the axis. | Average of leaf level = EXPANDALL(AVERAGE([Sales Amount]), ROWS) | N/A |
| FIRST | Refers to the first row of an axis. | ProfitVSFirst = [Profit] – FIRST([Profit]) | [INDEX(1)](/dax/index-function-dax) |
| LAST | Refers to the last row of an axis. | ProfitVSLast = [Profit] – LAST([Profit]) | [INDEX(-1)](/dax/index-function-dax) |
| MOVINGAVERAGE | Adds a moving average on an axis. | MovingAverageSales = MOVINGAVERAGE([Sales Amount], 2) | [WINDOW](/dax/window-function-dax) |
| NEXT | Refers to a next row of an axis. | ProfitVSNext = [Profit] – NEXT([Profit]) | [OFFSET(1)](/dax/offset-function-dax) |
| PREVIOUS | Refers to a previous row of an axis. | ProfitVSPrevious = [Profit] – PREVIOUS([Profit]) | [OFFSET(-1)](/dax/offset-function-dax) |
| RANGE | Refers to a slice of rows of an axis. | AverageSales = AVERAGEX(RANGE(1), [Sales Amount]) | [WINDOW](/dax/window-function-dax) |
| RUNNINGSUM | Adds a running sum on an axis. | RunningSumSales = RUNNINGSUM([Sales Amount]) | [WINDOW](/dax/window-function-dax) |

## Considerations and limitations

Visual calculations are currently in preview, and during preview, you should be aware of the following considerations and limitations:

* Not all visual types are supported. Use the visual calculations edit mode to change visual type. Also, custom visuals haven't been tested with visual calculations or hidden fields.
* The following visual types and visual properties have been tested and found not to work with visual calculations or hidden fields:
  * Treemap
  * Map
  * Shape Map
  * Azure Map
  * Slicer
  * R visual
  * Python visual
  * Key Influencers
  * Decomposition Tree
  * Q&A
  * Smart Narrative
  * Metrics
  * Paginated Report
  * ArcGIS Maps
  * Power Apps
  * Power Automate
  * Small multiples
* Visual calculations and hidden fields can only be added and edited using Power BI Desktop. While you can publish a report that contains visual calculations to the Power BI service, you can't edit visual calculations or hidden fields in the Power BI service.
* Performance of this feature isn't representative of the end product.
* Reuse of visual calculations using copy/paste or other mechanisms isn't available.
* You can't filter on visual calculations.
* A visual calculation can't refer to itself on the same or different detail level.
* [Personalization](../consumer/end-user-personalize-visuals.md) of visual calculations or hidden fields isn't available.
* You can't use the [Publish to web](../collaborate-share/service-publish-to-web.md) functionality with reports that use visual calculations or hidden fields.
* You can't [export underlying data](../visuals/power-bi-visualization-export-data.md) from visuals that use visual calculations or hidden fields.
* You can't use the *see records* drill-through functionality with visuals that use visual calculations or hidden fields.
* You can't set built-in or custom [format strings](../create-reports/desktop-custom-format-strings.md) on visual calculations.
* You can't set [data categories](desktop-data-categorization.md) on visual calculations.
* You can't [change aggregations](../create-reports/service-aggregates#change-how-a-numeric-field-is-aggregated) on visual calculations.
* You can't change the sort order for visual calculations.
* Power BI Embedded isn't supported for reports that use visual calculations or hidden fields.
* Live connections to SQL Server Analysis Services aren't supported.

## Next steps

The following articles may be useful when learning and using visual calculations: 

* [Using calculations options in Power BI Desktop](desktop-calculations-options.md)
* [Create measures for data analysis in Power BI Desktop](desktop-measures.md)
* [WINDOW DAX function](/dax/window-function-dax)
* [OFFSET DAX function](/dax/offset-function-dax)
* [INDEX DAX function](/dax/index-function-dax)
* [ORDERBY DAX function](/dax/orderby-function-dax)

