---
title: Filter report by geographic location in a Power BI mobile app
description: Learn how you can filter a report by your geographic location in the Microsoft Power BI mobile apps, if the report owner set geographic tags.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 08/01/2024
---
# Filter a report by geographic location in the Power BI mobile apps
Applies to:

| ![iPhone](./media/mobile-apps-geographic-filtering/iphone-logo-50-px.png) | ![iPad](./media/mobile-apps-geographic-filtering/ipad-logo-50-px.png) | ![Android phone](./media/mobile-apps-geographic-filtering/android-phone-logo-50-px.png) | ![Android tablet](./media/mobile-apps-view-dashboard/android-tablet-logo-50-px.png) |
|:--- |:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |

If you look at the footer menu of at a Power BI report on your mobile device and see a globe, it means you can filter that report based on your geographic location.

:::image type="content" source="./media/mobile-apps-geographic-filtering/geographic-filter-menu-option.png" alt-text="Screenshot showing the globe icon in the report options menu that indicates that the report has geographic data you can filter." border="false":::

> [!NOTE]
> You can only filter by location if the geographic names in the report are in English; for example, "New York City" or "Germany".

## Filter your report by your geographic location

1. Open a report in the Power BI mobile app on your mobile device.

1. If the report has geographic data, you see a message asking to allow Power BI to access your location. Click **Allow**, then tap **Allow** again.

1. Open the report's option's menu and tap the globe icon. You can filter by city, state/province, or country/region, depending on the data in the report.

    > [!NOTE]
    > The geographic filter only appears if a value in a column marked as geographic data (a city name, for example) appears in the location information gathered by your mobile device in your current location.

## Why don't I see location tags on a report?

All three of the conditions below must be met for you to see location tags.

* The person who created the report in Power BI Desktop must have [categorized geographical data](../../transform-model/desktop-mobile-geofiltering.md) for at least one column, such as City, State, or Country/Region.

* The location data gathered by your device in your current location must match a value in the column marked as geographic data. For example, if a report has data that is marked as Seattle, Washington, and your device's current location data includes Washington, the geofilter will filter for records that are relevant for Washington. If your device's current location data includes both Seattle and Washington, then the geofilter will display data for both Seattle and Washington. If the current location data on your device doesn't include either Seattle or Washington, the geofilter will not appear.

* You're using an iOS (iPad, iPhone or iPod) or Antroid (phone or tablet) mobile device.

Read more about [setting up geographic filtering](../../transform-model/desktop-mobile-geofiltering.md) in Power BI Desktop.

### Related content

* [Connect to Power BI data from the real world](mobile-apps-data-in-real-world-context.md) with the mobile apps
* [Data categorization in Power BI Desktop](../../transform-model/desktop-data-categorization.md) 
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)