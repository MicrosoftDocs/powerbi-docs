---
title: "Format data points on a Power BI paginated report chart | Microsoft Docs"
description: Find out about different types of formatting of data points on charts in your paginated reports in Power BI Report Builder. 
ms.date: 04/12/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: JulCsc
ms.author: juliacawthra
ms.reviewer: monaraya
---
# Format data points on a paginated report chart (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

In a Power BI paginated report, a data point is the smallest individual entity on the chart. On non-Shape charts, data points are represented depending on their chart type. For example, a Line series consists of one or more connected data points. On Shape charts, data points are represented by individual slices or segments that add up to the whole chart. For example, on a pie chart, each piece is a data point. For more information, see [Chart Types &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-types-report-builder-and-ssrs).  
  
 One or more data points form a series. By default, all formatting options are applied to all data points in the series. If you want to specify properties for individual data points, you can specify a field or expression on the series that formats individual data points at run time based on the dataset.  

## Add ToolTips and drillthrough actions to data points

 You can add ToolTips to each data point by setting the value of the **ToolTip** property on the series. By displaying ToolTips, you can give your users the ability to see any information related to the data point, such as the group name, the value of the data point and the percentage of the data point relative to the series total. For more information, see [Show ToolTips on a Series &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/show-tooltips-on-a-series-report-builder-and-ssrs).  
  
 You can also specify a drillthrough action for data points on the series to display another report or a URL. You can pass parameters to show information relating to the data point that has been clicked. For more information, see [Add a Drillthrough Action on a Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-a-drillthrough-action-on-a-report-report-builder-and-ssrs).  
  
## Highlight individual data points in a series

 On any non-Shape chart, you can highlight individual data points by specifying an expression for the Color property. For example, to highlight the highest data point value in a series that is named `MyField` with a different color than the other data points, the expression would be similar to the following:  
  
 `=Iif(Fields!MyField.Value >= Max(Fields!MyField.Value, "MyDataSet"), "Red", "Green")`  
  
 In this example, the highest value for `MyField` will have the color Red and all other data points will have the color Green. When you specify a color for the series using the **Fill** property on the series, the chart overrides the colors that are specified in the palette. For more information, see [Formatting Series Colors on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-series-colors-on-a-chart-report-builder-and-ssrs).  
  
## Position data point labels on a chart

 For all chart types, you can show data point labels when you right-click the chart and select **Show Data Labels**. The position of the data point labels is specified depending on the chart type:  
  
- On a bar chart, you can reposition the data point label using the **BarLabelStyle** custom attribute. There are four possible positions: Outside, Left, Center and Right. When the bar label style is set to Outside, the labels will be positioned outside the bar, as long as it fits in the chart area. If the label cannot be positioned outside the bar and inside the chart area, the label is positioned inside the bar.  
  
- On a pie chart, you can reposition the data point label using the **PieLabelStyle** custom attribute. There are many considerations when positioning data point labels around a pie chart, including the size of the pie chart, the available space between the pie chart and its corresponding legend, and the size of the labels. For more information, see [Display Data Point Labels Outside a Pie Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/display-data-point-labels-outside-a-pie-chart-report-builder-and-ssrs).  
  
- On a pyramid or funnel chart, you can reposition the data point labels using the **FunnelLabelStyle** and **PyramidLabelStyle** custom attributes. You can set these attributes in the **Properties** pane when you have selected a pyramid or funnel chart type.  
  
- On stacked charts, data point labels are always positioned inside the series and the **Position** property on the series label is ignored.  
  
- On all other chart types, you can reposition the data point label using the **Position** property on the series label. By default, the chart automatically calculates the position for data point labels to avoid label collisions. When you set a value for **Position**, all data point labels will be positioned the same way, which may cause the labels to overlap. Consider using this approach only when you have fewer data points.  
  
 For more information, see [Position Labels in a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/position-labels-in-a-chart-report-builder-and-ssrs).  
  
## Add keywords for data point labels, ToolTips, and legend text  
 You can use case-sensitive, chart-specific keywords to represent an item that exists in the chart. These keywords are only applicable to ToolTips, custom legend text, and data point label properties. In many cases, a chart keyword has an equivalent simple expression, but the keyword is faster and easier to type. The following is a list of chart keywords.  
  
