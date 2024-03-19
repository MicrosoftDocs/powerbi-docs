---
title: Analyze Teams usage in the Power BI app for Teams
description: Learn how to use the Power BI app in Microsoft Teams to automatically generate a report to view and analyze your Teams activity.
author: ajburnle
ms.author: ajburnle
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 03/08/2023
---

# Analyze your Teams usage in the Power BI app for Teams

This article describes how to automatically generate a Power BI report to analyze your Microsoft Teams activity, by using the Power BI app in Teams.

:::image type="content" source="media/service-teams-analytics/teams-analytics-activity-report.png" alt-text="Screenshot of Teams activity report.":::

Only you can see this report about your Teams activity, unless you choose to share it. Microsoft Teams also offers a [summary report for Teams admins](/microsoftteams/teams-analytics-and-reports/teams-usage-report). It gives admins an overview of the usage activity in Teams, including the number of active users and channels, guests, and messages in each team.

## Requirements

To view your Teams activity analytics in Microsoft Teams, ensure these elements:

- Sign in to the Power BI service to activate your Power BI license.
- Your users with a Microsoft Fabric (free) license can use the Teams activity analytics report.
- [Install the Power BI app for Teams](service-microsoft-teams-app.md).

## Create the Teams analytics report

Open the Power BI app in Teams. Select **Create**, then choose **Analyze your Teams data**.

:::image type="content" source="media/service-teams-analytics/teams-analytics-create.png" alt-text=" Create a Power BI report to Analyze your Teams activity.":::

Power BI automatically creates your report, displays it in your Power BI Teams app, and saves it to your **My workspace**. The report is yours. As with any of your reports, you can view it in Teams or in the Power BI service. You can edit it, save a copy of it, or download the *.pbix* file to edit it in Power BI Desktop.

## Pages in the Teams activity report

The Teams activity analytics report has three pages that show different aspects of your activity in Teams.

### My activity page

The **My activity** page shows a summary of your recent activity in Teams. The default time period is the past 31 days, but you can change it to show 7, 14, or 90 days instead.

:::image type="content" source="media/service-teams-analytics/teams-analytics-my-activity.png" alt-text="Screenshot of Teams My activity page.":::

To see definitions of the fields in the user activity report, see the [Microsoft Teams user activity report](/microsoftteams/teams-analytics-and-reports/user-activity-report) article.

### Team activity page

The **Team activity** page lists all the teams you're a member of, and lists activity in each one, for example, posts and replies, active users, and guests. 

### Team activity details page

On the **Team activity details** page, you choose one of the teams that you're a member of, and drill in to view its activities in the past 90 days. The page features a [smart narrative visual](../visuals/power-bi-visualization-smart-narrative.md). It automatically generates the **Activity summary**, a text description that calls attention to notable activity.

:::image type="content" source="media/service-teams-analytics/teams-analytics-team-activity-detail.png" alt-text="Screenshot of Teams activity details page.":::

## View your Teams activity report

After you've created your Teams activity analytics report the first time, you can go back to it. On the Home tab in the Power BI app in Teams or in the Power BI service, you see it listed in **Recents**.

:::image type="content" source="media/service-teams-analytics/teams-analytics-view-report.png" alt-text="Screenshot of viewing the report in the Recents section.":::

## Refresh your data

Select the **Refresh** icon in Power BI in Teams to refresh the data.

:::image type="content" source="media/service-teams-analytics/teams-analytics-refresh.png" alt-text="Screenshot of the Refresh icon.":::

You see the most currently available data in Teams. It's not a real-time feed. It shows a snapshot of the data, which is typically one or two days old.

Your recent activity in Microsoft Teams typically takes one-to-two days to be available in reporting provided by Teams. The report created in Power BI is automatically set up to refresh your activity data from Teams to pull in a snapshot of this data once a day.

## Related content

- [Add the Power BI app to Microsoft Teams.](service-microsoft-teams-app.md)
- [Enable remote work in Microsoft Teams with Power BI.](service-collaborate-microsoft-teams.md)
- More questions? [Ask the Power BI Community.](https://community.powerbi.com)
