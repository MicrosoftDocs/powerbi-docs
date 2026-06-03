---
title: Add comments to a report in Power BI Report Server
description: Learn how to add comments to a Power BI report or a paginated report on a Power BI Report Server or SQL Server Reporting Services report server.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: petebro
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 05/28/2026
ai-usage: ai-assisted

#customer intent: As a report server administrator or user, I want to add comments to reports so that I can collaborate with others on report content.
---

# Add comments to a report in Power BI Report Server

You can add comments to reports, including Power BI reports, within the web portal of a report server. The comments are stored with the report, and anyone with the **Comment on reports** or **Manage comments** role assignment can see the comments for the report. For more information, see the [Permissions for report comments](#permissions-for-report-comments) section.

> [!NOTE]
> As of June 2025, the comments feature is deprecated and disabled by default in all versions of Reporting Services later than 2019 and in Power BI Report Server. To enable the feature again, see [Server properties advanced page](/sql/reporting-services/tools/server-properties-advanced-page-reporting-services) for the controlling property.
>
> The comments feature will be removed completely in a future version of Power BI Report Server.

## Add or view comments

1. Open a paginated or Power BI report on a report server.
1. In the upper-right corner, select **Comments**.

   :::image type="content" source="media/add-comments/report-server-web-portal-comments-button.png" alt-text="Screenshot of the Comments button in the upper-right corner of the report server web portal.":::

   In the **Comments** pane, you can see any existing comments.

1. Write your comment, and then select **Post Comment**.

   :::image type="content" source="media/add-comments/report-server-web-portal-comments-pane.png" alt-text="Screenshot of the Comments pane with the Post Comment option in the report server web portal.":::

   Your comment appears in the **Comments** pane on the web portal, along with any previous comments. Comments don't appear with the report in the Power BI mobile apps.

> [!TIP]
> Did you know? You can [annotate Power BI reports in the Power BI mobile apps](../explore-reports/mobile/mobile-share-dashboard-from-the-mobile-apps.md#annotate-and-share) and share the annotated reports with others.

## Permissions for report comments

In Power BI Report Server, your ability to see, edit, delete, and manage comments depends on the tasks included in your role assignment.

* To see all comments and post, edit, and delete your own comments, your role assignment must include the **Comment on reports** task.
* To see all comments; post, edit, and delete your own comments; and delete other people's comments, your role assignment must include the **Manage comments** task.

For more information about permissions related to comments, see [Tasks and Permissions - Item-Level Tasks](/sql/reporting-services/security/tasks-and-permissions-item-level-tasks) in the SQL Server Reporting Services documentation.

## Related content

* [What is Power BI Report Server?](get-started.md)
* [Try asking the Power BI Community](https://community.powerbi.com/)

