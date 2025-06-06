---
title: "Specify consistent colors in multiple shape charts in Power BI paginated report | Microsoft Docs"
description: Find out how choosing colors for a shape chart in Power BI paginated report results in mapping each color in the palette to a data point in the dataset.
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: JulCsc
ms.author: juliacawthra
ms.reviewer: saurkumar
---
# Specify consistent colors in multiple shape charts in Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  On non-shape charts in a Power BI paginated report, Power BI Report Builder selects a new color from the palette based on the index of series in the chart. For example, the first series on your chart will be mapped to the first color in the palette. However, this behavior differs for shape charts. On shape charts, each color in the palette is mapped to a data point in the dataset. For example, data point 1 is mapped to the first color in the palette, data point 2 is mapped to the second color palette and so on.  
  
 If a data point has no value, it is omitted from display on a shape chart. This means that the data point is skipped from being colored. For example, if point 2 has a value of zero, point 1 will be mapped to the first color in the palette, and point 3 will be mapped to the second color in the palette. This approach is useful because the empty points in the dataset of a pie chart do not unnecessarily use a palette color when the empty point does not need to be drawn.  
  
 As a side effect, when multiple pie charts are displayed in a report, the pie charts may display different colors for data points that have the same category grouping. To resolve this, you need to define individual colors that map to a category group instead of individual data values. How you do this depends on if the shape charts are sparklines in a table or matrix, or if they are shape charts in the report itself.  
  
 The legend is connected to the series, so any color you specify for the series will automatically be shown on the legend.  
  
  
  
## Specify consistent colors across multiple sparkline shape charts in a table or matrix  
  
1.  Select the chart to display the Chart Data pane.  
  
2.  In the **Category Groups** area, right-click a category and select **Category Group Properties**.  
  
3.  On the General tab, in the **Synchronize groups in** box, select the name of the category for which you would like to synchronize colors, and then select **OK**.  
  
## Specify consistent colors across multiple shape charts  
  
1.  Right-click outside the body of the report, and select **Report Properties**.  
  
2.  In **Code**, type the following code into the textbox.  
  
    ```  
    Private colorPalette As String() = {"Color1", "Color2", "Color3"}  
    Private count As Integer = 0  
    Private mapping As New System.Collections.Hashtable()  
    Public Function GetColor(ByVal groupingValue As String) As String  
        If mapping.ContainsKey(groupingValue) Then  
            Return mapping(groupingValue)  
        End If  
        Dim c As String = colorPalette(count Mod colorPalette.Length)  
        count = count + 1  
        mapping.Add(groupingValue, c)  
        Return c  
    End Function  
    ```  
  
    > [!NOTE]  
    >  You will need to replace the "Color1" strings with your own colors. You can use named colors, for example "Red", or you can use six-digit hexadecimal value that represent the color, such as "#FFFFFF" for black. If you have more than three colors defined, you will need to extend the array of colors so that the number of colors in the array matches the number of points in your shape chart. You can add new colors to the array by specifying a comma-separated list of string values that contain named colors or hexadecimal representations of colors.  
  
3.  Select **OK**.
  
4.  Right-click on the shape chart and select **Series Properties**.  
  
5.  In **Fill**, select the **Expression** (*fx*) button to edit the expression for the **Color** property.  
  
6.  Type the following expression, where "MyCategoryField" is the field that is displayed in the **Category Groups** area:  
  
    ```  
    =Code.GetColor(Fields!MyCategoryField)  
    ```  
  
## Related content

- [Formatting Series Colors on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-series-colors-on-a-chart-report-builder-and-ssrs)   
- [Chart effects: Add bevel, emboss, or texture to a paginated report chart (Power BI Report Builder)](chart-effects-add-bevel-emboss-or-texture-report-builder.md)
- [Define Colors on a Chart Using a Palette &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/define-colors-on-a-chart-using-a-palette-report-builder-and-ssrs)   
- [Add empty points to a chart in a Power BI paginated report (Power BI Report Builder)](add-empty-points-chart-report-builder.md)  
- [Shape Charts &#40;Power BI Report Builder&#41;](shape-charts-report-builder.md)   
- [Linking Multiple Data Regions to the Same Dataset &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/linking-multiple-data-regions-to-the-same-dataset-report-builder-and-ssrs)   
- [Nested Data Regions &#40;Power BI Report Builder and SSRS&#41;](/sql/reporting-services/report-design/nested-data-regions-report-builder-and-ssrs)   
- [Sparklines and Data Bars &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/sparklines-and-data-bars-report-builder-and-ssrs)  
  
  
