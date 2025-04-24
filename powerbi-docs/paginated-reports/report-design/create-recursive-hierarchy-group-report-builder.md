---
title: "Create a recursive hierarchy group in a Power BI paginated report | Microsoft Docs"
description: Learn about organizing data in a Power BI paginated report, from a single report dataset that includes hierarchical levels, by using a recursive hierarchy group.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Create a recursive hierarchy group in a Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In paginated reports, a recursive hierarchy group organizes data from a single report dataset that includes multiple hierarchical levels, such as the report-to structure for manager-employee relationships in an organizational hierarchy.  
  
 Before you can organize data in a table as a recursive hierarchy group, you must have a single dataset that contains all the hierarchical data. You must have separate fields for the item to group and for the item to group by. For example, a dataset where you want to group employees recursively under their manager might contain a name, an employee name, an employee ID, and a manager ID.  
  
 
## Create a recursive hierarchy group  
  
1.  In Design view, add a table, and drag the dataset fields to display. Typically, the field that you want to show as a hierarchy is in the first column.  
  
1.  Right-click anywhere in the table to select it. The Grouping pane displays the details group for the selected table. In the Row Groups pane, right-click **Details**, and then select **Edit Group**. The **Group Properties** dialog box opens.  
  
1.  In **Group expressions**, select **Add**. A new row appears in the grid.  
  
1.  In the **Group on** list, type or select the field to group.  
  
1.  Select **Advanced**.  
  
1.  In the **Recursive Parent** list, enter or select the field to group on.  
  
1.  Select **OK**.
  
     Run the report. The report displays the recursive hierarchy group, although there is no indent to show the hierarchy.  
  
## Format a recursive hierarchy group with indent levels  
  
1.  Select the text box that contains the field to which you want to add indent levels to display a hierarchy format. The properties for the text box appear in the Properties pane.  
  
    > [!NOTE]  
    >  If you don't see the Properties pane, select **Properties** on the **View** tab.  
  
1.  In the Properties pane, expand the **Padding** node, select **Left**, and from the drop-down list, select **\<Expression...>**.  
  
1.  In the Expression pane, type the following expression:  
  
     `=CStr(2 + (Level()*10)) + "pt"`  
  
     The Padding properties all require a string in the format *nnyy*, where *nn* is a number and *yy* is the unit of measure. The example expression builds a string that uses the **Level** function to increase the size of the padding based on recursion level. For example, a row that has a level of 1 would result in a padding of (2 + (1\*10))=12pt, and a row that has a level of 3 would result in a padding of (2 + (3\*10))=32pt. For information about the **Level** function, see [Level](/sql/reporting-services/report-design/report-builder-functions-level-function).  
  
1.  Select **OK**.
  
     Run the report. The report displays a hierarchical view of the grouped data.  
  
## Related content

- [Creating recursive hierarchy groups &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/creating-recursive-hierarchy-groups-report-builder.md)   
- [Filter, group, and sort data &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/filter-group-sort-data-report-builder.md)   
- [Aggregate functions reference &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference)   
- [Tables &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/tables-report-builder-and-ssrs)   
- [Matrices &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/create-a-matrix-report-builder-and-ssrs)   
- [Lists &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/create-invoices-and-forms-with-lists-report-builder-and-ssrs)   
- [Tables, matrices, and lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)  
  
  
