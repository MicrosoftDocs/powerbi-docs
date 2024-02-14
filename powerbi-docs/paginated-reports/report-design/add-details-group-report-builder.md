---
title: "Add a details group to a Power BI paginated report | Microsoft Docs"
description: Find out about adding a details group to an existing tablix data region to display the detail data for a matrix in Power BI Report Builder.
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add a details group to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In a paginated report, the detail data from a report dataset is specified as a group with no group expression. Add a detail group to an existing tablix data region when you want to display the detail data for a matrix, add back detail data that you have deleted from a table or list, or add additional detail groups. For more information about groups, see [Understanding Groups (Power BI Report Builder)](../../paginated-reports/report-design/understand-groups-report-builder.md).  
  
## Add a details group to a tablix data region  
  
1.  On the design surface, select anywhere in a tablix data region to select it. The Grouping pane displays the row and column groups for the selected data region.  
  
1.  In the Grouping pane, right-click a group that is an innermost child group. Select **Add Group**, and then select **Child Group**. The **Tablix Group** dialog box opens.  
  
1.  In **Group expression**, leave the expression blank. A details group has no expression.  
  
1.  Select **Show detail data**.  
  
1.  Select **OK**.
  
     A new details group is added as a child group in the Grouping pane, and the row handle for the group you selected in step 1 displays the details group icon. For more information about handles, see [Tablix Data Region (Power BI Report Builder)](../../paginated-reports/report-design/render-data-regions-report-builder-service.md).  
  
## Related content

- [Add or Delete a Group in a Data Region (Power BI Report Builder)](../../paginated-reports/report-design/add-delete-group-data-region-report-builder.md)   
- [Understanding Groups (Power BI Report Builder)](../../paginated-reports/report-design/understand-groups-report-builder.md)   
- [Tablix Data Region (Power BI Report Builder)](../../paginated-reports/report-design/render-data-regions-report-builder-service.md)   
- [Tables, Matrices, and Lists (Power BI Report Builder)](../../paginated-reports/report-builder-tables-matrices-lists.md)  
  
  
