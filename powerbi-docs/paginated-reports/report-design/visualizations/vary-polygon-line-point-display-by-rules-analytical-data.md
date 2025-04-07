---
title: "Vary polygon, line, and point display in Power BI paginated reports | Microsoft Docs"
description:  Control display for polygons, lines, and points in a Power BI paginated report by setting options and rules, or by overriding options for embedded map elements in Power BI Report Builder.
ms.date: 03/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Vary polygon, line, and point display in Power BI paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  The display options for polygons, lines, and points on a map layer in a paginated report are controlled by setting options for the layer, by setting rules for the map elements on the layer, or by overriding options for specific embedded map elements on a layer.  
  
 Display options apply in a specific precedence, listed from lowest to highest precedence:  
  
1. Options set on a polygon layer, a line layer, and a point layer apply to all map elements on that layer, whether or not the map elements are embedded in the report definition.  
  
1. Options set for rules apply to all map elements on a layer. All data visualization options apply only to map elements that are associated with spatial data. A data visualization option requires you to specify a data field to base display variations on. You must have set the match fields for the analytical and spatial data before you can apply data visualization rules. For more information, see [Maps &#40;Power BI Report Builder&#41;](../../report-builder/maps-report-builder.md).  
  
1. Options that you set for selected embedded map elements. Note that, when you override the layer options, the changes that you make to the report definition are permanent. You can change the data field values as well as override display options to customize the way specific polygons, lines, and points appear on a layer.  
  
 In addition to controlling the display of map elements on a layer, you can control the layer transparency to allow layers that are drawn earlier to show through layers that are drawn later. For more information about changing options that affect the map or the entire map layer, see [Customize the data and display of a map or map layer &#40;Power BI Report Builder&#41;](../../report-builder/customize-data-display-map-map-layer-report-builder.md).  
  
You create and modify Power BI paginated reports in [Power BI Report Builder](../../report-builder-power-bi.md). 
  
##  <a name="Rules"></a> Four types of rules

 You can set four types of rules that enable the report processor to automatically adjust display properties for map elements on a layer. Rules vary depending on the map element type: polygons, lines, or points.  
  
- **Polygons.** Vary polygon color.  
  
    - **Polygon Center Points.** For markers that display at the center point of each polygon, vary marker color, marker size, and marker type.  
  
- **Lines.** Vary line color and line width.  
  
- **Points.** For markers that display for each point, vary marker color, marker size, and marker type.  
  
##  <a name="Color"></a> Color rules

 Color rules apply to fill colors for polygons, lines, and markers that represent points or polygon center points.  
  
 Color rules support four options:  
  
- Apply template style. The theme that you chose in the wizard defines the template style for the layer. Theme sets the style for font, the border style, and the palette.  
  
- Visualize data by using color palette. You specify a palette by name. The report processor sets the color of each map element in a layer by stepping through each color in the palette, and then applying successively lighter shades of each color in the palette.  
  
- Visualize data by using color ranges. You specify a beginning, middle, and end color. Then you specify distribution options. The report processor uses the distribution option values to create a set of colors that produces a display similar to a heat map. A heat map displays color as related to temperature. For example, on a scale of 0 to 100, low values are blue to represent cold and high values are red to represent hot.  
  
- Visualize data by using custom colors. You specify a set of colors. The report processor sets the color of each map element in the layer by stepping through the values that you specify.  
  
 The default palette includes the color white. To avoid the strong contrast between white and other colors in the palette, specify a start color that is a light color in the palette.  
  
 To display map elements that are not associated with data as colorless, set **No Color** for the default color for map elements on the layer.  
  
### Color scale

 By default, all color rule values appear in the color scale, in addition to appearing in the first legend. The color scale is designed to display one range of colors. Choose the most important data to display in the color scale.  
  
 To remove the values that you do not want in the color scale, clear the color scale option for every color rule on every layer.  
  
##  <a name="Width"></a> Line width rules

 Width rules apply to lines. Width rules support two options:  
  
- Use a default line width. You specify the line width in points.  
  
- Visualize data by using line width. You set the minimum and maximum widths for the line, specify the data field to use to vary the width, and then specify the distribution options to apply to that data.  
  
##  <a name="Size"></a> Marker size rules

 Size rules apply to markers that represent points or polygon center points. Size rules support two options:  
  
- Use a default marker size. You specify the size in points.  
  
- Visualize data by using size. You set the minimum and maximum sizes for the marker, specify the data field to use to vary the size, and then specify the distribution options to apply to that data.  
  
##  <a name="Marker"></a> Marker type rules

 Marker type rules apply to markers that represent points or polygon center points. Marker type rules support two options:  
  
- Use a default marker type. You specify one of the available marker types.  
  
- Visualize data by using markers. You specify a set of markers and specify the order in which you want them used. Marker types include **Circle**, **Diamond**, **Pentagon**, **PushPin**, **Rectangle**, **Star**, **Triangle**, **Trapezoid**, and **Wedge**.  
  
##  <a name="Distribution"></a> Distribution options

 To create a distribution of values, you can divide your data into ranges. You specify the distribution type, the number of subranges, and the minimum and maximum range values.  
  
 In the following list, assume that you have three map elements and six related analytical values that range from 1 to 9999 with the following values: 1, 10, 200, 2000, 4777, 8999.  
  
- **EqualInterval.** Create ranges that divide the data into equal range intervals. For the example, the three ranges would be 0-2999, 3000-5999, 6000-8999. Subrange 1: 1, 10, 200, 500. Subrange 2: 4777. Subrange 3: 8999. This method does not take into account how the data is distributed. Very large values or very small values can skew the distribution results.  
  
- **EqualDistribution.** Create ranges that divide that data so that each range has an equal number of items. For the example data, the three ranges would be 0-10, 11-500, 501-8999. Subrange 1: 1, 10. Subrange 2: 200, 500. Subrange 3: 4777, 8999. This method can skew the distribution by creating divisions that span very large or very small ranges.  
  
- **Optimal.** Create ranges that automatically adjust distribution to create balanced subranges. The number of subranges is determined by the algorithm.  
  
- **Custom.** Specify your own number of ranges to control the distribution of values. For the example data, you can specify ranges 3 ranges: 1-2, 3-8, 9.  
  
 The distribution values are used by the rules to vary the map element display values.  
  
##  <a name="Legends"></a> Legends and legend items

 Legend items are created automatically from the rules that you specify for each layer. Rule options control how many items are created and which legend they appear in. By default, all items for all rules are added to the first legend. To move items out of the first legend, create as many additional legends as you need, and for each rule, specify the legend to use to display the items that result from the rule. To hide items based on a rule, specify a blank legend name.  
  
 To control where a legend appears, use the Legend Properties dialog box to specify a position relative to the map viewport. For more information, see [Change map legends, color scale, and associated rules &#40;Power BI Report Builder&#41;](../../report-builder/change-map-legends-color-scale-associated-rules-report-builder.md).  
  
 Legends automatically expand to display the legend title or legend text. To format the text of legend items, use map legend keywords and custom formats. For more information, see [To change the format of content in a legend](../../report-builder/change-map-legends-color-scale-associated-rules-report-builder.md#ChangeFormatItems).  
  
 The following table shows examples of different formats that you can use.  
  
|Keyword and format|Description|Example of what appears as text in the legend|  
|--------|--------|-----------|  
|`#FROMVALUE {C0}`|Displays the currency of the total value with no decimal places|$400|  
|`#FROMVALUE {C2}`|Displays the currency of the total value to two decimal places.|$400.55|  
|`#TOVALUE`|Displays the actual numeric value of the data field.|10000|  
|`#FROMVALUE{N0} - #TOVALUE{N0}`|Displays the actual numeric values of the beginning of the range and end of the range.|10 - 790|  
  
## Related content

- [Change map legends, color scale, and associated rules &#40;Power BI Report Builder&#41;](../../report-builder/change-map-legends-color-scale-associated-rules-report-builder.md)   
- [Maps &#40;Power BI Report Builder&#41;](../../report-builder/maps-report-builder.md)
- [Map wizard and map layer wizard &#40;Power BI Report Builder&#41;](../../report-builder/map-wizard-map-layer-wizard-report-builder.md)  
  
  
