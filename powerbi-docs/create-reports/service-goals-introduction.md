---
title: Get started with goals in Power BI (preview)
description: Get started with an introduction to goals in Power BI
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 08/30/2021
---
# Get started with goals in Power BI (preview)

Goals in Power BI let customers curate their metrics and track them against key business objectives, in a single pane. This feature enhances data culture by promoting accountability, alignment, and visibility for teams and initiatives within organizations.

:::image type="content" source="media/service-goals-introduction/power-bi-goals-hub.png" alt-text="Goals page with goals, scorecards, and samples":::

This article covers the basics of using Goals in the Power BI service. See the other articles about goals for more detail:

- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)
- [Stay on top of your goals in the Power BI service](service-goals-check-in.md)
- [Keep on top of your goals on the go in the Power BI mobile apps, too](../consumer/mobile/mobile-apps-goals.md)

## License requirements 

Goals is a Premium feature. Users can access various aspects of the experience depending on their license. 

|Permission  |Minimum requirements  |
|---------|---------|
|Authoring scorecards, goals, and performing check-ins | [Power BI Premium](../admin/service-premium-what-is.md) capacity + Power BI Pro license <br><br>OR <br><br>[Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) license |
|Viewing scorecards and goals  | Power BI Premium capacity + Free user <br><br>OR <br><br>Power BI Premium Per User license |
|Viewing scorecard samples   |  Free user |

If you don’t meet the minimum requirements for any of these, contact your Power BI administrator before you begin.  

## Explore the Goals hub page 

After you sign in to the Power BI service, select Goals from the navigation pane. Power BI displays your Goals hub page. The layout and content in the Goals page is different for every user. As a new user, your Goals page will be empty, as shown the following image.

:::image type="content" source="media/service-goals-introduction/power-bi-goals-new-home.png" alt-text="The new, empty Goals home page.":::

### My goals and activity 

The top section contains all the goals that matter the most to you. Power BI curates these goals automatically, based on goals that you're assigned to, you've edited, or you've performed a recent check-in. 

:::image type="content" source="media/service-goals-introduction/power-bi-my-goals-activity.png" alt-text="Top section contains all the goals that matter the most to you.":::

A goal must have at least two values to show up in this section. 

### Recent, Favorites, Shared with me, and All Scorecards 

The next section is a tabbed list. 

:::image type="content" source="media/service-goals-introduction/power-bi-goals-recent.png" alt-text="Recent goals on the Goals tab.":::

- **Recent** are the scorecards you've visited most recently. Each item has a timestamp. 
- **Favorites** are the scorecards you've starred.

    :::image type="content" source="media/service-goals-introduction/power-bi-goals-favorites.png" alt-text="Star your favorite scorecards.":::

- **Shared with me** contains scorecards that your colleagues have shared with you. 
- **All scorecards** lists all the scorecards you have access to. 

### Sample scorecards 

The last section contains sample scorecards. As a new user, you can select one the pre-configured scorecards to check out what scorecards are all about. Selecting a sample opens the scorecard.

:::image type="content" source="media/service-goals-introduction/power-bi-goals-samples.png" alt-text="Sample scorecards with goals.":::

## Frequently asked questions (FAQ)


**Why don’t I see history for my goal when I connect to a Power BI data point?**

You don’t see a history for a single data point because we only pull history for time series data. To see the history of your goal when you connect to time series data, select **Track all data in this time series** when you connect. 


**I'm connecting to time series data and still don’t see the history of the goal. Why not?**

We don't pull in the history of time series if we only have a partial date (day of the week, month, etc.) We can only pull in the history of a time series when we have a full date to track (day, month, and year).  

**Why aren't my goals getting updated over time in my scorecard?**

There are a few reasons why your goal may not be getting updated:

-	It’s a manual goal: Manual goals aren't updated automatically as they're not connected to a data source with regular refreshes.  To create a history for a manual goal, do regular check-ins.
-	You don't have scheduled refresh for the dataset: Goal values are only updated as often as the dataset is refreshed.  If you don’t have a scheduled refresh on your dataset, you won't see any updates in the goal value. Learn about [scheduled refresh](../connect-data/refresh-scheduled-refresh.md).
-	Goals don’t get updated if they're created from a push dataset. 

**I'm trying to create a goal but I can’t connect to a report. Why do I see a yellow warning icon?**

To connect your current value or target to data, you need build permissions for that report. Learn about [build permissions](../connect-data/service-datasets-build-permissions.md). 
    
**I shared a scorecard but my users can’t do check-ins and add notes. Why not?**

Currently, users need to have edit permissions for the scorecard to add check-ins. Updated scorecard and goal-level permissions are in the works. They'll allow check-in permissions without edit permissions for the scorecard.  
    
**Why can’t I update the value as part of my check-in?**

You can only update values in manual goals.  If a goal value is connected to data, you can't update it manually. The data is pulled directly from the report and is updated as often as the dataset refreshes.
    
**How often do goals update in the scorecard?**

Goals only update as often as the data updates in the dataset.  We support connecting via import, live connection, and DirectQuery.  Additionally, we take snapshots of the goals data at a maximum daily cadence, and always retain the last updated value for a given day. The snapshots are always available in the underlying dataset we create, which you can then build content on top of. 
    
**I changed the tracking cycle of my goal. Why does the data still look the same?**

Changing the tracking cycle only changes the trend that you see below your value/target area.  Changing this setting doesn't impact refreshes on the data or when your data is updated in the goals.

**Why don’t I see the Power BI Premium workspace I’m looking for when I create a scorecard?**

In order to create a scorecard in a Premium workspace, you need a contributor or owner role in that workspace. Learn about [roles in the new workspaces](../collaborate-share/service-roles-new-workspaces.md).

## Issues and limitations 
  
- Goals don't yet support bring your own key (BYOK). 
- Goals don't yet support row-level security (RLS). 
- For now, the maximum number of subgoal levels is four.
- Goals don't support publish to web or “app-owns data scenarios” for embedded.
- Mobile experience isn't currently available.
- Business-to-business sharing (sharing across tenants) isn't supported.
- Scorecards aren't supported in a [Multi-Geo capacity](../admin/service-admin-premium-multi-geo.md). 


## Next steps

- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).

