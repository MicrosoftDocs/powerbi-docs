---
title: Automate status rules for metrics in Power BI
description: Learn how to automate status updates for metrics in Power BI based on rules that trigger changes using value, percentage of target met, or date conditions.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/22/2024
#customer intent: As a Power BI user I want to learn how to automate status updates for metrics in Power BI.
---

# Create automated status rules for metrics in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Metrics in Power BI let customers curate their metrics and track them against key business objectives, in a single pane. You can automate status updates based on rules that govern that metric. Rules trigger changes based on value, percentage of target met, date conditions, or a combination of the three, making the rules as versatile as possible.

## Connected metrics

For connected metrics, these status rules are refreshed every time the data in your scorecard is refreshed. For manual metrics, they're refreshed every time you perform a check-in.

:::image type="content" source="media/service-goals-check-in/rule-types.png" alt-text="Screenshot Showing the different types of status rules including value based, % of target based, and date based.":::

## Get started creating automated rules

1. In **Edit** mode for the scorecard, select **More options (...)** > **See details** next to the metric.

    :::image type="content" source="media/service-goals-subgoals/metrics-more-options-see-details.png" alt-text="Screenshot showing selecting More options, then See details.":::

1. On the **Status rules** tab, select **New rule**.

    :::image type="content" source="media/service-goals-check-in/new-status-rule.png" alt-text="Screenshot Showing location of new status rules in details pane.":::

1. In the first field, you can select the dropdown caret and choose to base your rule on **Date** instead of **Value**.

    :::image type="content" source="media/service-goals-check-in/first-dropdown.png" alt-text="Screenshot of First dropdown in rule UI showing date or value.":::

1. In the second field, you can select the dropdown caret and choose a different qualifier.

    :::image type="content" source="media/service-goals-check-in/select-qualifier-second-dropdown.png" alt-text="Screenshot of Second dropdown showing qualifiers such as greater than or equal to.":::

1. The last setting is based on your first dropdown, either **Value** or **Date**.  

    If you chose **Value**, you can either set the value or the percent or target met.

    :::image type="content" source="media/service-goals-check-in/setting-value.png" alt-text="Screenshot of Setting the value for the rule.":::

    If you selected **Date** in the first dropdown, you can select the date you want to base your rule on.

    :::image type="content" source="media/service-goals-check-in/date-picker.png" alt-text="Screenshot Showing date picker for date driven rule.":::

1. Now set the status that should be shown when the rules are met, and also the **Otherwise** status.

    :::image type="content" source="media/service-goals-check-in/status-chosen.png" alt-text="Screenshot Showing selected statuses for status rules.":::

### More about status rules

- With automated status rules, you can create multiple conditions to ensure your rules represent your unique business needs. You can also drag the rules to reorder the priority.  
- For the mobile experience, automatic refresh on status rules isn't supported at this time.

    :::image type="content" source="media/service-goals-check-in/conditions.png" alt-text="Screenshot of Adding a condition to a rule.":::

## Related content

- [Get started with metrics in Power BI](service-goals-introduction.md)
- [Create scorecards and manual metrics in Power BI](service-goals-create.md)
- [Create connected metrics in Power BI](service-goals-create-connected.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
