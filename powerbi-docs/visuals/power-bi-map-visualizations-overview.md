---
title: Overview of map visualizations in Power BI
description: Learn about the different types of map visualizations available in Power BI.
author: DataZoeMS
ms.author: zoedouglas
ms.reviewer: 'zoedouglas'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: overview
ms.date: 01/06/2026
LocalizationGroup: Visualizations
---

# Map visualizations in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Map visualizations help you display geographic and spatial data in Power BI reports. They enable you to visualize patterns, trends, and relationships across locations, making it easier to gain insights from location-based data. Power BI offers several types of map visualizations, each designed for different scenarios and use cases.

## Types of map visualizations

Power BI provides multiple map visualization options to suit various analytical needs:

### Azure Maps

Azure Maps for Power BI provides enterprise-grade mapping capabilities powered by Microsoft's Azure Maps platform. It supports bubble, 3D column, heat map, filled, and reference layers. You can add pie chart overlays and use clustering.

> [!NOTE]
> The Azure Maps visual must be enabled by administrators in the **Power BI Admin Portal** under **Integration** settings.

For detailed guidance, see [Azure Maps visual for Power BI](/azure/azure-maps/power-bi-visual-getting-started?context=/power-bi/create-reports/context/context).

### Shape maps (Preview)

Shape maps compare regions using color-coding rather than showing precise locations. They support both standard geographic maps and custom TopoJSON maps for non-traditional visualizations like floor plans, seating arrangements, or custom territories.

> [!NOTE]
> Shape maps are currently in preview and only available in Power BI Desktop. They must be enabled in **Preview Features** before use.

For detailed instructions, see [Create Shape Map visualizations in Power BI Desktop (preview)](desktop-shape-map.md).

### Basic maps (Bing Maps)

Basic maps display data points as bubbles on a map, with bubble sizes representing measure values. They use Bing Maps integration for automatic geocoding and work with addresses, cities, states, countries, or longitude/latitude coordinates.

For detailed guidance, see [Tips and tricks for Power BI map visualizations](power-bi-map-tips-and-tricks.md).

### Filled maps (Choropleth)

Filled maps use shading, color intensity, or patterns to show how values differ across geographic regions. They excel at displaying regional variations and comparing aggregated data by country, state, county, or other geographic boundaries.

For more information, see [Create and use filled maps (choropleth maps) in Power BI](power-bi-visualization-filled-maps-choropleths.md).

### ArcGIS maps

ArcGIS maps for Power BI, created by Esri, provide advanced spatial analysis and demographic data capabilities. Features include smart map themes, location analytics, reference layers, infographics, drive time analysis, and professional GIS tools. Available in both Power BI Desktop and Power BI service with various feature levels depending on license.

For comprehensive information, see [Create ArcGIS maps in Power BI](power-bi-visualizations-arcgis.md).

## Geocoding and Bing Maps integration

Most Power BI map visualizations integrate with Bing Maps to provide automatic geocoding. Geocoding is the process of converting location descriptions (like addresses, cities, or postal codes) into geographic coordinates. When you add location data to a map visualization, Power BI uses Bing Maps to identify the correct locations.

### What is sent to Bing Maps

When you create a map visualization, certain data is sent to Bing Maps for geocoding:

- **Basic maps**: Data in the **Location** bucket is sent unless latitude and longitude are provided
- **Filled maps**: Data in **Location**, **Latitude**, or **Longitude** buckets is sent to Bing

To learn more about geocoding and how to improve its accuracy, see [Tips and tricks for Power BI map visualizations](power-bi-map-tips-and-tricks.md).

### Privacy considerations

You or your administrator may need to update firewall settings to allow access to Bing Maps geocoding services. For privacy information, see [Bing Maps privacy](https://go.microsoft.com/fwlink/?LinkID=248686).

## Choosing the right map visualization

Select your map visualization type based on your specific needs:

| Use case | Recommended visualization |
|----------|-------------------------|
| Visualize large datasets with high performance | Azure Maps |
| Create 3D column visualizations on maps | Azure Maps |
| Display heat maps or pie charts at locations | Azure Maps |
| Leverage Microsoft Azure integration | Azure Maps |
| Display regional comparisons without precise locations | Shape maps |
| Use custom geographic boundaries or layouts | Shape maps with custom TopoJSON |
| Show exact locations of data points | Basic maps (Bing Maps) |
| Compare values across regions using color intensity | Filled maps (Choropleth) |
| Perform advanced spatial analysis | ArcGIS maps |
| Add demographic context to geographic data | ArcGIS maps |
| Analyze drive times or distances | ArcGIS maps |

## Common features across map types

All Power BI map visualizations share common capabilities:

- **Interactivity**: Maps support cross-filtering and cross-highlighting with other visuals on your report page
- **Tooltips**: Hover over locations to see detailed information
- **Zoom and pan**: Navigate to specific areas of interest
- **Formatting options**: Customize colors, labels, titles, and backgrounds
- **Data categorization**: Power BI automatically categorizes geographic data fields

## Getting started with maps

To create any map visualization:

1. In Power BI Desktop or Power BI service, open or create a report
2. Select the map visualization icon from the **Visualizations** pane
3. Add geographic fields to the **Location** bucket
4. Add measures or values to display on the map
5. Format and customize the map as needed

For step-by-step tutorials on creating specific map types, refer to the individual articles linked in this overview.

## Related content

- [Azure Maps visual for Power BI](/azure/azure-maps/power-bi-visual-getting-started?context=/power-bi/create-reports/context/context)
- [Create Shape Map visualizations in Power BI Desktop (preview)](desktop-shape-map.md)
- [Tips and tricks for Power BI map visualizations](power-bi-map-tips-and-tricks.md)
- [Create and use filled maps (choropleth maps) in Power BI](power-bi-visualization-filled-maps-choropleths.md)
- [Create ArcGIS maps in Power BI](power-bi-visualizations-arcgis.md)
- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
