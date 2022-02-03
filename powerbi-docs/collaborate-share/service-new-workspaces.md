---
title: The new workspace experience in Power BI
description: Learn about the new workspaces, which are collections of dashboards and reports built to deliver key metrics for your organization.
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

# The new workspace experience in Power BI

*Workspaces* are places to collaborate with colleagues to create collections of dashboards, reports, datasets, and paginated reports. The new workspace experience helps you better manage access to content. This article describes the new workspaces, and how they differ from the classic workspaces.  As with classic workspaces, you still use them to create and distribute apps. 

Ready to create a new workspace? Read [Create a new workspace experience](service-create-the-new-workspaces.md).

:::image type="content" source="media/service-new-workspaces/power-bi-workspace-opportunity.png" alt-text="Power BI new workspace experience":::

New, upgraded workspaces can coexist side by side with existing classic workspaces. The new workspace experience is the default workspace type. You can still create and use [classic workspaces](service-create-workspaces.md) based on Microsoft 365 groups, if you need to. Ready to migrate your classic workspace? See [Upgrade classic workspaces to the new workspaces in Power BI](service-upgrade-workspaces.md) for details.

## New and classic workspace differences

With the new workspaces, we've redesigned some features. Here are the main differences.

- **Creating the new workspaces doesn't create Microsoft 365 groups** like classic workspaces do. All the new workspace administration is in Power BI, not in Office 365. You can still manage user access to content through Microsoft 365 groups, if you want. You just add a Microsoft 365 group in the workspace access list.
- **Use more granular workspace roles** for more flexible permissions management in the new workspaces.  In classic workspaces, you can add only individuals to the members and admin lists. 
- **Assign user groups to workspace roles**: In the new workspaces, you can add multiple Active Directory security groups, distribution lists, or Microsoft 365 groups to these roles, for easier user management. 
- **Contact list**: In the new workspaces, you can specify who receives notification about workspace activity.
- **Create template apps**: You can create *template apps* only in the new workspaces. Template apps are apps that you can distribute to customers outside of your organization. Those customers can then connect to their own data with your template app. Read more about [template apps](../connect-data/service-template-apps-overview.md).
- **Share datasets**: To share a dataset outside a specific workspace, you need to save the report that contains the dataset to one of the new workspaces. You can't share datasets from classic workspaces. Read more about [shared datasets](../connect-data/service-datasets-across-workspaces.md).
- **Organizational content packs**: Apps and template apps replace organizational content packs in the new workspaces. Organizational content packs are being deprecated. Now is a good time to upgrade your content packs to apps. See [Upgrade classic workspaces to the new workspaces in Power BI](service-upgrade-workspaces.md) for details.

This article explains these features in more detail.

> [!NOTE]
> Power BI continues to list all Microsoft 365 groups that you're a member of. This avoids changing existing workflows.

## Features that work differently

In the new workspaces, some features work differently. These differences are intentional, based on feedback we've received from customers. They enable a more flexible approach to collaboration in workspaces.

- **Licensing enforcement**: Publishing reports to a new workspace experience enforces existing licensing rules. Users collaborating in new workspaces or sharing content to others in the Power BI service need a Power BI Pro or Premium Per User (PPU) license. Users without a Pro or PPU license see the error "Only users with Power BI Pro licenses can publish to this workspace."
- **'Members can reshare' setting**: The Contributor role in the new workspaces replaces the 'Members can reshare' setting in the classic workspaces.
- **Read-only workspaces**: The Viewer role in the new workspaces replaces granting users read-only access to a classic workspace. The Viewer role allows similar read-only access to the content in the new workspaces.
- **Users without a Pro or Premium Per User (PPU) license** can access a new workspace if the workspace is in a Power BI Premium capacity, but only if they have the Viewer role.
- **Allow users to export data**: Even users with the Viewer role in the new workspace can export data if they have Build permission on the datasets in that workspace. Read more about [Build permission for datasets](../connect-data/service-datasets-build-permissions.md).
- No **Leave workspace** button in the new workspaces.

## Workspace contact list

The new **Contact list** feature allows you to specify which users receive notification about issues occurring in the new workspaces. By default, any user or group specified as a workspace admin in the new workspace is notified. You can add to that list. Users or groups in the contact list are also listed in the user interface (UI) of the new workspaces, so workspace end-users know whom to contact. 

Read about [how to create the workspace contact list](service-create-the-new-workspaces.md#create-a-contact-list).

## Workspace OneDrive

As we've stated, Power BI doesn't create a Microsoft 365 group behind the scenes when you create one of the new workspaces. Still, you might find it useful to have a OneDrive associated with the new workspace. With the Workspace OneDrive feature in the new workspaces, you can configure a Microsoft 365 group whose SharePoint Document Library file storage is available to workspace users. You create the group outside of Power BI.
 
Power BI doesn't synchronize between Microsoft 365 group membership and permissions for users or groups with access to the new workspace. You can synchronize them: Manage workspace access through the same Microsoft 365 group whose file storage you configure in this setting.

Read about [how to set the workspace OneDrive](service-create-the-new-workspaces.md#set-a-workspace-onedrive).  

## Roles in the new workspaces

Roles let you manage who can do what in the new workspaces, so teams can collaborate. To grant access to a new workspace, assign those user groups or individuals to one of the workspace roles: Admin, Member, Contributor, or Viewer. See [Roles in the new workspaces](service-roles-new-workspaces.md) for details about the different roles.

## Administering and auditing new workspaces

Administration for new workspace experience workspaces is in the Power BI admin portal. Power BI admins decide who in an organization can create workspaces and distribute apps. Read about [managing users' ability to create workspaces](../admin/service-admin-portal.md#create-the-new-workspaces) in the "Admin portal" article. 

Admins can also see the state of all the workspaces in their organization. They can manage, recover, and even delete workspaces. Read about [managing the workspaces themselves](../admin/service-admin-portal.md#workspaces) in the "Admin portal" article.

### Auditing

Power BI audits the following activities for new workspace experience workspaces.

| Friendly name | Operation name |
|---|---|
| Created Power BI folder | CreateFolder |
| Deleted Power BI folder | DeleteFolder |
| Updated Power BI folder | UpdateFolder |
| Updated Power BI folder access| UpdateFolderAccess |

Read more about [Power BI auditing](../admin/service-admin-auditing.md).

## Considerations and limitations

Limitations to be aware of:

- Workspaces can contain a maximum of 1,000 datasets, or 1,000 reports per dataset. 
- Power BI publisher for Excel isn't supported.
- Certain special characters aren't supported in workspace names when using an XMLA endpoint. As a workaround, use URL encoding of special characters, for example, for a forward slash **/**, use **%2F**.

## Frequently asked questions

**Are links to existing content affected by the new workspace experience?**

No. Links to existing items in classic workspaces aren't affected by the new workspace experience. The general availability (GA) of the new workspace experience changes the default workspace you create, but doesn't change existing workspaces. 

**Are existing workspaces upgraded to the new workspace experience with GA?**

No. The new workspace experience GA only changes the default workspace type to the new workspace experience. Existing classic workspaces that are based on Microsoft 365 groups remain unchanged.

**Are workspaces still automatically created for Microsoft 365 groups?**

Yes. Since we support both types of workspaces side by side, we continue to list all Microsoft 365 groups you have access to in the workspaces list.

## Next steps

* [Create the new workspaces in Power BI](service-create-the-new-workspaces.md)
* [Create the classic workspaces](service-create-workspaces.md)
* [Install and use apps in Power BI](service-create-distribute-apps.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)

