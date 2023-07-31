---
title: Create and use filled maps (choropleth maps) in Power BI
description: Learn how to create and use filled maps (choropleth maps) in Power BI Desktop and the Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/31/2023
ms.custom: sample-Sales-and-Marketing
LocalizationGroup: Visualizations
---

# Create and use filled maps (choropleth maps) in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

[!INCLUDE [note-azure-maps](../includes/note-azure-maps.md)]

A filled, or _choropleth_, map uses shading, tinting, or patterns to display how a value differs in proportion across a geography or region. You can quickly display relative differences with shading that ranges from light (less frequent or lower) to dark (more frequent or greater).

:::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/large-map.png" alt-text="Screenshot of a filled map of the United States.":::

## What is sent to Bing?

Power BI integrates with Bing to provide default map coordinates (a process called _geo-coding_). When you create a map visual in the Power BI service or Power BI Desktop, the **Location**, **Latitude**, and **Longitude** data used to create the visualization is sent to Bing.

You, or your administrator, might need to update your firewall to allow access to the URLs that Bing uses for geocoding. Those URLs are:

- `https://dev.virtualearth.net/REST/V1/Locations`
- `https://platform.bing.com/geo/spatial/v1/public/Geodata`
- `https://www.bing.com/api/maps/mapcontrol`

For more information about the data sent to Bing, and for tips to increase your geo-coding success, see [Tips and tricks for map visualizations](power-bi-map-tips-and-tricks.md).

## When to use a filled map

Filled maps are a great choice in many scenarios:

- Display quantitative information on a map
- Show spatial patterns and relationships
- Support standardized data
- Work with socioeconomic data
- Support defined regions
- Display an overview of distribution across geographic locations

## Prerequisites

Review the following prerequisites for using the filled map visual in Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Sales and Marketing Sample .pbix file.

