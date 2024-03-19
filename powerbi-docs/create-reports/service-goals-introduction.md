---
title: Get started with metrics in Power BI
description: Get started with an introduction to metrics in Power BI
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.search.form: Get started with metrics
ms.topic: how-to
ms.date: 11/03/2023
ms.custom: intro-get-started
---
# Get started with metrics in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Metrics in Power BI let customers curate their metrics and track them against key business objectives, in a single pane. This feature enhances data culture by promoting accountability, alignment, and visibility for teams and initiatives within organizations.

:::image type="content" source="media/service-goals-introduction/power-bi-metrics-hub.png" alt-text="Screenshot of Metrics page with metrics, scorecards, and samples.":::

## More articles about metrics

This article covers the basics of using metrics in the Power BI service. See the other articles about metrics for more detail:

- [Create scorecards and manual metrics in Power BI](service-goals-create.md)
- [Create metrics that are connected to an existing report visual](service-goals-create-connected.md)
- [Get started with hierarchies in Power BI scorecards](service-metrics-get-started-hierarchies.md)
- [Stay on top of your metrics](service-goals-check-in.md)
- [Follow your metrics](service-metrics-follow.md)
- [Keep on top of your metrics on the go in the Power BI mobile apps, too](../consumer/mobile/mobile-apps-metrics.md)
- [Protect your scorecards with goal-level permissions](service-goals-set-permissions.md)
- [Arrange metrics and columns in scorecards](service-goals-move.md)
- [Customize statuses in scorecards](service-goals-custom-status.md)
- [Get notifications in Teams about changes to metrics](../collaborate-share/service-teams-notifications.md#metrics-notifications)

## License requirements

Metrics are a Pro feature. Users can access various aspects of the experience depending on their license.

|Permission  |Minimum requirements  |
|---------|---------|
|Author and share scorecards and metrics, and perform check-ins | Power BI Pro license |
|View scorecards and metrics  | Power BI Premium or Fabric F64 or greater capacity + Free user <br><br>OR <br><br>Power BI Pro license |
|View scorecard samples and author scorecards in My Workspace  |  Free user |

If you don’t meet the minimum requirements for any of these, contact your Power BI administrator before you begin.  

## Explore the Metrics hub page 

After you sign in to the Power BI service, select Metrics from the navigation pane. Power BI displays your Metrics hub page. The layout and content in the Metrics page is different for every user. As a new user, your Metrics page will be empty, as shown the following image.

:::image type="content" source="media/service-goals-introduction/power-bi-metrics-new-home.png" alt-text="Screenshot of The new, empty Metrics home page.":::


### Recommended

The top section contains all the metrics that matter the most to you, and the scorecard samples. Power BI curates these metrics automatically, based on metrics that you're assigned to, you've edited, or you've performed a recent check-in. If you don't have any scorecards yet, you see the samples there.

:::image type="content" source="media/service-goals-introduction/scorecard-samples-recommended.png" alt-text="Screenshot of Top section contains all the metrics that matter the most to you.":::

A metric must have at least two values, **Current** and **Target**, to show up in this section. 

### Recent, Favorites, Shared with me, and All Scorecards 

The next section is a tabbed list. 

:::image type="content" source="media/service-goals-introduction/power-bi-metrics-recent.png" alt-text="Screenshot of Recent metrics on the Metrics tab.":::

- **Recent** are the scorecards you've visited most recently. Each item has a timestamp. 
- **Favorites** are the scorecards you've starred.

    :::image type="content" source="media/service-goals-introduction/power-bi-metrics-favorites.png" alt-text="Screenshot of Star your favorite scorecards.":::

- **Shared with me** contains scorecards that your colleagues have shared with you. 
- **All scorecards** lists all the scorecards you have access to. 

## Change the scorecard view

When you're viewing your scorecard, you can also change the view from **List view** to **Compact view**, which is currently in preview.

:::image type="content" source="media/service-goals-introduction/metrics-compact-view.png" alt-text="Screenshot showing Compact view menu item.":::

Compact view adjusts to various screen sizes and supports resizing columns. You can do everything you can do in list view, except editing and creating a new metric.

## Frequently asked questions (FAQ)

**Why don’t I see history for my metric when I connect to a Power BI data point?**

You don’t see a history for a single data point because we only pull history for time series data. To see the history of your metric when you connect to time series data, select **Track all data in this time series** when you connect. 

**I'm connecting to time series data and still don’t see the history of the metric. Why not?**

We don't pull in the history of time series if we only have a partial date, for example, day of the week or month. We can only pull in the history of a time series when we have a full date to track, such as day, month, and year.  

**Why aren't my metrics getting updated over time in my scorecard?**

There are a few reasons why your metric may not be getting updated:

- It’s a manual metric: Manual metrics aren't updated automatically as they're not connected to a data source with regular refreshes.  To create a history for a manual metric, do regular check-ins.
- You don't have scheduled refresh for the semantic model: Metric values are only updated as often as the semantic model is refreshed.  If you don’t have a scheduled refresh on your semantic model, you don't see any updates in the metric value. Learn about [scheduled refresh](../connect-data/refresh-scheduled-refresh.md).
- Metrics don’t get updated if they're created from a push dataset. 

**I'm trying to create a metric but I can’t connect to a report. Why do I see a yellow warning icon?**

To connect your current value or target to data, you need build permissions for that report. Learn about [build permissions](../connect-data/service-datasets-build-permissions.md). 

**I shared a scorecard but my users can’t do check-ins and add notes. Why not?**

Currently, users need to have edit permissions for the scorecard to add check-ins. Updated scorecard and metric-level permissions are in the works. They'll allow check-in permissions without edit permissions for the scorecard.  

**Why can’t I update the value as part of my check-in?**

You can only update values in manual metrics.  If a metric value is connected to data, you can't update it manually. The data is pulled directly from the report and is updated as often as the semantic model refreshes.

**How often do metrics update in the scorecard?**

Metrics only update as often as the data updates in the semantic model.  We support connecting via import, live connection, and DirectQuery.  Additionally, we take snapshots of the metrics data at a maximum daily cadence, and always retain the last updated value for a given day. The snapshots are always available in the underlying semantic model we create, which you can then build content on top of.

**I changed the tracking cycle of my metric. Why does the data still look the same?**

Changing the tracking cycle only changes the trend that you see below your value/target area.  Changing this setting doesn't impact refreshes on the data or when your data is updated in the metrics.

**Why don’t I see the Power BI workspace I’m looking for when I create a scorecard?**

In order to create a scorecard in a workspace, you need a contributor or owner role in that workspace. Learn about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md). 

Scorecards do have metric-level permissions roles. While workspace permissions give view or build access to the workspace, metric-level permissions restrict access. Certain people can only see certain metrics and perform check-ins within a scorecard. Read more about [metric-level permissions in scorecards](service-goals-set-permissions.md).

## Issues and limitations 
  
- Metrics don't yet support bring your own key (BYOK).
- Metrics don't yet support row-level security (RLS).
- For now, the maximum number of submetric levels is four.
- Metrics don't support publish-to-web.
- Business-to-business sharing (sharing across tenants) isn't supported.
- Scorecards aren't supported in a [Multi-Geo capacity](../admin/service-admin-premium-multi-geo.md).
- Scorecards aren't supported in [embedded analytics](../developer/embedded/embedded-analytics-power-bi.md).

## Related content

- [Create scorecards and manual metrics in Power BI](service-goals-create.md)
- [Create connected metrics in Power BI](service-goals-create-connected.md)
- [Stay on top of your metrics in Power BI](service-goals-check-in.md)
- [Protect your scorecard with metric-level permissions](service-goals-set-permissions.md)
- [Metrics admin settings](/fabric/admin/service-admin-portal-goals-settings)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
