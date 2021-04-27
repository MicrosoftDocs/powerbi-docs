---
title: Create scorecards and goals
description: Create scorecards and goals in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/22/2021
---
# Create scorecards and goals in Power BI

Goals in Power BI let customers curate their metrics and track them against key business objectives, in a single pane. In this tutorial, you will complete the following steps: 

- Create your first scorecard.
- Create both manual and connected goals.
- Share the scorecard with others.

## Prerequisites

Creating goals is a Power BI Premium feature, so you need either:

- A Power BI Pro license and access to a Power BI Premium capacity
- A [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) license.
- Admin, Member, or Contributor role in a workspace. Read more about [roles in the new workspaces](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces).
- Build permission for a dataset. Read more about [Build permission](../connect-data/service-datasets-build-permissions.md).

## Step 1: New scorecard 

1. To begin, open the Power BI service (app.powerbi.com) in your browser. 
1. Select **Goals** in the navigation pane to launch the Goals hub. 
1. In the Goals hub, select **New scorecard**. The scorecard creation pane opens. 
1. Name your scorecard, provide a description, and select a Power BI Premium workspace where you want to store the scorecard. 

    If you don’t have a premium workspace, you can create one using this article, [Create the new workspaces in Power BI](../collaborate-share/service-create-the-new-workspaces.md). 

    image

1. Select **Create**. Power BI creates the scorecard and opens it. 

    Power BI creates these items in the Premium workspace: the scorecard itself, and a dataset associated with your scorecard that houses all the goals data. 

    image

## Step 2: Create a goal 

1. Select **New Goal**. Power BI opens the goal creation wizard. 
2. Decide on a **Goal name** and an **Owner**. 

    Owners can be individuals or distribution groups within your organization’s Azure Active Directory.  

1. Set **Current** and **Target** values for your goals. You can either enter the number manually, or connect it to an existing report visual in Power BI. See [Manual or connected goals](service-goals-manual-connected.md) for details. 

1. Choose a **Status**, **Start date**, and **End date**. 

    image

1. Select **Save**. 

    **Goal name** is the only required field for your goal. You can leave the remaining fields blank and come back to edit it after defining all your goals.


## Step 3 (Optional): Create subgoals 

You can also define one or more subgoals for your goal. There are two entry points to create a subgoal. 

1. Select the goal you want to create a subgoal for.  
1. Select **Add subgoal** on top of the scorecard.  

    image

    Or Hover over the goal you want to create a subgoal for, select **More options (...)** > **New subgoal**.  

1. Repeat Step 2, as needed.

    Make sure you are always in Edit mode when performing Steps 2 and 3. 

 

Once complete, you might have a scorecard that looks like the following image.

image

## Step 4 (Optional): Update the goal tracking cycle 

All new goals created within scorecards have a default daily tracking cycle, which means that the data and progress are calculated on a day-to-day basis. However, many goals and metrics demand to be tracked on a different cadence. In those cases, you can change the default tracking cycle on the goal through goal settings. Here’s how: 

1. In Edit mode, select the name of any goal or subgoal. Power BI opens the **Details** pane.  
2. Select the **Settings** tab. 
3. Select the **tracking cycle** for your goal. 
4. Choose a start date and select **Track**. 

    image
 
## Step 5 (Optional): Share your scorecard 

Sharing is the easiest way to give people access to your scorecard in the Power BI service. You can share with people inside or outside your organization.  

When you share a scorecard, the people you share it with can view and interact with it. They can also edit it if they have an [Admin, Member, or Contributor role in the workspace](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces). Users that have view or edit access to the scorecard see the same data you see in the scorecard. The coworkers you share with can also share with their coworkers, if you allow them to. The people outside your organization can view and interact with the scorecard, but can't share it. 

- To share, select the **Share** button in the scorecard action bar and follow the steps outlined in the experience. It's the same as sharing a dashboard.

    When sharing scorecards, whether inside or outside your organization, you need a [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) (PPU) license, or a Power BI Pro license, with the content in a [Power BI Premium](../admin/service-premium-what-is.md) capacity. Your recipients also need Power BI PPU licenses, unless the content is in a Premium capacity. See [License requirements](service-goals-intro.md#license-requirements) in the "Get started with goals in Power BI" article.

    image

## Next steps

- [Get started with goals in Power BI](service-goals-intro.md)
- [Create manual or connected goals in Power BI](service-goals-manual-connected.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
