---
title: Power BI link preview cards in Microsoft Teams
description: When you paste a link to your reports, dashboards, and apps into Microsoft Teams message boxes, the link preview shows card shows information about the link.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 01/21/2025
---

# Get a Power BI link preview in Microsoft Teams

When a link to a Power BI report, app, dashboard, scorecard, or workspace is created in Power BI and then pasted into a Teams chat or channel, a preview card for the link is generated in the chat/channel window. The preview card shows information about the linked-to item, and, in certain circumstances, includes a Copilot summary button that can be used to get a sense of what the report is about, and whether it's worth opening for further exploration.

:::image type="content" source="./media/service-teams-link-preview/teams-preview-card.png" alt-text="Screenshot showing a link preview card for a report in a Teams chat window.":::

The card shows:

* Item name

* Item location: The location indicates whether the link links to the report directly, or indirectly as part of the URL of an org app. For example:
   
   * Workspace > \<report_name\> indicates that the link points directly to the report.
   
   * Apps > \<app_name\> indicates that the report is being pointed to as part of a URL for an app.	

* Open button: Opens the item in the Power BI app in Teams.

* Copilot button: Opens the item in the Power BI app in Teams, with the summary displayed in the Copilot pane. The Open Copilot summary button only appears if Copilot requirements are met. 

* Subscribe: Navigates the user to the Subscriptions pane in the Power BI Teams app, where they can create a subscription for the item.

* Open to access: If the user doesn’t have access to the item, the card will have an Open to access button the user can use to request access.



## Supported items


## Copilot requirements

In order for the Open in Copilot button to appear on the preview card the following requirements must be met:

* The user must have the appropriate licenses.

* The linked to item must be eligble for the Copilot button according to Power BI requirements.


See [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md) for background on how Power BI and Microsoft Teams work together, including requirements you need to meet.

## Get a link preview

Follow these steps to get a link preview for your Power BI content.

1. In the Power BI service, open the item you want to share and copy the link to it. You can copy the link from the browser address bar or via the **Share** option.

1. Paste the link in the Microsoft Teams message box. Sign in to the link preview service if prompted.

1. The link preview appears after successful sign-in.

   :::image type="content" source="./media/service-teams-link-preview/service-teams-link-preview-basic.png" alt-text="Screenshot showing a link preview card for a Power BI item in the Teams message box.":::


## Considerations and limitations

- Link previews don't work in meeting chat or private channels.
- See the [Known issues and limitations](service-collaborate-microsoft-teams.md#known-issues-and-limitations) section of the "Collaborate in Microsoft Teams" article for other issues.

## Related content

- [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/).
