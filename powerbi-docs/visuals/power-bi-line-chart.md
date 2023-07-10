---
title: Line charts in Power BI
description: 'Learn how to use line charts in Power BI.'
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 07/14/2023
ms.custom: sample-Sales-and-Marketing
LocalizationGroup: Visualizations
---

# Line charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A line chart is a series of data points that are represented by dots and connected by straight lines. A line chart may have one or many lines. Line charts have an x and a y axis. 

:::image type="content" source="media/power-bi-line-charts/power-bi-line.png" alt-text="Simple line chart.":::

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Sales and Marketing Sample to create a line chart that displays this year's sales by category.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix) to your desktop.

2. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

3. Browse to the **Sales and Marketing Sample PBIX** file, then select **Open**.

4. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.
 
5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the built-in Sales and Marketing Sample in the Power BI service.

1. Open the Power BI service, then select on **Get data** in the bottom left corner.

2. On the Get Data page that appears, select **Samples**.

   :::image type="content" source="media/power-bi-visualization-slicers/get-data-samples.png" alt-text="Screenshot of Get Data box with link to samples.":::

3. Select the **Sales and Marketing Sample**, and choose **Connect**.

4. Select **Edit** on the menu bar to display the **Visualizations** pane.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Create a line chart

1. From the Fields pane, select **SalesFact** \> **Total units**, and select **Date** > **Month**.  Power BI creates a column chart on your report canvas.

    :::image type="content" source="media/power-bi-line-charts/power-bi-step-1.png" alt-text="Screenshot of the Fields pane with data fields selected.":::

2. Convert to a line chart by selecting the line chart template from the Visualizations pane.

    :::image type="content" source="media/power-bi-line-charts/power-bi-convert-to-line.png" alt-text="Screenshot of the Visualizations pane with Line chart icon selected.":::

3. Filter your line chart to show data for the years 2012-2014. If your Filters pane is collapsed, expand it now. From the Fields pane, select **Date** \> **Year** and drag it onto the Filters pane. Drop it under the heading **Filters on this visual**. 

    :::image type="content" source="media/power-bi-line-charts/power-bi-year-filter.png" alt-text="Screenshot of Filters pane with filters added.":::

    Change **Advanced filtering** to **Basic filtering** and select **2012**, **2013**, and **2014**.

    :::image type="content" source="media/power-bi-line-charts/power-bi-filter-year.png" alt-text="Screenshot of Advanced filtering dropdown to select year limits.":::

4. Optionally, [adjust the size and color of the chart's text](power-bi-visualization-customize-title-background-and-legend.md). 

    :::image type="content" source="media/power-bi-line-charts/power-bi-line-3years.png" alt-text="Screenshot of line chart with font size and y axis font changed.":::

## Add lines to the chart

Line charts can have many different lines. In some cases, the values on the lines may be so divergent that they don't display well together. Let's look at adding additional lines to our current chart and then learn how to format our chart when the values represented by the lines are different. 

### Add more lines

Instead of looking at total units for all regions as a single line on the chart, let's split out total units by region. Add additional lines by dragging **Geo** > **Region** to the Legend well.

   :::image type="content" source="media/power-bi-line-charts/power-bi-line-regions.png" alt-text="One line for each region.":::

### Use two y axes

What if you want to look at total sales and total units on the same chart? Sales numbers are so much higher than unit numbers, making the line chart unusable. In fact, the red line for total units appears to be zero.

:::image type="content" source="media/power-bi-line-charts/power-bi-diverging.png" alt-text="Screenshot shows how using a single y axis displays the total units as essentially flat and a useless comparison with the sales figures.":::

To display highly diverging values on one chart, use a combo chart. You can learn all about combo charts by reading [Combo charts in Power BI](power-bi-visualization-combo-chart.md). In our example below, we can display sales and total units together on one chart by adding a second y axis. 

:::image type="content" source="media/power-bi-line-charts/power-bi-dual-axes.png" alt-text="Screenshot shows the sales values as a bar chart with the y axis on the left and the total units as a line with the y axis on the right.":::

## Highlighting and cross-filtering

For information about using the Filters pane, see [Add a filter to a report](../create-reports/power-bi-report-add-filter.md).

Selecting a data point on a line chart cross-highlights and cross-filters the other visualizations on the report page... and vice versa. To follow along, open the **Market Share** tab.  

On a line chart, a single data point is the intersection of a point on the x axis and y axis. When you select a data point, Power BI adds markers indicating which point (for a single line) or points (if there are two or more lines) are the source for the cross-highlighting and cross-filtering of the other visuals on the report page. If your visual is very dense, Power BI will select the closest point to where you click on the visual.

In this example, we've selected a data point that encompasses: July 2014, % Units Market Share R12M of 33.16 and % Units Market Share of 34.74.

:::image type="content" source="media/power-bi-line-charts/power-bi-single-select.png" alt-text="Select a single data point on a line chart.":::

Notice how the column chart is cross-highlighted, and the gauge is cross-filtered.

To manage how charts cross-highlight and cross-filter each other, see [Visualization interactions in a Power BI report](../create-reports/service-reports-visual-interactions.md).

## Considerations and troubleshooting

* One line chart can't have dual y axes. You'll need to use a combo chart instead.
* In the examples above, the charts were formatted to increase font size, change font color, add axis titles, center the chart title and legend, start both axes at zero, and more. The Formatting pane (paint roller icon) has a seemingly endless set of options for making your charts look the way you want them to. The best way to learn is to open the Formatting pane and explore.

## Next steps

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)





