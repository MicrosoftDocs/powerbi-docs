---
title: "Add or remove margins from a Power BI paginated report chart | Microsoft Docs"
description: Add or remove margins from a Column or Scatter chart in Power BI Report Builder. Improves the readability or appearance of Power BI paginated reports. 
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add or remove margins from a Power BI paginated report chart (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

For the Column and Scatter types of chart in Power BI paginated reports, the chart automatically adds side margins at the ends of the x-axis in the chart. In Bar chart types, the chart automatically adds side margins at the ends of the y-axis in the chart. In all other chart types, the chart does not add side margins. Also, you cannot change the size of the side margin.  
This topic does not applies to pie, doughnut, funnel, or pyramid chart types.  

> [!NOTE]  
>  You can create and modify paginated report definition (.rdl) files in Power BI Report Builder.
 
## Enable or disable side margins  

1.  Right-click the axis and select **Axis Properties**. The **Vertical** or **HorizontalAxis Properties** dialog box appears.  
  
1.  On the **Axis Options** page, set the **Side margins** property:  
  
    -   **Auto** The chart will determine whether to add a side margin based on the chart type.  
  
    -   **Disabled** Bar, column, and scatter charts will have no side margins.  
  
1.  Select **OK**.

## Related content

- [Formatting Axis Labels on a Chart &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/format-axis-labels-chart-report-builder.md)   
- [Specify an Axis Interval &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/specify-axis-interval-report-builder.md)   
- [Format Axis Labels as Dates or Currencies &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/format-axis-labels-dates-currencies-report-builder.md)   
- [Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/charts-report-builder.md)  
  
