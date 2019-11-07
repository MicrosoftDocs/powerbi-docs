---
title: Configure and manage capacities in Power BI Premium
description: Learn how you can manage Power BI Premium and enable access to content for your entire organization.
author: mgblythe
ms.author: mblythe
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 09/17/2019
LocalizationGroup: Premium
---

# Configure and manage capacities in Power BI Premium

Managing Power BI Premium involves creating, managing, and monitoring Premium capacities. This article provides step-by-step instructions; for an overview of capacities; see [Managing Premium capacities](service-premium-capacity-manage.md).

Learn how to manage Power BI Premium and Power BI Embedded capacities, which provide dedicated resources for your content.

![Power BI capacity settings screen](media/service-admin-premium-manage/premium-capacity-management.png)

*Capacity* is at the heart of the Power BI Premium and Power BI Embedded offerings. It is a set of resources reserved for exclusive use by your organization. Having dedicated capacity enables you to publish dashboards, reports, and datasets to users throughout your organization without having to purchase per-user licenses for them. It also offers dependable, consistent performance for the content hosted in capacity. For more information, see [What is Power BI Premium?](service-premium.md).

## Manage capacity

After you have purchased capacity nodes in Office 365, you set up the capacity in the Power BI admin portal. You manage Power BI Premium capacities in the **Capacity settings** section of the portal.

![Capacity settings within the admin portal](media/service-admin-premium-manage/admin-portal-premium.png)

You manage a capacity by selecting the name of the capacity. This takes you to the capacity management screen.

![Select capacity name to get to capacity assignment screen](media/service-admin-premium-manage/capacity-assignment.png)

If no workspaces have been assigned to the capacity, you will see a message about [assigning a workspace to the capacity](#assign-a-workspace-to-a-capacity).

### Setting up a new capacity (Power BI Premium)

The admin portal shows the number of *virtual cores* (v-cores) that you have used and that you still have available. The total number of v-cores is based on the Premium SKUs that you have purchased. For example, purchasing a P3 and a P2 results in 48 available cores – 32 from the P3 and 16 from the P2.

![Used and available v-cores for Power BI Premium](media/service-admin-premium-manage/admin-portal-v-cores.png)

If you have available v-cores, set up your new capacity by following these steps.

1. Select **Set up new capacity**.

1. Give your capacity a name.

1. Define who the admin is for this capacity.

1. Select your capacity size. Available options are dependent on how many available v-cores you have. You can't select an option that is larger than what you have available.

    ![Available Premium capacity sizes](media/service-admin-premium-manage/premium-capacity-size.png)

1. Select **Set up**.

    ![Set up a new capacity](media/service-admin-premium-manage/set-up-capacity.png)

Capacity admins, as well as Power BI admins and Office 365 Global Administrators, then see the capacity listed in the admin portal.

### Capacity settings

1. In the Premium capacity management screen, under **Actions**, select the **gear icon** to review and update settings. 

    ![Capacity actions in the capacity management area](media/service-admin-premium-manage/capacity-actions.png)

1. You can see who the service admins are, the SKU/size of the capacity, and what region the capacity is in.

    ![Capacity settings](media/service-admin-premium-manage/capacity-settings.png)

1. You can also rename or delete a capacity.

    ![Delete and apply buttons for capacity settings in Power BI Premium](media/service-admin-premium-manage/capacity-settings-delete.png)

> [!NOTE]
> Power BI Embedded capacity settings are managed in the Microsoft Azure portal.

### Change capacity size

Power BI admins and Office 365 Global Administrators can change Power BI Premium capacity. Capacity admins who are not a Power BI admin or Office 365 Global Administrator don't have this option.

1. Select **Change capacity size**.

    ![Change Power BI Premium capacity size](media/service-admin-premium-manage/change-capacity-size.png)

1. On the **Change capacity size** screen upgrade or downgrade your capacity as appropriate.

    ![Change Power BI Premium capacity size drop down](media/service-admin-premium-manage/change-capacity-size2.png)

    Administrators are free to create, resize and delete nodes, so long as they have the requisite number of v-cores.

    P SKUs cannot be downgraded to EM SKUs. You can hover over any disabled options to see an explanation.

### Manage user permissions

You can assign additional capacity admins, and assign users that have *capacity assignment* permissions. Users that have assignment permissions can assign a workspace to a capacity if they are an admin of that workspace. They can also assign their personal *My Workspace* to the capacity. Users with assignment permissions do not have access to the admin portal.

> [!NOTE]
> For Power BI Embedded, capacity admins are defined in the Microsoft Azure portal.

Under **User permissions**, expand **Users with assignment permissions**, then add users or groups as appropriate.

![Capacity user permissions](media/service-admin-premium-manage/capacity-user-permissions2.png)

## Assign a workspace to a capacity

There are two ways to assign a workspace to a capacity: in the admin portal; and from a workspace.

### Assign from the admin portal

Capacity admins, along with Power BI admins and Office 365 Global Administrators, can bulk assign workspaces in the premium capacity management section of the admin portal. When you manage a capacity, you see a **Workspaces** section that allows you to assign workspaces.

![Workspace assignment area of capacity management](media/service-admin-premium-manage/capacity-manage-workspaces.png)

1. Select **Assign workspaces**. This option is available in multiple places.

1. Select an option for **Apply to**.

    ![Assign workspaces](media/service-admin-premium-manage/assign-workspaces.png)

   | Selection | Description |
   | --- | --- |
   | **Workspaces by users** | When you assign workspaces by user, or group, all the workspaces owned by those users are assigned to Premium capacity, including the user's personal workspace. Said users automatically get workspace assignment permissions.<br>This includes workspaces already assigned to a different capacity. |
   | **Specific workspaces** | Enter the name of a specific workspace to assign to the selected capacity. |
   | **The entire organization's workspaces** | Assigning the entire organization's workspaces to Premium capacity assigns all workspaces and My Workspaces, in your organization, to this Premium capacity. In addition, all current and future users will have the permission to reassign individual workspaces to this capacity. |
   | | |

1. Select **Apply**.

### Assign from workspace settings

You can also assign a workspace to a Premium capacity from the settings of that workspace. To move a workspace into a capacity, you must have admin permissions to that workspace, and also capacity assignment permissions to that capacity. Note that workspace admins can always remove a workspace from Premium capacity.

1. Edit a workspace by selecting the ellipsis **(. . .)** then selecting **Edit workspace**.

    ![Edit workspace from ellipsis context menu](media/service-admin-premium-manage/edit-app-workspace.png)

1. Under **Edit workspace**, expand **Advanced**.

1. Select the capacity that you want to assign this workspace to.

    ![Capacity selection drop down](media/service-admin-premium-manage/app-workspace-advanced.png)

1. Select **Save**.

Once saved, the workspace and all its contents are moved into Premium capacity without any experience interruption for end users.

## Power BI Report Server product key

On the **Capacity settings** tab of the Power BI admin portal, you will have access to your Power BI Report Server product key. This will only be available for Global Admins or users assigned the Power BI service administrator role and if you have purchase a Power BI Premium SKU.

![Power BI Report Server key within Capacity settings](media/service-admin-premium-manage/pbirs-product-key.png)

Selecting **Power BI Report Server key** will display a dialog contain your product key. You can copy it and use it with the installation.

![Power BI Report Server product key](media/service-admin-premium-manage/pbirs-product-key-dialog.png)

For more information, see [Install Power BI Report Server](report-server/install-report-server.md).

## Next steps

[Managing Premium capacities](service-premium-capacity-manage.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
