---
title: Show value as in Power BI
description: Change how the value is displayed in a visual by using the Show value as capability in the Visualizations pane.
author: JasmitaY
ms.author: t-jayechuri
ms.reviewer: Jeroen ter Heerdt
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 08/07/2025
LocalizationGroup: Create reports
---
# Show value as in Power BI

The Show value as feature in Power BI lets you display your data as percentages of totals, such as percent of grand total, row total or column total, instead of just raw values. This can help provide context for values in visuals and is particularly useful when creating executive dashboards, performance reports, or comparative views.

This feature is available in the context menu for numerical values or fields placed in the Values of matrix, table or chart visualizations.

[ ![Image of the visualization pane.](media/desktop-show-value-as/show-value-as-dropdown.png)](media/desktop-show-value-as/show-value-as-dropdown.png#lightbox)

## Access the "Show value as" menu

To apply "Show value as" to a measure in a Matrix:
  1. Add a **Matrix visual** to your report.
  1. Drag a numeric field (for example, Sales) into the **Values** section.
  1. Select the dropdown arrow within the field.
  1. Hover over **Show value as**.
  1. Select from options:
		- No calculation
  		- Percent of grand total
		- (Matrix only) Percent of column total
		- (Matrix only) Percent of row total

Matrix options:

[ ![Matrix visualization pane with show value as options.](media/desktop-show-value-as/show-value-as-matrix-options.png)](media/desktop-show-value-as/show-value-as-matrix-options.png#lightbox)

Table options:

[ ![Table visualization pane with show value as options.](media/desktop-show-value-as/show-value-as-table-options.png)](media/desktop-show-value-as/show-value-as-table-options.png#lightbox)

## Show value as options
The following table describes each option in the **Show value as** menu:

|**Option**  |**Description**  |
|---------|---------|
|No calculation     |Displays the raw value (default behavior).         |
|Percent of grand total     |Displays each value as a percentage of the total value of all cells.         |
|Percent of column total     |Displays each value as a percentage of the total for its column (available for Matrix only).         |
|Percent of row total     |Displays each value as a percentage of the total for its row (available for Matrix only).        |

## Example of Matrix Visualizaiton

Let’s use the AdventureWorks DW 2020 dataset and build a Matrix with Country-Region from the Customer table in Rows, and Sales Amount from the Sales table to Values. Then, we’ll apply various "Show value as" options to compare results.

### Original Matrix

[ ![Image of original matrix example.](media/desktop-show-value-as/show-value-as-original-matrix.png)](media/desktop-show-value-as/show-value-as-original-matrix.png#lightbox)

### Show value as → Percent of grand total

[ ![Image of matrix with percent of grand total.](media/desktop-show-value-as/show-value-as-grand-total.png)](media/desktop-show-value-as/show-value-as-grand-total.png#lightbox)

### Show value as → Percent of column total (Matrix only)

[ ![Image of matrix with percent of column total.](media/desktop-show-value-as/show-value-as-column-total.png)](media/desktop-show-value-as/show-value-as-column-total.png#lightbox)

### Show value as → Percent of row total (Matrix only)

[ ![Image of matrix with percent of row total.](media/desktop-show-value-as/show-value-as-row-total.png)](media/desktop-show-value-as/show-value-as-row-total.png#lightbox)

> [!Tip]
> You can add the same measure multiple times to the Values area and apply a different “Show value as” option to each one. This allows for side-by-side comparisons.

[ ![Image of matrix with all 3 options](media/desktop-show-value-as/show-value-as-all-amounts.png)](media/desktop-show-value-as/show-value-as-all-amounts.png#lightbox)

## Example Funnel Visualization

Let’s use the AdventureWorks DW 2020 dataset and build a Funnel visualization with Color from the Product table in Category, and Sales Amount from the Sales table in Values. Then, we’ll apply various "Show value as" options to compare results.

### Original Funnel

[ ![Image of funnel in original state.](media/desktop-show-value-as/show-value-as-funnel-original.png)](media/desktop-show-value-as/show-value-as-funnel-original.png#lightbox)

### Show value as → Percent of grand total

[ ![Image of funnel with percent of grand total.](media/desktop-show-value-as/show-value-as-funnel-grand.png)](media/desktop-show-value-as/show-value-as-funnel-grand.png#lightbox)

## Considerations

Use this feature when:
- You need to display **percent contributions** across categories.
- You want to **compare performance** between rows or columns.
- You are creating **executive summaries** that prioritize percentages over raw numbers.

## Related content

This article described how you can enable the **Show value as** feature in Power BI. You might also be interested in the following articles:

* [Use quick measures for common calculations](../transform-model/desktop-quick-measures.md)
