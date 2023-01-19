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
ms.date: 01/19/2023
LocalizationGroup: Administration
---

# Manage workspaces

Go to the **Admin portal** to access this feature. For information about how to get to and use the Admin portal, see [About the Admin portal](service-admin-portal.md).

As A Power BI administrator, you can govern the workspaces that exist in your organization on the **Workspaces** tab. On this tab, you see a list of all the workspaces in your tenant. Above the list, a ribbon provides options to help you govern the workspaces. These options also appear in the **More options (...)** menu of the selected workspace. The list of options varies depending on workspace type and status. All the options are described under [workspace options](#workspace-options).

:::image type="content" source="media/service-admin-portal-workspaces/power-bi-workspaces-admin-portal.png" alt-text="Screenshot that shows a Power B I workspaces list in the admin portal.":::

The columns of the list of workspaces are described below

| Column | Description |
| --------- | --------- |
| **Name** | The name given to the workspace. |
| **Description** | The information that is given in the description field of the workspace settings. |
| **Type** | The type of workspace. There are two types of workspaces:<br>![Screenshot of app workspace icon.](./media/service-admin-portal-workspaces/app-workspace-icon.png) **Workspace** (also known as "app workspace")<br>![Screenshot of personal workspace icon in the list of workspaces table explanation.](./media/service-admin-portal-workspaces/personal-workspace-icon.png) **Personal Group** ("My workspaces")|
| **State** | The state lets you know if the workspace is available for use. There are five states, **Active**, **Orphaned**, **Deleted**, **Removing**, and **Not found**. For more information, see [Workspace states](#workspace-states). |
| **Capacity name** | Name given to the workspace's capacity. |
| **Capacity SKU Tier** | The type of license used for the workspace's capacity. Capacity SKU Tiers include **Premium Gen2** and **Premium Per User (PPU)**. For more information about capacity tiers, see [Configure and manage capacities in Power BI Premium](../enterprise/service-admin-premium-manage.md). |
| **Upgrade status** | The upgrade status lets you know if the workspace is eligible for a Power BI upgrade. |

The table columns on the **Workspaces** tab correspond to the properties returned by the [Power BI admin Rest API](/rest/api/power-bi/admin) for workspaces. Personal workspaces are of type **PersonalGroup**, classic workspaces are of type **Group**, and the new workspace experience workspaces are of type **Workspace**. For more information, see [Workspaces in Power BI](../collaborate-share/service-new-workspaces.md).

## Workspace states

The possible workspace states are described below.

|State  |Description  |
|---------|---------|
| **Active** | A normal workspace. It doesn't indicate anything about usage or what's inside, only that the workspace itself is "normal". |
| **Orphaned** | A workspace with no admin user. You need to assign an admin. |
| **Deleted** | A deleted workspace. A Power BI administrator can restore the workspace up to 90 days after it was deleted. When the 90 days pass, the workspace enters the *Removing* state.<br>If you delete a *MyWorkspace* workspace, it moves to the *Removing* state immediately, without the 90 days grace period. |
| **Removing** | After you delete a workspace, and once the 90 day grace period passes, the workspace moves into the *Removing* state. During this state, the workspace is permanently removed. Permanently removing a workspace takes a short while, and depends on the service and folder content. |
| **Not found** | If the customer's API request includes a workspace ID for a workspace that doesn't belong to the customer's tenant, "Not found" is returned as the status for that ID. |

## Workspace options

The ribbon at the top of the list and the More options (...) menus of the individual workspaces provide options that to help you manage the workspaces. The Refresh and the Export options are always present, while the selection of other options that appear depends on the workspace type and status. All the options are described below.

|Option  |Description  |
|---------|---------|
| **Refresh** | Refreshes the workspace list.|
| **Export** |Exports the table as a *.csv* file.|
| **Details** |Lists the items that are contained in the workspace.|
| **Edit** |Enables you to edit the workspace name and description. |
| **Access** |Enables you to manage workspace access. You can use this feature to delete workspaces by first adding yourself to a workspace as an admin then opening the workspace to delete it.|
| **Get access** |Grants you temporary access to another user's MyWorkspace. See [Gain access to any user's My workspace](#gain-access-to-any-users-my-workspace) for detail.|
| **Capacity** |Enables you to assign the workspace to Premium capacity or to remove it from Premium capacity. |
| **Recover** |Enables you to restore an orphaned workspace. |
| **Restore** |Enables you to restore the MyWorkspace of a user that has left the organization. See [Restore a deleted My workspace as an app workspace](#restore-a-deleted-my-workspace-as-an-app-workspace) for detail. |

>[!NOTE]
> Admins can also manage and recover workspaces using PowerShell cmdlets.
>
> Admins can also control users' ability to create new workspace experience workspaces and classic workspaces. See [Workspace settings](./service-admin-portal-workspace.md) in this article for details.

## Govern My workspaces

Every Power BI user has a personal workspace called My workspace where they can work with their own content. While generally only My workspace owners have access to their My workspaces, Power BI admins can use a set of features to help them govern these workspaces. With these features, Power BI admins can 

* [Gain access to the contents of any user's My workspace](#gain-access-to-any-users-my-workspace)
* [Designate a default capacity for all existing and new My workspaces](#designate-a-default-capacity-for-my-workspaces)
* [Prevent users from moving My workspaces to a different capacity that may reside in non-compliant regions](#prevent-my-workspace-owners-from-reassigning-their-my-workspaces-to-a-different-capacity)
* [Restore deleted My workspaces as app workspaces](#restore-a-deleted-my-workspace-as-an-app-workspace)

These features are described in the following sections.

### Gain access to any user's My workspace

To gain access to a particular My workspace

1. In the Power BI Admin portal, open the Workspaces page and find the personal workspace you want to get access to.
1. Select the workspace and then choose **Get Access** from the ribbon, or select **More options (...)** and choose **Get Access**.

> [!NOTE]
> Once access is obtained, the ribbon and the More options (...) menu will show **Remove Access** for the same My workspace. If you do not remove access by selecting one of these options, access will automatically be revoked for the admin after 24-hours. The My workspace owner's access remains intact.

Once you have access, the My workspace will show up in the list of workspaces accessible from the navigation pane. The icon ![Screenshot of personal workspace icon in the list of workspaces table explanation.](./media/service-admin-portal-workspaces/personal-workspace-icon.png) indicates that it's a My workspace.

Once you go inside the My workspace, you’ll be able to perform any actions as if it's your own My workspace. You can view and make any changes to the contents, including sharing or unsharing. But you can't grant anyone else access to the My workspace.  

### Designate a default capacity for My workspaces

A Power BI admin or capacity admin can designate a capacity as the default capacity for My workspaces. For details, see [Designate a default capacity for My workspaces](../enterprise/service-admin-premium-manage.md#designate-a-default-capacity-for-my-workspaces)

### Prevent My workspace owners from reassigning their My workspaces to a different capacity

Power BI admins can designate a default capacity for My workspaces. However, even if a My workspace has been assigned to Premium capacity, the owner the workspace can still move it back to Pro, which is in Shared capacity. Moving a workspace from Premium capacity to Shared capacity might cause the content contained in the workspace to be become non-compliant with respect to data-residency requirements, since it might move to a different region. To prevent this situation, the Power BI admin can block My workspace owners from moving their My workspace to a different capacity by turning off the **Users can reassign personal workspaces** tenant admin setting. See [Workspace settings](./service-admin-portal-workspace.md) for detail.

### Restore a deleted My workspace as an app workspace

When users leave the company, their My workspaces show up as Deleted in the State column on the Workspaces page in the Admin portal. Power BI admins can restore deleted My workspaces as app workspaces that other users can collaborate in.

During this restoration process, the Power BI admin needs to assign at least one Workspace admin in the new app workspace, as well as give the new workspace a name. After the workspace has been restored, it will show up as *Workspace* in the Type column on the Workspaces page in the Admin portal.

To restore a deleted My workspace as an app workspace

1. In the Power BI Admin portal, open the Workspaces page and find the deleted personal workspace you want to restore.
1. Select the workspace and then choose **Restore** from the ribbon, or select **More options (...)** and choose **Restore**.
1. In the Restore workspaces panel that appears, give a new name to the workspace and assign at least one user the Admin role in the workspace.
1. When done, select **Restore**.

After the deleted workspace has been restored as an app workspace, it's just like any other app workspace. 

## Next steps

* [About the Admin portal](service-admin-portal.md)
