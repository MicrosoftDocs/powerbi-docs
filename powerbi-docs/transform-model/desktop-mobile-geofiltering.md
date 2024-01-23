---
title: Set geographic filters in Power BI Desktop for the mobile apps
description: Learn how to set your model’s geographic filtering in Power BI Desktop, so you can automatically filter data for your location in Power BI mobile apps.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 02/28/2023
LocalizationGroup: Model your data
---
# Set geographic filters in Power BI Desktop for use in the mobile app

In Power BI Desktop, you can [categorize geographical data](desktop-data-categorization.md) for a column, so Power BI Desktop knows how to treat values in visuals in a report. As an added benefit, when you or your colleagues view that report in the Power BI mobile apps, Power BI automatically provides geographical filters that match where you are.

For example, say you're a sales manager that travels to meet customers, and you want to quickly filter the total sales and revenue for the specific customer you're planning to visit. You want to break out the data for your current location, whether by state, city, or an actual address. Later, if you have time left, you'd like to visit other customers located nearby. You can [filter the report by your location to find those customers](../consumer/mobile/mobile-apps-geographic-filtering.md).

> [!NOTE]
> You can only filter by location in the mobile app if the geographic names in the report are in English; for example, "New York City" or "Germany".
>
>

## Identify geographic data in your report

1. In Power BI Desktop, switch to the Data view :::image type="icon" source="media/desktop-mobile-geofiltering/pbi_desktop_data_icon.png"::: .

2. Select a column with geographic data, for example, a City column.

    :::image type="content" source="media/desktop-mobile-geofiltering/power-bi-desktop-geo-column.png" alt-text="Screenshot of the Data Category dropdown list with City highlighted.":::

3. On the **Column tools** tab, select **Data category**, then the correct category, in this example, **City**.

    :::image type="content" source="media/desktop-mobile-geofiltering/power-bi-desktop-geo-category.png" alt-text="Screenshot of the data icon in Power BI Desktop with the City column highlighted.":::

4. Continue setting geographic data categories for any other fields in the model.

   > [!NOTE]
   > You can set multiple columns for each data category in a model, but if you do, the model can't filter for geography in the Power BI mobile app. To use geographic filtering in the mobile apps, set only one column for each data category. For example, set only one **City** column, one **State or Province** column, and one **Country or Region** column.
   >
   >

## Create visuals with your geographic data

1. Switch to the Report view, :::image type="icon" source="media/desktop-mobile-geofiltering/power-bi-desktop-report-icon.png"::: and create visuals that use the geographic fields in your data.

    :::image type="content" source="media/desktop-mobile-geofiltering/power-bi-desktop-geo-report.png" alt-text="Screenshot of Report view showing a map and a clustered bar chart visual.":::

    In this example, the model also contains a calculated column that brings city and state together into one column. To learn more, see [creating calculated columns in Power BI Desktop](desktop-calculated-columns.md).

    :::image type="content" source="media/desktop-mobile-geofiltering/power-bi-desktop-city-state-column.png" alt-text="Screenshot of the calculated column highlighted in the field list.":::
2. Publish the report to the Power BI service.

## View the report in Power BI mobile app

1. Open the report in any of the [Power BI mobile apps](../consumer/mobile/mobile-apps-for-mobile-devices.md).
2. If you're in a geographic location with data in the report, you can filter it automatically to your location.

    :::image type="content" source="media/desktop-mobile-geofiltering/power-bi-mobile-geo-map-set-filter.png" alt-text="Screenshot of a report in the Power BI app highlighting the geographic filter.":::

To learn more, see [filtering a report by location in the Power BI mobile apps](../consumer/mobile/mobile-apps-geographic-filtering.md).

## Related content

* [Specify data categories in Power BI Desktop](desktop-data-categorization.md)  
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
