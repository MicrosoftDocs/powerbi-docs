---
title: Customize your scorecard's statuses and column views (preview)
description: Learn how to customize your Power BI scorecards to meet your teams' needs.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/16/2021
---
# Set custom statuses for your scorecard

Statuses are an integral part of goal tracking, and in some scenarios the statuses that come with a scorecard are not sufficient for your organization’s needs.  You may want to customize the statuses to reflect your organization’s terminology. 

:::image type="content" source="media/service-goals-move/power-bi-custom-statuses-1.png" alt-text="A view of goals showing customized statuses in the status column.":::

## Get started

In edit mode there are two entry points to start customizing your statuses.  

1.	Select the settings gear icon
1.	Choose the <b>statuses</b> section of the pane that appears

:::image type="content" source="media/service-goals-move/power-bi-custom-statuses-2.png" alt-text="A view of the edit status pane open, customizing statuses.":::

You can also get to this area by editing a goal inline.

1.	In edit mode, select the pencil icon to edit a goal
1.	Select the status section dropdown
1.	Choose the <b>‘manage statuses’</b> option at the end of the list

:::image type="content" source="media/service-goals-move/power-bi-custom-statuses-3.png" alt-text="A view of the entry point when editing a goal in-line, at the bottom of the status dropdown.":::

Once you’re in the manage status section, there a few actions you can take.  ou can create new statuses, rename existing statuses and change the color associated with the status.  

1.	To add a new status, select the <b>+add status</b> button at the top.  
1	To rename an existing status, simply highlight the text, and type your new status name.
1.	To change the color associated with a status, select the color picker to the right of the status, and choose your desired color.
1.	To delete a status, select the trash icon.
1.	To reset all statuses to the default settings (the original scorecard statuses) select <b>‘reset statuses’</b> at the top.
1.	To reorder the statuses within the list, use the arrow buttons to move an item up or down, or simply select and drag the status to it’s new location. 

:::image type="content" source="media/service-goals-move/power-bi-custom-statuses-4.png" alt-text="A screenshot of a status being re-ordered in the edit status pane.":::

By reordering the statuses, you are specifying the order of priority.  This comes in handy back on the scorecard.  You have an option to sort the goals in order of status priority.

:::image type="content" source="media/service-goals-move/power-bi-custom-statuses-5.png" alt-text="A view of how you can sort the status column by ascending or descending pirority.":::

## Deleting statuses

One thing to consider is what happens when you delete a status.  At the moment, when you delete a status it will no longer be available in your status list.  You will no longer see the deleted statuses as options when you perform check-ins, however, we will preserve the history in your dataset and check-in history as long as we can.
If a goal is using a status that is then deleted, we will preserve the goal’s status until it’s changed via edit or a check-in.  For example in the image below, you can see I deleted the status ‘line down’ so it’s no longer available in my status list, but we do not remove the goal statuses that were using that status.

:::image type="content" source="media/service-goals-move/power-bi-custom-statuses-6.png" alt-text="A view of the edit status pane open.":::

With this update, you can customize the statues to the terminology you user every day in your organization, ensuring everyone in your team easily understands - making it easier than ever for Goals to work seamlessly for your organization.


# Arrange columns and goals in Power BI scorecards (preview)

In some scenarios, you may want to reorder the goals in a scorecard, or make one goal a subgoal of another. You may also want hide a column, or put the columns in a different order. As a scorecard author, you can make these changes, moving goals and deciding the columns that your scorecard consumers see, and the order they're in, to optimize the scorecard for your audience.

:::image type="content" source="media/service-goals-move/power-bi-goals-edit-columns.png" alt-text="Screenshot of the Edit view columns pane.":::


## Reorder the goals in a scorecard

It's easy to reorder goals on the scorecard, or make them subgoals.

- Select a goal and drag it up or down. Indent it slightly to make it a subgoal of another goal. 

    When you make it a subgoal, it takes the color of the goal it's under.

    :::image type="content" source="media/service-goals-move/power-bi-move-goals.gif" alt-text="Animation of moving a goal, and making it a subgoal.":::

## Hide or move a column

1. Open the scorecard in edit mode, and select the arrow icon next to the column you want to hide or move > **Column settings**.
1. Select **Move right**, **Move left**, or **Hide this column**.

    :::image type="content" source="media/service-goals-move/power-bi-goals-move-columns.png" alt-text="Screenshot of Move or Hide columns.":::

## Show a hidden column

1. Open the scorecard in edit mode, and select the arrow icon next to any column > **Column settings**.
1. Select **Show/Hide columns**.
1. In **Edit view columns**, select **Reset to default** or select the column you want to view. 

    :::image type="content" source="media/service-goals-move/power-bi-goals-edit-view-columns.png" alt-text="Screenshot of moving a column in the Edit view columns pane.":::

1. You can also re-order columns in this view but dragging them up or down.
1. Select **Apply**.

## Next steps

- [Get started with goals in Power BI](service-goals-introduction.md)
- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Create connected goals in Power BI](service-goals-create-connected.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
