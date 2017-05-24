<properties
   pageTitle="Filled Maps (Choropleths) in Power BI (Tutorial)"
   description="Documentation - tutorial on creating Filled Maps (Choropleths) in Power BI"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   featuredVideoId=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/24/2017"
   ms.author="mihart"/>

# Filled maps (choropleths) in Power BI (Tutorial)

A filled map uses shading or tinting or patterns to display how a value differs in proportion across a geography or region.  Quickly display these relative differences with shading that ranges from light (less-frequent/lower) to dark (more-frequent/more).    

![](media/powerbi-service-tutorial-filled-maps-choropleths/large_map.png)

##    What is sent to Bing

>**Important**: Power BI sends Bing all the data that is used to create the visualization.

Power BI integrates with Bing to provide default map coordinates (a process called geo-coding). When you create a map visualization in Power BI service or Power BI Desktop, **all** the data in all the fields being used to create that visualization are sent to Bing.

For more information about the data being sent to Bing, and for tips to increase your geocoding success, see [Tips and tricks for map visualizations](powerbi-service-tips-and-tricks-for-power-bi-map-visualizations.md).

## When to use a filled map  
Filled maps are a great choice:

-   to display quantitative information on a map.

-   to show spatial patterns and relationships.

-   when your data is standardized.

-   when working with socioeconomic data.

-   when defined regions are important.

-   to get an overview of the distribution across the geographic locations.

## Create a basic filled map
In this video, Kim creates a basic map and converts it to a filled map.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ajTPGNpthcg" frameborder="0" allowfullscreen></iframe>


1.    To create your own filled map, [download the Sales and Marketing sample](powerbi-sample-downloads.md) by signing in to Power BI and selecting **Get Data \> Samples \> Sales and Marketing \> Connect**.


1.  When the success message appears, select **View dataset**. 

    ![](media/powerbi-service-tutorial-filled-maps-choropleths/power-bi-view-dataset.png)

2. Power BI opens a blank report canvas in [Editing View](powerbi-service-interact-with-a-report-in-editing-view.md).

    ![](media/powerbi-service-tutorial-filled-maps-choropleths/power-bi-blank-canvas.png)

4.  From the Fields pane, select the **Geo** \> **State** field.    

    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img002.png)

5.  [Convert the chart](powerbi-service-change-the-type-of-visualization-in-a-report.md) to a filled map. Notice that **State** is now in the **Location** well. Bing Maps uses the field in the **Location** well to create the map.  The location can be a variety of valid locations: countries, states, counties, cities, zip codes or other postal codes etc. Bing Maps provides filled map shapes for locations around the world. Without a valid entry in the Location well, Power BI cannot create the filled map.  

    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img003.png)

4.  Filter the map to display only the continental United States.

	a.  At the bottom of the Visualizations pane, look for the **Filters** area.

	b.  Hover over **State** and click the expand chevron  
    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img004.png)

	c.  Place a checkmark next to **All** and remove the checkmark next to **AK**.

    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img005.png)

5.  Select **SalesFact** \> **Sentiment** to add it to the **Color saturation** well. The field in the **Color saturation** well controls the map shading.  
![](media/powerbi-service-tutorial-filled-maps-choropleths/power-bi-color-saturation.png)

6.  The filled map is shaded in green, with light green representing the lower sentiment numbers and dark green representing the higher, more-positive sentiment.  Here I've highlighted the state of Wyoming (WY) and see that Sentiment is very good, 74.  
![](media/powerbi-service-tutorial-filled-maps-choropleths/img007.png)

8.  [Save the report](powerbi-service-save-a-report.md).

## Highlighting and cross-filtering  
For information about using the Filters pane, see [Add a filter to a report](powerbi-service-add-a-filter-to-a-report.md).

Highlighting a Location in a Filled Map cross-filters the other visualizations on the report page... and vice versa.

1.  On the filled map, select a state.  This highlights the other visualizations on the page. Selecting **Texas**, for example, shows me that Sentiment is 74, Texas is in the Central District \#23, and that most of the sales volume comes from the Moderation and Convenience segments.   
    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img008.png)

2.  On the line chart, toggle between **No** and **Yes**. This filters the Filled Map to show Sentiment for VanArsdel and for VanArsdel's competition.  
    ![](media/powerbi-service-tutorial-filled-maps-choropleths/img009.gif)

## Considerations and troubleshooting  
Map data can be ambiguous.  For example, there's a Paris, France, but there's also a Paris, Texas. Your geographic data is probably stored in separate columns – a column for city names, a column for state or province names, etc. – so Bing may not be able to tell which Paris is which. If your dataset already contains latitude and longitude data, Power BI has special fields to help make the map data unambiguous. Just drag the field that contains your latitude data into the Visualizations \> Latitude area.  And do the same for your longitude data.  
![](media/powerbi-service-tutorial-filled-maps-choropleths/PBI_Latitude.png) 

If you have permissions to edit the dataset in Power BI Desktop, watch this video for help addressing map ambiguity.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Co2z9b-s_yM" frameborder="0" allowfullscreen></iframe>

If you do not have access to latitude and longitude data, [follow these instructions to update your dataset](https://support.office.com/article/Maps-in-Power-View-8A9B2AF3-A055-4131-A327-85CC835271F7).

For more help with Map visualizations, see [Tips and tricks for map visualizations](powerbi-service-tips-and-tricks-for-power-bi-map-visualizations.md).

## Next steps 
[Add the filled map as a dashboard tile (pin the visual)](powerbi-service-dashboard-tiles.md)    
 [Add a visualization to a report](powerbi-service-add-visualizations-to-a-report-i.md)  
 [Visualization types in Power BI](powerbi-service-visualization-types-for-reports-and-q-and-a.md)    
 [Change the type of visualization being used](powerbi-service-change-the-type-of-visualization-in-a-report.md)      
More questions? [Try the Power BI Community](http://community.powerbi.com/)
