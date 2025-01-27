---
title: "Multiple series on a Power BI paginated report chart | Microsoft Docs"
description: Find out how to use multiple series on a Power BI paginated report chart when showing two related series of data like price and volume, or income and tax in Power BI Report Builder.
ms.date: 03/29/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: monaraya 
---
# Multiple series on a paginated report chart (Power BI Report Builder)

  When multiple series are present on a paginated report chart, you must determine the best way to compare the series. You can use a stacked chart to show relative proportions of each series. If you are comparing only two series that share a common category (x) axis, use the secondary axis. This is useful when showing two related series of data, for example, price and volume, or income and tax. If the chart becomes unreadable, consider using multiple chart areas to create more visual separation between each series.  
  
 In addition to using chart features, it is important to decide which chart type should be used for your data. If the fields in your dataset are related, consider using a range chart.  
  
  
## Using Stacked and 100% Stacked Charts  
 Stacked charts are commonly used to display multiple series in one chart area. Consider using stacked charts when the data that you are trying to show is closely related. It is also a good practice to show four or less series on a stacked chart. If you want to compare the proportion that each series contributes to the whole, use a 100% stacked area, bar, or column chart. These charts calculate the relative percentage that each series contributes to the category. For more information, see [Area Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/area-charts-report-builder-and-ssrs), [Bar Charts &#40;Power BI Report Builder&#41;](bar-charts-report-builder.md) and [Column Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/column-charts-report-builder-and-ssrs).  
  
## Using the Secondary Axis  
 When a new series is added to the chart, it is plotted using the primary x and y axes. When you want to compare values that are of a different unit of measure, consider using the *secondary axis* so that you can plot two series on separate axes. The secondary axis is useful when comparing values that are of a different unit of measure. The secondary axis is drawn on the opposite side of the primary axis. The chart only supports a primary and a secondary axis. The secondary axis has the same properties as the primary axis. For more information, see [Plot Data on a Secondary Axis &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/plot-data-on-a-secondary-axis-report-builder-and-ssrs).  
  
 If you want to display more than two series that have different ranges of data, consider putting the series in separate chart areas.  
  
## Using Chart Areas  
 The chart is the top-level container that includes the outer border, the chart title, and the legend. By default, the chart contains one default chart area. The chart area is not visible on the chart surface, but you can think of the chart area as a container that includes only the axis labels, the axis title, and the plotting area of one or more series. The following illustration shows the concept of chart areas within a single chart.  
  
 ![Screenshot showing a diagram of a chart area.](media/paginated-reports-visualizations/
chart-areas-diagram.png "Shows a diagram of a chart area")  
  
 Using the **Chart Area Properties** dialog box, you can specify the 2D and 3D orientation of all series contained in the chart area, align multiple chart areas within the same chart, and format the colors of the plotting area. When a new chart area is defined on a chart that contains only one default chart area, the available space for a chart area is horizontally divided by two and the new chart area is positioned below the first chart area.  
  
 Each series can be connected to only one chart area. By default, all series are added to the default chart area. When using area, column, line, and scatter charts, any combination of these series can be displayed on the same chart area. For example, you can display a column series and a line series on the same chart area. The advantage of using the same chart area for multiple series is that end users can make comparisons easily.  
  
 Bar, radar, and shape charts cannot be combined with any other chart type in the same chart area. If you want to make comparisons with multiple series that are of type bar, radar, or shape, you will need to do one of the following:  
  
-   Change all series in the chart area to be of the same chart type.  
  
-   Create a new chart area and move one or more of the series from the default chart area into the newly created chart area.  
  
 The multiple chart area on a single chart feature is also useful if you are trying to compare data that has different scales of values. For example, if your first series contains data in the range of 10 to 20 and your second series contains data in the range of 400 to 800, the values in your first series may become obscured. Consider separating each series into a different chart area. For more information, see [Specify a Chart Area for a Series &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/specify-a-chart-area-for-a-series-report-builder-and-ssrs).  
  
## Using Range Charts  
 Range charts have two values per data point. If your chart contains two series that share the same category (x) axis, you can use a range chart to show the difference between the two series. Range charts are best suited for displaying high-low or top-bottom information. For example, if your first series contains the highest sale for each day in January, and your second series contains the lowest sale for each day in January, you can use a range chart to show the difference between the highest and lowest sale for each day. For more information, see [Range Charts &#40;Report Builder&#41;](/sql/reporting-services/report-design/range-charts-report-builder-and-ssrs).  
  
## Related content

- [Charts &#40;Power BI Report Builder&#41;](charts-report-builder.md)   
- [Displaying a Series with Multiple Data Ranges on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/displaying-a-series-with-multiple-data-ranges-on-a-chart)   
- [Chart Types &#40;Power BI Report Builder&#41;](chart-types-report-builder.md)  
  
  
