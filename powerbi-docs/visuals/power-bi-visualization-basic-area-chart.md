---
title: Basic Area chart
description: 'Basic Area chart.'
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 05/27/2018
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
2. Select **Edit Report** to open the report in Editing View.
3. Add a new report page bys selecting the yellow plus icon (+) at the bottom of the report.
4. Create an area chart that displays this year's sales and last year's sales by month.
   
   a. From the FIELDS pane, select **Sales \> Last Year Sales**, and **This Year Sales > Value**.

   ![](media/power-bi-visualization-basic-area-chart/power-bi-bar-chart.png)

   b.  Convert the chart to a basic area chart by selecting the Area chart icon from the VISUALIZATIONS pane.

   ![](media/power-bi-visualization-basic-area-chart/convertchart.png)
   
   c.  Select **Time \> Month** to add it to the **Axis** well.   
   ![](media/power-bi-visualization-basic-area-chart/powerbi-area-chartnew.png)
   
   d.  To display the chart by month, select the ellipses (top right corner of the visual) and choose **Sort by month**.

## Highlighting and cross-filtering
For information about using the FILTERS pane, see [Add a filter to a report](../power-bi-report-add-filter.md).

To highlight one particular area in your chart, select that area or its top border.  Unlike other visualization types, if there are other visualizations on the same page, highlighting a basic area charts does not cross-filter the other visualizations on the report page. However, area charts are a target for cross-filtering triggered by other visualizations on the report page. To learn more, see [Visual interactions in reports](../consumer/end-user-interactions.md)


## Considerations and troubleshooting   
* [Make the report more accessible for people with disabilities](../desktop-accessibility.md)
* Basic area charts are not effective for comparing the values due to the occlusion on the layered areas. Power BI uses transparency to indicate the overlap of areas. However, it only works well with two or three different areas. When you need to compare trend to more than three measures, try using line charts. When you need to compare volume to more than three measures, try using treemap.

## Next steps
[Reports in Power BI](../consumer/end-user-reports.md)  
[Visualizations in Power BI reports](power-bi-report-visualizations.md)  
[Power BI - Basic Concepts](../consumer/end-user-basic-concepts.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

