---
title: "Position labels in Power BI paginated report charts | Microsoft Docs"
description: Determine the type of chart you're using in your Power BI paginated report to find out how to change the position of labels in that type and shape of chart.
ms.date: 03/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Position labels in a paginated report chart (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

Because each chart type in a Power BI paginated report has a different shape, data point labels are placed in an optimal location so as not to interfere on the chart. The default position of the labels varies with the chart type:  
  
- On stacked charts, labels can only be positioned inside the series.  
- On funnel or pyramid charts, labels are placed on the outside in a column.  
- On pie charts, labels are placed inside the individual slices on a pie chart.  
- On bar charts, labels are placed outside of the bars that represent data points.  
- On polar charts, labels are placed outside of the circular area that represents data points.  

## Change the position of point labels in a pie chart  
  
1. Create a pie chart.  
  
1. On the design surface, right-click the chart and select **Show Data Labels**.  
  
1. Open the Properties pane. On the **View** tab, select **Properties**.  
  
1. On the design surface, select the chart. The properties for the chart are displayed in the Properties pane.  
  
1. In the **General** section, expand the **CustomAttributes** node. A list of attributes for the pie chart is displayed.  
  
1. Select a value for the PieLabelStyle property.  
  
## Change the position of point labels in a funnel or pyramid chart  
  
1. Create a funnel or pyramid chart.  
  
1. On the design surface, right-click the chart and select **Show Data Labels**.  
  
1. Open the Properties pane. On the **View** tab, select **Properties**  
  
1. On the design surface, select the chart. The properties for the chart are displayed in the Properties pane.  
  
1. In the **General** section, expand the **CustomAttributes** node. A list of attributes for the funnel chart is displayed.  
  
1. For a funnel chart, select a value for the FunnelLabelStyle property. For a pyramid chart, select a value for the PyramidLabelStyle property.  
  
    > [!NOTE]  
    >  When this property is set to a value **OutsideInColumn**, the labels are drawn in a vertical column. There is no way to change the position of the column.  
  
## Change the position of point labels in a bar chart  
  
1. Create a bar chart.  
  
1. On the design surface, right-click the chart and select **Show Data Labels**.  
  
1. Open the Properties pane. On the **View** tab, select **Properties**  
  
1. On the design surface, select the chart. The properties for the chart are displayed in the Properties pane.  
  
1. In the **General** section, expand the **CustomAttributes** node. A list of attributes for the bar chart is displayed.  
  
1. Select a value for the BarLabelStyle property.  
  
 When the bar label style is set to **Outside**, the labels will be placed outside of the bar, as long as it fits in the chart area. If the label cannot be placed outside of the bar but inside of the chart area, the label is placed inside the bar at the position closest to the end of the bar.  
  
## Change the position of point labels in an area, column, line or scatter chart  
  
1. Create an Area, Column, Line or Scatter chart.  
  
1. On the design surface, right-click the chart and select **Show Data Labels**.  
  
1. Open the Properties pane. On the **View** tab, select **Properties**  
  
1. On the design surface, select the series. The properties for the series are displayed in the Properties pane.  
  
1. In the **Data** section, expand the **DataPoint** node, then expand the **Label** node.  
  
1. Select a value for the Position property.  
  
## Related content

- [Pie Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/pie-charts-report-builder-and-ssrs)   
- [Bar Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/bar-charts-report-builder-and-ssrs)   
- [Formatting Axis Labels on a Chart &#40;Power BI Report Builder&#41;](format-axis-labels-chart-report-builder.md)   
- [Format Axis Labels as Dates or Currencies &#40;Power BI Report Builder&#41;](format-axis-labels-dates-currencies-report-builder.md)
- [Display Data Point Labels Outside a Pie Chart &#40;Power BI Report Builder&#41;](display-data-point-labels-outside-pie-chart-report-builder.md)   
- [Formatting Data Points on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-data-points-on-a-chart-report-builder-and-ssrs)  
  
  
