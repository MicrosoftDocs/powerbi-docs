---
title: "Show Value as: Display Percentages in Visuals"
description: "Learn how to display data as percentages in Power BI visuals using Show value as. Transform raw values into percent of grand total, row total, or column total. Improve your reports today."
author: jeroenterheerdt 
ms.author: jterh
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 08/07/2025
LocalizationGroup: Create reports
---
# Show Value as: Display percentages in visuals

The **Show value as** feature in Power BI transforms how you display numerical data in visuals by converting raw values into percentages of totals. Use this capability to show data as percent of grand total, row total, or column total in matrix, table, and chart visualizations. This feature provides essential context for your data and is particularly useful when creating executive dashboards, performance reports, or comparative views where relative proportions matter more than absolute numbers.

:::image type="content" source="media/desktop-show-value-as/show-value-as-dropdown.png" alt-text="Screenshot of the visualization pane." lightbox="media/desktop-show-value-as/show-value-as-dropdown.png":::

## Access the "Show value as" menu

To apply "Show value as" to a measure in a Matrix or Table visual:

  1. Add a **Matrix** or **Table** visual to your report.
  1. Drag a numeric field (for example, Sales) into the **Values** section.
  1. Select the dropdown arrow within the field.
  1. Hover over **Show value as**.
  1. Select from options:
     - No calculation
     - Percent of grand total
     - (Matrix only) Percent of column total
     - (Matrix only) Percent of row total

Matrix options:

:::image type="content" source="media/desktop-show-value-as/show-value-as-matrix-options.png" alt-text="Screenshot of matrix visualization pane with show value as options." lightbox="media/desktop-show-value-as/show-value-as-matrix-options.png":::

Table options:

:::image type="content" source="media/desktop-show-value-as/show-value-as-table-options.png" alt-text="Screenshot of table visualization pane with show value as options." lightbox="media/desktop-show-value-as/show-value-as-table-options.png":::

## Options for "Show value as"

The following table describes each option in the **Show value as** menu:

|**Option**  |**Description**  |
|---------|---------|
|No calculation     |Displays the raw value (default behavior).         |
|Percent of grand total     |Displays each value as a percentage of the total value of all cells.         |
|Percent of column total     |Displays each value as a percentage of the total for its column (available for Matrix only).         |
|Percent of row total     |Displays each value as a percentage of the total for its row (available for Matrix only).        |

## Example of matrix visualization

Use the AdventureWorks DW 2020 dataset to build a Matrix with Country-Region from the Customer table in Rows, and Sales Amount from the Sales table to Values. Then, apply various "Show value as" options to compare results.

### Original matrix

The following image displays the raw data without any transformations.

:::image type="content" source="media/desktop-show-value-as/show-value-as-original-matrix.png" alt-text="Screenshot of original matrix example." lightbox="media/desktop-show-value-as/show-value-as-original-matrix.png":::

### Show value as percent of grand total in matrix

To replicate the following image, right-click on the drop-down menu of the measure, select **Show value as** and choose **Percent of grand total.** This option converts the raw values into percentages relative to the overall total.

:::image type="content" source="media/desktop-show-value-as/show-value-as-grand-total.png" alt-text="Screenshot of matrix with percent of grand total." lightbox="media/desktop-show-value-as/show-value-as-grand-total.png":::

### Show value as percent of column total (matrix only)

To get the following view, select the drop-down arrow on the measure, select **Show value as**, then choose **Percent of column total**. This option is only available for a matrix visual. It displays each value as a percentage of the sum for its column, making it easier to see how each row contributes within that column.

:::image type="content" source="media/desktop-show-value-as/show-value-as-column-total.png" alt-text="Screenshot of matrix with percent of column total." lightbox="media/desktop-show-value-as/show-value-as-column-total.png":::

### Show value as percent of row total (matrix only)

To recreate the view in the following image, open the drop-down menu on the measure within the matrix visual, select **Show value as**, and choose **Percent of row total**. This option displays each value as a percentage of the total for its row, so you can easily compare values across columns within the same row.

:::image type="content" source="media/desktop-show-value-as/show-value-as-row-total.png" alt-text="Screenshot of matrix with percent of row total." lightbox="media/desktop-show-value-as/show-value-as-row-total.png":::

> [!TIP]
> You can add the same measure multiple times to the Values area and apply a different "Show value as" option to each one. This approach allows for side-by-side comparisons (as shown in the following image).
> :::image type="content" source="media/desktop-show-value-as/show-value-as-all-amounts.png" alt-text="Screenshot of matrix with all 3 options.":::

## Example funnel visualization

Let's use the AdventureWorks DW 2020 dataset and build a Funnel visualization with Color from the Product table in Category, and Sales Amount from the Sales table in Values. Then, we'll apply various "Show value as" options to compare results.

### Original funnel

This default Funnel visualization shows raw Sales Amount values for each product color category, without any transformation applied.

:::image type="content" source="media/desktop-show-value-as/show-value-as-funnel-original.png" alt-text="Screenshot of funnel in original state." lightbox="media/desktop-show-value-as/show-value-as-funnel-original.png":::

### Show value as percent of grand total in funnel

To display each value as a percentage of the total sales amount, open the drop-down menu on the measure in the Funnel visual, choose **Show value as**, and select **Percent of grand total.** This method highlights the share each color contributes to the overall total.

:::image type="content" source="media/desktop-show-value-as/show-value-as-funnel-grand.png" alt-text="Screenshot of funnel with percent of grand total." lightbox="media/desktop-show-value-as/show-value-as-funnel-grand.png":::

## Considerations

Use this feature when:

- You need to display **percent contributions** across categories.
- You want to **compare performance** between rows or columns.
- You're creating **executive summaries** that prioritize percentages over raw numbers.

## Related content

This article described how you can enable the **Show value as** feature in Power BI. You might also be interested in the following article:

- [Use quick measures for common calculations](../transform-model/desktop-quick-measures.md)
