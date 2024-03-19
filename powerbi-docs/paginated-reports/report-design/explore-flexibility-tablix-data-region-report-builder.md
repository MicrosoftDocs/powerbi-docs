---
title: "Explore the flexibility of a tablix data region in a Power BI paginated report | Microsoft Docs"
description: Discover the flexibility of a Power BI paginated report in Power BI Report Builder when you add a table, matrix, or list data region.
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Explore the flexibility of a tablix data region in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In a paginated report, when you add a table, matrix, or list data region from the Insert tab on the ribbon, you start with an initial template for a tablix data region. But you are not limited by that template. You can continue to develop how your data displays by adding or removing any tablix data region feature such as  groups, rows, and columns.  
  
 When you delete a row or column group, you have the option of deleting the rows and columns that are used to display group values. You can also add or remove rows and columns manually. To understand how rows and columns are used to display detail and group data, see [Tablix Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-data-regions-report-builder-service.md).  
  
 After you change the structure of the tablix data region, you can set properties to help control the way the report renders the data region; for example, you can repeat column headers at the top of every page, or keep a group header with the group. For more information, see [Control the Tablix Data Region Display on a Report Page &#40;Power BI Report Builder&#41;](control-tablix-data-region-display-report-page.md).  
  
  
## Change a table to a matrix  
 By default, a table has detail rows that display the values from the report dataset. Typically, a table includes row groups that organize the detail data by group, and then includes aggregated values based on each group. To change the table to a matrix, add column groups. Typically, you would remove the details group when the data region has both row and column groups so that you can display only the summary values for the groups. For more information, see [Add or Delete a Group in a Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/add-delete-group-data-region-report-builder.md).  
  
 By definition, when you create a matrix, you add a tablix corner cell. You can merge cells in this area and add a label. For more information, see [Merge Cells in a Data Region &#40;Power BI Report Builder&#41;](merge-cells-data-region-report-builder.md).  
  
## Change a matrix to a table  
 By default, a matrix has row groups and column groups and no detail group. To change a matrix to a table, remove column groups and add a details group to display on the details row. For more information, see [Add or Delete a Group in a Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/add-delete-group-data-region-report-builder.md) and [Add a Details Group &#40;Power BI Report Builder&#41;](add-details-group-report-builder.md).  
  
## Change a default list to a grouped list  
 By default, a list has detail rows and no groups. To change the list to use a group row, rename the details group and specify a group expression. For more information, see [Add or Delete a Group in a Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/add-delete-group-data-region-report-builder.md)  
  
## Create stepped displays  
 By default, when you add groups to a tablix data region, cells in the row group header area display group values in column. When you have nested groups, each group displays in a separate column. To create a stepped display, remove all group columns except one, and format the remaining column to display the group hierarchy as an indented text display. For more information, see [Create a Stepped Report &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/create-stepped-report-report-builder.md).  
  
## Add an adjacent details group  
 By default, the details group is the innermost child group in a group hierarchy. You cannot nest a group under the details group. You can create additional adjacent details groups, to display the top 5 products and the bottom 5 products by sales, for example. Because you can add filter and sort expressions on each group, you can show two views of detail data from the same dataset in one tablix data region. For more information, see [Understanding Groups &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/understand-groups-report-builder.md), [Add or Delete a Group in a Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/add-delete-group-data-region-report-builder.md), and [Add a Filter to a Dataset &#40;Power BI Report Builder&#41;](../../paginated-reports/report-data/add-filter-to-dataset.md).  
  
## Related content

- [Tablix Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-data-regions-report-builder-service.md)   
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)  
  
  
