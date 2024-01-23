---
title: "Page layout and rendering in Power BI paginated reports"
description: Design or improve your paginated reports with rendering extensions for page layout, page breaks, and paper size in Power BI Report Builder.
ms.date: 04/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---

# Page layout and rendering in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

This article explains Power BI Report Builder rendering extensions for paginated reports, so you're sure your report looks the way you want, including page layout, page breaks, and paper size. 

 When you view reports in on the service at https://powerbi.com or the preview pane of Report Builder, the report is first rendered by the default renderer. You can export the report to different formats, such as Excel or comma-delimited (CSV) files. You can then use the exported report for further analysis in Excel or as a data source for applications that can import and use CSV files.  
  
 Report Builder includes a set of renderers for exporting reports to different formats. Each renderer applies rules when rendering reports. When you export a report to a different file format, especially for renderers such as the Adobe Acrobat (PDF) renderer that uses pagination based on the physical page size, you might need to change the layout of your report to have the exported report look and print correctly after the rendering rules are applied.  
  
 Getting the best results for exported reports is often an iterative process. You author and preview the report in Report Builder or Report Designer, export the report to the preferred format, review the exported report, and then make changes to the report.  

##  <a name="PageLayout"></a> Report items

Report items are layout elements that are associated with different types of report data. 
 
* Table, matrix, list, chart, and gauge are data region report items that each link to a report dataset. When the report is processed, the data region expands across and down the report page to display data. 

Other report items link to and display a single item. 

* An **Image** report item links to a picture. 
* A **Text Box** report item contains either simple text like a title or an expression that can include references to built-in fields, report parameters, or dataset fields. 
* The **Line** and **Rectangle** report items provide simple graphical elements on the report page. The **Rectangle** can also be a container for other report items. 

A report can also contain subreports.  
  
## Page layout

 With Report Builder, you can place report items anywhere on the design surface. You can interactively position, expand, and contract the initial shape of the report item using snap lines and resizing handles. You can place data regions with different sets of data, or even the same data in different formats, side-by-side. When you place a report item on the design surface, it has a default size and shape and an initial relationship to all other report items. 
 
 You can place report items inside other report items to create more complex report designs. For example, charts or images in table cells, tables in table cells, and multiple images in a rectangle. In addition to providing the organization and look you want in the report, placing report items in containers such as rectangles help control the way the report items are displayed on the report page.  
  
 A report can span multiple pages, with a page header and page footer that are repeated on each page. A report can contain graphical elements such as images and lines, and it can have multiple fonts, colors, and styles, which can be based on expressions.  
  
