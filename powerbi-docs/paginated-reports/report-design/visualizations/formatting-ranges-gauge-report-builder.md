---
title: "Format ranges on a gauge in Power BI paginated reports | Microsoft Docs"
description: Visually indicate with a gauge range in a Power BI paginated report when the pointer value has gone into a certain span of values in Power BI Report Builder.
ms.date: 03/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Format ranges on a gauge in Power BI paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

 In a Power BI paginated report, the gauge range is a zone or area on the gauge scale that indicates an important subsection of values on the gauge. Using a gauge range, you can visually indicate when the pointer value has gone into a certain span of values. Ranges are defined by a start value and an end value.  
  
 You can also use ranges to define different sections of a gauge. For example, on a gauge with values from 0 to 10, you can define a red range that has a value from 0 to 3, a yellow range that has a value from 4 to 7 and a green range that has a value from 8 to 10. If the start value that you specified is greater than the end value that you specified, the values are swapped so that the start value is the end value and the end value is the start value.  
  
 You can position the range in the same way that you position pointers on a scale. The **Position** and **Distance from scale** properties determine the position of the range. For more information, see [Gauges &#40;Power BI Report Builder&#41;](gauges-report-builder.md).  
  
You create and modify Power BI paginated reports in [Power BI Report Builder](../../report-builder-power-bi.md).
  
## Related content

- [Formatting scales on a gauge &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-scales-on-a-gauge-report-builder-and-ssrs)   
- [Formatting pointers on a gauge &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-pointers-on-a-gauge-report-builder-and-ssrs)   
- [Set a minimum or maximum on a gauge &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/set-a-minimum-or-maximum-on-a-gauge-report-builder-and-ssrs)   
- [Tutorial: Adding a KPI to your report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-adding-a-kpi-to-your-report-report-builder)   
- [Gauges &#40;Power BI Report Builder&#41;](gauges-report-builder.md)  
  
  
