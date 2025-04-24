---
title: Interact with small multiples in Power BI
description: This article explains how to interact with small multiples, or trellising.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'kfollis'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/01/2022
git pullLocalizationGroup: Visualizations
---
# Interact with small multiples in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Small multiples, or trellising, split a visual into multiple versions of itself. This article explains how to get the most out of interacting with them.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-mulitple-sales-category-region.png" alt-text="Screenshot of small multiples for category and region.":::

Want to create small multiples? See [Create small multiples in Power BI](power-bi-visualization-small-multiples.md).

## Scroll in a small multiple

Small multiples may contain more individual charts that can fit in the grid. If so, you can scroll down to see the rest of your categories.

For a categorical X axis with many categories, you also see a scroll bar for each copy of that axis. Scrolling on that axis moves them all together. If you're using a scroll wheel, hold Shift to scroll the categorical axes.

## Select data to cross-highlight

You can select different subsets of data by selecting different parts of the visual.

### Select data points

Hover over the data point on one multiple to show the tooltip in that multiple. You also see a guide line on the X axis for line charts. Select that data point to cross-highlight other visuals by both the axis value and the small-multiple category, and dim the other multiples.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-multiple-select-data-point.png" alt-text="Select a data point in a small multiple.":::

### Select a categorical axis value

Select a category label to cross-highlight other visuals by that axis value.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-multiple-select-category-axis.png" alt-text="Select a category axis in a small multiple.":::

### Select a title

Select the title of a multiple to cross-highlight other visuals by the category in that subheader.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-multiple-select-title.png" alt-text="Select a title in a small multiple.":::

### Legend

Select a legend category to cross-highlight other visuals and cross-highlight other multiples.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-multiple-select-legend.png" alt-text="Select an item in the legend in a small multiple.":::


## Sort

With the sort functionality, you can sort multiple aspects of a visual at once. Sort by the category, and also by the axis in each multiple. 

:::image type="content" source="media/power-bi-visualization-small-multiples/small-multiple-sort.png" alt-text="Sort the small multiples.":::

## Related content

- [Create small multiples in Power BI](power-bi-visualization-small-multiples.md)
