---
title: "Understand groups in a Power BI paginated report | Microsoft Docs"
description: Gain an understanding of how a group organizes a view of a report dataset in a paginated report in Power BI Report Builder. 
ms.date: 06/29/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Understand groups in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  In a Power BI paginated report, a group is a named set of data from the report dataset that is bound to a data region. Basically, a group organizes a view of a report dataset. All groups in a data region specify different views of the same report dataset.  
  
 To help visualize what a group is, refer to the following figure that shows the tablix data region in Preview. In this figure, the row groups categorize the dataset by product type and the column groups categorize the dataset by geographic region and year.  
  
 ![Screenshot showing tablix data region areas.](../report-design/media/tablix-areas.gif "Tablix data region areas.")  
  
 The following sections help describe the various aspects of groups.  

## What makes a group?  
 A group has a name and a set of group expressions that you specify. The set of group expressions can be a single dataset field reference or a combination of multiple expressions. At runtime, group expressions are combined, if the group has multiple expressions, and applied to data in a group. For example, you have a group that uses a date field to organize the data in the data region. At run time, data is organized by date, and then displayed with totals other dataset values for each date.  
  
## When do I create groups?  
 In most cases, Report Builder automatically creates a group for you when you design a data region. For a table, matrix, or list, groups are created when you drop fields on the Grouping pane. For a chart, groups are created when you drop fields on the chart drop-zones. For a gauge, you must use the gauge properties dialog box. For a table, matrix, or list, you can also create a group manually. For more information, see [Add or delete a group in a data region (Power BI Report Builder)](add-delete-group-data-region-report-builder.md). 
 
 For example of how to add groups when you create a report, see these tutorials: 
 
- [Tutorial: Creating a basic table report (Power BI Report Builder)](/sql/reporting-services/tutorial-creating-a-basic-table-report-report-builder)
- [Create a basic table report (SSRS Tutorial)](/sql/reporting-services/create-a-basic-table-report-ssrs-tutorial) 
  
## How can I modify a group?  
 After you create a group, you can set data region-specific properties, such as filter and sort expressions, page breaks, and group variables to hold scope-specific data. For more information, see [Filter, group, and sort data (Power BI Report Builder)](filter-group-sort-data-report-builder.md).  
  
 To modify an existing group, open the appropriate group properties dialog box. You can change the name of the group. Also, you can specify group expressions based on a single field or multiple fields, or on a report parameter that specifies a value at run time. You can also base a group on a set of expressions, such as the set of expressions that specify age ranges for demographic data. For more information, see [Group expression examples (Power BI Report Builder)](../expressions/group-expression-examples-report-builder.md).  
  
> [!NOTE]  
>  If you change the name of a group, you must manually update any group expressions that refer to the previous name of the group.  
  
## How are groups organized?  
 Understanding group organization can help you design data regions that display different views of the same data by specifying identical group expressions.  
  
 Groups are internally organized as members of one or more hierarchies for each data region. A group hierarchy has parent/child groups that are nested and can have adjacent groups.  
  
 If you think of the parent/child groups as a tree structure, each group hierarchy is forest of tree structures. A tablix data region includes a row group hierarchy and a column group hierarchy. Data associated with row group members expands horizontally across the page and data associated with column group members expands vertically down the page. The Grouping pane displays row group and column group members for the currently selected tablix data region on the design surface. For more information, see [Grouping pane (Power BI Report Builder)](grouping-pane-report-builder.md).  
  
 A chart data region includes a category group hierarchy and a series group hierarchy. Category group members are displayed on the category axis and series group members are displayed on the series axis.  
  
 Although typically not needed for gauge data regions, groups do let you specify how to group data to aggregate on the gauge.  
  
## What types of groups are available per data region?  
 Data regions that expand as a grid support different groups than data regions that display summary data visually. Thus, a tablix data region, and the tables, lists, and matrices that are based on the tablix data region, support different groups than a chart or gauge. The following sections discuss the type of and purpose for grouping in each type of data region.  
  
> [!NOTE]  
>  Although groups have different names in different data regions, the principles behind how you create and use groups are the same. When you create a group for a data region, you specify a way to organize the detail data from the dataset that is linked to the data region. Each data region supports a group structure on which to display grouped data.  
  
### Groups in a tablix data region: details, row, and column groups  
 As shown earlier in this topic, a tablix data region enables you to organize data into groups by rows or columns. However, row and column groups are not the only groups available in a tablix data region. This data region can have the following types of groups:  
  
