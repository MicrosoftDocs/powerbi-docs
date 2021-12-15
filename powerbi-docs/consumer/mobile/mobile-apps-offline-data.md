---
title: View your data offline in the Power BI mobile apps
description: 'Read about an advantage of viewing Power BI in a mobile app rather than in a mobile browser: you can see your data even when you''re not connected to a network.'
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 10/19/2021
---

# View your data offline in the Power BI mobile apps
Applies to:

| ![iPhone](./media/mobile-apps-offline-data/iphone-logo-50-px.png) | ![iPad](./media/mobile-apps-offline-data/ipad-logo-50-px.png) | ![Android phone](./media/mobile-apps-offline-data/android-phone-logo-50-px.png) | ![Android tablet](./media/mobile-apps-offline-data/android-tablet-logo-50-px.png) | ![Windows 10](./media/mobile-apps-offline-data/win-10-logo-50-px.png) |
|:--- |:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |Windows 10 devices |

>[!NOTE]
>Power BI mobile app support for **phones using Windows 10 Mobile** has been discontinued as of March 16, 2021. [Learn more](/legal/powerbi/powerbi-mobile/power-bi-mobile-app-end-of-support-for-windows-phones)

One advantage of viewing Power BI in a mobile app rather than in a mobile browser is that you can see your data even when you're not connected to a network. 

![No network message](./media/mobile-apps-offline-data/power-bi-iphone-no-network.png)

By default, Power BI refreshes the data frequently so you get up-to-date answers to your business questions any time, even while commuting or roaming.

## Data access while you're offline
While you're offline, you can access and interact with dashboards you've accessed previously from the mobile app.

You also have read-only access to any Power BI reports you've accessed previously from the mobile app. You can see the full report, but not filter, cross-filter, sort, or use slicers on it.

>[!NOTE]
> Reports based on DirectQuery or live connection are not cached and are not available offline.

## Background data refresh
Background refresh updates your favorite dashboards, plus dashboards and reports you've viewed in the last two weeks, with the data on the Power BI service (not the data source). If you're connected to wifi, background refresh updates every 2 hours. Otherwise, if you're on a 3G network, Power BI updates the content every 24 hours.

You can turn off background refresh, for example, to avoid network usage. Check the settings on your device.

> [!NOTE]
> If you use the Power BI mobile app on an iOS device and your organization has configured Microsoft Intune MAM, then background data refresh is turned off. The next time you enter the app, Power BI refreshes the data from the Power BI service on the web.
> 
> Read more about [configuring Power BI mobile apps with Microsoft Intune](../../admin/service-admin-mobile-intune.md). 
> 
> 

## Offline indicators
Power BI provides clear indicators when you go in and out of offline mode, as well as indicators for missing dashboards, reports, and tiles that aren't available offline.

## Considerations and limitations
When you're offline with Power BI on your mobile device, you may encounter these limitations:

* Power BI can cache up to 250 MB of data offline.
* Reports based on DirectQuery or live connection are not cached and are not available offline.
* Some tile types require an active server connection, so they aren't available offline; for example, Bing map tiles and some custom tiles.
* Whole Excel workbooks in Power BI aren't available offline.
* You can see Reporting Services mobile reports and KPIs offline, if you have viewed them while connected. They don't refresh in the background. They refresh every time you open them.
* In the Power BI mobile apps, you can't see Power BI Desktop (.pbix) files saved to Power BI Report Server. 
* Paginated reports (RDL) are not available while the network is offline.

## Next steps
Your feedback helps us decide what to implement in the future, so don't forget to vote for other features you'd like to see in Power BI mobile apps. 

* [Power BI apps for mobile devices](mobile-apps-for-mobile-devices.md)
* Follow @MSPowerBI on Twitter
* Join the conversation at the [Power BI Community](https://community.powerbi.com/)
* [What is Power BI?](../../fundamentals/power-bi-overview.md)