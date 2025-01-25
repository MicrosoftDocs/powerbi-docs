---
title: "Add a page break to a Power BI paginated report | Microsoft Docs"
description: Discover how to add a page break to rectangles, data regions, or groups within data regions in Power BI Report Builder to control the information on each page.
ms.date: 06/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add a page break to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  You can add a page break to rectangles, data regions, or groups within data regions in Power BI paginated reports, to control the amount of information on each page. Adding page breaks can improve the performance of published reports because only the items on each page have to be processed as you view the report. When the whole report is a single page, all items must be processed before you can view the report.  
  
  
## Add a page break to a data region  
  
1. On the design surface, right-click the corner handle of the data region and then select **Tablix Properties**.  
  
1. On the **General** tab, under **Page break options**, select one of the following options:  
  
    - **Add a page break before**. Select this option when you want to add a page break before the table.  
  
    - **Add a page break after**. Select this option when you want to add a page break after the table.  
  
    - **Fit table on one page if possible**. Select this option when you want the data to stay on one page.  
  
## Add a page break to a rectangle  
  
1. On the design surface, right-click the rectangle where you want to add a page break, and then select **Rectangle Properties**.  
  
1. On the **General** tab, under **Page break options**, select one of the following options:  
  
    - **Add a page break before**. Select this option when you want to add a page break before the rectangle.  
  
    - **Add a page break after**. Select this option when you want to add a page break after the rectangle.  
  
    - **Omit border on page break**. Select this option when you do not want a border on the page break.  
  
    - **Keep contents together on a single page, if possible**. Select this option when you want contents inside the rectangle to stay on one page.  
  
## Add a page break to a row group in a table, matrix, or list  
  
1. In the Grouping pane, right-click a row group, and then select **Group Properties**.  
  
    > [!NOTE]  
    >  Page breaks are ignored on column groups.  
  
1. On the **Page Breaks** tab, select **Between each instance of a group** to add a page break between each instance of a group in the table.  
  
1. Optionally, select **Also at the start of a group** or **Also at the end of a group** to specify that a page break be added when a group starts or ends in the table.  
  
## Related content

- [Pagination in Power BI paginated reports](../paginated-reports-pagination.md)   
- [Rendering behaviors in a paginated report (Power BI Report Builder)](../report-design/render-behaviors-report-builder-service.md)   
- [Page headers and footers in a paginated report (Power BI Report Builder)](../report-design/page-headers-footers-report-builder-service.md)  
  
  
