---
title: Arrange columns and goals in scorecards (preview)
description: Learn how to move goals and show, hide, and move columns in Power BI scorecards.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/16/2021
---
# Arrange columns and goals in Power BI scorecards (preview)

In some scenarios, you may want to reorder the goals in a scorecard, or make one goal a subgoal of another. You may also want hide a column, or put the columns in a different order. As a scorecard author, you can make these changes, moving goals and deciding the columns that your scorecard consumers see, and the order they're in, to optimize the scorecard for your audience.

:::image type="content" source="media/service-goals-move/power-bi-goals-edit-columns.png" alt-text="Screenshot of the Edit view columns pane.":::

## Prerequisites

Creating goals is a Power BI Premium feature, so you need either:

- A Power BI Pro license and access to a [Power BI Premium](../admin/service-premium-what-is.md) capacity.
- A [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) license.

You also need:

- Admin, Member, or Contributor role in a workspace. Read more about [roles in the new workspaces](../collaborate-share/service-roles-new-workspaces.md).
- [Build permission](../connect-data/service-datasets-build-permissions.md) for a dataset.

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