|Chart Keyword|Description|Applicable to Chart Type|Example of an Equivalent Simple Expression|  
|-------------------|-----------------|------------------------------|------------------------------------------------|  
|#VALY|Y value of the data point.|All|`=Fields!MyDataField.Value`|  
|#VALY2|Y value #2 of data point.|Range, Bubble|None|  
|#VALY3|Y value #3 of data point.|Stock, Candlestick|None|  
|#VALY4|Y value #4 of data point.|Stock, Candlestick|None|  
|#SERIESNAME|Series name.|All|None|  
|#LABEL|Data point label.|All|None|  
|#AXISLABEL|Axis data point label.|Shape|`=Fields!MyDataField.Value`|  
|#INDEX|Data point index.|All|None|  
|#PERCENT|Percentage of the data point Y value.|All|`=FormatPercent(Fields!MyDataField.Value/Sum(Fields!MyDataField.Value, "MyDataSet"),2)`|  
|#TOTAL|Total of all Y values in the series.|All|`=Sum(Fields!MyDataField.Value)`|  
|#LEGENDTEXT|The text that corresponds to the text of the legend item.|All|None|  
|#AVG|Average of all Y values in the series.|All|`=Avg(Fields!MyDataField.Value)`|  
|#MIN|Minimum of all Y values in the series.|All|`=Min(Fields!MyDataField.Value)`|  
|#MAX|Maximum of all Y values in the series.|All|`=Max(Fields!MyDataField.Value)`|  
|#FIRST|First of all Y values in the series.|All|`=First(Fields!MyDataField.Value)`|  
  
 To format the keyword, enclose a .NET Framework format string in parentheses. For example, to specify the value of the data point in a ToolTip as a number with two decimal places, include the format string "N2" in braces, such as "#VALY{N2}" for the **ToolTip** property on the series. For more information about formatting numbers in Power BI Report Builder, see [Formatting Numbers and Dates &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-numbers-and-dates-report-builder-and-ssrs).  
  
 For more information about adding keywords to a chart, see:

- [Show ToolTips on a Series &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/show-tooltips-on-a-series-report-builder-and-ssrs) 
- [Change the Text of a Legend Item &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-legend-change-item-text-report-builder).  
  
## Increase readability in a chart with multiple data points

 If you have multiple series on your chart, it may reduce the readability of the chart data points. When adding multiple series to the chart, consider using a technique that distinguishes how to read and understand each series in the chart effectively. For more information, see [Multiple Series on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/multiple-series-on-a-chart-report-builder-and-ssrs).  
  
 For simplicity, when you are using a Shape chart, consider adding only one data field and one category field. For more information, see [Shape Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/shape-charts-report-builder-and-ssrs). If your chart needs more than one data field and category field, consider changing the chart type. You can right-click the series and select **Change Chart Type**.  
  
## Insert data point markers

 A data point marker is a visual indicator used to draw attention to each data point in a series. On a scatter chart, the marker is used to determine the shape and size of the individual data points. The size of the marker is specified based on the chart type. You can change the size, color, or style of the marker. Markers are not available for range and shape chart types, or any stacked subtypes.  
  
## In this section

 [Show ToolTips on a Series &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/show-tooltips-on-a-series-report-builder-and-ssrs)  
  
 [Display data point labels outside a pie chart in a Power BI paginated report (Power BI Report Builder)](display-data-point-labels-outside-pie-chart-report-builder.md) 
  
 [Display percentage values on pie charts in Power BI paginated report (Power BI Report Builder)](display-percentage-values-pie-chart-report-builder.md)
  
## Related content

- [Charts in Power BI paginated reports (Power BI Report Builder)](charts-report-builder.md)
- [Format a chart in a paginated report (Power BI Report Builder)](formatting-chart-report-builder.md)
- [Format axis labels on a paginated report chart (Power BI Report Builder)](format-axis-labels-chart-report-builder.md)
- [Format axis labels as dates or currencies in a paginated report (Power BI Report Builder)](format-axis-labels-dates-currencies-report-builder.md)
- [Tutorial: Add a Pie Chart to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-pie-chart-to-your-report-report-builder)   
- [Expression examples in Power BI Report Builder](../../expressions/report-builder-expression-examples.md)
- [Expressions in Power BI Report Builder](../../expressions/report-builder-expressions.md)
