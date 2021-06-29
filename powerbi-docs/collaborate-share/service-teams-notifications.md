---
title: Get notifications about important activity from Power BI in Microsoft Teams
description: When important activities happen in Power BI, they're shown in the Microsoft Teams activity feed.
author: LukaszPawlowski-MS
ms.author: lukaszp
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 06/28/2021
---

# Get notifications about important activity from Power BI in Microsoft Teams

This article describes how you can receive notifications about important activity from Power BI in Microsoft Teams. The **Teams activity feed** collects all these notifications so they're easy to find. By using Power BI notifications in Microsoft Teams, you can collaborate faster because important activity arrives right where you already work.

:::image type="content" source="media/service-teams-notifications/teams-notifications-share-report.png" alt-text="Get Power BI notifications in Microsoft Teams activity feed.":::

To receive notifications in Teams, you’ll need to install the [Power BI app for Teams](service-microsoft-teams-app.md). You’ll start getting notified when important things happen, including:
- Someone shared a report to you and sends a message about it through Power BI.
- Someone requests access to a report you own or manage. 

## Using Power BI notifications in the Teams activity feed

Here are a few things to know about the **notifications in the Teams activity feed** :

- To receive notifications in Teams, you need to install the [Power BI app for Teams](service-microsoft-teams-app.md).
- When you open a notification, it opens directly in Microsoft Teams.
- You can use Teams settings to control how you receive notifications sent by Power BI.
- Sharing and request access notifications only work for content in workspaces, not in Power BI organizational apps.
- Teams mobile isn’t support for notifications.
- Individual users receive notifications. User groups don’t receive notifications. 
- A Power BI admin can turn off the notifications through the **Microsoft Teams integration in the Power BI service** tenant setting.

## Notifications sent by Power BI in the Teams activity feed

### Report Sharing

When someone shares a report to you, a notification appears as a banner and in the Teams activity feed by default.

:::image type="content" source="media/service-teams-notifications/teams-notifications-share-report.png" alt-text="Get Power BI report sharing notifications in Microsoft Teams activity feed.":::

The report opens directly within the activity feed experience. 

You can press the **Open in Power BI** button to open the report in the Power BI app for Teams. When you do, you can pop-out the report by right-clicking the Power BI icon in the Teams left navigation. This helps you multi-task by keeping the report open while you work on other activities in Teams.

You can customize how to receive these notifications through the **Actions and updates** setting.

### Report request access

When someone requests access to a report you'll get a notification in Teams if you're a report owner or in the report's contact list. 

:::image type="content" source="media/service-teams-notifications/teams-notifications-request-access.png" alt-text="Get Power BI access request notifications in Microsoft Teams activity feed.":::


When you open the notification, you can grant access directly within Teams. This help you quickly give colleagues the access they need.

When you grant someone access to a report, they get a **report sharing** notification in Teams and in e-mail.

You can customize how to receive these notifications through the **Actions and updates** setting.

## Customizing how you receive Power BI notifications
In Microsoft Teams settings, you can customize how you receive notifications sent by Power BI.

:::image type="content" source="media/service-teams-notifications/teams-notifications-settings.png" alt-text="Customize how Power BI notifications are received in Microsoft Teams.":::

The currently supported notifications are in the **Actions and updates** category. The remaining categories are reserved for future use and don't currently control any notifications. 

## Admin control over notifications 

We recommend Power BI admins to allow notifications in Teams. However, the [**Microsoft Teams integration in the Power BI service**](../admin/service-admin-portal.md#microsoft-teams-integration-in-the-power-bi-service) tenant setting controls whether the Power BI service sends these notifications. When disabled, users no longer receive notifications in Microsoft Teams. 

To help users receive notifications in Teams, you can work with the your Teams Admins to install Power BI broadly in the organization through an app setup policy.

## Next steps

- [Add the Power BI app to Microsoft Teams](service-microsoft-teams-app.md)
- [Enable remote work in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
