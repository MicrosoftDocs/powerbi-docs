---
title: Tablix columns resize
description: Tablix columns resize options
ms.reviewer: juliacawthra
author: JulCsc
ms.author: jterh
ms.service: powerbi
ms.subservice: pbi-corevisuals
ms.topic: include
ms.date: 12/1/2025
ms.custom: include file - variant
LocalizationGroup: core-visuals
---
Column width in Power BI tables and matrices can be adjusted to improve readability and presentation. You can manually resize columns or use automatic options to optimize how your data appears in the report.

### Manual adjustment

Sometimes Power BI shortens a column heading in a report or dashboard. To display the full column name, you can resize the column in two ways:

#### Resize by dragging
Move to the space just to the right of the column heading until the resize arrows appear. Once the arrows are visible, adjust the column width by moving the resize handle left or right.

:::image type="content" source="visuals/media/power-bi-visualization-tables/resize-table.gif" alt-text="Animation showing how to resize a column in Power BI.":::

#### Resize using menu options
Select the column you want to adjust. From the available options, choose **Widen column** or **Narrow column** to change its width by 10px.

### Automatic adjustment

Power BI can also automatically adjust column sizes for you.

Two options are available:

- **Fit to content**: Makes the columns as wide as they need to be to show the data, assuming there's room in the visual container.
- **Grow to fit**: Automatically expands your columns to fill the visual container for a more balanced layout. When **Grow to fit** is enabled, any leftover horizontal space is distributed evenly to each column.

> [!NOTE]
> Columns that were manually resized aren't changed by the **Autosize width** option.

The manual resize and **Autosize width** (fitting to content) options size each column to its contents, but you might still have some unused space in the visual container:

   :::image type="content" source="media/column-headers-options-auto-size-width/table-unused-space.png" alt-text="Screenshot of table visual with columns that don’t fill the entire width of the container, leaving empty space." border="false":::


The **Grow to fit** feature automatically expands your columns to fill the visual container for a more balanced layout. When **Grow to fit** is enabled, any leftover horizontal space is distributed evenly to each column:

   :::image type="content" source="media/column-headers-options-auto-size-width/fill-space-grow-fit.png" alt-text="Screenshot of table visual with columns evenly expanded to fill the full width of the container after enabling Grow to fit." border="false":::

To enable **Grow to fit**:

   1. Select the table visual.
   1. Open the **Format** pane.
   1. Expand **Column headers**, then expand **Options**.
   1. Toggle **Autosize width** to *On*.
   1. From the **Resize behavior** dropdown, select **Grow to fit**.

   :::image type="content" source="media/column-headers-options-auto-size-width/grow-fit-autosize-toggle.png" alt-text="Screenshot of Columns headers card expanded, Options are expanded, auto-size width is enabled, and resize behavior dropdown displaying Fit to content and Grow to fit." border="false":::

> [!NOTE]
> Columns that were manually resized don't change.
