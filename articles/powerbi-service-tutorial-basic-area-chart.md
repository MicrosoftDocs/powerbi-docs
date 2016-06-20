<properties
   pageTitle="Tutorial: Basic Area chart"
   description="Tutorial: Basic Area chart."
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/20/2016"
   ms.author="mihart"/>

# Tutorial: Basic Area chart  

The Basic Area Chart (aka Layered Area Chart.) is based on the line chart. The area between axis and line is filled with colors to indicate volume. 

Area charts emphasize the magnitude of change over time, and can be used to draw attention to the total value across a trend. For example, data that represents profit over time can be plotted in an area chart to emphasize the total profit.

## When to use a Basic Area Chart  
Basic Area Charts are a great choice:

-   to see and compare the volume trend across time series 

-   for individual series representing a physically countable set

## Create a Basic Area Chart  
To follow along, sign in to Power BI and select **Get Data \> Samples \> Retail Analysis Sample**. 

1.  From the "Retail Analysis Sample" dashboard, select the **Total Stores** tile to open the "Retail Analysis Sample" report.

2.  Select **Edit Report** to open the report in Editing View.

3.  Add a new report page.

4.  Create an Area chart that displays this year's sales and last year's sales by month.

	a.  From the **Fields pane**, select **Sales \> Last Year Sales**, ﻿and **This Year Sales > Value**.

	b.  Convert the chart to a basic Area chart.    
    ![](media/powerbi-service-tutorial-basic-area-chart/convertChart.png)

	c.  Select **Time \> Fiscal Month** to add it to the **Axis** well.   
    ![](media/powerbi-service-tutorial-basic-area-chart/powerbi-area-chart.png)

    d.  To display the chart by month, select the ellipses (top right corner of the visual) and choose **Sort by month**.

## Highlighting and cross-filtering  
For information about using the Filters pane, see [Add a filter to a report](powerbi-service-add-a-filter-to-a-report.md).

To select an area, click inside that area or along the top line.  Basic Area charts do not cross-filter the other visualizations on the report page. However, Area charts are a target for cross-filtering triggered by other visualizations on the report page.

## Tips and tricks for Basic Area charts  
-   Basic Area charts are not effective for comparing the values due to the occlusion on the layered areas. Power BI uses transparency to indicate the overlap of areas. However, it only works well with two or three different areas. When you need to compare trend to more than three measures, try using Line charts. When you need to compare volume to more than three measures, try using Treemap.

## See also  
[Reports in Power BI](powerbi-service-reports.md)  
[Visualizations in Power BI reports](powerbi-service-visualizations-for-reports.md)  
[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)  
