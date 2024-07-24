---
title: Filter report by geographic location in a Power BI mobile app
description: Learn how you can filter a report by your geographic location in the Microsoft Power BI mobile apps, if the report owner set geographic tags.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 03/11/2020
---
# Filter a report by geographic location in the Power BI mobile apps
Applies to:

| ![iPhone](./media/mobile-apps-geographic-filtering/iphone-logo-50-px.png) | ![iPad](./media/mobile-apps-geographic-filtering/ipad-logo-50-px.png) | ![Android phone](./media/mobile-apps-geographic-filtering/android-phone-logo-50-px.png) | ![Android tablet](./media/mobile-apps-view-dashboard/android-tablet-logo-50-px.png) | ![Windows phone](./media/mobile-apps-geographic-filtering/win-10-logo-50-px.png) |
|:--- |:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |Windows phones |

When you look at a Power BI report on your mobile device, do you see a little pushpin icon in the upper-right corner? If so, then you can filter that report based on your geographic location.

> [!NOTE]
> You can only filter by location if the geographic names in the report are in English; for example, "New York City" or "Germany". Windows tablets and PCs don't support geographic filtering, but Windows phones do.

>[!NOTE]
>Power BI mobile app support for **phones using Windows 10 Mobile** has been discontinued as of March 16, 2021. [Learn more](/legal/powerbi/powerbi-mobile/power-bi-mobile-app-end-of-support-for-windows-phones)

## Filter your report by your geographic location
1. Open a report in the Power BI mobile app on your mobile device.
1. If the report has geographic data, you see a message asking to allow Power BI to access your location. Click **Allow**, then tap **Allow** again.
1. Tap the push pin ![Push pin icon](./media/mobile-apps-geographic-filtering/power-bi-mobile-geo-icon.png). You can filter by city, state/province, or country/region, depending on the data in the report.

    > [!NOTE]
    > The geographic filter only appears if a value in a column marked as geographic data (a city name, for example) appears in the location information your mobile device gathers in your current location.
   
    ![Push pin filter](./media/mobile-apps-geographic-filtering/power-bi-mobile-geo-map-set-filter.png)

## Why don't I see location tags on a report?
All three of the conditions below must be met for you to see location tags. 

* The person who created the report in Power BI Desktop  must have [categorized geographical data](../../transform-model/desktop-mobile-geofiltering.md) for at least one column, such as City, State, or Country/Region.
* The location data gathered by your device in your current location matches a value in the column marked as geographic data. 
* You're using one of these mobile devices:
  * iOS (iPad, iPhone, iPod).
  * Android (phone, tablet).
  * Windows phone (other Windows devices such as PCs and tablets don't support geographic filtering).

Read more about [setting up geographic filtering](../../transform-model/desktop-mobile-geofiltering.md) in Power BI Desktop.

### Related content

* [Connect to Power BI data from the real world](mobile-apps-data-in-real-world-context.md) with the mobile apps
* [Data categorization in Power BI Desktop](../../transform-model/desktop-data-categorization.md) 
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)