---
title: Scatter, bubble, and dot plot charts in Power BI
description: 'Learn how to use scatter charts, dot plot charts, and bubble charts in Power BI.'
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/11/2022
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---
# Scatter charts, bubble charts, and dot plot charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A scatter chart always has two value axes to show: one set of numerical data along a horizontal axis and another set of numerical values along a vertical axis. The chart displays points at the intersection of an x and y numerical value, combining these values into single data points. Power BI may distribute these data points evenly or unevenly across the horizontal axis. It depends on the data the chart represents.

You can set the number of data points, up to a maximum of 10,000.  

## When to use a scatter chart, bubble chart, or a dot plot chart

### Scatter and bubble charts

A scatter chart shows the relationship between two numerical values. A bubble chart replaces data points with bubbles, with the bubble *size* representing a third data dimension.

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

* To compare large numbers of data points without regard to time. The more data that you include in a scatter chart, the better the comparisons that you can make.

In addition to what scatter charts can do, bubble charts are a great choice:

* If your data has three data series that each contains a set of values.

* To present financial data.  Different bubble sizes are useful to visually emphasize specific values.

* To use with quadrants.

### Dot plot charts

A dot plot chart is similar to a bubble chart and scatter chart, but is instead used to plot categorical data along the horizontal axis.

:::image type="content" source="media/power-bi-visualization-scatter/power-bi-dot-plot.png" alt-text="Screenshot of a dot plot chart.":::

They're a great choice if you want to include categorical data along the horizontal axis.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

2. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

3. Browse to the **Retail Analysis Sample PBIX.pbix** file, then select **Open**.

4. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the built-in Retail Analysis Sample in the Power BI service.

1. Open the Power BI service, then click on **Get data** in the bottom left corner.

2. On the Get Data page that appears, select **Samples**.

   :::image type="content" source="media/power-bi-visualization-slicers/get-data-samples.png" alt-text="Screenshot of Get Data box with link to samples.":::

3. Select the **Retail Analysis Sample**, and choose **Connect**.

4. Select **Edit** on the menu bar to display the **Visualizations** pane.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.    

## Create a scatter chart

1. Start on a blank report page and from the **Fields** pane, select these fields:

    * **Sales** > **Sales Per Sq Ft**

    * **Sales** > **Total Sales Variance %**

    * **District** > **District**

    :::image type="content" source="media/power-bi-visualization-scatter/power-bi-bar-chart.png" alt-text="Screenshot of the cluster column chart, the Visualizations pane, and the Fields pane with the fields that you selected.":::

1. In the **Visualization** pane, select :::image type="icon" source="media/power-bi-visualization-scatter/power-bi-scatter-chart-icon.png"::: to convert the cluster column chart to a scatter chart.

    :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter-new.png" alt-text="Screenshot of the cluster column chart becoming a scatter chart.":::

1. Drag **District** from **Values** to **Legend**.

    Power BI displays a scatter chart that plots **Total Sales Variance %** along the Y-Axis, and plots **Sales Per Square Feet** along the X-Axis. The data point colors represent districts:

    :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter2.png" alt-text="Screenshot of the scatter chart.":::

Now let's add a third dimension.

## Create a bubble chart

1. From the **Fields** pane, drag **Sales** > **This Year Sales** > **Value** to the **Size** well. The data points expand to volumes proportionate with the sales value.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter-chart-size.png" alt-text="Screenshot of the scatter chart becoming a bubble chart by adding Sales Vale to the Size well.":::

1. Hover over a bubble. The size of the bubble reflects the value of **This Year Sales**.

   :::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-chart-hover.png" alt-text="Tooltips display.":::

1. To set the number of data points to include in your bubble chart, in the **Format visual** section of the **Visualizations** pane, select **General**, and adjust the **Number of data points** under **Advanced options**.

    :::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-data-volume.png" alt-text="Screenshot of the Visualizations pane with the Number of data points option under the Format visual icon.":::

    You can set the max data volume to any number up to 10,000. As you get into the higher numbers, we suggest testing first to ensure good performance.

    > [!NOTE]
    > More data points can mean a longer loading time. If you choose to publish reports with limits at the higher end of the scale, make sure to test out your reports across the web and mobile as well. You want to confirm that the performance of the chart matches your users' expectations.

