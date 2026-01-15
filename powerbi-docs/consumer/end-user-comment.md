---
title: Add Comments to Dashboards and Reports
description: Learn how to add comments to Power BI dashboards, reports, and visuals, and how comments capture filter context as bookmarks. Start collaborating today.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/14/2026
ai-usage: ai-assisted
LocalizationGroup: Consumer
---
# Add comments to a dashboard or report

[!INCLUDE[consumer-appliesto-ynny](../includes/consumer-appliesto-ynny.md)]

Add comments to Power BI dashboards, reports, and individual visuals to collaborate with colleagues. You can @mention colleagues to notify them, and they receive an email or push notification with a link to the comment.

> [!NOTE]
> Commenting requires a Power BI Pro or Premium Per User (PPU) license, or the content must reside in a Premium (or Fabric F64+) capacity. See [Power BI license types](../fundamentals/end-user-license.md).

## How comments capture context

When you add a comment to a report, Power BI captures the current filter and slicer values as a [bookmark](end-user-bookmarks.md). When someone selects the comment, the report restores those filter settings so they see exactly what you saw.

:::image type="content" source="media/end-user-comment/power-bi-comment.gif" alt-text="Animation showing comments opening and a bookmark restoring filter context.":::

> [!NOTE]
> Bookmarks are captured only for the first comment in a thread, not for replies.

## Add a comment

1. Select the **Comment** icon in the menu bar to open the Comments pane.
1. Type your comment and select **Post**.

To comment on a specific visual, hover over it, select **More options (...)** > **Add a comment**. A chart icon :::image type="icon" source="media/end-user-comment/power-bi-comment-chart-icon.png"::: indicates comments tied to a specific visual.

Use **@** followed by a colleague's name to notify them directly.

:::image type="content" source="media/end-user-comment/power-bi-comment-conversation.png" alt-text="Screenshot showing comments with @mentions.":::

## Considerations and limitations

- Characters per comment: 2,000 (including @mentions and spaces)
- Conversations per dashboard or report: 100
- Comments per conversation: 1,000
- Paginated reports: General comments only (not on individual visuals)

Report owners can turn off comments in **File** > **Settings**.

## Related content

- [Interact with reports and dashboards](end-user-reading-view.md)
- [Visualizations for business users](end-user-visualizations.md)
