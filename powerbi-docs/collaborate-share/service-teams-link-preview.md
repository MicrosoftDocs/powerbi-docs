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

# Link preview cards in Microsoft Teams chats and channels

When you paste a link to a Power BI report, app, dashboard, scorecard, or workspace into a Teams chat or channel, a preview card showing some details about the linked-to item is generated in the chat/channel window. The purpose the preview card is to help chat participants decide whether to open the link or not.

Typically, the preview card provides the following:

* The name of the tenant.
* The name of the linked-to item.
* The location of the item.
* An *Open* button that opens the item in the Power BI app in Teams.
* A Subscribe button that navigates the user to the Subscriptions pane in the Power BI Teams app.

The following image shows a typical link preview card.

image

If the linked to item is a report that is eligible for Copilot, the card will also have an *Open Copilot summary in Power BI* button that opens the report in the Power BI app in Teams, with the summary displayed in the Copilot pane. See XXX for more detail.

image



## Link preview cards for reports that have Copilot summaries

If the linked to item is a report that The preview card in sensitive to the permissions and licenses the user has. 


If the linked-item is a report that is eligible for Copilot, the card will have a *Open Copilot summary in Power BI* button that opens the report in the Power BI app in Teams, with the summary displayed in the Copilot pane. The purpose of this button is to save the user time in deciding whether to explore the report further.

The exact contents of the preview card in a users' Teams chat windows varies according to the permissions and licenses the user has.
* If the user doesn't have a license for Copilot, the Open Copilot summary in Power BI button will never be available.
* If the user doesn't have permissions to view the linked-to item, a *Open to request access* button appears instead of the *Open button*. 



:::image type="content" source="./media/service-teams-link-preview/teams-link-preview.png" alt-text="Screenshot showing a link preview card for a report in a Teams chat window." border="false":::

The contents of the card vari

If the link is to a Power BI report, the card might even include an *Open Copilot summary in Power BI* that can be used to get an even better sense of what the linked-to item is about and whether it's worth opening for further exploration.

:::image type="content" source="./media/service-teams-link-preview/teams-link-preview.png" alt-text="Screenshot showing a link preview card for a report in a Teams chat window." border="false":::

The card shows:

| Item         | Description |
|:-------------|:-------------|
| ? | ? |
| Item name | The name of the linked-to item |
| Location | The location indicates whether the link is a direct link to an item in a workspace or a link to an org app. For example:<br>- *Workspace > AdventureWorks* indicates that the link points directly to the AdventureWorks report.<br>- *Apps > AdventureWorkStores* indicates that the report is being pointed to as part of the URL for an app called AdventureWorksApp. |
| Open Copilot summary in Power BI | Opens the item in the Power BI app in Teams, with the summary displayed in the Copilot pane. The Open Copilot summary button only appears if [Copilot requirements]() are met. |
| Open | Opens the item in the Power BI app in Teams. |
| Subscribe | Navigates the user to the Subscriptions pane in the Power BI Teams app, where they can create a subscription for the item. |
| Open to access | If the user doesn't have access to the item, the card will have an Open to access button the user can use to request access. |

The appearance of the card in the chat varies according to the permissions and licensing of the user.

*  Item location isn't visible to users who don't have permissions to view the item.
* The *Open Copilot summary in Power BI* button isn't available for users who aren't licensed for Copilot.
will never Users who don't have permissions to view the item won't see doesn't have permissions to view the item, 



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
