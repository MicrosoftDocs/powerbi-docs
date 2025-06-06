---
title: "Display the same data on a matrix and a chart in a Power BI paginated report | Microsoft Docs"
description: Show the same data in a paginated report in a matrix and in a chart in Power BI Report Builder. Set properties on these data regions to include the specifics.
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: JulCsc
ms.author: juliacawthra
ms.reviewer: saurkumar
---
# Display the same data on a matrix and a chart in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  When you want to show the same data in a matrix and a chart in a paginated report, you must set properties on both data regions to specify the same dataset, and also the same expressions for filters, groups, sorts, and data.  
  
 Because both data regions will have the same ancestor for data (the report dataset), you can add an interactive sort button to the matrix that, when the user clicks it, changes the sort order for both the matrix and the chart. For more information, see [Add Interactive Sort to a Table or Matrix &#40;Power BI Report Builder&#41;](add-interactive-sort-table-matrix-report-builder.md).  
  
 To use the matrix column group values as a legend for the chart, you must specify the colors for the series data on the chart, and then use the same colors as the fill colors for the background of the text boxes in the matrix cell that displays the group values. For more information, see [Specify Consistent Colors across Multiple Shape Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/specify-consistent-colors-across-multiple-shape-charts-report-builder.md).  
  
 At run-time, your report may appear cluttered if there are too many group values for your group definitions. You might need to filter values, combine groups, or adjust the threshold for the chart to combine groups for you. For more information, see [Linking Multiple Data Regions to the Same Dataset &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/linking-multiple-data-regions-to-same-dataset-report-builder.md)  
  
  
## Add a matrix and chart to display the same data  
  
1.  Open a report in design view.  
  
1.  From the **Insert** tab, in the **Data Regions** group, select **Matrix**, and then select the report body or in a rectangle in the report body. A matrix is added to the report.  
  
1.  From the **Insert** tab, in the **Data Regions** group, select **Chart**, and then select the chart type. A chart is added to the report.  
  
1.  (Optional) From the **Insert** tab, in the **Report Items** group, select **Rectangle**, and then select the report. A rectangle is added to the report. Drag the matrix and chart from steps 2 and 3 into the rectangle.  
  
     By placing multiple data regions in the rectangle container, you help control how the matrix and chart render when you view the report.  
  
     In the next few steps, you will choose the same dataset field to display in the matrix and to display in the chart.  
  
1.  From the Report Data pane, drag a numeric dataset field to the Data cell in the matrix.  
  
     By default, the aggregate function Sum is used for calculating the group value. If you change the aggregate function in the matrix, you must change in the chart also.  
  
1.  In the matrix, right-click the cell with data, click **Text Box Properties**, and then select **Number**. Choose an appropriate format for the dataset field value.  
  
1.  Select **OK**.
  
1.  Drag the same dataset field you chose in step 3 to the **Values** area on the chart.  
  
1. In the chart, right-click the Y axis, click **Axis Properties**, and then select **Number**. Choose the same format for the data that you chose in step 4.  
  
1. Select **OK**.
  
     In the next few steps, you will set the matrix row group and the chart series group to the same expression, and also set the sort order for the chart series group.  
  
1. From the Report Data pane, drag the dataset field that you want to group by for matrix rows to the Row Groups pane.  
  
     By default, the matrix row group adds a sort expression that is the same as the group expression.  
  
1. Drag the same dataset field that you used in step 9 to the **Series Groups** area for the chart.  
  
1. Right-click the group in the **Series Groups** area, and then select **Series Group Properties**.  
  
1. Select **Sorting**.  
  
1. Select **Add**. A new row appears in the sort expressions grid.  
  
1. In **Sort by**, from the drop-down list, choose the dataset field that you chose to group by in step 9.  
  
1. Select **OK**.
  
     In the next few steps, you will set the matrix column group and the chart category group to the same expression, and also set the sort order for the chart category group.  
  
1. From the Report Data pane, drag the dataset field that you want to group by for matrix columns to the Column Groups pane.  
  
     By default, the matrix column group adds a sort expression that is the same as the group expression.  
  
1. Drag the same dataset field that you used in step 16 to the **Category Groups** area for the chart.  
  
1. Right-click the group in the **CategoryGroups** area, and then select **Category Group Properties**.  
  
1. Select **Sorting**.  
  
1. Select **Add**. A new row appears in the sort expressions grid.  
  
1. In **Sort by**, from the drop-down list, choose the dataset field that you chose to group by in step 16.  
  
1. Select **OK**.
  
1. Preview the result. The matrix row and column groups display the same data as the chart series and category groups.  
  
## Related content

- [Linking Multiple Data Regions to the Same Dataset &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/linking-multiple-data-regions-to-same-dataset-report-builder.md)   
- [Add Dataset Filters, Data Region Filters, and Group Filters &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/add-dataset-filters-data-region-filters-and-group-filters.md)   
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)   
- [Charts &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/visualizations/charts-report-builder.md)  
  
  
