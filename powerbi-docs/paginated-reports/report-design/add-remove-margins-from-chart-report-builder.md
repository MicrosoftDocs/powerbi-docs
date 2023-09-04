---
title: "Add or remove margins from a Power BI paginated report chart | Microsoft Docs"
description: Add or remove margins from a column or scatter chart in Power BI Report Builder. Improve readability or appearance of Power BI paginated reports. 
ms.date: 07/14/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add or remove margins from a Power BI paginated report chart (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

For the Column and Scatter chart types in Power BI paginated reports, the chart automatically adds side margins at the ends of the x-axis. In Bar chart types, the chart automatically adds side margins at the ends of the y-axis. In all other chart types, the chart does not add side margins. Also, you cannot change the size of the margin.  
Do keep in mind that this topic does not applies to pie, doughnut, funnel, or pyramid chart types.  

> [!NOTE]  
>  You can create and modify paginated report definition (.rdl) files in Power BI Report Builder.
 
## To enable or disable side margins  
  
1.  Right-click the axis and select **Axis Properties**. The **Vertical** or **HorizontalAxis Properties** dialog box will appear.  
  
1.  On the **Axis Options** page, set the **Side margins** property to:  
  
    -   **Auto** : The chart will determine whether or not to add a side margin based on the chart type.  
  
    -   **Disabled** : Bar, column, and scatter chart types will have no side margins.  
  
1.  Select **OK**.
   
## Next steps  
 [Formatting Axis Labels on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs)   
 [Axis Properties Dialog Box, Axis Options &#40;Power BI Report Builder&#41;](/previous-versions/sql/)   
 [Specify an Axis Interval &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/specify-an-axis-interval-report-builder-and-ssrs)   
 [Format Axis Labels as Dates or Currencies &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/format-axis-labels-as-dates-or-currencies-report-builder-and-ssrs)   
 [Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/charts-report-builder-and-ssrs)  
  
