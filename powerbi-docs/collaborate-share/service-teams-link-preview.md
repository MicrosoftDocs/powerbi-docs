---
title: Link preview cards in Microsoft Teams chats and channels
description: Learn about link preview cards in Microsoft Teams chats and channels.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 01/22/2025
---

# Link preview cards in Microsoft Teams chats and channels

This article describes link preview cards that are generated in Teams chats and channels for links to [supported Power BI item types](#item-types-with-link-preview-card-support). It is intended for chat participants who are interested to know what the cards show and how they can enhance collaboration.

## About link preview cards

When you paste a link to a Power BI report, app, dashboard, scorecard, or workspace into a Teams chat or channel, a preview card showing some details about the linked-to item is generated in the chat/channel window. The purpose of the preview card is to enhance collaboration by helping chat participants decide whether to open the link or not.

:::image type="content" source="./media/service-teams-link-preview/teams-link-preview.png" alt-text="Screenshot showing a link preview card for a report in a Teams chat window." border="false":::

> [!IMPORTANT]
> When you paste a link into the chat, it might take a second or two for the link preview card to appear. **Wait for the card to appear before sending the message!** If you press send before the card appears, it will never be generated.

Typically, the preview card provides the following:

* The name of the tenant.
* The name of the linked-to item.
* The location of the item.
* An *Open* button that opens the item in the Power BI app in Teams.
* A *Subscribe* button that navigates the user to the Subscriptions pane in the Power BI app in Teams.

The preview card is sensitive to the permissions and licenses that the chat participant has. Thus if a chat participant doesn't have permissions to view the item, an *Open to request access* button appears on the card instead of the *Open button*.

> [!NOTE]
> In chats and channels with more than 60 participants, the card is not sensitive to each participant's permissions. Rather, all participants see the card as it appears to the user who pasted the link into the chat. This can lead to unexpected card behavior. See the [considerations and limitations](#considerations-and-limitations) for more detail.

## Link preview cards for reports that have Copilot summaries

If the linked-to item is a report, and the report and the chat participant meet the [Copilot summary requirements for Power BI](/power-bi/create-reports/copilot-pane-summarize-content), the link preview card will have an *Open Copilot summary in Power BI* button that opens the report in the Power BI app in Teams, with the summary displayed in the Copilot pane. The purpose of this button is to save the user time in deciding whether to explore the report further. As mentioned, the button is only available for users who have the appropriate permissions, and only if the report meets the requirements for Copilot summaries in Power BI.

The following image shows the link preview card with the *Open Copilot summary in Power BI* button.

:::image type="content" source="./media/service-teams-link-preview/teams-link-preview-copilot-summary-button.png" alt-text="Screenshot showing a link preview card for a report that has a Copilot summary." border="false":::

## Item types with link preview card support

Link preview cards are generated for the following Power BI items.

* Reports
* Org apps 
* Dashboards
* Scorecards
* Workspaces

## Considerations and limitations

* Link previews don't work in meeting chats or private channels.
* In chats or channels with more than 60 participants, permissions and licensing of card viewers isn't checked. All participants see the card as it was generated for the person who pasted the link in the chat. This can lead to the following unexpected behaviors:
    * Chat participants who don't have permissions to view the item may still see the *Open* button, even though they won't be able to open the item when they select the button.
    * Chat participants who don't have the appropriate license for Copilot might see the *Open Copilot summary in Power BI* button, but won't be able to open the report with the Copilot summary when they select the link.
* See the [Known issues and limitations](service-collaborate-microsoft-teams.md#known-issues-and-limitations) section of the "Collaborate in Microsoft Teams" article for other issues.

## Related content

* [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)
- [Summarize a report in the Copilot pane](/power-bi/create-reports/copilot-pane-summarize-content)

More questions? [Ask the Power BI Community](https://community.powerbi.com/).
