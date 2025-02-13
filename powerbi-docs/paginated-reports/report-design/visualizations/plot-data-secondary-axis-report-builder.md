---
title: "Plot data on a secondary axis in Power BI paginated report | Microsoft Docs"
description:  Find out about the uses for the secondary axis type in a Power BI paginated report for comparing two distinct data ranges in Power BI Report Builder. 
ms.date: 03/30/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---

# Plot data on a secondary axis in Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

The Power BI paginated report chart has two axis types: primary and secondary. The secondary axis is useful when comparing two value sets with two distinct data ranges that share a common category.  
  
 For example, suppose you have a chart that calculates Revenue vs. Tax for the year 2008. In this case, the 2008 time period is common to both value sets. However, when both series are plotted on the same y-axis, we cannot make a useful comparison because the scale of the y-axis is optimized for the largest values in the dataset. If we show Revenue on the primary axis, and Tax on the secondary axis, we can display each series on its own y-axis with its own scale of values. The series still share a common x-axis.  
  
 In situations where there are more than two series to be compared, consider a different approach for comparing and displaying multiple series in a chart. For more information, see [Multiple Series on a Chart](/sql/reporting-services/report-design/multiple-series-on-a-chart-report-builder-and-ssrs).  
  
 An example of this chart is available as a sample report. For more information about downloading this sample report and others, see [Power BI Report Builder and Report Designer sample reports](https://go.microsoft.com/fwlink/?LinkId=198283).  
  

  
### To plot a series on the secondary axis  
  
1.  Right-click the series in the chart or right-click on a field in the **Values** area that you want to display on the secondary axis and click **Series Properties**. The **Series Properties** dialog box appears.  
  
2.  Click **Axes and Chart Area**, and select which of the secondary axes you want to enable, the value axis or the category axis.  

## Related content

- [Formatting Axis Labels on a Chart](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs)   
- [Specify an Axis Interval](specify-axis-interval-report-builder.md)  

More questions? [Try asking the Reporting Services forum](https://go.microsoft.com/fwlink/?LinkId=620231)
