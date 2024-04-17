---
title: Tips and Tricks for maps (including Bing Maps integration)
description: 'Tips and Tricks for Power BI Map visualizations, visuals, locations, longitude and latitude, and how they work with Bing Maps. '
author: miguelmyersMS
ms.author: miguel.myers
ms.reviewer: 'mihart'
ms.custom: video-ajTPGNpthcg
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 01/29/2024
LocalizationGroup: Visualizations
---
# Tips and tricks for Power BI map visualizations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)] 

[!INCLUDE [note-azure-maps](../includes/note-azure-maps.md)]

Power BI integrates with Bing Maps to provide default map coordinates (a process called geo-coding) so you can create maps. Together they use algorithms to identify the correct location, but sometimes it's a best guess. If Power BI tries, but can't create the map visualization on its own, it enlists the help of Bing Maps. Read more in [Bing Maps Documentation](/bingmaps).

To increase the likelihood of correct geo-coding, use the following tips. The first set of tips is for you to use if you have access to the semantic model itself. The second set of tips is things you can do in Power BI if you don't have access to the semantic model.

## What is sent to Bing Maps?

The Power BI service and Power BI Desktop send Bing the geo data it needs to create the map visualization. This data may include the data in the **Location**, **Latitude**, and **Longitude** buckets of the visual's field well. Exactly what is sent varies by map type. To learn more, see [Bing Maps privacy](https://go.microsoft.com/fwlink/?LinkID=248686).

* For maps (bubble, scatter, and dot plot maps), if latitude and longitude are provided, then no data is sent to Bing. Otherwise, any data in the **Location** bucket is sent to Bing.

* Filled maps require a field in the **Location** bucket; even if latitude and longitude are provided. Whatever data is in the **Location**, **Latitude**, or **Longitude** bucket is sent to Bing.
  
    In the following example, the field **PostalCode** is being used for geo-coding, so the values in the PostalCode column are sent to Bing. Data from the **Size** bucket isn't sent to Bing.
  
    :::image type="content" source="./media/power-bi-map-tips-and-tricks/power-bi-sent-to-bing-new.png" alt-text="Screenshot of data sent to Bing Maps.":::
  
    In this second example, the field **Territory** is being used for geo-coding, so the values in the Territory column are sent to Bing. Data from the **Legend** bucket (and the **Color saturation** bucket when you use a Shape Map in Power BI Desktop) isn't sent to Bing.
  
    :::image type="content" source="./media/power-bi-map-tips-and-tricks/power-bi-filled-map.png" alt-text="Screenshot of filled maps and Bing.":::

## In the semantic model: tips to improve the underlying semantic model

This section is for users who have access to the semantic model that is being used to create the map visualization. There are a few things you can do to increase the likelihood of correct geo-coding.

### 1. Categorize geographic fields in Power BI Desktop

In Power BI Desktop, you can ensure fields are correctly geo-coded by setting the *Data Category* on the data fields. In Data view, select the desired column. From the ribbon, select the **Column tools** tab and then set the **Data Category** to **Address**, **City**, **Continent**, **Country**, **County**, **Postal Code**, **State**, or **Province**. 

  :::image type="content" source="./media/power-bi-map-tips-and-tricks/power-bi-data-category.png" alt-text="Screenshot of data category.":::

These data categories help Bing correctly encode the data. To learn more, see [Data categorization in Power BI Desktop](../transform-model/desktop-data-categorization.md). If you're connecting to SQL Server Analysis Services using a live connection, set the data categorization outside of Power BI using [SQL Server Data Tools (SSDT)](/sql/ssdt/download-sql-server-data-tools-ssdt).

### 2. Use more than one location column

 Sometimes, even setting the data categories for mapping isn't enough for Bing to correctly guess your intent. Some designations are ambiguous because the location exists in multiple countries/regions. For example, there's a ***Southampton*** in England, Pennsylvania, and New York.

Power BI uses Bing's [unstructured URL template service](/bingmaps/rest-services/locations/find-a-location-by-address) to get the latitude and longitude coordinates based on a set of address values for any country/region. If your data doesn't contain enough location data, add those columns and categorize them appropriately.

 For example, if you only have a City column, Bing may have a hard time geo-coding. Add other geo columns to make the location unambiguous. Sometimes all it takes is adding one more location column to the semantic model - in this case state/province. And don't forget to categorize it properly. See [Tip 1](#1-categorize-geographic-fields-in-power-bi-desktop).

