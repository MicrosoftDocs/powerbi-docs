---
title: "Add a total to a group or tablix in a Power BI paginated report | Microsoft Docs"
description: Add totals in a tablix data region of a paginated report in Report Builder for a group or for the entire data region. 
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add a total to a group or tablix in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

 In a paginated report, you can add totals in a tablix data region for a group or for the entire data region. By default, a total is the sum of the numeric, non-null data in a group or in the data region, after filters are applied. To add totals for a group, select **Add Total** on the shortcut menu for the group in the Grouping pane. To add totals for an individual cell in the tablix body area, select **Add Total** on the shortcut menu for the cell. The **Add Total** command is context-sensitive and enabled only for numeric fields. Depending on the tablix cell that you select, you can add a total for a single cell by selecting a cell in the tablix body area or for the entire group by selecting a cell in the tablix row group area or the tablix column group area. For more information about tablix areas, see [Tablix Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-data-regions-report-builder-service.md).  
  
 After you add a total, you can change the default function Sum to a different aggregate function from the list of built-in report functions. For more information, see [Aggregate Functions Reference (Report Builder&#41;](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference). 
  
## Add a total for an individual value in the tablix body area  
  
-   In the tablix data region body area, right-click the cell where you want to add the total. The cell must contain a numeric field. Point to **Add Total**, and then select **Row** or **Column**.  
  
     A new row or column outside the current group is added to the data region, with a default total for the field in the cell you selected.  
  
     If the tablix data region is a table, a row is automatically added.  
  
## Add totals for a row group  
  
-   In the tablix data region row group area, right-click a cell in the row group area for which you want totals, point to **Add Total**, and then select **Before** or **After**.  
  
     A new row outside the current group is added to the data region, and then a default total is added for each numeric field in the row.  
  
## Add totals for a column group  
  
-   In the tablix data region row group area, right-click a cell in the column group area for which you want totals, then point to **Add Total**, and select **Before** or **After**.  
  
     A new column outside the current group is added to the data region, and then a default total is added for each numeric field in the column.  
  
## Related content

- [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/expression-scope-for-totals-aggregates-and-built-in-collections.md)   
- [Tablix Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-data-regions-report-builder-service.md)   
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)  
  
  