1. Continue formatting the visualization colors, labels, titles, background, and more. To [improve accessibility](../create-reports/desktop-accessibility-overview.md), consider adding marker shapes to each line. To select the marker shape, expand **Markers** under **Visual**, choose **Shape**, and select a shape.

    :::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-marker.png" alt-text="Screenshot of the Shapes drop-down with the Marker shape options called out.":::

    Change the marker shape to a diamond, triangle, or square. Using a different marker shape for each line makes it easier for report consumers to differentiate lines (or areas) from each other.

1. Change the marker range scale to Auto, Magnitude, or Data Range. This option is available if the **Size&** well is populated. These modes work as the following:

   - Magnitude: Any negative data values used for sizing are converted to positive value with same magnitude (e.g. -15 converted to 15). The size of the bubbles scale from zero to the maximum magnitude value.
   - Data Range: The size of the bubbles range based on the extend of the data input. Smallest data value, whether positive or negative, is shown as the smallest bubble size. Similarly, the largest data value is shown with the largest bubble size.
   - Auto: If the data contains only positive, or only negative values, Magnitude mode is used. Otherwise, that is, if the data includes both positive and negative values, Data Range mode is used.
  
1. Open the Analytics pane :::image type="icon" source="media/power-bi-visualization-scatter/power-bi-analytics.png"::: to add additional information to your visualization.
  
    - Add a median line. Select **Median line** > **Add line**. By default, Power BI adds a median line for *Sales per sq ft*. This line isn't helpful since we can see that there are 10 data points and know that the median will be created with five data points on each side. Instead, switch the **Series** to *Total sales variance %*.  

        :::image type="content" source="media/power-bi-visualization-scatter/power-bi-analytics-median.png" alt-text="Screenshot of the bubble chart with median line added.":::

    - Add symmetry shading to show which points have a higher value of the x-axis measure compared to the y-axis measure, and vice-versa. When you activate symmetry shading in the Analytics pane, Power BI shows you the background of your scatter chart symmetrically based on your current axis upper and lower boundaries. You can quickly identify which axis measure a data point favors, especially when you have a different axis range for your x and y axis.

        a. Change the **Y Axis** field to **Gross Margin Last Year %**

        :::image type="content" source="media/power-bi-visualization-scatter/power-bi-format-symmetry.png" alt-text="Screenshot of the Details with Gross Margin Last Year percent selected.":::

        b. From the Analytics pane, add **Symmetry shading**. We can see from the shading that Hosiery (the blue square in the pink shaded area) is the only category that favors  gross margin rather than its sales per store square footage. 

        :::image type="content" source="media/power-bi-visualization-scatter/power-bi-symmetry.png" alt-text="Screenshot of the bubble chart with symmetry shading added.":::

    - Continue exploring the Analytics pane to discover interesting insights in your data. 

        :::image type="content" source="media/power-bi-visualization-scatter/power-bi-analytics-example.png" alt-text="Screenshot of the Analytics pane.":::

## Create a dot plot chart

To create a dot plot chart, replace the numerical **X Axis** field with a categorical field.

From the **X Axis** pane, remove **Sales per sq ft** and replace it with **District** > **District Manager**.

:::image type="content" source="media/power-bi-visualization-scatter/power-bi-dot-plot-squares.png" alt-text="Screenshot of a new dot plot chart.":::

## Considerations and troubleshooting

### Your scatter chart has only one data point

Does your scatter chart have only one data point that aggregates all the values on the x- and y-axes?  Or maybe it aggregates all the values along a single horizontal or vertical line?

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-t-shoot-1.png" alt-text="Screenshot of a scatter chart with one data point.":::

Add a field to the **Details** well to tell Power BI how to group the values. The field must be unique for each point you want to plot. A simple row number or ID field will do.

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-t-shoot.png" alt-text="Screenshot of a scatter chart with RowNum added to the Details well.":::

If you don't have that in your data, create a field that concatenates your X and Y values together into something unique per point:

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-t-shoot-2.png" alt-text="Screenshot of a scatter chart with TempTime added to the Details well.":::

To create a new field, [use the Power BI Desktop Query Editor to add an Index Column](../create-reports/desktop-add-custom-column.md) to your dataset. Then add this column to your visualization's **Details** well.

## Next steps

You might also be interested in the following articles:

* [High-density sampling in Power BI scatter charts](../create-reports/desktop-high-density-scatter-charts.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
