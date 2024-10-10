---
title: Create subgoals in the Power BI service
description: Submgoals make scorecards more readable by collecting related goals together under a single parent goal.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/10/2022
---

# Create subgoals in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Goals in Power BI let customers curate their goals and track them against key business objectives, in a single pane. *Subgoals* make scorecards more readable by collecting related goals together under a single parent goal. You can expand and collapse the parent goal. Subgoal can either be standalone values, unrelated to the parent value, or they can roll up to the parent value. Read about [*rollups*](#get-started-creating-rollups) later in this article.

## Create a subgoal

You can define one or more subgoals for a goal. Like their parent goals, subgoals can be either connected or set manually. There are two entry points to create a subgoal.

1. Open a scorecard and select **Edit**.

   :::image type="content" source="media/service-goals-create/power-bi-goals-edit-scorecard.png" alt-text="Screenshot of Select the Edit pencil to edit the scorecard.":::

1. Select the goal you want to create a subgoal for, and select **Add subgoal** on top of the scorecard.

    :::image type="content" source="media/service-goals-create/power-bi-goals-add-subgoal-button.png" alt-text="Screenshot of Select the Add Subgoal button.":::

    Or hover over the goal you want to create a subgoal for, select **More options (...)** > **New subgoal**.  

    :::image type="content" source="media/service-goals-create/power-bi-goals-add-subgoal-more-options.png" alt-text="Screenshot of Select more options, then add subgoal.":::

1. Repeat the first step as needed to create more subgoals.

    Make sure you've selected the goal so you can create subgoal.

1. See these articles for details on creating manual or connected goals:

    - [Create a manual goal](service-goals-create.md#step-2-create-a-manual-metric) 
    - [Create connected goal](service-goals-create-connected.md)

## Create submgoals that roll up to the goal

You can also create *rollup* subgoals, whose values automatically aggregate up to a parent goal. These aggregations recalculate anytime the subgoal values change, and capture the history. Rollups are a great way to keep a parent goal up to date without having it backed by a report connection. Rollups work when subgoals are manual or connected, so you can always roll up whatever the current value is, regardless of where it's coming from.

### Get started creating rollups

First, make sure you're in edit mode.  

1. Select the **pencil icon** to enter inline editing of a goal.  

    :::image type="content" source="media/service-metrics-submetrics/roll-up-edit-metric.png" alt-text="Screenshot showing a scorecard in edit mode.":::

1. Next to the value and target, you see an indication of what type of goal it is:

    - **Manual goal**
    - **Use subgoal**
    - **Connected to data**

    :::image type="content" source="media/service-metrics-submetrics/roll-up-open-options.png" alt-text="Screenshot showing the types of goals.":::

1. When you choose rollup sybgoals, you can choose the aggregation type:

    - **SUM**: a sum of the subgoal values
    - **AVERAGE**: an average of the subgoal values
    - **MIN**: reflects the lowest subgoal value
    - **MAX**: reflects the largest subgoal value

    The option you choose automatically calculates the appropriate value and shows it in either the **Current value** or **Target value** area. You can set up different rollup aggregation types on the current and target value, allowing for maximum flexibility.


### Preserve historical values

You may want to preserve historical values if you're switching goal type from connected to rollup type.

1. In **Edit** mode for the scorecard, select **More options (...)** > **See details** next to the goal.

    :::image type="content" source="media/service-metrics-submetrics/metrics-more-options-see-details.png" alt-text="Screenshot showing selecting More options, then See details.":::

2. On the **Connections** tab, ensure that you turn off the toggle labeled **Clear goal values when connecting to a new report**.

    :::image type="content" source="media/service-metrics-submetrics/roll-up-settings.png" alt-text="Screenshot showing scorecard data connection settings toggle.":::

### Rollups considerations

- Rollups take place from the day they're set up moving forward. They don't remove, recalculate, or override historical data with retroactive rollup values, in almost all scenarios.
- One scenario where connected historical data is deleted is if the person creating the rollup is *not* the goal connection owner. To preserve the history, ensure the goal connection owner is the same person as the rollup creator.
- If a scorecard author changes a goal from a rollup to a connected goal and they bring in the history via report connection, the report history overrides historical rollup values.
- New rollup types calculate with the new aggregation moving forward, but don't replace the history.
- Rollups always show the same aggregation value of all subgoals, regardless of goal level permissions.  This means if person A only has view access to 3 out of 5 subgoals, they still see the same parent goal value as someone who has access to all subgoals.  

## Related content

- [Get started with goals in Power BI](service-goals-introduction.md)
- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
