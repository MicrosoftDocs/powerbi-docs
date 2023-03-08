---
title: "Change the text of a legend item in Power BI paginated report | Microsoft Docs"
description: Find out how to change the text of a legend item in Power BI paginated report to show more information about the individual data points in Power BI Report Builder.
ms.date: 02/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Chart legend - change item text in a paginated report (Power BI Report Builder)

  When a field is placed in the Values area of the Power BI paginated report chart, a legend item is automatically generated that contains the name of this field. Every legend item is connected to an individual series on the chart, with the exception of shape charts, where the legend is connected to individual data points instead of individual series.  
  
 On shape charts, you can change the text of a legend item to show more information about the individual data points. For example, if you want to show the values of the data points as percentages in the legend, you can use a keyword such as **#PERCENT**. You can append .NET Framework format codes in conjunction with keywords to apply numeric and date formats. For more information about keywords, see [Formatting Data Points on a Chart &#40;Power BI Report Builder&#41;](formatting-data-points-on-chart-report-builder.md).  
  
 ![Screenshot showing Sharp Chart](/powerbi-docs/paginated-reports/media/paginated-reports-visualizations/sharpchart.png "Sharp Chart")  
  
 On non-shape charts, you can change the text of a legend item. For example, if your series name is "Series1", you may want to change the text to something more descriptive like "Sales for 2008".  
  
  
### Modify the text that appears in the legend on a Shape chart  
  
1.  Right-click on a series, or right-click on a field in the **Values** area, and select **Series Properties**.  
  
2.  Click **Legend** and in the **Custom legend text** box, type a keyword.  
  
 The following table provides examples of chart-specific keywords to use for the **Custom Legend Text** property. For more information about keywords, see [Formatting Data Points on a Chart &#40;Power BI Report Builder&#41;](formatting-data-points-on-chart-report-builder.md).  
  
|Keyword|Description|Example of what appears as text in the legend|  
|-------------|-----------------|---------------------------------------------------|  
|`#PERCENT{P1}`|Displays the percentage of the total value to one decimal place.|85.0%|  
|`#VALY`|Displays the actual numeric value of the data field.|17000|  
|`#VALY{C2}`|Displays the actual numeric value of the data field as a currency to two decimal places.|$17000.00|  
|`#AXISLABEL (#PERCENT{P0})`|Displays the text representation of the category field, followed by the percentage that each category displays on the chart.|Michael Blythe (85%)|  
  
> [!NOTE]  
>  The #AXISLABEL keyword can only be evaluated at run time when there is not a field specified in the **Series Groups** area.  
  
### Modify the text that appears in the legend on a non-Shape chart  
  
1.  Right-click on a series, or right-click on a field in the **Values** area, and select **Series Properties**.  
  
2.  Click **Legend** and in the **Custom legend text** box, type a legend label. The series is updated with your text.  
  
## Next steps  
 [Formatting the Legend on a Chart &#40;Power BI Report Builder&#41;](chart-legend-formatting-report-builder.md)   
 [Formatting Series Colors on a Chart &#40;Power BI Report Builder&#41;](formatting-series-colors-on-chart-report-builder.md)   
 [Hide Legend Items on the Chart &#40;Power BI Report Builder&#41;](chart-legend-hide-items-report-builder.md)  
  