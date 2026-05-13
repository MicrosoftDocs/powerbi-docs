---
title: Tablix columns resize
description: Tablix columns resize options
author: julcsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-corevisuals
ms.topic: include
ms.date: 05/01/2026
ms.custom: include file - variant
LocalizationGroup: core-visuals
---
Column width in Power BI tables and matrices can be adjusted to improve readability and presentation. You can manually resize columns or use the **Layout** section of the **Format** pane to control how columns size, set a default width, and customize widths for individual columns.

### Manual adjustment

Sometimes Power BI shortens a column heading in a report or dashboard. To display the full column name, you can resize the column in two ways:

#### Resize by dragging
Move to the space just to the right of the column heading until the resize arrows appear. Once the arrows are visible, adjust the column width by moving the resize handle left or right.

:::image type="content" source="/power-bi/visuals/media/power-bi-visualization-tables/resize-table.gif" alt-text="Animation showing how to resize a column in Power BI.":::

#### Resize using menu options
Select the column you want to adjust. From the available options, choose **Widen column** or **Narrow column** to change its width by 10px.

Manual resizes are reflected in the **Custom widths** controls in the **Format** pane.

### Auto-size behavior

Column sizing settings are in the **Format** pane under **Visual** > **Layout** > **Column width**. The **Auto-size behavior** dropdown has three options:

- **Fit to content**: Columns are as wide as they need to be to show the data, assuming there's room in the visual container.
- **Grow to fit**: Columns automatically expand to fill the visual container for a more balanced layout. Any leftover horizontal space is distributed evenly to each column.
- **Fixed width**: Columns use a width that you specify. When this option is selected, a **Default width** input appears so you can set the width for all columns and for any new columns added to the visual.

### Default width (Fixed width only)

When **Auto-size behavior** is set to **Fixed width**, set a **Default width** in pixels. With **Custom widths** off, all columns use this uniform width. New columns added to the visual also use this default width.

### Custom widths

Turn on **Custom widths** to see and customize the width of any column directly from the **Format** pane:

- If the visual has fewer than 15 columns, each column appears with its own width input.
- If the visual has 15 or more columns, an **Apply settings to** dropdown appears. Select a column from the dropdown to set its width. Columns that already have a custom width are marked with an asterisk (*).

Width inputs that show *(auto)* indicate the column is using the auto-size behavior rather than a custom width.

To clear customizations:

- **Clear all**: Toggle **Custom widths** off to clear custom widths from every column.
- **Clear one**: Clear the input box for a single column, or right-click the input and select the option to reset that value to default.

### Matrix hierarchies (More granular)

For a matrix with hierarchies on columns, **Custom widths** by default sets a uniform width for the lowest level of the hierarchy. To set widths for each combination individually, turn on **More granular**. Each leaf-level combination then appears in the **Apply settings to** dropdown so you can size them independently.

### Mobile view

The **Column width** settings in the **Format** pane can be modified independently for the mobile-optimized layout of a report page. This lets you tune column widths so tables and matrices fit well on small screens without changing the desktop layout. For more information, see [Optimize Power BI reports for the mobile app](../../create-reports/power-bi-create-mobile-optimized-report-mobile-layout-view.md).
