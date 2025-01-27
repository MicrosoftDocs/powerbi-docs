---
title: "Tables, matrixes, and lists in Power BI Report Builder"
description: Learn how to use tables, matrixes, and lists in Power BI Report Builder to display paginated report data in cells organized into rows and columns.
author: kfollis
ms.author: kfollis
ms.date: 01/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.assetid: 9dcf3fc8-bf9c-4a14-a03d-e78254aa4098
---
# Tables, matrixes, and lists in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

In Report Builder, tables, matrixes, and lists are *data regions* that display paginated report data in cells that are organized into rows and columns. The cells typically contain data such as text, dates, and numbers but they can also contain gauges, charts, or report items such as images. Collectively, tables, matrixes, and lists are frequently referred to as *tablix* data regions.  
  
The following picture shows simple reports with a table, matrix, or list.  

![Screenshot of Report Builder table, matrix, and list reports.](media/report-builder-tables-matrices-lists/report-builder-table-matrix-list.png)
  
The table, matrix, and list templates are built on the tablix data region, which is a flexible grid that can display data in cells. In the table and matrix templates, cells are organized into rows and columns. Because templates are variations of the underlying generic tablix data region, you can display data in combination of template formats and change the table, matrix, or list to include the features of another data region as you develop your report. For example, if you add a table and find it doesn't serve your needs, you can add column groups to make the table a matrix.  
  
The table and matrix data regions can display complex data relationships by including nested tables, matrixes, lists, charts, and gauges. Tables and matrixes have a tabular layout and their data comes from a single dataset, built on a single data source. The key difference between tables and matrixes is that tables can include only row groups, while matrixes have row groups and column groups.  
  
Lists are a little different. They support a free-form layout that and can include multiple peer tables or matrixes, each using data from a different dataset. Lists can also be used for forms, such as invoices.  
  
##  <a name="Table"></a> Tables  
Use a table to display detail data, organize the data in row groups, or both. The table template contains three columns with a table header row and a details row for data. The following figure shows the initial table template, selected on the design surface:  

![Screenshot of table template on the design surface.](media/report-builder-tables-matrices-lists/report-builder-new-table.png)
  
You can group data by a single field, by multiple fields, or by writing your own expression. You can create nested groups or independent, adjacent groups and display aggregated values for grouped data, or add totals to groups. For example, if your table has a row group called **Category**, you can add a subtotal for each group as well as a grand total for the report. To improve the appearance of the table and highlight data you want to emphasize, you can merge cells and apply formatting to data and table headings.  
  
You can initially hide detail or grouped data, and include drilldown toggles to enable a user to interactively choose how much data to show.  
  
##  <a name="Matrix"></a> Matrixes  
Use a matrix to display aggregated data summaries, grouped in rows and columns, similar to a PivotTable or crosstab. The number of rows and columns for groups is determined by the number of unique values for each row and column groups. The following figure shows the initial matrix template, selected on the design surface:  

![Screenshot of new matrix added from Toolbox.](media/report-builder-tables-matrices-lists/report-builder-new-matrix.png)
 
You can group data by multiple fields or expressions in row and column groups. At run time, when the report data and data regions are combined, a matrix grows horizontally and vertically on the page as columns for column groups and rows for row groups are added. The matrix cells display aggregate values that are scoped to the intersection of the row and column groups to which the cell belongs. For example, if your matrix has a row group (Category) and two column groups (Territory and Year) that display the sum of sales, the report displays two cells with sums of sales for each value in the Category group. The scope of the cells at the two intersections are: Category and Territory, and Category and Year. The matrix can include nested and adjacent groups. Nested groups have a parent-child relationship and adjacent groups have a peer relationship. You can add subtotals for any and all levels of nested row and column groups within the matrix.  
  
To make the matrix data more readable and highlight the data you want to emphasize, you can merge cells or split horizontally and vertically and apply formatting to data and group headings.  
  
You can also include drilldown toggles that initially hide detail data; the user can then click the toggles to display more or less detail as needed.  
  
##  <a name="List"></a> Lists  
Use a list to create a free-form layout. You aren't limited to a grid layout, but can place fields freely inside the list. You can use a list to design a form for displaying many dataset fields or as a container to display multiple data regions side by side for grouped data. For example, you can define a group for a list; add a table, chart, and image; and display values in table and graphic form for each group value, as you might for an employee or patient record.  

![Screenshot of a blank free-form layout area for a list report.](media/report-builder-tables-matrices-lists/report-builder-new-list.png)
  
##  <a name="PreparingData"></a> Preparing data  
Table, matrix, and list data regions display data from a dataset. You can prepare the data in the query that retrieves the data for the dataset or by setting properties in the table, matrix, or list.  
  
Query languages such as Transact-SQL, which you can use to retrieve the data for the report datasets, can prepare the data by applying filters to include only a subset of the data, replacing null values or blanks with constants that make the report more readable, and sorting and grouping data.  
  
If you choose to prepare the data in the table, matrix, or list data region of a report, you set properties on the data region or cells within the data region. If you want to filter or sort the data, set the properties on the data region. For example, to sort the data you specify the columns to sort on and the sort direction. If you want to provide an alternative value for a field, set the values of the cell text that displays the field. For example, to display a blank when a field is empty or null, you use an expression to set the value.  
  
##  <a name="BuildingConfiguringTableMatrixList"></a> Building and configuring a table, matrix, or list  
When you add tables or matrixes to your report, you can use the *Table and Matrix Wizard* or build them manually from the templates that Report Builder provides. Lists are built manually from the list template.  

![Screenshot of table, matrix, and list buttons in Report Builder.](media/report-builder-tables-matrices-lists/report-builder-table-matrix.png)

The wizard guides you through the steps to quickly build and configure a table or matrix. After you complete the wizard or if you build the tablix data regions from scratch, you can further configure and refine them. The dialog boxes, available from the right-click menus on the data regions, make it easy to set the most commonly used properties for page breaks, repeatability and visibility of headers and footers, display options, filters, and sorting. But the tablix data region provides a wealth of additional properties, which you can set only in the Properties pane of Report Builder. For example, if you want to display a message when the dataset for a table, matrix, or list is empty, you specify the message text in the *NoRowsMessage* tablix property in the Properties pane.  
  
##  <a name="ChangingBetweenTablixTemplates"></a> Changing between tablix templates  
You aren't limited by your initial tablix template choice. As you add groups, totals, and labels, you might want to modify your tablix design. For example, you might start with a table and then delete the details row and add column groups.  
  
You can continue to develop a table, matrix, or list by adding any tablix feature. Tablix features include displaying detail data or aggregates for grouped data on rows and columns. You can create nested groups, independent adjacent groups, or recursive groups. You can filter and sort grouped data, and easily combine groups by including multiple group expressions in a group definition  
  
You can also add totals for a group or grand totals for the data region. You can hide rows or columns to simplify a report and allow the user to toggle the display of the hidden data, as in a drilldown report. 

## Related content

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
