---
title: "Control the tablix data region display on a Power BI paginated report page | Microsoft Docs"
description: Learn about the properties that enable you to change how a Power BI paginated report appears when you view a table, matrix, or list data region in Power BI Report Builder. 
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Control the tablix data region display on a paginated report page (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

Read about properties you can set in a paginated report for a table, matrix, or list data region, to change how it appears when you view the report.  
   
## Control the appearance of data  
Table, matrix, and list data regions are all examples of *tablix* data regions. The following features help control the appearance of a tablix data region:  
  
-   **Format data.** To format data in a table, matrix, or list, set the format properties of the text box in the cell. You can set properties for multiple cells at the same time. To format data in a chart, set formatting properties on the series. For more information, see [Formatting a Chart &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/formatting-chart-report-builder.md).  
  
-   **Write expressions**. For more information, see [Expression Uses in Reports &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/expression-uses-reports-report-builder.md), and [Expression Examples &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/report-builder-expression-examples.md).  
  
-   **Control sort order**. To control the sort order, you define sort expressions on the data region. To control sort order for rows and columns associated with a group, you define sort expressions on the group, including the details groups. You can also add interactive sort buttons to enable the user to sort a tablix data region or its groups. For more information, see [Sort Data in a Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/sort-data-data-region-report-builder.md).  
  
-   **Display a message when there is no data**. When no data exists for a report dataset at run time, you can write your own message to display in place of the data region. For more information, see [Set a No Data Message for a Data Region &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-data/set-a-no-data-message-for-a-data-region-report-builder-and-ssrs).  
  
-   **Conditionally hide data**. To conditionally control whether to show or hide a data region or parts of a data region, you can set the Hidden property to **True** or to an expression. Expressions can include references to report parameters. You can also specify a toggle item, so that user can decide to display detail data. For more information, see [Drilldown Action &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/drilldown-action-report-builder.md).  
  
-   **Merge cells.** Multiple contiguous cells within a table can be combined into a single cell. This is known as a column span or a cell merge. Cells can only be combined horizontally or vertically. When you merge cells, only the data in the first cell is preserved. Data in other cells is removed. Merged cells can be split into their original columns. For more information, see [Merge Cells in a Data Region &#40;Power BI Report Builder&#41;](merge-cells-data-region-report-builder.md).  
  
## Control tablix data region position and expansion on a page  
 The following features help control the way a tablix data region displays in a rendered report:  
  
-   **Control the position of a tablix data region in relation to other report items**. A tablix data region can be positioned above, next to, or below other report items on the report design surface. At run time, Report Builder expands the tablix data region as needed for the data retrieved for the linked dataset, moving peer report items aside as needed. To anchor a tablix next to another report item, make the report items peers and adjust their relative positions. For more information, see [Rendering Behaviors &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-behaviors-report-builder-service.md).  
  
-   **Change the expansion direction**. To control whether a tablix data region expands across the page from left-to-right (LTR) or from right-to-left (RTL), use the Direction property, which can be accessed through the Properties window. For more information, see [Rendering Data Regions &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-data-regions-report-builder-service.md).  
  
## Control how a tablix data region renders on a page  
 The following list describes ways that you can help control how a tablix data region appears in a report:  
  
-   **Control paging**. To control the amount of data that displays on each report page, you can set page breaks on data regions. You can also set page breaks on groups. Page breaks can affect the on-demand rendering performance by reducing the amount of data that needs to be processed on each page. For more information, see [Pagination in Reporting Services &#40;Power BI Report Builder&#41;](../../paginated-reports/paginated-reports-pagination.md) and [Add a Page Break &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/add-page-break-report-builder.md).  
  
-   **Display data on either side of row headers**. You are not limited to displaying row headers on the side of a tablix data region. You can move the row headers between columns, so that columns of data appear before the row headers. To do this, modify the GroupsBeforeRowHeaders property for the matrix. You can access this property through the Properties window. The value for this property is an integer; for example, a value of 2 will display two groups instances of data region column data before displaying the column containing the row headers.  
  
## Control how tablix row and column groups render  
 To control how a tablix data region groups render depends on the group structure. A tablix data region can have four areas, as shown in the following figure:  
  
 ![Screenshot of a Tablix data region areas.](media/tablix-areas.gif "Screenshot of a Tablix data region areas.")  
  
 The row group area and column group area contain group headers. When a tablix data region has group headers, you control how rows and columns repeat by setting properties on the **General** page of the **Tablix Properties** dialog Box.  
  
 If a tablix data region has only a tablix body area, there are no group headers. There are only static and dynamic tablix members. A static member displays once in relation to a tablix row or column group. A dynamic member repeats once for every unique group value. For example, in a tablix data region that displays a sales order, the column names in the sales order can be displayed on a static row member. Each line in the sales order is displayed on a dynamic row member.  
  
 You can help control how a tablix member renders by setting properties in the Properties pane. For more information, see "Advanced mode" in [Grouping Pane &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/grouping-pane-report-builder.md).  
  
 The following list describes ways that you can help control how a tablix data region appears in a report:  
  
-   **Repeat row and column headers on multiple pages**.You can display row and column headers on each page that a tablix data region spans. For more information, see [Display Row and Column Headers on Multiple Pages &#40;Power BI Report Builder&#41;](display-row-column-headers-multiple-pages-report-builder.md).  
  
-   **Keep row and column headers in view when scrolling**. You can control whether to keep the row and column headers in view when you scroll a report using a browser. For more information, see [Keep Headers Visible When Scrolling Through a Report &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/keep-headers-visible-when-scrolling-through-report-report-builder-service.md).  
  
 For more information about how exporting a report to different formats affects the way a tablix data region renders on a page, see [Rendering Behaviors &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-behaviors-report-builder-service.md).  
  
## Related content

- [Link Multiple Data Regions to the Same Dataset &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/linking-multiple-data-regions-to-same-dataset-report-builder.md)   
- [Nested Data Regions &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/nested-data-regions-report-builder.md)   
- [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/expression-scope-for-totals-aggregates-and-built-in-collections.md)   
- [Control Page Breaks, Headings, Columns, and Rows &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/control-page-breaks-headings-columns-rows-report-builder.md)   
- [Tablix Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-data-regions-report-builder-service.md)   
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)  
  
  
