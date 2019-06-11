---
title: Filled Maps (Choropleths) in Power BI
description: Documentation on creating Filled Maps (Choropleths) in Power BI
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/12/2019
ms.author: mihart

LocalizationGroup: Visualizations
---
# Filled maps (choropleths) in Power BI
A filled map uses shading or tinting or patterns to display how a value differs in proportion across a geography or region.  Quickly display these relative differences with shading that ranges from light (less-frequent/lower) to dark (more-frequent/more).    

![US map](media/power-bi-visualization-filled-maps-choropleths/large_map.png)

## What is sent to Bing
Power BI integrates with Bing to provide default map coordinates (a process called geo-coding). When you create a map visualization in Power BI service or Power BI Desktop, the data in the **Location**, **Latitude**, and **Longitude** buckets (that is being used to create that visualization) is sent to Bing.

You, or your administrator, may need to update your firewall to allow access to the URLs Bing uses for geocoding.  Those URLs are:
- https://dev.virtualearth.net/REST/V1/Locations    
- https://platform.bing.com/geo/spatial/v1/public/Geodata    
- https://www.bing.com/api/maps/mapcontrol

For more information about the data being sent to Bing, and for tips to increase your geo-coding success, see [Tips and tricks for map visualizations](power-bi-map-tips-and-tricks.md).

## When to use a filled map
Filled maps are a great choice:

* to display quantitative information on a map.
* to show spatial patterns and relationships.
* when your data is standardized.
* when working with socioeconomic data.
* when defined regions are important.
* to get an overview of the distribution across the geographic locations.

### Prerequisites
- Power BI service or Power BI Desktop
- Sales and Marketing Sample

To follow along, the tutorial uses Power BI service, not Power BI Desktop.

## Create a basic filled map
In this video, Kim creates a basic map and converts it to a filled map.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ajTPGNpthcg" frameborder="0" allowfullscreen></iframe>

### Get data and add a new blank page to the report
1. To create your own filled map, [download the Sales and Marketing sample](../sample-datasets.md) by signing in to Power BI and selecting **Get Data \> Samples \> Sales and Marketing \> Connect**. Or get the **Power BI Sales and Marketing** app on appsource.com. 

2. Open the Sales and Marketing report.

   ![Sales and marketing report opens](media/power-bi-visualization-filled-maps-choropleths/power-bi-report-canvas.png)
3. Power BI opens the report. Select **Edit report** to open the report in [Editing View](../service-interact-with-a-report-in-editing-view.md).

4. Add a new page by selecting the yellow plus sign at the bottom of the report canvas.

    ![Report tabs](media/power-bi-visualization-filled-maps-choropleths/power-bi-new-page.png)

### Create a filled map
1. From the Fields pane, select the **Geo** \> **State** field.    

   ![yellow check mark next to State](media/power-bi-visualization-filled-maps-choropleths/power-bi-state.png)
5. [Convert the chart](power-bi-report-change-visualization-type.md) to a filled map. Notice that **State** is now in the **Location** well. Bing Maps uses the field in the **Location** well to create the map.  The location can be a variety of valid locations: countries, states, counties, cities, zip codes or other postal codes etc. Bing Maps provides filled map shapes for locations around the world. Without a valid entry in the Location well, Power BI cannot create the filled map.  

   ![templates with the icon for filled map highlighted](media/power-bi-visualization-filled-maps-choropleths/img003.png)
6. Filter the map to display only the continental United States.

   a.  At the bottom of the Visualizations pane, look for the **Filters** area.

   b.  Hover over **State** and click the expand chevron  
   ![Visual level filters showing State(All)](media/power-bi-visualization-filled-maps-choropleths/img004.png)

   c.  Place a check mark next to **All** and remove the check mark next to **AK**.

   ![State dropdown with All and AK not selected](media/power-bi-visualization-filled-maps-choropleths/img005.png)
7. Select **SalesFact** \> **Sentiment** to add it to the **Color saturation** well. The field in the **Color saturation** well controls the map shading.  
   ![Sentiment in the Color saturation field well](media/power-bi-visualization-filled-maps-choropleths/power-bi-filled-map.png)
8. The filled map is shaded in green and red, with red representing the lower sentiment numbers and green representing the higher, more-positive sentiment.  Here I've highlighted the state of Wyoming (WY) and see that Sentiment is very good, 74.  
   ![black dialog showing state and sentiment](media/power-bi-visualization-filled-maps-choropleths/power-bi-wy.png)
9. [Save the report](../service-report-save.md).
##    Adjust the color formatting
Power BI gives you plenty of control over the appearance of your filled map.
1. Select the paint roller icon to open the Formatting pane.

    ![Formatting pane](media/power-bi-visualization-filled-maps-choropleths/power-bi-data-colors.png)

2. Select **Data colors** to display color options.
3. Set the Minimum and Maximum colors to yellow and blue. And add Minimum and Maximum values, based on your data. Play around with these controls until you get the look you want. 

    ![non-diverging colors](media/power-bi-visualization-filled-maps-choropleths/power-bi-color.png)

## Highlighting and cross-filtering
For information about using the Filters pane, see [Add a filter to a report](../power-bi-report-add-filter.md).

Highlighting a location in a filled Map cross-filters the other visualizations on the report page... and vice versa.

1. To follow along, first save this report by selecting **File > Save**. 

2. Copy the filled map using CTRL-C.

3. From the bottom of the report canvas, select the **Sentiment** tab to open the Sentiment report page.

    ![Sentiment tab selected](media/power-bi-visualization-filled-maps-choropleths/power-bi-sentiment-tab.png)

4. Move and resize the visualizations on the page to make some room, then CTRL-V paste the filled map from the previous report.

   ![Filled map added to Sentiment page](media/power-bi-visualization-filled-maps-choropleths/power-bi-map.png)

5. On the filled map, select a state.  This highlights the other visualizations on the page. Selecting **Texas**, for example, shows me that Sentiment is 74, Texas is in the Central District \#23.   
   ![Texas selected](media/power-bi-visualization-filled-maps-choropleths/power-bi-texas.png)
2. Select a data point on the VanArsdel - Sentiment by Month line chart. This filters the filled map to show Sentiment data for VanArsdel and not their competition.  
   ![new shading](media/power-bi-visualization-filled-maps-choropleths/power-bi-yes.png)

## Considerations and troubleshooting
Map data can be ambiguous.  For example, there's a Paris, France, but there's also a Paris, Texas. Your geographic data is probably stored in separate columns – a column for city names, a column for state or province names, etc. – so Bing may not be able to tell which Paris is which. If your dataset already contains latitude and longitude data, Power BI has special fields to help make the map data unambiguous. Just drag the field that contains your latitude data into the Visualizations \> Latitude area.  And do the same for your longitude data.    

![Visualizations and Fields panes](media/power-bi-visualization-filled-maps-choropleths/pbi_latitude.png)

If you have permissions to edit the dataset in Power BI Desktop, watch this video for help addressing map ambiguity.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Co2z9b-s_yM" frameborder="0" allowfullscreen></iframe>

If you do not have access to latitude and longitude data, but you do have edit access to the dataset, [follow these instructions to update your dataset](https://support.office.com/article/Maps-in-Power-View-8A9B2AF3-A055-4131-A327-85CC835271F7).

For more help with Map visualizations, see [Tips and tricks for map visualizations](../power-bi-map-tips-and-tricks.md).

## Next steps

[Shape map](desktop-shape-map.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)