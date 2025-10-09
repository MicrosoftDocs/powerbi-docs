---
title: "Customize the display of a map or map layer in a Power BI paginated report | Microsoft Docs"
description:  Improve the user experience of data and display in a paginated report with changes to legends, color, labels, and resolution in Power BI Report Builder. 
ms.date: 02/13/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: JulCsc
ms.author: juliacawthra
ms.reviewer: monaraya
---
# Customize the display of a map or map layer in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  After you add a map or map layer to a paginated report by using a wizard, you might want to change the way the map looks in the report. You can make improvements by considering the following ideas:  
  
- To help your users understand how to interpret the data display on a map, you can add legends and a color scale, and add labels and tooltips.  
  
- To make the map easier to read, change the center and zoom level, add a distance scale, and display a background grid.  
  
- To help control map drawing time when you run the report, you can adjust the resolution to simplify the map elements.  
  
- You can embed map elements in the report definition, and then change how individual elements appear. For example, you can display the primary office location with a pushpin and other office locations with circles.  
  
- You can add customized regions by specifying your own data group expressions.  
  
- You can add a custom location at a  point that you specify on a map layer that has embedded points. You can set the value and display properties for custom points independently from other points on a point layer.  
  
- To provide more detail, you can add links to map elements on each layer that a user can select to open related reports.  
  
 For more ideas about improving a report, see [Planning a Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/planning-a-report-report-builder).  
  
 Display options affect the way a map or the parts of a map appear when you view the report. Some options control the appearance of the map, such as the borders and fonts or the area represented on the map. Other options control the content of each layer, such as bubble sizes, marker types, labels, or tooltips.  
  
 A map report item includes the following parts: the map itself, a map viewport, a set of titles, a set of legends (legend, color scale, and distance scale), a set of layers, a set of map elements on each layer (polygons or lines or points). Use the information in the following sections to understand which property dialog box controls the display options for different parts of a map.  
  

##  <a name="Map"></a> Change options for the map  
 On a map report item, you can control the following:  
  
- Add multiple titles.  
  
- Add multiple legends. To change the contents of a legend, you need to create additional legends and then change the rules to specify in which legend to enter the legend items created by each rule.  
  
- Add more layers.  
  
- Hide or show the distance scale or color scale.  
  
- Provide the illusion of depth by specifying a shadow.  
  
 To change these options, right-click the map, select **Map**, and change the options.  
  
##  <a name="Viewport"></a> Change options for the viewport  
 Use the viewport options to change the view of the map that appears in your report.  
  
 The source of spatial data might provide more area than you need to display in the report. You can use the viewport to set the center, the zoom level, and to crop the area for the map.  
  
 The following options can be set for the viewport:  
  
- Choose the coordinate system and, for a geographic coordinate system, choose the projection.  
  
- Choose the center for the map.  
  
- Crop the view for the map.  
  
- Set the zoom level.  
  