1. Download the [Sales and Marketing Sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Sales and Marketing Sample** .pbix file, and then select **Open**.

   The **Sales and Marketing Sample** .pbix file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Sales and Marketing Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Sales and Marketing Sample** to download it. The sample opens in report view.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-sales-marketing-sample.png" alt-text="Screenshot that shows the Sales and Marketing Sample open in report view in the Power BI service." lightbox="media/power-bi-visualization-filled-maps-choropleths/power-bi-sales-marketing-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses. If both parties don't have individual Power BI Pro licenses, the report needs to be saved in Premium capacity to enable sharing. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Create a filled map

Let's create a filled map by using location data from the Sales and Marketing Sample.

1. On the **Data** pane, expand **Geo** and select the **State** field.

   By default, Power BI creates a map to display the data, and adds the **State** field under **Location** on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-map.png" alt-text="Screenshot that shows how to select the Sales field on the Data pane in Power BI Desktop.":::

   You can now convert the visual into a filled map.

1. Select **Filled map** on the **Visualizations** pane to [convert the visual](power-bi-report-change-visualization-type.md) to a filled map.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-filled-map.png" alt-text="Screenshot that shows how to convert the visual to a filled map in Power BI Desktop.":::

   Bing Maps uses the **State** field for the **Location** option to create the filled map. Bing Maps provides filled map shapes for locations around the world.
   
   > [!IMPORTANT]
   > The **Location** option must contain a valid value for Power BI to create the filled map. Valid locations include countries/regions, states, counties, cities, zip codes, postal codes, and so on. 

## Add filters to a filled map

Now you can filter the map to display specific data and apply custom formatting. We want to concentrate the view for data in the continental United States.

1. Expand the **Filters** pane.

   On the pane, we see one filter for the visual based on the **State** field. The current value is set to **is (All)** or "State(All)."

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-filters-pane.png" alt-text="Screenshot that shows the Filters pane expanded and State All value visible.":::

1. Expand the drop-down menu for the **State** filter and choose the **Select all** option. When you choose **Select All**, Power BI adds a checkmark next to every option in the list. 

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-filters-state-select-all.png" alt-text="Screenshot that shows how to choose the Select All option for the State field on the Filters pane.":::

1. We can remove a specific state from the filtered data. In the **State** filter list, select **AK** to remove the data for the state of Alaska.

   Power BI removes the checkmark for **AK** in the list and updates the map visual to remove the data for Alaska. The map now shows data for the continental United States only. (In this sample, there's no data for the state of Hawaii.) On the **Filters** pane, the value of the **State** filter updates to **State is not AK**.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-filters-state-remove-alaska.png" alt-text="Screenshot that shows the updated map visual after the data for the state of Alaska is removed.":::

## Format a filled map

You can also apply various formatting options to a filled map visual.

1. On the **Visualizations** pane, select the paint brush icon to open the **Format visual** pane section. Make sure the **Visual** section is open.

1. On the **Format** pane, expand the **Fill colors** section to see the formatting options.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-format-colors.png" alt-text="Screenshot that shows how to switch to the Format pane and view the Fill colors options.":::

1. Expand the **Colors** options and select **fx** next to the **Default** color.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-format-select-fx.png" alt-text="Screenshot that shows how to select conditional formatting for the default color.":::

   The **Default color - Fill colors - Colors** dialog opens. You can use the options on this dialog to configure shading for your filled map. Some of the available options include which field to use as the base for the shading, and how to apply the shading. 

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-format-colors-dialog.png" alt-text="Screenshot of the Default color - Fill colors - Colors dialog.":::

   We can use the options on the dialog to configure formatting for the colors.

1. On the dialog, expand the **Format style** drop-down list and select **Gradient**. Power BI adds a color gradient to the dialog.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-format-colors-gradient.png" alt-text="Screenshot that shows how to change the format style to use a color gradient.":::

   Power BI uses the colors in the gradient to select the color and shading for all values in your filled map. By default, the gradient has two primary colors as endpoints, the lowest value and the highest value. Values between the low and high endpoints are colored with shades of the primary colors.

1. On the **What field should we base this on?** drop-down list, expand **SalesFact** and select the **Sentiment** field.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-format-colors-base-field.png" alt-text="Screenshot that shows how to change the base field for a color-shaded map.":::

   Power BI uses the data in the specified field as the base value for determining the color and shading for all values in your filled map.

1. Set the **Minimum** and **Maximum** colors for data values based on the color gradient.

   By default, the minimum (lowest) value for the base field is colored **red**, and the maximum (highest) value is colored **green**. Data values between the maximum and minimum are colored with shades of red or green. You can also set specific data values and assigned colors.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-format-colors-min-max.png" alt-text="Screenshot that shows how to set the minimum and maximum colors for the color-shaded map.":::

   If your dataset requires a third primary color in the gradient, select the **Add a middle color** option and configure the extra options.

1. When you're done setting the colors, select **OK**.

   Power BI updates the filled map visual with data shaded red or green. The red areas represent the lower sentiment numbers and green represents the higher, more-positive sentiment.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-filled-map-color-shaded.png" alt-text="Screenshot that shows the updated map with color-shaded areas based on sentiment value." border="false":::

## Get details for areas on a filled map

Power BI supports tooltips for areas on a filled map and for specific fields. When you configure tooltips, you can hover on areas on your map to see details about the underlying data.

1. Expand the **Data** and **Visualizations** panes, if they're collapsed.

1. On the **Data** pane, locate the **SalesFact** > **Sentiment gap** field. Drag the field onto the **Tooltips** option on the **Visualizations** panes.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-add-tooltip-field.png" alt-text="Screenshot that shows how to add a field from the Data pane to the Tooltips option on the Visualizations pane.":::

1. On the filled map visual, hover on a state to see the tooltip. In our example, we hover on the state of Idaho (ID). 

   The tooltip details show the sentiment gap for Idaho is **low** with a value of **6**.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-idaho-tooltip.png" alt-text="Screenshot of the tooltip details for the state of Idaho on the filled map visual." border="false":::

1. Save your report.

Power BI provides many options for configuring the appearance of your filled map, and we reviewed only a subset. Take some time to explore the other data color and format controls. 

## Use highlighting and cross-filtering

Power BI supports highlighting locations in a filled map to cross-filter related data in other visualizations on the same report page, and vice versa.

1. Create a copy of your filled map. Select the filled map visual, then right-click and select **Copy** > **Copy visual**.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-copy-visual.png" alt-text="Screenshot that shows how to create a copy of the filled map visual." border="false":::

1. At the bottom of the report canvas, select the **Sentiment** tab to open the Sentiment report page.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-sentiment-tab.png" alt-text="Screenshot that shows how to switch to the Sentiment page in the report.":::

1. Move and resize the line chart visualizations on the page to make room for the filled map.

   In our example, we position the line charts side-by-side to make room for the filled map visual under the line charts.

1. Enter CTRL+V to paste the copy of the filled map visual onto the Sentiment report page.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-sentiment-report.png" alt-text="Screenshot that shows the filled map added to the Sentiment report page and aligned with the other visuals.":::

1. On the filled map, select a state to cross-highlight and cross-filter the other visualizations on the page.

   In our example, we select Texas (TX), and Power BI cross-filters the cards and cross-highlights the bar chart for the related data for Texas. At the top of the report page, the multi-row card visual shows the **Sentiment** as **75**. In the clustered bar chart, we see Texas is located in **Central District #23**.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-cross-filter-state.png" alt-text="Screenshot that shows the cross-highlight and cross-filter results in other visuals when we select Texas on the filled map.":::

1. Select a data point on the _VanArsdel - Sentiment by Month_ line chart.

   The selection filters the filled map to show sentiment data for _VanArsdel_ only and not other manufacturers.

   :::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-cross-filter-manufacturer.png" alt-text="Screenshot that shows the cross-highlight and cross-filter results in page visuals when we select a specific manufacturer on the line chart.":::

For more information about using the **Filters** pane, see [Add a filter to a report](../create-reports/power-bi-report-add-filter.md).

## Considerations and troubleshooting

Map data can be ambiguous. For example, there's a Paris, France, but there's also a Paris, Texas. Geographic location data is often stored in separate columns with one column for city names and another column for the corresponding state or province. When you supply Bing with only one column of data, such as the city name, it might not distinguish data for one city location from another of the same name.

If your dataset already contains latitude and longitude data, Power BI has special fields to help make the map data unambiguous. You can drag the field that contains your latitude data onto the **Latitude** section on the **Visualizations** > **Build visual** pane. You can use this same approach for your longitude data. 

:::image type="content" source="media/power-bi-visualization-filled-maps-choropleths/power-bi-set-latitude-longitude.png" alt-text="Screenshot that shows how to set the latitude and longitude options for a filled map in Power BI." border="false":::

If you don't have access to latitude and longitude data, but you have edit access to the dataset, follow the instructions in [Maps in Power View](https://support.office.com/article/Maps-in-Power-View-8A9B2AF3-A055-4131-A327-85CC835271F7) to update your dataset.

For more information about Map visualizations in Power BI, see [Tips and tricks for map visualizations](./power-bi-map-tips-and-tricks.md).

## Next steps

- Create a [shape map visualization in Power BI](desktop-shape-map.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).