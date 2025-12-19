---
title: Stay on top of your goals in Power BI
description: In addition to seeing all your goals in one view, with scorecards you can dig deeper into the data, update your goals, and make notes on important events.
author: kgremban
ms.author: kgremban
ms.reviewer: monicacl
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.search.form: Stay on top of your goals
ms.topic: how-to
ms.date: 11/01/2025

#customer intent: As a Power BI user I want to learn how to show the follow and keep track of my goals on Power BI scorecards.
---

# Stay on top of your goals

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Goals in Power BI let you curate your metrics and track them against key business objectives, all in a single pane. In addition to seeing all your goals in one view, scorecards make it easy for you to dig deeper into the data, update your goals, and make notes on important events. This article covers these features. You can also [follow your goals](service-goals-follow.md), to be notified when they change.

## View goal details

The goals **Details** pane provides the entire history for the goal from the start date, including check-ins, status changes, and relevant notes.

To access the details pane, open a scorecard and select the goal name. Power BI automatically shows the details pane.
:::image type="content" source="media/service-goals-check-in/power-bi-goals-details-pane.png" alt-text="Screenshot of The Details pane for a goal.":::

## Filtering and keyword search

You can filter scorecards to view the goals that are labeled as a particular status. Select the summary cards at the top of the scorecard to see what is on track or at risk. 

In the following screenshot, the highlighted goals are *at risk*.

:::image type="content" source="media/service-goals-check-in/filtered-at-risk.png" alt-text="Screenshot of goals filtered to status at risk via summary card." lightbox="media/service-goals-check-in/filtered-at-risk.png":::

In the following screenshot, the highlighted goal is *behind*.

:::image type="content" source="media/service-goals-check-in/filtered-behind.png" alt-text="Screenshot of goals filtered to status behind via summary card." lightbox="media/service-goals-check-in/filtered-behind.png":::

There's also a keyword search that filters the scorecard down to goals that match the keyword.  Select the **Filter** icon above the first goal and type the keywords you're looking for.  The scorecard filters to show those results, without losing the context of any parent or child goal relationships, making it easy to quickly find a particular goal and see how it's doing.

The following screenshot shows a scorecard before filtering.

:::image type="content" source="media/service-goals-check-in/keyword-highlighted.png" alt-text="Screenshot Indicating location of keyword search on scorecard." lightbox="media/service-goals-check-in/keyword-highlighted.png":::

The following screenshot shows a scorecard filtered with the keywork *attrition*.

:::image type="content" source="media/service-goals-check-in/keyword-premium.png" alt-text="Screenshot of Keyword search results for goals related to attrition." lightbox="media/service-goals-check-in/keyword-premium.png" :::

## Update manual values

1. In a scorecard, select the goal name.
1. In the **Details** pane, select **New check-in**.
1. Complete the following actions:

   * Choose a **date**.

   * Enter a new or updated **value**.

   * Select a **status**.

   * Optionally, include a **note**.

   :::image type="content" source="media/service-goals-check-in/power-bi-goals-new-check-in-manual.png" alt-text="Screenshot of Manual check-in, set date, value, status, and note.":::

1. Select **Save**.

   The check-in details appear in the **Activity** section of the goal **Details** pane.

   :::image type="content" source="media/service-goals-check-in/power-bi-goals-check-in-posted.png" alt-text="Screenshot of Check-in is posted to the goal.":::

## Update connected values

1. In a scorecard, select the goal name.
1. In the **Details** pane, select **New check-in**.
1. Complete the following actions:

   * Choose a **date**. Choosing a date auto-populates the value for that day. You can't override a connected value.

   * Select a **status**.

   * Optionally, include a **note**.

   :::image type="content" source="media/service-goals-check-in/power-bi-goals-new-check-in-connected.png" alt-text="Screenshot of Check-in for a connected goal.":::

1. Select **Save**.

## Related content

* [Get started with goals in Power BI](service-goals-introduction.md)
* [Create scorecards and manual goals in Power BI](service-goals-create.md)
* [Create connected goals in Power BI](service-goals-create-connected.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
