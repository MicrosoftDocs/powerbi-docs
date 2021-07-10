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
ms.date: 07/10/2021
LocalizationGroup: Consumer
---
# Add comments to a dashboard or report

[!INCLUDE[consumer-appliesto-ynny](../includes/consumer-appliesto-ynny.md)]

Add a personal comment or start a conversation about a dashboard or report with your colleagues. The **comment** feature is just one of the ways a *business user* can collaborate with others. 

![comments video](media/end-user-comment/comment.gif)

> [!NOTE]
> Collaborating with others, including adding comments to shared reports, requires a Power BI Pro license or for the content to be hosted in Power BI Premium capacity. [Which license type do I have?](end-user-license.md)

## How to use the Comments feature
Comments can be added to an entire dashboard, to individual visuals on a dashboard, to a report page, to a paginated report, and to individual visuals on a report page. Add a general comment or add a comment targeted at specific colleagues. Comments can be up to 500 characters, including @mentions of other users and spaces.

When you add a comment to a report, Power BI captures the current filter and slicer values and creates a [bookmark](end-user-bookmarks.md). This means that when you select or respond to a comment, the report page or report visual may change to show you the filter and slicer selections that were active when the comment was first added.  

![report with filters video](media/end-user-comment/power-bi-comment.gif)

Why is this important? Say a colleague applied a filter that revealed an interesting insight that they want to share with the team. Without that filter selected, the comment might not make sense.

If you are using a paginated report, you may only leave a general comment about your report.  Support for leaving comments on individual paginated report visuals is not available.

### Add a general comment to a dashboard or report
The process for adding comments to a dashboard or report is similar.  In this example, we're using a dashboard. 

1. Open a Power BI dashboard or report and select the **Comment** icon. This opens the Comments dialog.

    ![comments icon on menu bar](media/end-user-comment/power-bi-comment-icon.png)

    Here we see that the dashboard creator has already added a general comment.  Anyone with access to this dashboard can see this comment.

    ![Screenshot of dashboard with Comments section selected](media/end-user-comment/power-bi-first-comments.png)

2. To respond, select **Reply**, type your response, and select **Post**.  

    ![Select Reply screen](media/end-user-comment/power-bi-comments-reply.png)

    By default, Power BI directs your response to the colleague who started the comment thread, in this case Aaron. 

    ![Comment with response](media/end-user-comment/power-bi-respond.png)

 3. If you want to add a comment that is not part of an existing thread, enter your comment in the upper text field.

    ![Screenshot showing new thread](media/end-user-comment/power-bi-new-commenting.png)

    The comments for this dashboard now look like this.

    ![Comments conversations](media/end-user-comment/power-bi-conversation.png)

### Add a comment to a specific dashboard or report visual
In addition to adding comments to an entire dashboard or to an entire report page, you can add comments to individual dashboard tiles and individual report visuals. The processes are similar, and in this example we're using a report.

1. Hover over the visual and select **More options** (...).    
2. From the dropdown, select **Add a comment**.

    ![Add a comment is first choice](media/end-user-comment/power-bi-comment-reports.png)  

3.  The **Comments** dialog opens, and the other visuals on the page are greyed out. This visual doesn't have any comments yet. 

    ![Screenshot of visual selected and Comments dialog open](media/end-user-comment/power-bi-comments-column.png)  

4. Type your comment and select **Post**.

    ![Comments dialog with new message](media/end-user-comment/power-bi-comment-spikes.png)  

    - On a report page, selecting a comment that was made on a visual, highlights that visual (see below).

    - On a dashboard, the chart icon ![comment with chart icon](media/end-user-comment/power-bi-comment-chart-icon.png) lets us know that a comment is tied to a specific visual. Comments that apply to the entire dashboard do not have a special icon. Selecting the chart icon highlights the related visual on the dashboard.
    

    ![related visual highlighted](media/end-user-comment/power-bi-highlights.png)

5. Select **Close** to return to the dashboard or report.

### Get your colleagues attention by using the @ sign
Whether you're creating a dashboard, report, tile, or visual comment, grab your colleagues' attention by using the "\@" symbol.  When you type the "\@" symbol, Power BI opens a dropdown where you can search for and select individuals from your organization. Any verified name prefaced with the "\@" symbol, appears in blue font. The @mentioned individuals will immediately receive an e-mail in their inbox, and if they are using a Power BI Mobile app, they will receive a push notification on their device. They can open the report or dashboard directly from the notification, see the comment, view the data, and reply accordingly.

Here's a conversation I'm having with the visualization *designer*. They are using the @ symbol to ensure I see the comment. I receive a notification and select the link to open this dashboard and the relevant conversation.  

![Add a comment mention](media/end-user-comment/power-bi-comment-conversation.png)  

## Considerations and troubleshooting

- Comments are limited to 500 characters, including @mentions of other users and spaces.
- The maximum number of conversations on a dashboard or report is 100. The maximum number of comments per conversation is 1000. To add a new conversation or comment, delete prior conversations or comments.
- Bookmarks are not captured when you reply to a conversation. Only the first comment in a conversation creates a bookmark.
- If you are using a paginated report, you may only leave a general comment about your report.  Support for leaving comments on individual paginated report visuals is not available.

## Next steps
Back to [visualizations for business users](end-user-visualizations.md)    
[Select a visualization to open a report](end-user-report-open.md)
