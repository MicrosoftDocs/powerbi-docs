---
title: Workspace admin settings
description: Learn how to configure Power BI workspace admin settings.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: tenant-setting
ms.topic: how-to
ms.date: 05/13/2022
LocalizationGroup: Administration
---

# Workspace tenant settings

These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

In **Tenant settings**, the admin portal has three sections for controlling workspaces:

- [Create the new workspace experiences](service-admin-portal-workspace.md#create-the-new-workspaces).
- [Use datasets across workspaces](service-admin-portal-workspace.md#use-datasets-across-workspaces).
- [Block upgrading empty classic workspaces](service-admin-portal-workspace.md#empty-classic-workspaces).

## Create the new workspaces

Workspaces are places where users collaborate on dashboards, reports, and other content. Admins use the **Create workspaces (new workspace experience** setting to indicate which users in the organization can create workspaces. Admins can let everybody or nobody in an organization create new workspace experience workspaces. Workspace creation can also be limited to members of specific security groups. Learn more about [workspaces](../collaborate-share/service-new-workspaces.md).

:::image type="content" source="media/service-admin-portal-workspace/power-bi-admin-workspace-settings.png" alt-text="Create the new workspace experiences":::

For classic workspaces based on Microsoft 365 Groups, administration continues to occur in admin portal and Azure Active Directory.

> [!NOTE]
> The **Create workspaces (new workspace experience)** setting defaults to allowing only users who can create Microsoft 365 Groups to create the new Power BI workspaces. Be sure to set a value in the Power BI admin portal to ensure appropriate users can create them.

**List of workspaces**

The admin portal has another section of settings about the workspaces in your tenant. In that section, you can sort and filter the list of workspaces and display the details for each workspace. See [Workspaces](service-admin-portal-workspaces.md) in this article for details.

**Publish content packs and apps**

In the admin portal, you also control which users have permissions to distribute apps to the organization. See [Publish content packs and apps to the entire organization](service-admin-portal-content-pack-app.md#publish-content-packs-and-apps-to-the-entire-organization) in this article for details.

## Use datasets across workspaces

Admins can control which users in the organization can use datasets across workspaces. When this setting is enabled, users still need the required Build permission for a specific dataset.

:::image type="content" source="media/service-admin-portal-workspace/power-bi-admin-datasets-workspaces.png" alt-text="Use datasets across workspaces":::

For more information, see [Intro to datasets across workspaces](../connect-data/service-datasets-across-workspaces.md).

## Empty classic workspaces

To reduce the impact of maintaining empty classic workspaces that were automatically created, empty classic workspaces are deleted by default as part of the upgrade process. However, admins can prevent deleting empty workspaces by disabling the following setting in the Admin portal.

:::image type="content" source="../collaborate-share/media/service-upgrade-workspaces/block-upgrade-empty-workspaces.png" alt-text="Screenshot of using admin portal to allow or prevent upgrade of empty workspaces.":::

Additional notes on deletion of empty workspaces:

- Only empty v1 workspaces will be deleted during upgrade. Empty v2 workspaces will not be deleted. Deletion of empty workspaces can be prevented by using the tenant setting described previously in this article.
- Office 365 groups associated with empty v1 workspaces will not be deleted.Read more about the [new workspace experience workspaces](../collaborate-share/service-new-workspaces.md).

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)
