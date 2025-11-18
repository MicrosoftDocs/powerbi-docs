---
title: How to configure Power BI report scheduled refresh
description: To refresh data in your Power BI report, a scheduled refresh plan must be created.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 11/01/2025
ms.custom: sfi-image-nochange
ai-usage: ai-assisted
---
# How to configure Power BI report scheduled refresh

To refresh data in your Power BI report in Power BI Report Server, you must create a scheduled refresh plan. You create this plan in the *Manage* area of a Power BI report on the report server.

:::image type="content" source="media/configure-scheduled-refresh/scheduled-refresh-success.png" alt-text="Screenshot showing a successful scheduled refresh of a Power BI Report.":::

## Configure data source credentials

You need the necessary permissions to create a scheduled refresh plan. Permissions are defined in the role definitions for the report server. See [Role definitions - predefined roles](/sql/reporting-services/security/role-definitions-predefined-roles) in the SQL Server Reporting Services documentation for details.

Prior to creating a schedule data refresh plan, you need to set the credentials for **each data source** used in your Power BI report.

1. In the web portal, right-click on the Power BI report and select **Manage**.

    :::image type="content" source="media/configure-scheduled-refresh/manage-power-bi-report.png" alt-text="Screenshot showing the Select Manage option from the Power BI report context menu.":::

1. In the left menu, select the **Data sources** tab.
1. For each data source that appears, choose the type of authentication to use when connecting to that data source. Enter the appropriate credentials.

    :::image type="content" source="media/configure-scheduled-refresh/data-source-credentials.png" alt-text="Screenshot showing data source credentials in manage report screen.":::

## Creating a Schedule Refresh Plan

Follow these steps to create a scheduled refresh plan.

1. In the web portal, right-click on the Power BI report and select **Manage**.

    :::image type="content" source="media/configure-scheduled-refresh/manage-power-bi-report.png" alt-text="Screenshot of selecting Manage from the Power BI report context menu.":::

1. In the left menu, select the **Scheduled refresh** tab.
1. On the **Scheduled refresh** page, select **New scheduled refresh plan".

    :::image type="content" source="media/configure-scheduled-refresh/new-scheduled-refresh-plan.png" alt-text="Screenshot showing the New scheduled refresh plan option.":::

1. On the **New Scheduled Refresh Plan** page, enter a description and set a schedule for when you want your data model to be refreshed.
1. Select **Create scheduled refresh plan** when done.

    :::image type="content" source="media/configure-scheduled-refresh/create-scheduled-refresh-plan.png" alt-text="Screenshot showing the Create Scheduled refresh plan option.":::

## Modifying a Schedule Refresh Plan

Modifying a scheduled refresh plan is similar to creating one.

1. In the web portal, right-click on the Power BI report and select **Manage**.

    :::image type="content" source="media/configure-scheduled-refresh/manage-power-bi-report.png" alt-text="Screenshot showing the Select Manage option from the Power BI report context menu.":::

1. In the left menu, select the **Scheduled refresh** tab.
1. On the **Scheduled refresh** page, select **Edit** beside the refresh plan you want to manage.

    :::image type="content" source="media/configure-scheduled-refresh/edit-scheduled-refresh-plan.png" alt-text="Screenshot showing Select edit next to the plan you want to edit.":::

1. On the **Edit Scheduled Refresh Plan** page, enter a description and set a schedule for when you want your data model to be refreshed.
1. Select **Apply** when done.

    :::image type="content" source="media/configure-scheduled-refresh/edit-scheduled-refresh-plan-page.png" alt-text="Screenshot showing the edit scheduled refresh plan page is similar to the create screen.":::

## Viewing the status of Schedule Refresh Plan

View the status of a schedule refresh plan in the web portal.

1. In the web portal, right-click on the Power BI report and select **Manage**.

    :::image type="content" source="media/configure-scheduled-refresh/manage-power-bi-report.png" alt-text="Screenshot showing the Select Manage option from the Power BI report context menu.":::

1. In the left menu, select the **Scheduled refresh** tab.
1. On the **Scheduled refresh** page, the right most column displays the status of a plan.

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