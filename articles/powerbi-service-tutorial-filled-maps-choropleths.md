<properties 
   pageTitle="Tutorial: Filled Maps (Choropleths) in Power BI"
   description="Tutorial: Filled Maps (Choropleths) in Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="mihart" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/15/2015"
   ms.author="mihart"/>

# Tutorial: Filled Maps (Choropleths) in Power BI  

A Filled Map uses shading or tinting or patterns to display how a value differs in proportion across a geography or region.  Quickly display these relative differences with shading that ranges from light (less-frequent/lower) to dark (more-frequent/more).    

![](media/powerbi-service-tutorial-filled-maps-choropleths/large_map.png)

## When to use a Filled Map  
Filled Maps are a great choice:

-   to display quantitative information on a map.

-   to show spatial patterns and relationships.

-   when your data is standardized.

-   when working with socioeconomic data.

-   when defined regions are important.

-   to get an overview of the distribution across the geographic locations.

## Create a basic Filled Map  
We'll create a Filled Map that shows sentiment data by state.

These instructions use the Sales and Marketing Sample. To follow along, [download the sample](powerbi-sample-downloads.md), sign in to Power BI and select **Get Data \> Files \> Local File** ﻿and upload the Sales and Marketing Sample.

>**Note:**  
>This tutorial uses the classic report canvas.  For more information, see Power BI classic report canvas vs. new report canvas.

1.  Start on a [blank report page ](powerbi-service-add-a-page-to-a-report.md)in [Editing View](powerbi-service-interact-with-a-report-in-editing-view.md)from the Sales and Marketing Sample dataset  
![](media/powerbi-service-tutorial-filled-maps-choropleths/img001.png)

2.  and select the **Geo** \> **State** field.    
![](media/powerbi-service-tutorial-filled-maps-choropleths/img002.png)

3.  [Convert the chart](powerbi-service-change-the-type-of-visualization-in-a-report.md) to a Filled Map. Notice that **State** is now in the **Location** well. Bing Maps uses the field in the **Location** well to create the map.  The location can be a variety of valid locations: countries, states, counties, cities, zip codes or other postal codes etc. Bing Maps provides filled map shapes for locations around the world. Without a valid entry in the Location well, Power BI cannot create the Filled Map.  
![](media/powerbi-service-tutorial-filled-maps-choropleths/img003.png)

4.  Filter the map to display only the continental United States.

	a.  At the bottom of the Visualizations pane, look for the **Filters** area.

	b.  Hover over **State** and click the expand chevron  
    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img004.png)

	c.  Place a checkmark next to **All** and remove the checkmark next to **AK**.

    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img005.png)

5.  Select **SalesFact** \> **Sentiment** to add it to the **Values** well. The field in the **Values** well controls the map shading.  
![](media/powerbi-service-tutorial-filled-maps-choropleths/img006.png)

6.  The Filled Map is shaded in blue, with light blue representing the lower sentiment numbers and dark blue representing the higher, more-positive sentiment.  Here I've highlighted the state of Wyoming (WY) and see that Sentiment is very good, 74.  
![](media/powerbi-service-tutorial-filled-maps-choropleths/img007.png)

7.  [Add the Filled Map as a dashboard tile (pin the visual)](powerbi-service-dashboard-tiles.md). 

8.  [Save the report](powerbi-service-save-a-report.md).

## Highlighting and cross-filtering  
For information about using the Filters pane, see [Add a filter to a report](powerbi-service-add-a-filter-to-a-report.md).

Highlighting a Location in a Filled Map filters the other visualizations on the report page... and vice versa.

1.  On the Filled Map, select a state.  This highlights the other visualizations on the page. Selecting **Texas**, for example, shows me that Sentiment is 74, Texas is in the Central District \#23, and that most of the sales volume comes from the Moderation and Convenience segments.   
    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img008.png)

2.  On the line chart, toggle between **No** and **Yes**. This filters the Filled Map to show Sentiment for VanArsdel and for VanArsdel's competition.  
    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img009.gif)

## Troubleshooting  
Map data can be ambiguous.  For example, there's a Paris, France, but there's also a Paris, Texas. Your geographic data is probably stored in separate columns – a column for city names, a column for state or province names, etc. – so Bing may not be able to tell which Paris is which. If your dataset already contains latitude and longitude data, Power BI has special fields to help make the map data unambiguous. Just drag the field that contains your latitude data into the Visualizations \> Latitude area.  And do the same for your longitude data.  
![](media/powerbi-service-tutorial-filled-maps-choropleths/PBI_Latitude.png) 

If you do not have access to latitude and longitude data, [follow these instructions to update your dataset](https://support.office.com/article/Maps-in-Power-View-8A9B2AF3-A055-4131-A327-85CC835271F7).

## See Also  
 [Add a visualization to a report](https://powerbi.uservoice.com/knowledgebase/articles/441777)  
 [Pin a visualization to a dashboard](powerbi-service-pin-a-tile-to-a-dashboard-from-a-report.md)  
 [Power BI - Basic Concepts](powerbi-service-basic-concepts.md)  
[Try it out -- it's free!](https://powerbi.com/)  