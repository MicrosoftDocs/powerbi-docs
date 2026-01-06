---
title: Control Page Breaks, Headings, Columns, and Rows in Power BI Paginated Reports
description: Optimize viewing and printing of your tables, lists, or images in paginated reports with choices for page lengths, columns, headings, and rows in Power BI Report Builder.
author: JulCsc
ms.author: juliacawthra
ms.date: 12/01/2025
ai-usage: ai-assisted
ms.service: powerbi
ms.subservice: report-builder
ms.topic: concept-article
ms.custom: updatefrequency5
ms.update-cycle: 1825-days
ms.reviewer: dniwenshuti
---
# Control page breaks, headings, columns, and rows in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

 A page break divides a Power BI paginated report into separate pages for viewing and printing purposes. Page breaks determine how the content fits within a page, specific to the export format chosen. Hard-paged formats such as PDF or Image will strictly fit or push content to pages. Logical-paged formats such as Excel, will determine a best fit between content size and the page. 
  
 Adding page breaks might also improve performance of large reports when they are processed. A rendered page is displayed while the rest of the pages are rendered in the background. This allows you to begin viewing the initial pages of the report while waiting for additional pages to become available.  
  
 Page breaks can be added to report items such as a table, matrix, list, chart, gauge, or image. You can also add page breaks to groups in a table, matrix, or list. Page breaks can be added before, after, and between groups. Page breaks between groups are not added to the report by default.  
  
 For more information, see [Display Row and Column Headers on Multiple Pages &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/display-row-and-column-headers-on-multiple-pages-report-builder-and-ssrs) and [Keep Headers Visible When Scrolling Through a Report &#40;Report Builder&#41;](keep-headers-visible-when-scrolling-through-report-report-builder-service.md).  
  
## Related content

- [Tables, Matrices, and Lists &#40;Report Builder&#41;](../report-builder-tables-matrices-lists.md)   
- [Controlling the Tablix Data Region Display on a Report Page &#40;Report Builder&#41;](/sql/reporting-services/report-design/controlling-the-tablix-data-region-display-on-a-report-page)   
- [Grouping Pane &#40;Report Builder&#41;](/sql/reporting-services/report-design/grouping-pane-report-builder)   
- [Display Headers and Footers with a Group &#40;Report Builder&#41;](/sql/reporting-services/report-design/display-headers-and-footers-with-a-group-report-builder-and-ssrs)  
