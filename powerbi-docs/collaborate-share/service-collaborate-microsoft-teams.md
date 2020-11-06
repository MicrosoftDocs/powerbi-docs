---
title: Collaborate in Microsoft Teams with Power BI
description: As a distributed workforce becomes the norm, more organizations are relying on Microsoft Teams to enable remote work and keep employees in sync. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
LocalizationGroup: Share your work
ms.date: 09/15/2020
---

# Collaborate in Microsoft Teams with Power BI

As a distributed workforce becomes the norm, more organizations are relying on Microsoft Teams to enable remote work and keep employees in sync. This articles outlines options for sharing and collaborating on interactive Power BI content in Microsoft Teams channels and chats. 

- With the **Power BI tab** for Microsoft Teams, you can [embed interactive reports in Microsoft Teams](service-embed-report-microsoft-teams.md) channels and chats. The Power BI tab helps your colleagues find your team's data and discuss the data within your team channels. 
- Create a [link preview](service-teams-link-preview.md) when you paste a link to your reports, dashboards, and apps into the Microsoft Teams message box. The link preview shows information about the link. 
- Use [Share to Microsoft Teams](service-share-report-teams.md) when viewing reports and dashboards in the Power BI service to quickly start conversations in Microsoft Teams.
- Use the [Power BI app in Microsoft Teams](service-microsoft-teams-app.md) to bring your entire basic Power BI service experience into Microsoft Teams.
 
:::image type="content" source="media/service-collaborate-microsoft-teams/power-bi-embed-teams-report.png" alt-text="Screenshot of a Power B I report embedded in a Microsoft Teams channel.":::

## Requirements

In general, for Power BI to work in Microsoft Teams, ensure these elements:

- Your users have a Power BI Pro license, or the report is contained in a [Power BI Premium capacity (EM or P SKU)](../admin/service-premium-what-is.md) with a Power BI license.
- Users have signed in to the Power BI service to activate their Power BI license.
- Users meet the requirements to use the **Power BI** tab in Microsoft Teams.

## Grant access to reports

Embedding a report in Microsoft Teams or sending a link to an item doesn't automatically give users permission to view the report. You need to [allow users to view the report in Power BI](service-share-dashboards.md). You can use a Microsoft 365 Group for your team to make it easier.

> [!IMPORTANT]
> Make sure to review who can see the report within the Power BI service and grant access to those not listed.

One way to ensure everyone in a team has access to reports is to place the reports in a single workspace and give the Microsoft 365 Group for your team access.

## Known issues and limitations

- Power BI doesn't support the same localized languages that Microsoft Teams does. As a result, you might not see proper localization within the embedded report.
- Power BI dashboards can't be embedded in the **Power BI** tab for Microsoft Teams.
- Users without a Power BI license or permission to access the report see a "Content is not available" message.
- You might have issues if you use Internet Explorer 10. <!--You can look at the [browsers support for Power BI](../fundamentals/power-bi-browsers.md) and for [Microsoft 365](https://products.office.com/office-system-requirements#Browsers-section). -->
- [URL filters](service-url-filters.md) aren't supported with the **Power BI** tab for Microsoft Teams.
- In national clouds, the new **Power BI** tab isn't available. An older version might be available that doesn't support the new workspace experience or reports in Power BI apps.
- After you save the tab, you can't change the tab name through the tab settings. Use the **Rename** option to change it.
- Single sign-on isn't supported for the link preview service.
- Link previews don't work in meeting chat or private channels.

## Microsoft Power Platform in Microsoft Teams

The other Microsoft Power Platform apps also integrate with Microsoft Teams.

- [Power Platform admin experience](/power-platform/admin/about-teams-environment)
- [Power Automate](/power-automate/teams/overview)
- [Power Apps](/powerapps/teams/overview)
- [Power Virtual Agents](/power-virtual-agents/)

## Next steps

- [Embed Power BI content in Microsoft Teams](service-embed-report-microsoft-teams.md)
- [Get a Power BI link preview in Microsoft Teams](service-teams-link-preview.md)
- [Share directly to Microsoft Teams from the Power BI service](service-share-report-teams.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).