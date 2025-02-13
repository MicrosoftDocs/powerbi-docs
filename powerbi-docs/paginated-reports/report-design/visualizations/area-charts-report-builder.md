---
title: "Area charts in Power BI paginated reports | Microsoft Docs"
description: Learn how to use area charts in Power BI paginated report. Area charts display a series as a set of points connected by a line, with all the area filled in below the line in Power BI Report Builder.
ms.date: 03/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Area charts in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  An area chart in Power BI paginated report displays a series as a set of points connected by a line, with all the area filled in below the line. For more information on how to add data to an area chart, see [Charts (Power BI Report Builder)](charts-report-builder.md).  
  
 The following illustration shows an example of a stacked area chart. The data is well suited for display on a stacked area chart because the chart can display totals for all series and the proportion that each series contributes to the total.  
  
 ![Screenshot of an Area chart.](media/paginated-reports-visualizations/area-chart.gif "Area chart")  

You create and modify Power BI paginated reports in [Power BI Report Builder](../../report-builder-power-bi.md).
  
## Variations  
  
- **Stacked area**. An area chart where multiple series are stacked vertically. If there is only one series in your chart, the stacked area chart displays the same as an area chart.  
  
- **Percent stacked area**. An area chart where multiple series are stacked vertically to fit the entire chart area. If there is only one series in your chart, the stacked area chart displays the same as an area chart.  
  
- **Smooth area**. An area chart where the data points are connected by a smooth line instead of a regular line. Use a smooth area chart instead of an area chart when you are more concerned with displaying trends than with displaying the values of individual data points.  
  
## Data considerations for area charts  
  
- Along with the line chart, the area chart is the only chart type that displays data contiguously. For this reason, an area chart is commonly used to represent data that occurs over a continuous period of time.  
  
- A percent stacked area chart is useful for showing proportional data that occurs over time.  
  
- If there is only one series, a stacked area chart is drawn as an area chart.  
  
- In a plain area chart, if the values in multiple series are similar, the areas may overlap, obscuring important data point values. You can resolve this issue by changing the chart type to a stacked area chart, which is designed to show multiple series on an area chart.  
  
- If your stacked area chart contains gaps, it is possible that your dataset includes empty values, which is shown as a vacant section on a stacked area chart. If your dataset includes empty values, consider inserting empty points on the chart. Adding empty points fills in the empty areas on the chart with a different color to indicate null or zero values. For more information, see [Add empty points to a chart &#40;Power BI Report Builder&#41;](add-empty-points-chart-report-builder.md).  
  
- Area chart types are similar to column and line charts in behavior. If you are making a comparison between multiple series, consider using a column chart instead. If you are analyzing trends over a period of time, consider using a line chart.  
  
## Related content

- [Charts (Power BI Report Builder)](charts-report-builder.md)
- [Chart types &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-types-report-builder-and-ssrs)   
- [Line charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/line-charts-report-builder-and-ssrs)
- [Change a chart type in Power BI paginated reports (Power BI Report Builder)](change-chart-type-report-builder.md)
- [Empty and null data points in charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/empty-and-null-data-points-in-charts-report-builder-and-ssrs)  
