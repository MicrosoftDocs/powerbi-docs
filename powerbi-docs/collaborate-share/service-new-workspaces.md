---
title: Workspaces in Power BI
description: Learn about workspaces, which are collections of dashboards and reports built to deliver key metrics for your organization.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: Workspaces in Power BI, Get started with workspaces
ms.topic: conceptual
ms.date: 09/30/2025
ai-usage: ai-assisted
ms.custom: fabric
LocalizationGroup: Share your work
---

# Workspaces in Power BI

*Workspaces* let you collaborate with colleagues to build collections of dashboards, reports, semantic models, and paginated reports. This article explains workspaces, access management, and how to create and distribute apps.

To create one, see [Create a workspace](service-create-the-new-workspaces.md).

:::image type="content" source="media/service-new-workspaces/power-bi-workspace-opportunity.png" alt-text="Screenshot of a Power BI workspace listing sample content.":::

## Working with workspaces

Use these tips to work with workspaces:

- **Granular workspace roles**: Use for flexible permissions management in the workspaces: Admin, Member, Contributor, and Viewer. Read more about [workspace roles](#roles-and-licenses) in this article.
- **Contact list**: Specify who receives notifications about workspace activity. Read more about [workspace contact lists](#workspace-contact-list) in this article.
- **Create template apps**: You can create *template apps* in workspaces. Template apps are apps that you can distribute to customers outside of your organization. Those customers can then connect to their own data with your template app. Learn more about [template apps](../connect-data/service-template-apps-overview.md).
- **Share semantic models**: You can share semantic models between workspaces. Read more about [shared semantic models](../connect-data/service-datasets-across-workspaces.md).

The following sections explain each feature.

## Workspace contact list

The **Contact list** feature allows you to specify which users receive notifications about issues occurring in the workspace. By default, any user or group specified as a workspace admin in the workspace is notified. You can add to that list. Users or groups in the contact list are also listed in the user interface (UI) of the workspaces, so workspace end-users know whom to contact.

Learn how to [create the workspace contact list](service-create-the-new-workspaces.md#create-a-contact-list).

## Microsoft 365 and OneDrive

Power BI doesn't create a Microsoft 365 group behind the scenes when you create a workspace. All workspace administration is in Power BI. Still, you might find it useful to have a OneDrive associated with the workspace.

- **Manage user access** to content through a Microsoft 365 group. Add the group to the workspace access list.

    Power BI doesn't sync Microsoft 365 group membership with workspace permissions. To align them, manage workspace access by using the same Microsoft 365 group whose file storage you set in this setting.

- **Store Power BI content in OneDrive for work or school**. With the Workspace OneDrive feature, set a Microsoft 365 group whose SharePoint Document Library storage is available to workspace users. Create the group outside Power BI.

    Learn how to [set the workspace OneDrive](service-create-the-new-workspaces.md#set-a-workspace-onedrive).  

> [!NOTE]
> Power BI lists all Microsoft 365 groups you're a member of in the workspaces list.

## Roles and licenses

Roles help you manage access in workspaces so teams can collaborate. Grant access by assigning groups or individuals to a role: Admin, Member, Contributor, or Viewer.

- **Licensing enforcement**: Publishing reports to a workspace enforces existing licensing rules. Users collaborating in workspaces or sharing content to others in the Power BI service need a Power BI Pro or Premium Per User (PPU) license. Users without a Pro or PPU license see the error "Only users with Power BI Pro licenses can publish to this workspace."
- **Read-only workspaces**: The Viewer role in workspaces gives users read-only access to the content in a workspace.
- **Users without a Pro or Premium Per User (PPU) license**: They can access a workspace if the workspace is in a Power BI Premium capacity, but only if they have the Viewer role.
- **Allow users to export data**: Even users with the Viewer role in the workspace can export data if they have Build permission on the semantic models in that workspace. Learn more about [Build permission for semantic models](../connect-data/service-datasets-build-permissions.md).
- **Assign user groups to workspace roles**: You can add Active Directory security groups, distribution lists, or Microsoft 365 groups to these roles, for easier user management.

Learn more in [Roles in workspaces](service-roles-new-workspaces.md).

## Administer and audit workspaces

Manage workspaces in the Power BI admin portal. Power BI admins decide who can create workspaces and distribute apps. Learn how to control who can create workspaces in [Workspace settings](/fabric/admin/portal-workspace#create-workspaces).

Admins can view the state of all workspaces in their organization. They can manage, recover, and delete workspaces. Learn how to manage workspaces in the [Admin portal](../admin/service-admin-portal-workspaces.md).

### Auditing

Power BI audits these workspace activities.

| Friendly name | Operation name |
|---|---|
| Created Power BI folder | CreateFolder |
| Deleted Power BI folder | DeleteFolder |
| Updated Power BI folder | UpdateFolder |
| Updated Power BI folder access | UpdateFolderAccess |

Learn more in [Power BI auditing](../admin/service-admin-auditing.md).

## Considerations and limitations

Limitations:

- A workspace can have up to 1,000 semantic models and reports.
- Power BI Publisher for Excel isn't supported.
- Some special characters in workspace names aren't supported over an XMLA endpoint. Encode them in the URL (for example, encode **/** as **%2F**).
- A user or a [service principal](../enterprise/service-premium-service-principal.md) can be a member of up to 1,000 workspaces.
- The semantic model can show minor differences in the owner's display name because it assumes a single owner for operations like setting credentials.

## Related content

- [Create workspaces in Power BI](service-create-the-new-workspaces.md)
- [Install and use apps in Power BI](service-create-distribute-apps.md)
- Have questions? [Ask the Power BI Community](https://community.powerbi.com/).

