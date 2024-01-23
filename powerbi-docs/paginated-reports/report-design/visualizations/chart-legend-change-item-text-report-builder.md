---
title: "Change the text of a legend item in Power BI paginated report | Microsoft Docs"
description: Find out how to change the text of a legend item in Power BI paginated report to show more information about the individual data points in Power BI Report Builder.
ms.date: 03/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Change the text of a legend item in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

When you place a field in the Values area of the Power BI paginated report chart, a legend item is automatically generated that contains the name of this field. Every legend item is connected to an individual series on the chart, with the exception of shape charts. In shape charts, the legend is connected to individual data points instead of individual series.  
  
 On shape charts, you can change the text of a legend item to show more information about the individual data points. For example, if you want to show the values of the data points as percentages in the legend, you can use a keyword such as **#PERCENT**. You can append .NET Framework format codes in conjunction with keywords to apply numeric and date formats. For more information about keywords, see [Formatting Data Points on a chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-data-points-on-a-chart-report-builder-and-ssrs).  
  
:::image type="content" source="media/paginated-reports-visualizations/shape-chart.png" alt-text="Screenshot showing Shape chart.":::

 On non-shape charts, you can change the text of a legend item. For example, if your series name is "Series1", you may want to change the text to something more descriptive like "Sales for 2008".  
  
  
## Modify the text that appears in the legend on a Shape chart  
  
1. Right-click on a series, or right-click on a field in the **Values** area, and select **Series Properties**.  
  
1. Select **Legend** and in the **Custom legend text** box, type a keyword.  
  
 The following table provides examples of chart-specific keywords to use for the **Custom Legend Text** property. For more information about keywords, see [Formatting Data Points on a chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-data-points-on-a-chart-report-builder-and-ssrs).  
  
|Keyword|Description|Example of what appears as text in the legend|  
|-------------|-----------------|---------------------------------------------------|  
|`#PERCENT{P1}`|Displays the percentage of the total value to one decimal place.|85.0%|  
|`#VALY`|Displays the actual numeric value of the data field.|17000|  
|`#VALY{C2}`|Displays the actual numeric value of the data field as a currency to two decimal places.|$17000.00|  
|`#AXISLABEL (#PERCENT{P0})`|Displays the text representation of the category field, followed by the percentage that each category displays on the chart.|Michael Blythe (85%)|  
  
> [!NOTE]  
>  The #AXISLABEL keyword can only be evaluated at run time when there is not a field specified in the **Series Groups** area.  
  
## Modify the text that appears in the legend on a non-Shape chart  
  
1. Right-click on a series, or right-click on a field in the **Values** area, and select **Series Properties**.  
  
1. Select **Legend** and in the **Custom legend text** box, type a legend label. The series is updated with your text.  
  
## Related content

- [Formatting the Legend on a chart &#40;Power BI Report Builder&#41;](chart-legend-formatting-report-builder.md)   
- [Formatting Series Colors on a chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-series-colors-on-a-chart-report-builder-and-ssrs)   
- [Hide Legend Items on the chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-legend-hide-items-report-builder)  
  
