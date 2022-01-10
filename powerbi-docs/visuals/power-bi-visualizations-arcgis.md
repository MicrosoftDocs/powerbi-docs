---
title: Interacting with an ArcGIS map that has been shared with you
description: 'Using ArcGIS Map for Power BI visual in reading view as a report consumer'
author: mihart
ms.author: mihart
ms.reviewer: 'willt, lukasz'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 12/24/2021
LocalizationGroup: Visualizations
---
# Create ArcGIS maps in Power BI

[!INCLUDE[consumer-appliesto-yyyn](../includes/consumer-appliesto-yyyn.md)]    

> [!NOTE]
> These visuals can be created and viewed in both Power BI Desktop and the Power BI service. The steps and illustrations in this article are from Power BI Desktop.

This overview is written from the point of view of a person creating an ArcGIS map for Power BI. Often ArcGIS maps are used when an organization already has geo data in ArcGIS that they want to display. And although similar to Azure maps, the ArcGIS visual has some demographic reference data that is not easily available in Azure maps.  Once a _designer_ shares an ArcGIS for Power BI map with a colleague, that colleague can view and interact with the map but not save changes. To learn more about viewing an ArcGIS map, see [Explore ArcGIS for Power BI](https://doc.arcgis.com/en/power-bi/use/explore-maps.htm).

The combination of ArcGIS maps and Power BI takes mapping beyond the presentation of points on a map to a whole new level. Choose from base maps, location types, themes, symbol styles, and reference layers to create gorgeous informative map visualizations. The combination of authoritative data layers on a map with spatial analysis conveys a deeper understanding of the data in your visualization. While you cannot create an ArcGIS for Power BI map on a mobile device, you can view and interact with it.

> [!NOTE]
> ArcGIS for Power BI supports Power BI Report Server in online environments only; it isn't supported in an offline environment.

> [!TIP]
> GIS stands for Geographic Information Systems.

The example below uses a dark gray canvas to show regional sales as a heatmap against a demographic layer of 2020 USA Median Disposable Income. As you'll see as you read on, using ArcGIS for Power BI offers enhanced mapping capability, demographic data, and even-more compelling map visualizations so you can tell your best story.

:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-01.png" alt-text="ArcGIS opening image.":::

> [!TIP]
> Visit [**Esri's page on ArcGIS for Power BI**](https://www.esri.com/powerbi) to see many examples and read testimonials. Also view Esri's **[ArcGIS Maps for Power BI online](https://doc.arcgis.com/en/power-bi/get-started/about-maps-for-power-bi.htm) help**.

## User consent

ArcGIS for Power BI is provided by Esri ([https://www.esri.com](https://www.esri.com/)). Your use of ArcGIS for Power BI is subject to Esri's [terms](https://go.microsoft.com/fwlink/?LinkID=826322) and [privacy policy](https://go.microsoft.com/fwlink/?LinkID=826323). Power BI users wishing to use the ArcGIS for Power BI visual must accept the consent dialog. This dialog appears only the first time you use ArcGIS for Power BI.

## Prerequisites

This tutorial uses Power BI Desktop and the PBIX [Retail Analysis sample](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). ArcGIS for Power BI maps can also be created using the Power BI service.

1. From the upper left section of the menu bar, select  **File** > **Open report**.
2. Find the  **Retail Analysis sample PBIX file**  saved on your local machine.
3. Open the  **Retail Analysis Sample**  in report view :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-01.png":::.
4. Select :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-02.png"::: to add a new page to the report.

## Create an ArcGIS for Power BI map visualization

To add a map to a report, follow these steps:

1. Select the ArcGIS for Power BI icon from the Visualizations pane.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-02.png" alt-text="ArcGIS maps icon in Visualizations pane.":::

2. Power BI adds an empty template to the report canvas. In this overview, we'll be using the **Standard** version included with Power BI. If you sign in to a valid ArcGIS account with the proper licensing, you'll have access to more features; for details, see the [ArcGIS for Power BI online help](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm).

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-03.png" alt-text="ArcGIS sign in.":::

3. From the **Fields** pane, drag a data field to the **Location** field, or drag coordinates into the appropriate **Latitude** and/or  **Longitude**  buckets. In this example, we're using **Store > City**.

    > [!NOTE]
    > ArcGIS for Power BI automatically detects whether the fields you've selected are best viewed as a shape or a point on a map. You can adjust the default in the settings (see [format the ArcGIS for Power BI visualization](#format-the-arcgis-for-power-bi-visualization)).

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-04.png" alt-text="ArcGIS City field.":::

4. From the **Fields** pane, drag a measure to the **Size** bucket to adjust how the data is shown. In this example, we're using **Sales > Last Year Sales**.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-05.png" alt-text="ArcGIS size field.":::

You've created your first ArcGIS for Power BI map. Now, let's refine and format our map using base maps, location types, themes, and more.

## Format the ArcGIS for Power BI visualization

To access **ArcGIS for Power BI** formatting features:

1. On the Visualizations pane, click the **Format** tab to view the formatting options.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-06.png" alt-text="Format tab.":::

    ArcGIS map formatting options include:

    * **Layers:** Change the title of the Layers list (ToC), turn the layers list on or off, anchor the list over the map, define the position of the anchored list. The Layers list is on by default and is available in the expanded map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-03.png":::.
    * **Map tools:** Turn Basemaps on or off (they are off by default), lock the map extent in its current position, define the position of infographics cards on the map. Zoom in and Zoom out buttons are off by default.
    * **Location type:** Specifying the country/region in which your data is located helps to improve the accuracy of locations on your map. If your data is in a single country/region, choose the country/region from the drop-down list. If your data is global, choose World.
    * **Search:** Turn the Search function on or off, change the default color of the pin. Search is on by default and is available in the expanded map tools :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-04.png":::.

### Edit an ArcGIS for Power BI map

After you add data to the map visualization, the map tools become available.

> [!NOTE]
> This tutorial shows only the features and options available in the **Standard** version of ArcGIS for Power BI. If you're signed in to a valid [ArcGIS account](https://doc.arcgis.com/en/power-bi/get-started/account-types.htm) with the proper licensing, you'll have access to more features.

To expand the map tools:

1. Click the Map tools button to expand the tools.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-07.png" alt-text="Maps tool button.":::

The map tools expand to show the available features. Each feature, when selected, opens a task pane that provides detailed options.

> [!TIP]
> Esri provides [comprehensive documentation](https://go.microsoft.com/fwlink/?LinkID=828772) on using ArcGIS for Power BI.

#### Change the base map

A basemap provides a background, or visual context, for the data in a map. For example, a basemap showing streets can provide context for your address data. Using the **Standard** account, four base maps are provided: Dark Gray Canvas, Light Gray Canvas, OpenStreetMap, and Streets.

To change the basemap, follow these steps:

1. In the visualization's Format pane, expand the Map tools category and turn **Basemaps** on.
1. Click the **Basemap** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-05.png"::: to display the gallery.
1. Select the **Dark Gray Canvas** basemap.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-08.png" alt-text="Basemap selection.":::

    The map updates using the new basemap.

For more information, see [Change the basemap](https://doc.arcgis.com/en/power-bi/design/change-the-basemap.htm) in the ArcGIS for Power BI online help.

#### Show map layers

In ArcGIS for Power BI, you work with geographic data through layers. Layers are logical collections of geographic data that are used to create maps; they are also the basis for geographic analysis.

To display the Layers list, click the **Layers** :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-06.png"::: button in the map tools.

The Layers list displays each layer that makes up the map, and each layer has its own set of options to help you customize and work with the map. Different options appear in the menu depending on the type of layer selected; for example, you can change symbology and location type for a layer created using Power BI data—like the **City** layer you created for this example—but those options aren't available for reference or drive-time layers.

:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-09.png" alt-text="ArcGIS layers button.":::

For more information, see [Work with layers](https://doc.arcgis.com/en/power-bi/design/work-with-layers.htm) in the ArcGIS for Power BI online help.

#### Specify the location type

ArcGIS for Power BI uses its powerful geo enabling technology to accurately position location data on the map and automatically renders items as points or boundaries by default, based on the type of data. For example, a latitude-longitude coordinate is rendered as a point on the map, whereas a state field is rendered as a boundary, or polygon. You can change the way locations are rendered by specifying the location type.

Use the Location type feature to improve the accuracy of the locations on your map. You can quickly do this by choosing a country/region in the visualization's Format pane (expand the Location type category and choose the appropriate country/region), or access more options by using the full Location Type feature in the layer options pane.

The full **Location type** feature is accessible through the layer options menu and allows you to choose whether to represent your data as points or boundaries (polygons), in addition to specifying the country/region in which the data is located. Boundaries are typically defined as standard geographic areas such as countries, provinces, ZIP codes, and so on. If you choose boundaries and a specific country/region for your data locations, you can choose from a variety of standard boundaries, such as counties, census tracts, districts, or municipalities. Different location types are available for each country/region.

To modify your data's location type, follow these steps:

1. In the Layers list, select the data layer you want to work with.
2. Click the **Layer options** button and choose **Location type**.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-10.png" alt-text="Location type selection.":::

    Accept the default values to render the locations as points on the map and specify **One country > United States**.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-11.png" alt-text="Location type optional values.":::

For more information, see [Specify the location type](https://doc.arcgis.com/en/power-bi/design/specify-location-type.htm) in the ArcGIS for Power BI online help.

#### Customize the map's symbology

ArcGIS for Power BI uses values in the Fields pane to intelligently determine how it should render locations on the map. The **Symbology** feature allows you to modify the default styling to better tell your story. You can choose a different map theme and customize the symbols and colors used to represent locations on the map. Different map themes and styling options are available, depending on the values you added to the map visual's Fields pane.

To change a layer's symbology, follow these steps:

1. In the Layers list, select the data layer you want to work with.

2. Click the **Layer options** button and choose **Symbology**.

The Symbology pane appears, with the Map theme category expanded.

##### Change the map theme

In this example, because we added values to both the **Location** and **Size** fields, the map uses the **Size** theme by default.

To change the map theme, follow these steps:

1. Choose some of the other map themes to see how your map changes.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-12.png" alt-text="Screenshot showing map themes.":::

2. Choose the **Size** theme.

For detailed information, see [Change the map theme](https://doc.arcgis.com/en/power-bi/design/change-the-map-theme.htm) in the ArcGIS for Power BI online help.

##### Layer transparency

If your map contains several layers, it can be useful to render layers with some level of transparency so that items on other layers are still visible.

To set the transparency value for the layer, follow these steps:

1. In the **Symbology** pane, expand the **Transparency** category.

2. Type a percentage in the text box or move the slider to the left (less transparent) or to the right (more transparent).

##### Symbol style

Symbol styles allow you to fine-tune how data is presented on the map. Default symbol styles are based on the selected Location type and Map theme, and the available styling options are different depending on which field wells contain values and the nature of those values.

To change the symbol style, follow these steps:

1. In the **Symbology** pane, expand the **Symbol style** category.

2. Change the symbol settings as desired. Choose a symbol shape, color, transparency, and outline color, thickness, and transparency. Expand the Symbol size category to change those options; different options appear depending on the nature of your data and the selected map theme.

    The example below shows the map theme set to  **Size**  and several symbol style adjustments to transparency, style, and size.

    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-13.png" alt-text="Map size and symbols.":::

3. When you're done setting styling options, close the Symbology pane.

### Analyze your data

ArcGIS for Power BI provides several tools that allow you to discover patterns in your data and tell a compelling story with a map.

Analysis features include:

- Selecting locations on the map
- Searching for a specific address, place, or point of interest
- Adding a reference layer to provide more context
- Finding locations within a specified radius or drive-time area
- Adding cards that display demographic details about the area displayed on the map

#### Select locations

ArcGIS for Power BI provides several different selection tools to help you select locations on the map. Different tools appear, depending on the type of layer currently selected in the Layers list.

To display the selection tools, follow these steps:

1. From the map tools, click the **Selection tools** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-07.png"::: to expand the toolset.

    There are four selection tools available; different tools may appear in the  **Selection tools**  menu, depending on the type of layer that is currently active. Because the map in this example contains only a data layer, only the **Single select** and **Box select** tools appear.
    
    | **Tool** | **Description** |
    | --- | --- |
    | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-08.png"::: | **Single select** —This is a single-selection tool that can be used to click individual locations; it is the default selection tool. Press Ctrl and click to select multiple locations.Clicking data locations on the map selects them and triggers interactions with other visualizations.Clicking a pin or a location on a reference layer displays its tooltip. |
    | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-09.png"::: | **Box select** —Drag a rectangle selector to select multiple locations or select individual locations by clicking them.As with the Select tool, clicking a pin or a location on a reference layer displays its tooltip.When the Box select tool is active, you cannot pan the map. |
    | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-10.png"::: | **Reference layer select** —If you added a [reference layer](https://doc.arcgis.com/en/maps-for-powerbi/design/add-a-reference-layer.htm) to the map, use this tool to select locations by clicking areas on the reference layer. Locations that are within a delimited area on a reference are highlighted; locations in other areas of the map are unavailable.This tool appears only if the map contains one or more reference layers and a reference layer is currently active. |
    | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-11.png"::: | **Drive-time select** —If you added a [drive-time area](https://doc.arcgis.com/en/maps-for-powerbi/design/find-nearby-locations.htm) to your map, use the drive-time area selection tool to select data locations within the defined area. |
    
2. Select one or more locations on the map. You can select a maximum of 250 data points at a time.

For more information, see [Select locations on a map](https://doc.arcgis.com/en/power-bi/design/select-features-on-the-map.htm) in the ArcGIS for Power BI online help.

#### Pin a location

Pin a specific address, place, or point of interest on the map. For this example, you'll search for the Pittsburgh International Airport.

To pin a location, follow these steps:

1. From the map tools, click the **Search** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-04.png"::: to open the Search pane.

1. Type the keywords **Pittsburgh international** in the search box.

    Keywords can include an address, place, or point of interest. As you type, similar recent searches or suggestions based on similar keywords appear.

1. From the results list, choose **Pittsburgh International Airport** and click **Close**.

    A symbol appears on the map, and the map automatically zooms to the location. Pins remain in place on the map only during the current session; you cannot save a pinned location with the map. The pinned location also appears as a layer in the Layers list; you can rename the layer, show or hide it, or remove it from the map, as you can with other layers.

1. To change the color of the pin, expand the **Search** category in the map visual's **Format** pane and choose a new color.

> [!NOTE]
> The **Search** feature replaces the Pins feature previously available in ArcGIS for Power BI.

For more information, see [Pin a location](https://doc.arcgis.com/en/power-bi/design/pin-locations.htm) in the ArcGIS for Power BI online help.

#### Add a reference layer

Reference layers provide context for the Power BI data you're already displaying on a map. Reference layers can include demographic data, such as household income, age, or education. They can also include publicly shared feature layers available on ArcGIS Online that provide more information about areas surrounding the locations on your map.

##### Add a demographic layer

The Standard ArcGIS for Power BI account includes a curated selection of U.S. demographic layers that help contextualize data from Power BI.

To add a demographic layer, follow these steps:

1. From the map tools, click the **Analysis tools** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-12.png"::: to expand the toolset.

1. Click the **Reference layer** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-13.png":::.

    The **Reference layer** pane appears, displaying the **Demographics** tab and its selection of layers.

1. Scroll through the gallery and click **Add** on the thumbnail of the layer you want to add to your map.

    For this example, find the **2020 USA Average Household Income** layer and select **Add**.
    
    The map updates to show the new layer.
    
    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-14.png" alt-text="Demographic layer.":::
    
Demographic reference layers are interactive; click an area to view a tooltip containing more information. You can also use the **Reference select** tool to [select areas on the map](https://doc.arcgis.com/en/power-bi/design/select-features-on-the-map.htm) that fall within an area on the reference layer.

##### Add a reference layer from ArcGIS

ArcGIS for Power BI allows you to search for publicly shared feature layers on ArcGIS, giving you access to thousands of reference layers that provide information about the areas surrounding the locations on your data layer. When you sign in to ArcGIS for Power BI using a valid ArcGIS account, you can search for content in your organization, your organization's groups, or public content. In this example, because you're using the Standard account, only publicly shared content appears in search results.

To add an ArcGIS reference layer, follow these steps:

1. In the Reference pane, click the **ArcGIS** tab.

2. In the search field, type *USA Congressional districts* and press **Enter**.

    The gallery populates with several possible results.

3. Locate the **USA 117th Congressional Districts (all territories)** layer and select **Add**.

    The map updates to show the new layer.
    
    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-15.png" alt-text="Reference layer.":::
    
ArcGIS reference layers are interactive; click an area to view a tooltip containing more information. You can also use the **Reference select** tool to [select areas on the map](https://doc.arcgis.com/en/power-bi/design/select-features-on-the-map.htm) that fall within an area on the reference layer.

#### Find nearby locations

You can use locations on your map—including a pinned location—as a starting point to find and select nearby locations on your map. For example, if you search for a particular place of interest, you can select locations on your map that are within a specified driving time or distance from that place.

In this example, you'll use the Pittsburgh International Airport you pinned earlier as a starting point to find locations within 100 miles of the airport. Use similar steps to find locations within a specified drive time.

To find locations within a specific driving distance from the point of origin, follow these steps:

1. From the map tools, click the **Analysis tools** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-12.png"::: to expand the toolset.

1. Click the **Drive-time** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-14.png":::.

    The **Drive time** pane appears.

1. Click the single select tool and, on the map, select the **Pittsburgh International Airport** location you pinned earlier.
1. From the **Search area** drop-down menu, choose **Radius** and specify a distance of **100** miles.
1. Click **OK**.

    The map shows a circle surrounding the pinned airport location. The Drive time pane expands to show styling options for the driving distance area.
    
    :::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-16.png" alt-text="Find nearby locations.":::
    
    The driving distance area also appears as a layer in the Layers list; you can rename the layer, show or hide it, or remove it from the map, as you can with other layers.

1. With the drive-time layer active in the Layers list, use the Drive-time select tool to click the driving distance area.

    Locations that fall within the search area are selected; unselected locations on the map appear smaller or become more transparent. Other visualizations are updated to reflect the selected locations.

For more information, see [Find nearby locations](https://doc.arcgis.com/en/power-bi/design/find-nearby-locations.htm) in the ArcGIS for Power BI online help.

#### Add infographics cards

Like reference layers, infographics cards provide additional details about areas on the map. Infographics cards lay on top of the map and display specific demographic information about either the area immediately surrounding a selected location, or about the general area displayed in the current map extent. For detailed information, see [Add infographics cards](https://doc.arcgis.com/en/power-bi/design/add-infographics.htm) in the ArcGIS for Power BI online help.

### Get help

Esri provides comprehensive online documentation on ArcGIS for Power BI.

To access the ArcGIS for Power BI online help from the visualization, follow these steps:

1. From the map tools, click the **Settings** button :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-15.png":::.

1. On the **Settings** pane, click the **Help** button.
1. Click **OK** on the confirmation window that appears.

    The ArcGIS for Power BI online help opens in a browser window.
    
    - Find answers to [frequently asked questions](https://doc.arcgis.com/en/power-bi/get-started/pbi-faq.htm#anchor5) on ArcGIS for Power BI online help.
    - You can ask questions, find the latest information, report issues, and find answers on the Power BI [community thread related to  **ArcGIS for Power BI**](https://go.microsoft.com/fwlink/?LinkID=828771).
    
### Manage the use of ArcGIS for Power BI within your organization

Power BI allows designers, Power BI admins, and user administrators to manage the use of ArcGIS for Power BI. The sections below outline the actions each role can take.

#### Designer options

In Power BI Desktop, designers can disable ArcGIS for Power BI on the security tab. Select  **File**  >  **Options and settings**  and then select  **Options**  >  **Security**. When disabled, ArcGIS will not load by default.

:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-17a.png" alt-text="Designer options.":::

#### Administrator options

In the Power BI service, administrators can turn off ArcGIS for Power BI for all users. Select **Settings** > **Admin Portal** > **Tenant settings**. When disabled, Power BI will no longer display the ArcGIS for Power BI icon in the visualizations pane.


:::image type="content" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-18a.png" alt-text="Administrator options.":::

#### User Administrator options

Power BI Desktop supports using **Group Policy** to disable ArcGIS for Power BI across an organization's deployed computers.

For Power BI Desktop

| **Attribute** | **Value** |
| --- | --- |
| Key | Software\Policies\Microsoft\Power BI Desktop |
| valueName | EnableArcGISMaps |

For Power BI Desktop (Optimized for Power BI Report Server)

| **Attribute** | **Value** |
| --- | --- |
| Key | Software\Policies\Microsoft\Microsoft Power BI Desktop SSRS |
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
| Power BI publish to web | Yes, for designers signed in to a valid ArcGIS account with the appropriate add-on license. Consumers do not need the add-on license to view published content. |
| Power BI Embedded | Yes, for designers signed in to a valid ArcGIS account with the appropriate add-on license. Consumers do not need the add-on license to view published content. |
| Power BI service embedding (powerbi.com) | No |
| Power BI Report Server | Yes, in online environments only; not supported in a disconnected environment. |

\*In mobile environments, you can view maps created using the ArcGIS for Power BI visualization included with Power BI ([Standard account](https://doc.arcgis.com/en/maps-for-powerbi/get-started/account-types.htm)). Maps that contain premium content from ArcGIS are not supported in mobile environments.

In services or applications where ArcGIS for Power BI is not available, the visualization will show as an empty visual with the Power BI logo.

The following table compares the standard features available to all Power BI users to those available to signed-in ArcGIS users:

| :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-17.png"::: Standard (included with Power BI) | :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-18.png"::: :::image type="icon" source="media/power-bi-visualizations-arcgis/arcgis-tutorial-icon-19.png"::: With your ArcGIS account |
| --- | --- |
| Basemaps |
| 4 basic basemaps | All Esri basemaps plus access to your organization's basemaps, including custom basemaps |
| Geocoding |
| 3,500 locations per map | 10,000 locations per map |
| 10,000 locations per month | No monthly limit |
| Reference layers |
| 10 reference layers that contain U.S. demographics | Access to all web maps and layers from your ArcGIS organization |
| Publicly shared feature layers in ArcGIS | Publicly shared feature layers in ArcGIS |
| Access to ArcGIS Living Atlas of the World maps and layers (feature services) |
| Infographics |
| Curated gallery of U.S. demographics variables (7 categories) | Full access to the ArcGIS GeoEnrichment data browser, including U.S. and global demographics variables |

## Next steps

- [Interacting with an ArcGIS map that has been shared with you](https://doc.arcgis.com/en/power-bi/use/explore-maps.htm)
- [Blog posts announcing ArcGIS for Power BI](https://www.esri.com/arcgis-blog/?s=#ArcGIS%20for%20Power%20BI) updates
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
