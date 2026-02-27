---
title: Roles in workspaces in Power BI
description: Learn about the different roles you can assign to workspace users to grant access to read, write, edit, and more.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: mihirwagle
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: Roles in workspaces
ms.topic: concept-article
ms.date: 12/01/2025
ai-usage: ai-assisted
LocalizationGroup: Share your work
ms.custom:
  - fabric
  - sfi-image-nochange
---

# Roles in workspaces in Power BI

*Workspaces* are places to collaborate with colleagues and create collections of dashboards, reports, semantic models, and paginated reports. This article describes the different roles in workspaces, and what people in each role can do. For more information, see [workspaces in Power BI](service-new-workspaces.md).

To create a new workspace, see [Create a workspace](service-create-the-new-workspaces.md).

:::image type="content" source="media/service-roles-new-workspaces/power-bi-roles-access.png" alt-text="Screenshot of setting roles in the Access dialog of the workspace.":::

Roles let you manage who can do what in a workspace, so teams can collaborate. Workspaces allow you to assign roles to individuals, and also to user groups such as security groups, Microsoft 365 groups, and distribution lists.

To grant access to a workspace, assign one of the following workspace roles to a user group or individual: Admin, Member, Contributor, or Viewer. For more information, see [Give users access to workspaces](service-give-access-new-workspaces.md).

Everyone in a user group gets the role that you assign. If someone is in several user groups, they get the highest level of permission that's provided by the roles that they're assigned. If you nest user groups and assign a role to a group, all the contained users get that role's permissions. All these capabilities, except viewing and interacting, require a Power BI Pro or Premium Per User (PPU) license. For more information, see [licensing](#licenses).

## Workspace roles

