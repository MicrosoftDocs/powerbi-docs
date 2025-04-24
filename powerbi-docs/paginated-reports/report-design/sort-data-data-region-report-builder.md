---
title: "Sort data in a data region in a Power BI paginated report | Microsoft Docs"
description: Learn how to change the sort order of data in a data region in a Power BI paginated report when a report first runs in Power BI Report Builder.
ms.date: 06/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Sort data in a data region in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  To change the sort order of data in a data region when a Power BI paginated report first runs, you must set the sort expression on the data region or group. By default, the sort expression for a group is automatically set to the same value as the group expression.  
  
- In a tablix data region, set the sort expression for the data region or for each group, including the details group. If you have only one details group in a tablix data region, you can define a sort expression in the query, on the data region, or on the details group and they all have the same effect.  
  
- In a chart data region, set the sort expression for the Category and Series groups to control the sort order for each group. The order for colors in a chart legend is determined by the sort expression for the data points in the Category group.  
  
- In a gauge data region, you do not typically need to sort data because the gauge displays a single value relative to a range. If you do need sort data in a gauge, you must first define a group, and then set the sort expression for the group.  
  
 For more information, see [Filter, group, and sort data (Power BI Report Builder)](filter-group-sort-data-report-builder.md).  
  
 For a tablix data region, you can also add an interactive sort button to the top of a column header to provide the user with the ability to change the sort order of groups or detail rows. For more information, see [Interactive sort (Power BI Report Builder)](/sql/reporting-services/report-design/interactive-sort-report-builder-and-ssrs).  

## Sort data in a Tablix data region  
  
1. On the design surface, right-click a row handle, and then select **Tablix Properties**.  
  
1. Select **Sorting**.  
  
1. For each sort expression, follow these steps:  
  
    1. Select **Add**.  
  
    1. Type or select an expression by which to sort the data.  
  
    1. From the **Order** column drop-down list, choose the sort direction for each expression. **A-Z** sorts the expression in ascending order. **Z-A** sorts the expression in descending order.  
  
1. Select **OK**.
  
## Sort values in a group, including the details group, for a Tablix  
  
1. On the design surface, select in the tablix data region to select it. The Grouping pane displays the row groups and column groups for the Tablix data region.  
  
1. In the Row Groups pane, right-click the group name, and then select **Edit Group**.  
  
1. In the **Tablix Group** dialog box, select **Sort**.  
  
1. For each sort expression, follow these steps:  
  
    1. Select **Add**.  
  
    1. Type or select an expression by which to sort the data.  
  
    1. From the **Order** column drop-down list, choose the sort direction for each expression. **A-Z** sorts the expression in ascending order. **Z-A** sorts the expression in descending order.  
  
1. Select **OK**.
  
## Sort x-axis labels in alphabetical order on a chart  
  
1. Right-click a field in the Category Field drop-zone and select **Category GroupProperties**.  
  
1. In the **Category Group Properties** dialog box, select **Sorting**.  
  
1. For each sort expression, follow these steps:  
  
    1. Select **Add**.  
  
    1. Select the expression that matches your grouping field. You can verify the expression for the grouping field by selecting **Grouping**.  
  
    1. From the **Order** column drop-down list, choose the sort direction for each expression. **A-Z** sorts the expression in ascending alphabetical order. **Z-A** sorts the expression in descending alphabetical order.  
  
1. Select **OK**.
  
## Sort the data points in ascending or descending order on a chart  
  
1. Right-click a field in the Category Field drop zone and select **Category GroupProperties**.  
  
1. In the **Category Group Properties** dialog box, select **Sorting**.  
  
1. For each sort expression, follow these steps:  
  
    1. Select **Add**.  
  
    1. Select the expression that matches your data field. In most cases, this is an aggregated value, such as `=Sum(Fields!Quantity.Value)`.  
  
    1. From the **Order** column drop-down list, choose the sort direction for each expression. **A-Z** sorts the expression in ascending order. **Z-A** sorts the expression in descending order.  
  
1. Select **OK**.
  
## Sort data in ascending or descending order for display on a gauge  
  
1. Right-click the gauge and select **Add Data Group**.  
  
1. In the **Gauge Panel GroupProperties** dialog box, select **General** if necessary.  
  
1. In **Group expressions**, select **Add**.  
  
1. In **Group on**, type or select an expression by which to group the data.  
  
1. Repeat steps 3 and 4 until you have added all the group expressions you want to use.  
  
1. Select **Sorting**.  
  
1. For each sort expression, follow these steps:  
  
    1. Select **Add**.  
  
    1. Select the expression that matches your grouping field. You can verify the expression for the grouping field by selecting **Grouping**.  
  
    1. From the **Order** column drop-down list, choose the sort direction for each expression. **A-Z** sorts the expression in ascending order. **Z-A** sorts the expression in descending order.  
  
1. Select **OK**.
  
 For more information about how data is grouped in a gauge, see [Gauges (Power BI Report Builder)](/sql/reporting-services/report-design/gauges-report-builder-and-ssrs).  
  
## Related content

- [Charts (Power BI Report Builder)](/sql/reporting-services/report-design/charts-report-builder-and-ssrs)   
- [Formatting axis labels on a chart (Power BI Report Builder)](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs)   
- [Specify consistent colors across multiple shape charts (Power BI Report Builder)](/sql/reporting-services/report-design/specify-consistent-colors-across-multiple-shape-charts-report-builder-and-ssrs)  
  
  
