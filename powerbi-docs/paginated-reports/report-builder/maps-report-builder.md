---
title: "Maps in a Power BI paginated report | Microsoft Docs"
description: Get acquainted with how to add a map to your paginated report showing business data against a geographical background in your paginated report in Power BI Report Builder. 
ms.date: 02/13/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: JulCsc
ms.author: juliacawthra
ms.reviewer: monaraya
---
# Maps in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]


  

> [!IMPORTANT]
> Following the [announcement that Bing Maps will be deprecated by June 2028](https://blogs.bing.com/maps/2024-05/Microsoft-Announces-Vision-for-Next-Generation-of-Enterprise-Maps), the migration of paginated reports map visuals from Bing Maps to Azure Maps has begun. This migration will occur in two phases: first, migrating to Azure Maps in PBIRB, followed by migration to Azure Maps for paginated reports in the service. The initial phase is complete. Beginning with the September release of PBIRB, users can create map visuals powered by Azure Maps by default. However, paginated reports published in the service will continue to use Bing Maps until phase two is completed.
> Paginated reports authors can revert back to Bing Maps for authoring in PBIRB until both phases are complete. To enable this, users must set the “RevertToBingMaps” registry key located in the “Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Power BI Report Builder” folder to 1. If the “Microsoft Power BI Report Builder” folder does not exist, it should be manually created before setting the registry key.
> 
To visualize business data against a geographical background, you can add a map to your Power BI paginated report. The type of map that you select depends on what information that you want to communicate in your report. You can add a map that displays locations only, or a bubble map that varies bubble size based on number of households for an area, or a marker map that varies marker style based on the most profitable product for each store, or a line map that displays routes between stores.  

 A map contains a title, a viewport that specifies the center point and scale, an optional Bing or Azure map tile background for the viewport, one or more layers that display spatial data, and a variety of legends that help users interpret the data visualizations. The following illustration shows the basic parts of a map.  

 ![Screenshot showing how to add legend color scale and associated elements.](../media/paginated-reports-maps/map-elements.png "Screenshot showing how to add legend color scale and associated elements.")
  
 To start to use a map immediately, see [Tutorial: Map Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-map-report-report-builder) or [Report Samples (Power BI Report Builder)](https://go.microsoft.com/fwlink/?LinkId=198283).  
  
  
##  <a name="Process"></a> Adding a map to your report  
 To add a map to your report, here is a list of the general steps to follow:  
  
- Determine which analytical data that you want to display and what types of spatial data that you need. For example, to display relative annual store sales on a bubble map, you need store name and store sales for analytical data and store name and store location as latitude and longitude for spatial data.  
  
- Decide on the style of map you want. Basic maps display locations only. Bubble maps vary bubble size based on a single analytical value. Analytical color maps vary map elements based on ranges of analytical data. The style that you select depends both on the data that you want to visualize and the type of spatial data that you use.  
  
- Collect the information that you must have to specify spatial data sources, spatial data, analytical data sources, and analytical data. This includes connection strings to spatial data sources, specifying the type of spatial data that you need, and making sure that your report data includes match fields that associate the spatial data and analytical data.  
  
- Run the Map wizard to add a map to your report. This adds the first map layer to the map. Run the Map Layer wizard to create additional layers or modify existing layers. The wizards provide an easy way to get started. For more information, see [Map Wizard and Map Layer Wizard &#40;Power BI Report Builder&#41;](map-wizard-map-layer-wizard-report-builder.md).  
  
- After you preview the map in your report, you will probably want to adjust the map view, change the way your data varies the display of each layer, provide legends to help your users interpret the data, and adjust the resolution to provide a good viewing experience for your users.  
  
 For more information, see [Plan a Map Report &#40;Power BI Report Builder&#41;](plan-map-report-report-builder.md).  
  
##  <a name="AddingData"></a> Adding data to a map  
 A map uses two types of data: spatial data and analytical data. Spatial data defines the appearance of the map whereas analytical data provides the values that are associated with the map. For example, spatial data defines the locations of cities in an area whereas analytical data provides the population for each city.  
  
 A map must have spatial data; analytical data is optional. For example, you can add a map that displays just store locations in a city.  
  
 To visualize data on a map, the analytical data and the spatial data must have a relationship. When the spatial data and the analytical data come from the same source, the relationship is known. When the spatial data and the analytical data come from different sources, you must specify match fields to relate them.  
  
### Spatial data  
 Spatial data consists of sets of coordinates. Spatial data from a data source can be a single point, multiple points, a single line, multiple lines, or a set of polygons. Each set of coordinates defines a *map element*, for example, a polygon that represents the outline of a county, a line that represents a road, or a point that represents the location of a city.  
  
 Spatial data is based on one of the following coordinate systems:  
  
- **Geographic** Specifies geodesic coordinates on a spherical surface by using longitude and latitude. When spatial data is geographic, a projection must be specified. A projection is a set of rules that specifies how to draw objects that have spherical coordinates onto a planar surface. Only geographic data with the same projection can be compared or combined.  
  
- **Planar** Specifies geometric coordinates on a planar surface by using X and Y.  
  
 Each map layer displays one type of spatial data: polygons, lines, or points. To display multiple types of spatial data, add multiple layers to the map. You can also add a layer of Microsoft Bing or Azure map tiles. The tile layer does not depend on spatial data. The tile layer displays image tiles that correspond to the coordinates of the map viewport.  

#### Sources of spatial data  
 The following sources of spatial data are supported:  
  
- **Map Gallery reports.** Spatial data is embedded in reports located in the map gallery. By default, the Map Gallery is installed in *\<drive>*:\Program Files\Power BI Report Builder\MapGallery.  
  
  
- **SQL Server spatial data stored in a database.** You can use a query that specifies **SQLGeometry** or **SQLGeography** data types from a  relational database. For more information, see [Spatial Data Types Overview](/sql/relational-databases/spatial/spatial-data-types-overview).  
  
     In the result set that you see in the query designer, each row of spatial data is treated as a unit and stored in a single map element. For example, if there are multiple points that are defined in one row in the result set, display properties apply to all points in that map element.  
  
- **Custom locations that you create.** You can manually add locations as embedded points to an embedded point layer. For more information, see [Add Custom Locations to a Map &#40;Power BI Report Builder&#41;](add-custom-locations-map-report-builder.md).  
  
#### Spatial data in design view  
 In Design view, the report processor displays sample spatial data to help you design the map layer. The data that you see depends on the availability of the spatial data:  
  
- **Embedded data.** The sample data is retrieved from map elements embedded in map layers in your report.  
  
- **SQL Server spatial data.** If the data source is available and the credentials are valid, the sample data is loaded from the spatial data in the database. Otherwise, the report processor generates sample data and displays the message **No spatial data available**.  
  
#### Embedding spatial data in the report definition  
 Unlike analytical data, you have the option to embed spatial data for a map layer in the report definition. When you embed spatial data, you embed map elements that are used in the map layer.  
  
 Embedded elements increase the size of the report definition but ensure that the spatial data is always available when the report runs. More data means more storage and longer processing times. It is always a best practice to limit spatial data, in addition to other report data, to just the information that is needed for your report.  
  
#### Controlling map resolution at run time  
 When you change the resolution for spatial data, you are specifying how detailed you want the lines drawn on a map. For example, for areas, do you need granularity down to a hundred meters of surface area on the earth, or is one mile enough detail?  
  
 If the spatial data is embedded in the report, the resolution that you use affects the number of map elements in the report definition. A higher resolution increases the number of elements that are required to draw borders at that resolution. To design a report that balances display resolution and acceptable report rendering time, simplify the map resolution to the level of detail that you need in your report to visualize your analytical data.  
  
### Analytical data  
 Analytical data is the data that you want to visualize on the map, for example, population for a city or sales total for a store. Analytical data can come from one of the following sources:  
  
- **Dataset field.** A field from a dataset in the Report Data pane.  
  
- **Spatial data source field.** A field from the spatial data source that is included with the spatial data. Field names from the spatial data source begin with # and appear in the drop-down list of fields when you are specifying the data field for rules for a layer.  
  
- **Embedded data for a map element.** After you embed polygons, lines, or points in a report, you can override the data fields for individual map elements and set custom values.  
  
 When you specify rules for a layer and select the analytical data field, if the data type is numeric, the report processor automatically uses the default function Sum to calculate aggregate values for the map element. If the field is not numeric, no aggregate function is specified, and the implicit aggregate function First is used. To change the default expression, change the options for the rules for the layer. For more information, see [Vary Polygon, Line, and Point Display by Rules and Analytical Data &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/vary-polygon-line-and-point-display-by-rules-and-analytical-data).  
  
### Match fields  
 To relate analytical data to map elements on a layer, you must specify *match fields*. Match fields are used to build a relationship between map elements and analytical data. You can use one or more fields to match on as long as they specify a unique analytical value for each spatial location.  
  
 For example, for a bubble map that varies bubble size by city population, the following data is needed:  
  
- From the spatial data source:  
  
    - **SpatialData.** A field that has spatial data that specifies the latitude and longitude of the city.  
  
    - **Name.** A field that has the name of the city.  
  
    - **Area.** A field that has the name of the region.  
  
- From the analytical data source:  
  
    - **Population.** A field that has the city population.  
  
    - **City.** A field that has the name of the city.  
  
    - **Area.** A field that has the name of the territory, state, or region.  
  
 In this example, the name of the city alone is not enough to uniquely identify the population. For example, there are many cities named Albany in the United States. To name a specific city, you must specify the area in addition to the city name.  
  
##  <a name="Viewport"></a> Understanding the map viewport  
 After you specify map data for a report, you can limit the display area of the map by specifying a map *viewport*. By default, the viewport is the same area as the whole map. To crop the map, you can specify the center, zoom level, and maximum and minimum coordinates that define the area that you want to include in your report. To improve the display of the map in the report, you can move the legends, distance scale, and color scale outside the viewport. The following figure shows a viewport:  
  
 ![Screenshot showing the Map Viewport.](../media/paginated-reports-maps/map-view-port.png "Screenshot showing the Map Viewport.") 

  
## <a name="TileLayer"></a> Adding a Bing or Azure map tiles layer

 You can add a layer for Bing or Azure map tiles that provides a geographic background for the current map view as defined by the viewport. To add a tile layer, you must specify the coordinate system **geographic** and the projection type **Mercator**. Tiles that match the viewport center and zoom level that you select are automatically retrieved from Bing or Azure Maps Web Services.  

 You can customize the layer by specifying the following options:  
  
- Tile type. The following styles are supported:  
  
    - **Road.** Displays a road map style that has a white background, roads, and label text.   
    - **Aerial.** Displays an aerial image style without text.  
    - **Hybrid.** Displays a combination of the **Road** and **Aerial** styles.  
  
- The language for the display text on the tiles.  
  
- Whether to use a secure connection to retrieve the tiles from the Bing or Azure Maps Web service.  

 For step-by-step instructions, see [Add, Change, or Delete a Map or Map Layer (Report Builder)](add-change-delete-map-map-layer-report-builder.md).  
  
 For more information about tiles, see [Bing Maps Tile System](/bingmaps/articles/bing-maps-tile-system). For more information about the use of Bing map tiles in your report, see [Additional Terms of Use](https://go.microsoft.com/fwlink/?LinkId=151371).  If using PBIRB September 2025 release or later, for more information about tiles, see [Azure Maps Tile Layer](/azure/azure-maps/map-add-tile-layer). For more information about the use of Azure Maps tiles in your report, see [Azure Maps Terms of Use](https://www.microsoft.com/licensing/terms/productoffering/MicrosoftAzure/MOSA#clause-2036-h3-1).

##  <a name="MapLayers"></a> Understanding map layers and map elements  
 A map can have multiple layers. There are three types of layers. Each layer displays one type of spatial data:  
  
- **Polygon Layer.** Displays outlines of areas or markers for the polygon center point, which is automatically calculated for each polygon.  
  
- **Line Layer.** Displays lines for paths or routes.  
  
- **Point Layer.** Displays markers for point locations.  
  
 When you specify the source of spatial data for a layer, the wizard checks the spatial data field and sets the layer type based on its type. A map element is added to the layer for each value from the data source.  
  
 For example, to display delivery routes from a central warehouse to your stores, you might add two layers: a point layer with pushpin markers to display store locations and a line layer to display delivery routes to each store from the warehouse. The point layer needs Point spatial data that specifies store locations and the line layer needs Line spatial data that specifies the delivery routes.  
  
 The fourth type of layer is a tile layer. A tile layer adds a background of Bing or Azure map tiles that corresponds to the map viewport center and zoom level.  

 To work with layers, select a map on the report design surface to display the Map pane. The Map pane displays the list of layers that are defined for the map. Use this pane to select a layer to change the options, to change the drawing order of layers, to add a layer or run the Map Layer wizard, to hide or show a layer, and to change the view center and zoom level for the map viewport. The following figure shows a viewport:  
  
 ![Screenshot of the Map Layers section showing the Layer Toolbar, Layer visibility, Layer name, Type of spacial data source, Layer type, Adjust Zoom Level, and Adjust View Center options.](../media/paginated-reports-maps/map-layer-zone.png "Screenshot of the Map Layers section showing the Layer Toolbar, Layer visibility, Layer name, Type of spacial data source, Layer type, Adjust Zoom Level, and Adjust View Center options.")  
  
 For more information about map layers, see [Add, Change, or Delete a Map or Map Layer &#40;Power BI Report Builder&#41;](add-change-delete-map-map-layer-report-builder.md).  
  
### Varying display properties for points, lines, and polygons  
 Display options for map elements can be set at the layer level, by using rules for the layer, or on individual elements. For example, you can set display properties for all points on a layer, or you can set rules that control the display properties for all points on a layer whether or not they are embedded, or you can override display property settings for specific embedded points.  
  
 When you view a report, the display values that you see are controlled by this hierarchy, listed in ascending order. The higher numbers take precedence:  
  
1.  **Layer properties.** Properties that apply to the whole layer. For example, use layer properties to set the source of analytical data or the visibility for the whole layer.  
  
2.  **Polygon, Line, Point properties and Embedded Polygon, Line, Point properties.** Properties that apply to all map elements on a layer, whether the elements are from dynamic spatial data or embedded spatial data. For example, use polygon center point properties to set the fill color for bubbles to a gradient that fills bubble areas from dark blue to light blue and from top to bottom.  
  
3.  **Color Rules, Size Rules, Width Rules, Marker Type Rules.** Rules apply properties to a layer when the layer has map elements that have a relationship to analytical data. The types of rules vary based on layer type. For example, use point size rules to vary bubble size based on population.  
  
4.  **Override for Embedded Polygon, Line, or Point properties**. For embedded map elements, you can select the override option and change any property or data value. Any changes that you make to override rules for individual elements are irreversible. For example, you can highlight a specific store by using a pushpin marker.  
  
 For more information, see [Vary Polygon, Line, and Point Display by Rules and Analytical Data &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/vary-polygon-line-and-point-display-by-rules-and-analytical-data).  
  
 In addition to varying the appearance of map elements, you can add interactivity to points, lines, and polygons, or to layers, in the following ways:  
  
- Create tooltips to provide additional details for a map element when the user hovers a pointer over the map.  
  
- Add drillthrough actions to link to other locations in the report, to other reports, or to Web pages.  
  
- Add parameters in expressions that define layer visibility to enable a user to show or hide specific map layers.  
  
 For more information, see [Interactive Sort, Document Maps, and Links &#40;Power BI Report BuilderS&#41;]/sql/reporting-services/report-design/interactive-sort-document-maps-and-links-report-builder-and-ssrs).  
  
##  <a name="Legends"></a> Understanding map legends, color scale, and distance scale  
 You can add a variety of legends to your report to help users interpret a map. Maps can include the following items:  
  
- **Legends.** You can create multiple legends. Items that are listed in a legend are generated automatically based on the rules that you specify for map elements on each layer. For each rule, you specify the legend to use to display its related items. In this manner, you can assign items from multiple layers to the same legend or to different legends.  
  
- **Color scale.** You can create one color scale. As an alternative to providing a legend for a color rule, you can display items for a color rule in the color scale. Multiple color rules can apply to the color scale.  
  
- **Distance scale.** You can display one distance scale. The distance scale displays a scale for the current map view in both kilometers and miles.  
  
 You can position the legends, color scale, and distance scale in discrete locations inside or outside the viewport. For more information, see [Change map legends, color scale, and associated rules in a paginated report (Power BI Report Builder)](change-map-legends-color-scale-associated-rules-report-builder.md).  
  
##  <a name="Troubleshooting"></a> Troubleshooting maps  
 Map reports use spatial and analytical data from a variety of data sources. Each map layer can use different sources of data. The display properties for each layer follow a specific precedence based on layer properties, rules, map element properties.  
  
 If you do not see the result that you want when you view a map report, the root causes can come from a variety of issues. To help you isolate and understand each issue, it helps to work with one layer at a time. Use the Map pane to select a layer and easily toggle its visibility.  
  
 For more information about map report issues, see [Troubleshoot Reports: Map Reports &#40;Power BI Report Builder&#41;](troubleshoot-reports-map-reports-report-builder.md)  
  
##  <a name="HowTo"></a> How-to topics  
 This section lists procedures that show you, step by step, how to work with maps and map layers in your reports.  
  
- [Add, Change, or Delete a Map or Map Layer &#40;Power BI Report Builder&#41;](add-change-delete-map-map-layer-report-builder.md)   
- [Change map legends, color scale, and associated rules in a paginated report (Power BI Report Builder)](change-map-legends-color-scale-associated-rules-report-builder.md)
- [Add Custom Locations to a Map &#40;Power BI Report Builder&#41;](add-custom-locations-map-report-builder.md)  
  
##  <a name="Section"></a> Related content

- [Plan a Map Report &#40;Power BI Report Builder&#41;](plan-map-report-report-builder.md)  
- [Map Wizard and Map Layer Wizard &#40;Power BI Report Builder&#41;](map-wizard-map-layer-wizard-report-builder.md)  
- [Customize the display of a map or map layer in a paginated report (Power BI Report Builder)](customize-data-display-map-map-layer-report-builder.md)
- [Vary Polygon, Line, and Point Display by Rules and Analytical Data &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/vary-polygon-line-and-point-display-by-rules-and-analytical-data)  
- [Add Custom Locations to a Map &#40;Power BI Report Builder&#41;](add-custom-locations-map-report-builder.md)  
- [Troubleshoot Reports: Map Reports &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/troubleshoot-reports-map-reports-report-builder-and-ssrs)  
