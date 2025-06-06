---
title: "Add data to a tablix data region in a Power BI paginated report | Microsoft Docs"
description: Learn how to display detailed or grouped data, from a report dataset in a table or matrix, to a tablix data region in a Power BI paginated report. 
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: JulCsc
ms.author: juliacawthra
ms.reviewer: saurkumar
---
# Add data to tablix data region in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In paginated reports, to display data from a report dataset in a table or matrix, in each data cell, specify the name of a dataset field to display. You can display detail data or grouped data. If you add groups to a table or matrix, rows and columns for group values and group data are added automatically. You can then add subtotals and totals for your data.  
  
 All data in a data region belongs to at least one group. Detail data is a member of the details group. For more information about detail and grouped data, see [Understanding Groups &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/understand-groups-report-builder.md).  
  
  
## Add detail data  
 Detail data is all the data from a report dataset after filters are applied to the dataset, data region, and details group. All detail data displayed in a single tablix data region must come from the same report dataset.  
  
 To add detail data from a report dataset to a tablix data region, drag a dataset field from the Report Data pane to each cell in the detail row. For existing cells in a tablix data region, you can add or edit a dataset field expression by using the field selector in each cell or by dragging a field from the Report Data pane to the cell. To create additional columns, you can drag the field from the Report Data pane and insert it into an existing tablix data region.  
  
 By default, at run-time, a cell in the details row displays detail data and a cell in a group row displays an aggregate value. For more information about tablix rows and columns, see [Tablix Data Region Cells, Rows, and Columns &#40;Power BI Report Builder&#41;](tablix-data-region-cells-rows-columns-report-builder.md).  
  
 A table template and a list template provide a details row. A matrix template has no details row. If your tablix data region has no details row, you can add one by defining a details group. For more information, see [Add a Details Group &#40;Power BI Report Builder&#41;](add-details-group-report-builder.md).  
  
## Add grouped data  
 Grouped data is all the detail data specified by a group expression after filters are applied to the dataset, data region, and the group. To organize detail data in groups, drag fields from the Report Data pane to the Grouping pane. When you add a group, Power BI Report Builder automatically adds related rows or columns to the tablix data region on which to display grouped data. Cells in these rows or columns are associated with grouped data. For more information, see [Add or Delete a Group in a Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/add-delete-group-data-region-report-builder.md).  
  
 By default, when you add a dataset field that represents numeric data to a cell in a group row or column, the value of the cell is the sum of the grouped data scoped to the innermost row and column group memberships for the cell. You can change the default aggregate function Sum to any other aggregate function, such as Avg or Count. You can also change the default scope for an aggregate calculation, for example, to calculate the percentage a value contributes to a row group. For more information, see [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/expression-scope-for-totals-aggregates-and-built-in-collections.md).  
  
 By default, all grouped data comes from the same report dataset. In a tablix data region, you can include aggregate values from another dataset by specifying the dataset name as a scope. You can specify multiple aggregate values from multiple datasets within a single tablix data region. For more information, see [Aggregate Functions Reference (Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference).  
  
## Add subtotals and totals  
 To add subtotals for a group and grand totals for the data region, use the Add Total feature on the shortcut menu in a cell or in the Grouping pane. The rows and columns on which to display the totals are automatically added for you. Subtotal and total expressions default to using the [Sum](/sql/reporting-services/report-design/report-builder-functions-sum-function) aggregate function. After you add the expression, you can change the default function. For more information, see [Add a Total to a Group or Tablix Data Region &#40;Power BI Report Builder&#41;](add-total-group-tablix-data-region-report-builder.md) and [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/expression-scope-for-totals-aggregates-and-built-in-collections.md).  
  
## Add labels  
 To add labels for a group or for the data region, add a row or column outside the group that you want to label. Label rows and columns are similar to rows and columns that you add to display totals. For more information, see [Insert or Delete a Row &#40;Power BI Report Builder&#41;](insert-delete-row-report-builder.md) or [Insert or Delete a Column &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/insert-delete-column-report-builder.md).  
  
## Add an existing tablix data region from another report  
 You can copy a data region from another report and paste it into-a new or existing report. After you paste the data region, you must ensure that the dataset the data region uses is defined, and that the dataset fields have identical names and data types as in the original report. You cannot copy datasets from one report to another, but if your reports use same data sources, you can quickly duplicate the dataset in another report. Also you can import the query text for the queries that retrieve the data for the dataset, which makes it simple to duplicate the queries in reports. For more information, see [Report Embedded Datasets &#40;Power BI Report Builder&#41;](../../paginated-reports/report-data/report-embedded-datasets-report-builder.md).  
  
## Related content

- [Expressions &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/report-builder-expressions.md)   
- [Report Parameters &#40;Power BI Report Builder&#41;](../../paginated-reports/parameters/report-builder-parameters.md)   
- [Interactive Sort, Document Maps, and Links &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/interactive-sort-document-maps-and-links-report-builder-and-ssrs)   
- [Add Dataset Filters, Data Region Filters, and Group Filters &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/add-dataset-filters-data-region-filters-and-group-filters.md)   
- [Add, Edit, Refresh Fields in the Report Data Pane &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-data/add-edit-refresh-fields-in-the-report-data-pane-report-builder-and-ssrs)   
- [Add an Expression &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/add-expression-report-builder.md)  
  
  
