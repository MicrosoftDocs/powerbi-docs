---
title: "Insert or delete a column in a Power BI paginated report | Microsoft Docs"
description: Add or delete columns in a tablix data region in a Power BI paginated report. In Power BI Report Builder, the tablix data region can be a table, a matrix, or a list.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Insert or delete a column in a Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  You can add or delete columns in a tablix data region in a paginated report. The tablix data region can be a table, a matrix, or a list. The following procedures do not apply to the chart and gauge data regions.  
  
 In a tablix data region, you can add columns that are associated with a group (inside a group) or that are not associated with a group (outside a group). A column that is inside a group repeats once per unique group value. For example, a column inside a group based the value in a data column that contains color names, repeats once per distinct color name. For nested groups, a column can be outside the child group but inside the parent group. In this case, the row repeats once for each unique value in the parent group.  
  
  
## Select a data region so that the row and column handles appear  
  
-   In Design view, select the upper left corner of the tablix data region, so that column and row handles appear above and next to it.  
  
     For more information about data region areas, see [Tables, matrices, and lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md) .  
  
## Insert a column in a selected data region  
  
-   Right-click a column handle where you want to insert a column, select **Insert Column**, and then select **Left** or **Right**.  
  
     -- or --  
  
-   Right-click a cell in the data region where you want to insert a row, select **Insert Column**, and then select **Left** or **Right**.  
  
## Delete a column from a selected data region  
  
-   Select the column or columns that you want to delete, right-click the handle for one of the columns you selected, and then select **Delete Columns**.  
  
     -- or --  
  
-   Right-click a cell in the data region where you want to delete a column, and then select **Delete Columns**.  
  
## Insert a column in a group in a selected data region  
  
-   Right-click a column group cell in the column group area of a tablix data region where you want to insert a column, select **Insert Column**, and then select **Left - Outside Group**, **Left - Inside Group**, **Right - Inside Group**, or **Right - Outside Group**.  
  
     A column is added either inside or outside the group represented by the column group cell you selected.  
  
## Delete a column from a group in a selected data region  
  
-   Right-click a column group cell in the column group area of a tablix data region where you want to delete a column, and then select **Delete Columns**.  
  
## Related content

- [Understanding groups &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/understand-groups-report-builder.md)   
- [Tablix data region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)   
- [Tables &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/tables-report-builder-and-ssrs)   
- [Matrices &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/create-a-matrix-report-builder-and-ssrs)   
- [Lists &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/create-invoices-and-forms-with-lists-report-builder-and-ssrs)   
- [Tables, matrices, and lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)   
  
  
