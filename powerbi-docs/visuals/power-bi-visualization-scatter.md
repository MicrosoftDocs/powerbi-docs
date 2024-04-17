---
title: Scatter, bubble, and dot plot charts in Power BI
description: Learn how to use scatter charts, dot plot charts, and bubble charts in Power BI Desktop and the Power BI service.
author: miguelmyersMS
ms.author: miguel.myers
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/31/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Scatter charts, bubble charts, and dot plot charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article describes how to create scatter chart visualizations in Power BI, which includes support for bubble charts and dot plot charts.

**Scatter charts** display data along a horizontal (x) and vertical (y) axis. The chart reveals how numerical values along the two axes are related. When data intersects on the two axes, Power BI displays a data point. 

You can analyze data points to identify relationships in your data. Data points are distributed evenly or unevenly across the horizontal axis depending on the chart data. You can set the number of data points up to a maximum of 10,000. Tooltips are available for all data points. The tooltip shows details for the data based on the data represented in the chart.

**Bubble charts** expand on the concept of data points by representing two intersected values with a bubble. The bubble size represents a third data dimension that's useful for evaluation. While a scatter chart uses two axes, a bubble chart can support three data series where each series has different sets of values.

**Dot plot charts** also employ the features of scatter charts. In a scatter chart, you can adjust the independent scales of the axes to reveal more information about the grouped values. Dot plot charts expand on the capabilities of the scatter chart by allowing you to add categorical data on the horizontal axis. The visibility of the category information can help you quickly analyze your data and highlight important points. Your chart settings can reveal patterns in large sets of data, such as showing linear or nonlinear trends, clusters, and outliers. 

These three visuals help to reveal relationships and patterns in your data. The chart visualizations can identify interesting information about your data that might not be readily apparent by just looking at the numerical values. 

The scatter, bubble, and dot plot charts are useful for comparing large numbers of data points without regard to any specific time. The more data you include in your chart, the better the comparisons you can make.

## When to use scatter, bubble, and dot plot charts

Let's review some common usage scenarios for these chart visualizations. The following image showcases different display options offered for these visuals.

:::image type="content" source="media/power-bi-visualization-scatter/power-bi-compare-charts.png" alt-text="Illustration that compares the visual display for a scatter chart, bubble chart, and dot plot chart in Power BI." lightbox="media/power-bi-visualization-scatter/power-bi-compare-charts.png" border="false":::

### Scatter charts

Scatter charts work well in many scenarios:

- Show relationships between two numerical values.
- Plot two groups of numbers as one series of x and y coordinates.
- Display worksheet data with pairs or grouped sets of values.
- Show patterns in large sets of data.
- Compare large amounts of data points irrespective of time measurements.
- Convert horizontal axis into logarithmic scale.
- Substitute for line charts to enable changing horizontal axis scale.

### Bubble charts

You can use a bubble chart in many of the same scenarios as a scatter chart. Here are some of the other ways you can use bubble charts:

- Visually emphasize value differences with variable bubble size.
- Support scenarios with three data series that each has sets of values.
- Present financial data in a visual rather than numerical form.
- Display data with quadrants.

### Dot plot charts

Use cases for the dot plot chart are similar to the scenarios described for scatter and bubble charts. The primary advantage of dot plot charts is the ability to include categorical data along the horizontal axis.

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

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses. If both parties don't have individual Power BI Pro licenses, the report needs to be saved in Premium capacity to enable sharing. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Create a scatter chart

Let's begin by creating a scatter chart to highlight district sales data in the Retail Analysis Sample.

1. On the **Data** pane, select three fields:

   - Expand **Sales** and select the **Sales Per Sq Ft** and **Total Sales Variance %** checkboxes.

   - Expand **District** and select the  **District** checkbox.

   By default, Power BI creates a clustered column chart to display the data. On the **Visualizations** pane, the **District** field is assigned to the **X-axis** and the other two fields are assigned to the **Y-axis**.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-clustered-column-chart.png" alt-text="Screenshot that shows the default cluster column chart for the selected data fields.":::

   You can now convert the clustered column chart visual into a scatter chart.

1. Select the chart visual, and then select **Scatter chart** on the **Visualizations** pane.

   Notice the changes to the **Visualizations** pane. The **District** field is now listed under **Values**. The chart axes are also different. Make sure that Power BI plots the **Sales Per Sq Ft** field along the **X Axis** and the **Total Sales Variance %** field along the **Y Axis**.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter-initial.png" alt-text="Screenshot that shows the initial scatter chart visualization for the selected Retail Analysis Sample data in Power BI.":::

