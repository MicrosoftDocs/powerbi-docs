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

Create your first scorecard 

Create both manual and connected goals 

Share the scorecard with others 

Step 1: New scorecard 

To begin, open the Power BI service (app.powerbi.com) in your browser. 

Select Goals in the navigation pane to launch the Goals hub. 

In the Goals hub, select + New scorecard. The scorecard creation pane opens. 

Name your scorecard, provide a description, and select a premium workspace where you want to store the scorecard. 

Note: If you don’t have a premium workspace, go ahead and create one using this tutorial. 

 

 

Select Create. Power BI creates the scorecard and opens it. 

 

Note: Power BI creates the following artifacts in the chosen premium workspace: (a) the scorecard itself, and (b) a dataset associated with your scorecard that will house all the goals data. 

 

Graphical user interface, text, application

Description automatically generated 

Step 2: Create a goal 

Select + New Goal. Power BI will open the goal creation wizard. 

To begin, name your goal and assign it to an owner. 

Note: Owners can be individuals or distribution groups within your organization’s Azure Active Directory.  

 

Set your current and target value for your goals. You can either enter the number manually or connect it to an existing report visual in Power BI. Please see Appendix A: Manual vs. Connected values for more details. 

Choose a status, start date, and end date. 

Graphical user interface, application

Description automatically generated 

Select Save. 

Tip: The only required field for your goal is the Goal name. You can leave the remaining fields blank and come back to edit it after defining all your goals! 

 

Step 3 (Optional): Create a subgoal 

You can also define one or more subgoals for your goal. There are two entry points to create a subgoal. 

 

Entry #1: 

Select the goal you want to create a subgoal for.  

Select on the Add subgoal button on top of the scorecard.  

Graphical user interface, text, application

Description automatically generated 

Repeat Step 2, as required. 

Entry #2: 

Hover on top of the goal you want to create a subgoal for.  

Select on the ellipses action displayed on top of the goal.  

 

Repeat Step 2, as required. 

Tip: Make sure you are always in ‘Edit mode’ when performing Steps 2 and 3. 

 

Once complete, you might have a scorecard that looks like the following image. 

Graphical user interface, application

Description automatically generated 

Step 4 (Optional): Update the goal tracking cycle 

All new goals created within scorecards have a default tracking cycle of daily. Which means that the data and progress will be calculated on a day-to-day basis. However, there are many goals and metrics that demand to be tracked on a different cadence. In those cases, you can change the default tracking cycle on the goal through goal settings. Here’s how: 

 

In Edit mode, select any goal or subgoal by clicking on the name. Power BI should open the details pane.  

Navigate to the Settings tab. 

Select the tracking cycle for your goal. 

Choose a start date and select Track. 

 

 

Step 5 (Optional): Share your scorecard 

Sharing is the easiest way to give people access to your scorecard in the Power BI service. You can share with people inside or outside your organization.  

 

When you share a scorecard, the people you share it with can view it and interact with it, and also edit it if they are an admin, member, or contributor in the workspace. Users that have view or edit access to the scorecard will see the same data you see in the scorecard. The coworkers you share with can also share with their coworkers, if you allow them to. The people outside your organization can view and interact with the scorecard, but can't share it. 

 

To share, select the Share button in the scorecard action bar and follow the steps outlined in the experience.   

 

Note: When sharing scorecards, whether you share content inside or outside your organization, you need a Power BI Premium Per User license. Your recipients also need Power BI PPU licenses, unless the content is in a Premium capacity. 

image

This article covers the basics of using Goals in the Power BI service. See the other articles about goals for more detail:

- Set up your first scorecard. 

If you are unfamiliar with any of the terms used in this manual, refer to the glossary section to learn more. 

## Prerequisites 

Goals is a Premium feature. Users can access various aspects of the experience depending on their license. 

|Permission  |Minimum requirements  |
|---------|---------|
|Authoring scorecards, goals, and performing check-ins | Power BI Premium capacity + Power BI Pro license <br><br>OR <br><br>Premium Per User license |
|Viewing scorecards and goals  | Power BI Premium capacity + Free user <br><br>OR <br><br>Premium Per User license |
|Viewing scorecard samples   |  Free user |

If you don’t meet the minimum requirements for any of these, contact your Power BI administrator before you begin.  

## Explore the Goals tab 

After you sign in to the Power BI service, select Goals from the navigation pane. Power BI displays your Goals hub page. The layout and content in the Goals page is different for every user. As a new user, your Goals page will be empty, as shown the following image. 

image

### Goals relevant to me 

The top section contains all the goals that matter the most to you. Power BI curates these goals automatically, based on goals that you're assigned to, you've edited, or you've performed a recent check-in. 

image

Goals must have at least two values to show up in this section. 

### Recent, Favorites, Shared with me, and All Scorecards 

The next section is a tabbed list. 

- **Recent** is the scorecards you've visited most recently. Each item has a timestamp. 
- **Favorites** are the scorecards you've starred (Star image). 
- **Shared with me** contains scorecards that your colleagues have shared with you. 
- **All scorecards** lists all the scorecards you have access to. 

### Sample scorecards 

The last section contains sample scorecards. As a new user, you can select one the pre-configured scorecards to check out what scorecards are all about. Selecting a sample opens the scorecard.

## Next steps

More questions? [Try the Power BI Community](https://community.powerbi.com/).
