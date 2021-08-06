---
title: Filled Maps (Choropleth) in Power BI
description: Documentation on creating Filled Maps (Choropleth) in Power BI
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 12/05/2019
LocalizationGroup: Visualizations
---
# Create and use filled maps (choropleth maps) in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A filled map uses shading or tinting or patterns to display how a value differs in proportion across a geography or region.  Quickly display these relative differences with shading that ranges from light (less-frequent/lower) to dark (more-frequent/more).    

![US map](media/power-bi-visualization-filled-maps-choropleths/large-map.png)

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
This tutorial uses the [Sales and Marketing sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix).
1. From the upper left section of the menu bar, select **File** > **Open**
   
2. Find your copy of the **Sales and Marketing sample PBIX file**

1. Open the **Sales and Marketing sample PBIX file** in report view ![Screenshot of the report view icon.](media/power-bi-visualization-kpi/power-bi-report-view.png).

1. Select ![Screenshot of the yellow tab.](media/power-bi-visualization-kpi/power-bi-yellow-tab.png) to add a new page.

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.    

### Create a filled map
1. From the Fields pane, select the **Geo** \> **State** field.    

   ![yellow check mark next to State](media/power-bi-visualization-filled-maps-choropleths/power-bi-state.png)
2. [Convert the chart](power-bi-report-change-visualization-type.md) to a filled map. Notice that **State** is now in the **Location** well. Bing Maps uses the field in the **Location** well to create the map.  The location can be a variety of valid locations: countries, states, counties, cities, zip codes, or other postal codes etc. Bing Maps provides filled map shapes for locations around the world. Without a valid entry in the Location well, Power BI cannot create the filled map.  

   ![templates with the icon for filled map highlighted](media/power-bi-visualization-filled-maps-choropleths/power-bi-filled-map-icon.png)
3. Filter the map to display only the continental United States.

   a.  To the left of the Visualizations pane, look for the **Filters** pane. Expand it if it is minimized

   b.  Hover over **State** and select the expand chevron  
   ![Visual level filters showing State(All)](media/power-bi-visualization-filled-maps-choropleths/power-bi-state-hover.png)

   c.  Place a check mark next to **Select all** and remove the check mark next to **AK**.

   ![State dropdown with All and AK not selected](media/power-bi-visualization-filled-maps-choropleths/power-bi-continental.png)
4. Select the paint roller icon to open the Formatting pane, and choose **Data colors**.

    ![Formatting pane showing Data colors option](media/power-bi-visualization-filled-maps-choropleths/power-bi-colors.png)

5. Under the heading **Default color**, select **fx**.

    ![Data colors conditional formatting button](media/power-bi-visualization-filled-maps-choropleths/power-bi-fx.png)

6. Use the **Default color - Data colors** screen to determine how your filled map will be shaded. The options available to you include which field to base the shading, and how to apply the shading. In this example we're using the field **SalesFact** > **Sentiment**, and setting the lowest value for sentiment as orange and the highest value as blue. Values that fall between the maximum and minimum will be shades of orange and blue. The illustration at the bottom of the screen shows the range of colors that will be used. 

    ![Default color pane with Sentiment selected](media/power-bi-visualization-filled-maps-choropleths/power-bi-sentiment.png)

7. The filled map is shaded in orange and blue, with orange representing the lower sentiment numbers and blue representing the higher, more-positive sentiment.  To display additional detail, drag a field into the Tooltips well.  Here we've added **SalesFact** > **Sentiment gap**. Highlighting the state of Idaho (ID) shows us that sentiment gap is low, at 6.
   ![filled map showing Idaho tooltips](media/power-bi-visualization-filled-maps-choropleths/power-bi-idaho.png)

8. Save the report.

Power BI gives you plenty of control over the appearance of your filled map. Play around with these data color controls until you get the look you want. 

## Highlighting and cross-filtering
For information about using the Filters pane, see [Add a filter to a report](../create-reports/power-bi-report-add-filter.md).

Highlighting a location in a filled map cross-filters the other visualizations on the report page... and vice versa.

1. To follow along, first save this report by selecting **File > Save**. 

2. Copy the filled map using CTRL-C.

3. From the bottom of the report canvas, select the **Sentiment** tab to open the Sentiment report page.

    ![Sentiment tab selected](media/power-bi-visualization-filled-maps-choropleths/power-bi-sentiment-tab.png)

4. Move and resize the visualizations on the page to make some room, then CTRL-V paste the filled map from the previous report. (See the following images)

   ![Filled map added to Sentiment page](media/power-bi-visualization-filled-maps-choropleths/power-bi-map.png)

5. On the filled map, select a state.  This cross-highlights and cross-filters the other visualizations on the page. Selecting **Texas**, for example, cross-filters the cards and cross-highlights the bar chart. From this, I know that Sentiment is 75 and that Texas is in the Central District #23.   
   ![Texas selected](media/power-bi-visualization-filled-maps-choropleths/power-bi-filter.png)
2. Select a data point on the VanArsdel - Sentiment by Month line chart. This filters the filled map to show Sentiment data for VanArsdel and not their competition.  
   ![new shading](media/power-bi-visualization-filled-maps-choropleths/power-bi-vanarsdel.png)

## Considerations and troubleshooting
Map data can be ambiguous.  For example, there's a Paris, France, but there's also a Paris, Texas. Your geographic data is probably stored in separate columns – a column for city names, a column for state or province names, etc. – so Bing may not be able to tell which Paris is which. If your dataset already contains latitude and longitude data, Power BI has special fields to help make the map data unambiguous. Just drag the field that contains your latitude data into the Visualizations \> Latitude area.  And do the same for your longitude data.    

![Visualizations and Fields panes](media/power-bi-visualization-filled-maps-choropleths/pbi-latitude.png)

If you have permissions to edit the dataset in Power BI Desktop, watch this video for help with addressing map ambiguity.


If you do not have access to latitude and longitude data, but you do have edit access to the dataset, [follow these instructions to update your dataset](https://support.office.com/article/Maps-in-Power-View-8A9B2AF3-A055-4131-A327-85CC835271F7).

For more help with Map visualizations, see [Tips and tricks for map visualizations](./power-bi-map-tips-and-tricks.md).

## Next steps

[Shape map](desktop-shape-map.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)