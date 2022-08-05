---
title: Create an ArcGIS map in Power BI
description: 'Create an ArcGIS map by ESRI in Power BI '
author: mihart
ms.author: mihart
ms.reviewer: 'willt, lukasz'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 06/29/2022
ms.custom: sample-retailanalysissample
LocalizationGroup: Visualizations
---
# Create ArcGIS maps in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

> [!NOTE]
> ArcGIS map visualizations can be created and viewed in the [Power BI service or Power BI Desktop](#considerations-and-limitations); this tutorial uses Power BI Desktop.

ArcGIS for Power BI is a mapping visualization that helps you to enrich your data, reports, and dashboards. It offers mapping capabilities, demographic data, location analytics, and spatial analysis tools that you can use to demonstrate patterns in and add insight to your data. 

With ArcGIS for Power BI’s robust mapping capabilities, you can use smart-map themes to predict the best way to illustrate your data; highlight areas in your report and use local demographics to add relevant, regional context; and refine the symbology you use to improve your report’s overall clarity. 

Combining authoritative data layers on a map with spatial analysis helps you explore the complexities behind your Power BI data. For example, you can use ArcGIS for Power BI to provide regional insight into sales figures. The example below shows regional sales by size on a per-City basis against a demographic layer of U.S. Census average household income (dark blue=higher income) in the selected area.

![image](https://user-images.githubusercontent.com/67922552/182947611-f413770a-dd4e-41d2-a88f-b99a410b1955.png "Regional sales by size compared to U.S. Census data")

This demographic data layer provides insight, for example, into how household income and store locations might affect current sales and influence future purchasing, advertising, or store site selection decisions.

> [!TIP]
> To learn more about ArcGIS for Power BI, explore [Interacting with ArcGIS maps](power-bi-visualizations-arcgis.md), and [ArcGIS for Power BI maps](https://doc.arcgis.com/en/maps-for-powerbi/use/explore-maps.htm), visit [Esri's ArcGIS for Power BI](https://www.esri.com/powerbi) for examples and testimonials, and see [Esri's ArcGIS for Power BI online help](https://doc.arcgis.com/en/maps-for-powerbi/get-started/about-maps-for-power-bi.htm) for training and documentation.

> [!NOTE]
> As a report designer, you can share an ArcGIS for Power BI map with a colleague who can view and interact with the map; however, your colleague cannot save changes to your map. Further, you currently cannot create an ArcGIS for Power BI map on a mobile device, but you can view and interact with it.

## User consent

ArcGIS for Power BI is provided by Esri ([https://www.esri.com](https://www.esri.com/)). Your use of ArcGIS for Power BI is subject to Esri's [terms](https://go.microsoft.com/fwlink/?LinkID=826322) and [privacy policy](https://go.microsoft.com/fwlink/?LinkID=826323). Power BI users who use the ArcGIS for Power BI visualization must accept the terms on the consent dialog box. This dialog box appears only the first time you use ArcGIS for Power BI.

## Prerequisites

This tutorial uses Power BI Desktop and the PBIX [Retail Analysis sample](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). You can also use the Power BI service to create a map visualization with ArcGIS for Power BI.

## Create an ArcGIS for Power BI map visualization

1. From the upper left section of the Power BI Desktop menu bar, select  **File** > **Open report**.
2. Find the  **Retail Analysis sample PBIX file**  saved on your local machine.
3. Open the  **Retail Analysis Sample**  in report view :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-01.png":::.
4. Select :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-02.png"::: to add a new page to the report.

### Add a map to the report

To add a map to a report, follow these steps:

1. Select the ArcGIS for Power BI icon from the Visualizations pane.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-02.png" alt-text="ArcGIS maps icon in Visualizations pane.":::

2. An Esri [user consent](#user-consent) pop-up may appear the first time you use ArcGIS for Power BI. Click OK to continue.
   
   Power BI adds an empty template to the report canvas and provides an optional Sign in prompt.
   
   This tutorial uses the **Standard** version of ArcGIS for Power BI. However, if you sign in to a valid, licensed [ArcGIS account](https://www.esri.com/en-us/arcgis/products/arcgis-for-power-bi/buy), you have access to more features; for details about account types, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm).

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-03.png" alt-text="ArcGIS sign in.":::

3. To begin adding data, select the **Store > City** data field on the **Fields** pane and drag it to the **Location** field well on the **Visualizations** pane. You can also drag coordinates into the appropriate **Latitude** and **Longitude** field wells.

    > [!NOTE]
    > ArcGIS for Power BI automatically detects whether the fields you've selected are best viewed as a shape or a point on a map. You can adjust these settings. See [format an ArcGIS for Power BI visualization](#format-an-arcgis-for-power-bi-visualization).

    ![image](https://user-images.githubusercontent.com/67922552/182992125-4fa659c4-d327-4840-9fef-44a4054d80eb.png "Visualizations pane with City data in the Locations field well")

4. Drag the **Sales > Last Year Sales** measure from the **Fields** pane to the **Size** field well on the **Visualizations** pane to adjust how the data is shown.

   The map now shows Last Year Sales for U.S. Cities using Counts and Amounts (size) symbols, as shown in the image below. You can zoom in to view this data visalization and pan around the map.

    ![image](https://user-images.githubusercontent.com/67922552/182951648-b4f3aeaa-c3cf-4c04-8ce3-175d5efd9679.png "Last Year Sales for U.S. Cities with Counts and Amounts symbols")

You've just created your first ArcGIS for Power BI visualization; next you'll learn how to refine and format the visualization using basemaps, location types, themes, and more.

## Format an ArcGIS for Power BI visualization

To access **ArcGIS for Power BI** formatting features, do the following:

1. In the Visualizations pane, click the **Format** tab to view the formatting options.

    ![image](https://user-images.githubusercontent.com/67922552/182972850-662d6d53-8299-4a80-8781-114867767d9b.png "Visualizations pane Format tab")

 ArcGIS for Power BI formatting options include:

  * **Layers:** Change the Title of the **Layers** list, specify if the **Layers** list (Show layers) button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-03.png"::: is visible in the expanded Map tools, define the position of the **Layers** list, and anchor the list over the map. The **Layers** list is visible by default.
  * **Map tools:** Specify if the **Zoom** tools (navigation buttons) are visible on the map, specify if the [Basemaps](#change-the-basemap) button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-05.png"::: is visible in the expanded Map tools, lock the map extent in its current position, and define the position of the infographics cards on the map. **Zoom** tools and the **Basemaps** button are not visible by default.
  * **Location type:** Specify the country in which your data is located to improve the accuracy of locations on your map. If your data is in a single country, choose that country from the drop-down list; if your data is global, choose **World**.
  * **Search:** Specify if the **Search** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-04.png"::: is visible in the expanded Map tools. **Search** is visible by default.
    
 > [!NOTE]
 > **Reset to default** returns all formatting options to their original configuration.

## Edit an ArcGIS for Power BI map

After you add data to the map visualization, the Map tools button becomes available. ![image](https://user-images.githubusercontent.com/67922552/182958308-8769520a-e2ab-4bde-8022-028bc2700fd5.png "Map tools button")


> [!NOTE]
> This tutorial shows only the features and options available in the **Standard** version of ArcGIS for Power BI. If you are signed in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm), you have access to more features.

To expand the map tools:

1. Click the Map tools button to expand the tools.

    ![image](https://user-images.githubusercontent.com/67922552/182959051-8dc29199-4402-4aec-96b4-7b9f9b4f9a6c.png "Map tools expanded")

    The map tools expand to show the available features. Each feature, when selected, opens a task pane that provides detailed options.

> [!TIP]
> Esri provides [comprehensive documentation](https://go.microsoft.com/fwlink/?LinkID=828772) about using ArcGIS for Power BI.

### Change the basemap

A basemap provides a background, or visual context, for the data in a map. For example, a basemap showing streets can provide context for your address data. Using the **Standard** account, four base maps are provided: Dark Gray Canvas, Light Gray Canvas, OpenStreetMap, and Streets.

To change the basemap, follow these steps:

1. Click to expand the Map tools, if necessary, and then click the **Basemap** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-05.png"::: to display the gallery of available basemaps.

> [!TIP]
> You must have Basemaps set to **On** in the [Visualizations pane on the Format tab](#format-an-arcgis-for-power-bi-visualization).

2. Select the **Dark Gray Canvas** basemap.

    ![image](https://user-images.githubusercontent.com/67922552/182970657-b6755fe8-b8c2-4f36-8a42-8e61746c3eb1.png "Basemap options with Dark Gray Canvas selected")

    The map updates to the new basemap.

For more information about changing the basemap, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/change-the-basemap.htm).

### Show map layers

In ArcGIS for Power BI, you work with geographic data through layers. Layers contain logical collections of geographic data that are used to create maps; they are also the basis for geographic analysis.

To display the **Layers** list, click to expand the Map tools, if necessary, and click the the **Layers** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-06.png":::.

The **Layers** list displays your data as a layer added to the basemap. You can configure the layer’s dynamic options to customize how the data in your layer is displayed. 

Different options appear in the menu depending on the type of data in your selected layer. For example, you can change the **Symbology** and **Location type** settings for a layer created using Power BI data—like the **City** layer you created for this tutorial—but those options aren't available for reference or drive-time layers.

![image](https://user-images.githubusercontent.com/67922552/182973149-ece0679e-055f-48f9-9162-47a423cff163.png "Layers list with more options menu")

For more information about working with layers, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/work-with-layers.htm).

### Specify the location type

ArcGIS for Power BI uses geoenabling technology to accurately position location data on the map and automatically render items as points or boundaries by default, based on the type of data they represent. For example, a latitude, longitude coordinate is rendered as a point on the map, whereas a city is rendered as a boundary (polygon).

You can improve how accurately different locations are rendered on the map by establishing their location type.

Boundaries are typically standard geographic areas, such as countries, provinces, and ZIP codes. When you establish boundaries and a specific country for your data locations, you can then choose from a subset of related, standard boundaries, such as census tracts, districts, or municipalities. Various location types are available for each country.

![image](https://user-images.githubusercontent.com/67922552/182973735-37e721c1-f148-489f-ba06-a6928e50b3d3.png "Available location types by region")

To modify your data's location type, follow these steps:

1. Click to expand the Map tools, if necessary, and click the **Layers** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-03.png":::.
2. On your data layer, click the **more options** button and choose **Location type** from the drop-down menu.

    ![image](https://user-images.githubusercontent.com/67922552/182974282-dd561bc1-a949-4b04-8244-7a5606d4b4c5.png "Layers options Location type selected")

    Accept the default values to render the locations as points on the map and specify **One country** and **United States**.

    ![image](https://user-images.githubusercontent.com/67922552/182974299-37c5edf7-23be-491d-87ea-137476c49c6e.png "Set location values as One country and United States")

For more information about specifying the location type, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/specify-location-type.htm).

### Customize the map's symbology

ArcGIS for Power BI uses values in the **Fields** pane to determine how it should render locations on your map with predictive *smart mapping*. Use the **Symbology** feature to modify the default styles.

You can choose a different style theme and customize the symbols and colors you use to represent locations on the map. The available themes and style options depend on the values you added to the **Fields** pane.

To change a layer's symbology, follow these steps:

1. Click to expand the Map tools, if necessary, and click the **Layers** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-03.png":::.

2. On your data layer, click the **more options** button and choose **Symbology** from the drop-down menu.

The **Symbol style** pane appears, displaying the available symbol style themes.

#### Change the theme

In this tutorial, because you added values to both the **Location** and **Size** fields, the map uses the **Counts and Amounts (size)** theme by default.

To change the theme, follow these steps:

1. Choose some of the other map themes to see how your map changes.

    ![image](https://user-images.githubusercontent.com/67922552/182976610-ee24605c-96b5-42e8-9b2f-48a672d7ea84.png "Menu of style options")

> [!NOTE]
> Not all themes appear in the style pane if your selected data values do not match the options for that style.

2. For this tutorial, choose the **Counts and Amounts (size)** theme.

For more information about themes, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/change-the-map-theme.htm).

#### Symbol style options

Symbol styles allow you to fine-tune how data is presented on the map. The available, default symbol styles are based on the selected location type and theme, and the available style options presented to you vary depending on which field wells contain values and the nature of those values.

To change the symbol style, follow these steps:

1. In the **Symbology** pane, hover over the **Counts and Amounts (size)** panel to expand the **Style options** link.

    ![image](https://user-images.githubusercontent.com/67922552/182977067-a149eff7-5331-44e1-8585-77502efb5d47.png "Hover over the pane to display the Style options link")
    
    The Symbology library is dynamic and responds to the nature of your data and selected theme. From Symbology, you can generally change the shape, fill color, and transparency of symbols and outlines and set a color ramp. Classification settings, such as area of influence, method, classes, the ability to exclude specific null values, size range, and other settings may also be visible on this tab, depending on your data and theme.
    
    Visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/classification-types.htm) for more information about the different data classification types.

2. Expand the **Symbology** category and click **Advanced options**.

3. Click **Fill**.

4. Change your symbol color to green by dragging the color sliders and set **Fill transparency** to 30 percent.

    The example below shows the theme set to **Counts and Amounts (size)** with a green symbol set to 30 percent transparency.

    ![image](https://user-images.githubusercontent.com/67922552/182977460-5bbde80f-8aaa-4bbc-88d2-ec1b10cfc4e1.png "Map with updated symbol color, style, and transparency")

5. Close the **Symbol style** pane.

## Analyze your data

ArcGIS for Power BI provides tools to help you discover patterns in your data and tell a compelling story with a map.

Analysis features include:

- [Select locations](#select-locations) to highlight data areas on the map
- Search for a [specific address](#pin-a-location), place, or point of interest
- Add a [reference layer](#add-a-reference-layer) to provide more regional context to enrich your data
- [Find locations](#find-nearby-locations) within a specified radius or drive-time area
- [Add interactive infographic cards](#add-infographics-cards) that display demographic details about the region surrounding your data

### Select locations

Choose from several tools to select locations on the map.

From the map tools, click the **Selection tools** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-07.png"::: to expand the toolset.
    
  | **Tool** | **Description** |
  | --- | --- |
  | **Single select** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-08.png"::: |  <ul><li>Click to select a single location (default tool).</li><li>Press **Ctrl** and click to add or remove locations one at a time.</li></ul> |
  | **Rectangle select** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-09.png"::: |  <ul><li>Draw a rectangle on the map to select all locations within that shape.</li><li>Press **Ctrl** and drag to add or remove locations from your selection.</li></ul> |
  | **Circle select** ![image](https://user-images.githubusercontent.com/67922552/182978664-adb1a6af-e39a-433e-b377-d644f669dccb.png "circle select") |  <ul><li>Draw a circle on the map to select all locations within that shape.</li><li>Press **Ctrl** and drag to add or remove locations from your selection.</li></ul> |
  | **Polygon select** ![image](https://user-images.githubusercontent.com/67922552/182978809-cfa03908-3056-475c-b26d-434b9b224916.png "polygon select") |  <ul><li>Click to draw points on the map. Double-click to stop drawing and complete the polygon, selecting all locations within that shape.</li><li>A minimum of three vertices are required to draw a polygon.</li><li>Press **Ctrl** while drawing to enable snapping.</li><li>Press **Esc** to cancel drawing.</li></ul> |
  | **Freehand polygon select** ![image](https://user-images.githubusercontent.com/67922552/182978956-4213b0a8-ed83-4651-914a-53bd57d90d1f.png "freehand polygon select") |  <ul><li>Draw a shape on the map to select all locations within that shape.</li><li>Press **Ctrl** and drag to add or remove locations from your selection.</li></ul> |
  | **Clear selection** ![image](https://user-images.githubusercontent.com/67922552/182979079-e891f649-97d3-4efe-9837-e4856f30e1e3.png "clear selection") |  This tool clears all selections. |
    
Use these tools to select one or more locations on the map. You can select a maximum of 250 data points at a time.

For more information about selection tools, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/select-features-on-the-map.htm).

### Pin a location

Pin a specific address, place, or point of interest on the map. For this tutorial, you'll search for the Pittsburgh International Airport.

To pin a location, follow these steps:

1. Click to expand the Map tools, if necessary, and click the **Search** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-04.png"::: to open the Search pane.

2. Type the keywords **Pittsburgh international** in the search field.

    Keywords can include an address, place, or point of interest. As you type, similar recent searches or suggestions based on similar keywords appear.

3. From the results list, choose **Pittsburgh International Airport** and click **Close**.

    A symbol appears on the map, and the map automatically zooms to the location, pinning it for the duration of your session.
    
    > [!NOTE]
    > Pins remain in place on the map only during the current session; you cannot save a pinned location with the map.

For more information about pinning a location, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/pin-locations.htm).

### Add a reference layer

When you use Power BI data to create an ArcGIS for Power BI map visualization, you create a *data layer*. You can then add *reference layers* that provide context to your data. For example, if your data layer shows the location of fast-food restaurants, you can add a reference layer showing the proximity of nearby schools, the consumer spending habits of the community, or the age demographic of the surrounding neighborhood.

Reference layers can consist of regional demographic data, such as income, age, and educational attainment; they can also include publicly shared feature layers available from [ArcGIS Online](https://www.esri.com/en-us/arcgis/products/arcgis-online/overview) that provide various types of information about areas surrounding the locations on your map. Reference layers maximize your data to provide a bigger picture.

After you add a reference layer to a map, you can create a join between the reference layer and Power BI data attributes to gain more insight into your data. Visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/join-layers.htm) to learn more about joining layers.

#### Add a demographic layer

The Standard ArcGIS for Power BI account includes a curated selection of U.S. Census Bureau demographic information data layers that help contextualize your data from Power BI.

To add a demographic layer, follow these steps:

1. Click to expand the Map tools, if necessary, and click the **Analysis tools** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-12.png"::: to expand the toolset.

2. Click the **Reference layer** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-13.png":::.

    The **Reference layer** pane appears, displaying the **Demographics** tab and its selection of layers.
    
    You can view these as a list ![image](https://user-images.githubusercontent.com/67922552/182980275-783481a0-edfb-4431-8081-a66b7dd0b85d.png "layer list") or a detailed view![image](https://user-images.githubusercontent.com/67922552/182980308-098dce42-4beb-4916-af71-bcd43b5fb12a.png "layer details").

3. Scroll through the gallery and click **Add** ![image](https://user-images.githubusercontent.com/67922552/182980346-2b4f9b80-b906-4ef2-a7ed-3b808860d09d.png "add button") on the thumbnail of the layer you want to add to your map.

    For this tutorial, find the **(Year) USA Average Household Income** layer and select **Add**.
    
    The map updates to include the reference layer.
    
    ![image](https://user-images.githubusercontent.com/67922552/182980432-44eeae84-1169-4f8d-a777-dea5f2d97a58.png "Map with added Average Household Income reference layer")
    
Demographic reference layers are interactive; click an area to view a [tooltip](https://doc.arcgis.com/en/power-bi/design/view-tooltips.htm) containing more information about that area. You can also [select areas on the map](#select-locations) that fall within an area on the reference layer.

#### Add a reference layer from ArcGIS

ArcGIS for Power BI allows you to search for publicly shared feature layers on ArcGIS. This is a library containing thousands of reference layers that provide information specifically curated to enrich your data. Further, when you sign in to ArcGIS for Power BI using a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm), you are granted access to [yet more data content](#arcgis-for-power-bi-features) to share within your organization and your organization's groups, as well as the authenticated and extensive library of ArcGIS content, such as [ArcGIS Living Atlas](https://livingatlas.arcgis.com/en/home/).

For this tutorial, because you are using a Standard account, only publicly shared content appears in the search results.

To add an ArcGIS reference layer, follow these steps:

1. In the **Reference** pane, click the **ArcGIS** tab.

2. In the search field, type *USA Congressional districts* and press **Enter**.

    The gallery populates with several possible results.

3. Locate the **USA 117th Congressional Districts (all territories)** layer and click **Add** ![image](https://user-images.githubusercontent.com/67922552/182980852-dc9ee434-0d2b-4416-8d6a-e884d06a9343.png "add button").

   The map updates to include this ArcGIS public reference layer.
    
    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-15.png" alt-text="Reference layer.":::
    
ArcGIS reference layers are interactive; click an area to view a [tooltip](https://doc.arcgis.com/en/power-bi/design/view-tooltips.htm) containing more information. You can also [select areas on the map](https://doc.arcgis.com/en/power-bi/design/select-features-on-the-map.htm) that fall within an area on the reference layer.

### Find nearby locations

You can use locations on your map—including a pinned location—as a starting point to find and select nearby locations on your map. For example, if you search for a particular place of interest, you can select locations on your map that are within a specified drive time or distance (ring buffer) of that place.

In this tutorial, you'll use the **Pittsburgh International Airport** you pinned earlier as a starting point to find locations within 50 miles of the airport. Use similar steps to find locations within a specified *drive time*.

To find locations within a specific distance (ring buffer) from the point of origin, follow these steps:

1. Click to expand the Map tools, if necessary, and click the **Analysis tools** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-12.png"::: to expand the toolset.

2. Click the **Drive-time** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-14.png":::.

    The **Drive time** pane appears.

3. From the **Choose input features** drop-down menu, choose the starting point for the calculation.
   
   You can select a layer in the map, use your current location, or choose **Click to add a point** to select a location manually.
   
4. Choose **Click to add a point** and, on the map, select the **Pittsburgh International Airport** location you pinned earlier.

   ![image](https://user-images.githubusercontent.com/67922552/182982581-1a974a5e-b090-424f-8f63-ccda3054a1c9.png "Click to add a point selected on the Drive time pane")
   
  > [!TIP]
  > If your map is styled using Clustering, you won't be able to select the clustered locations on the map; choose a different theme and try again.

5. From the **Choose analysis type** drop-down menu in the **Drive Time** pane, choose how the area around the point you selected is measured:

    - To use a distance-based measurement, select **Ring buffer**. Set the unit of measurement using the drop-down menu and change the distance using the text box or arrow buttons (maximum 100 miles).
    - To use a time-based measurement, select **Drive Time**. Change the amount of time using the text box or arrow buttons (maximum 30 minutes).
 
    For this tutorial, choose **Ring buffer** and **50** miles and click **Run Analysis**.
 
    The map shows a circle surrounding the pinned airport location.
 
    ![image](https://user-images.githubusercontent.com/67922552/182983189-59293ab1-53c4-4742-ba9d-c5cd8a1b0aa3.png "Ring buffer for pinned location")

    The ring buffer area also appears as a layer in the **Layers** list; you can rename the layer, show or hide it ![image](https://user-images.githubusercontent.com/67922552/182983325-ab5fbd07-1039-423f-8e93-50e15b377b08.png "hide button"), change the sequence in which it is shown (to bring Last Year Sales to the top) by dragging items in the list of layers, or remove it from the map, as you can with each layer.
 
 > [!NOTE]
 > A map can contain only one search area at a time. If a search area already exists, you must delete it before you can create a new one.

6. Close the **Drive Time** pane to reactivate the map selection tools.

For more information about finding nearby locations, visit the [ArcGIS for Power BI online help](https://pro.arcgis.com/en/pro-app/latest/tool-reference/business-analyst/find-nearby-locations.htm).

### Add infographics cards

Like reference layers, infographics cards provide additional details about areas on the map. Infographics cards are layered on top of the map and display specific demographic information about either the area immediately surrounding a selected location, or about the general area displayed in the current map extent. You can choose from a wide range of demographic categories, such as population details, age distribution, income levels, and more.

Infographics cards are interactive; their content updates depending on the layer or feature that has cursor focus. They are also configurable, and the properties for an infographics card depends on the chosen demographic category.

To add an infographics card to a map, follow these steps:

1. Click to expand the Map tools, if necessary, and click the **Analysis tools** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-12.png"::: to expand the toolset.

2. Click **Infographics** ![image](https://user-images.githubusercontent.com/67922552/182984183-bcb8fd53-7c59-43f6-b13c-d09036d17d10.png "infographics button"). The Infographics pane appears.

    ![image](https://user-images.githubusercontent.com/67922552/182984353-8d5410ae-c587-4d5d-9d89-a617f581211d.png "Infographics panel")

    The ArcGIS for Power BI visualization built into Power BI includes a limited number of demographics for the United States only. When you sign in to ArcGIS for Power BI using a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm), you can choose from thousands of United States and global demographic variables.

3. Click the arrow next to a category to view the variabes available for that category. For example, click **Population** to expand that category and then expand **Age 5 Year Increments** to view available sub-categories.

4. For this tutorial, click **Population > (Year) Age: 5-Year Increments > (Year) Median Age**.

    An infographic appears on the map displaying the regional Median Age for the current extent of the map.
  
    ![image](https://user-images.githubusercontent.com/67922552/182984639-e5cf0902-5562-475a-a7c5-a14d593a70f5.png "Map with regional median age demographics")
  
  > [!TIP]
  > You can also search for a demographic by name in the **Infographics** pane search field.
 
 For more details about adding infographics cards, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/maps-for-powerbi/design/add-infographics.htm).

## Get help

Esri provides comprehensive online documentation for ArcGIS for Power BI.

To access the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/get-started/about-maps-for-power-bi.htm) from the visualization, follow these steps:

1. Expand the Map tools, if necessary, and click the **Settings** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-15.png":::.

![image](https://user-images.githubusercontent.com/67922552/182987351-6c0caa33-8a36-4b83-84f4-d33f817ade34.png "ArcGIS for Power BI Settings pane")

2. In the **Settings** pane, click the **Help** button.
1. Click **OK** on the confirmation window that appears.

    The [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/get-started/about-maps-for-power-bi.htm) opens in a browser window.
    
    From Esri's content pages, you can do the following
    
    - Find answers to [frequently asked questions](https://doc.arcgis.com/en/power-bi/get-started/pbi-faq.htm) about ArcGIS for Power BI.
    - Ask questions, find the latest information, report issues, and find answers on the Power BI [community thread related to  **ArcGIS for Power BI**](https://community.powerbi.com/t5/Desktop/ArcGIS-Maps-for-Power-BI-Preview-Discussion/td-p/72947).
    - Give a suggestion for an improvement, submitting it to the [Power BI Ideas list](https://ideas.powerbi.com/).
  
On the **Settings** pane, you can also view dynamic map attribution that updates for each map extent, read about the [Esri EUEI (End User Experience) program](https://doc.arcgis.com/en/power-bi/get-started/euei-program.htm), and turn **Send usage data to Esri** on or off.
  
## Manage the use of ArcGIS for Power BI within your organization

Power BI allows designers, Power BI admins, and IT administrators to manage the use of ArcGIS for Power BI. The sections below outline the actions each role can take.

### Designer options

In Power BI Desktop, designers can disable ArcGIS for Power BI on the security tab. Click  **File**  >  **Options and settings**  and then click  **Options**  >  **Security**. When disabled, ArcGIS will not load by default.

:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-17a.png" alt-text="Designer options.":::

### Tenant admin options

On PowerBI.com, tenant administrators can turn off ArcGIS for Power BI for all users. Select **Settings** > **Admin Portal** > **Tenant settings**. When disabled, Power BI will no longer display the ArcGIS for Power BI icon in the visualizations pane.


:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-18a.png" alt-text="Administrator options.":::

### IT Administrator options

Power BI Desktop supports using **Group Policy** to disable ArcGIS for Power BI across an organization's deployed computers.

| **Attribute** | **Value** |
| --- | --- |
| Key | Software\Policies\Microsoft\Power BI Desktop |
| valueName | EnableArcGISMaps |

A value of 1 (decimal) enables ArcGIS for Power BI.

A value of 0 (decimal) disables ArcGIS for Power BI.

## Considerations and limitations

ArcGIS for Power BI is available in the following services and applications:

| Service/Application | Availability |
| --- | --- |
| Power BI Desktop | Yes |
| Power BI service (powerbi.com) | Yes |
| Power BI mobile applications\* | Yes |
| Power BI publish to web | Yes, for designers signed in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm). |
| Power BI Embedded | Yes, for designers signed in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm). |
| Power BI service embedding (powerbi.com) | No |
| Power BI Report Server | Yes, when signed in to a valid ArcGIS Enterprise account through Report Server (online environment only); not supported in a disconnected environment or with ArcGIS Online. Accessing Report Server with ArcGIS for Power BI consumes ArcGIS credits; for more information about credits, visit [Understand credits](https://doc.arcgis.com/en/arcgis-online/administer/credits.htm). |

\*In mobile environments, you can view maps created using the ArcGIS for Power BI visualization included with Power BI ([Standard account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm)). Maps that contain premium content from ArcGIS are not supported in mobile environments.

In services or applications where ArcGIS for Power BI is not available, the visualization will show as an empty visual with the Power BI logo.

##ArcGIS for Power BI features

The following table compares the standard features available to all Power BI users to those available to users signed in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm):

| Feature | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-17.png"::: Standard (included with Power BI) | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-18.png"::: :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-19.png"::: With your ArcGIS account |
| --- | --- | --- |
| Basemaps | 4 basic basemaps | All Esri basemaps plus access to your organization's basemaps, including custom basemaps |
| Geocoding | <ul><li>3,500 locations per map</li><li>10,000 locations per month</li></ul> | <ul><li>10,000 locations per map</li><li>No monthly limit</li></ul> |
| Reference layers | <ul><li>10 curated reference layers that contain U.S. demographics</li><li>Publicly shared feature layers in ArcGIS</li></ul> | <ul><li>Access to all global web maps and layers as defined by your ArcGIS organization/account; includes access to [ArcGIS Living Atlas of the World](https://livingatlas.arcgis.com/en/home/) maps and layers (feature services)</li><li>Publicly shared feature layers in ArcGIS</li></li> |
| Infographics | <ul><li>A curated gallery of U.S. demographics data variables</li><li>A maximum of two variables</li><li>Support for Drive Time and Radius settings</li></ul> | <ul><li>Access to all global demographic data variables as defined by your ArcGIS organization/account; includes access to the ArcGIS GeoEnrichment service.</li><li>A maximum of five variables.</li><li>Support for all distance and travel settings</li></ul> |

## Next steps

- [Interact with an ArcGIS map that has been shared with you](https://docs.microsoft.com/en-us/power-bi/consumer/end-user-arcgis)
- [ArcGIS for Power BI blog posts announcing ArcGIS for Power BI updates](https://www.esri.com/arcgis-blog/?s=#ArcGIS%20for%20Power%20BI)  
- More questions? Try asking the [Esri ArcGIS for Power BI Community](https://community.powerbi.com/t5/Desktop/ArcGIS-Maps-for-Power-BI-Preview-Discussion/td-p/72947)
- [Esri's ArcGIS Maps for Power BI documentation](https://www.esri.com/en-us/arcgis/products/arcgis-for-power-bi/overview)
- [Esri's ArcGIS Maps for Power BI product page](https://www.esri.com/powerbi)
- [Esri's Community site for Power BI](https://geonet.esri.com/groups/powerbi)
