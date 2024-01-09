---
title: "Insert or delete a row in a Power BI paginated report | Microsoft Docs"
description: Find out about adding or deleting rows in a tablix data region in a Power BI paginated report in Power BI Report Builder.
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Insert or delete a row in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

You can add or delete rows in a tablix data region in a paginated report. The tablix data region can be a table, a matrix, or a list. The following procedures do not apply to the chart and gauge data regions.  
  
 In a tablix data region, you can add rows that are associated with a group (inside a group) or that are not associated with a group (outside a group). A row that is inside a group repeats once per unique group value. For example, a row inside a group based on the value in a data column that contains color names, repeats once per distinct color name. For nested groups, a row can be outside the child group but inside the parent group. In this case, the row repeats once for each unique value in the parent group.  
  
  
## Select a data region so the row and column handles appear  
  
-   In Design view, select the upper left corner of the tablix data region so that column and row handles appear above and next to it.  
  
     For more information about data region areas, see [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md).  
  
## Insert a row in a selected data region  
  
-   Right-click a row handle where you want to insert a row, select **Insert Row**, and then select **Above** or **Below**.  
  
     \- or -  
  
-   Right-click a cell in the data region where you want to insert a row, select **Insert Row**, and then select **Above** or **Below**.  
  
## Delete a row from a selected data region  
  
-   Select the row or rows that you want to delete, right-click the handle for one of the rows you selected, and then select **Delete Rows**.  
  
     \- or -  
  
-   Right-click a cell in the data region where you want to delete a row, and then select **Delete Rows**.  
  
## Insert a row in a group in a selected data region  
  
-   Right-click a row group cell in the row group area of a tablix data region where you want to insert a row, select **Insert Row**, and then select **Above - Outside Group**, **Above - Inside Group**, **Below - Inside Group**, or **Below - Outside Group**.  
  
     A row is added either inside or outside the group represented by the row group cell you selected.  
  
## Delete a row from a group in a selected data region  
  
-   Right-click a row group cell in the row group area of a tablix data region where you want to delete a row, and then select **Delete Rows**.  
  
## Related content

- [Tablix Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/render-data-regions-report-builder-service.md)   
- [Understand Groups &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/understand-groups-report-builder.md)   
- [Tables &#40;Power BI Report Builder&#41;](tables-report-builder.md)   
- [Matrices &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/create-a-matrix-report-builder-and-ssrs)   
- [Lists &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/create-invoices-and-forms-with-lists-report-builder-and-ssrs)     
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)  
  
  
