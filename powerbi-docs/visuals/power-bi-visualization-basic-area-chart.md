---
title: Create Basic Area Charts in Power BI
description: "Learn how to create basic area charts in Power BI to visualize sales trends and compare data over time. Follow step-by-step instructions."
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: concept-article
ms.date: 10/01/2025
ai-usage: ai-assisted
ms.custom: sample-retail-analysis
LocalizationGroup: Visualizations
---

# Create and use basic area charts

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Basic area charts in Power BI help you visualize data trends and emphasize volume changes over time. The basic area chart (also known as layered area chart) is based on the line chart, with the area between axis and line filled with colors to indicate volume.

Area charts emphasize the magnitude of change over time and draw attention to the total value across a trend. For example, data that represents profit over time can be plotted in an area chart to emphasize the total profit.

:::image type="content" source="media/power-bi-visualization-basic-area-chart/power-bi-chart-example.png" alt-text="Screenshot of a basic area chart displaying sales data with shaded regions.":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## When to use a basic area chart

Basic area charts are a great choice:

- To see and compare the volume trend across a time series
- For an individual series representing a physically countable set

### Prerequisites

To follow this tutorial in Power BI Desktop, download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). If you'd like to use the Power BI service, download the Retail Analysis PBIX file, and then upload it to a workspace in the Power BI service.

## Create a basic area chart

These steps will help you create an area chart that displays this year's sales and last year's sales by month.

1. In Power BI Desktop, open the **Retail Analysis Sample PBIX file** in report view :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png" border="false":::. In the Power BI service, open the **Retail Analysis Sample PBIX file** and select **Edit**.
1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png" border="false"::: to add a new page.
1. From the Fields pane, select **Sales \> Last Year Sales**, and **This Year Sales > Value**.

   :::image type="content" source="media/power-bi-visualization-basic-area-chart/power-bi-bar-chart.png" alt-text="Screenshot of data values displayed in an area chart showing sales fields.":::

1. Convert the chart to a basic area chart by selecting the Area chart icon from the Visualizations pane.

   :::image type="content" source="media/power-bi-visualization-basic-area-chart/convert-chart.png" alt-text="Screenshot of the area chart icon highlighted in the Visualizations pane.":::

1. Select **Time \> FiscalMonth** to add it to the **Axis** well.

    :::image type="content" source="media/power-bi-visualization-basic-area-chart/power-bi-area-chart-new.png" alt-text="Screenshot of axis values configured in an area chart with fiscal month data.":::

1. To display the chart by month, select the ellipses (top right corner of the visual) and choose **Sort by \> FiscalMonth**. To change the sort order, select the ellipses again and select either **Sort ascending** or **Sort descending**.

## Highlight and cross-filter

For information about using the Filters pane, see [Add a filter to a report](../create-reports/power-bi-report-add-filter.md).

To highlight one particular area in your chart, select that area or its top border.  Unlike other visualization types, if there are other visualizations on the same page, highlighting a basic area chart doesn't cross-filter the other visualizations on the report page. However, area charts are a target for cross-filtering triggered by other visualizations on the report page.

1. Try it out by selecting your area chart and copying it to the **New Stores Analysis** report page (CTRL-C and CTRL-V).
1. Select one of the shaded areas of the area chart and then select the other shaded area. You'll notice no effect on the other visualizations on the page.
1. Now select an element. Notice the effect on the area chart&mdash;it gets cross-filtered.

   :::image type="content" source="media/power-bi-visualization-basic-area-chart/power-bi-area-chart-filters.gif" alt-text="Screenshot of filter examples showing cross-filtering behavior in area charts.":::

To learn more, see [Visual interactions in reports](../create-reports/service-reports-visual-interactions.md)

## Considerations and troubleshooting

- [Make the report more accessible for people with disabilities](../create-reports/desktop-accessibility-overview.md).
- Basic area charts aren't effective for comparing the values due to the occlusion on the layered areas. Power BI uses transparency to indicate the overlap of areas. However, it only works well with two or three different areas. When you need to compare trend to more than three measures, try using line charts. When you need to compare volume to more than three measures, try using treemap.

## Related content

- [Reports in Power BI](power-bi-visualization-card.md)
