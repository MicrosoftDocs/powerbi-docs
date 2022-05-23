---
title: Scatter, bubble, and dot plot charts in Power BI
description: 'Scatter chart, dot plot charts, and bubble charts in Power BI'
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 09/22/2021
LocalizationGroup: Visualizations
---
# Scatter charts, bubble charts, and dot plot charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A scatter chart always has two value axes to show: one set of numerical data along a horizontal axis and another set of numerical values along a vertical axis. The chart displays points at the intersection of an x and y numerical value, combining these values into single data points. Power BI may distribute these data points evenly or unevenly across the horizontal axis. It depends on the data the chart represents.

You can set the number of data points, up to a maximum of 10,000.  

## When to use a scatter chart, bubble chart, or a dot plot chart

### Scatter and bubble charts

A scatter chart shows the relationship between two numerical values. A bubble chart replaces data points with bubbles, with the bubble *size* representing an additional third data dimension.

:::image type="content" source="media/power-bi-visualization-scatter/power-bi-bubble-chart.png" alt-text="Screenshot of a sample bubble chart.":::

Scatter charts are a great choice:

* To show relationships between two numerical values.

* To plot two groups of numbers as one series of x and y coordinates.

* To use instead of a line chart when you want to change the scale of the horizontal axis.

* To turn the horizontal axis into a logarithmic scale.

* To display worksheet data that includes pairs or grouped sets of values.

    > [!TIP]
    > In a scatter chart, you can adjust the independent scales of the axes to reveal more information about the grouped values.

* To show patterns in large sets of data, for example by showing linear or non-linear trends, clusters, and outliers.

* To compare large numbers of data points without regard to time.  The more data that you include in a sScatter chart, the better the comparisons that you can make.

In addition to what Scatter charts can do for you, bubble charts are a great choice:

* If your data has three data series that each contains a set of values.

* To present financial data.  Different bubble sizes are useful to visually emphasize specific values.

* To use with quadrants.

### Dot plot charts

A dot plot chart is similar to a bubble chart and scatter chart, but is instead used to plot categorical data along the X-Axis.

:::image type="content" source="media/power-bi-visualization-scatter/power-bi-dot-plot.png" alt-text="Screenshot of a dot plot chart.":::

They're a great choice if you want to include categorical data along the X-Axis.

## Prerequisites

