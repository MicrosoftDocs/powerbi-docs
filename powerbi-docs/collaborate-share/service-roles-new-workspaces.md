---
title: Roles in the new workspaces in Power BI
description: Learn about the different roles in the new workspaces, and what people in each role can do.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 10/19/2021
ms.custom: contperf-fy20q4
LocalizationGroup: Share your work
---

# Roles in the new workspaces in Power BI

*Workspaces* are places to collaborate with colleagues and create collections of dashboards, reports, datasets, and paginated reports. This article describes the different roles in the new workspaces, and what people in each role can do. Read more about [the new workspace experience in Power BI](service-new-workspaces.md).

Creating a new workspace? See [Create a new workspace experience](service-create-the-new-workspaces.md).

:::image type="content" source="media/service-roles-new-workspaces/power-bi-roles-access.png" alt-text="Screenshot of setting roles in the Access dialog of the new workspaces.":::

Roles let you manage who can do what in the new workspaces, so teams can collaborate. New workspaces allow you to assign roles to individuals, and to user groups: security groups, Microsoft 365 groups, and distribution lists.

To grant access to a new workspace, assign those user groups or individuals to one of the workspace roles: Admin, Member, Contributor, or Viewer. Here's how to [Give users access to the new workspaces](service-give-access-new-workspaces.md).

Everyone in a user group gets the role you've assigned. If someone is in several user groups, they get the highest level of permission provided by the roles they're assigned. If you nest user groups, all the contained users have permission. All of these capabilities, except viewing and interacting, require a Power BI Pro or Premium Per User (PPU) license. Read more about [licensing](#licenses) in this article.

## Workspace roles

|Capability   | Admin  | Member  | Contributor  | Viewer |
|---|---|---|---|---|
| Update and delete the workspace.  | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |   |   |   | 
| Add/remove people, including other admins.  |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |   |   |   |
| Allow Contributors to update the app for the workspace  |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |   |   |   |
| Add members or others with lower permissions.  |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |   |   |
| Publish, unpublish, and change permissions for an app |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |   |   |
| Update an app. |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |  If allowed <sup>1</sup>  |   |
| Share an item or share an app.<sup>2</sup> |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |   |   |
| Allow others to reshare items.<sup>2</sup> |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |   |   |
| Feature apps on colleagues' Home |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |   |   |
| Manage dataset permissions.<sup>3</sup> | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |  |  |
| Feature dashboards and reports on colleagues' Home |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |   |
| Create, edit, and delete content in the workspace.  |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |   |
| Publish reports to the workspace, delete content.  |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |   |
| Create a report in another workspace based on a dataset in this workspace.<sup>3</sup> |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |   |
| Copy a report.<sup>3</sup> | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |  |
| Create goals based on a dataset in the workspace.<sup>3</sup> | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |  |
| Schedule data refreshes via the on-premises gateway.<sup>4</sup> | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |  |
| Modify gateway connection settings.<sup>4</sup> | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |  |
| View and interact with an item.<sup>5</sup> |  ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png)  |
| Read data stored in workspace dataflows | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) | ![Yes checkmark](media/service-roles-new-workspaces/green-checkmark.png) |

<sup>1</sup> Contributors can [update the app associated with the workspace](../collaborate-share/service-create-the-new-workspaces.md#allow-contributors-to-update-the-app), if the workspace Admin delegates this permission to them. However, they can't publish a new app or change who has permission to it.

<sup>2</sup> Contributors and Viewers can also share items in a workspace if they have Reshare permissions.

<sup>3</sup> To copy a report to another workspace, and to create a report in another workspace based on a dataset in this workspace, you need [Build permission for the dataset](../connect-data/service-datasets-build-permissions.md). For datasets in the original workspace, if you have at least the Contributor role you automatically have Build permission through your workspace role. See [Copy reports from other workspaces](../connect-data/service-datasets-copy-reports.md) for details.

<sup>4</sup> Keep in mind that you also need permissions on the gateway. Those permissions are managed elsewhere, independent of workspace roles and permissions. See [Manage an on-premises gateway](/data-integration/gateway/service-gateway-manage) for details.

<sup>5</sup> Even if you don't have a Power BI Pro license, you can view and interact with items in the Power BI service if the items are in a workspace in a Premium capacity.

> [!NOTE]
> - You can assign users to roles, either alone or in a group, even if they can't use the role. In other words, you can assign users who don't have Power BI Pro or PPU licenses to a role that requires a license. See [Licenses](#licenses) in this article for details.
> - To enforce [row-level security (RLS)](../admin/service-admin-rls.md) for users browsing content in a workspace, use the Viewer role. You can also enforce RLS without giving access to the new workspace. [Publish an app](service-create-distribute-apps.md) and distribute it to those users, or use [sharing to distribute content](service-share-dashboards.md) to them.

## Licenses
If one of the new workspaces is in a shared capacity, everyone you add to it needs a Power BI Pro or Premium Per User (PPU) license. These users can all collaborate on the dashboards and reports in the new workspace. If you want to distribute content to others inside your organization, either assign Power BI Pro licenses to those users or place the workspace in a Power BI Premium capacity.

When the new workspace is in a Power BI Premium capacity, users with the Viewer role can access the workspace even if they don't have a Power BI Pro or Premium Per User (PPU) license. However, if you assign these users a higher role like Admin, Member, or Contributor, they're prompted to start a Pro trial when they try to access the workspace. If you want users without Pro or Premium Per User (PPU) licenses to use the Viewer role, make sure they don't also have other workspace roles, either as individuals or as part of a user group, and ensure that they are not using a classic workspace.  Classic workspaces do not support roles.

Publishing reports to the new workspace experience has stricter enforcement of existing licensing rules. If you try to publish from Power BI Desktop or other client tools without a Pro or Premium Per User (PPU) license, you see the error, "Only users with Power BI Pro licenses can publish to this workspace."

> [!NOTE]
> Power BI US Government isn't available as a Free license. For licensing details, see [Power BI for US government customers](../admin/service-govus-overview.md).

### Guest users

By default, [Azure AD B2B Guest users](../admin/service-admin-azure-ad-b2b.md) can't access workspaces. Power BI admins can [allow external guest users to edit and manage content in the organization](../admin/service-admin-azure-ad-b2b.md#guest-users-who-can-edit-and-manage-content). Enabled Guest users can access workspaces to which they have permission.

## Considerations and limitations

A limitation to be aware of:

- A person with a Power BI Pro license can be a member of a maximum 1,000 workspaces.

## Next steps

- [Create the new workspaces in Power BI](service-create-the-new-workspaces.md)
- [Give users access to the new workspaces](service-give-access-new-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)

