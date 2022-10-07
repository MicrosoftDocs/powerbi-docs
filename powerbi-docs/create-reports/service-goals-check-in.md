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
ms.date: 07/12/2022
---

# Stay on top of your metrics

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Metrics in Power BI let customers curate their metrics and track them against key business objectives, in a single pane. In addition to seeing all your metrics in one view, scorecards make it easy for you to dig deeper into the data, update your metrics, make notes on important events, and follow metrics. These features are covered in this article. 

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

## Add or update manual values

1. In a scorecard, select the metric name.
1. In the Details pane, select **New check-in**. 
1. Complete the following actions in any order: 

    Choose a **date**.

    Enter a new or updated **value**.

    Select a **status**.
 
   Optionally, include a **note**. 

    :::image type="content" source="media/service-goals-check-in/power-bi-goals-new-check-in-manual.png" alt-text="Screenshot of Manual check-in, set date, value, status, and note.":::

1. Select **Save**. 

    :::image type="content" source="media/service-goals-check-in/power-bi-goals-check-in-posted.png" alt-text="Screenshot of Check-in is posted to the metric.":::

## Add or update connected values 

1. In a scorecard, select the metric name.
1. In the Details pane, select **New check-in**. 
1. Complete the following actions in any order: 

    Choose a **date**. Choosing a date auto-populates the value for that day. You can't override a connected value. 

    Select a **status**.

    Optionally, include a **note**. 

    :::image type="content" source="media/service-goals-check-in/power-bi-goals-new-check-in-connected.png" alt-text="Screenshot of Check-in for a connected metric.":::

1. Select **Save**. 

## Create automatic submetric roll ups

You can create automatic aggregations of submetrics up to a parent metric by creating a roll up.  These aggregations will re-calculate any time the submetric values change, and the history will be captured.  Roll ups are a great way to keep a parent metric up to date without having it backed by a report connection.  Roll ups work when submetrics are manual or connected, so you can always roll up whatever the current value is, regardless of where it's coming from.

### Get started creating roll ups

First, make sure you're in edit mode.  Select the **pencil icon** to enter inline editing of a metric.  Next to the value and target, you'll see an indication of what type of metric it is: **manual, connected, or a roll up of the submetrics**.

   :::image type="content" source="media/service-goals-check-in/roll-up-edit-metric.png" alt-text="Screenshot showing a scorecard in edit mode.":::
   
   :::image type="content" source="media/service-goals-check-in/roll-up-open-options.png" alt-text="Screenshot showing the types of metrics.":::
    
With roll ups, you have the ability to choose between a few aggregation types.
1. **SUM**: a sum of the submetric values
1. **AVERAGE**: an average of the submetric values
1. **MIN**: reflects the lowest submetric value
1. **MAX**: reflects the largest submetric value

   :::image type="content" source="media/service-goals-check-in/roll-up-open-options-two.png" alt-text="Screenshot showing the types of roll up aggregations.":::

The option you choose will automatically calculate the appropriate value and show it in either the current value or target value area. You can set up different roll up aggregation types on the current and target value, allowing for maximum flexibility.

   :::image type="content" source="media/service-goals-check-in/roll-up-sum-saved.png" alt-text="Screenshot showing a metric calculating the sum of its submetrics.":::
   
### More aspects of roll ups 
- To preserve historical values in the case of switching metric type from connected to roll up, ensure the toggle labeled **Clear metric values when connecting to a new report** in the metric connection settings is toggled off - in the left position, shown below.

    :::image type="content" source="media/service-goals-check-in/roll-up-settings.png" alt-text="Scorecard data connection settings toggle.":::

- Roll ups take place from the day it's set up moving forward - it will not remove, recalculate or override historical data with rectroactive roll up values in almost all scenarios.
- One scenario where connected historical data will be deleted is if the person creating the roll up is NOT the metric connection owner. To preserve the history, ensure the metric connection owner is the same person as the roll up creator.
- If a user changes a metric from a roll up to a connected metric and they bring in the history via report connection, the report history will override historical roll up values.
- New roll up types will calculate with the new aggregation moving forward, but not replace the history.
- Roll ups will always show the same aggregation value of all submetrics, regardless of metric level permissions.  This means if person A only has view access to 3 out of 5 submetrics, they will still see the same parent metric value as someone who has access to all submetrics.  


## Create automated status rules 

You can automate status updates based on rules that govern that metric or submetric. Rules trigger changes based on value, percentage of target met, date conditions, or a combination of the three, making the rules as versatile as possible.  For connected metrics, these status rules are refreshed every time the data in your scorecard is refreshed. For manual metrics, they're refreshed every time you perform a check-in.

   :::image type="content" source="media/service-goals-check-in/rule-types.png" alt-text="Screenshot Showing the different types of status rules including value based, % of target based, and date based.":::


### Get started creating automated rules

1. In edit mode, select the metric for which you want to create status rules.
1. In the details pane, select the tab **Status rules** > **New rule**.

    :::image type="content" source="media/service-goals-check-in/new-status-rule.png" alt-text="Screenshot Showing location of new status rules in details pane.":::

1. In the first field, you can select the dropdown caret and choose to base your rule on **Date** instead of **Value**.

    :::image type="content" source="media/service-goals-check-in/first-dropdown.png" alt-text="Screenshot of First dropdown in rule UI showing date or value.":::

1. In the second field, you can select the dropdown caret and choose a different qualifier.

    :::image type="content" source="media/service-goals-check-in/select-qualifier-second-dropdown.png" alt-text="Screenshot of Second dropdown showing qualifiers such as greater than or equal to.":::

1. The last setting(s) is based on your first dropdown.  If you chose **Value**, you can either set the value or the percent or target met.  If you selected **Date** in the first dropdown, you can select the date you want to base your rule on.

    :::image type="content" source="media/service-goals-check-in/setting-value.png" alt-text="Screenshot of Setting the value for the rule.":::
    
    :::image type="content" source="media/service-goals-check-in/date-picker.png" alt-text="Screenshot Showing date picker for date driven rule.":::

1. Now set the status that should be shown when the rules are met, and also the **Otherwise** status. 

    :::image type="content" source="media/service-goals-check-in/status-chosen.png" alt-text="Screenshot Showing selected statuses for status rules.":::


### More aspects of status rules

- With automated status rules, you can create multiple conditions to ensure your rules represent your unique business needs. You can also drag the rules to reorder the priority.  
- For the mobile experience, automatic refresh on status rules isn't supported at this time. 

    :::image type="content" source="media/service-goals-check-in/conditions.png" alt-text="Screenshot of Adding a condition to a rule.":::
    
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
