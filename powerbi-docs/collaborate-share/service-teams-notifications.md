---
title: Get notifications in Microsoft Teams about Power BI activity
description: When important activities happen in Power BI, Microsoft Teams can show notifications about them in its activity feed.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 06/19/2023
---

# Get notifications in Microsoft Teams about Power BI activity

This article describes how to receive notifications about activity from Power BI in Microsoft Teams. The *Teams activity feed* collects all these notifications so they're easy to find. By using Power BI notifications in Teams, you can collaborate faster because important activity arrives right where you already work.

:::image type="content" source="media/service-teams-notifications/teams-notifications-share-report.png" alt-text="Screenshot showing Get Power BI notifications in Microsoft Teams activity feed.":::

To receive notifications in Teams, install the [Power BI app for Teams](service-microsoft-teams-app.md). After you've installed it, you start getting notifications when important things happen, such as:

- Someone shares a report to you and sends a message about it through Power BI
- Someone requests access to a report you own or manage
- Someone assigns you a goal
- Someone @mentions you in a metric
- The status changes for a metric you own

## Use Power BI notifications in the Teams activity feed

Here are a few things to know about Power BI notifications in the Teams activity feed:

- To receive notifications in Teams, you need to install the [Power BI app for Teams](service-microsoft-teams-app.md).
- When you open a notification, it opens directly in Teams.
- You can use Teams settings to control how you receive notifications sent by Power BI.
- Sharing and request access notifications work only for content in workspaces, not in Power BI organizational apps.
- Teams mobile doesn't support Power BI notifications.
- Only individual users can receive notifications, not user groups.
- A Power BI admin can turn off the notifications through the **Enable Microsoft Teams integration in the Power BI service** tenant setting.

## Notifications Power BI can send to the Teams activity feed

### Report sharing

When someone shares a report to you, Teams displays the notification as a banner in the Teams activity feed by default.

:::image type="content" source="media/service-teams-notifications/teams-notifications-share-report.png" alt-text="Screenshot that shows a Power BI report sharing notification in a Microsoft Teams activity feed.":::

When you select the notification, the report opens directly within the activity feed experience by default.

To open the report in the Power BI app for Teams, select **Open in Power BI**. You can pop-out the report by right-clicking the Power BI icon in the Teams left navigation. Doing so helps you multi-task by keeping the report open while you work on other activities in Teams.

You can customize how to receive these notifications through the **Actions and updates** setting.

### Report request access

When someone requests access to a report, you receive a notification in Teams if you're a report owner or in the report's contact list.

:::image type="content" source="media/service-teams-notifications/teams-notifications-request-access.png" alt-text="Screenshot showing Get Power BI access request notifications in Microsoft Teams activity feed.":::

After you open the notification, you can grant access to users directly within Teams. Doing so helps you quickly give colleagues the access they need. Users who you grant access get a **report sharing** notification in Teams and by e-mail.

You can customize how to receive these notifications through the **Actions and updates** setting.

### Metrics notifications

The following notifications are supported for metrics.

#### Metrics assignments

When a user assigns you as the owner of a goal, you get a notification from then in Teams.

:::image type="content" source="media/service-teams-notifications/teams-notifications-goal-assign.png" alt-text="Screenshot showing Get Power BI metrics assignment notifications in Microsoft Teams activity feed.":::

When you select the notification, the scorecard opens within the activity feed experience and displays the **Details** pane for the metric.

You can customize how to receive these notifications through the **Mentions** setting.

#### Mentions in a note

When someone @mentions you in a note on a new or existing check-in, Teams sends you a notification from them.

:::image type="content" source="media/service-teams-notifications/teams-notifications-goal-mention.png" alt-text="Screenshot showing Get Power BI metrics mention notifications in Microsoft Teams activity feed.":::

When you select the notification, the scorecard opens within the activity feed experience and displays the **Details** pane for the metric.

You can customize how to receive these notifications through the **Mentions** setting.

#### Metrics status updates

When the status of the metric gets updated by an automated status rule, you receive a notification in Teams if you're the owner of the metric. For connected metrics, you get a notification from the user who configured the data connection. For manual metrics, you get a notification from the user who edited the value.

:::image type="content" source="media/service-teams-notifications/teams-notifications-goal-status-update.png" alt-text="Screenshot showing Get Power BI metrics status update notifications in Microsoft Teams activity feed.":::

When you select the notification, the scorecard opens within the activity feed experience and displays the **Details** pane for the metric.

You can customize how to receive these notifications through the **Actions and updates** setting.

## Customize how you receive Power BI notifications

In Teams settings, you can customize how you receive notifications sent by Power BI.

Select the **Settings** menu next to your profile picture in the Teams header, then select **Notifications** and go to the **Power BI** section.

> [!NOTE]
> The **Power BI** section in Teams is visible only after you receive your first notification from Power BI.

:::image type="content" source="media/service-teams-notifications/teams-notifications-settings.png" alt-text="Screenshot showing Customize how Power BI notifications are received in Microsoft Teams.":::

The currently supported notifications are in the **Actions and updates** and **Mentions** categories. The remaining categories are reserved for future use and don't currently control any notifications.

## Admin control over notifications

We recommend that Power BI admins allow notifications in Teams. However, the [**Microsoft Teams integration in the Power BI service**](/fabric/admin/service-admin-portal-export-sharing#enable-microsoft-teams-integration-in-the-power-bi-service) tenant setting controls whether the Power BI service sends these notifications. When disabled, users no longer receive notifications in Microsoft Teams. 

To help users receive notifications in Teams, you can work with your Teams admins to install Power BI broadly in the organization through an app setup policy.

## Known issues and limitations

- See [Known issues and limitations](service-collaborate-microsoft-teams.md#known-issues-and-limitations) to learn about the latest issues.
- The recipient needs to have access to the scorecards to get the metrics notifications.

## Related content

- [Add the Power BI app to Microsoft Teams](service-microsoft-teams-app.md).
- [Enable remote work in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md).

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