1. On the **Visualizations** pane, drag the **District** field from the **Values** section to the **Legend** section.

   Power BI creates data points where the data values intersect along the x and y axes. The data point colors represent different districts.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-scatter-district.png" alt-text="Screenshot of the updated scatter chart that shows different colors for the data according to district.":::

Now let's add a third dimension by creating a bubble chart for the data.

## Create a bubble chart

The following steps show how to chart a third data dimension for the Retail Analysis Sample. This approach transitions a scatter chart into a bubble chart.

1. On the **Data** pane, expand **Sales** > **This Year Sales** and select the **Value** checkbox.

   Notice that the field **This Year Sales** is added to the **Size** section of the **Visualizations** pane. Power BI uses the value information for the field to replace each data point with a _bubble_. The volume size of the bubble is proportionate to the numerical sales value of the data point.  

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-bubble-initial.png" alt-text="Screenshot that shows how data points on a scatter chart transition to bubbles of different sizes based on the numerical value.":::

1. Hover over a bubble to see the tooltip.

   The tooltip shows how the volume size of the bubble is proportionate to the **This Year Sales** numerical value for the data point. 

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-bubble-hover.png" alt-text="Screenshot that shows how to display a tooltip for a data point or bubble to see information about the corresponding numerical value." border="false":::

### Change the number of data points displayed in your bubble chart.

1. On the **Visualizations** pane, select the paintbrush icon to open the **Format** section. Make sure the **General** section is selected.

      :::image type="content" source="media/power-bi-visualization-scatter/power-bi-format-general.png" alt-text="Screenshot that shows how to access the Format General section of the Visualizations pane." border="false":::
   
1. Under the **Properties** > **Advanced options** section, adjust the **Number of data points** value.

      :::image type="content" source="media/power-bi-visualization-scatter/power-bi-set-number-data-points.png" alt-text="Screenshot that shows how to change the number of data points for the bubble chart." border="false":::

      The maximum number of data points is 10,000. When the configured value approaches the maximum, be sure to test your chart output to ensure good performance.

1. Because we have a value in the **Size** field well (This year sales), we can adjust the marker range. To do this, select the paint brush icon and choose **Visual** > **Markers**. 

1. Change the marker range scale to Auto, Magnitude, or Data Range. This option is available only if the **Size** well is populated, and for **All** series when a chart includes multiple series.

    :::image type="content" source="media/power-bi-visualization-scatter/power-bi-ranges.png" alt-text="Screenshot of the format pane with the Range scaling section outlined in red.":::

   - Auto: This is the default setting. If the data contains only positive, or only negative values, Magnitude mode is used. Otherwise, if the data includes both positive and negative values, Data Range mode is used.
   - Magnitude: Any negative data values used for sizing are converted to positive values with the same magnitude (e.g. -15 converted to 15). The size of the bubbles scale from zero to the maximum magnitude value.
   - Data Range: The size of the bubbles varies based on the data input. The smallest data value, whether positive or negative, is shown as the smallest bubble size. Similarly, the largest data value is shown with the largest bubble size.
   - Deprecated: Reports saved in earlier versions of Power BI display **Deprecated**. This mode is no longer supported for new reports. 
   

1. Open the Analytics pane to add additional information to your visualization.

    :::image type="icon" source="media/power-bi-visualization-scatter/power-bi-median.png" alt-text="Screenshot of Analytics pane with Median line outlined in red."::: 

1. Add a median line. Select **Median line** > **Add line**. By default, Power BI adds a median line for *Sales per sq ft*. This line isn't helpful since we can see that there are 10 data points and know that the median will be created with five data points on each side. Instead, switch the **Series** to *Total sales variance %*.  


## Create a dot plot chart

It's easy to create a dot plot chart from an existing scatter chart. Just replace the numerical field that's aligned to the horizontal x-axis with a categorical field.

1. On the **Visualizations** > **Build** visual pane, locate the **X Axis** option.

1. Select the **x** at the right of the **Sales Per Sq Ft** field and remove the field.

1. Add a new field to the **X Axis** option. Drag and paste the **District** > **District Manager** field from the **Data** pane.

Power BI creates a dot plot chart from the data in the existing scatter chart. The dot plot chart adds the **District Manager** category information to the horizontal x-axis. You can see the names of the district managers along the bottom edge of the chart.

:::image type="content" source="media/power-bi-visualization-scatter/power-bi-dot-plot-initial.png" alt-text="Screenshot that shows how to add category information to a scatter chart to easily create a dot plot chart.":::

In this example, we adjusted the chart visual to display triangle markers for the data points. We'll learn how to change the markers and other formatting options in the next section.

