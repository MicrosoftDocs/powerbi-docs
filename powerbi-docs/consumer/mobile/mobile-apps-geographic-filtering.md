---
title: Filter report by geographic location in a Power BI mobile app
description: Learn how you can filter a report by your geographic location in the Microsoft Power BI mobile apps, if the report owner set geographic tags.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 08/05/2024
---

# Filter a report by geographic location in the Power BI mobile apps
Applies to:

| ![iPhone](./media/mobile-apps-geographic-filtering/iphone-logo-50-px.png) | ![iPad](./media/mobile-apps-geographic-filtering/ipad-logo-50-px.png) | ![Android phone](./media/mobile-apps-geographic-filtering/android-phone-logo-50-px.png) | ![Android tablet](./media/mobile-apps-view-dashboard/android-tablet-logo-50-px.png) |
|:--- |:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |

If the report your viewing has geographic data, and you're in a location to which a geographic filter applies, you can filter the report based on your location.

## Filter your report by your geographic location

1. Open the report in the Power BI mobile app on your mobile device.

1. If the report has geographic data, you see a message asking to allow Power BI to access your location. Tap **Allow**, then tap **Allow** again.

1. Open the report's option's menu. If there's a globe icon in the options, it means you can filter the report based on your geographic location.

    :::image type="content" source="./media/mobile-apps-geographic-filtering/geographic-filter-menu-option.png" alt-text="Screenshot showing the globe icon in the report options menu that indicates that the report has geographic data you can filter." border="false":::

1. Tap the **Geo Filter** icon. You can filter by city, state/province, or country/region, depending on the data in the report.

## Why don't I see location tags on a report?

All of the following conditions must be met for you to see location tags.

* The report must contain geographic data. such as city, state, or country/region. Read about [setting up geographic filtering](../../transform-model/desktop-mobile-geofiltering.md) in Power BI Desktop.

* The geographic names in the report must be in English; for example, "New York City" or "Germany".

* You must be using a mobile device that supports geo filtering: iOS (iPad or iPhone) or Android (phone or tablet).

* The location information gathered by your mobile device in your current location must match a value in a column marked as geographic data (city name, for example) in the report. For example, if a report has data that is marked as Seattle, Washington:

    * If your device's location data shows that you're in Seattle, Washington, you'll be able to filter both on Seattle and on Washington.

    * If your device's location data shows that you're in Redmond, Washington, you'll be able to filter on Washington.

    * If your device's location data shows that you're in California, no geo filter will appear.

* The spelling of the geographic data in the report must match the spelling used in the location data gathered by your mobile device. For example, if St. Louis is used in your report's geographic data, but you device location data shows you're in Saint Louis, the geo filter won't appear.

## Related content

* [Connect to Power BI data from the real world](mobile-apps-data-in-real-world-context.md) with the mobile apps
* [Data categorization in Power BI Desktop](../../transform-model/desktop-data-categorization.md) 
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)