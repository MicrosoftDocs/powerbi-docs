---
title: Explore Power BI Data in the Mobile App on Your Apple Watch
description: Learn how to install and use the Power BI Apple Watch app to view and Power BI content on your watch.
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
---

# Explore your data in the Power BI mobile app on your Apple Watch

With the Power BI Apple Watch app, you can view KPIs and card tiles from your Power BI dashboards, right on your watch. KPIs and card tiles are best suited to providing a heartbeat measure on the small screen. You can refresh a dashboard from your iPhone or from the watch itself.

## Install the Apple Watch app

The Power BI Apple Watch app is bundled with the Power BI for iOS app, so when you [download the Power BI app to your iPhone](https://go.microsoft.com/fwlink/?LinkId=522062 "Download the iPhone app") from the Apple App Store, you're automatically also downloading the Power BI Apple Watch app. The Apple guide explains how to [install Apple Watch applications](https://support.apple.com/HT204784).

## Use the Power BI app on the Apple Watch

Get to the Power BI Apple Watch app either from the watch's springboard, or by tapping the Power BI widget (if configured) directly from the watch face.

:::image type="content" source="./media/mobile-apple-watch/pbi_aplwatch_complicatn240arrow.png" border="false" alt-text="Photograph shows an Apple Watch with the Power BI app.":::

The Power BI Apple Watch app consists of two parts.

- The **index screen** allows a quick overview of all KPI and card tiles from the synced dashboard.
  
  :::image type="content" source="./media/mobile-apple-watch/pbi_aplwatch_indexscreen240.png" border="false" alt-text="Photograph of an Apple Watch with the index screen.":::

- The **in-focus tile** allows you to tap a tile on the index screen for an in-depth view of a specific tile.
  
  :::image type="content" source="./media/mobile-apple-watch/pbi_aplwatch_kpi.png" border="false" alt-text="Photograph showing an Apple Watch displaying a tile.":::

## Refresh a dashboard from your Apple Watch

You can refresh a synced dashboard directly from your watch.

- While in the dashboard view on the watch app, deep press your screen and tap **refresh**.

Your watch app will now sync your dashboard with data from the Power BI service.

> [!NOTE]
> The watch app communicates with Power BI via the Power BI mobile app on the iPhone. Therefore, the Power BI app must be running on your iPhone, at least in the background, for the dashboard on the watch app to refresh.

## Refresh a dashboard on your Apple Watch from your iPhone

You can also refresh a dashboard that's on your Apple Watch from your iPhone.

1. In Power BI on your iPhone, open the dashboard you want to sync with the Apple Watch.
1. Select **More options** (...) > **Sync with Watch**.

Power BI shows an indicator that the dashboard is synced with the watch.

You can only sync one dashboard at a time with the watch.

> [!TIP]
> To view tiles from multiple dashboards on your watch, create a new dashboard in the Power BI service, and pin all the relevant tiles to it.

## Set a custom Power BI widget

You can also display a specific Power BI tile directly on the Apple Watch face, so that it's visible and accessible at all times.

The Power BI Apple Watch widget updates close to the time your data updates, keeping your needed information always up to date.

### Add a Power BI widget to your watch face

See [Customize your Apple Watch face](https://support.apple.com/HT205536) in the Apple Guide.

### Change the text on the widget

Given the small space on the Apple Watch face, the Power BI Apple Watch app lets you change the title of the widget to fit the small space.

1. On your iPhone, go to the Apple Watch control app.
1. Select Power BI.
1. Navigate to the widget name field, and then type a new name.
  
  :::image type="content" source="./media/mobile-apple-watch/pbi_aplwatch_oniphone.png" border="false" alt-text="Screenshot showing an iPhone with the My Watch app open and the Power BI icon visible.":::

> [!NOTE]
> If you don't change the name, the Power BI widget will shorten the name to the number of characters that fit the small space on the watch face.

## Considerations and limitations

- Card visuals that have a calculated function on the data label color, and that are pinned to a dashboard, might not appear on the Apple Watch when the dashboard is synced with it.

## Related content

- [What are the Power BI mobile apps?](mobile-apps-for-mobile-devices.md)
- [View dashboards in the Power BI mobile apps](mobile-apps-view-dashboard.md)
- [Get started with the Power BI mobile app on iOS devices](mobile-iphone-app-get-started.md)
- [What's new in the mobile apps for Power BI](mobile-whats-new-in-the-mobile-apps.md)