Make sure each field only has a single location category. For example, your City location field should be **Southampton**, not **Southampton, New York**. And Address location fields should be **1 Microsoft Way** and not **1 Microsoft Way, Redmond, WA**.

### 3. Use specific Latitude and Longitude

Add latitude and longitude values to your semantic model. This data removes any ambiguity and returns results more quickly. Latitude and Longitude fields must be in *Decimal Number* format, which you can set in the data model.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.youtube.com/embed/ajTPGNpthcg]

### 4. Use Place category for columns with full location information

While we encourage you to use geo-hierarchies in your maps, if you must use a single location column with full geographical information, you can set the data categorization to **Place**. For example, if the data in your column is full addresses, such as 1 Microsoft Way, Redmond Washington 98052, this generalized data category works best with Bing. 

## In Power BI: tips to get better results when using map visualizations

**1. Use latitude and longitude fields (if they exist)**

In Power BI, if the semantic model you're using has fields for longitude and latitude--use them. Power BI has special buckets to help make the map data unambiguous. Just drag the field that contains your latitude data into the **Visualizations > Latitude** area. And do the same for your longitude data. When you add this data, you also need to fill the *Location* field when creating your visualizations. Otherwise, the data is aggregated by default, so for example, the latitude and longitude would be paired at the state level, not the city level.

![Screenshot of latitude and longitude.](./media/power-bi-map-tips-and-tricks/power-bi-latitude.png) 

## Use geo-hierarchies so you can drill down to different "levels" of location

When your semantic model already has different levels of location data, you and your colleagues can use Power BI to create *geo-hierarchies*. To create a geo-hierarchy, drag more than one field into the **Location** bucket. Used together in this way, the fields become a geo-hierarchy. In the following example, we have geo fields for: Country/Region, State, and City. In Power BI, you and your colleagues can drill up and down using this geo-hierarchy.

  :::image type="content" source="./media/power-bi-map-tips-and-tricks/power-bi-hierarchy.png" alt-text="Screenshot of location field.":::

When drilling with geo-hierarchies, it's important to know how each drill button works and what gets sent to Bing Maps. 

:::image type="content" source="./media/power-bi-map-tips-and-tricks/power-bi-geo-hierarchy.png" alt-text="Screenshot of drill options on a map with a geo hierarchy.":::

* The Drill Mode button :::image type="icon" source="media/power-bi-map-tips-and-tricks/power-bi-drill-down.png"::: allows you to select a map Location and drill down into that specific location one level at a time. For example, if you turn on the drill-down option and select North America, you move down in the hierarchy to the next level--states in North America. For geo-coding, Power BI sends Bing Maps country/region and state data for North America only.  
* The hierarcy drill button :::image type="icon" source="media/power-bi-map-tips-and-tricks/power-bi-drill-down2.png"::: drills to the next level of the hierarchy for all locations at once. For example, if you're currently looking at countries/regions and then use this option to move to the next level, states, Power BI displays state data for all countries/regions. For geo-coding, Power BI sends Bing Maps state data (no country/region data) for all locations. This option is useful if each level of your hierarchy is unrelated to the level above it. 
* The Expand all button :::image type="icon" source="./media/power-bi-map-tips-and-tricks/power-bi-drill-down3.png":::, is similar to the drill-down option, except that you don't need to click on the map. It expands down to the next level of the hierarchy remembering the current level's context. For example, if you're currently looking at countries/regions and select this icon, you move down in the hierarchy to the next level--states. For geo-coding, Power BI sends data for each state and its corresponding country/region to help Bing Maps geocode more accurately. In most maps, you use either this option or the drill-down option on the far right, so you can send Bing as much information as possible to get accurate location information. 

## Related content

* [Drill down in a Power BI visualization.](../consumer/end-user-drill.md)

* [Power BI visualizations.](power-bi-report-visualizations.md)

More questions? [Try the Power BI Community.](https://community.powerbi.com/)
