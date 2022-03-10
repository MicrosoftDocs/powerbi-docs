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
ms.date: 03/10/2022
LocalizationGroup: Administration
---

# Workspace admin settings

These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

In **Tenant settings**, the admin portal has three sections for controlling workspaces:

- [Create the new workspace experiences](service-admin-portal.md#create-the-new-workspaces).
- [Use datasets across workspaces](service-admin-portal.md#use-datasets-across-workspaces).
- [Block classic workspace creation](service-admin-portal.md#block-classic-workspace-creation).

## Create the new workspaces

Workspaces are places where users collaborate on dashboards, reports, and other content. Admins use the **Create workspaces (new workspace experience** setting to indicate which users in the organization can create workspaces. Admins can let everybody or nobody in an organization create new workspace experience workspaces. Workspace creation can also be limited to members of specific security groups. Learn more about [workspaces](../collaborate-share/service-new-workspaces.md).

:::image type="content" source="media/service-admin-portal-workspace/power-bi-admin-workspace-settings.png" alt-text="Create the new workspace experiences":::

For classic workspaces based on Microsoft 365 Groups, administration continues to occur in admin portal and Azure Active Directory.

> [!NOTE]
> The **Create workspaces (new workspace experience)** setting defaults to allowing only users who can create Microsoft 365 Groups to create the new Power BI workspaces. Be sure to set a value in the Power BI admin portal to ensure appropriate users can create them.

**List of workspaces**

The admin portal has another section of settings about the workspaces in your tenant. In that section, you can sort and filter the list of workspaces and display the details for each workspace. See [Workspaces](service-admin-portal.md#workspaces) in this article for details.

**Publish content packs and apps**

In the admin portal, you also control which users have permissions to distribute apps to the organization. See [Publish content packs and apps to the entire organization](service-admin-portal.md#publish-content-packs-and-apps-to-the-entire-organization) in this article for details.

## Use datasets across workspaces

Admins can control which users in the organization can use datasets across workspaces. When this setting is enabled, users still need the required Build permission for a specific dataset.

:::image type="content" source="media/service-admin-portal-workspace/power-bi-admin-datasets-workspaces.png" alt-text="Use datasets across workspaces":::

For more information, see [Intro to datasets across workspaces](../connect-data/service-datasets-across-workspaces.md).

## Block classic workspace creation

Admins can control whether the organization can create classic workspaces. When this setting is enabled, users who create a workspace can only create new workspace experience workspaces. 

![Block classic workspace creation](media/service-admin-portal-workspace/power-bi-admin-block-classic-workspaces.png)

When enabled, newly created Office 365 Groups won't be shown in the Power BI workspaces list. Existing classic workspaces continue to be shown in the list. When the setting is disabled, all Office 365 Groups the user is a member of appear in the workspaces list. Read more about the [new workspace experience workspaces](../collaborate-share/service-new-workspaces.md).

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)