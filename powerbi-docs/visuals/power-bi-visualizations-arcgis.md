---
title: Create an ArcGIS map in Power BI
description: 'Create an ArcGIS map by ESRI in Power BI. ArcGIS for Power BI is a mapping visualization that helps you to enrich your data, reports, and dashboards.'
author: miguelmyersMS
ms.author: miguel.myers
ms.reviewer: lukasz'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 04/19/2023
ms.custom: sample-retailanalysissample
LocalizationGroup: Visualizations
---

# Create ArcGIS maps in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

ArcGIS for Power BI is a mapping visualization that helps you to enrich your data, reports, and dashboards. It offers mapping capabilities, demographic data, location analytics, and spatial analysis tools. Use these tools to demonstrate patterns in and add insight to your data. You can create and view ArcGIS map visualizations in the Power BI service or Power BI Desktop. See the [Considerations and limitations](#considerations-and-limitations) section in this article for details. This tutorial uses Power BI Desktop.

With ArcGIS for Power BI's robust mapping capabilities, use smart-map themes to predict the best way to illustrate your data, highlight areas in your report and use local demographics. These capabilities add relevant regional context, and refine the symbology you use to improve your report's overall clarity.

Combining authoritative data layers on a map with spatial analysis helps you explore the complexities behind your Power BI data. For example, you can use ArcGIS for Power BI to provide regional insight into sales figures. The following example shows regional sales by size on a per-City basis against a demographic layer of US Census average household income (dark blue=higher income) in the selected area.

:::image type="content" source="media/power-bi-visualizations-arcgis/regional-sales-against-demographic-layer.png" alt-text="Screenshot shows Regional sales by size compared to US Census data.":::

This demographic data layer provides insight, for example, into how household income and store locations might affect current sales and influence future purchasing, advertising, or store site selection decisions.

> [!TIP]
> To learn about how your report consumers experience ArcGIS for Power BI, see [Interact with ArcGIS maps that has been shared with you](../consumer/end-user-arcgis.md).
>
> You can also visit the ArcGIS site, [Esri's ArcGIS for Power BI](https://www.esri.com/powerbi): 
>
>- Maps: [ArcGIS for Power BI maps](https://doc.arcgis.com/en/maps-for-powerbi/use/explore-maps.htm)
>- Training and documentation: [Esri's ArcGIS for Power BI](https://doc.arcgis.com/en/maps-for-powerbi/get-started/about-maps-for-power-bi.htm)  online help.

> [!NOTE]
> As a *report designer*, you can share an ArcGIS for Power BI map with a colleague who can view and interact with the map. Your colleague cannot save changes to your map. Further, you currently cannot create an ArcGIS for Power BI map on a mobile device, but you can view and interact with it.

## User consent

ArcGIS for Power BI is provided by [Esri](https://www.esri.com/). Your use of ArcGIS for Power BI is subject to Esri's [terms](https://go.microsoft.com/fwlink/?LinkID=826322) and [privacy policy](https://go.microsoft.com/fwlink/?LinkID=826323). Power BI users who use the ArcGIS for Power BI visualization must accept the terms on the consent dialog. This dialog appears only the first time you use ArcGIS for Power BI.

## Prerequisites

This tutorial uses Power BI Desktop and the PBIX [Retail Analysis sample](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). You can also use the Power BI service to create a map visualization with ArcGIS for Power BI.

## Create an ArcGIS for Power BI map visualization

Start by adding a new page to your report.

1. From the upper left section of the Power BI Desktop menu bar, select  **File** > **Open report**.
2. Find the  **Retail Analysis sample PBIX file**  saved on your local machine.
3. Open the  **Retail Analysis Sample**  in report view :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-01.png":::.
4. Select :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-02.png"::: to add a new page to the report.

### Add a map to the report

To add a map to a report, follow these steps:

1. Select the ArcGIS for Power BI icon in the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualizations-arcgis/visualizations-pane.png" alt-text="Screenshot shows the ArcGIS maps icon in Visualizations pane.":::

1. An Esri [user consent](#user-consent) dialog might appear the first time you use ArcGIS for Power BI. Select **OK** to continue.

   Power BI adds an empty template to the report canvas and provides an optional sign-in prompt.

   This tutorial uses the **Standard** version of ArcGIS for Power BI. However, if you sign in to a valid, licensed [ArcGIS account](https://www.esri.com/en-us/arcgis/products/arcgis-for-power-bi/buy), you have access to more features. For details about account types, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm).

    :::image type="content" source="media/power-bi-visualizations-arcgis/empty-template-signin.png" alt-text="Screenshot shows the Sign in to ArcGIS prompt.":::

1. To begin adding data, select the **Store** > **City** data field on the **Fields** pane and drag it to the **Location** field well on the **Visualizations** pane. You can also drag coordinates into the appropriate **Latitude** and **Longitude** field wells.

    :::image type="content" source="media/power-bi-visualizations-arcgis/location-field-wells.png" alt-text="Screenshot shows the Visualizations pane with City data in the Locations field well.":::

1. Drag the **Sales** > **Last Year Sales** measure from the **Fields** pane to the **Size** field well on the **Visualizations** pane to adjust how the data is shown.

   The map now shows **Last Year Sales for U.S. Cities** using **Counts and Amounts (size)** symbols, as shown in the image. You can zoom in to view this data visualization and pan around the map.

   :::image type="content" source="media/power-bi-visualizations-arcgis/last-year-sales.png" alt-text="Screenshot shows a map with sales information displayed as size.":::

You have created your first ArcGIS for Power BI visualization. Next, learn how to refine and format the visualization using basemaps, location types, themes, and more.

## Format an ArcGIS for Power BI visualization

To access **ArcGIS for Power BI** formatting features, in the Visualizations pane, select the **Format** tab to view the formatting options.

:::image type="content" source="media/power-bi-visualizations-arcgis/format-options.png" alt-text="Screenshot shows the Format icon.":::

ArcGIS map formatting options include:

* **Layers:** Change the Title of the **Layers** list, specify if the **Layers** list (**Show layers**) button :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png"::: is visible in the expanded Map tools, define the position of the **Layers** list, and anchor the list over the map. The **Layers** list is visible by default.
* **Map tools:** Specify if the **Zoom** tools (navigation buttons) are visible on the map, specify if the [Basemaps](#change-the-basemap) button :::image type="icon" source="media/power-bi-visualizations-arcgis/basemap.png"::: is visible in the expanded Map tools, lock the map extent in its current position, and define the position of the infographics cards on the map. **Zoom** tools and the **Basemaps** button aren't visible by default.
* **Location type:** Specify the country or region in which your data is located to improve the accuracy of locations on your map. If your data is in a single country or region, choose that country or region from the drop-down list. If your data is global, choose **World**.
* **Search:** Specify if the **Search** button :::image type="icon" source="media/power-bi-visualizations-arcgis/search.png"::: is visible in the expanded Map tools. **Search** is visible by default.

> [!NOTE]
> **Reset to default** returns all formatting options to their original configuration.

### Edit an ArcGIS for Power BI map

After you add data to the map visualization, the Map tools button :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png"::: becomes available.

> [!NOTE]
> This tutorial shows only the features and options available in the **Standard** version of ArcGIS for Power BI. If you're signed in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm) with the proper licensing, you'll have access to more features.

Select the Map tools button :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png"::: to expand the tools.

:::image type="content" source="media/power-bi-visualizations-arcgis/map-tools-expand.png" alt-text="Screenshot shows the Maps tool button.":::

The map tools expand to show the available features. Each feature, when selected, opens a task pane that provides detailed options.

> [!TIP]
> Esri provides [comprehensive documentation](https://go.microsoft.com/fwlink/?LinkID=828772) about using ArcGIS for Power BI.

### Change the basemap

A basemap provides a background, or visual context, for the data in a map. For example, a basemap showing streets can provide context for your address data. The **Standard** account provides four base maps: Dark Gray Canvas, Light Gray Canvas, OpenStreetMap, and Streets.

To change the basemap, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and then select **Basemap** :::image type="icon" source="media/power-bi-visualizations-arcgis/basemap.png"::: to display the gallery of available basemaps.

   > [!NOTE]
   > You must have **Basemaps** set to **On** in the [Visualizations pane on the Format tab](#format-an-arcgis-for-power-bi-visualization) :::image type="icon" source="media/power-bi-visualizations-arcgis/format-icon.png":::.

1. Select the **Dark Gray Canvas** basemap.

   :::image type="content" source="media/power-bi-visualizations-arcgis/basemap-pane.png" alt-text="Screenshot shows the Basemap selection.":::

   The map updates using the new basemap.

For more information about changing the basemap, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/change-the-basemap.htm).

### Show map layers

In ArcGIS for Power BI, you work with geographic data through layers. Layers contain logical collections of geographic data that are used to create maps. They're also the basis for geographic analysis.

To display the **Layers** list, select :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png"::: to expand the Map tools, if necessary, and select **Layers** :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png":::.

The **Layers** list displays your data as a layer added to the basemap. You can configure the layer’s dynamic options to customize how the data in your layer is displayed.

Different options appear in the menu depending on the type of data in your selected layer. For example, you can change the **Symbology** and **Location type** settings for a layer created using Power BI data, like the **City** layer you created for this tutorial, but those options aren't available for reference or drive-time layers.

:::image type="content" source="media/power-bi-visualizations-arcgis/layers-list.png" alt-text="Screenshot shows the ArcGIS Layers list with more options menu.":::

For more information about working with layers, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/work-with-layers.htm).

### Specify the location type

ArcGIS for Power BI uses geo enabling technology to accurately position location data on the map and automatically render items as *points* or *boundaries* by default, based on the type of data they represent. For example, a latitude, longitude coordinate is rendered as a point on the map, whereas a city is rendered as a boundary (polygon).

You can improve how accurately different locations are rendered on the map by establishing their location type.

Boundaries are typically standard geographic areas, such as countries/regions, provinces, and ZIP codes. When you establish boundaries and a specific country/region for your data locations, you can then choose from a subset of related, standard boundaries, such as census tracts, districts, or municipalities. Various location types are available for each country or region.

:::image type="content" source="media/power-bi-visualizations-arcgis/location-type-us-boundaries.png" alt-text="Screenshot shows available location types by region.":::

To modify your data's location type, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Layers** :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png":::.

1. On your data layer, select **more options** and choose **Location type** from the dropdown menu.

   :::image type="content" source="media/power-bi-visualizations-arcgis/layer-options.png" alt-text="Screenshot shows Layers options Location type selected.":::

   Accept the default values to render the locations as points on the map and in one country/region, the United States.

   :::image type="content" source="media/power-bi-visualizations-arcgis/location-type-us-points.png" alt-text="Screenshot shows accepting default location values.":::

1. Select **OK** to save your settings.

For more information about specifying the location type, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/specify-location-type.htm).

### Customize the map's symbology

ArcGIS for Power BI uses values in the **Fields** pane to determine how it should render locations on your map with predictive *smart mapping*. Use the **Symbology** feature to modify the default styles.

You can choose a different style theme and customize the symbols and colors you use to represent locations on the map. The available themes and style options depend on the values you added to the **Fields** pane.

To change a layer's symbology, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Layers** :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png":::.

1. On your data layer, select **more options** :::image type="icon" source="media/power-bi-visualizations-arcgis/more-options-button.png"::: and choose **Symbology** from the menu.

   The **Symbol style** pane appears, displaying the available symbol style themes.

#### Change the map theme

In this tutorial, because you added values to both the **Location** and **Size** fields, the map uses the **Counts and Amounts (size)** theme by default.

To change the theme, follow these steps:

1. Choose some of the other map themes to see how your map changes.

   :::image type="content" source="media/power-bi-visualizations-arcgis/style-map-theme.png" alt-text="Screenshot showing a menu of style options.":::

   > [!NOTE]
   > Not all themes appear in the style pane if your selected data values do not match the options for that style.

1. For this tutorial, choose the **Counts and Amounts (size)** theme.

For more information about themes, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/change-the-map-theme.htm).

#### Symbol style options

Symbol styles allow you to fine-tune how data is presented on the map. The available, default symbol styles are based on the selected location type and theme. The available style options presented to you vary depending on which field wells contain values and the nature of those values.

To change the symbol style, follow these steps:

1. In the **Symbology** pane, hover over the **Counts and Amounts (size)** panel to expand the **Style options** link.

   :::image type="content" source="media/power-bi-visualizations-arcgis/style-options-hover.png" alt-text="Screenshot shows how to hover over the pane to display the Style options link.":::

   The Symbology library is dynamic and responds to the nature of your data and selected theme. From Symbology, you can generally change the shape, fill color, and transparency of symbols and outlines and set a color ramp. Classification settings, such as area of influence, method, classes, the ability to exclude specific null values, size range, and other settings may also be visible on this tab, depending on your data and theme.

   For more information about the different data classification types, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/classification-types.htm).

1. Expand the **Symbology** category and select **Advanced options**.

1. Select **Fill**.

1. Change your symbol color to green by dragging the color sliders and set **Fill transparency** to 30 percent.

   This example shows the theme set to **Counts and Amounts (size)** with a green symbol set to 30 percent transparency.

   :::image type="content" source="media/power-bi-visualizations-arcgis/style-symbol-size-map.png" alt-text="Screenshot shows map with updated symbol color, style, and transparency.":::

1. Close the **Symbol style** pane.

## Analyze your data

ArcGIS for Power BI provides tools to help you discover patterns in your data and tell a compelling story with a map.

Analysis features include the following features:

* [Select locations](#select-locations) to highlight data areas on the map
* Search for a [specific address](#pin-a-location), place, or point of interest
* Add a [reference layer](#add-a-reference-layer) to provide more regional context to enrich your data
* [Find locations](#find-nearby-locations) within a specified radius or drive-time area
* [Add interactive infographic cards](#add-infographics-cards) that display demographic details about the region surrounding your data

### Select locations

Choose from several tools to select locations on the map.

To display the selection tools, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Selection tools** :::image type="icon" source="media/power-bi-visualizations-arcgis/select.png"::: to expand the toolset.

   There are several selection tools. The tools available in the **Selection tools** menu vary depending on the type of layer that is currently active.

   | **Tool** | **Description** |
   | --- | --- |
   | **Single select** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-08.png"::: | <ul><li>This tool is the default selection tool.</li><li>With this tool active, click a feature to select it.</li><li>Press **Ctrl** and click to add or remove multiple features one at a time.</li><li>When this tool is active, you can select data features on the map to select them and trigger interactions with other visualizations.</li><li>When this tool is active, you can select a pin or a feature on a reference layer to display its tooltip.</li></ul> |
   | **Select by rectangle** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-09.png"::: | <ul><li>With this tool active, place the cursor on the map and drag a rectangle to include multiple features within the drawn rectangle.</li><li>Press **Ctrl** and drag to add or remove multiple features from the current selection.</li><li>When this tool is active, you can't pan the map.</li><li>Press **Esc** to cancel drawing and pan the map.</li><li>To resume selecting, click a selection tool.</li></ul> |
   | **Select by circle** :::image type="icon" source="media/power-bi-visualizations-arcgis/circle-select.png"::: | <ul><li>With this tool active, place the cursor on the map to set the focus (center) point from which the circle starts and include multiple features within the circle.</li><li>Press **Ctrl** and drag to add or remove multiple features from the current selection.</li><li>When this tool is active, you can't pan the map.</li><li>Press **Esc** to cancel drawing and pan the map.</li><li>To resume selecting, click a selection tool.</li></ul> |
   | **Select by polygon** :::image type="icon" source="media/power-bi-visualizations-arcgis/polygon-select.png"::: | <ul><li>With this tool active, begin drawing the points of a polygon on the map.</li><li>Double-click to stop drawing and complete the polygon. All features within the boundaries of the polygon are selected.</li><li>Optionally, press **Ctrl** while drawing to enable snapping.</li><li>Press **Esc** to cancel drawing.</li><li>To resume selecting, click a selection tool.</li></ul>**Note** A minimum of three vertices are required to draw a polygon. |
   | **Select by freehand polygon** :::image type="icon" source="media/power-bi-visualizations-arcgis/freehand-select.png"::: | <ul><li>With this tool active, drag a freehand shape on the map to select features within that shape.</li><li>Press **Ctrl** and drag to add or remove multiple features from the current selection.</li><li>When this tool is active, you can't pan the map.</li><li>Release the mouse (cursor) or press **Esc** to stop drawing and pan the map.</li><li>To resume selecting, click a selection tool.</li></ul> |
   | **Reference layer select** :::image type="icon" source="media/power-bi-visualizations-arcgis/reference-layer-select-icon.png"::: | <ul><li>Visible only if you added a reference layer to the map and the reference layer is the *Active layer*.</li><li>Select features by clicking areas on the reference layer.</li><li>Features that are within a delimited area on a reference layer are highlighted. Features in other areas of the map are unavailable.</li></ul> |
   | **Drive-time select** :::image type="icon" source="media/power-bi-visualizations-arcgis/drive-time-select-icon.png"::: | <ul><li>This tool is used to select data features within the defined area.</li><li>Visible only if you added a search area layer (buffer or drive-time area) to your map and the search area layer is the Active layer.</li></ul> |
   | **Clear selection** :::image type="icon" source="media/power-bi-visualizations-arcgis/clear-selection.png"::: |  <ul><li>This tool clears all selections.</li><li>It's only active after selections have been made on the map.</li></ul> |

1. Select one or more locations or features on the map.

   You can select a maximum of 250 data points at a time. When the **Buffer/Drive Time** pane is active, map selection tools are temporarily unavailable.

For more information about selection tools, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/design/select-features-on-the-map.htm). For more information about reference layers, see [Add a reference layer](https://doc.arcgis.com/en/power-bi/design/add-a-reference-layer.htm). For more information about buffer or drive time areas, see [Create buffers and drive time areas](https://doc.arcgis.com/en/power-bi/design/create-buffers-and-drive-time-areas.htm).

### Pin a location

Pin a specific address, place, or point of interest on the map. For this tutorial, you’ll search for the Pittsburgh International Airport.

To pin a location, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Search** :::image type="icon" source="media/power-bi-visualizations-arcgis/search.png"::: the **Search** pane.

1. Type the keywords *Pittsburgh international* in the search field.

    Keywords can include an address, place, or point of interest. As you type, similar recent searches or suggestions based on similar keywords appear.

1. From the results list, choose **Pittsburgh International Airport** and select **Close**.

   A symbol appears on the map, and the map automatically zooms to the location, pinning it for the duration of your session.

> [!NOTE]
> Pins remain in place on the map only during the current session; you cannot save a pinned location with the map.

For more information, see [Pin a location](https://doc.arcgis.com/en/power-bi/design/pin-locations.htm) in the ArcGIS for Power BI online help.

### Add a reference layer

When you use Power BI data to create an ArcGIS for Power BI map visualization, you're creating a *data layer*. You can then add *reference layers* that provide context to your data. For example, if your data layer shows the location of fast-food restaurants, you can add a reference layer showing the proximity of nearby schools, the consumer spending habits of the community, or the age demographic of the surrounding neighborhood.

Reference layers can consist of regional demographic data, such as income, age, and educational attainment. They can also include publicly shared feature layers available from [ArcGIS Online](https://www.esri.com/en-us/arcgis/products/arcgis-online/overview) that provide various types of information about areas surrounding the locations on your map. Reference layers maximize your data to provide a bigger picture.

After you add a reference layer to a map, you can create a join between the reference layer and Power BI data attributes to gain more insight into your data. To learn more about joining layers, visit the [ArcGIS for Power BI help](https://doc.arcgis.com/en/power-bi/design/join-layers.htm).

#### Add a demographic layer

The Standard ArcGIS for Power BI account includes a curated selection of United States Census Bureau demographic information layers that help contextualize your data from Power BI.

To add a demographic layer, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Analysis tools** :::image type="icon" source="media/power-bi-visualizations-arcgis/analysis.png"::: to expand the toolset.

1. Select the **Reference layer** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-13.png":::.

   The **Reference layer** pane appears, displaying the **Demographics** tab and its selection of layers.

   You can view these layers as a list :::image type="icon" source="media/power-bi-visualizations-arcgis/list-view.png"::: or a detailed view :::image type="icon" source="media/power-bi-visualizations-arcgis/details-view.png":::

1. Scroll through the gallery and select **Add** :::image type="icon" source="media/power-bi-visualizations-arcgis/add-button.png"::: on the layer you want to add to your map.

   For this tutorial, find the **2020 USA Average Household Income** layer and select **Add** :::image type="icon" source="media/power-bi-visualizations-arcgis/add-button.png":::.

   The map updates to include the reference layer.

   :::image type="content" source="media/power-bi-visualizations-arcgis/reference-layer-demographics.png" alt-text="Screenshot shows the Demographic layer.":::

Demographic reference layers are interactive. You can select an area to view a [tooltip](https://doc.arcgis.com/en/microsoft-365/latest/power-bi/configure-and-view-tooltips.htm) containing more information about that area. You can also [select areas on the map](https://doc.arcgis.com/en/power-bi/design/select-features-on-the-map.htm) that fall within an area on the reference layer.

#### Add a reference layer from ArcGIS

ArcGIS for Power BI allows you to search for publicly shared feature layers on ArcGIS. This library contains thousands of reference layers that provide information curated to enrich your data. Further, when you sign in to ArcGIS for Power BI using a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm), you're granted access to [yet more data content](#arcgis-for-power-bi-features) which you can share within your organization. This data content includes the authenticated and extensive library of ArcGIS content, such as the [ArcGIS Living Atlas of the World](https://livingatlas.arcgis.com/en/home/). Share this data content within your organization and your organization's groups.

> [!NOTE]
> Layers added from ArcGIS must support HTTPS.

For this tutorial, because you're using a Standard account, only publicly shared content appears in the search results.

To add an ArcGIS reference layer, follow these steps:

1. In the **Reference** pane, select the **ArcGIS** tab.

1. In the search field, type *USA Congressional districts* and press **Enter**.

   The gallery populates with several possible results.

1. Locate the **USA 117th Congressional Districts** layer and select **Add** :::image type="icon" source="media/power-bi-visualizations-arcgis/add-button.png":::.

   The map updates to include this ArcGIS public reference layer.

   :::image type="content" source="media/power-bi-visualizations-arcgis/reference-layer-arcgis.png" alt-text="Screenshot shows the map with the ArcGIS public reference layer.":::

ArcGIS reference layers are interactive. Select an area to view a [tooltip](https://doc.arcgis.com/en/microsoft-365/latest/power-bi/configure-and-view-tooltips.htm) containing more information. You can also [select areas on the map](https://doc.arcgis.com/en/power-bi/design/select-features-on-the-map.htm) that fall within an area on the reference layer.

### Find nearby locations

You can use locations on your map, including a pinned location, as a starting point to find and select nearby locations on your map. For example, if you search for a particular place of interest, you can select locations on your map that are within a specified drive time or distance (ring buffer) of that place.

In this tutorial, you use the **Pittsburgh International Airport** you pinned earlier as a starting point to find locations within 50 miles of the airport. Use similar steps to find locations within a specified *drive time*.

To find locations within a specific distance, or *ring buffer*, of the point of origin, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Analysis tools** :::image type="icon" source="media/power-bi-visualizations-arcgis/analysis.png"::: to expand the toolset.

1. Select **Drive-time** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-14.png":::.

   The **Drive Time** pane appears.

1. From the **Choose input features** menu, choose the starting point for the calculation.

   You can select a layer in the map, use your current location, or choose **Click to add a point** to select a location manually.

1. Choose **Click to add a point** and, on the map, select the **Pittsburgh International Airport** location you pinned earlier.

   :::image type="content" source="media/power-bi-visualizations-arcgis/add-drive-time.png" alt-text="Screenshot shows Click to add a point selected on the Drive time pane.":::

   > [!TIP]
   > If your map is styled using Clustering, you won't be able to select the clustered locations on the map. Choose a different theme and try again.

1. From the **Choose analysis type** menu in the **Drive Time** pane, choose how the area around the point you selected is measured:

   * To use a distance-based measurement, select **Ring buffer**. Set the unit of measurement using the drop-down menu and change the distance using the text box or arrow buttons (maximum 100 miles).
   * To use a time-based measurement, select **Drive Time**. Change the amount of time using the text box or arrow buttons (maximum 30 minutes).

   For this tutorial, choose **Ring buffer** and **50** miles and select **Run Analysis**.

   The map shows a circle surrounding the pinned airport location.

   :::image type="content" source="media/power-bi-visualizations-arcgis/drive-time-result.png" alt-text="Screenshot shows ring buffer for pinned location.":::

   The ring buffer area also appears as a layer in the **Layers** list. You can rename the layer, show or hide it :::image type="icon" source="media/power-bi-visualizations-arcgis/show-layer.png":::, change the sequence in which it's shown (to bring **Last Year Sales** to the top) by dragging items in the list of layers, or remove it from the map, as you can with each layer.

   > [!NOTE]
   > A map can contain only one search area at a time. If a search area already exists, you must delete it before you can create a new one.

1. Close the **Drive Time** pane to reactivate the map selection tools.

For more information about finding nearby locations, visit the [ArcGIS for Power BI online help](https://pro.arcgis.com/en/pro-app/latest/tool-reference/business-analyst/find-nearby-locations.htm).

### Add infographics cards

Like reference layers, infographics cards provide more details about areas on the map. Infographics cards are layered on top of the map and display specific demographic information about either the area immediately surrounding a selected location, or about the general area displayed in the current map extent. You can choose from a wide range of demographic categories, such as population details, age distribution, income levels, and more. 

Infographics cards are interactive. Their content updates depending on the layer or feature that has cursor focus. They're also configurable, and the properties for an infographics card depends on the chosen demographic category.

To add an infographics card to a map, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and **Analysis tools** :::image type="icon" source="media/power-bi-visualizations-arcgis/analysis.png" alt-text="Analysis."::: to expand the toolset.

1. Select **Infographics** :::image type="icon" source="media/power-bi-visualizations-arcgis/infographics-button.png":::. The **Infographics** pane appears.

   :::image type="content" source="media/power-bi-visualizations-arcgis/infographics-pane.png" alt-text="Screenshot shows the Infographics pane.":::

   The ArcGIS for Power BI visualization built into Power BI includes a limited number of demographics for the United States only. When you sign in to ArcGIS for Power BI using a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm), you can choose from thousands of United States and global demographic variables.

1. Select the arrow next to a category to view the variables available for that category. For example, select **Population** to expand that category and then expand **Age 5 Year Increments** to view available subcategories.

1. For this tutorial, select **Population > (Year) Age: 5-Year Increments > (Year) Median Age**.

   An infographic appears on the map displaying **2021 Median Age** for the current extent of the map.

   :::image type="content" source="media/power-bi-visualizations-arcgis/map-infographic.png" alt-text="Screenshot shows a map with regional median age demographics.":::

   > [!TIP]
   > You can also search for a demographic by name in the **Infographics** pane search field.

For more details about adding infographics cards, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/maps-for-powerbi/design/add-infographics.htm).

## Get help

Esri provides comprehensive online documentation for ArcGIS for Power BI.

To access the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/get-started/about-maps-for-power-bi.htm) from the visualization, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select the Settings button :::image type="icon" source="media/power-bi-visualizations-arcgis/settings.png":::.

   :::image type="content" source="media/power-bi-visualizations-arcgis/settings-pane.png" alt-text="Screenshot shows the ArcGIS for Power BI Settings pane.":::

1. In the **Settings** pane, select the **Help** button.

1. Select **OK** on the confirmation window that appears.

   The [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/get-started/about-maps-for-power-bi.htm) opens in a browser window.

   From Esri's content pages, you can use the following resources:

   * Find answers to [frequently asked questions](https://doc.arcgis.com/en/power-bi/get-started/pbi-faq.htm) about ArcGIS for Power BI.
   * Ask questions, find the latest information, report issues, and find answers on the Power BI [community thread related to **ArcGIS for Power BI**](https://community.powerbi.com/t5/Desktop/ArcGIS-Maps-for-Power-BI-Preview-Discussion/td-p/72947).
   * Give a suggestion for an improvement, submitting it to the [Power BI Ideas list](https://ideas.powerbi.com/).

On the **Settings** pane, you can also view dynamic map attribution that updates for each map extent, read about the [Esri EUEI (End User Experience) program](https://doc.arcgis.com/en/power-bi/get-started/euei-program.htm), and turn **Send usage data to Esri** on or off.

## Manage the use of ArcGIS for Power BI within your organization

Power BI allows [designers](#designer-options), [tenant administrators](#tenant-administrator-options), and [IT administrators](#it-administrator-options) to manage their use of ArcGIS for Power BI. The next sections outline the actions each role can take.

### Designer options

In Power BI Desktop, designers can disable ArcGIS for Power BI on the security tab. Select  **File**  >  **Options and settings**  and then select  **Options**  >  **Security**. When disabled, ArcGIS doesn't load by default.

:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-17a.png" alt-text="Screenshot shows designer options.":::

### Tenant administrator options

On PowerBI.com, tenant administrators can turn off ArcGIS for Power BI for all users. Select **Settings** > **Admin Portal** > **Tenant settings**. When disabled, Power BI doesn't display the ArcGIS for Power BI icon in the visualizations pane.

:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-18a.png" alt-text="Screenshot shows administrator options in the Admin portal.":::

### IT administrator options

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
| Power BI service (powerbi.com)| Yes |
| Power BI mobile applications* | Yes |
| Power BI publish to web | Yes, for designers signed in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm) |
| Power BI Embedded| Yes, for designers signed in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm) |
| Power BI service embedding (powerbi.com)| No |
| Power BI Report Server| Yes, when signed in to a valid ArcGIS Enterprise account through Report Server (online environment only); not supported in a disconnected environment or with ArcGIS Online. Accessing Report Server with ArcGIS for Power BI consumes ArcGIS credits; for more information about credits, visit [Understand credits](https://doc.arcgis.com/en/arcgis-online/administer/credits.htm). |

\*In mobile environments, you can view maps created using the ArcGIS for Power BI visualization included with Power BI ([Standard account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm)). Maps that contain premium content from ArcGIS aren't supported in mobile environments.

In services or applications where ArcGIS for Power BI isn't available, the visualization show as an empty visual with the Power BI logo.

## ArcGIS for Power BI features

The following table compares the standard features available to all Power BI users to those features available to signed-in ArcGIS users:

| Feature | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-17.png"::: Standard (included with Power BI) | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-18.png"::: :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-19.png"::: With your ArcGIS account |
| --- | --- | --- |
| **Basemaps** | Four basic basemaps | All Esri basemaps, access to your organization's basemaps, includes any custom basemaps |
| **Geocoding** | 3,500 locations per map | 10,000 locations per map |
| | 10,000 locations per month | No monthly limit |
| **Reference layers** | 10 curated reference layers that contain US demographic data | Access to all global web maps and layers as defined by your ArcGIS organization/account. Includes access to [ArcGIS Living Atlas of the World](https://livingatlas.arcgis.com/en/home/) maps and layers (feature services) |
| | Publicly shared feature layers in ArcGIS | Publicly shared feature layers in ArcGIS |
| **Infographics** | A curated gallery of US demographic data variables | Access to all global demographic data variables as defined by your ArcGIS organization/account. Includes access to the ArcGIS GeoEnrichment data browser |
| | A maximum of two variables | A maximum of five variables |
| | Support for **Drive Time** and **Radius** settings | Support for all distance and travel settings |

## Related content

* [Interact with an ArcGIS map that has been shared with you](../consumer/end-user-arcgis.md)
* [ArcGIS for Power BI blog posts announcing ArcGIS for Power BI updates](https://www.esri.com/arcgis-blog/?s=#ArcGIS%20for%20Power%20BI)  
* More questions? Try asking the [Esri ArcGIS for Power BI Community](https://community.powerbi.com/t5/Desktop/ArcGIS-Maps-for-Power-BI-Preview-Discussion/td-p/72947)
* [Esri's ArcGIS Maps for Power BI documentation](https://www.esri.com/en-us/arcgis/products/arcgis-for-power-bi/resources) 
* [Esri's ArcGIS Maps for Power BI product page](https://www.esri.com/powerbi)
* [Esri's Community site for Power BI](https://geonet.esri.com/groups/powerbi)