## Format your chart

There are many display options available on the **General** and **Visual** sections of the **Visualizations > Format** visual pane. Take some time to explore the features.

- Try changing the data point or bubble colors, axes labels, chart titles, background shading, and more.
   
- To [improve accessibility](../create-reports/desktop-accessibility-overview.md), consider adding marker shapes to each line.

   To select the marker shape, expand **Markers** under **Visual**, choose **Shape**, and select a shape.

   :::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-marker.png" alt-text="Screenshot of the Shape Type drop-down list showing the Marker shape options for a chart in Power BI.":::

   Change the marker shape to a diamond, triangle, or square.

## Add analytics to your chart

The following steps show how to add analytics information to your visualization.

1. On the **Visualizations** pane, select the magnifier glass icon to switch to the **Analytics** section.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-format-analytics.png" alt-text="Screenshot that shows how to access the Analytics section of the Visualizations pane." border="false":::

1. Locate the **Median line** section and select **Add line**.

   Power BI adds a median line for the **Total Sales Variance %** field.

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-analytics-median.png" alt-text="Screenshot of the bubble chart with a median line added for the Total Sales Variance Percentage field.":::

   Now that you have a median line, you can add symmetry shading to show which points have a higher value for the x-axis measure compared to the y-axis measure, and vice-versa. When you activate symmetry shading in the **Analytics** pane, Power BI shows you the background of your scatter chart symmetrically based on your current axis upper and lower boundaries. You can quickly identify which axis measure a data point favors, especially when you have a different axis range for your x and y axes.

1. Return to the **Build** visual section of the **Visualizations** pane. Change the **Y Axis** option to use the **Gross Margin Last Year %** field.
   
   You can drag the field from the **Data** pane and drop it onto the **Y Axis** option. Power BI automatically updates the option value.

1. Switch back to the **Analytics** section and locate the **Symmetry shading** section. Slide the toggle to enable the **Symmetry shading** feature.
   
   The shading reveals interesting information about the _Hosiery_ category (the blue square in the light red shaded area above the median line). This category is the only one that favors the gross margin value over sales per store square footage. 

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-symmetry.png" alt-text="Screenshot of the bubble chart with symmetry shading added.":::

1. Continue exploring the **Analytics** pane to discover interesting ways to reveal insights about your data. 

   :::image type="content" source="media/power-bi-visualization-scatter/power-bi-analytics-example.png" alt-text="Screenshot of a scatter chart with modified analytics settings in Power BI.":::

## Considerations and troubleshooting

Review the following considerations for working with scatter charts in Power BI.

### Charts with many data points

The maximum number of data points that you can display on any type of scatter chart is 10,000. When the number of data points approaches the maximum setting, it's a good practice to test your chart output to ensure good performance.

The load time for the chart visual increases as the number of data points increases. If you choose to publish a report with a data point limit set at the high end of the scale, you should test internet and mobile access to your report. Confirm the chart performance meets your users' expectations.

### Charts with a single data point

Does your scatter chart have only one data point that aggregates all of the values on the x and y axes, as shown in the following image? Or does it aggregate all the values along a single horizontal or vertical line?

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-t-shoot.png" alt-text="Screenshot of a scatter chart that has only one data point." border="false":::

In this scenario, you can add a field to the **Values** option for the chart on the **Visualizations** > **Build visual** pane. The field instructs Power BI on how to group the values. The field must be unique for each point you want to plot. You can provide a row number or ID field. In the following example, we set the **Values** option to the **RowNum** ID field from the semantic model. 

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-t-shoot-1.png" alt-text="Screenshot of a scatter chart with the RowNum field added to the Values option." border="true":::

If your data doesn't include a specific row number or ID, you can create a field to concatenate your x and y values together. The field must be unique for each point you want to plot. In the following example, we set the **Values** option to a new field named **TempTime** to hold the concatenated values.

:::image type="content" source="media/power-bi-visualization-scatter/pbi-scatter-t-shoot-2.png" alt-text="Screenshot of a scatter chart with a new field named TempTime added to the Values option." border="true":::

To create a new field, [use the Power BI Desktop Query Editor to add an Index Column](../create-reports/desktop-add-custom-column.md) to your semantic model. Then add this column to your visual's **Values** option.

## Related content

- Try [high-density sampling in Power BI scatter charts](../create-reports/desktop-high-density-scatter-charts.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
- For other questions, connect with the [Microsoft Power BI Community](https://community.fabric.microsoft.com/t5/Microsoft-Power-BI-Community/ct-p/powerbi).
