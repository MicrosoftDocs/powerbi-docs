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

When a link to a Power BI report, app, dashboard, scorecard, or workspace is created in Power BI and then pasted into a Teams chat or channel, a preview card for the link is generated in the chat/channel window. The purpose this card is to give recipients some information as to what the linked-to item is, so that they can decide whether to open the item or not. In some cascircumstances, the card even includes an Open Copilot summary in Power BI button that the recipient can use to get an even better sense of what the report is about, and whether it's worth opening for further exploration.

:::image type="content" source="./media/service-teams-link-preview/teams-link-preview.png" alt-text="Screenshot showing a link preview card for a report in a Teams chat window.":::

The card shows:

| Item         | Description |
|:-------------|:-------------|
| Item name | The name of the linked-to item |
| Location | The location indicates whether the link links to the report directly, or indirectly as part of the URL of an org app. For example:<br>- *Workspace > AdventureWorks* indicates that the link points directly to the AdventureWorks report.<br>- *Apps > AdventureWorkStores* indicates that the report is being pointed to as part of the URL for an app called AdventureWorksApp.	|
| Open Copilot summary in Power BI | Opens the item in the Power BI app in Teams, with the summary displayed in the Copilot pane. The Open Copilot summary button only appears if Copilot requirements are met. |
| Open | Opens the item in the Power BI app in Teams. |
| Subscribe | Navigates the user to the Subscriptions pane in the Power BI Teams app, where they can create a subscription for the item. |
| Open to access | If the user doesn't have access to the item, the card will have an Open to access button the user can use to request access. |




## Supported items


## Copilot requirements

In order for the Open in Copilot button to appear on the preview card the following requirements must be met:

* The user must have the appropriate licenses.

* The linked to item must be eligble for the Copilot button according to Power BI requirements.


See [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md) for background on how Power BI and Microsoft Teams work together, including requirements you need to meet.

## Get a link preview

Give steps, with note about waiting for the card to appear.

## Considerations and limitations

- Link previews don't work in meeting chat or private channels.
- See the [Known issues and limitations](service-collaborate-microsoft-teams.md#known-issues-and-limitations) section of the "Collaborate in Microsoft Teams" article for other issues.

## Related content

- [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/).
