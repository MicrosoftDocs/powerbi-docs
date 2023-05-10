---
title: Roles in workspaces in Power BI
description: Learn about the different roles you can assign to workspace users to grant access to read, write, edit, and more.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: Roles in workspaces
ms.topic: conceptual
ms.date: 05/09/2023
ms.custom: contperf-fy20q4
LocalizationGroup: Share your work
---

# Roles in workspaces in Power BI

*Workspaces* are places to collaborate with colleagues and create collections of dashboards, reports, datasets, and paginated reports. This article describes the different roles in workspaces, and what people in each role can do. For more information, see [workspaces in Power BI](service-new-workspaces.md).

To create a new workspace, see [Create a workspace](service-create-the-new-workspaces.md).

:::image type="content" source="media/service-roles-new-workspaces/power-bi-roles-access.png" alt-text="Screenshot of setting roles in the Access dialog of the workspace.":::

Roles let you manage who can do what in a workspace, so teams can collaborate. Workspaces allow you to assign roles to individuals, and also to user groups such as security groups, Microsoft 365 groups, and distribution lists.

To grant access to a workspace, assign one of the following workspace roles to a user group or individuals: Admin, Member, Contributor, or Viewer. For more information, see [Give users access to workspaces](service-give-access-new-workspaces.md).

Everyone in a user group gets the role that you've assigned. If someone is in several user groups, they get the highest level of permission that's provided by the roles that they're assigned. If you nest user groups and assign a role to a group, all the contained users get that role's permissions. All these capabilities, except viewing and interacting, require a Power BI Pro or Premium Per User (PPU) license. For more information, see [licensing](#licenses).

## Workspace roles

|Capability   | Admin  | Member  | Contributor  | Viewer |
|---|---|---|---|---|
| Update and delete the workspace.  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |   |   |   | 
| Add or remove people, including other admins.  |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |   |   |   |
| Allow Contributors to update the app for the workspace.  |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |   |   |   |
| Add members or others with lower permissions.  |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |   |   |
| Publish, unpublish, and change permissions for an app. |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |   |   |
| Update an app. |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |  If allowed <sup>1</sup>  |   |
| Share an item or share an app.<sup>2</sup> |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |   |   |
| Allow others to reshare items.<sup>2</sup> |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |   |   |
| Feature apps on colleagues' home. |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |   |   |
| Manage dataset permissions.<sup>3</sup> | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |  |  |
| Feature dashboards and reports on colleagues' home. |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |   |
| Create, edit, and delete content, such as reports, in the workspace.  |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |   |
| Publish reports to the workspace, and delete content.  |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |   |
| Create a report in another workspace based on a dataset in this workspace.<sup>3</sup> |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |   |
| Copy a report.<sup>3</sup> | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |  |
| Create metrics that's based on a dataset in the workspace.<sup>3</sup> | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |  |
| Schedule data refreshes via the on-premises gateway.<sup>4</sup> | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |  |
| Modify gateway connection settings.<sup>4</sup> | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |  |
| View and interact with an item.<sup>5</sup> |  :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  | :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::  |
| Read data that's stored in workspace dataflows. | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |

<sup>1</sup> Contributors can [update the app that's associated with the workspace](../collaborate-share/service-create-the-new-workspaces.md#allow-contributors-to-update-the-app), if the workspace Admin delegates this permission to them. However, they can't publish a new app or change who has permission to edit it.

<sup>2</sup> Contributors and Viewers can also share items in a workspace, if they have Reshare permissions.

<sup>3</sup> To copy a report to another workspace, and to create a report in another workspace based on a dataset in the current workspace, you need [Build permission for the dataset](../connect-data/service-datasets-build-permissions.md). You also need at least the Contributor role on the source and destination workspaces. For datasets in the original workspace, if you have at least the Contributor role, you automatically have Build permission through your workspace role. For details, see [Copy reports from other workspaces](../connect-data/service-datasets-copy-reports.md).

<sup>4</sup> Keep in mind that you also need permissions on the gateway. Those permissions are managed elsewhere, independent of workspace roles and permissions. For details, see [Manage an on-premises gateway](/data-integration/gateway/service-gateway-manage).

<sup>5</sup> If the items are in a workspace in a Premium capacity, you can view and interact with items in the Power BI service even if you don't have a Power BI Pro license.

> [!NOTE]
> - You can assign users to roles, either alone or in a group, even if they can't use the role. In other words, you can assign users who don't have Power BI Pro or PPU licenses to a role that requires a license. See [Licenses](#licenses) for details.
> - Use the Viewer role to enforce [row-level security (RLS)](../enterprise/service-admin-rls.md) for users who browse content in a workspace. You can also enforce RLS without giving access to the workspace, [publish an app](service-create-distribute-apps.md) and distribute it to those users, or use [sharing to distribute content](service-share-dashboards.md).
> - Members can add users to a workspace with lower permissions, but can't remove users from any workspace roles.


## Licenses
If one of the workspaces is in a shared capacity, everyone you add to it needs a Power BI Pro or Premium Per User (PPU) license. These users can all collaborate on the dashboards and reports in the workspace. If you want to distribute content to others inside your organization, either assign Power BI Pro licenses to those users or place the workspace in a Power BI Premium capacity.

When the workspace is in a Power BI Premium capacity, users with the Viewer role can access the workspace even if they don't have a Power BI Pro or Premium Per User (PPU) license. However, if you assign these users a higher role like Admin, Member, or Contributor, they're prompted to start a Pro trial when they try to access the workspace. If you want users without Pro or Premium Per User (PPU) licenses to use the Viewer role, make sure they don't also have other workspace roles, either as individuals or as part of a user group.

Publishing reports to the workspace enforces existing licensing rules. If you try to publish from Power BI Desktop or other client tools without a Pro or Premium Per User (PPU) license, you see the error, "Only users with Power BI Pro licenses can publish to this workspace."

> [!NOTE]
> Power BI US Government isn't available as a Free license. For licensing details, see [Power BI for US government customers](../enterprise/service-govus-overview.md).

### Guest users

By default, [Azure AD B2B Guest users](../enterprise/service-admin-azure-ad-b2b.md) can't access workspaces. Power BI admins can [allow external guest users to edit and manage content in the organization](../enterprise/service-admin-azure-ad-b2b.md#guest-users-who-can-edit-and-manage-content). Enabled Guest users can access workspaces to which they have permission.

## Considerations and limitations

A limitation to be aware of:

- A person with a Power BI Pro license can be a member of a maximum of 1,000 workspaces.

## Next steps

- [Create workspaces in Power BI](service-create-the-new-workspaces.md)
- [Give users access to workspaces](service-give-access-new-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)

