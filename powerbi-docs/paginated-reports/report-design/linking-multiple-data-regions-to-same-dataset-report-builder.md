---
title: "Link multiple data regions to the same dataset in a Power BI paginated report | Microsoft Docs"
description: Find out how to add multiple data regions to a Power BI paginated report to provide different views of data from the same report dataset in Power BI Report Builder.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---

# Link multiple data regions to the same dataset in a Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

You can add multiple data regions to a paginated report to provide different views of data from the same report dataset. For example, you might want to display data in a table and also display it visually in a chart. To do so, you must use identical expressions and scopes for the appropriate filter expressions, sort expressions, and group expressions.  
  
## Use a chart and a table or matrix to display the same data

 To use a chart and a table or matrix to display the same data, it helps to understand the similarities between a table and shape charts, and a matrix and area, bar, and column charts. A table with a single row group can easily be displayed as a pie chart. As you add multiple row groups, you can choose different types of charts to best display the nested groups. Adding nested row groups to a pie chart increases the number of slices in the pie. You must decide if the number of group instances for the parent group and child group combined is too many to display in a single pie chart. For multiple group values that display as small slices on a pie chart, you can set a property so that all values below a certain threshold display as one pie slice. For more information, see [Collect small slices on a Pie chart](../../paginated-reports/report-design/visualizations/collect-small-slices-pie-chart-report-builder.md).  
  
## Show a table with multiple row groups as a column chart

 You can show a table with multiple row groups as a column chart with multiple category groups. For more information, see [Display the same data on a matrix and a chart](/sql/reporting-services/report-design/display-the-same-data-on-a-matrix-and-a-chart-report-builder). For an example of a table and chart that present different views of the same report dataset, see the Product Line Sales report in AdventureWorks Report Samples. Because both the table and the chart are linked to the same dataset in this report, when you select the interactive sort button for Employee Name in the sort the Top Employees table, the Top Employees chart also automatically shows the new sort order. For more information about downloading this sample report and others, see [Power BI Report Builder sample reports](https://go.microsoft.com/fwlink/?LinkId=198283).  

## Use the same group expressions for matrix column groups and chart category groups

 A matrix with multiple row and column groups can best be displayed by using an area, bar, or column chart with both category and series groups. Use the same group expressions for column groups on the matrix and category groups on the chart, and the same group expressions for row groups on the matrix and series groups on the chart. You must keep in mind that the number of group instances affects the readability of the chart. You can define groups based on range values to reduce the number of group instances in a report. For more information, see [Group expression examples](../../paginated-reports/expressions/group-expression-examples-report-builder.md).  
  
## Related content

- [Charts](../../paginated-reports/report-design/visualizations/charts-report-builder.md)   
- [Tables, matrices, and lists](../../paginated-reports/report-builder-tables-matrices-lists.md)   
- [Nested data regions](../../paginated-reports/report-design/drillthrough-drilldown-subreports-nested-data-regions.md)  

