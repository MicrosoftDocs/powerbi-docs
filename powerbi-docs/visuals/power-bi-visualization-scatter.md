---
title: Scatter, bubble, and dot plot charts in Power BI
description: Learn how to use scatter charts, dot plot charts, and bubble charts in Power BI Desktop and the Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/21/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Scatter charts, bubble charts, and dot plot charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article describes three types of similar chart visualizations in Power BI: scatter charts, bubble charts, and dot plot charts.

**Scatter charts** display data along a horizontal (X) and vertical (Y) axis. The chart reveals how numerical values along the two axes are related. When data intersects on the two axes, Power BI displays a data point. 

You can analyze data points to identify relationships in your data. Data points are distributed evenly or unevenly across the horizontal axis depending on the chart data. You can set the number of data points up to a maximum of 10,000.  

**Bubble charts** expand on the concept of data points by representing two intersected values with a bubble. The bubble size represents a third data dimension that's useful for evaluation. While a scatter chart uses two axes, a bubble chart can support three data series where each series has different sets of values.

**Dot plot charts** are similar to both bubble and scatter charts. In a scatter chart, you can adjust the independent scales of the axes to reveal more information about the grouped values. A dot plot chart builds on a scatter chart by supporting category data on the horizontal axis. Your chart settings can highlight patterns in large sets of data, such as showing linear or nonlinear trends, clusters, and outliers. 

These three visual charts help to reveal relationships and patterns in your data. The visualizations can identify interesting information about your data that might not be readily apparent in the numerical values. 

The scatter, bubble, and dot plot charts are useful for comparing large numbers of data points without regard to any specific time. The more data you include in your chart, the better the comparisons you can make.

## When to use a scatter, bubble, or dot plot chart

Let's review some common usage scenarios for these chart visualizations. The following image provides a comparison of the different display types offered with these visuals.

:::image type="content" source="media/power-bi-visualization-scatter/power-bi-compare-charts.png" alt-text="Illustration that compares the visual display for a scatter chart, bubble chart, and dot plot chart in Power BI." border="false":::

### Scatter charts

Scatter charts work well in many scenarios:

- Show relationships between two numerical values
- Plot two groups of numbers as one series of X and Y coordinates
- Display worksheet data with pairs or grouped sets of values
- Show patterns in large sets of data
- Compare large amounts of data points irrespective of time measurements
- Convert horizontal axis into logarithmic scale
- Substitute for line charts to enable changing horizontal axis scale 

### Bubble charts

You can use a bubble chart in many of the same scenarios as a scatter chart. Here are some of the other ways you can use bubble charts:

- Visually emphasize value differences with variable bubble size
- Support scenarios with three data series that each has sets of values
- Present financial data in a visual rather than numerical form
- Display data with quadrants 

### Dot plot charts

Use cases for the dot plot chart are similar to the scenarios described for scatter and bubble charts. The primary advantage of dot plot charts is the ability to include categorical data along the horizontal axis.

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses. If both parties don't have individual Power BI Pro licenses, the report needs to be saved in Premium capacity to enable sharing. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Prerequisites

Review the following prerequisites for using scatter, bubble, and dot plot charts in Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample PBIX file.

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Retail Analysis Sample PBIX** file, and then select **Open**.

   The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Retail Analysis Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Retail Analysis Sample** to download it. The sample opens in report view.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-retail-analysis-sample.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="media/power-bi-visualization-scatter/power-bi-retail-analysis-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

## Create a scatter chart

Let's begin by creating a scatter chart to highlight district sales data in the Retail Analysis Sample.

1. On the **Data** pane, select three fields:

   - Expand **Sales** and select the **Sales Per Sq Ft** and **Total Sales Variance %** checkboxes.

   - Expand **District** and select the  **District** checkbox.

   By default, Power BI creates a clustered column chart to display the data. On the **Visualizations** pane, the **District** field is assigned to the **X-axis** and the other two fields are assigned to the **Y-axis**.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-clustered-column-chart.png" alt-text="Screenshot that shows the default cluster column chart for the selected data fields.":::

   You can now convert the clustered column chart visual into a scatter chart.

1. Select the chart visual, and then select **Scatter chart** on the **Visualizations** pane.

   Notice the changes to the **Visualizations** pane. The **District** field is now listed under **Values**. The chart axes are also different. Power BI plots the **Sales Per Sq Ft** field along the **X Axis** and the **Total Sales Variance %** field along the **Y Axis**.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter-initial.png" alt-text="Screenshot that shows the initial scatter chart visualization for the selected Retail Analysis Sample data in Power BI.":::

1. On the **Visualizations** pane, drag the **District** field from the **Values** section to the **Legend** section.

   Power BI creates data points where the data values intersect along the X and Y axes. The data point colors represent different districts.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter-district.png" alt-text="Screenshot of the updated scatter chart that shows different colors for the data according to district.":::

Now let's add a third dimension by creating a bubble chart for the data.

## Create a bubble chart

The following steps show how to add a third dimension for your data by creating a bubble chart.

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

1. Open the Analytics pane :::image type="icon" source="media/power-bi-visualization-scatter/power-bi-analytics.png"::: to add additional information to your visualization.
  
   - Add a median line. Select **Median line** > **Add line**. By default, Power BI adds a median line for *Sales per sq ft*. This line isn't helpful since we can see that there are 10 data points and know that the median is created with five data points on each side. Instead, switch the **Series** to *Total sales variance %*.  

      :::image type="content" source="media/power-bi-visualization-scatter/power-bi-analytics-median.png" alt-text="Screenshot of the bubble chart with median line added.":::

   - Add symmetry shading to show which points have a higher value of the x-axis measure compared to the y-axis measure, and vice-versa. When you activate symmetry shading in the Analytics pane, Power BI shows you the background of your scatter chart symmetrically based on your current axis upper and lower boundaries. You can quickly identify which axis measure a data point favors, especially when you have a different axis range for your x and y axis.

      1. Change the **Y Axis** field to **Gross Margin Last Year %**

         :::image type="content" source="media/power-bi-visualization-scatter/power-bi-format-symmetry.png" alt-text="Screenshot of the Details with Gross Margin Last Year percent selected.":::

      1. From the Analytics pane, add **Symmetry shading**. We can see from the shading that Hosiery (the blue square in the pink shaded area) is the only category that favors  gross margin rather than its sales per store square footage. 

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

Add a field to the **Details** well to tell Power BI how to group the values. The field must be unique for each point you want to plot. You can provide a row number or ID field.

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-t-shoot.png" alt-text="Screenshot of a scatter chart with RowNum added to the Details well.":::

If you don't have that in your data, create a field that concatenates your X and Y values together into something unique per point:

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-t-shoot-2.png" alt-text="Screenshot of a scatter chart with TempTime added to the Details well.":::

To create a new field, [use the Power BI Desktop Query Editor to add an Index Column](../create-reports/desktop-add-custom-column.md) to your dataset. Then add this column to your visualization's **Details** well.


## Next steps

- Try [high-density sampling in Power BI scatter charts](../create-reports/desktop-high-density-scatter-charts.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
- For other questions, connect with the [Microsoft Power BI Community](https://community.fabric.microsoft.com/t5/Microsoft-Power-BI-Community/ct-p/powerbi).