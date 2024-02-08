---
title: Add comments to dashboards and reports
description: This document shows how to add comments to a dashboard, report, or visual and how to use comments to have conversations with collaborators.
author: mihart
ms.author: mihart
ms.reviewer: mihart
featuredvideoid: 
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 10/31/2023
LocalizationGroup: Consumer
---
# Add comments to a dashboard or report

[!INCLUDE[consumer-appliesto-ynny](../includes/consumer-appliesto-ynny.md)]

Add a personal comment or start a conversation about a dashboard or report with your colleagues. The **comment** feature is just one of the ways a *business user* can collaborate with others.

:::image type="content" source="media/end-user-comment/comment.gif" alt-text="An animation showing the Comments screen when there are no comments added.":::

> [!NOTE]
> Collaborating with others, including adding comments to shared reports, requires a Power BI Pro license or for the content to be hosted in Power BI Premium capacity. [Which license type do I have?](end-user-license.md)

## How to use the Comments feature
Comments can be added to an entire dashboard, individual visuals on a dashboard, a report page, a paginated report, and individual visuals on a report page. Add a general comment or add a comment targeted at specific colleagues. Comments can be up to 2,000 characters, including @mentions of other users and spaces.

When you add a comment to a report, Power BI captures the current filter and slicer values, and creates a [bookmark](end-user-bookmarks.md). So, when you select or respond to a comment, the report page or report visual might change to show you the filter and slicer selections that were active when the comment was first added.  

:::image type="content" source="media/end-user-comment/power-bi-comment.gif" alt-text="An animation showing the Comments section being opened and then the bookmark on a comment is selected.":::

Why is this feature important? If a colleague applied a filter that revealed an insight to share with the team, the comment might not make sense without that filter selected.

If you're using a paginated report, you can only leave a general comment about your report. Support for leaving comments on individual paginated report visuals isn't available.

### Add a general comment to a dashboard or report
The process for adding comments to a dashboard or report is similar. In this example, we're using a dashboard. 

1. Open a Power BI dashboard or report and select the **Comment** icon. This action opens the Comments section.

    :::image type="content" source="media/end-user-comment/power-bi-comment-icon.png" alt-text="Screenshot showing the Comment button on the menu bar.":::

    Here we see that the dashboard creator has already added a general comment. Anyone with access to this dashboard can see this comment.

    :::image type="content" source="media/end-user-comment/power-bi-first-comments.png" alt-text="Screenshot showing a dashboard with the Comments section outlined.":::

2. To respond, select **Reply**, type your response, and then select **Post**.  

    :::image type="content" source="media/end-user-comment/power-bi-comments-reply.png" alt-text="Screenshot showing an at mention in the comment field.":::

    By default, Power BI directs your response to the colleague who started the comment thread, which is Lee in this case. 

    :::image type="content" source="media/end-user-comment/power-bi-respond.png" alt-text="Screenshot showing a comment from Lee and a colleague’s response.":::

 3. If you want to add a comment that isn't part of an existing thread, enter your comment in the upper text field.

    :::image type="content" source="media/end-user-comment/power-bi-new-commenting.png" alt-text="Screenshot showing the comment input field outlined.":::

    The comments for this dashboard now look like the following example.

    :::image type="content" source="media/end-user-comment/power-bi-conversation.png" alt-text="Screenshot showing a new comment thread.":::

### Add a comment to a specific dashboard or report visual
In addition to adding comments to an entire dashboard or to an entire report page, you can add comments to individual dashboard tiles and individual report visuals. The processes are similar, and in this example we're using a dashboard.

1. Hover over the visual and select **More options** (...).    
2. From the menu, select **Add a comment**.

    :::image type="content" source="media/end-user-comment/power-bi-comment-reports.png" alt-text="Screenshot showing the More options menu. Add a comment is outlined."::: 

3. The **Comments** section opens, and the other visuals on the page are greyed out. This visual doesn't have any comments yet. 

    :::image type="content" source="media/end-user-comment/power-bi-comments-column.png" alt-text="Screenshot showing a highlighted visual on a dashboard. The Comments section is outlined.":::

4. Enter your comment and select **Post**.

    :::image type="content" source="media/end-user-comment/power-bi-comment-spikes.png" alt-text="Screenshot showing a comment entered in the Comments section.":::

    - On a report page, when you select a comment on a visual, that visual is highlighted (see the following example).

    - On a dashboard, the chart icon :::image type="icon" source="media/end-user-comment/power-bi-comment-chart-icon.png"::: shows that a comment is tied to a specific visual. Comments that apply to the entire dashboard don't have a special icon. Selecting the chart icon highlights the related visual on the dashboard.
    
    :::image type="content" source="media/end-user-comment/power-bi-highlights.png" alt-text="Screenshot showing a comment selected, and the visual referenced in the comment is highlighted.":::

5. Select **Close** to return to the dashboard or report.

### Get your colleagues attention by using the @ symbol
Whether you're creating a dashboard, report, tile, or visual comment, grab your colleagues' attention by using the "\@" symbol. When you type the "\@" symbol, Power BI opens a dropdown menu where you can search for and select individuals from your organization. Any verified name prefaced with the "\@" symbol appears in blue font. The @mentioned individuals immediately receive an e-mail in their inbox. If they're using a Power BI Mobile app, they receive a push notification on their device. They can open the report or dashboard directly from the notification, see the comment, view the data, and reply accordingly.

Here's a conversation I'm having with the visualization *designer*. They're using the @ symbol to ensure I see the comment. I receive a notification and select the link to open this dashboard and the relevant conversation.  

:::image type="content" source="media/end-user-comment/power-bi-comment-conversation.png" alt-text="Screenshot showing two comments with at mentions.":::  

## Considerations and troubleshooting

- Users with edit access to the report settings can disable the commenting feature. Select **File** > **Settings** and deselect *Allow people to comment on this report or dashboard*.

   :::image type="content" source="media/end-user-comment/power-bi-disable-comment.png" alt-text="Screenshot showing toggle for disabling comments on a dashboard.":::

- Comments are limited to 2,000 characters, including @mentions of other users and spaces.
- The maximum number of conversations on a dashboard or report is 100. The maximum number of comments per conversation is 1000. To add a new conversation or comment, delete prior conversations or comments.
- Bookmarks aren't captured when you reply to a conversation. Only the first comment in a conversation creates a bookmark.
- If you're using a paginated report, you can only leave a general comment about your report. Support for leaving comments on individual paginated report visuals isn't available.

## Related content

- Back to [visualizations for business users](end-user-visualizations.md)    
- [Select a visualization to open a report](end-user-report-open.md)
