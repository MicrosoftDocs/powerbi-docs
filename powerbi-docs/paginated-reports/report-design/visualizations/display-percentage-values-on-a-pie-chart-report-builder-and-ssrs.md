---
title: "Display percentage values on pie chart in Power BI paginated report | Microsoft Docs"
description: Learn how to display percentage values in a paginated report on a pie chart, in the legend or in the pie slices in Power BI Report Builder.
ms.date: 02/24/2023
ms.service: powerbi
ms.subservice: report-design


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Display percentage values on pie chart in Power BI paginated report (Power BI Report Builder)

In Power BI paginated reports, by default the legend shows categories. You may also want percentages in the legend or the pie slices themselves.

![Screenshot of a pie-chart-other-slicepie chart showing percentages for the slices of the pie.](/powerbi-docs/paginated-reports/media/paginated-reports-visualizations/pie-chart-other-slice.png "Screenshot of a pie chart showing percentages for the slices of the pie.") 


 The [Tutorial: Add a Pie Chart to Your Report (Power BI Report Builder)](/paginated-reports/tutorials/tutorial-add-a-pie-chart-to-your-report-report-builder) walks you through adding percentages to pie slices, if you'd like to try this with sample data first.
 
  
## Display percentage values as labels on a pie chart  
  
1.  Add a pie chart to your report. For more information, see [Add a Chart to a Report &#40;Power BI Report Builder&#41;](/paginated-reports/report-design/visualizations/add-a-chart-to-a-report-report-builder-and-ssrs).  
  
2.  On the design surface, right-click on the pie and select **Show Data Labels**. The data labels should appear within each slice on the pie chart.  
  
3.  On the design surface, right-click on the labels and select **Series Label Properties**. The **Series Label Properties** dialog box appears.  
  
4.  Type **#PERCENT** for the **Label data** option.  
  
5.  (Optional) To specify how many decimal places the label shows, type "#PERCENT{P*n*}" where *n* is the number of decimal places to display. For example, to display no decimal places, type "#PERCENT{P0}".  
  
## Display percentage values in the legend of a pie chart  
  
1.  On the design surface, right-click on the pie chart and select **Series Properties**. The **Series Properties** dialog box displays.  
  
2.  In **Legend**, type **#PERCENT** for the **Custom legend text** property.  
  
## Next steps  
* [Tutorial: Add a Pie Chart to Your Report (Power BI Report Builder)](/paginated-reports/tutorials/tutorial-add-a-pie-chart-to-your-report-report-builder)
*  [Pie Charts &#40;Power BI Report Builder&#41;](/paginated-reports/report-design/visualizations/pie-charts-report-builder-and-ssrs)   
*  [Formatting the Legend on a Chart &#40;Power BI Report Builder&#41;](/paginated-reports/report-design/visualizations/chart-legend-formatting-report-builder)   
*  [Display Data Point Labels Outside a Pie Chart &#40;Power BI Report Builder&#41;](/paginated-reports/report-design/visualizations/display-data-point-labels-outside-a-pie-chart-report-builder-and-ssrs)   
