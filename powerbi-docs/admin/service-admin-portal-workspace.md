---
title: Workspace tenant settings
description: Learn how to configure Workspace tenant settings as the Power BI tenant admin.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: tenant-setting
ms.topic: how-to
ms.date: 04/04/2023
LocalizationGroup: Administration
---

# Workspace tenant settings

Workspaces are spaces you can create to collaborate with other users and can include collections of dashboards, reports, and paginated reports. Workspace tenant settings allow you to manage workspaces and determine who in an organization can create a workspace. These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

## Create workspaces (new workspace experience)

Power BI admins can use the **Create workspaces (new workspace experience)** setting to designate which users in the organization can create workspaces. Admins can let everybody or nobody in an organization create new workspace experience workspaces. Workspace creation can also be limited to members of specific security groups. Learn more about [workspaces](../collaborate-share/service-new-workspaces.md).

:::image type="content" source="media/service-admin-portal-workspace/power-bi-admin-workspace-settings.png" alt-text="Create the new workspace experiences":::

For classic workspaces based on Microsoft 365 Groups, administration continues to occur in admin portal and Azure Active Directory.

> [!NOTE]
> The **Create workspaces (new workspace experience)** setting defaults to allowing only users who can create Microsoft 365 Groups to create the new Power BI workspaces. Be sure to set a value in the Power BI admin portal to ensure appropriate users can create them.

**List of workspaces**

The admin portal has another section of settings about the workspaces in your tenant. In that section, you can sort and filter the list of workspaces and display the details for each workspace. See [Workspaces](service-admin-portal-workspaces.md) in this article for details.

**Publish content packs and apps**

In the admin portal, you also control which users have permissions to distribute apps to the organization. See [Publish content packs and apps to the entire organization](service-admin-portal-content-pack-app.md#publish-content-packs-and-apps-to-the-entire-organization) in this article for details.

## Use datasets across workspaces

Admins can control which users in the organization can use datasets across workspaces. When this setting is on, users still need the required Build permission for a specific dataset.

:::image type="content" source="media/service-admin-portal-workspace/power-bi-admin-datasets-workspaces.png" alt-text="Use datasets across workspaces":::

For more information, see [Intro to datasets across workspaces](../connect-data/service-datasets-across-workspaces.md).

## Block scheduled upgrade of empty workspaces

To reduce the impact of maintaining empty classic workspaces that were automatically created, empty classic workspaces are deleted by default as part of the upgrade process. However, admins can prevent deleting empty workspaces by disabling the following setting in the Admin portal.

:::image type="content" source="../collaborate-share/media/service-upgrade-workspaces/block-upgrade-empty-workspaces.png" alt-text="Screenshot of using admin portal to allow or prevent upgrade of empty workspaces.":::

Additional notes on deletion of empty workspaces:

- Only empty v1 workspaces will be deleted during upgrade. Empty v2 workspaces will not be deleted. Deletion of empty workspaces can be prevented by using the tenant setting described previously in this article.
- Office 365 groups associated with empty v1 workspaces will not be deleted.Read more about the [new workspace experience workspaces](../collaborate-share/service-new-workspaces.md).

## Block notifications for scheduled workspace upgrades

This setting stops email notifications from being sent to your organization when classic workspaces are upgraded.

To turn off the setting:

1. Go to the Power BI Admin portal and select **Tenant settings**.
1. In the tenant settings, scroll down to the **Workspace settings** section.
1. Find the setting called **Block notifications for scheduled workspace upgrades**. By default, this setting is off, which means that members of your organization will get notifications when classic workspaces are upgraded. To prevent users from receiving these notifications, turn the setting on.


## Users can reassign personal workspaces 

Personal workspaces are the My workspaces that every user has for their personal content. Power BI and capacity admins can [designate a preferred capacity for My workspaces](../enterprise/service-admin-premium-manage.md#designate-a-default-capacity-for-my-workspaces). By default, however, My workspace owners can still change the capacity assignment of their workspace. If a Power BI or capacity admin designates a Premium capacity as the default capacity for My workspaces, but a My workspace owner then changes that capacity assignment back to shared capacity, this could result in non-compliance with data residency requirements.

To prevent such a scenario, the Power BI admin can turn off the **Users can reassign personal workspaces** tenant setting. When this setting is off, My workspace owners can't change the capacity assignment of their My workspace.

To turn off the setting:

1. Go to the Power BI Admin portal and select **Tenant settings**.
1. In the tenant settings, scroll down to the **Workspace settings** section.
1. Find the setting called **Users can reassign personal workspaces**. By default, this setting is on, which means that any My workspace owner can reassign their My workspace capacity. To prevent users from being able to reassign the capacity of their My workspace, turn the setting off.

For more information, see [Prevent My workspace owners from reassigning their My workspaces to a different capacity](./service-admin-portal-workspaces.md#prevent-my-workspace-owners-from-reassigning-their-my-workspaces-to-a-different-capacity).

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)
