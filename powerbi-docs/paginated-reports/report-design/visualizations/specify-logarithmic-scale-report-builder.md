---
title: "Specify logarithmic scale in Power BI paginated reports | Microsoft Docs"
description: Improve the appearance of your chart by making your data more manageable with a logarithmic scale on a chart in a Power BI paginated report.  
ms.date: 03/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Specify logarithmic scale in Power BI paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  If you have data that is logarithmically proportional, you may want to consider using a logarithmic scale on a chart in a paginated report. This helps improve the appearance of the chart by making your data more manageable. Most logarithmic scales use a base of 10.  
  
 This feature is only available on the value axis. The value axis is usually the vertical, or y-axis. On bar charts, however, it is the horizontal, or x-axis.  
  
 If your axis is logarithmic, all other properties relating to the axis will be scaled logarithmically. For example, if you specify a base-10 logarithmic scale on your axis, setting an axis interval of 2 will generate intervals in magnitudes of 10 to the power of 2, or 100. This means your axis values will read 1, 100, 10000, instead of the default result of 1, 10, 100, 1000, 10000.  
  
You create and modify Power BI paginated reports in [Power BI Report Builder](../../report-builder-power-bi.md). 
  
## Specify a logarithmic scale  
  
1. Right-click the y-axis of your chart, and click **VerticalAxis Properties**. The **VerticalAxis Properties** dialog box appears.  
  
1. In **Axis Options**, select **Uselogarithmic scale**.  
  
1. In the **Logbase** text box, type a positive value for the logarithmic base. If no value is specified, the logarithmic base defaults to 10.  
  
## See also

 [Formatting axis labels on a chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs)   
 [Formatting a chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-a-chart-report-builder-and-ssrs)   
 [Format axis labels as dates or currencies &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/format-axis-labels-as-dates-or-currencies-report-builder-and-ssrs)   
 [Charts (Power BI Report Builder)](charts-report-builder.md)  
  
  
