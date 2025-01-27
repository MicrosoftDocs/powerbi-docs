---
title: "Hide chart legend items in the Power BI paginated report chart | Microsoft Docs"
description: Discover how to choose Power BI paginated report items that appear on the legend to display the essential data in Power BI Report Builder.
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Hide chart legend items in a Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

By default, any series added to a non-Shape chart in Power BI paginated report will be added as an item in the legend. For pie, doughnut, funnel, and pyramid charts, any series added to the chart will add individual data points in the legend.  
  
 You can hide any item on the legend. When you hide a legend item, it will still appear in the chart. This is useful in situations where you do not want to show more information for a series that is added to the chart. For example, if you have added a calculated series like a moving average to the chart, you may want to hide this entry in the legend so that more information is only shown for the original series.  

## Hide an item from display in the legend  
  
1.  Right-click on the series you want to hide and select **Series Properties**.  
  
2.  Select **Legend**. Select the **Do not show this series in a legend** option.  
  
    > [!NOTE]  
    >  You cannot hide a series for one group and not for the others. If you have added a field to the **Series Groups** area, all series belonging to this group will be hidden.  
  
## Related content

- [Formatting the Legend on a Chart &#40;Power BI Report Builder&#41;](chart-legend-formatting-report-builder.md)   
- [Formatting Data Points on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-data-points-on-a-chart-report-builder-and-ssrs)   
- [Change the Text of a Legend Item &#40;Power BI Report Builder&#41;](chart-legend-change-item-text-report-builder.md)   
- [Add a moving average to a chart in Power BI paginated report (Power BI Report Builder)](add-moving-average-chart-report-builder.md)
- [Legend Properties Dialog Box, General &#40;Power BI Report Builder&#41;](chart-legend-formatting-report-builder.md)  
  
