---
title: Link preview cards in Microsoft Teams chats and channels
description: Learn about link preview cards in Microsoft Teams chats and channels.
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 09/29/2025
---

# Link preview cards in Microsoft Teams chats and channels

This article describes link preview cards that are generated in Teams chats and channels for links to [supported Power BI item types](#item-types-with-link-preview-card-support). It's intended for chat participants who are interested to know what the cards show and how they can enhance collaboration.

## About link preview cards

A preview card appears in your Teams chat or channel window when you paste a link to a Power BI report, app, dashboard, or workspace. The preview card, which contains details about the linked-to item, enhances collaboration by helping chat participants decide whether or not to open the link.

:::image type="content" source="./media/service-teams-link-preview/teams-link-preview.png" alt-text="Screenshot showing a link preview card for a report in a Teams chat window." border="false":::

If someone in that chat or channel opens the link you pasted, it opens in a new Teams window instead of directly in the Power BI app in Teams.

> [!IMPORTANT]
> When you paste a link into the chat, it might take a second or two for the link preview card to appear. **Wait for the card to appear before sending the message.** If you press **Send** before the card appears, the preview card isn't generated.

Typically, the preview card provides the following:

- The name of the linked-to item
- The location of the item
- An *Open* button that opens the item in the Power BI app in Teams
- A *Subscribe* button that navigates the user to the Subscriptions pane in the Power BI app in Teams

The preview card is sensitive to the permissions and licenses that the chat participant has. Thus if a chat participant doesn't have permissions to view the item, an *Open to request access* button appears on the card instead of the *Open button*.

> [!NOTE]
> In chats and channels with more than 60 participants, the card isn't sensitive to each participant's permissions. Rather, all participants see the card as it appears to the user who pasted the link into the chat. This can lead to unexpected card behavior. For more information, see the [considerations and limitations](#considerations-and-limitations) section.

## Link preview cards for reports that have Copilot summaries

If the linked-to item is a report, and the report and the chat participant meet the [Copilot summary requirements for Power BI](/power-bi/create-reports/copilot-pane-summarize-content), the link preview card has an *Open Copilot summary in Power BI* button. The button opens the report in the Power BI app in Teams, and the summary is displayed in the Copilot pane. The purpose of this button is to save the user time in deciding whether to explore the report further. As mentioned, the button is only available for users who have the appropriate permissions, and only if the report meets the requirements for Copilot summaries in Power BI.

The following image shows the link preview card with the *Open Copilot summary in Power BI* button.

:::image type="content" source="./media/service-teams-link-preview/teams-link-preview-copilot-summary-button.png" alt-text="Screenshot showing a link preview card for a report that has a Copilot summary." border="false":::

## Item types with link preview card support

Link preview cards are generated for the following Power BI items:

- Reports
- Org apps 
- Dashboards
- Workspaces

## Considerations and limitations

- In chats or channels with more than 60 participants, permissions and licensing of card viewers isn't checked. All participants see the card as it was generated for the person who pasted the link in the chat. This can lead to the following unexpected behaviors:
    - Chat participants who don't have permissions to view the item may still see the *Open* button, even though they can't open the item when they select the button.
    - Chat participants who don't have the appropriate license for Copilot might see the *Open Copilot summary in Power BI* button, but can't open the report with the Copilot summary when they select the link.
- See the [Known issues and limitations](service-collaborate-microsoft-teams.md#known-issues-and-limitations) section of the "Collaborate in Microsoft Teams" article for other issues.

## Related content

- [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)
- [Summarize a report in the Copilot pane](/power-bi/create-reports/copilot-pane-summarize-content)
