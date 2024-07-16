---
title: "Charts in Power BI paginated reports | Microsoft Docs"
description: Use chart data regions to help readers of your Power BI paginated reports understand large volumes of aggregated data at a glance in Power BI Report Builder.
ms.date: 03/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Charts in Power BI paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

Read about using chart data regions to help readers of your paginated reports understand large volumes of aggregated data at a glance.  

The more time you spend carefully preparing and understanding your data before you create a chart, the easier it will be to design your charts quickly and efficiently. For help with choosing which chart to use, see [Chart Types](/sql/reporting-services/report-design/chart-types-report-builder-and-ssrs) To start experimenting with charts immediately, see the bar, column, sparkline, and pie chart tutorials in [Power BI Report Builder Tutorials](/sql/reporting-services/report-builder-tutorials).  
  
 The following illustration shows many of the different elements used in the chart.  
  
 ![Screenshot of a Chart elements diagram.](media/paginated-reports-visualizations/chart-elements-c.png "Screenshot of a Chart elements diagram.")  

 
##  <a name="DesigningChart"></a> Design a chart  
 After you add a chart data region to the design surface, you can drag report dataset fields for numeric and non-numeric data to the Chart Data pane of the chart. When you click the chart on the design surface, the Chart Data pane appears, with three areas-Category Groups, Series Groups, and Values. If the report has a shared or embedded dataset, the fields in the dataset appear in the Report Data pane. Drag fields from the dataset into the appropriate area of the Chart Data pane. By default, when a field is added to one of the areas of the chart, Power BI Report Builder calculates an aggregate for the field. You can also use series grouping to dynamically generate series. A chart is [organized like a matrix](#SimilarMatrix).  
  
 ![Screenshot of chart showing the chart properties.](media/paginated-reports-visualizations/chart-series-categories.gif "Screenshot of chart showing the chart properties.")  
  
> [!NOTE]  
> The data in the chart at design time is different from the data in the chart when the report is processed. It is not your real data. It is generated data that has been added so that you can design your chart with an idea of what the chart will look like.  
  
##  <a name="SimilarMatrix"></a> How a chart is like a matrix  
 One way to think about how charts work is to compare them to matrices.  
  
 ![Screenshot showing a matrix template.](media/paginated-reports-visualizations/matrix-template-new-selected.gif "New Matrix added from Toolbox.")  
  
 Conceptually, their organization is identical:  
  
- The Columns group in the matrix is like the Category Groups area in the chart.  
  
- The Rows group in the matrix is like the Series Groups area in the chart.  
  
- The Data area in the matrix is like the Values area in the chart.  
  
 
##  <a name="AddingData"></a> Add data to the chart  
 Suppose you have a report that shows Sales by Name. You drop the Full Name field to the Category Groups area and the Sales field to the Values area.  
  
 When you add the Sales field to the Values area, the text of the data field appears in the legend, and the data from this numeric field will be aggregated into one value. By default, the value is aggregated using the built-in function Sum. The Chart Data pane will contain a simple expression for your field. In our example, `[Sum(Sales)]` will appear for the field expression `=Sum(Fields!Sales.Value)`. If no groups are specified, the chart will only show one data point. In order to show multiple data points, you must group your data by adding a grouping field. When you add the Name field to the Category Groups area, a grouping field of the same name as the name of the field is automatically added to the chart. When fields that define the values along the x and y axes are added, the chart has enough information to plot the data correctly.  
  
 ![Screenshot showing how to add data to the chart.](media/paginated-reports-visualizations/chart-no-series.gif "Screenshot showing how to add data to the chart.")  
  
 When the Series Groups area is left empty, the number of series is fixed at design time. In this example, Sales is the only series that appears on the chart.  
  
 
##  <a name="GroupsInChart"></a> Category and series groups in a chart  
 A chart supports nested category and series groups. Charts do not display detail data. Add groups to a chart by dragging dataset fields to the category and series drop zones for a selected chart.  
  
 Shape charts such as pie charts support category groups and nested category groups. Other charts such as bar charts support category groups and series groups. You can nest groups, but make sure that the numbers of categories or series do not obscure the presentation of information in the chart.  
  
### Add series grouping to a chart  
 If you add a field to the Series Groups area, the number of series depends on the data that is contained in that field. In our earlier example, suppose you add a Year field to the Series Groups area. The number of values in the Year field will determine how many series will appear on the chart. If the Year field contains the years 2004, 2005, and 2006, the chart will display three series for every field in the Values area.  
  
##  <a name="DatasetConsiderations"></a> Dataset considerations before creating a chart  
 Charts provide a summary view of your data. However, with large datasets, the information on a chart can become obscured or unreadable. Missing or null data points, data types ill-suited to the type of chart, and advanced applications such as combining charts with tables can all affect the readability of a chart. Before designing a chart, you should carefully prepare and understand your data so that you can design your charts quickly and efficiently.  
  
 You can have as many charts in your report as you want. A chart, like any other data region such as a matrix or table, is bound to a single dataset. If you want to display multiple datasets on the same chart, you can create an additional dataset that uses a JOIN or UNION statement in your SQL query before adding data to the chart.  
  
 Consider pre-aggregating data in the dataset query if detail data is not necessary or useful. To display each data point more clearly, reduce the number of categories in your dataset. You can filter the dataset or add a condition to your query that reduces the number of rows returned. 
  
##  <a name="BestPractices"></a> Best practices when displaying data in a chart  
 Charts are most effective when the number of elements that are displayed presents a clear image of the underlying information. Some charts, like scatter graphs, benefit from numerous data points, while others, like pie charts, are more effective with fewer data points. Choose a chart type carefully based on the values in your dataset and how you want this information to be shown. For more information, see [Chart Types &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-types-report-builder-and-ssrs).  
  
 There are several ways you can consolidate data on a chart:  
  
- When using a pie chart, collect small slices into one slice called "Other." This will reduce the number of slices on your pie chart. For more information, see [Collect Small Slices on a Pie Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/collect-small-slices-on-a-pie-chart-report-builder-and-ssrs).  
  
- Avoid using data point labels when there are numerous data points. Data point labels are most effective when there are only a few points on the chart.  
  
- Filter unwanted or irrelevant data. This helps you highlight the key data that you are trying to show on the chart. To filter data points in a chart, set a filter on a category group or a series group. By default, the chart uses the built-in function Sum to aggregate values that belong to the same group into an individual data point in the series. If you change the aggregate function of a series, you must also change the aggregate function in the filter expression. For more information, see [Filter, Group, and Sort Data &(Power BI Report Builder)](../filter-group-sort-data-report-builder.md).  
  
- To display ratio data in a table or matrix template, consider using a linear gauge instead of a bar graph. Gauges are better suited for showing a single value inside a cell. For more information, see [Nested Data Regions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/nested-data-regions-report-builder-and-ssrs).  
   
##  <a name="AggregateValues"></a> Aggregate values from a data field on the chart  
 By default, when a field is added to the Values area of the chart, Report Builder calculates an aggregate for the field. If you drag a field onto the chart without dropping the field into a specific area, the chart will determine whether this field belongs on the category (x) axis or value (y) axis based on the data type of the field. Numeric fields that are dropped in the Values area are aggregated using the SUM function. If the data type of your value field is String in the Values area, the chart cannot display a numeric value, even if there are numbers in the fields, so the chart displays the COUNT function. To avoid this behavior, make sure that the fields that you use have numeric data types, instead of Strings that contain formatted numbers. You can use a Visual Basic expression to convert String values to a numeric data type using the **CDbl** or **CInt** constant. For example, the following complex expression converts a field that is named `MyField` that contains numeric values that are formatted as Strings.  
  
 `=Sum(CDbl(Fields!MyField.Value))`  
  
 For more information about aggregate expressions, see [Aggregate Functions Reference (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference).  
   
##  <a name="InThisSection"></a> In this section  
 [Add a Chart to a Report &#40;Power BI Report Builder&#41;](add-chart-report-report-builder.md)  
 Describes the first steps in adding a chart to your report.  
  
 [Chart Types &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-types-report-builder-and-ssrs)  
 Describes all of the chart types and sub-types available in Report Builder, including considerations and best practices for using various chart types.  
  
 [Formatting a Chart &#40;Power BI Report Builder&#41;](formatting-chart-report-builder.md)  
 Use formatting to improve the overall appearance and highlight key data points of your chart.  
  
 [Empty and Null Data Points in Charts &#40;Power BI Report Builder&#41;](empty-null-data-points-charts-report-builder.md)  
 Describes considerations when working with charts based on fields with empty or null values.  
  
 [Displaying a Series with Multiple Data Ranges on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/displaying-a-series-with-multiple-data-ranges-on-a-chart)  
 Describes how to add scale breaks to a series that contains more than one range of data.  
  
 [Multiple Series on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/multiple-series-on-a-chart-report-builder-and-ssrs)  
 Describes several methods of showing multiple series on the same chart, including combining chart types, using the secondary axis, specifying different chart types and using multiple chart areas.  
  
 [Linking Multiple Data Regions to the Same Dataset &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/linking-multiple-data-regions-to-the-same-dataset-report-builder-and-ssrs)  
 Provide different views of data from the same report dataset.  
  
 [Add or Delete a Group in a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-or-delete-a-group-in-a-chart-report-builder-and-ssrs)  
 Describes adding groups and nested groups to a chart.  
  
 [Add a Moving Average to a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-a-moving-average-to-a-chart-report-builder-and-ssrs)  
 Describes using the Moving Average formula to calculate the average of the data in your series.  
  
 [Troubleshoot Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/troubleshoot-charts-report-builder-and-ssrs)  
 Describes tips for working with charts.  
  
## Related content

- [Images, Text Boxes, Rectangles, and Lines &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/images-text-boxes-rectangles-and-lines-report-builder-and-ssrs)   
- [Interactive Sort, Document Maps, and Links &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/interactive-sort-document-maps-and-links-report-builder-and-ssrs)   
- [Nested Data Regions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/nested-data-regions-report-builder-and-ssrs)   
- [Tutorial: Add a Column Chart to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-column-chart-to-your-report-report-builder)   
- [Tutorial: Add a Pie Chart to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-pie-chart-to-your-report-report-builder)   
- [Tutorial: Add a Bar Chart to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-bar-chart-to-your-report-report-builder)  
  
  