This tutorial uses the [Retail Analysis sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. From the upper left section of the menubar, select **File** > **Open report**.

1. Find your copy of the **Retail Analysis sample PBIX** file.

1. Open the **Retail Analysis sample PBIX file** in report view :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::.

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.    

## Create a scatter chart

1. Start on a blank report page and from the **Fields** pane, select these fields:

    * **Sales** > **Sales Per Sq Ft**

    * **Sales** > **Total Sales Variance %**

    * **District** > **District**

    :::image type="content" source="media/power-bi-visualization-scatter/power-bi-bar-chart.png" alt-text="Screenshot of the cluster column chart, the Visualizations pane, and the Fields pane with the fields that you selected called out.":::

1. In the **Visualization** pane, select :::image type="icon" source="media/power-bi-visualization-scatter/power-bi-scatter-chart-icon.png"::: to convert the cluster column chart to a scatter chart.

    :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter-new.png" alt-text="Screenshot of the cluster column chart becoming a scatter chart.":::

1. Drag **District** from **Details** to **Legend**.

    Power BI displays a scatter chart that plots **Total Sales Variance %** along the Y-Axis, and plots **Sales Per Square Feet** along the X-Axis. The data point colors represent districts:

    :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter2.png" alt-text="Screenshot of the scatter chart.":::

Now let's add a third dimension.

## Create a bubble chart

1. From the **Fields** pane, drag **Sales** > **This Year Sales** > **Value** to the **Size** well. The data points expand to volumes proportionate with the sales value.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter-chart-size.png" alt-text="Screenshot of the scatter chart becoming a bubble chart by adding Sales Vale to the Size well.":::

1. Hover over a bubble. The size of the bubble reflects the value of **This Year Sales**.

   :::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-chart-hover.png" alt-text="Tooltips display.":::

1. To set the number of data points to show in your bubble chart, in the **Format** section of the **Visualizations** pane, expand **General**, and adjust the **Data Volume**.

    :::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-data-volume.png" alt-text="Screenshot of the Visualizations pane with the Format icon, General drop-down, and Data Volume option called out.":::

    You can set the max data volume to any number up to 10,000. As you get into the higher numbers, we suggest testing first to ensure good performance.

    > [!NOTE]
    > More data points can mean a longer loading time. If you do choose to publish reports with limits at the higher end of the scale, make sure to test out your reports across the web and mobile as well. You want to confirm that the performance of the chart matches your users' expectations.

1. Continue formatting the visualization colors, labels, titles, background, and more. To [improve accessibility](../create-reports/desktop-accessibility-overview.md), consider adding marker shapes to each line. To select the marker shape, expand **Shapes**, select **Marker shape**, and select a shape.

    :::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-marker.png" alt-text="Screenshot of the Shapes drop-down with the Marker shape options called out.":::

    Change the marker shape to a diamond, triangle, or square. Using a different marker shape for each line makes it easier for report consumers to differentiate lines (or areas) from each other.

1. Open the Analytics pane :::image type="icon" source="media/power-bi-visualization-scatter/power-bi-analytics.png"::: to add additional information to your visualization.
  
    - Add a Median line. Select **Median line** > **Add**. By default, Power BI adds a median line for *Sales per sq ft*. This isn't very helpful since we can see that there are 10 data points and know that the median will be created with five data points on each side. Instead, switch the **Measure** to *Total sales variance %*.  

        :::image type="content" source="media/power-bi-visualization-scatter/power-bi-analytics-median.png" alt-text="Screenshot of the bubble chart with median line added.":::

    - Add symmetry shading to show which points have a higher value of the x-axis measure compared to the y-axis measure, and vice-versa. When you turn symmetry shading on in the Analytics pane, Power BI shows you the background of your scatter chart symmetrically based on your current axis upper and lower boundaries. This is a very quick way to identify which axis measure a data point favors, especially when you have a different axis range for your x- and y-axis.

        a. Change the **Y Axis** field to **Gross Margin Last Year %**

        :::image type="content" source="media/power-bi-visualization-scatter/power-bi-format-symmetry.png" alt-text="Screenshot of the Details with Gross Margin Last Year percent selected.":::

        b. From the Analytics pane, add **Symmetry shading**. We can see from the shading that Hosiery (the green bubble in the pink shaded area) is the only category that favors  gross margin rather than its sales per store square footage. 

        :::image type="content" source="media/power-bi-visualization-scatter/power-bi-symmetry.png" alt-text="Screenshot of the bubble chart with symmetry shading added.":::

    - Continue exploring the Analytics pane to discover interesting insights in your data. 

        :::image type="content" source="media/power-bi-visualization-scatter/power-bi-analytics-example.png" alt-text="Screenshot of the Analytics pane.":::

## Create a dot plot chart

To create a dot plot chart, replace the numerical **X-Axis** field with a categorical field.

From the **X-Axis** pane, remove **Sales per sq ft** and replace it with **District** > **District Manager**.

:::image type="content" source="media/power-bi-visualization-scatter/power-bi-dot-plot-squares.png" alt-text="Screenshot of a new dot plot chart.":::

## Considerations and troubleshooting

### Your scatter chart has only one data point

Does your scatter chart have only one data point that aggregates all the values on the X- and Y-axes?  Or maybe it aggregates all the values along a single horizontal or vertical line?

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-tshoot1.png" alt-text="Screenshot of a scatter chart with one data point.":::

Add a field to the **Details** well to tell Power BI how to group the values. The field must be unique for each point you want to plot. A simple row number or ID field will do.

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-tshoot.png" alt-text="Screenshot of a scatter chart with RowNum added to the Details well.":::

If you don't have that in your data, create a field that concatenates your X and Y values together into something unique per point:

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-tshoot2.png" alt-text="Screenshot of a scatter chart with TempTime added to the Details well.":::

To create a new field, [use the Power BI Desktop Query Editor to add an Index Column](../create-reports/desktop-add-custom-column.md) to your dataset. Then add this column to your visualization's **Details** well.

## Next steps

You might also be interested in the following articles:

* [High-density sampling in Power BI scatter charts](../create-reports/desktop-high-density-scatter-charts.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
* [Tips to sort and distribute data plots in Power BI reports](../guidance/report-tips-sort-distribute-data-plots.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
