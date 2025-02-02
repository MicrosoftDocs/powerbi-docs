---
title: "Keep headers visible when scrolling through a paginated report"
description: Freeze the row or column headings to prevent row and column labels from scrolling out of view after rendering a paginated report in Power BI Report Builder. 
ms.date: 03/22/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---

# Keep headers visible when scrolling through a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

To prevent row and column labels from scrolling out of view after rendering a paginated report, you can freeze the row or column headings.  
  
 How you control the rows and columns depends on whether you have a table or a matrix. If you have a table, you configure static members (row and column headings) to remain visible. If you have a matrix, you configure row and column group headers to remain visible.  
  
 If you export the report to Excel, the header will not be frozen automatically. You can freeze the pane in Excel. For more information see the **Page Headers and Footers** section of [Exporting to Microsoft Excel &#40;Power BI Report Builder and service&#41;](../report-builder/export-microsoft-excel-report-builder.md).
  
> [!NOTE]  
> Even if a table has row and column groups, you cannot keep those group headers visible while scrolling  
  
 The following image shows a table.  
  
 ![Screenshot of a table.](media/paginated-reports-report-design-view/table.png "Table")  
  
 The following image shows a matrix.  
  
 ![Screenshot of a matrix.](media/paginated-reports-report-design-view/matrix.png "Matrix")  
  
  
## Keep matrix group headers visible while scrolling  
  
1. Right-click the row, column, or corner handle of a tablix data region, and then select **Tablix Properties**.  
  
1. On the **General** tab, under **Row Headers** or **Column Headers**, select **Header should remain visible while scrolling**.  
  
1. Select **OK**.
  
## Keep a static tablix member (row or column) visible while scrolling  
  
1. On the design surface, select anywhere in the table to display static members, as well as groups, in the grouping pane.  
  
     ![Screenshot showing Grouping pane.](media/paginated-reports-report-design-view/group-pane-updated.png "Grouping pane")  
  
     The Row Groups pane displays the hierarchical static and dynamic members for the row groups hierarchy, and the Column groups pane shows a similar display for the column groups hierarchy.  
  
1. On the right side of the grouping pane, select the down arrow, and then select **Advanced Mode**.  
  
1. Click the static member (row or column) that you want to remain visible while scrolling. The Properties pane displays the **Tablix Member** properties.  
  
     ![Screenshot showing Tablix member properties.](media/paginated-reports-report-design-view/group-pane-tablix-member-updated.png "Tablix Member properties")  
  
1. In the Properties pane, set **FixedData** to **True**.  
  
1. Repeat this for as many adjacent members as you want to keep visible while scrolling.  
  
1. Preview the report.  
  
 As you page down or across the report, the static tablix members remain in view.  
  
## Related content

- [Page headers and footers in a paginated report](page-headers-footers-report-builder-service.md)  
- [Tablix Data Region &#40;Report Builder)](../../paginated-reports/report-builder-tables-matrices-lists.md) 
- [Export Reports &#40;Report Builder and the Power BI service&#41;](../report-builder/export-reports-report-builder.md)
- [Display Headers and Footers with a Group &#40;Power BI Report Builder and service&#41;](display-headers-footers-with-group-report-builder-service.md)
- [Display Row and Column Headers on Multiple Pages &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/display-row-and-column-headers-on-multiple-pages-report-builder-and-ssrs)
- [Grouping Pane &#40;Report Builder&#41;](/sql/reporting-services/report-design/grouping-pane-report-builder)  
