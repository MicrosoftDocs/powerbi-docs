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
ms.date: 05/17/2023
ms.custom: sample-Sales-and-Marketing
LocalizationGroup: Visualizations
---

# Create and use filled maps (choropleth maps) in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

[!INCLUDE [note-azure-maps](../includes/note-azure-maps.md)]

A filled, or *choropleth*, map uses shading or tinting or patterns to display how a value differs in proportion across a geography or region. You can quickly display relative differences with shading that ranges from light (less frequent/lower) to dark (more frequent/more).

:::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/large-map.png" alt-text="Screenshot of map of the United States.":::

## What is sent to Bing?

Power BI integrates with Bing to provide default map coordinates (a process called geo-coding). When you create a map visualization in Power BI service or Power BI Desktop, the data in the **Location**, **Latitude**, and **Longitude** buckets (that is being used to create that visualization) is sent to Bing.

You, or your administrator, may need to update your firewall to allow access to the URLs Bing uses for geocoding.  Those URLs are:

- https://dev.virtualearth.net/REST/V1/Locations    
- https://platform.bing.com/geo/spatial/v1/public/Geodata 
- https://www.bing.com/api/maps/mapcontrol

For more information about the data being sent to Bing, and for tips to increase your geo-coding success, see [Tips and tricks for map visualizations](power-bi-map-tips-and-tricks.md).

## When to use a filled map

Filled maps are a great choice:

- to display quantitative information on a map.
- to show spatial patterns and relationships.
- when your data is standardized.
- when working with socioeconomic data.
- when defined regions are important.
- to get an overview of the distribution across the geographic locations.

### Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Sales and Marketing Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix) to your desktop.

2. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

3. Browse to the **Sales and Marketing Sample PBIX** file, then select **Open**.

4. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.
 
5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the built-in Sales and Marketing Sample in the Power BI service.

1. Open the Power BI service, then select on **Get data** in the bottom left corner.

2. On the Get Data page that appears, select **Samples**.

   :::image type="content" source="media/power-bi-visualization-slicers/get-data-samples.png" alt-text="Screenshot of Get Data box with link to samples.":::

3. Select the **Sales and Marketing Sample**, and choose **Connect**.

4. Select **Edit** on the menu bar to display the **Visualizations** pane.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

### Create a filled map

1. From the Fields pane, select the **Geo** \> **State** field.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-state.png" alt-text="Screenshot of Fields pane with State field selected.":::

1. Select the **Filled map** icon to [convert the chart](power-bi-report-change-visualization-type.md) to a filled map. Notice that **State** is now in the **Location** well. Bing Maps uses the field in the **Location** well to create the map.  The location can be various valid locations: countries/regions, states, counties, cities, zip codes, or other postal codes etc. Bing Maps provides filled map shapes for locations around the world. Without a valid entry in the Location well, Power BI can't create the filled map.  

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-filled-map-icon.png" alt-text="Screenshot of the Filled map icon selected.":::

1. Filter the map to display only the continental United States.

   a.  To the left of the Visualizations pane, look for the **Filters** pane. Expand it if it's minimized

   b.  Hover over **State** and select the expand chevron.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-state-hover.png" alt-text="Screenshot of Filters pane showing State(All) selected.":::

   c.  Place a check mark next to **Select all** and remove the check mark next to **AK**.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-continental.png" alt-text="Screenshot of Filters pane showing State dropdown with All selected and AK not selected.":::

1. Select the paint brush icon to open the Formatting pane, and choose **Fill colors**.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-colors.png" alt-text="Screenshot of Formatting pane showing Fill colors option.":::

1. Next to the **Default** color, select **fx**.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-fx.png" alt-text="Screenshot of Fill colors conditional formatting button.":::

1. Use the **Default colors - Fill colors** screen to determine how your filled map will be shaded. The options available to you include which field to base the shading on, and how to apply the shading. In this example we're using the field **SalesFact** > **Sentiment**, and setting the lowest value for sentiment to red and the highest value to green. Values that fall between the maximum and minimum will be shades of red and green. The illustration at the bottom of the screen shows the range of colors that will be used. 

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-sentiment.png" alt-text="Screenshot of Default color pane with Sentiment selected.":::

1. The filled map is shaded in red and green, with red representing the lower sentiment numbers and green representing the higher, more-positive sentiment.  To display more detail, drag a field into the Tooltips well.  Here we've added **SalesFact** > **Sentiment gap**. Highlighting the state of Idaho (ID) shows us that sentiment gap is low, at 6.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-idaho.png" alt-text="Screenshot of Filled map showing Idaho tooltips.":::

1. Save the report.

Power BI gives you plenty of control over the appearance of your filled map. Play around with these data color controls until you get the look you want. 

## Highlighting and cross-filtering

For information about using the Filters pane, see [Add a filter to a report](../create-reports/power-bi-report-add-filter.md).

Highlighting a location in a filled map cross-filters the other visualizations on the report page... and vice versa.

1. To follow along, first save this report by selecting **File > Save**.

1. Copy the filled map using CTRL-C.

1. From the bottom of the report canvas, select the **Sentiment** tab to open the Sentiment report page.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-sentiment-tab.png" alt-text="Screenshot of Sentiment tab selected.":::

1. Move and resize the visualizations on the page to make some room, then CTRL-V paste the filled map from the previous report. (See the following images)

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-map.png" alt-text="Screenshot of Filled map added to Sentiment page.":::

1. On the filled map, select a state to cross-highlight and cross-filter the other visualizations on the page. When you select **Texas**, for example, it cross-filters the cards and cross-highlights the bar chart. As a result, you can see that **Sentiment** is **75** and that Texas is in the **Central District #23**.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-filter.png" alt-text="Screenshot of map showing Texas selected.":::

1. Select a data point on the VanArsdel - Sentiment by Month line chart, which filters the filled map to show Sentiment data for VanArsdel and not their competition.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-vanarsdel.png" alt-text="Screenshot showing new shading.":::

## Considerations and troubleshooting

Map data can be ambiguous.  For example, there's a Paris, France, but there's also a Paris, Texas. Your geographic data is probably stored in separate columns&mdash;for example, a column for city names and a column for state or province names&mdash;so Bing may not be able to tell which Paris is which. If your dataset already contains latitude and longitude data, Power BI has special fields to help make the map data unambiguous. Just drag the field that contains your latitude data into the Visualizations \> Latitude area.  And do the same for your longitude data.    

:::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-latitude.png" alt-text="Screenshot of Visualizations and Fields panes.":::

If you don't have access to latitude and longitude data, but you do have edit access to the dataset, [follow these instructions to update your dataset](https://support.office.com/article/Maps-in-Power-View-8A9B2AF3-A055-4131-A327-85CC835271F7).

For more help with Map visualizations, see [Tips and tricks for map visualizations](./power-bi-map-tips-and-tricks.md).

## Next steps

[Shape map](desktop-shape-map.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)