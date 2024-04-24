---
title: "Display data point labels outside a pie chart in a Power BI paginated report | Microsoft Docs"
description: Discover how displaying the labels outside a pie chart in a Power BI paginated report might create more room for longer data labels in Power BI Report Builder.
ms.date: 03/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Display data point labels outside a pie chart in a Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

In Power BI paginated reports, pie chart labeling is optimized to display labels on only several slices of data. Labels may overlap if the pie chart contains too many slices. One solution is to display the labels outside the pie chart, which may create more room for longer data labels. If you find that your labels still overlap, you can create more space for them by enabling 3D. This reduces the diameter of the pie chart, creating more space around the chart.  
  
  
## Display data point labels inside a pie chart  
  
1. Add a pie chart to your report. For more information, see [Add a Chart to a Report &#40;Power BI Report Builder&#41;](add-chart-report-report-builder.md).  
  
1. On the design surface, right-click on the chart and select **Show Data Labels**.  
  
## Display data point labels outside a pie chart  
  
1. Create a pie chart and display the data labels.  
  
1. Open the Properties pane.  
  
1. On the design surface, select on the pie itself to display the **Category** properties in the Properties pane.  
  
1. Expand the **CustomAttributes** node. A list of attributes for the pie chart is displayed.  
  
1. Set the **PieLabelStyle** property to **Outside**.  
  
1. Set the **PieLineColor** property to **Black**. The PieLineColor property defines callout lines for each data point label.  
  
## Prevent overlapping labels displayed outside a pie chart  
  
1. Create a pie chart with external labels.  
  
1. On the design surface, right-click outside the pie chart but inside the chart borders and select **Chart Area Properties**.The **Chart AreaProperties** dialog box appears.  
  
1. On the **3D Options** tab, select **Enable 3D**.  
  
1. If you want the chart to have more room for labels but still appear two-dimensional, set the **Rotation** and **Inclination** properties to **0**.  
  
## Related content

- [Pie Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/pie-charts-report-builder-and-ssrs)   
- [Collect Small Slices on a Pie Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/collect-small-slices-on-a-pie-chart-report-builder-and-ssrs)   
- [Display Percentage Values on a Pie Chart &#40;Power BI Report Builder&#41;](display-percentage-values-pie-chart-report-builder.md)  
