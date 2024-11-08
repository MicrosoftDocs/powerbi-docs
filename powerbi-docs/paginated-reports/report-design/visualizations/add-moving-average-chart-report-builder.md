---
title: "Adding a moving average to a chart in Power BI paginated report | Microsoft Docs"
description: Learn how the Moving Average formula price indicator can be shown on a chart to identify trends in Power BI Report Builder.
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Adding a moving average to a chart in Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

A moving average is an average of the data in your series, calculated over a defined period of time. In Power BI paginated reports, the moving average can be shown on the chart to identify significant trends.  

![Screenshot of a sales chart.](./media/paginated-reports-visualizations/report-builder-column-chart-tutorial.png "report-builder-column-chart-tutorial")

This article, [Add a calculated moving average to a series on a chart in Power BI paginated report](add-calculated-moving-average-chart-report-builder.md) shows you how to add it.
  
 The Moving Average formula is the most popular price indicator used in technical analyses. Many other formulas, including mean, median and standard deviation, can also be derived from a series on the chart. When you specify a moving average, each formula may have one or more parameters that must be specified.  
 
 The [Tutorial: Add a Column Chart to Your Report (Power BI Report Builder)](/sql/reporting-services/tutorial-add-a-column-chart-to-your-report-report-builder) walks you through adding a moving average to a chart, if you'd like to try it with sample data.
  
 When a moving average formula is added in Design mode, the line series that is added is only a visual placeholder. The chart will calculate the data points of each formula during report processing.  
  
 Built-in support for trend lines isn't available in Power BI services.

## Related content

- [Add a calculated moving average to a series on the chart](add-moving-average-chart-report-builder.md)
- [Tutorial: Add a Column Chart to Your Report (Power BI Report Builder)](/sql/reporting-services/tutorial-add-a-column-chart-to-your-report-report-builder)
- [Formatting a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-a-chart-report-builder-and-ssrs)   
- [Charts &#40;Power BI Report Builder&#41;](charts-report-builder.md)   
- [Add empty points to chart in Power BI paginated report (Power BI Report Builder)](add-empty-points-chart-report-builder.md)
  
  
