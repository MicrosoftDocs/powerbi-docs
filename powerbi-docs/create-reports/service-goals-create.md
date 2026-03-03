---
title: Create scorecards and manual goals
description: Create scorecards and manual goals in Power BI.
author: kgremban
ms.author: kgremban
ms.reviewer: 'cnews'
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.search.form: Create scorecards
ms.topic: how-to
ms.date: 12/09/2025
ms.custom: sample-sales&returnssamplev201912
---
# Create scorecards and manual goals in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Goals in Power BI let you curate your goals and track them against key business objectives in a single pane. In this article, you complete the following steps: 

- Create your first scorecard.
- Create a manual goal.
- Edit a goal.
- Share the scorecard with others.

You can also connect goals to an existing report visual in Power BI. For more information, see [Create connected goals](service-goals-create-connected.md). 

## Prerequisites

You need a Power BI Pro license to author and share goals in standard workspaces. You also need:

- Admin, Member, or Contributor role in a workspace. For more information, see [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).
- [Build permission](../connect-data/service-datasets-build-permissions.md) for a semantic model.

## Step 1: Create a scorecard 

1. Sign in to the [Power BI service](https://app.powerbi.com) in your browser.

1. Select **Metrics** in the navigation pane to open the Metrics hub.

    :::image type="content" source="media/service-goals-create/power-bi-goals-left-nav.png" alt-text="Screenshot of Select Metrics in the left nav.":::

1. In the Metrics hub, select **New scorecard**.

    A new scorecard opens, which you can start populating with goals.

1. Select the edit pencil next to **Untitled Scorecard** and give your new scorecard a name.

1. Power BI automatically saves the scorecard to **My Workspace**, but you can move it to another workspace. Select **File** > **Move Scorecard**.

    :::image type="content" source="media/service-goals-create/metrics-move-scorecard.png" alt-text="Screenshot of menu to move a scorecard.":::

1. In the **Move scorecard** dialog, select any available workspace, then select **Continue**. If you don't have another workspace, you need to create one first. For more information, see [Create a workspace in Power BI](../collaborate-share/service-create-the-new-workspaces.md).

    :::image type="content" source="media/service-goals-create/metrics-move-scorecard-confirm.png" alt-text="Screenshot of confirmation to move a scorecard to another workspace, and a dropdown to select the correct workspace.":::

   In the workspace that you selected, Power BI saves the scorecard itself and a *semantic model* associated with your scorecard that houses all the metrics data. 

## Step 2: Create a goal

>[!TIP]
>If a goal already exists on another scorecard, you can [link to it](service-goals-linked-goals.md) instead of creating a duplicate.

1. In the scorecard, select **New goal**. 

1. Provide the following values for your goal:

   | Field | Value |
   | --------- | ----- |
   | **Goal name** | Provide a name for your goal. The name is the only required field for your goal. You can leave the other fields blank and come back to edit them. |
   | **Owners** | Select one or more owners for your goal. Owners can be individuals or distribution groups. |
   | **Current value** | Add a manual value or connect to an existing report visual in Power BI. When you edit a manual value, you can also format the number. For more information, see [Create connected goals](service-goals-create-connected.md). |
   | **Final target** | Add a manual value or connect to an existing report visual in Power BI. When you edit a manual value, you can also format the number. For more information, see [Create connected goals](service-goals-create-connected.md). |
   | **Status** | Choose from a list of preset statuses or select **Or set up rules** to create a status rule. |
   | **Start date** | Select the start date for this goal. |
   | **Due date** | Select the due date for this goal. |

   :::image type="content" source="media/service-goals-create/edit-goal.png" alt-text="Screenshot of the editing experience for creating a new goal.":::

   Power BI automatically represents values in numeric notation. For example, *2044* is represented as *2 K*. 

1. Select **Save**. 

## Step 3 (Optional): Create subgoals

You can define one or more subgoals for your goal. Like their parent goals, subgoals can be either connected or set manually. For more information, see [Create subgoals](service-goals-subgoals.md).

## Step 4 (Optional): Update the goal tracking cycle

All new goals created within scorecards have a default daily tracking cycle, which means that the data and progress are calculated on a day-to-day basis. However, many goals and subgoals need to be tracked on a different cadence. In those cases, you can change the default tracking cycle. The tracking cycle doesn't impact data refresh.

1. Open a scorecard.
1. Hover over any goal or subgoal, then select **More options** > **See details**.

   :::image type="content" source="media/service-goals-create/goal-see-details.png" alt-text="Screenshot that shows opening the details pane of a goal.":::

1. Select the **Time period** tab. 
1. Set the tracking preferences for this goal, and select **Save**. 

    :::image type="content" source="media/service-goals-create/power-bi-goals-set-tracking-cycle.png" alt-text="Screenshot showing how to set the tracking cycle for your goal.":::
 
## Step 5 (Optional): Share your scorecard and set permissions

Sharing is the easiest way to give people access to your scorecard in the Power BI service. To share, select the **Share** button in the scorecard action bar. You can choose whether the people you share with can share the scorecard with others, and whether they can access the underlying scorecard semantic model.

You can also set up goal-level permissions to control which goals different users can view and update within a scorecard. For more information, see [Protect your scorecards with goal-level permissions](service-goals-set-permissions.md).

## Related content

- [Create connected goals in Power BI](service-goals-create-connected.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
