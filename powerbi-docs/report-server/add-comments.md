---
title: Add comments to a report in Power BI Report Server
description: Learn how to add comments to a Power BI or a paginated report on a Power BI Report Server or SQL Server Reporting Services report server.
author: petebro
ms.author: petebro
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 05/15/2025
---

# Add comments to a report in a report server - Power BI Report Server

You can add comments to reports, including Power BI reports, within the web portal of a report server. The comments live with the report, and anyone with the right permissions can see the comments for the report. See the [Permissions](#permissions) section below for details.

>[!NOTE] 
> As of June 2025 the comments feature is considered deprecated has been disabled by default in all versions of Reporting Services later than 2019 as well as Power BI Report Server. To enable the feature again please see the [Server properties advanced page](https://learn.microsoft.com/sql/reporting-services/tools/server-properties-advanced-page-reporting-services).
> The comments feature and will be removed completely in a future version of Power BI Report Server.

## Add or view comments

1. Open a paginated or Power BI report on a report server.
1. In the upper-right corner, select **Comments**.

![Select Comments](media/add-comments/report-server-web-portal-comments-button.png)
   
In the Comments pane, you can see any existing comments.


3. Write your comment, then select **Post Comment**.

![Post Comment](media/add-comments/report-server-web-portal-comments-pane.png)
   
Your comment shows in the pane on the web portal, along with any previous comments. They don't appear with the report on in the Power BI mobile apps.

> [!TIP]
> Did you know? You can [annotate Power BI reports in the Power BI mobile apps](../consumer/mobile/mobile-annotate-and-share-a-tile-from-the-mobile-apps.md) and share the annotated reports with others.

## Permissions

Your ability to see, edit, delete, and manage comments depends on the tasks included in your role assignment. 

* To see all comments, and post, edit, and delete your own, your role assignment must include the "Comment on reports" task. 
* To see all comments; post, edit, and delete your own; and delete other people’s, your role assignment must include the "Manage comments" task. 

For more details on permissions related to comments, see [Tasks and Permissions - Item-Level Tasks](/sql/reporting-services/security/tasks-and-permissions-item-level-tasks) in the SQL Server Reporting Services documentation.

## Related content

* [What is Power BI Report Server?](get-started.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
