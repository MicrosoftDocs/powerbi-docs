---
title: View workspaces
description: Learn how to view and understand info about Power BI workspaces and manage workspaces as an administrator.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: admin-portal
ms.topic: how-to
ms.date: 11/10/2022
LocalizationGroup: Administration
---

# View workspaces

Go to the **Admin portal** to access this feature. For information about how to get to and use the Admin portal, see [About the Admin portal](service-admin-portal.md).

As an administrator, you can view the workspaces that exist in your organization on the **Workspaces** tab. On this tab, you can perform these actions:

- Refresh the list of workspaces and their details.
- Export the data about the workspaces to a .csv file.
- See details about a workspace, including its ID, its users and their roles, and its dashboards, reports, and datasets.
- Edit the list of people who have access. You can use this feature to delete workspaces by first adding yourself to a workspace as an admin then opening the workspace to delete it.
- Edit the Name and Description fields.
- Upgrade classic workspaces to the new workspace experience.

:::image type="content" source="media/service-admin-portal-workspaces/power-bi-workspaces-admin-portal.png" alt-text="Screenshot that shows a Power B I workspaces list in the admin portal.":::

Admins can also control users' ability to create new workspace experience workspaces, and classic workspaces. See [Workspace settings](service-admin-portal-workspace.md) in this article for details.

The table columns on the **Workspaces** tab correspond to the properties returned by the [Power BI admin Rest API](/rest/api/power-bi/admin) for workspaces. Personal workspaces are of type **PersonalGroup**, classic workspaces are of type **Group**, and the new workspace experience workspaces are of type **Workspace**. For more information, see [Workspaces in Power BI](../collaborate-share/service-new-workspaces.md).

On the **Workspaces** tab, you see the *state* for each workspace. The following table gives more details about the meaning of those states.

|State  |Description  |
|---------|---------|
| **Active** | A normal workspace. It doesn't indicate anything about usage or what's inside, only that the workspace itself is "normal". |
| **Orphaned** | A workspace with no admin user. You need to assign an admin. |
| **Deleted** | A deleted workspace. A Power BI administrator can restore the workspace up to 90 days after it was deleted. When the 90 days pass, the workspace enters the *Removing* state.<br>If you delete a *MyWorkspace* workspace, it moves to the *Removing* state immediately, without the 90 days grace period. |
| **Removing** | After you delete a workspace, and once the 90 day grace period passes, the workspace moves into the *Removing* state. During this state, the workspace is permanently removed. Permanently removing a workspace takes a short while, and depends on the service and folder content. |
| **Not found** | If the customer's API request includes a workspace ID for a workspace that doesn't belong to the customer's tenant, "Not found" is returned as the status for that ID. |

Admins can also manage and recover workspaces using either the admin portal or PowerShell cmdlets.

![Admins can also manage and recover workspaces.](media/service-admin-portal-workspaces/admin-portal-manage-workspaces.png)

## Next steps

* [About the Admin portal](service-admin-portal.md)