|Capability   | Admin  | Member  | Contributor  | Viewer | Notes |
|---|---|---|---|---|---|
| Update and delete the workspace | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |   |   |  |
| Add or remove any user in a workspace role |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |   |   |  |
| Allow Contributors to update the app for the workspace |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |   |   |  |
| Add members or others with lower permissions |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   |  |
| Publish, unpublish, and change permissions for an app |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   |  |
| Update an app |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |  If allowed  |   | Contributors can [update the app associated with the workspace](../collaborate-share/service-create-the-new-workspaces.md#allow-contributors-to-update-the-app) if the workspace Admin delegates this permission to them. However, they can't publish a new app or change who has permission to edit it. |
| Share items in apps, including semantic models |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   | Contributors and Viewers can also share items in a workspace or an app, including semantic models, if the app creator selected **Allow users to share the semantic models in this app**. See [Create and manage multiple audiences](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences). |
| Allow others to reshare items |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   | See previous row. |
| Feature apps on colleagues' home |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |   | If your admin enabled this feature, see [Manage featured content](/fabric/admin/service-admin-portal-featured-content). |
| Manage semantic model permissions | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |  | Requires [Build permission for the semantic model](../connect-data/service-datasets-build-permissions.md) and at least the Contributor role on source and destination workspaces. See [Copy reports from other workspaces](../connect-data/service-datasets-copy-reports.md). |
| Feature dashboards and reports on colleagues' home |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   | Requires a paid license (Power BI Pro or PPU). Recipients also need a paid license unless the items are in a Premium capacity. B2B guest users can't subscribe others, only themselves. |
| Create, edit, and delete content in the workspace |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   |  |
| Create a report in another workspace based on a semantic model in this workspace |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  |   | Requires [Build permission for the semantic model](../connect-data/service-datasets-build-permissions.md) and at least the Contributor role on source and destination workspaces. If you have at least the Contributor role, you automatically have Build permission through your workspace role. See [Copy reports from other workspaces](../connect-data/service-datasets-copy-reports.md). |
| Copy a report | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  | See previous row. |
| Create goals based on a semantic model in the workspace | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  | See previous row. |
| Schedule data refreshes via the on-premises gateway | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  | You also need permissions on the gateway. Those permissions are managed elsewhere, independent of workspace roles and permissions. See [Manage an on-premises gateway](/data-integration/gateway/service-gateway-manage). |
| Modify gateway connection settings | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  | See previous row. |
| View and interact with an item |  :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | If the items are in a workspace in a Premium capacity, you can view and interact with items in the Power BI service even without a Power BI Pro license. |
| Read data stored in workspace dataflows | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | Consuming data from a dataflow gen2 with the dataflow connector requires Admin, Member, or Contributor permissions. Viewer permissions isn't sufficient and isn't supported for consuming data from the dataflow gen2. |
| Create subscriptions to reports | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | Requires a paid license (Power BI Pro or PPU). Recipients also need a paid license unless the items are in a Premium capacity. B2B guest users can't subscribe others, only themselves. |
| Subscribe others to reports | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  | See previous row. |
| Analyze in Excel | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  | To allow users with the Viewer role to Analyze in Excel or export underlying data from the semantic models in the workspace, give them Build permission on the appropriate semantic models. |
| Download a PBIX file | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |  |  |
| Manage subscriptions created by others | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false"::: |   |   |  |  |
| Receive subscriptions created by others |  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::   | :::image type="content" source="../includes/media/yes-icon.png" alt-text="Supported." border="false":::  | Requires a paid license (Power BI Pro or PPU) for the recipient unless the items are in a Premium capacity. |

> [!NOTE]
>
> - You can assign users to roles, either alone or in a group, even if they can't use the role. In other words, you can assign users who don't have Power BI Pro or PPU licenses to a role that requires a license. See [Licenses](#licenses) for details.
> - Use the Viewer role to enforce [row-level security (RLS)](/fabric/security/service-admin-row-level-security) for users who browse content in a workspace. You can also enforce RLS without giving access to the workspace, [publish an app](service-create-distribute-apps.md) and distribute it to those users, or use [sharing to distribute content](service-share-dashboards.md).
> - **Members can't change existing users' roles.** Members can add users to a workspace with lower permissions, but can't remove users from any workspace roles. To change an existing user's role (for example, upgrading a Viewer to Contributor), an admin must first remove the user, then the member can add them back with the new role.
> - Disabling a user in Microsoft Entra ID doesn't remove the access records for Power BI workspaces or other items the user was granted access to. This behavior is by design to prevent accidental data loss and to allow access to be restored if the user account is reenabled in Microsoft Entra ID. These access records remain until the user is permanently (hard) deleted from Microsoft Entra ID. While the user is disabled, they can't access or interact with any items associated with those access records.

## Licenses

If one of the workspaces is in a shared capacity, everyone you add to it needs a Power BI Pro or Premium Per User (PPU) license. These users can all collaborate on the dashboards and reports in the workspace. To distribute content to others inside your organization, either assign Power BI Pro licenses to those users or place the workspace in a Power BI Premium capacity.

When the workspace is in a Power BI Premium capacity, users with the Viewer role can access the workspace even if they don't have a Power BI Pro or Premium Per User (PPU) license. However, if you assign these users a higher role like Admin, Member, or Contributor, they're prompted to start a Pro trial when they try to create an artifact in the workspace. If your admin enabled this feature, see [Users can try Microsoft Fabric paid features](/fabric/admin/service-admin-portal-help-support#users-can-try-microsoft-fabric-paid-features). If you want users without Pro or Premium Per User (PPU) licenses to use the Viewer role, make sure they don't also have other workspace roles, either as individuals or as part of a user group.

Publishing reports to the workspace enforces existing licensing rules. If you try to publish from Power BI Desktop or other client tools without a Pro or Premium Per User (PPU) license, you see the error, "Only users with Power BI Pro licenses can publish to this workspace."

> [!NOTE]
> Power BI US Government isn't available as a Free license. For licensing details, see [Power BI for US government customers](../enterprise/service-govus-overview.md).

### Guest users

[Microsoft Entra B2B Guest users](/fabric/enterprise/powerbi/service-admin-entra-b2b) who are assigned a workspace role or granted specific item permissions can perform the operations permitted by those roles or permissions.

> [!NOTE]
> Guest users who are assigned workspace roles or specific item permissions keep those roles and permissions, even if the **[Allow Microsoft Entra guest users to edit and manage content in the organization](/fabric/admin/service-admin-portal-export-sharing#allow-azure-active-directory-guest-users-to-edit-and-manage-content-in-the-organization)** tenant setting is disabled.

## Considerations and limitations

Be aware of this limitation:

- A person with a Power BI Pro license can be a member of a maximum of 1,000 workspaces.

## Related content

- [Create workspaces in Power BI](service-create-the-new-workspaces.md)
- [Give users access to workspaces](service-give-access-new-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
