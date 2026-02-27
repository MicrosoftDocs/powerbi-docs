---
title: Automate status rules for goals in Power BI
description: Learn how to automate status updates for goals in Power BI based on rules that trigger changes using value, percentage of target met, or date conditions.
author: kgremban
ms.author: kgremban
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
ai-usage: ai-assisted
#customer intent: As a Power BI user I want to learn how to automate status updates for goals in Power BI.
---

# Create automated status rules for goals in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Goals in Power BI let you curate your goals and track them against key business objectives in a single pane. You can automate status updates based on rules that govern a goal. Rules trigger changes based on value, percentage of target met, date conditions, or a combination of the three, making the rules as versatile as possible.

## Connected goals

For connected goals, these status rules are refreshed every time the data in your scorecard is refreshed. For manual goals, they're refreshed every time you perform a check-in.

:::image type="content" source="media/service-goals-status-rules/rule-types.png" alt-text="Screenshot showing the different types of status rules including value based, % of target based, and date based." lightbox="media/service-goals-status-rules/rule-types.png":::

## Get started creating automated rules

1. In **Edit** mode for the scorecard, select **More options (...)** > **See details** next to the metric.

    :::image type="content" source="media/service-goals-subgoals/metrics-more-options-see-details.png" alt-text="Screenshot showing selecting More options, then See details." lightbox="media/service-goals-subgoals/metrics-more-options-see-details.png":::

1. On the **Status rules** tab, select **New rule**.

    :::image type="content" source="media/service-goals-status-rules/new-status-rule.png" alt-text="Screenshot showing location of new status rules in details pane." lightbox="media/service-goals-status-rules/new-status-rule.png":::

1. In the first field, you can select the dropdown caret and choose to base your rule on **Date** instead of **Value**.

    :::image type="content" source="media/service-goals-status-rules/first-dropdown.png" alt-text="Screenshot of First dropdown in rule UI showing date or value." lightbox="media/service-goals-status-rules/first-dropdown.png":::

1. In the second field, you can select the dropdown caret and choose a different qualifier.

    :::image type="content" source="media/service-goals-status-rules/select-qualifier-second-dropdown.png" alt-text="Screenshot of Second dropdown showing qualifiers such as greater than or equal to." lightbox="media/service-goals-status-rules/select-qualifier-second-dropdown.png":::

1. The last setting is based on your first dropdown, either **Value** or **Date**.  

    If you chose **Value**, you can either set the value or the percent or target met.

    :::image type="content" source="media/service-goals-status-rules/setting-value.png" alt-text="Screenshot of setting the value for the rule." lightbox="media/service-goals-status-rules/setting-value.png":::

    If you selected **Date** in the first dropdown, you can select the date you want to base your rule on.

    :::image type="content" source="media/service-goals-status-rules/date-picker.png" alt-text="Screenshot showing date picker for date driven rule." lightbox="media/service-goals-status-rules/date-picker.png":::

1. Now set the status that should be shown when the rules are met, and also the **Otherwise** status.

    :::image type="content" source="media/service-goals-status-rules/status-chosen.png" alt-text="Screenshot showing selected statuses for status rules." lightbox="media/service-goals-status-rules/status-chosen.png":::

### More about status rules

- With automated status rules, you can create multiple conditions to ensure your rules represent your unique business needs. You can also drag the rules to reorder the priority.  
- For the mobile experience, automatic refresh on status rules isn't supported at this time.

    :::image type="content" source="media/service-goals-check-in/conditions.png" alt-text="Screenshot of Adding a condition to a rule." lightbox="media/service-goals-check-in/conditions.png":::

## Related content

- [Get started with goals in Power BI](service-goals-introduction.md)
- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
