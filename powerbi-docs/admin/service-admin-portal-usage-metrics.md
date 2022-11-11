---
title: View usage metrics
description: Learn how to view Power BI usage metrics.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: admin-portal
ms.topic: how-to
ms.date: 05/15/2022
LocalizationGroup: Administration
---

# View usage metrics

The *usage metrics* page in the Power BI admin settings allows you to monitor Power BI usage for your organization. It also shows which users and groups in your organization are the most active in Power BI. With this information, you can get real insights into how people are using Power BI across your organization.

[!INCLUDE[Screenshot showing how to get to the admin settings from the main page.](../includes/admin-portal-settings.md)]

## Usage metrics dashboard

The first time you access the dashboard, or when you revisit after a long period of not viewing the dashboard, you might see a loading screen before the dashboard appears. After the dashboard loads, you see two sections of tiles. The first section, at the top of the page, includes usage data for individual users. The second section, at the bottom of the page, has similar information for groups. This section lets you see which groups in your organization are most active and what kind of content they're consuming.

The following sections of the article show a breakdown of what you can see in each tile.

### Number of users

This tile shows a distinct count of all dashboards, reports, and datasets in a workspace. The tile in the first section refers to users, and the tile in the second section to groups.
  
![Screenshot of a Poweber BI dashboard tile showing distinct count of dashboards, reports, datasets.](media/service-admin-portal-usage-metrics/powerbi-admin-usage-metrics-number-tiles.png)

### Consumed dashboards

This tile shows a list of the most consumed dashboards. The tile in the first section refers to the number of users who consumed the dashboards, and the tile in the second section to the number of groups that consumed each dashboard. For example, if you have a dashboard that you shared with three users and you also added it to an app that two different users connected to, the dashboard's count would be six: 1 (you) + 3 (shared users) + 2 (app users).
  
![Screenshot of a Power BI tile showing most consumed dashboards.](media/service-admin-portal-usage-metrics/powerbi-admin-usage-metrics-top-dashboards.png)

### Consumed packages

This tile shows a breakdown of the most popular content. The tile in the first section shows content users connected to, and the tile in the second section shows content groups connected to. The content includes anything the users could reach using the Get Data process, such as SaaS template apps, files, or databases.

![Screenshot of a Power BI tile showing most consumed packages.](media/service-admin-portal-usage-metrics/powerbi-admin-usage-metrics-top-connections.png)

### Top users or groups based on dashboards

This tile shows a view of your top users based on how many dashboards they have. Each entry includes dashboards they created themselves and dashboards shared with them. The tile in the second section, shows top groups based on the number of dashboards they have.
  
![Screenshot of a Power BI tile showing top users based on how many dashboards they have.](media/service-admin-portal-usage-metrics/powerbi-admin-usage-metrics-top-users-dashboards.png)

### Top users or groups based on reports

A tile that shows a view of your top users based on how many reports they have. The tile in the second section, shows top groups based on the number of reports they have.
  
![Screenshot of a Power BI tile showing top users based on how many reports they have.](media/service-admin-portal-usage-metrics/powerbi-admin-usage-metrics-top-users-reports.png)

## Next steps

>[!div class="nextstepaction"]
>[About the Admin portal](service-admin-portal.md)
