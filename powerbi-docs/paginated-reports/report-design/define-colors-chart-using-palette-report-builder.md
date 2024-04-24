---
title: "Define colors on a Power BI paginated report chart using a palette | Microsoft Docs"
description: Change the color palette for a Power BI paginated report chart by selecting a pre-defined palette or by defining a custom palette. 
ms.date: 06/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Define colors on a paginated report chart using a palette (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  You can change the color palette for a Power BI paginated report chart by selecting a pre-defined palette or defining a custom palette. Custom palettes are chart-specific.  
  
  
## Change the colors on the chart using a built-in color palette  
  
1. Open the Properties pane.  
  
1. On the design surface, select the chart. The properties for the chart object are displayed in the Properties pane.  
  
     The object name (**Chart1** by default) appears in the drop-down list at the top of the Properties pane.  
  
1. In the **Chart** section, for the Palette property, select a new palette from the drop-down list.  
  
    > [!NOTE]  
    >  You cannot change the colors or order in a pre-defined palette.  
  
## Define your own colors on the chart using a custom color palette  
  
1. Open the Properties pane.  
  
1. On the design surface, select the chart. The properties for the chart object are displayed in the Properties pane.  
  
1. In the **Chart** section, for the **Palette** property, select **Custom**.  
  
1. In the CustomPaletteColors property, select the Edit Collection (**...**) button. The **ReportColorExpression Collection Editor** opens.  
  
1. Select **Add** to add a color. Select a color from the drop-down list or select Expression and specify a hex value for a specific color, such as ff6600 for "Orange".  
  
     For more information about hex values, see [Color Table](https://go.microsoft.com/fwlink/?linkid=9258) on MSDN.  
  
1. Select **Add** to add more colors to the palette.  
  
1. When you are done, select **OK**.  
  
 If you're using a custom palette, you can change the order of the colors to change the color of different series in the chart.  
  
## Related content

- [Formatting series colors on a chart (Power BI Report Builder)](/sql/reporting-services/report-design/formatting-series-colors-on-a-chart-report-builder-and-ssrs)   
- [Charts (Power BI Report Builder)](/sql/reporting-services/report-design/charts-report-builder-and-ssrs)   
- [Specify consistent colors across multiple shape charts (Power BI Report Builder)](/sql/reporting-services/report-design/specify-consistent-colors-across-multiple-shape-charts-report-builder-and-ssrs)  
  
  
