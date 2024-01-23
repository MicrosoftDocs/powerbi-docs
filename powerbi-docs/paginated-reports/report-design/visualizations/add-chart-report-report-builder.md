---
title: "Add a chart to a Power BI paginated report | Microsoft Docs"
description: Learn how to add a chart to a Power BI paginated report when you want to summarize data in a visual format in Power BI Report Builder.
ms.date: 03/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Add a chart to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

When you want to summarize data in a visual format in a paginated report, use a chart data region. It is important to choose an appropriate chart type for the type of data that you are presenting. This affects how well the data can be interpreted when put in chart form. For more information, see [Charts (Power BI Report Builder)](charts-report-builder.md).  
  
 The simplest way to add a chart data region to your report is to run the New Chart Wizard. The wizard offers column, line, pie, bar, and area charts. For these and other chart types, you can also add a chart manually.  
  
 After you add a chart data region to the design surface, you can drag report dataset fields for numeric and non-numeric data to the Chart Data pane of the chart. Select the chart to display the Chart Data pane with its three areas: Series Groups, Category Groups, and Values.  
 

## Add a chart to a report  
  
1. Create a report and define a dataset. For more information, see [Report Datasets &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-data/report-datasets-ssrs).  
  
1. On the **Insert** tab, select **Chart**, and then select **Insert Chart**.  

1. Select the design surface where you want the upper-left corner of the chart, and then drag to where you want the lower-right corner of the chart.  
  
     The **Select Chart Type** dialog box appears.  
  
1. Select the type of chart you want to add. Select **OK**.
  
1. Select the chart to display the **Chart Data** pane.  
  
1. Add one or more fields to the **Values** area. This information will be plotted on the value axis.  
  
1. Add a grouping field to the **Category Groups** area. When you add this field to the **Category Groups** area, a grouping field is automatically created for you. Each group represents a data point in your series.  
  
1. To summarize the data by category, right-click the data field and select **Series Properties**. In the **Category** box, select the category field from the drop-down list. Select **OK**.
  
1. On the **Home** tab, select **Run** to see the rendered report.  
  
1. On the **Run** tab, select **Design** to continue working on the report.  
  
 On charts with axes, such as bar and column charts, the category axis may not display all the category labels. For more information about how to change the axis labels, see [Specify an axis interval in a Power BI paginated report (Power BI Report Builder)](specify-axis-interval-report-builder.md).
  
## Related content

- [Charts &#40;Power BI Report Builder&#41;](charts-report-builder.md)   
- [Chart Types &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-types-report-builder-and-ssrs)   
- [Empty and Null Data Points in Charts &#40;Power BI Report Builder&#41;](empty-null-data-points-charts-report-builder.md)   
- [Tutorial: Adding a Bar Chart to Your Report (Power BI Report Builder)](/sql/reporting-services/tutorial-add-a-bar-chart-to-your-report-report-builder)  
- [Tutorial: Adding a Pie Chart to Your Report (Power BI Report Builder)](/sql/reporting-services/tutorial-add-a-pie-chart-to-your-report-report-builder)   
 