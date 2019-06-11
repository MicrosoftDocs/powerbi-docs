---
title: Basic Area chart
description: 'Basic Area chart.'
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/11/2019
ms.author: mihart

LocalizationGroup: Visualizations
---
# Basic Area chart
The basic area chart (aka layered area chart.) is based on the line chart. The area between axis and line is filled with colors to indicate volume. 

Area charts emphasize the magnitude of change over time, and can be used to draw attention to the total value across a trend. For example, data that represents profit over time can be plotted in an area chart to emphasize the total profit.

![](media/power-bi-visualization-basic-area-chart/powerbi-area-chartnew.png)

## When to use a basic area chart
Basic area charts are a great choice:

* to see and compare the volume trend across time series 
* for individual series representing a physically countable set

### Prerequisites
 - Power BI service
 - Retail Analysis sample

To follow along, sign in to Power BI and select **Get Data \> Samples \> Retail Analysis Sample > Connect** and choose **Go to dashboard**. 

## Create a basic area chart
 

1. From the "Retail Analysis Sample" dashboard, select the **Total Stores** tile to open the "Retail Analysis Sample" report.
2. Select **Edit** to open the report in Editing view.
3. Add a new report page by selecting the yellow plus icon (+) at the bottom of the report.
4. Create an area chart that displays this year's sales and last year's sales by month.
   
   a. From the Fields pane, select **Sales \> Last Year Sales**, and **This Year Sales > Value**.

   ![](media/power-bi-visualization-basic-area-chart/power-bi-bar-chart.png)

   b.  Convert the chart to a basic area chart by selecting the Area chart icon from the Visualizations pane.

   ![](media/power-bi-visualization-basic-area-chart/convertchart.png)
   
   c.  Select **Time \> Month** to add it to the **Axis** well.   
   ![](media/power-bi-visualization-basic-area-chart/powerbi-area-chartnew.png)
   
   d.  To display the chart by month, select the ellipses (top right corner of the visual) and choose **Sort by month**. To change the sort order, select the ellipses again and select either **Sort ascending** or **Sort descending**.

## Highlighting and cross-filtering
For information about using the Filters pane, see [Add a filter to a report](../power-bi-report-add-filter.md).

To highlight one particular area in your chart, select that area or its top border.  Unlike other visualization types, if there are other visualizations on the same page, highlighting a basic area charts does not cross-filter the other visualizations on the report page. However, area charts are a target for cross-filtering triggered by other visualizations on the report page. 

1. Try it out by selecting your area chart and copying it to another report page (CTRL-C and CTRL-V).
2. Select one of the shaded areas and then the other shaded area. You'll notice no impact on the other visualizations on the page.

    ![This year sales selected in area chart](media/power-bi-visualization-basic-area-chart/power-bi-select-area.png)

3. Now select an element on one of the other visualizations on the page, like a column chart bar or a month on a line chart. Notice the impact on the area chart -- it gets filtered.  

    ![Ft Oglethorpe bar selected](media/power-bi-visualization-basic-area-chart/power-bi-filter.png) 

To learn more, see [Visual interactions in reports](../service-reports-visual-interactions.md)


## Considerations and troubleshooting   
* [Make the report more accessible for people with disabilities](../desktop-accessibility.md)
* Basic area charts are not effective for comparing the values due to the occlusion on the layered areas. Power BI uses transparency to indicate the overlap of areas. However, it only works well with two or three different areas. When you need to compare trend to more than three measures, try using line charts. When you need to compare volume to more than three measures, try using treemap.

## Next step
[Reports in Power BI](power-bi-visualization-card.md)  

