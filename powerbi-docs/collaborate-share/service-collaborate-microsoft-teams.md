---
title: Collaborate with Power BI in Teams
description: Discover how to collaborate on Power BI reports and dashboards in Microsoft Teams. Embed interactive content, share insights, and enable teamwork.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: article
ai-usage: ai-assisted
LocalizationGroup: Share your work
ms.date: 12/10/2025
---

# Collaborate with Power BI in Teams

Organizations rely on Microsoft Teams to enable remote work and keep employees in sync. This article outlines options for sharing and collaborating on interactive Power BI content in Microsoft Teams.

:::image type="content" source="media/service-collaborate-microsoft-teams/power-bi-embed-teams-report.png" alt-text="Screenshot of a Power BI report embedded in a Microsoft Teams channel." lightbox="media/service-collaborate-microsoft-teams/power-bi-embed-teams-report.png":::

> [!NOTE]
> Looking for Power BI integration with Microsoft Outlook and Office? See [Use Power BI in Microsoft Outlook and Office](service-power-bi-outlook-office.md).

- [Add the Power BI app to Microsoft Teams](service-microsoft-teams-app.md): Integrate the Power BI service experience into Microsoft Teams.
- [Embed interactive reports in Teams channels and chats](service-embed-report-microsoft-teams.md) with a Power BI tab: Help your colleagues find and discuss your team's data.
- Create a [link preview in the Teams message box](service-teams-link-preview.md) when you paste links to your reports, dashboards, and apps.
- [Chat in Microsoft Teams directly from the Power BI service](service-share-report-teams.md): Share a filtered view of your reports and dashboards and start conversations.
- [View all the Power BI tabs you have](service-teams-pivot.md) in Microsoft Teams: Select the **In Teams** tab on the Power BI app home page.
- [Get notified](service-teams-notifications.md) in the Teams activity feed when important things happen in Power BI.
- Discover and use Power BI in Teams mobile.

## Requirements

In general, for Power BI to work in Microsoft Teams, ensure these elements:

- Ensure the Power BI app is enabled in the Teams Admin center apps list.
- Your users with a Fabric (Free) license can access content shared to them from a workspace that's part of a [Power BI Premium capacity (P SKU)](/fabric/enterprise/powerbi/service-premium-what-is) or [Fabric F64 or greater capacity](/fabric/enterprise/licenses#capacity-and-skus).
- Your users with a Power BI Pro or Premium Per User (PPU) license can share content with others or build content in workspaces.
- Users need to sign in within the Power BI app for Teams or the Power BI service to activate their Power BI license.
- Users meet the requirements to use the **Power BI** tab in Microsoft Teams.

## Grant access to reports

Embedding a report in Microsoft Teams or sending a link to an item doesn't automatically give users permission to view the report. You need to [allow users to view the report in Power BI](service-share-dashboards.md). You can use a Microsoft 365 Group for your team to make it easier.

> [!IMPORTANT]
> Make sure to review who can see the report within the Power BI service and grant access to those not listed.

To ensure everyone in a team has access to reports, place the reports in a single workspace and give the Microsoft 365 Group for your team access.

## Share with external users

You can integrate a Power BI report in Teams and share it with external users. Follow these steps:

1. Invite the external user to the organization, and they accept your invitation. See [Distribute Power BI content to external guest users using Microsoft Entra B2B](/fabric/enterprise/powerbi/service-admin-entra-b2b) for details.
1. Give the external user permission on the report. Assign individual permissions.
1. Make sure the external user has a Power BI license assigned to them. If the content is in a Premium capacity, the user only needs a Free license. If not, the user can [sign up for an individual free trial of Power BI Pro](../fundamentals/service-self-service-signup-for-power-bi.md#use-an-in-product-link-to-upgrade-your-license) or get a Premium Per User (PPU) license.

## Known issues and limitations

- Power BI doesn't support the same localized languages that Microsoft Teams supports. As a result, you might not see proper localization within the embedded report.
- You can't embed Power BI dashboards in the **Power BI** tab for Microsoft Teams.
- Users without a Power BI license or permission to access the report see a "Content isn't available" message.
- You might have issues if you use Internet Explorer 10. 
- The **Power BI** tab for Microsoft Teams doesn't support [URL filters](service-url-filters.md).
- In US Government Community Cloud, the Power BI app for Microsoft Teams and the new tab are available. However, the following experiences aren't available:
  - Power BI messaging extension, which provides link previews, search, and link unfurling
  - Power BI activity feed notifications
  - Chat in Microsoft Teams
- In other national or regional clouds, the new **Power BI** tab isn't available. An older version might be available that doesn't support workspaces or reports in Power BI apps.
- After you save the tab, you can't change the tab name through the tab settings. Use the **Rename** option to change it.
- Link previews don't work in meeting chat or private channels.
- The messaging extension might process request and response data in a region that's different from your Power BI tenant home region.
- Fabric items appear in catalogs in the Power BI app but can't be opened in the app. They open in the browser. Fabric items can't be embedded in the Power BI tab.

## Microsoft Power Platform in Teams

The other Microsoft Power Platform apps also integrate with Microsoft Teams.

- [Power Platform admin experience](/power-platform/admin/about-teams-environment)
- [Power Automate](/power-automate/teams/overview)
- [Power Apps](/powerapps/teams/overview)
- [Power Virtual Agents](/power-virtual-agents/)

## Related content

- [Embed Power BI content in Microsoft Teams.](service-embed-report-microsoft-teams.md)
- [Get a Power BI link preview in Microsoft Teams.](service-teams-link-preview.md)
- [Chat in Microsoft Teams directly from the Power BI service.](service-share-report-teams.md)
- [Use Power BI in Microsoft Outlook and Office.](service-power-bi-outlook-office.md)

More questions? [Ask the Power BI Community.](https://community.powerbi.com/)
