---
title: "Display headers and footers with a group in a paginated report"
description: Find out how to set properties to render headers and footers with dynamic rows that are associated with a group in a tablix data region in a paginated report.
ms.date: 03/22/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---
# Display headers and footers with a group in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

 You can control whether a static row, such as a group header or footer, renders with dynamic rows that are associated with a group in a tablix data region in a paginated report.  
  
 To repeat all the column headings or row headings on multiple pages, you can set properties for the tablix data region. For more information, see [Display Row and Column Headers on Multiple Pages (Report Builder and SSRS)](/sql/reporting-services/report-design/display-row-and-column-headers-on-multiple-pages-report-builder-and-ssrs).  
  
 To control the rendering behavior for dynamic rows and columns that are associated with nested groups, or for static rows and columns that are associated with labels or subtotals, you must set properties for the tablix member. A tablix member represents a static or dynamic row or column. A static member repeats once. For example, a grand total row is a static row. A dynamic member repeats once for each group instance. For example, a row that is associated with a group that has the group expression [Territory] repeats once for each unique value for territory. For more information about tablix members, see [Tablix Data Region Cells, Rows, and Columns &#40;Report Builder&#41;](/sql/reporting-services/report-design/tablix-data-region-cells-rows-and-columns-report-builder-and-ssrs).
  
 You can select a tablix member in the Grouping pane and set the properties **KeepWithGroup**, **KeepTogether**, and **RepeatOnNewPage** in the Properties pane. Use **KeepWithGroup** to help display group headers and footers on the same page as the group. Use **KeepTogether** to help display static members with the rows or columns of a group. Use **RepeatOnNewPage** to repeat the group header or footer on every page that displays at least one complete instance of the row group member designated by the **KeepWithGroup** value. **RepeatOnNewPage** is not supported for column group members.  
  
> [!NOTE]  
> **KeepWithGroup**, **KeepTogether**, and **RepeatOnNewPage** are group member properties that you can set by using the **Advanced Mode** of the Grouping pane. For more information, see [Grouping Pane &#40;Report Builder&#41;](/sql/reporting-services/report-design/grouping-pane-report-builder).


## Keep a static row with a set of dynamic rows associated with a row group  
  
1. On the design surface, select anywhere in the tablix data region to select it. The Grouping pane displays the row and column groups for the data region.  
  
1. On the right side of the Grouping pane, select the down arrow, and then select **Advanced Mode**. The Row Groups pane displays the hierarchical static and dynamic members for the row groups hierarchy.  
  
1. Select the static member that corresponds to the row header or footer that you want to keep with the group rows. The Properties pane displays the **Tablix Member** properties.  
  
1. In the Properties pane, select **KeepWithGroup**, and then choose one of the following values from the drop-down list:  
  
    - **None** Select this option to indicate no preference for keeping this member with the members of the selected row group.  
    - **Before** Select this option to keep this member with the members of the previous group. You might use this for group footer rows.  
    - **After** Select this option to keep this member with the members of the following group. You might use this for group header rows.  
  
1. (Optional) Preview the report. Where possible, the report renderer keeps this member with the specified row group members.  
  
## Keep a static column with a set of dynamic columns associated with a column group  
  
1. On the design surface, select anywhere in the tablix data region to select it. The Grouping pane displays the row and column groups for the data region.  
  
1. On the right side of the Grouping pane, select the down arrow, and then select **Advanced Mode**. The Column Groups pane displays the hierarchical static and dynamic members for the column group hierarchy.  
  
1. Select the static member that corresponds to the static column that you want to keep with the group columns. The Properties pane displays the **Tablix Member** properties.  
  
1. In the Properties pane, select **KeepWithGroup**, and then choose one of the following values from the drop-down list:  
  
    - **None** Select this option to indicate no preference for keeping this member with the members of the selected column group.  
    - **Before** Select this option to keep this member with the members of the previous group. You might use this for column labels that display before the specified column group members.
    - **After** Select this option to keep this member with the members of the following group. You might use this for column totals that display after the specified column group members.  
  
1. (Optional) Preview the report. Where possible, the report renderer keeps this member with the specified column group members.  
  
## Related content

- [Page headers and footers in a paginated report](page-headers-footers-report-builder-service.md)  
- [Tablix Data Region Cells, Rows, and Columns (Report Builder) and SSRS](../../paginated-reports/report-builder-tables-matrices-lists.md)
 
  
  
