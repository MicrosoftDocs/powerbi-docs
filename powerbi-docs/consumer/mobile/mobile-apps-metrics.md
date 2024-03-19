---
title: 'Metrics in the Power BI mobile apps'
description: This article explains how to work with scorecards and metrics in the mobile app.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: quickstart
ms.date: 12/07/2022
ms.custom: mode-portal
#customer intent: I want to understand how to get monitor and update metrics in the Power BI mobile app.
---
# Metrics

Applies to:

| ![iPhone](./media/mobile-apps-metrics/ios-logo-40-px.png) | ![iPads](./media/mobile-apps-metrics/ios-logo-40-px.png) | ![Android phone](././media/mobile-apps-metrics/android-logo-40-px.png) | ![Android tablet](././media/mobile-apps-metrics/android-logo-40-px.png) | ![Windows devices](././media/mobile-apps-metrics/win-10-logo-40-px.png) |
|:--- |:--- |:--- |:--- |:--- |
|iPhones |iPads |Android phones |Android tablets | Windows devices

The Power BI mobile apps make it easy for you to keep on top of your metrics while on the go. While scorecards and metrics are [created in the Power BI service](../../create-reports/service-goals-create.md), in the app you can monitor progress on your metrics, make check-ins to update progress, add notes, and, when a metric is connected to a report, easily open the associated report to dig deeper into the data.

> [!NOTE]
> This article explains how to monitor your metrics in the mobile apps for iOS and Android devices. For information about tracking your metrics in the mobile app for Windows devices, see [Stay on top of your metrics](../../create-reports/service-goals-check-in.md). While this article shows how to monitor metrics in the Power BI service, the experience in the Windows app is similar, with the exception that in the Windows app you can't create or edit metrics and scorecards - you can only consume them and perform check-ins.

To read more about metrics, see [Get started with metrics in Power BI](../../create-reports/service-goals-introduction.md)

## Metrics hub
The metrics hub is a centralized place where you can see and update your important metrics as well as navigate to scorecards you have access to.

Tap the **Metrics** tab on the app’s home page to display the metrics hub.

![Screenshot of the metrics hub on the Power B I mobile app.](media/mobile-apps-metrics/mobile-apps-metric.png)
  
The top section of the metrics hub, **My Metrics**, displays all the metrics that matter most to you. Tap a metric to open the scorecard that the metric belongs to.

The My Metrics section is followed by a list of the scorecards you have access to, grouped as Recents, Favorites, Shared with me, etc. Tap a scorecard to open it.

### Update a metric

You can easily update a metric by tapping the ellipsis at the upper right corner of a metric’s tile.

![Screenshot of check-in from the metrics hub.](media/mobile-apps-metrics/power-bi-mobile-app-metrics-hub-update.png)

