---
title: Format column and bar charts
description: Learn how to format column and bar charts with greater flexibility and freedom in presenting your data, to make your insights stand out.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 06/26/2024
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations 
#customer intent: As a report creator, I want format column and bar charts.
---

# Format column and bar charts

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

You have a number of options for formatting column and bar charts in Power BI. These features aim to provide you with greater flexibility and freedom in presenting your data, to make your insights stand out.

:::image type="content" source="media/power-bi-visualization-column-bar-format/bar-column-chart-formatting.png" alt-text="Screenshot of a formatting option for a column chart." lightbox="media/power-bi-visualization-column-bar-format/bar-column-chart-formatting.png":::

Explore these new capabilities to create compelling narratives with your data in Power BI. Here are details about the features.

## Layout enhancements

- **Apply settings to all or series**: Apply formatting options globally across all categories, or tailor them for each unique individual series.

- **Transparency control**: Adjust the fill color transparency to balance of visibility and design. 

- **Border customization**: You can add borders precision, choosing a distinct color, or match it to the column’s fill. Define both the border’s width and transparency. 

- **Layout**: We've moved several design elements.

  - The **Spacing** card is now the **Layout** card.
  - We relocated the **Reverse Order** toggle that allows you to invert series.
  - We introduced **Sort by Value**, **Space between categories**, and **Space between series**.
  - For clustered column charts, you can [overlap the columns](#overlap-columns-in-series).
  - For clustered column and bar charts, you have the option to **Erode** or **Explode** the stacked series.

- **Advanced ribbon settings**: Highlight a series or create visual continuity with an array of options. These options include matching series color or choosing a color selection, transparency, border color matching or color selection, border width, and border spacing.

For more comprehensive information about these features for column and bar charts, see the [Power BI Visuals blog post on LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7138638604704129024/).

## Separate or overlap columns

By default, in column charts, the series columns are touching. You have alternatives to change that layout. Here's the default layout.

:::image type="content" source="media/power-bi-visualization-column-bar-format/column-chart-basic.png" alt-text="Screenshot showing basic layout with series columns touching.":::

### Add space between series

In the **Format** pane, on the **Visual** tab, under **Layout**, type a value in the **Space between series** box, or slide the slider to the value you want.

:::image type="content" source="media/power-bi-visualization-column-bar-format/column-chart-space-between.png" alt-text="Screenshot showing column chart with 20% between series columns.":::

### Overlap columns in series

In the **Format** pane, on the **Visual** tab, under **Layout**, turn **Overlap** to **On**. Then type a value in the **Space between series** box, or slide the slider to the value you want.

:::image type="content" source="media/power-bi-visualization-column-bar-format/column-chart-overlap.png" alt-text="Screenshot showing column chart with 50% overlap of the series columns.":::


## Related content

- [Bar and column charts described](power-bi-visualization-types-for-reports-and-q-and-a.md#bar-and-column-charts)