- **Details Group** The Details group consists of all data from a report dataset after Report Builder applies dataset and data region filters. Thus, the Details group is the only group that has no group expression.  
  
     Basically, the details group specifies the data that you would see when you run a dataset query in a query designer. For example, you have a query that retrieves all columns from a sales order table. Thus, the data in this detail group includes all the values for every row for all the columns in the table. The data in this detail group also includes values for any calculated dataset fields that you have created.  
  
    > [!NOTE]  
    >  The data in a Detail group can also include server aggregates, which are aggregates that are calculated on the data source and retrieved in your query. By default, Report Builder treats server aggregates as detail data unless your report includes an expression that uses the Aggregate function. For more information, see [Aggregate function](/sql/reporting-services/report-design/report-builder-functions-aggregate-function).  
     By default, when you add a table or list to your report, Report Builder automatically creates the Details group for you, and adds a row to display the detail data. By default, when you add dataset fields to cells in this row, you see simple expressions for the fields, for example, [Sales]. When you view the data region, the details row repeats once for every value in the result set.  
  
- **Row groups and column groups** You can organize data into groups by rows or columns. Row groups expand vertically on a page. Column groups expand horizontally on a page. Groups can be nested, for example, group first by [Year], then by [Quarter], then by [Month]. Groups can also be adjacent, for example, group on [Territory] and independently on [ProductCategory].  
  
     When you create a group for a data region, Report Builder automatically adds rows or columns to the data region and use these rows or columns to display group data.  
  
- **Recursive hierarchy groups** A recursive hierarchy group organizes data from a single report dataset that includes multiple levels. For example, a recursive hierarchy group could display an organization hierarchy, for example, [Employee] that reports to [Employee]. Power BI provides group properties and built-in functions to enable you to create groups for this kind of report data. For more information, see [Creating recursive hierarchy groups (Power BI Report Builder)](/sql/reporting-services/report-design/creating-recursive-hierarchy-groups-report-builder-and-ssrs).  
  
 The following list summarizes the way you work with groups for each data region:  
  
- **Table** Define nested row groups, adjacent row groups, and recursive hierarchy row groups (such as for an organizational chart). By default, a table includes a details group. Add groups by dragging dataset fields to the Grouping pane for a selected table.  
  
- **Matrix** Define nested row and column groups, and adjacent row and column groups. Add groups by dragging dataset fields to the Grouping pane for a selected matrix.  
  
- **List** By default, it supports the details group. Typical use is to support one level of grouping. Add groups by dragging dataset fields to the Grouping pane for a selected list.  
  
 After you add a group, the row and column handles of the data region change to reflect group membership. When you delete a group, you have the choice between deleting the group definition only or deleting the group and all its associated rows and columns. For more information, see [Tablix data region cells, rows, and columns (Power BI Report Builder)](/sql/reporting-services/report-design/tablix-data-region-cells-rows-and-columns-report-builder-and-ssrs).  
  
 To limit the data to display or use in calculations for detail or group data, set filters on the group. For more information, see [Add dataset filters, data region filters, and group filters (Power BI Report Builder)](/sql/reporting-services/report-design/add-dataset-filters-data-region-filters-and-group-filters).  
  
 By default, when you create a group, the sort expression for the group is the same as the group expression. To change the sort order, change the sort expression. For more information, see [Filter, group, and sort data (Power BI Report Builder)](filter-group-sort-data-report-builder.md).  
  
### Understand group membership for tablix cells  
 Cells in a row or column of a tablix data region can belong to multiple row and column groups. When you define an expression in the text box of a cell that uses an aggregate function (for example, `=Sum(Fields!FieldName.Value`), the default group scope for a cell is the inner most child group to which it belongs. When a cell belongs to both row and column groups, the scope is both innermost groups. You can also write expressions that calculate aggregate subtotals scoped to a group relative to another set of data. For example, you can calculate the percent of a group relative to the column group or to all data for the data region (such as `=Sum(Fields!FieldName.Value)/Sum(Fields!FieldName.Value,"ColumnGroup")`). For more information, see [Tablix data region (Power BI Report Builder)](../../paginated-reports/report-builder-tables-matrices-lists.md) and [Expression scope for totals, aggregates, and built-in collections (Power BI Report Builder)](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections).  
  
## Related content

- [Add or delete a group in a data region (Power BI Report Builder)](add-delete-group-data-region-report-builder.md)   
- [Add a total to a group or tablix data region (Power BI Report Builder)](/sql/reporting-services/report-design/add-a-total-to-a-group-or-tablix-data-region-report-builder-and-ssrs)   
- [Sort data in a data region (Power BI Report Builder)](sort-data-data-region-report-builder.md)   
- [Drilldown action (Power BI Report Builder)](/sql/reporting-services/report-design/drilldown-action-report-builder-and-ssrs)   
- [Tables, Matrices, and Lists (Power BI Report Builder)](../report-builder-tables-matrices-lists.md)  
  
  
