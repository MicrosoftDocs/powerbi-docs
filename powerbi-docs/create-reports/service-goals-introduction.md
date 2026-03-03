---
title: Get started with goals in Power BI
description: Learn about goals and scorecards in Power BI to track key business objectives, promote accountability, and improve visibility for teams and initiatives.
author: kgremban
ms.author: kgremban
ms.reviewer: monicacl
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.search.form: Get started with goals
ms.topic: feature-guide
ms.date: 12/01/2025
ms.custom: intro-get-started
ai-usage: ai-assisted
#customer intent: As a Power BI user I want to learn what goals are and how to use Goals in my Power BI scorecards.
---
# Get started with goals in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

By using scorecards in Power BI, you can curate your goals and track them against key business objectives, all in a single view. This feature enhances data culture by promoting accountability, alignment, and visibility for teams and initiatives within organizations.

:::image type="content" source="media/service-goals-introduction/power-bi-goals-hub.png" alt-text="Screenshot of goals page with goals, scorecards, and samples.":::

## License requirements

Goals are a Pro feature. Users can access various aspects of the experience depending on their license.

|Permission  |Minimum requirements  |
|---------|---------|
|Author and share scorecards and goals, and perform check-ins | Power BI Pro license |
|View scorecards and goals  | Power BI Premium or Fabric F64 or greater capacity + Free user <br><br>OR <br><br>Power BI Pro license |
|View scorecard samples and author scorecards in My Workspace  |  Free user |

If you don't meet the minimum requirements for any of these permissions, contact your Power BI administrator before you begin.

## Explore the Metrics hub page

After you sign in to the Power BI service, select **Metrics** from the navigation pane. Power BI displays your Metrics hub page. As a new user, your Metrics hub page is empty until you create your first scorecard.

Ready to create your first scorecard? Learn how in [Create scorecards and manual goals in Power BI](service-goals-create.md).

### Recommended scorecards

The **Recommended** section contains all the goals that matter the most to you. Power BI automatically curates these scorecards based on goals that you're assigned to, goals you edited, or goals where you performed a recent check-in. If you don't have any scorecards yet, you see sample scorecards that you can explore.

:::image type="content" source="media/service-goals-introduction/scorecard-samples-recommended.png" alt-text="Screenshot of Top section contains all the goals that matter the most to you.":::

A goal must have at least two values, **Current value** and **Final target**, to show up in this section.

### Recent, Favorites, Shared with me, and All scorecards

The next section is a tabbed list.

:::image type="content" source="media/service-goals-introduction/power-bi-goals-recent.png" alt-text="Screenshot of Recent goals on the scorecards tab.":::

- **Recent**: The scorecards you visited most recently. Each item has a timestamp.
- **Favorites**: The scorecards you starred.

  :::image type="content" source="media/service-goals-introduction/power-bi-goals-favorites.png" alt-text="Screenshot of Star your favorite scorecards.":::

- **Shared with me**: Scorecards that your colleagues shared with you.
- **All scorecards**: All the scorecards that you have access to.

## Change the scorecard view

When you're viewing your scorecard, you can change the view from **List view** to **Compact view**, which is currently in preview.

:::image type="content" source="media/service-goals-introduction/metrics-compact-view.png" alt-text="Screenshot showing Compact view menu item.":::

Compact view adjusts to various screen sizes and supports resizing columns. You can do everything you can do in list view, except editing and creating a new goal.

## Troubleshoot common issues

### Goal history

If you don't see a history for your goal when you connect to a Power BI data point, it's because Power BI only pulls history for time series data. To see the history of your goal when you connect to time series data, select **Track all data in this time series** when you connect.

Power BI doesn't pull in the history of time series data if it only has a partial date, such as day of the week or month. Power BI can only pull in the history of a time series when it has a full date to track, such as day, month, and year.

### Update goals

Goals might not update over time in your scorecard for several reasons:

- **Manual goals**: Manual goals aren't updated automatically because they're not connected to a data source with regular refreshes. To create a history for a manual goal, do regular check-ins.
- **No scheduled refresh**: Goal values only update as often as the semantic model refreshes. If you don't have a scheduled refresh on your semantic model, you don't see any updates in the goal value. For more information, see [scheduled refresh](../connect-data/refresh-scheduled-refresh.md).
- **Push semantic models**: Goals created from a push semantic model don't get updated automatically.

You can only update values in manual goals. If a goal value is connected to data, you can't update it manually. The data is pulled directly from the report and is updated as often as the semantic model refreshes.

Changing the tracking cycle only changes the trend that you see below your value and target area. Changing this setting doesn't affect refreshes on the data or when your data is updated in the goals.

Goals only update as often as the data updates in the semantic model. Power BI supports connecting via import, live connection, and DirectQuery. Additionally, Power BI takes snapshots of the goals data at a maximum daily cadence, and always retains the last updated value for a given day. The snapshots are always available in the underlying semantic model Power BI creates, which you can then build content on top of.

### Access permissions

If you see a yellow warning icon when you try to connect a goal to a report, make sure you have build permissions for that report. For more information, see [build permissions](../connect-data/service-datasets-build-permissions.md).

If you share a scorecard with other users, they need to have edit permissions for the scorecard to add check-ins.

To create a scorecard in a workspace, you need a contributor or owner role in that workspace. For more information, see [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).

Scorecards have goal-level permissions roles. While workspace permissions give view or build access to the workspace, goal-level permissions restrict access. Certain people can only see certain goals and perform check-ins within a scorecard. For more information, see [goal-level permissions in scorecards](service-goals-set-permissions.md).

## Issues and limitations
  
- Goals don't support bring your own key (BYOK).
- Goals don't support row-level security (RLS).
- The maximum number of subgoal levels is four.
- Goals don't support publish-to-web.
- The scorecard visual doesn't work in SharePoint embed.
- Business-to-business sharing (sharing across tenants) isn't supported.
- Scorecards aren't supported in a [Multi-Geo capacity](../admin/service-admin-premium-multi-geo.md).
- Scorecards aren't supported in [embedded analytics](../developer/embedded/embedded-analytics-power-bi.md).

## Next steps

Now that you understand what goals are and how to navigate the Metrics hub, you're ready to create your first scorecard:

- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Set permissions for your scorecards](service-goals-set-permissions.md)
- [Connect goals to data sources](service-goals-create-connected.md)

**For administrators:**

- [Metrics hub tenant settings](/fabric/admin/service-admin-portal-goals-settings)

Have more questions? [Try the Power BI Community](https://community.powerbi.com/).
