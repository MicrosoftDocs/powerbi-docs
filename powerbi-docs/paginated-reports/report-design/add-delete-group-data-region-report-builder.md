---
title: "Add or delete a group in a data region in a Power BI paginated report | Microsoft Docs"
description: Consider adding a group to a data region in a Power BI paginated report to organize data by a specific value or set of expressions for display and calculations in Report Builder.
ms.date: 06/27/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add or delete a group in a data region in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In Power BI paginated reports, add a group to a data region when you want to organize data by a specific value or set of expressions, for display and calculations. A group has a name and an expression that identifies which data from a dataset belongs to the group. For more information about groups, see [Understanding groups (Power BI Report Builder)](/sql/reporting-services/report-design/understanding-groups-report-builder-and-ssrs).  
  
 In a tablix data region, select in the table, matrix, or list to display the Grouping pane. Drag dataset fields to the Row Group and Column Group pane to create parent or child groups. Right-click an existing group to add an adjacent group. By definition, the details group is the innermost group and can only be added as a child group. Right-click an existing group to delete it. Rows and columns on which to display group values are automatically added for you. For more information, see [Tables, Matrices, and Lists (Power BI Report Builder)](/sql/reporting-services/report-design/tables-matrices-and-lists-report-builder-and-ssrs).  
  
 In a Chart data region, select in the chart to display the drop-zones. Create groups by dragging dataset fields to the category and series drop zones. To add nested groups, add multiple fields to the drop-zone.  
  
 Groups are not defined in a gauge by default. The default behavior for the gauge is to aggregate all values in the specified field into one value that is displayed on the gauge. For more information, see [Gauges (Power BI Report Builder)](../report-design/visualizations/gauges-report-builder.md).  
  
  
## Add a parent or child row or column group to a tablix data region  
  
1. Drag a field from the **Report Data** pane to the **Row Groups** pane or the **Column Groups** pane.  
  
    > [!NOTE]  
    >  If you do not see the Grouping pane, on the View tab, select **Grouping**.  
  
2. Drop the field above or below the group hierarchy using the guide bar to place the group as a parent group or a child group to an existing group.  
  
     The group is added with a default name, group expression, and sort expression that is based on the field name.  
  
## Add an adjacent row or column group to a tablix data region  
  
1. In the Grouping pane, right-click a group that is a peer to the group that you want to add. Select **Add Group**, and then select **Adjacent Before** or **Adjacent After** to specify where to add the group. The **Tablix Group** dialog box opens.  
  
2. In **Name**, type a name for the group.  
  
3. In **Group expression**, type an expression or select the expression button (**fx**) to create an expression.  
  
4. Select **OK**.
  
     A new group is added to the Grouping pane and a row or column on which to display group values is added to the tablix data region on the design surface.  
  
## Add a details group to a tablix data region  
  
1. In the Grouping pane, right-click a group that is the innermost child group, but not the **Details** group. Select **Add Group**, and then select **Child Group**. The **Tablix Group** dialog box opens.  
  
2. In **Group expression**, leave the expression blank. A details group has no expression.  
  
3. Select **Show detail data**.  
  
4. Select **OK**.
  
     A new details group is added as a child group in the Grouping pane, and the row handle for the group you selected in step 1 displays the details group icon. For more information about handles, see [Tablix data region cells, rows, and columns (Power BI Report Builder)](/sql/reporting-services/report-design/tablix-data-region-cells-rows-and-columns-report-builder-and-ssrs).  
  
## Edit a row or column group in a tablix data region  
  
1. On the report design surface, select anywhere in the tablix data region to select it. The Grouping pane displays the row and column groups.  
  
2. Right-click the group, and then select **Group Properties**.  
  
3. In **Name**, type the name of the group.  
  
4. In **Group expressions**, type or select a simple expression, or select the Expression (**fx**) button to create a group expression.  
  
5. Select **Add** to create additional expressions. All expressions you specify are combined using a logical AND to specify data for this group.  
  
6. (Optional) Select **Page Breaks** to set page break options.  
  
7. (Optional) Select **Sorting** to select or type expressions that specify the sort order for values in the group.  
  
8. (Optional) Select **Visibility** to select the visibility options for the item.  
  
9. (Optional) Select **Filters** to set filters for this group.  
  
10. (Optional) Select **Variables** to define variables scoped to this group and accessible from any child groups.  
  
11. Select **OK**.
  
## Delete a group from a tablix data region  
  
1. In the Grouping pane, right-click the group, and then click **Delete Group**.  
  
2. In the **Delete Group** dialog box, select one of the following options:  
  
    - **Delete group and related rows and columns** Choose this option to delete the group definition and all related rows that display group data. For the details group, if the same row belongs to both detail and group data, only the detail data rows are deleted.  
  
    - **Delete group only** Choose this option to keep the structure of the tablix data region the same and delete only the group definition.  
  
3. Select **OK**.
  
## Delete a details group from a tablix data region  
  
1. In the Grouping pane, right-click the details group, and then click **Delete Group**.  
  
2. In the **Delete Group** dialog box, select one of the following options:  
  
    - **Delete group and related rows and columns** Choose this option to delete the group definition and all related rows that display group data. For the details group, if the same row belongs to both detail and group data, only the detail data rows are deleted.  
  
    - **Delete group only** Choose this option to keep the structure of the tablix data region the same and delete only the group definition.  
  
3. Select **OK**.
  
     The details group is deleted.  
  
    > [!NOTE]  
    >  Verify that after you remove a details row, the expression in each cell specifies an aggregate expression where appropriate. If necessary, edit the expression to specify aggregate functions as needed.  
  
## Related content

- [Report and group variables collections references (Power BI Report Builder)](/sql/reporting-services/report-design/built-in-collections-report-and-group-variables-references-report-builder)   
- [Group expression examples (Power BI Report Builder)](../expressions/group-expression-examples-report-builder.md)   
- [Filter, group, and sort data (Power BI Report Builder)](filter-group-sort-data-report-builder.md)   
- [Tablix data region (Power BI Report Builder)](../../paginated-reports/report-builder-tables-matrices-lists.md)   
- [Tables (Power BI Report Builder)](/sql/reporting-services/report-design/tables-report-builder-and-ssrs)   
- [Matrices (Power BI Report Builder)](/sql/reporting-services/report-design/create-a-matrix-report-builder-and-ssrs)   
- [Lists (Power BI Report Builder)](/sql/reporting-services/report-design/create-invoices-and-forms-with-lists-report-builder-and-ssrs)   
- [Tables, Matrices, and Lists (Power BI Report Builder)](../report-builder-tables-matrices-lists.md)  
  
  
