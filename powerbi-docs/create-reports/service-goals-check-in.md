---
title: Stay on top of your metrics in Power BI
description: In addition to seeing all your metrics in one view, scorecards make it easy for you to dig deeper into the data, update your metrics, and make notes on important events.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/10/2022
---

# Stay on top of your metrics

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Metrics in Power BI let your customers curate their metrics and track them against key business objectives, in a single pane. In addition to seeing all your metrics in one view, scorecards make it easy for you to dig deeper into the data, update your metrics, make notes on important events, and follow metrics. These features are covered in this article. 

## View metric details 

The metrics Details pane provides the entire history for the metric from the start date, including check-ins, status changes, and relevant notes. 

- To access the details pane, open a scorecard and select the metric name. Power BI automatically shows the details pane.

    :::image type="content" source="media/service-goals-check-in/power-bi-goals-details-pane.png" alt-text="Screenshot of The Details pane for a metric.":::
    
    
## Filtering and keyword search 

You can filter scorecards to metrics labeled as a particular status. Selecting the summary cards at the top of the scorecard makes it easy to see what is on track or at risk. 

This metric is _at risk_.

:::image type="content" source="media/service-goals-check-in/filtered-at-risk.png" alt-text="Screenshot of Metrics filtered to status at risk via summary card.":::

This metric is _behind_.

:::image type="content" source="media/service-goals-check-in/filtered-behind.png" alt-text="Screenshot of Metrics filtered to status behind via summary card.":::

There's also a keyword search that filters the scorecard down to metrics that match the keyword.  Select the **Filter** icon above the first metric and type the keywords you're looking for.  The scorecard filters to show those results, without losing the context of any parent/child metric relationships, making it easy to quickly find a particular metric and see how it's doing.

The scorecard before filtering.

:::image type="content" source="media/service-goals-check-in/keyword-highlighted.png" alt-text="Screenshot Indicating location of keyword search on scorecard.":::

The scorecard filtered to _Premium_.

:::image type="content" source="media/service-goals-check-in/keyword-premium.png" alt-text="Screenshot of Keyword search results for premium product SKU.":::

## Update manual values

1. In a scorecard, select the metric name.
1. In the **Details** pane, select **New check-in**. 
1. Complete the following actions in any order: 

    Choose a **date**.

    Enter a new or updated **value**.

    Select a **status**.
 
   Optionally, include a **note**. 

    :::image type="content" source="media/service-goals-check-in/power-bi-goals-new-check-in-manual.png" alt-text="Screenshot of Manual check-in, set date, value, status, and note.":::

1. Select **Save**. 

    :::image type="content" source="media/service-goals-check-in/power-bi-goals-check-in-posted.png" alt-text="Screenshot of Check-in is posted to the metric.":::

## Update connected values 

1. In a scorecard, select the metric name.
1. In the **Details** pane, select **New check-in**. 
1. Complete the following actions in any order: 

    Choose a **date**. Choosing a date auto-populates the value for that day. You can't override a connected value. 

    Select a **status**.

    Optionally, include a **note**. 

    :::image type="content" source="media/service-goals-check-in/power-bi-goals-new-check-in-connected.png" alt-text="Screenshot of Check-in for a connected metric.":::

1. Select **Save**. 

### Follow metrics

Use the _Follow_ functionality to quickly access metrics you’re interested in and stay up to date on the activity on these metrics. You can follow metrics as you’re browsing through different scorecards and later access all your followed metrics in one place. This makes it easy to get a quick overview of the metrics you care about, without having to navigate to different scorecards often.

To follow, hover over the metric in the scorecard to select the **Follow metric** icon.

:::image type="content" source="media/service-goals-check-in/follow-metric.png" alt-text="Screenshot of following a metric.":::
    
To see all your followed metrics, go to the Metrics hub and select **Following**.
    
:::image type="content" source="media/service-goals-check-in/following-metrics.png" alt-text="Screenshot of followed metrics in Metrics hub.":::
    
Once you follow a metric, you'll get Teams notifications whenever the metric definition is updated, a check-in is added, or an automated status rule changes the status of the metric. Read more about [notifications in Teams](../collaborate-share/service-teams-notifications.md).

To unfollow and stop getting Teams notifications, select the **Unfollow metric** icon while hovering over the metric.

:::image type="content" source="media/service-goals-check-in/unfollow-metric.png" alt-text="Screenshot of unfollowing a metric.":::

## Next steps

- [Get started with metrics in Power BI](service-goals-introduction.md)
- [Create scorecards and manual metrics in Power BI](service-goals-create.md)
- [Create connected metrics in Power BI](service-goals-create-connected.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
