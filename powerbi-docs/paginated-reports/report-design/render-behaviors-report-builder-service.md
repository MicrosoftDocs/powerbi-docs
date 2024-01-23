---
title: "Rendering behaviors in a Power BI paginated report"
description: Learn about the rules that are applied to the paginated report body and its contents when rendering a report in Power BI Report Builder.
ms.date: 04/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---
# Rendering behaviors in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

Depending on the renderer you select, certain rules are applied to the Power BI paginated report body and its contents when rendering a report. How report items fit together on a page is determined by the combination of these factors:  
  
* Rendering rules.  
* The width and height of report items.  
* The size of the report body.  
* The width and height of the page.  
* Renderer-specific support for paging.  
  
 This topic discusses the general rules that are applied by Power BI Report Builder. For more specific information, see these articles:

* [Rendering report items in paginated reports (Power BI Report Builder)](render-report-items-report-builder-service.md)
* [Rendering data regions in a paginated report (Power BI Report Builder)](render-data-regions-report-builder-service.md)
* [Rendering data in a paginated report (Power BI Report Builder)](render-data-report-builder-service.md)

## General behaviors for HTML, MHTML, Word, and Excel (soft page-break renderers)

 Reports exported using HTML and MHTML formats are optimized for a computer screen-based experience where pages can be various lengths. Page breaks are inserted vertically only at approximate locations within the report body. These approximate locations are determined by the interactive height setting in the Properties pane. For example, suppose the interactive height is set to 5 inches. When the report is rendered, the page height is approximately 5 inches in length. Word and Excel paginate based on logical page breaks and ignore the interactive height setting.  
  
> [!NOTE]  
> To determine how a report will appear in a soft page-break renderer, use Report Preview. The report appears as it would in a HTML, MHTML, Word, or Excel format.  
  
 When you export a report to HTML, MHTML, Word, or Excel, the following general rules are followed:  
  
* Logical page breaks, the page breaks that you explicitly insert, are applied to report items. For example, if you insert a page break between each group, they are applied when the report is rendered.  
  
* An approximate layout is created using the page height and the number of times that the report item appears. For example, if a text box is .5 inches in height and repeats five times in the report, 2.5 inches are reserved.  
  
* Multiple soft page breaks are inserted based on the interactive height setting. To suppress in HTML and the ReportViewer controls, and control pagination only with explicit page breaks, set the **interactive height** value to 0 or an extremely large number.  
  
    > [!NOTE]  
    > The interactive width setting is not used in the soft page break renderers.  
  
* Report pages can grow to accommodate widows, orphans and report items that need to be kept together. This means that the report can extend beyond the screen width and can be viewed by using slider bars.  
  
* Pagination is applied to reports vertically only.  
  
* Page margins are not applied.  
  
## General behaviors for PDF, image, and print (hard page-break renderers)

 Reports exported using PDF and Image are optimized for a book-like or printed experience where pages are a consistent size. Page breaks are inserted vertically and horizontally at specific locations within the report body. These specific locations are determined by the page width and page height settings.  
  
> [!NOTE]  
> To determine how a report will appear in a hard page-break renderer, use Print Preview. The report appears as it would in a PDF or Image format.  
  
* Pages are numbered sequentially from left to right, then top to bottom.  
  
* Logical page breaks, the page breaks that you explicitly insert, are applied to report items. These page breaks can cause report items to push other items to the next page.  
  
* If a physical page break occurs through report items that must be kept together, the items that must be kept together are moved to the next page.  
  
* Because of page size constraints, it may not be possible to keep all the items together or to repeat items. If that occurs, the renderer might ignore certain rules for repeating with another item in order to allow the report item to fit on the page.  
  
* If an item cannot be kept together, for example a text box that grows too large to fit within the vertical usable page area, then the item will be clipped at the physical page boundary and will continue on the next page.  
  
* Pagination is applied to reports vertically and horizontally.  
  
    > [!NOTE]  
    >  The interactive width setting is not used in the hard page break renderers.  
  
## Minimum spacing between report items

 Report items grow within the report body to accommodate their contents. For example, a matrix data region typically expands across and down the page when the report is rendered, and the height of a text box adjusts depending on the data returned from an expression.  
  
 Renderers maintain the minimum space between report items that you define in the report layout. When you place a report item adjacent to another on the report layout, the distance between the report items becomes the minimum distance that must be maintained as the report grows horizontally or vertically. For example, if you add a matrix data region to a report and then add a rectangle .25 inches to the right of the matrix, that space is maintained as the matrix grows. Each item moves to the right to maintain the minimum distance from items that end to the left of it.  
  
## Page headers and footers

 Page headers and footers appear at the top and bottom of each rendered page. You can format the page header and footer so that there is a border color, border style, and border width. You can also add a background color or background image. These formatting options are all rendered, depending on the format that you choose.  
  
 The following rules apply to page headers and footers when rendered in the HTML or MHTML rendering format:  
  
> [!NOTE]  
> For information about how Excel renders headers and footers, see [Exporting to Microsoft Excel &#40;Power BI Report Builder and service&#41;](../report-builder/export-microsoft-excel-report-builder.md). For information about how Word renders headers and footers, see [Exporting to Microsoft Word &#40;Power BI Report Builder and service&#41;](../report-builder/export-microsoft-word-report-builder.md).  
  
* When present, the header and footer is rendered at the top and bottom of every page within the usable page area.  
  
* On pages where the header or footer is hidden, the height of the header or footer is still reserved within the usable page area, even though the header or footer is not rendered.  
  
* If the contents of the header or footer grows beyond the boundaries of the header or footer, the header or footer increases in size to accommodate the contents.  
  
The following rules apply to page headers and footers when rendered in the PDF or Image rendering format:  
  
* The header or footer is rendered at the top and bottom of every page within the usable page area.  
  
* On pages where the header or footer is hidden, the height of the header or footer is still reserved within the usable page area, even though the header or footer is not rendered.  
  
* The header and footer do not grow or shrink. They are rendered on every page at the height specified when you created the header or footer.  
  
* Regardless of the number of columns within the report, there is only one header and footer per page.  
  
* If the contents of the header or footer grow beyond the boundaries of the header or footer, the contents are clipped.  
  
* Headers and footers that are defined in the original RDL file are not rendered when the report is rendered as a subreport.  
  
## Logical page breaks

 Logical page breaks are page breaks that you insert before or after report items or groups. Page breaks help to determine how the content is fitted to a report page for optimal viewing when rendering or exporting the report.  
  
 The following rules apply when rendering logical page breaks:  
  
* Logical page breaks are ignored for report items that are constantly hidden and for report items where the visibility is controlled by clicking another report item.  
  
* Logical page breaks are applied on conditionally visible items if they are currently visible at the time the report is rendered.  
  
* Space is preserved between the report item with the logical page break and its peer report items.  
  
* Logical page breaks that are inserted before a report item push the report item down to the next page. The report item is rendered at the top of the next page.  
  
* Logical page breaks defined on items in table or matrix cells are not kept. This does not apply to items in lists.  
  
## Related content

* [Interactive Functionality for Different Report Rendering Extensions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-builder/interactive-functionality-different-report-rendering-extensions)   
* [Page Layout and Rendering &#40;Report Builder and service&#41;](./page-layout-rendering-report-builder-service.md)  
  
  
