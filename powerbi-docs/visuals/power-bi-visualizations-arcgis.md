---
title: Create an ArcGIS Map in Power BI
description: 'Create an ArcGIS map by ESRI in Power BI. ArcGIS for Power BI is a mapping visualization that helps you to enrich your data, reports, and dashboards.'
author: JulCsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 09/30/2025
ai-usage: ai-assisted
ms.custom: sample-retailanalysissample
LocalizationGroup: Visualizations
---

# Create ArcGIS maps in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

ArcGIS for Power BI is a mapping visualization that helps you enrich your data, reports, and dashboards. It offers mapping capabilities, demographic data, location analytics, and spatial analysis tools. Use these tools to show patterns and add insight to your data. Create and view ArcGIS map visualizations in the Power BI service or Power BI Desktop. For details, see [Considerations and limitations](#considerations-and-limitations). This tutorial uses Power BI Desktop.

Use ArcGIS for Power BI's mapping capabilities and smart map themes to choose the best way to show your data, highlight areas in your report, and use local demographics. These capabilities add regional context and refine the symbology to improve your report's clarity.

Combining authoritative data layers with spatial analysis helps you explore the complexities behind your Power BI data. For example, use ArcGIS for Power BI to add regional insight to sales figures. The following example shows regional sales by size by city against a demographic layer of U.S. Census average household income (dark blue shows higher income) in the selected area.

:::image type="content" source="media/power-bi-visualizations-arcgis/regional-sales-against-demographic-layer.png" alt-text="Screenshot of regional sales by size by city over a U.S. Census average household income layer (dark blue indicates higher income).":::

This demographic layer helps you see how household income and store locations affect current sales and future purchasing, advertising, and site selection.

> [!TIP]
> To learn how report consumers experience ArcGIS for Power BI, see [Interact with ArcGIS maps that are shared with you](../explore-reports/end-user-arcgis.md).
>
> For more information, go to [Esri's ArcGIS for Power BI](https://www.esri.com/powerbi):
>
> - See [ArcGIS for Power BI maps](https://doc.arcgis.com/en/power-bi/latest/workflows/arcgis-for-power-bi-user-interface.htm).
> - Get training and documentation in [Esri's ArcGIS for Power BI](https://doc.arcgis.com/en/power-bi/latest/get-started/introduction-to-arcgis-for-power-bi.htm) online help.

> [!NOTE]
> As a report designer, you can share an ArcGIS for Power BI map with a colleague who can view and interact with it. Your colleague can't save changes. You can't create an ArcGIS for Power BI map on a mobile device, but you can view and interact with it.

## User consent

Esri provides ArcGIS for Power BI. Your use of ArcGIS for Power BI is subject to Esri's [terms](https://go.microsoft.com/fwlink/?LinkID=826322) and [privacy policy](https://go.microsoft.com/fwlink/?LinkID=826323). Accept the terms in the consent dialog to use the ArcGIS for Power BI visualization. The consent dialog appears only the first time you use ArcGIS for Power BI.

## Prerequisites

Install Power BI Desktop and download the [Retail Analysis sample](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) PBIX file. Or use the Power BI service with ArcGIS for Power BI to create the map visualization.

## Create an ArcGIS for Power BI map visualization

Start by adding a new page to your report.

1. On the menu bar, select **File** > **Open report**.
1. Locate the **Retail Analysis sample PBIX file** on your local machine.
1. Open **Retail Analysis Sample** in report view :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-01.png":::.
1. Select :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-02.png"::: to add a new page to the report.

### Add a map to the report

To add a map to a report, follow these steps:

1. Select the ArcGIS for Power BI icon in the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualizations-arcgis/visualizations-pane.png" alt-text="Screenshot of the Visualizations pane showing the ArcGIS maps icon highlighted.":::

1. An Esri [user consent](#user-consent) dialog might appear the first time you use ArcGIS for Power BI. Select **OK** to continue.

   Power BI adds an empty template to the report canvas and provides an optional sign-in prompt.

   This tutorial uses the **Standard** version of ArcGIS for Power BI. However, if you sign in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/latest/get-started/sign-in.htm), you have access to more features. For details about account types, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/get-started/accounts.htm).

    :::image type="content" source="media/power-bi-visualizations-arcgis/empty-template-signin.png" alt-text="Screenshot of the sign in to ArcGIS prompt.":::

1. Select **Store** > **City** in the **Fields** pane, then drag it to the **Location** field well in the **Visualizations** pane. Optionally drag coordinate fields to the **Latitude** and **Longitude** field wells.

    :::image type="content" source="media/power-bi-visualizations-arcgis/location-field-wells.png" alt-text="Screenshot of the Visualizations pane with City in the Location field well.":::

1. Drag **Sales** > **Last Year Sales** from the **Fields** pane to the **Size** field well in the **Visualizations** pane to size the symbols.

   The map shows **Last Year Sales for U.S. Cities** with **Counts and Amounts (size)** symbols. Zoom in and pan to explore the data.

   :::image type="content" source="media/power-bi-visualizations-arcgis/last-year-sales.png" alt-text="Screenshot of a map showing last year sales sized by value for U.S. cities.":::

You've created your first ArcGIS for Power BI visualization. Next, learn how to refine and format it using basemaps, location types, themes, and more.

## Embed a map enabled ArcGIS for Power BI report

Embed a map enabled ArcGIS for Power BI report that contains private, secure, or proprietary ArcGIS data in a secure website or app. Report viewers must sign in to an ArcGIS account. For general information about embedding ArcGIS content, see [Content sharing](https://doc.arcgis.com/en/microsoft-365/latest/power-bi/embed-a-map-enabled-report.htm).

## Format an ArcGIS for Power BI visualization

To access **ArcGIS for Power BI** formatting features, in the Visualizations pane, select the **Format** tab to view the formatting options.

:::image type="content" source="media/power-bi-visualizations-arcgis/format-options.png" alt-text="Screenshot of the ArcGIS for Power BI Format pane highlighting available map formatting options.":::

ArcGIS map formatting options include:

- **Layers:** Change the Title of the **Layers** list, specify if the **Layers** list (**Show layers**) button :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png"::: is visible in the expanded Map tools, define the position of the **Layers** list, and anchor the list over the map. The **Layers** list is visible by default.
- **Map tools:** Specify if the **Zoom** tools (navigation buttons) are visible on the map, specify if the [Basemaps](#change-the-basemap) button :::image type="icon" source="media/power-bi-visualizations-arcgis/basemap.png"::: is visible in the expanded Map tools, lock the map extent in its current position, and define the position of the infographics cards on the map. **Zoom** tools and the **Basemaps** button aren't visible by default.
- **Location type:** Specify the country or region in which your data is located to improve the accuracy of locations on your map. If your data is in a single country or region, choose that country or region from the drop-down list. If your data is global, choose **World**.
- **Search:** Specify if the **Search** button :::image type="icon" source="media/power-bi-visualizations-arcgis/search.png"::: is visible in the expanded Map tools. **Search** is visible by default.

> [!NOTE]
> **Reset to default** returns all formatting options to their original configuration.

### Edit an ArcGIS for Power BI map

After you add data to the map visualization, the Map tools button :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png"::: becomes available.

> [!NOTE]
> This tutorial shows only the features and options available in the **Standard** version of ArcGIS for Power BI. If you're signed in to a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/latest/get-started/accounts.htm) with the proper licensing, you'll have access to more features.

Select the Map tools button :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png"::: to expand the tools.

:::image type="content" source="media/power-bi-visualizations-arcgis/map-tools-expand.png" alt-text="Screenshot of expanded Map tools showing buttons for Layers, Basemap, Search, Zoom, and other ArcGIS map features.":::

The map tools expand to show the available features. Each feature, when selected, opens a task pane that provides detailed options.

> [!TIP]
> Esri provides [comprehensive documentation](https://go.microsoft.com/fwlink/?LinkID=828772) about using ArcGIS for Power BI.

### Change the basemap

A basemap provides a background, or visual context, for the data in a map. For example, a basemap showing streets can provide context for your address data. The **Standard** account includes four basemaps: Dark Gray Canvas, Light Gray Canvas, OpenStreetMap, and Streets.

To change the basemap, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and then select **Basemap** :::image type="icon" source="media/power-bi-visualizations-arcgis/basemap.png"::: to display the gallery of available basemaps.

   > [!NOTE]
   > You must have **Basemaps** set to **On** in the [Visualizations pane on the Format tab](#format-an-arcgis-for-power-bi-visualization) :::image type="icon" source="media/power-bi-visualizations-arcgis/format-icon.png":::.

1. Select the **Dark Gray Canvas** basemap.

   :::image type="content" source="media/power-bi-visualizations-arcgis/basemap-pane.png" alt-text="Screenshot of the Basemap gallery displaying Dark Gray Canvas, Light Gray Canvas, OpenStreetMap, and Streets options.":::

   The map updates using the new basemap.

For more information about changing the basemap, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/workflows/choose-a-basemap.htm).

### Show map layers

In ArcGIS for Power BI, you work with geographic data through layers. Layers contain logical collections of geographic data that are used to create maps. They're also the basis for geographic analysis.

To display the **Layers** list, select :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png"::: to expand the Map tools, if necessary, and select **Layers** :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png":::.

The **Layers** list displays your data as a layer added to the basemap. Configure the layer’s dynamic options to customize how the layer’s data is displayed.

Different options appear in the menu depending on the type of data in your selected layer. For example, you can change the **Symbology** and **Location type** settings for a layer created using Power BI data, like the **City** layer you created for this tutorial, but those options aren't available for reference or drive-time layers.

:::image type="content" source="media/power-bi-visualizations-arcgis/layers-list.png" alt-text="Screenshot of the Layers list showing a data layer and the open more options menu with Symbology and Location type commands.":::

For more information about working with layers, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/workflows/layer-properties.htm).

### Specify the location type

ArcGIS for Power BI uses geo enabling technology to accurately position location data on the map and automatically render items as *points* or *boundaries* by default, based on the type of data they represent. For example, a latitude, longitude coordinate is rendered as a point on the map, whereas a city is rendered as a boundary (polygon).

Improve location accuracy by establishing the location type.

Boundaries are typically standard geographic areas, such as countries/regions, provinces, and ZIP codes. When you establish boundaries and a specific country/region for your data locations, you can then choose from a subset of related, standard boundaries, such as census tracts, districts, or municipalities. Various location types are available for each country or region.

:::image type="content" source="media/power-bi-visualizations-arcgis/location-type-us-boundaries.png" alt-text="Screenshot of the Location type dialog listing country or region selection and boundary types such as states, counties, and ZIP Codes.":::

To modify your data's location type, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Layers** :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png":::.

1. On your data layer, select **more options** and choose **Location type** from the dropdown menu.

   Accept the default values to render the locations as points on the map and select the United States.

   :::image type="content" source="media/power-bi-visualizations-arcgis/location-type-us-points.png" alt-text="Screenshot of Location type settings showing United States selected and points chosen as the default representation.":::

1. Select **Update** to save your settings.

For more information about specifying the location type, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/workflows/specify-the-location-type.htm).

### Customize the map's symbology

ArcGIS for Power BI uses values in the **Data** pane to determine how it should render locations on your map with predictive *smart mapping*. Use the **Symbology** feature to modify the default styles.

Choose a different style theme and customize the symbols and colors used to represent locations on the map. The available themes and style options depend on the values you added to the **Fields** pane.

To change a layer's symbology, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Layers** :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png":::.

1. On your data layer, select the **Symbology**, :::image type="icon" source="media/power-bi-visualizations-arcgis/symbology-icon.png"::: icon.

   The **Symbol type** dropdown appears, displaying the available symbol type themes.

#### Change the map theme

In this tutorial, because you added values to both the **Location** and **Size** fields, the map uses the **Counts and Amounts (size)** theme by default.

To change the theme, follow these steps:

1. Choose some of the other map themes to see how your map changes.

   :::image type="content" source="media/power-bi-visualizations-arcgis/style-map-theme.png" alt-text="Screenshot of the Symbol style pane displaying available map themes such as Counts and Amounts (size) and other styling choices.":::

   > [!NOTE]
   > Not all themes appear in the style pane if your selected data values don't match the options for that style.

1. For this tutorial, choose the **Size** theme.

For more information about themes, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/workflows/apply-themes-in-arcgis-for-power-bi.htm).

#### Symbol style options

Symbol styles allow you to fine-tune how data is presented on the map. The available, default symbol styles are based on the selected location type and theme. The available style options presented to you vary depending on which field wells contain values and the nature of those values.

To change the symbol style, follow these steps:

1. On the **Layers** menu, select the **Style Options** tab.

   :::image type="content" source="media/power-bi-visualizations-arcgis/style-options-hover.png" alt-text="Screenshot of hovering over Counts and Amounts (size) theme to reveal the Style options link in the Symbology pane.":::

   The Symbology library is dynamic and responds to the nature of your data and selected theme. In Symbology, change the shape, fill color, and transparency of symbols and outlines, and set a color ramp. Depending on the data and theme, classification settings—area of influence, method, classes, options to exclude null values, size range, and others—might also appear on this tab.

   For more information about the different data classification types, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/workflows/style-settings.htm).

1. Expand the **Symbology** category and select **Advanced options**.
1. Select **Fill**.
1. Change your symbol color to green by dragging the color sliders and set **Fill transparency** to 30 percent.

   This example shows the theme set to **Counts and Amounts (size)** with a green symbol set to 30 percent transparency.

   :::image type="content" source="media/power-bi-visualizations-arcgis/style-symbol-size-map.png" alt-text="Screenshot of map after applying green symbols at 30 percent fill transparency using the Counts and Amounts (size) theme.":::

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

To display the selection tools, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Selection tools** :::image type="icon" source="media/power-bi-visualizations-arcgis/select.png"::: to expand the toolset.

   There are several selection tools. The tools available in the **Selection tools** menu vary depending on the type of layer that's currently active.

   | **Tool** | **Description** |
   | --- | --- |
   | **Single select** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-08.png"::: | <ul><li>This tool is the default selection tool.</li><li>With this tool active, click a feature to select it.</li><li>Press **Ctrl** and click to add or remove multiple features one at a time.</li><li>When this tool is active, you can select data features on the map to select them and trigger interactions with other visualizations.</li><li>When this tool is active, you can select a pin or a feature on a reference layer to display its tooltip.</li></ul> |
   | **Select by rectangle** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-09.png"::: | <ul><li>With this tool active, place the cursor on the map and drag a rectangle to include multiple features within the drawn rectangle.</li><li>Press **Ctrl** and drag to add or remove multiple features from the current selection.</li><li>When this tool is active, you can't pan the map.</li><li>Press **Esc** to cancel drawing and pan the map.</li><li>To resume selecting, click a selection tool.</li></ul> |
   | **Select by circle** :::image type="icon" source="media/power-bi-visualizations-arcgis/circle-select.png"::: | <ul><li>With this tool active, place the cursor on the map to set the focus (center) point from which the circle starts and include multiple features within the circle.</li><li>Press **Ctrl** and drag to add or remove multiple features from the current selection.</li><li>When this tool is active, you can't pan the map.</li><li>Press **Esc** to cancel drawing and pan the map.</li><li>To resume selecting, click a selection tool.</li></ul> |
   | **Select by polygon** :::image type="icon" source="media/power-bi-visualizations-arcgis/polygon-select.png"::: | <ul><li>Draw polygon vertices on the map.</li><li>Double-select to finish; selects all features within the polygon boundary.</li><li>Press **Ctrl** while drawing to enable snapping.</li><li>Press **Esc** to cancel.</li><li>Select a selection tool to resume.</li></ul>**Note** A polygon needs at least three vertices. |
   | **Select by freehand polygon** :::image type="icon" source="media/power-bi-visualizations-arcgis/freehand-select.png"::: | <ul><li>With this tool active, drag a freehand shape on the map to select features within that shape.</li><li>Press **Ctrl** and drag to add or remove multiple features from the current selection.</li><li>When this tool is active, you can't pan the map.</li><li>Release the mouse (cursor) or press **Esc** to stop drawing and pan the map.</li><li>To resume selecting, click a selection tool.</li></ul> |
   | **Reference layer select** :::image type="icon" source="media/power-bi-visualizations-arcgis/reference-layer-select-icon.png"::: | <ul><li>Visible only if you added a reference layer to the map and the reference layer is the *Active layer*.</li><li>Select features by clicking areas on the reference layer.</li><li>Features that are within a delimited area on a reference layer are highlighted. Features in other areas of the map are unavailable.</li></ul> |
   | **Drive-time select** :::image type="icon" source="media/power-bi-visualizations-arcgis/drive-time-select-icon.png"::: | <ul><li>Selects data features within the defined area.</li><li>Visible only when a search area layer (buffer or drive-time area) is the Active layer.</li></ul> |
   | **Clear selection** :::image type="icon" source="media/power-bi-visualizations-arcgis/clear-selection.png"::: |  <ul><li>This tool clears all selections.</li><li>It's only active after selections have been made on the map.</li></ul> |

1. Select one or more locations or features on the map.

   You can select a maximum of 250 data points at a time. When the **Buffer/Drive Time** pane is active, map selection tools are temporarily unavailable.

For more information about selection tools, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/workflows/select-features.htm). For more information about reference layers, see [Add a reference layer](https://doc.arcgis.com/en/power-bi/latest/workflows/add-content-from-arcgis.htm). For more information about buffer or drive time areas, see [Create buffers and drive time areas](https://doc.arcgis.com/en/power-bi/latest/workflows/create-a-buffer-drive-time-layer.htm).

### Pin a location

Pin a specific address, place, or point of interest on the map. For this tutorial, you’ll search for the Pittsburgh International Airport.

To pin a location, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Search** :::image type="icon" source="media/power-bi-visualizations-arcgis/search.png"::: the **Search** pane.

1. Type the keywords *Pittsburgh international* in the search field.

    Keywords can include an address, place, or point of interest. As you type, similar recent searches or suggestions based on similar keywords appear.

1. From the results list, choose **Pittsburgh International Airport**, and select **Close**.

   A symbol appears on the map, and the map automatically zooms to the location, pinning it for the duration of your session.

> [!NOTE]
> Pins remain only for the current session; you can't save a pinned location with the map.
For more information, see [Pin a location](https://doc.arcgis.com/en/power-bi/latest/workflows/find-an-address-or-place.htm) in the ArcGIS for Power BI online help.

### Add a reference layer

When you use Power BI data to create an ArcGIS for Power BI map visualization, you're creating a *data layer*. You can then add *reference layers* that provide context to your data. For example, if your data layer shows the location of fast-food restaurants, you can add a reference layer showing the proximity of nearby schools, the consumer spending habits of the community, or the age demographic of the surrounding neighborhood.

Reference layers can consist of regional demographic data, such as income, age, and educational attainment. They can also include publicly shared feature layers available from [ArcGIS Online](https://www.esri.com/en-us/arcgis/products/arcgis-online/overview) that provide various types of information about areas surrounding the locations on your map. Reference layers add context to help you see broader patterns.

After you add a reference layer to a map, you can create a join between the reference layer and Power BI data attributes to gain more insight into your data. To learn more about joining layers, visit the [ArcGIS for Power BI help](https://doc.arcgis.com/en/power-bi/design/join-layers.htm).

#### Add a demographic layer

The Standard ArcGIS for Power BI account includes a curated selection of United States Census Bureau demographic information layers that help contextualize your data from Power BI.

To add a demographic layer, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Layers** :::image type="icon" source="media/power-bi-visualizations-arcgis/layers.png"::: to expand the toolset.

1. Select the **+ArcGIS data** tab.

   The **Add layer** pane appears, displaying the **Demographics** tab and its selection of layers.

   View these layers as a list :::image type="icon" source="media/power-bi-visualizations-arcgis/list-view.png"::: or detailed view :::image type="icon" source="media/power-bi-visualizations-arcgis/details-view.png":::

1. Scroll through the gallery, and select the layer you want to add to your map.

   For this tutorial, find the **2025 Median Household Income** layer and select the checkbox to add.

   The map updates to include the reference layer.

   :::image type="content" source="media/power-bi-visualizations-arcgis/reference-layer-demographics.png" alt-text="Screenshot of the demographic layer added to the map displaying average household income by area.":::

Demographic reference layers are interactive and show tooltips when you select areas. You can select an area to view a [tooltip](https://doc.arcgis.com/en/microsoft-365/latest/power-bi/configure-and-view-tooltips.htm) containing more information about that area. You can also [select areas on the map](https://doc.arcgis.com/en/power-bi/latest/workflows/select-features.htm) that fall within an area on the reference layer.

#### Add a reference layer from ArcGIS

ArcGIS for Power BI lets you search for publicly shared feature layers on ArcGIS. This library contains thousands of reference layers that provide information curated to enrich your data. When you sign in to ArcGIS for Power BI using a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/latest/get-started/accounts.htm), you get access to [more data content](#arcgis-for-power-bi-features) that you can share within your organization. This data content includes the authenticated and extensive library of ArcGIS content, such as the [ArcGIS Living Atlas of the World](https://livingatlas.arcgis.com/en/home/). Share this data content within your organization and your organization's groups.

> [!NOTE]
> Layers added from ArcGIS must support HTTPS.

For this tutorial, because you're using a Standard account, only publicly shared content appears in the search results.

To add an ArcGIS reference layer, follow these steps:

1. In the **Reference** pane, select the **ArcGIS** tab.
1. In the search field, type *USA Congressional districts* and press **Enter**.

   The gallery populates with several possible results.

1. Locate the **USA 117th Congressional Districts** layer, and select the check box to add.

   The map updates to include this ArcGIS public reference layer.

   :::image type="content" source="media/power-bi-visualizations-arcgis/reference-layer-arcgis.png" alt-text="Screenshot of the map with the USA 117th Congressional Districts public reference layer highlighting district boundaries.":::

ArcGIS reference layers are interactive and display tooltips for selected areas. Select an area to view a [tooltip](https://doc.arcgis.com/en/microsoft-365/latest/power-bi/configure-and-view-tooltips.htm) containing more information. You can also [select areas on the map](https://doc.arcgis.com/en/power-bi/latest/workflows/select-features.htm) that fall within an area on the reference layer.

### Find nearby locations

You can use locations on your map, including a pinned location, as a starting point to find and select nearby locations on your map. For example, if you search for a particular place of interest, you can select locations on your map that are within a specified drive time or distance (ring buffer) of that place.

In this tutorial, you use the **Pittsburgh International Airport** you pinned earlier as a starting point to find locations within 50 miles of the airport. Use similar steps to find locations within a specified *drive time*.

To find locations within a specific distance, or *ring buffer*, of the point of origin, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and select **Analysis** :::image type="icon" source="media/power-bi-visualizations-arcgis/analysis.png"::: to expand the toolset.

1. Select **Buffer/Drive-time** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-14.png":::.

   The **Buffer/Drive Time** pane appears.

1. From the **Input layer (or features)** menu, choose the starting point for the calculation.

   You can select a layer in the map, use your current location, or choose **Click to add a point** to select a location manually.

1. Choose **Click to add a point** and, on the map, select the **Pittsburgh International Airport** location you pinned earlier.

   :::image type="content" source="media/power-bi-visualizations-arcgis/add-drive-time.png" alt-text="Screenshot of the Drive Time pane with Click to add a point selected before choosing the pinned airport.":::

   > [!TIP]
   > If your map is styled using Clustering, you won't be able to select the clustered locations on the map. Choose a different theme and try again.

1. From the **Analysis type** menu in the **Buffer/Drive Time** pane, choose how the area around the point you selected is measured:

   - To use a distance-based measurement, select **Ring buffer**. Set the unit of measurement using the drop-down menu and change the distance using the text box or arrow buttons (maximum 100 miles).
   - To use a time-based measurement, select **Drive Time**. Change the amount of time using the text box or arrow buttons (maximum 30 minutes).

   For this tutorial, choose **Ring buffer** and **50** miles, and select **Run Analysis**.

   The map shows a circle surrounding the pinned airport location.

   :::image type="content" source="media/power-bi-visualizations-arcgis/drive-time-result.png" alt-text="Screenshot of the map showing a 50-mile ring buffer around the pinned Pittsburgh International Airport.":::

   The ring buffer area also appears as a layer in the **Layers** list. You can rename the layer, show or hide it :::image type="icon" source="media/power-bi-visualizations-arcgis/show-layer.png":::, change the sequence in which it's shown (to bring **Last Year Sales** to the top) by dragging items in the list of layers, or remove it from the map, as you can with each layer.

   > [!NOTE]
   > A map can contain only one search area at a time. If a search area already exists, you must delete it before you can create a new one.

1. Close the **Drive Time** pane to reactivate the map selection tools.

For more information about finding nearby locations, visit the [ArcGIS for Power BI online help](https://pro.arcgis.com/en/pro-app/latest/tool-reference/business-analyst/find-nearby-locations.htm).

### Add infographics cards

Like reference layers, infographics cards provide more details about areas on the map. Infographics cards are layered on top of the map and display specific demographic information about either the area immediately surrounding a selected location, or about the general area displayed in the current map extent. You can choose from a wide range of demographic categories, such as population details, age distribution, income levels, and more.

Infographics cards update dynamically based on the layer or feature in focus. They're configurable, and the properties for an infographics card depend on the chosen demographic category.

To add an infographics card to a map, follow these steps:

1. Select to expand the Map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png":::, if necessary, and **Analysis tools** :::image type="icon" source="media/power-bi-visualizations-arcgis/analysis.png" alt-text="Analysis."::: to expand the toolset.
1. Select **Infographics** :::image type="icon" source="media/power-bi-visualizations-arcgis/infographics-button.png":::. The **Infographics** pane appears.

   :::image type="content" source="media/power-bi-visualizations-arcgis/infographics-pane.png" alt-text="Screenshot of the Infographics pane listing demographic categories and expandable subcategories.":::

   The ArcGIS for Power BI visualization built into Power BI includes a limited number of demographics for the United States only. When you sign in to ArcGIS for Power BI using a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/latest/get-started/accounts.htm), you can choose from thousands of United States and global demographic variables.

1. Select the arrow next to a category to view the variables available for that category. For example, select **Population** to expand that category and then expand **Age 5 Year Increments** to view available subcategories.
1. For this tutorial, select **Population > (Year) Age: 5-Year Increments > (Year) Median Age**.

   An infographic appears on the map displaying **2025 Median Age** for the current extent of the map.

   :::image type="content" source="media/power-bi-visualizations-arcgis/map-infographic.png" alt-text="Screenshot of the map with an infographic card displaying 2021 median age for the current extent.":::

   > [!TIP]
   > You can also search for a demographic by name in the **Infographics** pane search field.

For more details about adding infographics cards, visit the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/workflows/add-and-manage-a-feature-information-pane.htm).

## Get help

Esri provides online help for ArcGIS for Power BI.

Access the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/get-started/introduction-to-arcgis-for-power-bi.htm) from the visualization:

1. Expand **Map tools** :::image type="icon" source="media/power-bi-visualizations-arcgis/map-tools-button.png"::: if needed, then select **Settings** :::image type="icon" source="media/power-bi-visualizations-arcgis/settings.png":::.

   :::image type="content" source="media/power-bi-visualizations-arcgis/settings-pane.png" alt-text="Screenshot of the ArcGIS for Power BI Settings pane.":::

1. In the **Settings** pane, select **Help**.
1. In the confirmation window, select **OK**.

   The [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/latest/get-started/introduction-to-arcgis-for-power-bi.htm) opens in a browser window.

   Use these resources:

   - Find answers in the [frequently asked questions](https://doc.arcgis.com/en/power-bi/latest/get-started/faqs.htm) about ArcGIS for Power BI.
   - Ask questions, get the latest information, report issues, and find answers in the Power BI [ArcGIS for Power BI community thread](https://community.powerbi.com/t5/Desktop/ArcGIS-Maps-for-Power-BI-Preview-Discussion/td-p/72947).
   - Suggest an improvement on the [Power BI Ideas list](https://ideas.powerbi.com/).

In the **Settings** pane, view dynamic map attribution for the current extent, read about the [Esri EUEI (End User Experience) program](https://doc.arcgis.com/en/power-bi/latest/get-started/euei.htm), and turn **Send usage data to Esri** on or off.

## Manage ArcGIS for Power BI in your organization

Power BI lets [designers](#designer-options), [tenant administrators](#tenant-administrator-options), and [IT administrators](#it-administrator-options) manage ArcGIS for Power BI. The next sections outline what each role does.

### Designer options

In Power BI Desktop, disable ArcGIS for Power BI on the **Security** tab. Select **File** > **Options and settings** > **Options** > **Security**. When disabled, ArcGIS doesn't load by default.

:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-17a.png" alt-text="Screenshot of designer options on the Security tab in Power BI Desktop.":::

### Tenant administrator options

In the Power BI service, turn off ArcGIS for Power BI for all users. Select **Settings** > **Admin Portal** > **Tenant settings**. When disabled, the ArcGIS for Power BI icon doesn't appear in the **Visualizations** pane.

:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-18a.png" alt-text="Screenshot of administrator tenant settings options in the Power BI service Admin portal.":::

### IT administrator options

Power BI Desktop lets you use **Group Policy** to disable ArcGIS for Power BI across your organization.

| **Attribute** | **Value** |
| --- | --- |
| Key | Software\Policies\Microsoft\Power BI Desktop |
| valueName | EnableArcGISMaps |

Set the decimal value:

- 1 to enable ArcGIS for Power BI.
- 0 to disable ArcGIS for Power BI.

## Considerations and limitations

ArcGIS for Power BI is available in these services and applications:

| Service or application | Availability |
| --- | --- |
| Power BI Desktop | Yes |
| Power BI service (powerbi.com)| Yes |
| Power BI mobile apps* | Yes |
| Power BI publish to web | Yes, if the designer is signed in with a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/latest/get-started/accounts.htm) |
| Power BI Embedded| Yes, if the designer is signed in with a valid, licensed [ArcGIS account](https://doc.arcgis.com/en/power-bi/latest/get-started/accounts.htm) |
| Power BI service embedding (powerbi.com)| No |
| Power BI Report Server| Yes, if signed in with a valid ArcGIS Enterprise account through Report Server (online environment only). Not supported in a disconnected environment or with ArcGIS Online. Using ArcGIS for Power BI with Report Server consumes ArcGIS credits. For more information, see [Understand credits](https://doc.arcgis.com/en/arcgis-online/administer/credits.htm). |

\*In mobile environments, view maps created with the ArcGIS for Power BI visual included with Power BI ([Standard account](https://doc.arcgis.com/en/power-bi/latest/get-started/accounts.htm)). Maps with premium ArcGIS content aren't supported on mobile.

In services or applications that don't support ArcGIS for Power BI, the visual shows as empty with the Power BI logo.

## ArcGIS for Power BI features

This table compares standard features for all Power BI users and features for signed-in ArcGIS users:

| Feature | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-17.png"::: Standard (included with Power BI) | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-18.png"::: :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-19.png"::: With your ArcGIS account |
| --- | --- | --- |
| **Basemaps** | Four basic basemaps | All Esri basemaps, your organization's basemaps, and any custom basemaps |
| **Geocoding** | 3,500 locations per map | 10,000 locations per map |
| | 10,000 locations per month | No monthly limit |
| **Reference layers** | 10 curated reference layers with US demographic data | Access all global web maps and layers defined by your ArcGIS organization or account. Includes [ArcGIS Living Atlas of the World](https://livingatlas.arcgis.com/en/home/) maps and layers (feature services). |
| | Publicly shared feature layers in ArcGIS | Publicly shared feature layers in ArcGIS |
| **Infographics** | Curated gallery of US demographic variables | Access all global demographic variables defined by your ArcGIS organization or account. Includes the ArcGIS GeoEnrichment data browser |
| | Up to two variables | Up to five variables |
| | Supports **Drive Time** and **Radius** settings | Supports all distance and travel settings |

## Related content

- [Interact with an ArcGIS map that has been shared with you](../explore-reports/end-user-arcgis.md)
- [ArcGIS for Power BI blog posts announcing ArcGIS for Power BI updates](https://www.esri.com/arcgis-blog/?s=#ArcGIS%20for%20Power%20BI)  
- More questions? Try asking the [Esri ArcGIS for Power BI Community](https://community.powerbi.com/t5/Desktop/ArcGIS-Maps-for-Power-BI-Preview-Discussion/td-p/72947).
- [Esri's ArcGIS Maps for Power BI documentation](https://www.esri.com/en-us/arcgis/products/arcgis-for-microsoft/get-started)
- [Esri's ArcGIS Maps for Power BI product page](https://www.esri.com/powerbi)
- [Esri's Community site for Power BI](https://geonet.esri.com/groups/powerbi)
