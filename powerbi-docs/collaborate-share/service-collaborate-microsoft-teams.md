---
title: Collaborate with Power BI in Microsoft Teams, Outlook, and Office
description: Learn how organizations can use Microsoft Teams, Outlook, and Office to collaborate on Power BI content. 
author: ajburnle
ms.author: ajburnle
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
LocalizationGroup: Share your work
ms.date: 03/01/2023
---

# Collaborate with Power BI in Microsoft Teams, Outlook, and Office

Organizations rely on Microsoft Teams, Microsoft Outlook, and Microsoft Office to enable remote work and keep employees in sync. This article outlines options for sharing and collaborating on interactive Power BI content in Microsoft Teams, Outlook, and Office.

:::image type="content" source="media/service-collaborate-microsoft-teams/power-bi-embed-teams-report.png" alt-text="Screenshot of a Power BI report embedded in a Microsoft Teams channel." lightbox="media/service-collaborate-microsoft-teams/power-bi-embed-teams-report.png":::

> [!NOTE]
> The Power BI app is generally available in Microsoft Teams. The Power BI app is in public preview in Microsoft Outlook and Microsoft Office. Learn more about the [public preview](#OutlookOffice).

- [Add the Power BI app to Microsoft Teams](service-microsoft-teams-app.md): Integrate the Power BI service experience into Microsoft Teams.
- [Add the Power BI app to Microsoft Outlook and Office](#OutlookOffice): Integrate the Power BI service experience into Microsoft Office products.
- [Embed interactive reports in Teams channels and chats](service-embed-report-microsoft-teams.md) with a Power BI tab: Help your colleagues find and discuss your team's data.
- Create a [link preview in the Teams message box](service-teams-link-preview.md) when you paste links to your reports, dashboards, and apps.
- [Chat in Microsoft Teams directly from the Power BI service](service-share-report-teams.md): Share a filtered view of your reports and dashboards and start conversations.
- [View all the Power BI tabs you have](service-teams-pivot.md) in Microsoft Teams: Select the **In Teams** tab on the Power BI app home page.
- [Create a Teams usage report](service-teams-analytics.md) automatically in the Power BI app in Teams: Analyze your Teams activity.
- [Get notified](service-teams-notifications.md) in the Teams activity feed when important things happen in Power BI.
- Discover and use Power BI in Teams mobile.

## Requirements

In general, for Power BI to work in Microsoft Teams, ensure these elements:

- Ensure the Power BI app is enabled in the Teams Admin center apps list.
- Your users with a Fabric (Free) license can access personal analytics and create reports in their My workspace.
- Your users with a Fabric (Free) license can also access content shared to them from a workspace that's part of a [Power BI Premium capacity (P SKU)](../enterprise/service-premium-what-is.md) or [Fabric F64 or greater capacity](/fabric/enterprise/licenses#capacity-and-skus).
- Your users with a Power BI Pro or Premium Per User (PPU) license can share content with others or build content in workspaces.
- Users need to sign in within the Power BI app for Teams or the Power BI service to activate their Power BI license.
- Users meet the requirements to use the **Power BI** tab in Microsoft Teams.

## Grant access to reports

Embedding a report in Microsoft Teams or sending a link to an item doesn't automatically give users permission to view the report. You need to [allow users to view the report in Power BI](service-share-dashboards.md). You can use a Microsoft 365 Group for your team to make it easier.

> [!IMPORTANT]
> Make sure to review who can see the report within the Power BI service and grant access to those not listed.

One way to ensure everyone in a team has access to reports is to place the reports in a single workspace and give the Microsoft 365 Group for your team access.

## Share with external users

You can integrate a Power BI report in Teams and share it with external users. Here are the steps to follow.

1. You invite the external user to the organization, and they accept your invitation. See [Distribute Power BI content to external guest users using Microsoft Entra B2B](../guidance/whitepaper-azure-b2b-power-bi.md) for details.
2. Give the external user permission on the report. Individual permissions assignment works best.
3. Make sure the external user has a Power BI license assigned to them. If the content is in a Premium capacity, the user only needs a Free license. If not, the user can [sign up for an individual free trial of Power BI Pro](../fundamentals/service-self-service-signup-for-power-bi.md#use-an-in-product-link-to-upgrade-your-license) or get a Premium Per User (PPU) license.

## Known issues and limitations

- Power BI doesn't support the same localized languages that Microsoft Teams does. As a result, you might not see proper localization within the embedded report.
- Power BI dashboards can't be embedded in the **Power BI** tab for Microsoft Teams.
- Users without a Power BI license or permission to access the report see a "Content isn't available" message.
- You might have issues if you use Internet Explorer 10. <!--You can look at the [browsers support for Power BI](../fundamentals/power-bi-browsers.md) and for [Microsoft 365](https://products.office.com/office-system-requirements#Browsers-section). -->
- [URL filters](service-url-filters.md) aren't supported with the **Power BI** tab for Microsoft Teams.
- In US Government Community Cloud, the Power BI app for Microsoft Teams and the new tab are available. However, the following experiences aren't available:

  - Power BI messaging extension, which provides link previews, search, and link unfurling
  - Power BI activity feed notifications
  - Chat in Microsoft Teams

- In other national/regional clouds, the new **Power BI** tab isn't available. An older version might be available that doesn't support workspaces or reports in Power BI apps.
- After you save the tab, you can't change the tab name through the tab settings. Use the **Rename** option to change it.
- Link previews don't work in meeting chat or private channels.
- The messaging extension may process request and response data in a region that's different from your Power BI tenant home region.

## <a id="OutlookOffice"></a>Power BI app in Outlook and Office

The Power BI app for Microsoft Teams is available in Microsoft Outlook and Microsoft Office as a public preview. If you've installed the Power BI app in Microsoft Teams, it's also installed in Outlook and Office. Otherwise, in Outlook and Office you can install the Power BI app from the store. When you install the app, it also appears in Teams. The Power BI app in Teams continues to be generally available. The Power BI app supports Outlook for the web and Outlook for Windows.

> [!IMPORTANT]
> To participate in the preview, you must be enrolled in Microsoft 365 First Release for web experiences and in Office Insiders Beta Channel for Windows experiences. The public preview is rolling out incrementally for First Release and Office Insiders users. This means some users in your organization might not yet see the experiences in Outlook and Office.

In Outlook and Office, the preview app has some additional limitations:

- File downloads aren't supported yet. This means export options and file downloads don't download files. 
- On the **Create** tab, the **Paste or manually enter data** option isn't supported yet.
- Viewing items in full screen option isn't supported yet.
- Deep links aren't supported yet in Outlook and Office. Items open in a new browser tab.
- In Outlook, generating link previews for URLs that you paste into email isn't supported yet.

## Microsoft Power Platform in Microsoft Teams

The other Microsoft Power Platform apps also integrate with Microsoft Teams.

- [Power Platform admin experience](/power-platform/admin/about-teams-environment)
- [Power Automate](/power-automate/teams/overview)
- [Power Apps](/powerapps/teams/overview)
- [Power Virtual Agents](/power-virtual-agents/)

## Related content

- [Embed Power BI content in Microsoft Teams.](service-embed-report-microsoft-teams.md)
- [Get a Power BI link preview in Microsoft Teams.](service-teams-link-preview.md)
- [Chat in Microsoft Teams directly from the Power BI service.](service-share-report-teams.md)

More questions? [Ask the Power BI Community.](https://community.powerbi.com/)
