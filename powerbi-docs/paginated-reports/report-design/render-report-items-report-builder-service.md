---
title: "Render report items in Power BI paginated reports"
description: Learn how paginated report items such as number, size, and locations affect rendering pagination in Power BI Report Builder.
ms.date: 04/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---
# Render report items in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

The number, size, and location of Power BI paginated report items affect how the renderers paginate the report body. The following sections describe how various report items are rendered.  

## Overlapping report items

Overlapping report items are supported in hard page-break formats, including print.  

However, overlapping report items are *not* supported in HTML, MHTML, Word, Excel, in Preview, or the Report Viewer. If overlapping items exist, they are moved. The following rules are applied to overlapping report items:  
  
* If the vertical overlap of report items is greater, one of the overlapping items is moved to the right. The left-most item remains where you position it.  
  
* If the horizontal overlap of report items is greater, one of the overlapping items is moved down. The top-most item remains where you position it.  
  
* If the vertical and horizontal overlap is equal, one of the overlapping items is moved to the right. The left-most item remains where you position it.  
  
* If an item must be moved to correct overlapping, adjacent report items move down and/or to the right to maintain a minimum amount of spacing between the item and the report items that end above it and/or to the left of it. For example, suppose two report items overlap vertically and a third report item is 2 inches to the right of them. When the overlapping report item is moved to the right, the third report item moves to the right as well in order to maintain the 2 inches between itself and the report item to its left.  

## Visibility and report items

 Report items can be hidden or displayed by default, or hidden or displayed conditionally using expressions. Optionally, the visibility can be switched by clicking another report item.  
  
 The following visibility rules apply when rendering report items:  
  
* Say you hide a report item and its contents, so it's not hidden based on an expression or clicking another report item can't switch its visibility. In that case, other report items to the right or below it don't move to fill the empty space. For example, if you hide a rectangle and the image that's contained within it, the report item that starts to the right of the rectangle doesn't move to the left to fill what appears to be empty space. The report preserves the space occupied by the rectangle.  
  
* If you hide a report item and its contents conditionally based on an expression, or its visibility switches by clicking another report item, then report items to the right or below it move to the left to fill in the space when the item is hidden.  
  
* If the visibility of a report item and its contents can be switched by clicking another report item, then pagination changes to accommodate the report item and its contents only when it's initially displayed.  
  
## Keep report items together on a single page  

 Many report items within a report can be kept together on a single page implicitly or explicitly by setting the keep with group or keep together properties. Report items are always rendered on the same page if the report item doesn't have any logical page breaks and is smaller in size than the usable page area. If a report item doesn't fit completely on the page on which it would usually start, a hard page break is inserted before the report item, forcing it to the next page. For soft page-break renderers, the page grows to accommodate the report item.  
  
 When the report item is always hidden, the rules for keeping items together are ignored.  
  
 The following items are always kept together:  
  
* Images.  
  
* Lines.  
  
* Charts, gauges, and maps.  
  
* A single row in a data region that appears separately on another page, by selecting the keep with group option. This option implicitly keeps the single row together with at least one instance of the group, so that the row is not orphaned. You can set this option on a data region or a group.  
  
* Header area of a data region.  
  
* Header area of a data region and the first row of data.  
  
* Report items that can be toggled in a tablix data region.  
  
### Priority order for keeping report items together

 Due to page size limitations, conflicts can arise between the rules for keeping report items together. When conflicts occur, the following priority order is used to keep items together when rendering:  
  
* Lines, charts, and images.  
  
* Widow and orphan control.  
  
* Repeated column headers and row headers.  
  
     Headers take precedence over footers. Inner repeated groups have priority over outer groups. Items that are closer to the target data region have priority over items that are farther away from the data region, when the **RepeatWith** property is set.  
  
* Small report items, such as text boxes or rectangles, with an explicit KeepTogether property set to **true**.  
  
* Large report items, such as subreports or a non-innermost tablix member, with an explicit KeepTogether property set to **true**.  
  
* Tablix data regions with an explicit KeepTogether property set to **true**.  
  
## Subreports

 A subreport renders as a rectangle that contains another report that's defined in a separate report .rdl file. For viewing reports on service, you must publish the subreport file to the service before the parent report can access it.  
  
 The following rules apply when rendering subreports:  
  
* Subreports can grow to the size of the body defined in the .rdl file that defines the subreport. For example, if the .rdl for the subreport states that the subreport body is 5 inches wide, then the subreport is 5 inches wide within the parent report.  
  
* Subreports inherit column settings from the parent report. Column settings that are defined in the original .rdl are always ignored.  
  
* Only the body of the subreport is rendered. Header and footer sections that are defined in the subreport's .rdl file are not rendered when the subreport is rendered in the parent report.  
  
* Subreports have an explicit KeepTogether property. When it's set to **true**, all the items in the subreport are kept together on one page when possible.  
  
* If a subreport can't run, it's displayed in the report as a text box with an error message. The style properties applied to the subreport are applied to the text box instead.  
  
* If the subreport is split by a page break, the **Omit border on page break** setting controls whether or not the borders on the subreport are closed or open.  
  
 For more information about subreports, see [Subreports in Power BI paginated reports](../subreports.md).  
  
## Related content 

* [Pagination in Reporting Services &#40;Report Builder  and SSRS&#41;](/sql/reporting-services/report-design/pagination-in-reporting-services-report-builder-and-ssrs)
* [Rendering behaviors in a paginated report (Power BI Report Builder)](render-behaviors-report-builder-service.md)
* [Interactive Functionality for Different Report Rendering Extensions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-builder/interactive-functionality-different-report-rendering-extensions)   
* [Tables, matrixes, and lists in Power BI Report Builder](../report-builder-tables-matrices-lists.md)
