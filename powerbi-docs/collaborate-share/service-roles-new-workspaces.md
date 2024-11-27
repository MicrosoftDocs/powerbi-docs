---
title: Roles in workspaces in Power BI
description: Learn about the different roles you can assign to workspace users to grant access to read, write, edit, and more.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: mihirwagle
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: Roles in workspaces
ms.topic: conceptual
ms.date: 11/25/2024
ms.custom: fabric
LocalizationGroup: Share your work
---

# Roles in workspaces in Power BI

*Workspaces* are places to collaborate with colleagues and create collections of dashboards, reports, semantic models, and paginated reports. This article describes the different roles in workspaces, and what people in each role can do. For more information, see [workspaces in Power BI](service-new-workspaces.md).

To create a new workspace, see [Create a workspace](service-create-the-new-workspaces.md).

:::image type="content" source="media/service-roles-new-workspaces/power-bi-roles-access.png" alt-text="Screenshot of setting roles in the Access dialog of the workspace.":::

Roles let you manage who can do what in a workspace, so teams can collaborate. Workspaces allow you to assign roles to individuals, and also to user groups such as security groups, Microsoft 365 groups, and distribution lists.

To grant access to a workspace, assign one of the following workspace roles to a user group or individual: Admin, Member, Contributor, or Viewer. For more information, see [Give users access to workspaces](service-give-access-new-workspaces.md).

