---
title: "Troubleshoot report design issues with paginated reports"
description: In this article, diagnose and fix report design issues that may occur when you create the report layout in Power BI Report Builder.
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: troubleshooting
ms.date: 09/25/2023
---

# Troubleshoot report design issues with paginated reports
Report design issues may occur when you are creating the report layout in Design view in Power BI Report Builder. Use this topic to help troubleshoot these issues.   
  
## Why does my text box show only a single value and not repeat for every row?  

### The text box parent is the report body  

If you add a text box with a dataset field reference directly to the design surface, it renders only once and displays the first value in the dataset. It can only display an aggregate value for a dataset.  
  
To verify the parent container of a text box, select the text box, and in the Properties pane, scroll to **Parent**.   
  
If you want text boxes that show each value in a dataset, use a data region, such as a table or matrix. By default, each cell in a table or matrix contains a text box. Drag dataset fields to each cell.   
  
## Why can't I add Total Pages to my report?  

### The built-in fields `[&PageNumber]` and `[&TotalPages]` aren't valid in the report body
  
The built-in fields [&PageNumber] and [&TotalPages] are valid only in the page header and page footer.   
  
To add [&PageNumber] or [&TotalPages] to a report, you must first add a page header or page footer. For more information, see [Add or remove a page header](./report-design/add-remove-page-header-footer-report-builder-service.md).  
  
> [!NOTE]  
> When you include [&TotalPages] in the page header or page footer, it can have consequences for report processing. For more information, see Reports Exported to a Specific File Format in [Troubleshoot Paginated Report Execution Issues](./troubleshoot-paginated-reports-execution-issues.md).  
  
## How do I design two tables or a chart and a table to display side-by-side?  
Designing a report is not a WYSISYG ("what you see is what you get") experience. The report processor combines data, report items, report layout information such as white space, containers, and expressions to produce a compiled report which is then passed to a report renderer that "lays out" that report for the specified viewing experience: interactive for an HTML browser or as a file format. The automatic layout algorithms may produce a report layout that you want to change.   
  
### Rendering rules use page size, containers, peer objects, relative placement, and white space to determine layout  
In general, a report grows to accommodate its data and pushes other report items aside.   
  
To group multiple data regions or report items together, place them in the same parent container. For example, place a chart and table in a rectangle container and align their top edges to display them side by side. For more information, see [Rendering Behaviors in Report Builder](./report-design/render-behaviors-report-builder-service.md).
  
## Related content

- [Troubleshoot Execution Issues With Paginated Reports](./troubleshoot-paginated-reports-execution-issues.md)
- [Data retrieval guidance for paginated reports](../guidance/report-paginated-data-retrieval.md)
- [Paginated reports capacity planning](./paginated-capacity-planning.md)
- [Troubleshoot subreports in Power BI paginated reports](./subreports-troubleshoot.md)
- [Paginated reports in Power BI: FAQ](./paginated-reports-faq.yml)
