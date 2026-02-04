---
title: Overview of Map Visualizations in Power BI
description: Learn about the different types of map visualizations available in Power BI.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: overview
ms.date: 01/06/2026
ai-usage: ai-assisted
LocalizationGroup: Visualizations
---

# Map visualizations in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Map visualizations help you display geographic and spatial data in Power BI reports. They enable you to visualize patterns, trends, and relationships across locations, making it easier to gain insights from location-based data. Power BI offers several types of map visualizations, each designed for different scenarios and use cases.

Power BI provides multiple map visualization options to suit various analytical needs:

## Azure maps

**Azure maps** for Power BI visual provides enterprise-grade mapping capabilities powered by Microsoft's Azure Maps platform. It supports [bubble](/azure/azure-maps/power-bi-visual-add-bubble-layer?context=/power-bi/create-reports/context/context), [3D column](/azure/azure-maps/power-bi-visual-add-3d-column-layer?context=/power-bi/create-reports/context/context), [heat map](/azure/azure-maps/power-bi-visual-add-heat-map-layer?context=/power-bi/create-reports/context/context), [filled](/azure/azure-maps/power-bi-visual-filled-map?context=/power-bi/create-reports/context/context), [marker](/azure/azure-maps/power-bi-visual-add-marker-layer?context=/power-bi/create-reports/context/context), [path layer](/azure/azure-maps/power-bi-visual-add-path-layer?context=/power-bi/create-reports/context/context), and [reference layers](/azure/azure-maps/power-bi-visual-add-reference-layer?context=/power-bi/create-reports/context/context). You can add [pie chart overlays](/azure/azure-maps/power-bi-visual-add-pie-chart-layer?context=/power-bi/create-reports/context/context) and use [clustering](/azure/azure-maps/power-bi-visual-cluster-bubbles?context=/power-bi/create-reports/context/context).

The **marker layer** enables you to use custom icons and images instead of basic shapes, with dynamic marker size scaling based on data metrics and customizable colors and transparency. Markers support distinct icons per category and can be rotated per data point using a pre-computed angle via conditional formatting. The marker layer integrates with path and reference layers to compose multi-layer map visuals that combine points, routes, and boundaries. These capabilities are available in both Power BI Desktop and Power BI service.

> [!NOTE]
> Administrators must enable the Azure map visual in the **Power BI Admin Portal** under **Integration** settings.

For detailed guidance, see [Azure Maps visual for Power BI](/azure/azure-maps/power-bi-visual-getting-started?context=/power-bi/create-reports/context/context).

## Shape maps (preview)

**Shape map** visuals compare regions using color-coding rather than showing precise locations. They support both standard geographic maps and custom TopoJSON maps for non-traditional visualizations like floor plans, seating arrangements, or custom territories.

> [!NOTE]
> Shape maps are currently in preview. You can add them only when editing a report in Power BI Desktop. You must enable them in **Preview Features** before use.

For detailed instructions, see [Create Shape Map visualizations in Power BI Desktop (preview)](desktop-shape-map.md).

## Basic maps (Bing maps)

Basic **map** visuals display data points as bubbles on a map, with bubble sizes representing measure values. They use Bing Maps integration for automatic geocoding and work with addresses, cities, states, countries/regions, or longitude/latitude coordinates. 

> [!IMPORTANT]
> The **Bing Maps** visual is scheduled for deprecation, with the timeline still being planned. Any existing Bing Maps already in your reports will still be available.
>
> To prepare for this upcoming change, **upgrade to Azure Maps** *unless*:
>
> - you have team members who would consume the report in China, Korea, or government clouds.
> - you're physically located in China or Korea (regardless of where your home tenant is located).
> - you're part of a government cloud (regardless of where your home tenant is located).
>
> We're working to support Azure Maps in these unsupported regions. **If you and all report users are located in a supported region, you're encouraged to start using Azure Maps now.** Learn how to [upgrade to Azure Maps](/azure/azure-maps/power-bi-visual-conversion). To see the list of supported regions, see [Azure Maps service geographic scope](/azure/azure-maps/geographic-scope). For more information about Azure Maps, see [Get started with Azure Maps Power BI visual](/azure/azure-maps/power-bi-visual-get-started)

For detailed guidance, see [Tips and tricks for Power BI map visualizations](power-bi-map-tips-and-tricks.md).

## Filled maps (choropleth Bing maps)

**Filled map** visuals use shading, color intensity, or patterns to show how values differ across geographic regions. They excel at displaying regional variations and comparing aggregated data by country/region, state, county, or other geographic boundaries.

For more information, see [Create and use filled maps (choropleth maps) in Power BI](power-bi-visualization-filled-maps-choropleths.md).

## ArcGIS maps

**ArcGIS for Power BI** visuals, created by Esri, provide advanced spatial analysis and demographic data capabilities. Features include smart map themes, location analytics, reference layers, infographics, drive time analysis, and professional GIS tools. Available in both Power BI Desktop and Power BI service with various feature levels depending on license.

For comprehensive information, see [Create ArcGIS maps in Power BI](power-bi-visualizations-arcgis.md).

## Common features across map types

All Power BI map visualizations share common capabilities:

- **Interactivity**: Maps support cross-filtering and cross-highlighting with other visuals on your report page.
- **Tooltips**: Hover over locations to see detailed information.
- **Zoom and pan**: Navigate to specific areas of interest.
- **Formatting options**: Customize colors, labels, titles, and backgrounds.
- **Data categorization**: Power BI automatically categorizes geographic data fields.

## Getting started with maps

To create any map visualization:

1. In Power BI Desktop or Power BI service, open or create a report.
1. Select the map visualization icon from the **Visualizations** pane.
1. Add geographic fields to the **Location** field well.
1. Add measures or values to display on the map.
1. Format and customize the map as needed.

For step-by-step tutorials on creating specific map types, see the individual articles linked in this overview.

## Related content

- [Azure Maps visual for Power BI](/azure/azure-maps/power-bi-visual-getting-started?context=/power-bi/create-reports/context/context)
- [Create Shape Map visualizations in Power BI Desktop (preview)](desktop-shape-map.md)
- [Tips and tricks for Power BI map visualizations](power-bi-map-tips-and-tricks.md)
- [Create and use filled maps (choropleth maps) in Power BI](power-bi-visualization-filled-maps-choropleths.md)
- [Create ArcGIS maps in Power BI](power-bi-visualizations-arcgis.md)
- [Visualizations overview in Power BI](power-bi-visualizations-overview.md)
