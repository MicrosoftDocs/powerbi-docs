---
title: "Troubleshoot Report Design Issues with Paginated Reports"
description: In this article, diagnose and fix report design issues, which may occur when you create the report layout in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 09/25/2023
---

# Troubleshoot Report Design Issues with Paginated Reports
Report design issues may occur when you are creating the report layout in Design view in Power BI Report Builder. Use this topic to help troubleshoot these issues.   
  
## Why does my text box show only a single value and not repeat for every row?  
A text box with a dataset field reference renders only once and displays the first value in the dataset.   
  
**Text Box Parent is the Report Body**  
  
  
A text box added directly to the design surface can only display an aggregate value for a dataset.  
  
To verify the parent container of a text box, select the text box, and in the Properties pane, scroll to **Parent**.   
  
If you want text boxes that show each value in a dataset, use a data region, such as a table or matrix. By default, each cell in a table or matrix contains a text box. Drag dataset fields to each cell.   
  
## Why can't I add Total Pages to my Report?  
The built-in fields `[&PageNumber]` and `[&TotalPages]` are not valid in the report body.   
  
PageNumber and TotalPages are Valid Only in the Page Header and Page Footer.  
  
  
The built-in fields [&PageNumber] and [&TotalPages] are valid only in the page header and page footer.   
  
To add [&PageNumber] or [&TotalPages] to a report, you must first add a page header or page footer. For more information, see [Add or emove a page header](./report-design/add-remove-page-header-footer-report-builder-service.md).  
  
> [!NOTE]  
> Including [&TotalPages] in the page header or page footer can have consequences for report processing. For more information, see Troubleshooting Reports: Reports Exported to a Specific File Format.  
[Troubleshoot Execution Issues With Paginated Reports](./troubleshoot-paginated-reports-execution-issues.md).  
  
## How do I design two tables or a chart and a table to display side-by-side?  
Designing a report is not a WYSISYG ("what you see is what you get") experience. The report processor combines data, report items, report layout information such as white space, containers, and expressions to produce a compiled report which is then passed to a report renderer that "lays out" that report for the specified viewing experience: interactive for an HTML browser or as a file format. The automatic layout algorithms may produce a report layout that you want to change.   
  
### Rendering Rules Use Page Size, Containers, Peer Objects, Relative Placement, and White Space to Determine Layout  
In general, a report grows to accommodate its data and pushes other report items aside.   
  
To group multiple data regions or report items together, place them in the same parent container. For example, place a chart and table in a rectangle container and align their top edges to display them side by side. For more information, see [Rendering Behaviors in Report Builder](./report-design/render-behaviors-report-builder-service.md).
  
## Next steps
[Troubleshoot Execution Issues With Paginated Reports](./troubleshoot-paginated-reports-execution-issues.md)
[Data retrieval guidance for paginated reports](../guidance/report-paginated-data-retrieval.md)
[Paginated reports capacity planning](./paginated-capacity-planning.md)
[Troubleshoot subreports in Power BI paginated reports](./subreports-troubleshoot.md)
[Paginated reports in Power BI: FAQ](./paginated-reports-faq.yml)
