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
ms.date: 05/03/2021
---
# Get started with goals in Power BI (preview)

Goals in Power BI let customers curate their metrics and track them against key business objectives, in a single pane. This feature enhances data culture by promoting accountability, alignment, and visibility for teams and initiatives within organizations.

:::image type="content" source="media/service-goals-introduction/power-bi-goals-hub.png" alt-text="Goals page with goals, scorecards, and samples":::

This article covers the basics of using Goals in the Power BI service. See the other articles about goals for more detail:

- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

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

### Frequently Asked Questions (FAQs)


<b>I don’t see history for my goal when I connect to a Power BI datapoint. Why is that?</b>

You don’t see a history for a single data point, because we only pull history for time series data.  To see the history of your goal when you connect to time series data, make sure to select the option “track all data in this time series” when you connect. 


<b>I am connecting to time series data and still don’t see the history of the goal. Why? </b>

We do not pull in the history of time series if we only have a partial date (day of the week, month, etc.) We are only able to pull in the history of a time series when we have a full date to track (day, month, and year).  


<b>Why are my goals not getting updated over time in my scorecard?</b>

There are a couple of reasons why your goal could not be getting updated:

-	It’s a manual goal: Manual goals are not updated automatically as they are not connected to a data source with regular refreshes.  If you want to see a history of a manual goal, you can achieve that through check-ins.
-	You do not have a scheduled refresh on top of the dataset: Goal values are only updated as often as the dataset is refreshed.  If you don’t have a scheduled refresh on your dataset, you will not see any updates in the goal value.  [Learn about scheduled refreshes](https://docs.microsoft.com/en-us/power-bi/report-server/configure-scheduled-refresh#:~:text=In%20the%20web%20portal%2C%20right-click%20on%20the%20Power,you%20want%20your%20data%20model%20to%20be%20refreshed.)
-	Goals don’t get updated if they are created from a push dataset. 


<b>I am trying to create a goal but I can’t connect to my report- I see a yellow warning icon?</b>

To connect your current value or target to data, you need build permissions to that report. [Learn about build permissions](https://docs.microsoft.com/en-us/power-bi/connect-data/service-datasets-build-permissions) 
    
<b>I shared a scorecard but my users can’t do check-ins and add notes. Why? </b>

Currently, a user needs to have edit permissions to the scorecard to add check-ins.  This will change soon as we release updated scorecard and goal level permissions, which will allow check-in permissions without needing edit permissions to the scorecard.  

    
<b>Why can’t I update the value as part of my check-in?</b>

You are only able to update values in manual goals.  If a goal value is connected to data, you will not be able to update it.  The data is pulled directly from the report and is updated as often as the dataset refreshes.

    
<b>How often do goals update in the scorecard?</b>

We only update the goals as often as the data updates in the dataset.  We support connecting via import, live connect and Direct Query.  Additionally, we take snapshots of the goals data at a (maximum) daily cadence, and we always retain the last updated value for a given day.  The snapshots we take are always available in the underlying dataset we create, which you can then build content on top of. 

    
<b>I changed the tracking cycle of my goal but the data looks the same, why? </b>

Changing the tracking cycle only changes the trend that you see below your value/target area.  Changing this setting does not impact refreshes on the data or when your data is updated in the goals.

    
<b>Why don’t I see the premium workspace I’m looking for when I create a scorecard?</b>

In order to create a scorecard in a premium workspace, you need contributor or owner access to that workspace.


### Limitations 
  
- Goals does not yet support BYOK 
- Does not yet support RLS 
- For now, the max number of subgoal levels is 4 
- Goals does not support publish to web or “app-owns data scenarios” for embedded
- Mobile experience is not yet available, but will be available in late August 
- Business to business sharing is not supported (sharing across tenants)  


## Next steps

- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).

