---
title: "Column charts in Power BI paginated report | Microsoft Docs"
description: Show comparisons or data changes over a period of time with a Power BI paginated report column chart in Power BI Report Builder. Display a series as a set of vertical bars grouped by category.
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Column charts in Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  A column chart in a Power BI paginated report displays a series as a set of vertical bars that are grouped by category. Column charts are useful for showing data changes over a period of time or for illustrating comparisons among items. The plain column chart is closely related to the bar chart, which displays series as sets of horizontal bars, and the range column chart, which displays series as sets of vertical bars with varying beginning and end points. For more information, see [Bar Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/bar-charts-report-builder-and-ssrs) and [Range Charts &#40;Power BI Report Builder&#41;](range-charts-report-builder.md).  
  
 The column chart is well suited for this data because all three series share a common time period, allowing for valid comparisons to be made.  

## Variations of a column chart  
  
- **Stacked**. A column chart where multiple series are stacked vertically. If there is only one series in your chart, the stacked column chart will display the same as a column chart.  
  
- **Percent stacked**. A column chart where multiple series are stacked vertically to fit 100% of the chart area. If there is only one series in your chart, all the column bars will fit to 100% of the chart area.  
  
- **3D clustered**. A column chart that shows individual series in separate rows on a 3D chart.  
  
- **3D cylinder**. A column chart whose bars are shaped like cylinders on a 3D chart.  
  
- **Histogram**. A column chart which the chart calculates so that its bars are arranged in a normal distribution.  
  
- **Pareto**. A column chart whose bars are arranged from highest to lowest.  
  
## Data considerations for a column chart  
  
- Bar and column charts are most commonly used to show comparisons between groups. If more than three series are present on the chart, consider using a stacked bar or column chart. You can also collect stacked bar or column charts into multiple groups if you have several series on your chart. For more information, see [Bar Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/bar-charts-report-builder-and-ssrs).  
  
- In a column chart, you have less space for category axis labels to display horizontally. If you have longer category labels, consider using a bar chart or changing the rotation angle of the label.  
  
- You can add special drawing styles to the individual bars on a column chart to increase its visual impact. Drawing styles include wedge, emboss, cylinder and light-to-dark. These effects are designed to improve the appearance of your 2D chart. If you are using a 3D chart, the drawing styles will still be applied, but may not have the same effect. For more information about how to add a drawing style to a bar chart, see [Add bevel, emboss, or texture to a paginated report chart (Power BI Report Builder)](chart-effects-add-bevel-emboss-or-texture-report-builder.md).  
  
- Unique to column charts is the ability to show your chart as a histogram or Pareto chart. To do so, set the ShowColumnAs property to **Histogram** or **Pareto** in the Properties window to **true**.  
  
## Related content

- [Charts &#40;Power BI Report Builder&#41;](charts-report-builder.md)   
- [Chart Types &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-types-report-builder-and-ssrs)   
- [Bar Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/bar-charts-report-builder-and-ssrs)   
- [Range Charts &#40;Power BI Report Builder&#41;](range-charts-report-builder.md)   
- [Tutorial: Add a Bar Chart to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-bar-chart-to-your-report-report-builder)   
- [Empty and Null Data Points in Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/empty-and-null-data-points-in-charts-report-builder-and-ssrs)  