- Resolution and simplification. Choose a balance between drawing time and detailed outlines for lines and polygons.  
  
 To change these options, right-click the map viewport, use the [Map Viewport Properties Dialog Box, General](maps-report-builder.md#Viewport) page and related pages.  
  
##  <a name="Legends"></a> Change options for the legends  
 Legends help users interpret the data on a map.  
  
 By default, all rules that you specify for a layer add items to the first legend. In addition, all color rules display values in the color scale.  
  
- To change the display options for the appearance of the legend, including its position relative to the viewport, set options on the legend itself.  
  
- To change the contents or the format of contents for a legend, change the legend options for the corresponding rules for a layer.  
  
 For more information, see [Change Map Legends, Color Scale, and Associated Rules &#40;Power BI Report Builder&#41;](change-map-legends-color-scale-associated-rules-report-builder.md).  
  
##  <a name="Layer"></a> Change options for the layer  
 To display the layers for a map, select the map to select it. The Map pane appears. To change options for a layer, right-click the layer and use the shortcut menu.  
  
 A layer can be one of three types based on the spatial data that is returned by the spatial data source: a polygon layer, a line layer, or a point layer.  
  
 The following options can be set for the layer:  
  
- The associated analytical data and match fields. The source of the spatial data is listed on the Map pane under the name of the layer. When the source is embedded, the map elements for the layer are part of the report definition. If the source is not embedded, then the spatial data is retrieved at run time and the report processor creates the map elements for the layer when the report is processed. To change data options on the layer, use the Analytical Data page in the Map Layer dialog box.  
  
- Layer drawing order. The order that you see the layers listed in the Map pane is the reverse drawing order for the layers. The last layer in the list is drawn first. For example, if you want the points on a point layer to appear on top of the polygons in the polygon layer, the point layer should be first and the polygon layer second.  
  
- Layer visibility, including transparency. To have one layer show through another layer, set the transparency to a value higher than 0. A value of 100% means the layer is not visible. To work with an individual layer, you can easily show or hide each layer independently by using the **Visibility** icon in the Map pane. You can also set zoom level options to specify when to show or hide map elements on the layer based on the zoom level.  
  
- Add Azure map tile layer for the current viewport center and zoom level. You do not need to specify the geographic coordinates for a tile layer. Tiles are automatically loaded to match the viewport area when the coordinate system is Geographic, the projection is Mercator, the Azure Maps servers are available, and when the report server has been configured to support this feature. For each report, you can specify whether to use a secure connection to retrieve tiles.  

 For more information about layers, see [Add, Change, or Delete a Map or Map Layer &#40;Power BI Report Builder&#41;](add-change-delete-map-map-layer-report-builder.md).  
  
##  <a name="DataGrouping"></a> Change data grouping for the layer  
 You can customize the way to aggregate spatial data for your own shapes. To set the group properties for a layer, select the layer in the Map pane, and in the Properties pane for the layer, select **Group**, and then select the ellipsis (...) to open the Group properties. In this dialog box, you can specify group expressions, create group variables, and filter data that is used for grouping.  
  
 The group expression specifies how analytical data that has a relationship to spatial data is aggregated for each map element on the layer. By default, the group expression is the set of match fields that was specified for the relationship between the spatial data and the analytical data. For example, for a bubble map that displays city locations and population size for a country or region, the match fields include city name [City] and region name [Region] because there can be multiple cities with the same name. The corresponding group expression includes two fields: [City] and [Region].  

  
##  <a name="MapElements"></a> Change options for the map elements on the layer
 Map elements are the points, lines, or polygons on a layer that are based on the spatial data. For map elements, the following options can be set. These options apply to all map elements on the layer, whether or not they are embedded:  
  
- Labels, label visibility, label offset, and formatting.  
  
- Borders and fill.  
  
- Drillthrough actions.  
  
- Display options.  
  
 Display options for map elements follow a precedence order based on the layer, the map element, rules for the map element, and override options for embedded map elements.  
  
 To change these options, right-click the map element, use the embedded properties dialog box. For example, for an embedded polygon, use the Map Embedded Polygon Properties Dialog Box, General page and related pages.  
  
##  <a name="Precedence"></a> Understanding display option precedence  
 When you want to control the display appearance of a point, line, or polygon on a map layer, you must understand where display options can be set and which options have a higher precedence. The following display options are listed from lowest to highest. Higher display options override lower display options in this list:  
  
- Layer options.  
  
- Points, Lines, or Polygons options on each layer. This applies whether the map elements are dynamically retrieved when the report is processed or whether the map elements are embedded in the report definition. For example, you specify a fill color for all elements on a layer.  
  
- Rules. You can set rules to control color, size, width, or marker type for all map elements on a layer. The rules that you can set depend on the type of map element.  
  
    - Color Rules. Apply to markers for points, lines, polygons, and markers for polygon center points.  
  
    - Size Rules. Apply to markers for points and markers for polygon center points.  
  
    - Width Rules. Applies to line widths.  
  
    - Marker Type Rules. Applies to markers for points and markers for polygon center points.  
  
- Override options for individual embedded points, lines, or polygons on a layer. Changes that you make are permanent. To revert these changes, you must reload the data for the layer.  
  
 For more information, see [Vary Polygon, Line, and Point Display by Rules and Analytical Data &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/vary-polygon-line-and-point-display-by-rules-and-analytical-data).  
  
## Related content

- [Map Wizard and Map Layer Wizard &#40;Power BI Report Builder&#41;](map-wizard-map-layer-wizard-report-builder.md)
- [Maps &#40;Power BI Report Builder&#41;](maps-report-builder.md)
