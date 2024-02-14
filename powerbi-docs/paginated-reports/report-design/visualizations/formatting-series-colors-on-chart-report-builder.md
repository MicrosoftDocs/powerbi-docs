---
title: "Format series colors on a Power BI paginated report chart | Microsoft Docs"
description: Learn how to use the many built-in palettes in paginated reports for charts or define a custom palette of your own design in Power BI Report Builder.
ms.date: 04/12/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Format series colors on a paginated report chart (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

Power BI Report Builder provides several built-in palettes for paginated report charts, or you can define a custom palette. By default, charts use the built-in **Pacific** color palette to fill each series. These colors also appear in the legend. When multiple series are added to the chart, the chart assigns the series a color in the order that the colors have been defined in the palette.  
  
 If there are a greater number of series than there are colors in the palette, the chart will begin reusing colors, and two series may have the same color. This frequently occurs if you are using a Shape chart, where each data point is assigned a color from the palette. To avoid confusion, define a custom palette with at least the same number of colors as you have series on your chart.  
  
 You can select a new palette or define a custom palette from the Properties pane. For more information, see [Define Colors on a Chart Using a Palette &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/define-colors-on-a-chart-using-a-palette-report-builder-and-ssrs).  
  
## Use built-in palettes

 Power BI Report Builder provides a list of predefined, built-in palettes that you can use to define a color set for series on your chart. All built-in palettes contain between 10 and 16 color values. You cannot extend the built-in palette to include more colors, so if you need more than 16 colors, you must define a custom palette.  
  
 If you're printing a report, consider using the **Greyscale** palette. This palette uses shades of black and white to represent each series in a chart.  

## Use custom palettes

 If you want to apply your own colors to the chart, use a custom palette. A custom palette let you add your own colors in the order you want them to appear on the chart. A custom palette is especially helpful if the number of series in your chart is unknown at design time. For more information, see [Define Colors on a Chart Using a Palette &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/define-colors-on-a-chart-using-a-palette-report-builder-and-ssrs).  
  
## Use a color fill on each series

 You can also define your own colors on the chart by specifying a color for each series on the chart. To do this, open the **Series Properties** dialog box and set the **Color** property for **Fill**. This approach will override all defined palettes. Generally, it is better to use a custom palette to define your own colors because the number of series in your dataset may not be known until report processing.  
  
 This approach is best suited when you want to conditionally set the color of the series based on an expression.  For more information, see [Formatting Data Points on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-data-points-on-a-chart-report-builder-and-ssrs).  
  
## In this section 

 [Specify Consistent Colors across Multiple Shape Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/specify-consistent-colors-across-multiple-shape-charts-report-builder-and-ssrs)  
  
 [Define Colors on a Chart Using a Palette &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/define-colors-on-a-chart-using-a-palette-report-builder-and-ssrs))  
  
 [Highlight Chart Data by Adding Strip Lines &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/highlight-chart-data-by-adding-strip-lines-report-builder-and-ssrs)  
  
## Related content

- [Formatting a Chart &#40;Power BI Report Builder&#41;](formatting-chart-report-builder.md)   
- [Chart effects: Add bevel, emboss, or texture to a paginated report chart (Power BI Report Builder)](chart-effects-add-bevel-emboss-or-texture-report-builder.md)
- [Charts &#40;Power BI Report Builder&#41;](charts-report-builder.md) 
- [Formatting the Legend on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-legend-formatting-report-builder)  
  
  
