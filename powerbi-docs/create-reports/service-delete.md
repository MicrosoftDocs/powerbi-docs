---
title: "Delete a Dashboard, Report, Workbook, or Semantic Model in Power BI"
description: "Learn how to delete dashboards, reports, workbooks, and semantic models from a workspace in the Power BI service. Follow these steps to remove assets and free up space."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/21/2026
---
# Delete a dashboard, report, workbook, or semantic model in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

In the Power BI service, you can delete dashboards, reports, workbooks, and semantic models from a workspace. You can also remove apps from your apps list page.

## Delete a dashboard, report, workbook, or semantic model from a workspace

Dashboards, reports, workbooks, and semantic models all follow the same steps.

1. Open the workspace that contains the asset you want to delete.
1. Select **More options (...)** next to the asset, and choose **Delete**.
1. Select **Delete** to confirm the deletion.

## Remove an app from your apps list page

Removing an app from your apps list page doesn't delete the app for other members. Only an admin or a member of a workspace can permanently delete the app from that workspace.

1. In the nav pane, select **Apps** to open the apps list page.
1. Hover over the app you want to delete, select **More options (...)**, and then choose **Delete**.

   If you remove an app accidentally, you have several options for getting it back:

   - Ask the app creator to resend it.
   - Find the original email with the link to the app.
   - Check your Notifications center to see if the notification for that app is still listed.
   - Check [your organization's AppSource](../explore-reports/end-user-apps.md).

## Considerations and limitations

- Removing a dashboard doesn't delete the underlying semantic model or any reports associated with that dashboard.
- If you're the owner of a dashboard or report, you can remove it. If you shared it with colleagues, removing it from your workspace removes it from their workspaces too.
- If a dashboard or report is shared with you, you can't remove it.
- Deleting a report doesn't delete the semantic model that the report is based on. Any visualizations that you pinned to a dashboard from the report are safe. They remain on the dashboard until you delete them individually.
- Deleting a semantic model also deletes all reports and dashboard tiles that contain data from that semantic model.
- Removing a workbook also removes all reports and dashboard tiles that contain data from that workbook. If a workbook is stored on OneDrive for work or school, deleting it from Power BI doesn't delete it from OneDrive.

## Related content

- [Remove (unfavorite) a dashboard](../explore-reports/end-user-favorite.md#unfavorite-content)
- [Delete dashboard tiles](service-dashboard-edit-tile.md#delete-the-tile)
- [Remove members from a workspace](../collaborate-share/service-give-access-new-workspaces.md#remove-or-change-access-for-a-workspace-member)
- [Delete a workspace](../collaborate-share/service-create-the-new-workspaces.md#delete-a-workspace)
