---
title: How to configure Power BI report scheduled refresh
description: To refresh data in your Power BI report, a scheduled refresh plan must be created.
author: kfollis
ms.author: kfollis
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 06/10/2020
---
# How to configure Power BI report scheduled refresh
To refresh data in your Power BI report in Power BI Report Server, you must create a scheduled refresh plan. You create this plan in the *Manage* area of a Power BI report on the report server.

![Successful scheduled refresh of a Power BI Report](media/configure-scheduled-refresh/scheduled-refresh-success.png)

## Configure data source credentials
You need the necessary permissions to create a scheduled refresh plan. Permissions are defined in the role definitions for the report server. See [Role definitions - predefined roles](/sql/reporting-services/security/role-definitions-predefined-roles) in the SQL Server Reporting Services documentation for details.

Prior to creating a schedule data refresh plan, you need to set the credentials for **each data source** used in your Power BI report.

1. In the web portal, right-click on the Power BI report and select **Manage**.
   
    ![Select Manage from the Power BI report context menu](media/configure-scheduled-refresh/manage-power-bi-report.png)
2. In the left menu, select the **Data sources** tab.
3. For each data source that appears, choose the type of authentication to use when connecting to that data source. Enter the appropriate credentials.
   
    ![Data source credentials in manage report screen](media/configure-scheduled-refresh/data-source-credentials.png)

## Creating a Schedule Refresh Plan
Follow these steps to create a scheduled refresh plan.

1. In the web portal, right-click on the Power BI report and select **Manage**.
   
    ![Select Manage from the Power BI report context menu](media/configure-scheduled-refresh/manage-power-bi-report.png)
2. In the left menu, select the **Scheduled refresh** tab.
3. On the **Scheduled refresh** page, select **New scheduled refresh plan**.
   
    ![New scheduled refresh plan](media/configure-scheduled-refresh/new-scheduled-refresh-plan.png)
4. On the **New Scheduled Refresh Plan** page, enter a description and set a schedule for when you want your data model to be refreshed.
5. Select **Create scheduled refresh plan** when done.
   
    ![Create Scheduled refresh plan](media/configure-scheduled-refresh/create-scheduled-refresh-plan.png)

## Modifying a Schedule Refresh Plan
Modifying a scheduled refresh plan is similar to creating one.

1. In the web portal, right-click on the Power BI report and select **Manage**.
   
    ![Select Manage from the Power BI report context menu](media/configure-scheduled-refresh/manage-power-bi-report.png)
2. In the left menu, select the **Scheduled refresh** tab.
3. On the **Scheduled refresh** page, select **Edit** beside the refresh plan you want to manage.
   
    ![Select edit next to the plan you want to edit](media/configure-scheduled-refresh/edit-scheduled-refresh-plan.png)
4. On the **Edit Scheduled Refresh Plan** page, enter a description and set a schedule for when you want your data model to be refreshed.
5. Select **Apply** when done.
   
    ![The edit scheduled refresh plan page is similar to the create screen](media/configure-scheduled-refresh/edit-scheduled-refresh-plan-page.png)

## Viewing the status of Schedule Refresh Plan
View the status of a schedule refresh plan in the web portal.

1. In the web portal, right-click on the Power BI report and select **Manage**.
   
    ![Select Manage from the Power BI report context menu](media/configure-scheduled-refresh/manage-power-bi-report.png)
2. In the left menu, select the **Scheduled refresh** tab.
3. On the **Scheduled refresh** page, the right most column displays the status of a plan.
   
   | **Status** | **Description** |
   | --- | --- |
   | New Scheduled Refresh Plan |The plan has been created but has not ran. |
   | Refreshing |The refresh process has started. |
   | Streaming model to Analysis Server |Copying the model from the report server catalog database to the hosted Analysis Services instance. |
   | Refreshing data |Refreshing the data within the model. |
   | Removing credentials from the model |Removed the credentials used to connect to the data source from the model. |
   | Saving model to the catalog |Refreshing of data is complete and the refreshed model is being saved back to the report server catalog database. |
   | Completed: Data Refresh |Refresh is done. |
   | Error: |An error occurred during refresh and is displayed. |

The web page must be refreshed to see the current status. The status will not change automatically.

## Related content
To learn more about creating and modifying schedules, see [Create, modify, and delete schedules](/sql/reporting-services/subscriptions/create-modify-and-delete-schedules).

For information on how to troubleshoot scheduled refresh, see [Troubleshoot scheduled refresh in Power BI Report Server](scheduled-refresh-troubleshoot.md).

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)