##  <a name="ReportSections"></a> Report sections

 A report consists of three main sections: an optional *page* header, an optional *page* footer, and a report body. The *report* header and footer are not separate sections of the report, but rather comprise the report items that are placed at the top and bottom of the report body. The page header and page footer repeat the same content at the top and bottom of each page of the report. You can place images, text boxes, and lines in headers and footers. You can place all types of report items in the report body.  
  
 You can set properties on report items to initially hide or show them on the page. You can set visibility properties on rows or columns or groups for data regions and provide toggle buttons to allow the user to interactively show or hide report data. You can set visibility or initial visibility by using expressions, including expressions based on report parameters.  
  
 When a report is processed, report data is combined with the report layout elements and the combined data is sent to a report renderer. The renderer follows predefined rules for report item expansion and determines how much data fits on each page. To design an easy-to-read report that is optimized for the renderer that you plan to use, you should understand the rules used to control pagination in Report Builder. For more information, see [Pagination in Reporting Services &#40;Report Builder  and SSRS&#41;](/sql/reporting-services/report-design/pagination-in-reporting-services-report-builder-and-ssrs).  
  
##  <a name="RenderingExtensions"></a> Renderers  

 Reporting Services includes a set of renderers, also referred to as rendering extensions, that you can use to export reports to different formats. There are three types of renderers:  
  
* **Data renderers** Data renderers strip all formatting and layout information from the report and display only the data. The resulting file can be used to import the raw report data into another file type, such as Excel, or another database, an XML data message, or a custom application. The available data renders are CSV and XML.   
  
* **Soft page-break renderers** Soft page-break renderers maintain the report layout and formatting. The resulting file is optimized for screen-based viewing and delivery, such as on a Web page. The available soft page-break renderers are Microsoft Excel, Microsoft Word, Web archive (MHTML), and HTML.  
  
* **Hard page-break renderers** Hard page-break renderers maintain the report layout and formatting. The resulting file is optimized for a consistent printing experience, or for viewing the report online in a book format. The available hard page-break renderers are IMAGE, Microsoft PowerPoint, PDF and Accessible PDF.  
  
 When you preview a report in Power BI Report Builder or run a report on Power BI service, the report is first rendered in their respective default renderers. After you run the report, you can export it to different file formats. For more information, see [Export Reports &#40;Power BI Report Builder and service&#41;](../report-builder/export-reports-report-builder.md).
  
##  <a name="RenderingBehaviors"></a> Rendering behaviors  

 Depending on the renderer you select, certain rules are applied when rendering the report. How report items fit together on a page is determined by the combination of these factors:  
  
* Rendering rules.  
* The width and height of report items.  
* The size of the report body.  
* The width and height of the page.  
* Renderer-specific support for paging.  
  
 For example, reports rendered to HTML and MHTML formats are optimized for a computer screen-based experience where pages can be various lengths.  
  
 For more information, see [Rendering behaviors in a paginated report (Power BI Report Builder)](render-behaviors-report-builder-service.md).  

##  <a name="Pagination"></a> Pagination  

 Pagination refers to the number of pages within a report and how report items are arranged on these pages. Pagination in Report Builder varies depending on the rendering extension you use to view and deliver the report and the page break and keep-together options you configure the report to use.  
  
 To successfully design an easy-to-read report for your users that is optimized for the renderer that you plan to use to deliver your report, you need to understand the rules used to control pagination in Report Builder. Reports exported by using the **data** and **soft page** rendering extensions are typically not affected by pagination. When you use a data rendering extension the report is rendered as tabular rowset in an XML or CSV format. To ensure the exported report data is usable, you should understand the rules applied to render a flattened tabular rowset from a report.  
  
 When you use a **soft page** rendering extension such as the HTML rendering extension, you might want to know how the report looks printed and also how well it renders using a hard page renderer such as PDF. During the creation or updating of a report you can preview and export it in Report Builder and Report Designer.  
  
 **Hard page** renderers have the most impact on report layout and physical page size. To learn more, see [Pagination in Reporting Services &#40;Report Builder  and SSRS&#41;](/sql/reporting-services/report-design/pagination-in-reporting-services-report-builder-and-ssrs).  

##  <a name="HowTo"></a> How-to topics

 This section lists procedures that show you, step by step, how to work with pagination in reports.  
  
* [Add a page break &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/add-a-page-break-report-builder-and-ssrs)  
  
* [Display row and column headers on multiple pages &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/display-row-and-column-headers-on-multiple-pages-report-builder-and-ssrs)  
  
* [Add or remove a page header or footer &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/add-or-remove-a-page-header-or-footer-report-builder-and-ssrs)  
  
* [Keep headers visible when scrolling through a report &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/keep-headers-visible-when-scrolling-through-a-report-report-builder-and-ssrs)  
  
* [Display page numbers or other report properties &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/display-page-numbers-or-other-report-properties-report-builder-and-ssrs)  
  
* [Hide a page header or footer on the first or last page &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/hide-a-page-header-or-footer-on-the-first-or-last-page-report-builder-and-ssrs)  
  
##  <a name="InThisSection"></a> In this section  

 The following topics provide additional information about page layout and rendering.  
  
 [Page headers and footers &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/page-headers-and-footers-report-builder-and-ssrs)  
 Provides information about using headers and footers in reports and how to control pagination using them.  
  
 [Controlling page breaks, headings, columns, and rows &#40;Report Builder)](control-page-breaks-headings-columns-rows-report-builder.md)  
 Provides information about using page breaks.  
  
## Related content

- [Interactive functionality for different report rendering extensions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-builder/interactive-functionality-different-report-rendering-extensions)

