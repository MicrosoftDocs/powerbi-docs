---
title: Line charts in Power BI
description: 'Line charts in Power BI'
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 09/30/2021
LocalizationGroup: Visualizations
---


# Line charts in Power BI

[!INCLUDE[consumer-appliesto-nyyn](../includes/consumer-appliesto-nyyn.md)]

A line chart is a series of data points that are represented by dots and connected by straight lines. A line chart may have one or many lines. Line charts have an X and a Y axis. 

:::image type="content" source="media/power-bi-line-charts/power-bi-line.png" alt-text="Simple line chart.":::

## Create a line chart

These instructions use the Sales and Marketing Sample app to create a line chart that displays this year's sales by category. To follow along, get the sample app from appsource.com.

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

1. Start on a blank report page. If you're using the Power BI service, make sure you open the report in [Editing View](../create-reports/service-interact-with-a-report-in-editing-view.md).

1. From the Fields pane, select **SalesFact** \> **Total units**, and select **Date** > **Month**.  Power BI creates a column chart on your report canvas.

    :::image type="content" source="media/power-bi-line-charts/power-bi-step1.png" alt-text="Select from the Fields pane.":::

1. Convert to a line chart by selecting the line chart template from the Visualizations pane.

    :::image type="content" source="media/power-bi-line-charts/power-bi-convert-to-line.png" alt-text="Convert to line chart.":::

1. Filter your line chart to show data for the years 2012-2014. If your Filters pane is collapsed, expand it now. From the Fields pane, select **Date** \> **Year** and drag it onto the Filters pane. Drop it under the heading **Filters on this visual**. 

    :::image type="content" source="media/power-bi-line-charts/power-bi-year-filter.png" alt-text="Line next to Fields pane.":::

    Change **Advanced filtering** to **Basic filtering** and select **2012**, **2013** and **2014**.

    :::image type="content" source="media/power-bi-line-charts/power-bi-filter-year.png" alt-text="Filter for Year.":::

1. Optionally, [adjust the size and color of the chart's text](power-bi-visualization-customize-title-background-and-legend.md). 

    :::image type="content" source="media/power-bi-line-charts/power-bi-line-3years.png" alt-text="Increase font size and change Y axis font.":::

## Add additional lines to the chart

Line charts can have many different lines. And, in some cases, the values on the lines may be so divergent that they don't display well together. Let's look at adding additional lines to our current chart and then learn how to format our chart when the values represented by the lines are very different. 

### Add additional lines

Instead of looking at total units for all regions as a single line on the chart, let's split out total units by region. Add additional lines by dragging **Geo** > **Region** to the Legend well.

   :::image type="content" source="media/power-bi-line-charts/power-bi-line-regions.png" alt-text="One line for each region.":::

### Use two Y axes

What if you want to look at total sales and total units on the same chart? Sales numbers are so much higher than unit numbers, making the line chart unusable. In fact, the red line for total units appears to be zero.

:::image type="content" source="media/power-bi-line-charts/power-bi-diverging.png" alt-text="Screenshot shows how using a single y axis displays the total units as essentially flat and a useless comparison with the sales figures.":::

To display highly diverging values on one chart, use a combo chart. You can learn all about combo charts by reading [Combo charts in Power BI](power-bi-visualization-combo-chart.md). In our example below, we can display sales and total units together on one chart by adding a second Y axis. 

:::image type="content" source="media/power-bi-line-charts/power-bi-dual-axes.png" alt-text="Screenshot shows the sales values as a bar chart with the y axis on the left and the total units as a line with the y axis on the right.":::

## Highlighting and cross-filtering

For information about using the Filters pane, see [Add a filter to a report](../create-reports/power-bi-report-add-filter.md).

Selecting a data point on a line chart cross-highlights and cross-filters the other visualizations on the report page... and vice versa. To follow along, open the **Market Share** tab.  

On a line chart, a single data point is the intersection of a point on the X-axis and Y-axis. When you select a data point, Power BI adds markers indicating which point(for a single line) or points (if there are two or more lines) are the source for the cross-highlighting and cross-filtering of the other visuals on the report page. If your visual is very dense, Power BI will select the closest point to where you click on the visual.

In this example, we've selected a data point that encompasses: July 2014, %Units Market Share R12 of 33.16 and %Units Market Share of 34.74.

:::image type="content" source="media/power-bi-line-charts/power-bi-single-select.png" alt-text="Select a single data point on a line chart.":::

Notice how the column chart is cross-highlighted, and the gauge is cross-filtered.

To manage how charts cross-highlight and cross-filter each other, see [Visualization interactions in a Power BI report](../create-reports/service-reports-visual-interactions.md).

## Considerations and troubleshooting

* One line chart cannot have dual Y axes. You'll need to use a combo chart instead.
* In the examples above, the charts were formatted to increase font size, change font color, add axis titles, center the chart title and legend, start both axes at zero, and more. The Formatting pane (paint roller icon) has a seemingly endless set of options for making your charts look the way you want them to. The best way to learn is to open the Formatting pane and explore.

## Next steps

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)





