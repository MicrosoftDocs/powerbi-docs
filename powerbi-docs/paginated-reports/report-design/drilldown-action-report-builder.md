---
title: "Drilldown action in a Power BI paginated report"
description: Enable users with drilldown action in a paginated report to hide and display items interactively in Power BI Report Builder by providing plus and minus icons on a text box.
author: kfollis
ms.author: kfollis
ms.date: 04/10/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
---
# Drilldown action in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

By providing plus and minus icons on a text box, you can enable users in a Power BI paginated report to hide and display items interactively. This is called a *drilldown* action. For a table or matrix, you can show or hide static rows and columns, or rows and columns that are associated with groups.  

:::image type="content" source="media/paginated-drill-through/paginated-drilldown.gif" alt-text="Screenshot showing drilldown in paginated reports.":::
  
 In this illustration, the user clicks the plus signs (+) in the report to show detail data.  
  
 For example, you can initially hide all the rows except the outer group summary row for a table with row groups. For each inner group (including the details group), add an expand/collapse icon to the grouping cell of the containing group. When the report is rendered, the user can click the text box to expand and collapse the detail data. For more information, see [Tables &#40;Report Builder  and SSRS&#41;](/sql/reporting-services/report-design/tables-report-builder-and-ssrs).  
  
 To allow users to expand or collapse an item, you set the visibility properties for that item.  
  
> [!NOTE]  
>  When you create a report with a drilldown action, the visibility information must be set on the group, column, or row that you want to hide, not just a single text box in the row or column. In addition, the text box that you use for the toggle must be in a containing scope that controls the item that you want to show or hide.  
>   
>  For example, to hide a row associated with a nested group, the text box must be in a row associated with the parent group or higher in the containment hierarchy.  
>   
>  For information on setting visibility information on the group, column or row, see [Add an Expand or Collapse Action to an Item &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/add-an-expand-or-collapse-action-to-an-item-report-builder-and-ssrs)  
  
 For more information about hiding report items, see [Hide an Item &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-builder/hide-an-item-report-builder-and-ssrs).  

## Comparing drilldown and drillthrough reports  
 In a drilldown report, a user clicks a plus or minus button to expand or collapse a section of a report to show detail data in place. In a drillthrough report, the user clicks a link for a summary value, and this opens a separate, related report to show detail data. The detail data is only retrieved when the detail report runs. Drillthrough reports typically require fewer resources than drilldown reports. For more information, see [Drillthrough, drilldown, subreports, and nested data regions in a paginated report (Power BI Report Builder)](drillthrough-drilldown-subreports-nested-data-regions.md)  
  
## Rendering extension support for hidden report items  
 The show-and-hide toggle on report items is supported only by rendering extensions that support user interactivity, such as the HTML rendering extension that is used when you run a report in Report Builder and in the web portal, for example. Other rendering extensions display hidden items. The following list describes support for report items with conditional visibility:  
  
- In HTML, if items are hidden, they are not visible in the HTML source.  
  
- The XML rendering extension displays all report items, regardless of whether they are hidden.  
  
- The Excel rendering extension displays and expands hidden rows and columns for a table, matrix, or list. All rows and columns are visible.  
  
 For more information, see [Rendering Behaviors &#40;Report Builder  and SSRS&#41;](/sql/reporting-services/report-design/rendering-behaviors-report-builder-and-ssrs).  
  
## Related content

- [Drillthrough, drilldown, subreports, and nested data regions in a paginated report (Power BI Report Builder)](drillthrough-drilldown-subreports-nested-data-regions.md)
- [Interactive Sort, Document Maps, and Links &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/interactive-sort-document-maps-and-links-report-builder-and-ssrs)
- [Expression examples in Power BI Report Builder](../expressions/report-builder-expression-examples.md) 
