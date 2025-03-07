---
title: Analyze Teams usage in the Power BI app for Teams
description: Learn how to use the Power BI app in Microsoft Teams to automatically generate a report to view and analyze your Teams activity.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 02/21/2025
#customer intent: As a Power BI user I want to learn how generate reports and analyze Microsoft Teams activity.
---

# Analyze your Teams usage in the Power BI app for Teams

> [!NOTE]
> On January 31st, 2025, the **Teams activity analytics** report feature will be discontinued. Starting February 1st, 2025, users will no longer be able to generate new reports with this feature, and existing reports will cease to update. Users are advised to use the built-in analytics views available in Teams. For more details, see [View analytics for your teams in Microsoft Teams](https://support.microsoft.com/office/view-analytics-for-your-teams-in-microsoft-teams-5b8ad4b1-af34-4217-aff4-cd11a820b56b).
>
> For more information about the retirement of the Teams activity analytics report feature and how this might affect you, see [Power BI in Teams – Announcing the retirement of the Teams activity analytics report](https://powerbi.microsoft.com/blog/power-bi-in-teams-teams-activity-analytics-report-deprecation/).

This article describes how to automatically generate a Power BI report to analyze your Microsoft Teams activity, by using the Power BI app in Teams.

Only you can see this report about your Teams activity, unless you choose to share it. Microsoft Teams also offers a [summary report for Teams admins](/microsoftteams/teams-analytics-and-reports/teams-usage-report). It gives admins an overview of the usage activity in Teams, including the number of active users and channels, guests, and messages in each team.

## Requirements

To view your Teams activity analytics in Microsoft Teams, ensure these elements:

- Sign in to the Power BI service to activate your Power BI license.
- Your users with a Microsoft Fabric (free) license can use the Teams activity analytics report.
- [Install the Power BI app for Teams](service-microsoft-teams-app.md).

## Create the Teams analytics report

Open the Power BI app in Teams. Select **Create**, then choose **Analyze your Teams data**.

Power BI automatically creates your report, displays it in your Power BI Teams app, and saves it to your **My workspace**. The report is yours. As with any of your reports, you can view it in Teams or in the Power BI service. You can edit it, save a copy of it, or download the *.pbix* file to edit it in Power BI Desktop.

## Pages in the Teams activity report

The Teams activity analytics report has three pages that show different aspects of your activity in Teams.

### My activity page

The **My activity** page shows a summary of your recent activity in Teams. The default time period is the past 31 days, but you can change it to show 7, 14, or 90 days instead.

To see definitions of the fields in the user activity report, see the [Microsoft Teams user activity report](/microsoftteams/teams-analytics-and-reports/user-activity-report) article.

### Team activity page

The **Team activity** page lists all the teams you're a member of, and lists activity in each one, for example, posts and replies, active users, and guests. 

### Team activity details page

On the **Team activity details** page, you choose one of the teams that you're a member of, and drill in to view its activities in the past 90 days. The page features a [smart narrative visual](../visuals/power-bi-visualization-smart-narrative.md). It automatically generates the **Activity summary**, a text description that calls attention to notable activity.

## View your Teams activity report

After you've created your Teams activity analytics report the first time, you can go back to it. On the Home tab in the Power BI app in Teams or in the Power BI service, you see it listed in **Recents**.

## Refresh your data

Select the **Refresh** icon in Power BI in Teams to refresh the data.

You see the most currently available data in Teams. It's not a real-time feed. It shows a snapshot of the data, which is typically one or two days old.

Your recent activity in Microsoft Teams typically takes one-to-two days to be available in reporting provided by Teams. The report created in Power BI is automatically set up to refresh your activity data from Teams to pull in a snapshot of this data once a day.

## Related content

- [Add the Power BI app to Microsoft Teams.](service-microsoft-teams-app.md)
- [Enable remote work in Microsoft Teams with Power BI.](service-collaborate-microsoft-teams.md)
- More questions? [Ask the Power BI Community.](https://community.powerbi.com)
