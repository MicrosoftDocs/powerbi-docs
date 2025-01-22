---
title: Link preview cards in Microsoft Teams chats and channels
description: Learn about link preview cards in Microsoft Teams chats and channels.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 01/21/2025
---

# Link preview cards in Microsoft Teams chats and channels

When you paste a link to a Power BI report, app, dashboard, scorecard, or workspace into a Teams chat or channel, a preview card showing some details about the linked-to item is generated in the chat/channel window. The purpose the preview card is to help chat participants decide whether to open the link or not.

> [!IMPORTANT]
> When you paste a link into the Teams chat or channel, it might take a second or two for the link preview card to appear. Wait for the card to appear before pressing sending the message! If you press send before the card appears, it will never be generated.

Typically, the preview card provides the following:

* The name of the tenant.
* The name of the linked-to item.
* The location of the item.
* An *Open* button that opens the item in the Power BI app in Teams.
* A *Subscribe* button that navigates the user to the Subscriptions pane in the Power BI Teams app.

If the linked to item is a report that is eligible for Copilot, the card will also have an *Open Copilot summary in Power BI* button that opens the report in the Power BI app in Teams, with the summary displayed in the Copilot pane. See XXX for more detail.

The preview card is sensitive to the permissions and licenses the user has. Thus:
* If the user doesn't have permissions to view the linked-to item, an *Open to request access* button appears instead of the *Open button*.
* If the user doesn't have a license for Copilot, the *Open Copilot summary in Power BI* button won't be available.

The following image shows a typical link preview card.

:::image type="content" source="./media/service-teams-link-preview/teams-link-preview.png" alt-text="Screenshot showing a link preview card for a report in a Teams chat window." border="false":::

## Link preview cards for reports that have Copilot summaries

If the linked-item is a report that is [eligible for Copilot](), the card can have a *Open Copilot summary in Power BI* button that opens the report in the Power BI app in Teams, with the summary displayed in the Copilot pane. The purpose of this button is to save the user time in deciding whether to explore the report further. The button is only available for users who have the [appropriate licensing]().

The following image show the link preview card with the *Open Copilot summary in Power BI* button.

:::image type="content" source="./media/service-teams-link-preview/teams-link-preview-copilot-summary-button.png" alt-text="Screenshot showing a link preview card for a report that has a Copilot summary." border="false":::

## Supported items


## Copilot requirements

In order for the Open in Copilot button to appear on the preview card the following requirements must be met:

* The user must have the appropriate licenses.

* The linked to item must be eligble for the Copilot button according to Power BI requirements.

## Get a link preview

Give steps, with note about waiting for the card to appear.

## Considerations and limitations

* Link previews don't work in meeting chat or private channels.
* In chats or channels with more than 60 participants, permissions and licensing of card viewers is not checked. All participants see the card as it was generated for the person who pasted the link in the chat. This can lead to unexpected behavior:
    * Chat participants who don't have permissions to view the item may still see the *Open* button, even though they won't be able to open the item when they select the button.
    * Chat participants who don't have the appropriate license might see the *Open Copilot summary in Power BI* button, but won't be able to open the report with the Copilot summary when they select the link..
    * See the [Known issues and limitations](service-collaborate-microsoft-teams.md#known-issues-and-limitations) section of the "Collaborate in Microsoft Teams" article for other issues.

## Related content

- [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/).
