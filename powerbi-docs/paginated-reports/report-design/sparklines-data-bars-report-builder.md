---
title: "Sparklines and data bars in a Power BI paginated report | Microsoft Docs"
description: Discover the benefits of using sparklines and data bars in a paginated report in Power BI Report Builder. These compact charts convey much information in very little space. 
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Sparklines and data bars in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Sparklines and data bars are small, simple charts in a paginated report that convey a lot of information in a little space, often inline with text.   
    
  In reports, sparklines and data bars are often used in tables and matrices. Their impact comes from viewing many of them together and being able to quickly compare them one above the other, rather than viewing them singly. They make it easy to see the outliers, the rows that are not performing like the others. Although they are small, each sparkline often represents multiple data points, often over time. Data bars can represent multiple data points, but typically illustrate only one. Each sparkline typically presents a single series. You cannot add a sparkline to a detail group in a table. Because sparklines display aggregated data, they must go in a cell associated with a group. Sparklines and data bars have the same basic chart elements of categories, series, and values, but they have no legend, axis lines, labels, or tick marks.  
  
 ![Screenshot of a Sparkline Example.](media/sparkline-example.gif "Screenshot of a Sparkline Example.")  
  
 To quickly get started with sparklines, see [Tutorial: Add a Sparkline to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-sparkline-to-your-report-report-builder) and the videos [How to: Create a Sparkline in a Table](../../create-reports/power-bi-sparklines-tables.md) and [Sparklines, Bar Charts, and Indicators in Power BI Report Builder](/previous-versions/dn912438(v=msdn.10)) .  
  
  
##  <a name="KindsofSparklines"></a> Types of sparklines  
 You can create almost as many types of sparklines as there are regular charts. In general, you cannot make 3D sparklines. You can make sparkline versions of these full charts:  
  
-   [Column Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/column-charts-report-builder.md): The basic, stacked, and 100% stacked column charts.  
  
-   [Line Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/line-charts-report-builder.md): All except the 3D line chart.  
  
-   [Area Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/area-charts-report-builder.md): All except the 3D area charts  
  
-   [Pie Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/pie-charts-report-builder.md): And doughnut charts, both flat and 3D, but not the other shapes such as funnel and pyramid charts.  
  
-   [Range Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/range-charts-report-builder.md): The stock, candlestick, error bar, and box plot charts.  
  
##  <a name="DataBars"></a> Data bars  
 Data bars typically represent a single data point, though they can represent multiple data points, just like regular bar charts. They often contain several series with no category, or have series grouping.  
  
 ![Screenshot of a Data Bars.](media/data-bars.gif "Screenshot of a Data Bars.")  
  
 In this example using stacked data bars, each data bar, although only one bar, illustrates more than one data point. For example, the three different colors of the bar could represent tasks of three levels of priority with the length of the bar representing the total number of tasks assigned to each person. If you made these 100% stacked data bars instead, each bar would fill the cell, and the different colors would represent the percentage of the whole for each priority level.  
  
 You can make data bar versions of these full charts:  
  
-   [Bar Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/bar-charts-report-builder.md): Basic, stacked, and 100% stacked bar charts.  
  
-   [Column Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/column-charts-report-builder.md): Basic, stacked, and 100% stacked column charts. Column charts can be either sparklines or data bars.  
  
##  <a name="AlignDatainTableMatrix"></a> Align sparkline data in a table or matrix  
 When you insert a sparkline in a table or matrix, it is usually important for the data points in each sparkline to align with the data points of the other sparklines in that column. Otherwise it is hard to compare the data in the different rows. For example, when you compare sales data by month for different salespeople in your company, you would want the months to align. If an employee was out for the month of April, there would be no data for that employee for that month. You would want to see a gap for that month, and see the data for subsequent months align with the data for the other employees. You can do this by aligning the horizontal axis. For more information, see the section about sparklines in [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/expression-scope-for-totals-aggregates-and-built-in-collections.md), and see [Align the Data in a Chart in a Table or Matrix &#40;Power BI Report Builder&#41;](align-data-chart-table-matrix-report-builder.md).  
  
 Likewise, to be comparable across rows, data must also align vertically, meaning that the height of the bars or lines in one sparkline or data bar must be relative to the height of the bars and lines in all the other sparklines or data bars. Otherwise, you can't compare the rows to each other.  
  
 ![Screenshot of a Sparkline Align Data.](media/sparkline-align-data.gif "Screenshot of a Sparkline Align Data.")  
  
 In this image, the column chart shows daily sales for each employee. Note that for days that an employee has no sales, the chart leaves a blank and aligns subsequent days. This is an example of horizontal alignment. Also note that for some employees, every bar is short, and no bar reaches the top of the cell. This is an example of vertical alignment; without it, in the rows with no tall bars, the short bars would expand to fill the height of the cell.  
  
##  <a name="UnderstandScope"></a> Understand the data supplied to a sparkline or data bar  
 When you add a sparkline or data bar to a table or matrix, this is referred to as *nesting* one data region inside another. Nesting means that the data supplied to the sparkline or data bar is controlled by the dataset that the table or matrix is based on, and by where you put it in the table or matrix. For more information, see [Nested Data Regions &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/nested-data-regions-report-builder.md).  
  
##  <a name="ConvertSparklinetoChart"></a> Convert a sparkline or data bar to a full chart  
 Because sparklines and data bars are just a kind of chart, if you decide you would rather have the full chart functionality, you can convert one to a full chart by right-clicking the chart and selecting **Convert to Full Chart**. When you do, the axis lines, labels, tick marks, and legend are added automatically.  
  
> [!NOTE]  
>  You cannot convert a full chart to a sparkline or data bar with one click. However, you can make a sparkline or data bar from a full chart just by deleting all the chart elements that are not in sparklines and data bars.  
  
##  <a name="HowTo"></a> How-to topics  
 [Add Sparklines and Data Bars &#40;Power BI Report Builder&#41;](add-sparklines-data-bars-report-builder.md)  
 [Align the Data in a Chart in a Table or Matrix &#40;Power BI Report Builder&#41;](align-data-chart-table-matrix-report-builder.md)  
 
## Related content  

 Because sparklines and data bars are a type of chart, you might also find the following topics for charts helpful and relevant.
 
- [Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/charts-report-builder.md)   
- [Tutorial: Add a Sparkline to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-sparkline-to-your-report-report-builder)   
- [Add a Chart to a Report &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/add-chart-report-report-builder.md)  
- [Add Empty Points to a Chart &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/add-empty-points-chart-report-builder.md)  
- [Add or Remove Margins from a Chart &#40;Power BI Report Builder&#41;](add-remove-margins-from-chart-report-builder.md)  
- [Change a Chart Type &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/change-chart-type-report-builder.md)  
- [Define Colors on a Chart Using a Palette &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/define-colors-chart-using-palette-report-builder.md)  
- [Show ToolTips on a Series &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/show-tooltips-series-report-builder.md)  
- [Specify a Logarithmic Scale &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/specify-logarithmic-scale-report-builder.md)  
- [Specify an Axis Interval &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/specify-axis-interval-report-builder.md)  
- [Specify Consistent Colors across Multiple Shape Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/specify-consistent-colors-across-multiple-shape-charts-report-builder.md)  
   
