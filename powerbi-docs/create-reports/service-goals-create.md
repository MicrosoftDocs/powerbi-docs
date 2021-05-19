---
title: Create scorecards and manual goals (preview)
description: Create scorecards and manual goals in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/03/2021
---
# Create scorecards and manual goals in Power BI (preview)

Goals in Power BI let customers curate their metrics and track them against key business objectives, in a single pane. In this article, you complete the following steps: 

- Create your first scorecard.
- Create a manual goal.
- Edit a goal.
- Share the scorecard with others.

You can also connect goals to an existing report visual in Power BI. See [Create connected goals](service-goals-create-connected.md) for details. 

:::image type="content" source="media/service-goals-create/northwind-scorecard.png" alt-text="Northwind scorecard with goals and subgoals.":::

## Prerequisites

Creating goals is a Power BI Premium feature, so you need either:

- A Power BI Pro license and access to a [Power BI Premium](../admin/service-premium-what-is.md) capacity
- A [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) license.

You also need:

- Admin, Member, or Contributor role in a workspace. Read more about [roles in the new workspaces](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces).
- [Build permission](../connect-data/service-datasets-build-permissions.md) for a dataset.

## Step 1: Create a scorecard 

1. Sign in to the Power BI service (app.powerbi.com) in your browser.
1. Select **Goals** in the navigation pane to open the Goals hub.

    :::image type="content" source="media/service-goals-create/power-bi-goals-left-nav.png" alt-text="Select Goals in the left nav.":::

1. In the Goals hub, select **New scorecard**. The scorecard creation pane opens. 
1. Name your scorecard, provide a description, and select a Power BI Premium workspace where you want to store the scorecard. 

    If you don’t have a Premium workspace, you can't create a scorecard. You can create a Premium workspace using this article, [Create the new workspaces in Power BI](../collaborate-share/service-create-the-new-workspaces.md). 

    :::image type="content" source="media/service-goals-create/power-bi-goals-create-scorecard.png" alt-text="Complete the Create Scorecard pane.":::

1. Select **Create**. Power BI creates the scorecard and opens it. 

    Power BI creates these items in the Premium workspace: the scorecard itself, and a *dataset* associated with your scorecard that houses all the goals data. 

    :::image type="content" source="media/service-goals-create/power-bi-goals-scorecard-dataset.png" alt-text="The new scorecard and dataset that Power BI created.":::

## Step 2: Create a manual goal 

1. In the scorecard, select **New Goal**. 
2. Decide on a **Goal name** and an **Owner**. 

    Owners can be individuals or distribution groups within your organization’s Azure Active Directory.  

1. Set **Current** and **Target** values for your goals. In this article, you enter the number manually. You can also connect it to an existing report visual in Power BI. See [Create connected goals](service-goals-create-connected.md) for details. 
1. Set the format for your values, and choose a **Status**, **Start date**, and **End date**. 

    :::image type="content" source="media/service-goals-create/power-bi-goals-new-number-format.png" alt-text="In the New goal, select a number format.":::

    Power BI automatically represents values in numeric notation. For example, *2044* is represented as *2 K*. 

1. Select **Save**. 

    **Goal name** is the only required field for your goal. You can leave the remaining fields blank and come back to edit it after defining all your goals.

## Step 3 (Optional): Create subgoals 

You can also define one or more subgoals for your goal. There are two entry points to create a subgoal. 

1. Select the goal you want to create a subgoal for, and select **Add subgoal** on top of the scorecard.  

    :::image type="content" source="media/service-goals-create/power-bi-goals-add-subgoal-button.png" alt-text="Select the Add Subgoal button.":::

    Or Hover over the goal you want to create a subgoal for, select **More options (...)** > **New subgoal**.  

    :::image type="content" source="media/service-goals-create/power-bi-goals-add-subgoal-more-options.png" alt-text="Select more options, then add subgoal.":::

1. Repeat the first step as needed to create more subgoals.

    Make sure you have the goal selected so you can create subgoals.

## Step 4 (Optional): Update the goal tracking cycle 

All new goals created within scorecards have a default daily tracking cycle, which means that the data and progress are calculated on a day-to-day basis. However, many goals and metrics demand to be tracked on a different cadence. In those cases, you can change the default tracking cycle on the goal through goal settings. The tracking cycle doesn't impact data refresh.

1. Open a scorecard and select **Edit**.

   :::image type="content" source="media/service-goals-create/power-bi-goals-edit-scorecard.png" alt-text="Select the Edit pencil to edit the scorecard.":::

1. Select the name of any goal or subgoal. Power BI opens the **Details** pane.  
1. Select the **Settings** tab. 
1. Set the **tracking cycle** for your goal. 
1. Choose a start date and select **Track**. 

    :::image type="content" source="media/service-goals-create/power-bi-goals-set-tracking-cycle.png" alt-text="Set the tracking cycle for your goal.":::
 
## Step 5 (Optional): Share your scorecard 

Sharing is the easiest way to give people access to your scorecard in the Power BI service. You can share with people inside or outside your organization.  

When you share a scorecard, the people you share it with can view and interact with it. They can also edit it if they have an [Admin, Member, or Contributor role in the workspace](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces). Users that have access to the scorecard see the same data you see in the scorecard. The coworkers you share with can also share with their coworkers, if you allow them to. The people outside your organization can view and interact with the scorecard, but can't share it.

- To share, select the **Share** button in the scorecard action bar and follow the steps outlined in the experience. It's the same as sharing a dashboard.

    :::image type="content" source="media/service-goals-create/power-bi-goals-share-link.png" alt-text="Share a link to a scorecard.":::

    When you share scorecards, whether inside or outside your organization, your recipients need [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) (PPU) licenses, unless the content is in a [Power BI Premium](../admin/service-premium-what-is.md) capacity.

## Next steps

- [Get started with goals in Power BI](service-goals-introduction.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