You'll get a number of options:
* **Quick check-in**: Allows you to check in a value for the current date and to update metric status. Quick check-in is not available for metrics with connected reports.
* **New check-in**: Allows you to check in a value for a date you choose, update metric status, and also add a note if you want to. In the note, you can \@mention a person if you want to get their attention. They will receive [notification](#notifications) that a check-in has been flagged for their attention.
* **Connected report (current)**: Opens the report that is connected to the metric’s “current” value. You'll only see this option if the metric's current value is connected to a report.
* **Connected report (target)**: Opens the report that is connected to the metric’s “target” value. You'll only see this option if the metric's target value is connected to a report.

## Scorecards

Metrics are created in scorecards. A scorecard is where colleagues can keep track of a set of metrics. Metrics and scorecards are [created in the Power BI service](../../create-reports/service-goals-create.md), but you can monitor and stay on top of them in the mobile app.

A scorecard has a summary that shows the number of metrics in the scorecard and the number of metrics in each status followed by a list of all the metrics.

![Screenshot of a scorecard that shows the number of metrics in the scorecard, the number of metrics in each status, and a list of all the metrics.](media/mobile-apps-metrics/power-bi-mobile-app-scorecard-status-filters.png)
 
Tap the status buttons in the summary to filter for the metrics with the selected status. You can select multiple filters. Tap the **Metrics** button to clear the filters. The image above shows the scorecard filtered by Completed and Behind status.

In the scorecard, metrics are represented by cards.

![Screenshot of a metric tile in a scorecard.](media/mobile-apps-metrics/power-bi-mobile-app-metrics-tile.png)
 
The card for a metric shows
* The name of the metric
* Metric due date
* Metric status
* Last check-in value over the target value
* A spark line illustrating progress towards the metric
* Metric owner
* An indication of whether there are any notes attached to the metric
* An expandable menu to display submetrics, if any

Tap anywhere else on the card to open the metric’s [details pane](#metric-detail-pane).

You can also tap and hold on the sparkline on a metric to see the high-low value range and cycle (if any) of check-in values.

![Screenshot of seeing the value range on a sparkline.](media/mobile-apps-metrics/power-bi-mobile-app-sparkline.png)

## Metric detail pane

A metric’s detail pane has a chart of the metric’s progress and lists all the activity on the metric – all the check-ins and notes.

![Screenshot of a metric detail pane that shows a chart of the metric’s progress and lists all the activity on the metric.](media/mobile-apps-metrics/power-bi-mobile-app-metric-details-pane.png)
 
**Action buttons**: Tap an action button to update the metric or to start/stop following it. You will have several options:
* **Quick check-in**: Allows you to check in a value for the current date and to update metric status. Quick check-in is not available for metrics with connected reports.
* **New check-in**: Allows you to check in a value for a date you choose, update metric status, and also add a note if you want to. In the note, you can \@mention a person if you want to get their attention. They will receive [notification](#notifications) that a check-in has been flagged for their attention.
* **Follow/Unfollow**: Allows you to start/stop following the metric in order to keep up to date with activity on the metric.

**Activity/Details toggle**: Use the toggle to switch between views of check-in activity on the metric and details such as connected reports or other info that the scorecard creator has configured.

![Screenshot of a metric detail pane that showing the activity/details toggle.](media/mobile-apps-metrics/power-bi-mobile-app-metric-details-pane-toggle.png)

Tap on a connected report to open it. If you don't see the name of the report, but only the word "Report", it means you don't have access to the report. Tap on the report to request access.

### Add a note to an existing check-in

Generally, you add note as part of a new check-in, but you can also add a note to an existing check-in as well. On iOS devices, just slide the relevant check-in to the left and choose **New note**. On Android devices, select the relevant check-in and then pick the **New note** icon in the upper right corner of the details pane.

![Screenshot of the add note option for an existing check-in.](media/mobile-apps-metrics/mobile-apps-add-note.png)

As mentioned, in a note you can @mention a person if you want to get their attention. They will receive [notification](#notifications) that a check-in has been flagged for their attention.

### Edit or delete a check-in
To edit or delete a check-in on iOS devices, slide the check-in to the left and tap the desired option. On Android devices, select the check-in you wish to edit or delete and then select the desired option from the icons in the upper right corner of the details pane.

![Screenshot of the delete check-in option.](media/mobile-apps-metrics/mobile-apps-delete-checkin.png)

## Notifications

Notifications help you stay up to date with information that requires your immediate attention. The Mobile apps support two types of notification that are related to metrics:
* **Metric assignment notification**: When someone assigns you a metric, you'll receive a metric assignment notification on your mobile device. This way you’ll never miss when you've become a metric owner and are now accountable for that metric.  
* **Notifications for \@mentions**: Whenever you're @mentioned in a note attached to a new or existing check-in, you'll receive a notification on your mobile device. This way, you won't miss it when someone @mentions you to get your attention.

For both kinds of notification, tapping the notification takes you right to the metrics details pane inside the scorecard, where you can see all the necessary information.

![Screenshot of metric-related push notifications in the Power B I mobile app.](media/mobile-apps-metrics/power-bi-mobile-metrics-notification.png)

## Follow metrics (preview)

You can follow metrics directly from the mobile app to keep up to date with the activity on those metrics. To start following a metric, just tap **More options (…)** on a metric’s card in the Metrics hub and choose **Follow metric**, or tap the **Follow metric** button in the metric's details pane.

![Screenshot showing how to mark a metric for following in the Power B I mobile app.](media/mobile-apps-metrics/power-bi-mobile-app-follow-metric.png)

To see all the metrics you're following, tap the metrics display dropdown in the Metrics hub and select **Following (preview)** in the metrics list that appears.

![Screenshot showing how to display followed metrics in the Power B I mobile app's Metrics tab.](media/mobile-apps-metrics/power-bi-mobile-app-show-followed-metrics.png)

It makes no difference whether the metric was marked for following in the Power BI service or in the mobile app - you'll see them all. Likewise, in the Power BI service you'll also be able to see all your followed metrics - including those that you started following from the mobile app.

## Related content

* [Introducing metrics in Power BI](https://powerbi.microsoft.com/en-us/blog/introducing-goals-in-power-bi/)
* [Get started with metrics in Power BI](../../create-reports/service-goals-introduction.md)
* [Stay on top of your metrics in Power BI](../../create-reports/service-goals-check-in.md)
* [Create scorecards and manual metrics in Power BI](../../create-reports/service-goals-create.md)
* [Create connected metrics in Power BI](../../create-reports/service-goals-create-connected.md)