Everyone in a user group gets the role that you've assigned. If someone is in several user groups, they get the highest level of permission that's provided by the roles that they're assigned. If you nest user groups and assign a role to a group, all the contained users get that role's permissions. All these capabilities, except viewing and interacting, require a Power BI Pro or Premium Per User (PPU) license. For more information, see [licensing](#licenses).

## Workspace roles

|Capability   | Admin  | Member  | Contributor  | Viewer |
|---|---|---|---|---|
| Update and delete the workspace.  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |   |   | 
| Add or remove any user in a workspace role.  |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |   |   |
| Allow Contributors to update the app for the workspace.  |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |   |   |
| Add members or others with lower permissions.  |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   |
| Publish, unpublish, and change permissions for an app. |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   |
| Update an app. |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |  If allowed <sup>1</sup>  |   |
| Share items in apps, including semantic models.<sup>2</sup> |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   |
| Allow others to reshare items.<sup>2</sup> |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   |
| Feature apps on colleagues' home. <sup>7</sup> |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   |
| Manage semantic model permissions.<sup>3</sup> | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |  |
| Feature dashboards and reports on colleagues' home.<sup>6</sup> |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |
| Publish, Create, edit, and delete content, such as reports, in the workspace.  |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |
| Create a report in another workspace based on a semantic model in this workspace.<sup>3</sup> |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |
| Copy a report.<sup>3</sup> | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |
| Create goals that are based on a semantic model in the workspace.<sup>3</sup> | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |
| Schedule data refreshes via the on-premises gateway.<sup>4</sup> | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |
| Modify gateway connection settings.<sup>4</sup> | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |
| View and interact with an item.<sup>5</sup> |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |
| Read data that's stored in workspace dataflows. | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |
| Create subscriptions to reports <sup>6</sup>| :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |
| Subscribe others to reports <sup>6</sup>| :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |
| Analyze in Excel <sup>9</sup> | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |
| Manage subscriptions created by others. | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |   |  |
| Can receive subscriptions created by others <sup>6</sup>|  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::   | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |


<sup>1</sup> Contributors can [update the app that's associated with the workspace](../collaborate-share/service-create-the-new-workspaces.md#allow-contributors-to-update-the-app), if the workspace Admin delegates this permission to them. However, they can't publish a new app or change who has permission to edit it.

<sup>2</sup> Contributors and Viewers can also share items in a workspace or an app, including semantic models, if the app creator selected **Allow users to share the semantic models in this app**. See the [Create and manage multiple audiences](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences) section of "Publish an app in Power BI."

<sup>3</sup> To copy a report to another workspace, and to create a report in another workspace based on a semantic model in the current workspace, you need [Build permission for the semantic model](../connect-data/service-datasets-build-permissions.md). You also need at least the Contributor role on the source and destination workspaces. For semantic models in the original workspace, if you have at least the Contributor role, you automatically have Build permission through your workspace role. For details, see [Copy reports from other workspaces](../connect-data/service-datasets-copy-reports.md).

<sup>4</sup> Keep in mind that you also need permissions on the gateway. Those permissions are managed elsewhere, independent of workspace roles and permissions. For details, see [Manage an on-premises gateway](/data-integration/gateway/service-gateway-manage).

<sup>5</sup> If the items are in a workspace in a Premium capacity, you can view and interact with items in the Power BI service even if you don't have a Power BI Pro license.

<sup>6</sup> To subscribe yourself or others requires a paid (Power BI Pro or Premium Per User (PPU)() license. When you subscribe others, those recipients also need a paid subscription, unless the items are in a workspace in a Premium capacity. B2B guest users can't subscribe others, only themselves.

<sup>7</sup> If your admin has enabled this feature, see [Manage featured content](/fabric/admin/service-admin-portal-featured-content).

<sup>8</sup> If your admin has enabled this feature, see [Users can try Microsoft Fabric paid features](/fabric/admin/service-admin-portal-help-support#users-can-try-microsoft-fabric-paid-features).

<sup>9</sup> If you want your users with the Viewer role to Analyze in Excel or export underlying data from the datasets in the workspace, you need to also give them Build permission on the appropriate datasets.

> [!NOTE]
> - You can assign users to roles, either alone or in a group, even if they can't use the role. In other words, you can assign users who don't have Power BI Pro or PPU licenses to a role that requires a license. See [Licenses](#licenses) for details.
> - Use the Viewer role to enforce [row-level security (RLS)](/fabric/security/service-admin-row-level-security) for users who browse content in a workspace. You can also enforce RLS without giving access to the workspace, [publish an app](service-create-distribute-apps.md) and distribute it to those users, or use [sharing to distribute content](service-share-dashboards.md).
> - Members can add users to a workspace with lower permissions, but can't remove users from any workspace roles.
> - Deleting a user from Microsoft Entra ID doesn't automatically remove their access to Power BI workspaces. This fact is by design to prevent accidental data loss. Even after they're deleted from Microsoft Entra ID, the user's workspace access remains until explicitly removed.


## Licenses
If one of the workspaces is in a shared capacity, everyone you add to it needs a Power BI Pro or Premium Per User (PPU) license. These users can all collaborate on the dashboards and reports in the workspace. If you want to distribute content to others inside your organization, either assign Power BI Pro licenses to those users or place the workspace in a Power BI Premium capacity.

When the workspace is in a Power BI Premium capacity, users with the Viewer role can access the workspace even if they don't have a Power BI Pro or Premium Per User (PPU) license. However, if you assign these users a higher role like Admin, Member, or Contributor, they're prompted to start a Pro trial when they try to create an artifact in the workspace<sup>8</sup>. If you want users without Pro or Premium Per User (PPU) licenses to use the Viewer role, make sure they don't also have other workspace roles, either as individuals or as part of a user group.

Publishing reports to the workspace enforces existing licensing rules. If you try to publish from Power BI Desktop or other client tools without a Pro or Premium Per User (PPU) license, you see the error, "Only users with Power BI Pro licenses can publish to this workspace."

> [!NOTE]
> Power BI US Government isn't available as a Free license. For licensing details, see [Power BI for US government customers](../enterprise/service-govus-overview.md).

### Guest users

[Microsoft Entra B2B Guest users](../enterprise/service-admin-azure-ad-b2b.md) who have been assigned a workspace role or granted specific item permissions, will be able to perform the operations permitted by those roles or permissions.

> [!NOTE]
> Guest users who have been assigned workspace roles or specific item permissions will continue to have those roles and/or permissions, even if the **[Allow Microsoft Entra guest users to edit and manage content in the organization](/fabric/admin/service-admin-portal-export-sharing#allow-azure-active-directory-guest-users-to-edit-and-manage-content-in-the-organization)** tenant setting is disabled.

## Considerations and limitations

A limitation to be aware of:

- A person with a Power BI Pro license can be a member of a maximum of 1,000 workspaces.

## Related content

- [Create workspaces in Power BI](service-create-the-new-workspaces.md)
- [Give users access to workspaces](service-give-access-new-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
