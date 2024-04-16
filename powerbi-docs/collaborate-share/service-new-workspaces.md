---
title: Workspaces in Power BI
description: Learn about workspaces, which are collections of dashboards and reports built to deliver key metrics for your organization.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: Workspaces in Power BI, Get started with workspaces
ms.topic: conceptual
ms.date: 04/16/2024
ms.custom: fabric
LocalizationGroup: Share your work
---

# Workspaces in Power BI

*Workspaces* are places to collaborate with colleagues to create collections of dashboards, reports, semantic models, and paginated reports. This article describes workspaces, how to manage access to them, and how to use them to create and distribute apps.

Ready to get started? Read [Create a workspace](service-create-the-new-workspaces.md).

:::image type="content" source="media/service-new-workspaces/power-bi-workspace-opportunity.png" alt-text="Screenshot showing a Power BI workspace.":::

## Working with workspaces

Here are some useful tips about working with workspaces.

- **Use granular workspace roles** for flexible permissions management in the workspaces: Admin, Member, Contributor, and Viewer.  Read more about [workspace roles](#roles-and-licenses) in this article.
- **Contact list**: Specify who receives notification about workspace activity. Read more about [workspace contact lists](#workspace-contact-list) in this article.
- **Create template apps**: You can create *template apps* in workspaces. Template apps are apps that you can distribute to customers outside of your organization. Those customers can then connect to their own data with your template app. Read the article about [template apps](../connect-data/service-template-apps-overview.md).
- **Share semantic models**: You can share semantic models between workspaces. Read more about [shared semantic models](../connect-data/service-datasets-across-workspaces.md).

This article explains these features in more detail.

## Workspace contact list

The **Contact list** feature allows you to specify which users receive notification about issues occurring in the workspace. By default, any user or group specified as a workspace admin in the workspace is notified. You can add to that list. Users or groups in the contact list are also listed in the user interface (UI) of the workspaces, so workspace end-users know whom to contact.

Read about [how to create the workspace contact list](service-create-the-new-workspaces.md#create-a-contact-list).

## Microsoft 365 and OneDrive

Power BI doesn't create a Microsoft 365 group behind the scenes when you create a workspace. All workspace administration is in Power BI. Still, you might find it useful to have a OneDrive associated with the workspace. 

- You can **manage user access** to content through Microsoft 365 groups, if you want. You add a Microsoft 365 group in the workspace access list.

    Power BI doesn't synchronize between Microsoft 365 group membership and permissions for users or groups with access to the workspace. You can synchronize them: Manage workspace access through the same Microsoft 365 group whose file storage you configure in this setting.

- You can also **store Power BI content in OneDrive for work or school**. With the Workspace OneDrive feature in workspaces, you can configure a Microsoft 365 group whose SharePoint Document Library file storage is available to workspace users. You create the group outside of Power BI.
 
    Read about [how to set the workspace OneDrive](service-create-the-new-workspaces.md#set-a-workspace-onedrive).  

> [!NOTE]
> Power BI lists all Microsoft 365 groups that you're a member of in the workspaces list.

## Roles and licenses

Roles let you manage who can do what in workspaces, so team members can collaborate. To grant access to a workspace, assign those user groups or individuals to one of the workspace roles: Admin, Member, Contributor, or Viewer.

- **Licensing enforcement**: Publishing reports to a workspace enforces existing licensing rules. Users collaborating in workspaces or sharing content to others in the Power BI service need a Power BI Pro or Premium Per User (PPU) license. Users without a Pro or PPU license see the error "Only users with Power BI Pro licenses can publish to this workspace."
- **Read-only workspaces**: The Viewer role in workspaces gives users read-only access to the content in a workspace.
- **Users without a Pro or Premium Per User (PPU) license** can access a workspace if the workspace is in a Power BI Premium capacity, but only if they have the Viewer role.
- **Allow users to export data**: Even users with the Viewer role in the workspace can export data if they have Build permission on the semantic models in that workspace. Read more about [Build permission for semantic models](../connect-data/service-datasets-build-permissions.md).
- **Assign user groups to workspace roles**: You can add Active Directory security groups, distribution lists, or Microsoft 365 groups to these roles, for easier user management.

See the article [Roles in workspaces](service-roles-new-workspaces.md) for more details about the different roles.

## Administering and auditing workspaces

Administration for workspaces is in the Power BI admin portal. Power BI admins decide who in an organization can create workspaces and distribute apps. Read about [managing users' ability to create workspaces](/fabric/admin/portal-workspace#create-workspaces) in the "Workspace settings" article.

Admins can also see the state of all the workspaces in their organization. They can manage, recover, and even delete workspaces. Read about [managing the workspaces themselves](../admin/service-admin-portal-workspaces.md) in the "Admin portal" article.

### Auditing

Power BI audits the following activities for workspaces.

| Friendly name | Operation name |
|---|---|
| Created Power BI folder | CreateFolder |
| Deleted Power BI folder | DeleteFolder |
| Updated Power BI folder | UpdateFolder |
| Updated Power BI folder access| UpdateFolderAccess |

Read more about [Power BI auditing](../admin/service-admin-auditing.md).

## Considerations and limitations

Limitations to be aware of:

- Workspaces can contain a maximum of either 1,000 semantic models, *or* one semantic model with 1,000 reports.
- Power BI publisher for Excel isn't supported.
- Certain special characters aren't supported in workspace names when using an XMLA endpoint. As a workaround, use URL encoding of special characters, for example, for a forward slash **/**, use **%2F**.
- A user or a [service principal](../enterprise/service-premium-service-principal.md) can be a member of up to 1,000 workspaces.

## Related content

* [Create workspaces in Power BI](service-create-the-new-workspaces.md)
* [Install and use apps in Power BI](service-create-distribute-apps.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)

