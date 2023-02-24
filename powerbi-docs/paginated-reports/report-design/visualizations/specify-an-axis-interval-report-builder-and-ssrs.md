---
title: "Specify an axis interval in a Power BI paginated report | Microsoft Docs"
description: Find out how to change the number of labels and tick marks on the category (x) axis in a chart in a Power BI paginated report by setting the axis interval in Power BI Report Builder.
ms.date: 02/21/2023
ms.service: powerbi
ms.subservice: report-design


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Specify an axis interval in a Power BI paginated report (Power BI Report Builder)

Learn to change the number of labels and tick marks on the category (x) axis in a chart by setting the axis interval in a Power BI paginated report.
 
On the value axis (usually the y axis), axis intervals provide a consistent measure of the data points on the chart. 

But on the category axis (usually the x axis), sometimes an automatic axis interval results in categories without axis labels. You can specify the number of intervals you want in the axis Interval property. Report Builder calculates the number of intervals at run time, based on the data in the result set. For more information about how axis intervals are calculated, see [Formatting Axis Labels on a Chart](/paginated-reports/report-design/visualizations/formatting-axis-labels-on-a-chart-report-builder-and-ssrs).  

To try setting the axis interval with sample data, see [Tutorial: Add a Column Chart to Your Report (Power BI Report Builder)](/paginated-reports/tutorials/tutorial-add-a-column-chart-to-your-report-report-builder.md).
  
> [!NOTE]  
>  The category axis is usually the horizontal or x-axis. However, for bar charts, the category axis is the vertical or y-axis.  
>
> This topic doesn't apply to:
>-   Date or time values on the category axis. Be default, **DateTime** values appear as days. You can specify a different date or time interval, such as a month or time interval. For more information, see [Format Axis Labels as Dates or Currencies](/paginated-reports/report-design/visualizations/format-axis-labels-as-dates-or-currencies-report-builder-and-ssrs).  
>-  Pie, doughnut, funnel or pyramid charts, which do not have axes. 
  
## Show all the category labels on the x-axis  

In this column chart, the horizontal label interval is set to Auto.

![Screenshot showing report builder column chart preview with the x-axis interval set to Auto.](../media/paginated-reports-visualizations/column-chart-preview-x-axis-interval-auto.png "Screenshot showing report builder column chart preview with the x-axis interval set to Auto.")
  
1.  Right-click the category axis and click **Horizontal Axis Properties**.   

    ![Screenshot of a report builder column chart showing how to set x-axis labels.](../media/paginated-reports-visualizations/column-chart-x-axis-labels.png "Screenshot of a report builder column chart showing how to set x-axis labels.")
  
2.  In the **Horizontal Axis Properties** dialog box > **Axis Options** tab, set **Interval** to **1** to show every category group label. To show every other category group label on the x-axis, type **2**. 

     ![Screenshot of a report builder column chart showing how to set the x-axis interval to one.](../media/paginated-reports-visualizations/column-chart-x-axis-interval-one.png "Screenshot of a report builder column chart showing how to set the x-axis interval to one.")
  
3.  Select **OK**.
     
     Now the column chart displays all its horizontal axis labels.
     
     ![Screenshot of the report builder column chart preview showing x-axis labels.](../media/paginated-reports-visualizations/column-chart-preview-x-axis-interval-one.png "Screenshot of the report builder column chart preview showing x-axis labels.")
     
     > [!NOTE]  
     >  When you set an axis interval, all automatic labeling is disabled. If you specify a value for the axis interval, you may see unpredictable labeling behavior, depending on how many categories are on the category axis.  

## Change the label interval in Properties pane

You can also set the label interval in the Properties pane.

1.  In report design view, click the chart, then select the horizontal axis labels.

3. In the Properties pane, set LabelInterval to **1**.

    ![Screenshot of the report builder column chart showing how to set the label interval.](../media/paginated-reports-visualizations/column-chart-set-label-interval.png "Screenshot of the report builder column chart showing how to set the label interval.")

    The chart looks the same in design view. 
    
5.  Click **Run** to preview the report.

    ![Screenshot of the report builder column chart preview showing the label interval of one.](../media/paginated-reports-visualizations/column-chart-label-interval-one-preview.png "Screenshot of the report builder column chart preview showing the label interval of one.")
    
    Now the chart displays all its labels.
  
## Enable a variable interval calculation on an axis  

By default, axis interval is set to Auto. This procedure explains how to set it back to the default. 
  
1.  Right-click the chart axis that you want to change, and then click **Axis Properties**. 
  
2.  In the **Horizontal Axis Properties** dialog box > **Axis Options** tab, set **Interval** to **Auto**. The chart will display the optimal number of category labels that can fit along the axis.  
  
3.  Select **OK**.
  
## Next steps  
 [Formatting a Chart &#40;Power BI Report Builder&#41;](/paginated-reports/report-design/visualizations/formatting-a-chart-report-builder-and-ssrs)   
 [Formatting Data Points on a Chart (Power BI Report Builder)](/paginated-reports/report-design/visualizations/formatting-data-points-on-a-chart-report-builder-and-ssrs)   
 [Sort Data in a Data Region (Power BI Report Builder)](/sql/reporting-services/report-design/sort-data-in-a-data-region-report-builder-and-ssrs)     
 [Specify a Logarithmic Scale &#40;Power BI Report Builder&#41;](/paginated-reports/report-design/visualizations/specify-a-logarithmic-scale-report-builder-and-ssrs)   
 [Plot Data on a Secondary Axis &#40;Power BI Report Builder&#41;](/paginated-reports/report-design/visualizations/plot-data-on-a-secondary-axis-report-builder-and-ssrs)  
  
