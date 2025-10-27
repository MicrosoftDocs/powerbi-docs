---
title: Auto-size width
description: Setting - Auto-size width (Column headers, Auto-size width)
ms.reviewer: juliacawthra
author: JulCsc
ms.author: miguelmyers
ms.service: powerbi
ms.subservice: pbi-corevisuals
ms.topic: include
ms.date: 06/25/2024
ms.custom: include file - variant
LocalizationGroup: core-visuals
---
##### Auto-size width

This toggle, when enabled, automatically adjusts the column widths based on the content within each column header.

Two options are available:
- **Fit to content**. This will make the columns as wide as they need to be to show the data, assuming there is room in the visual container.
- **Grow to fit**. This automatically expands your columns to fill the visual container for a more balanced layout. When **Grow to fit** is enabled, any leftover horizontal space is distributed evenly to each column.

> [!NOTE]
> Columns that were manually resized are not changed by Auto-size width.

The [manual resize](#adjust-column-width) and **Auto-size width** (fitting to content) options size each column to its contents, but you might still have some unused space in the visual container:

   :::image type="content" source="media/power-bi-visualization-tables/table-unused-space.png" alt-text="Screenshot of table visual with columns that don’t fill the entire width of the container, leaving empty space." border="false":::

**Grow to fit** expands the table to the full visual width:

   :::image type="content" source="media/power-bi-visualization-tables/fill-space-grow-fit.png" alt-text="Screenshot of table visual with columns evenly expanded to fill the full width of the container after enabling Grow to fit." border="false":::

To enable **Grow to fit**:

   1. Select the table visual.
   1. Open the **Format** pane.
   1. Expand **Column headers**, then expand **Options**.
   1. Toggle **Autosize width** to *On*.
   1. From the **Resize behavior** dropdown, select **Grow to fit**.

   :::image type="content" source="media/power-bi-visualization-tables/grow-fit-autosize-toggle.png" alt-text="Screenshot of Columns headers card expanded, Options are expanded, auto-size width is enabled, and resize behavior dropdown displaying Fit to content and Grow to fit." border="false":::