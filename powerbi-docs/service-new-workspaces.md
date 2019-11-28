---
title: Organize work in the new workspaces in Power BI
description: Learn about the new workspaces, which are collections of dashboards and reports built to deliver key metrics for your organization.
author: maggiesMSFT
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 11/27/2019
ms.author: maggies

LocalizationGroup: Share your work
---

# Organize work in the new workspaces in Power BI

 *Workspaces* are places to collaborate with colleagues to create collections of dashboards, reports, and paginated reports. The new workspace experience helps you better manage access to content. This article describes the new workspaces, and how they differ from the classic workspaces.  As with classic workspaces, you still use them to create and distribute apps. Read about how to [create a new workspace experience](service-create-the-new-workspaces.md).

The new workspace experience has reached general availability (GA), and is now the default workspace. You can still continue to create and use [classic workspaces](service-create-workspaces.md) based on Office 365 Groups. 

> [!NOTE]
> To enforce row-level security (RLS) for users browsing content in a workspace, use the Viewer role. To enforce RLS without giving access to the workspace, publish a Power BI app to those users, or use sharing to distribute content.

With the new workspaces, you can:

- Assign workspace roles to user groups: security groups, distribution lists, Office 365 groups, and individuals.
- Create a workspace in Power BI without creating an Office 365 group.
- Use more granular workspace roles for more flexible permissions management in a workspace.
- The Power BI admin can control who can create workspaces in Power BI.

When you create one of the new workspaces, you're not creating an underlying, associated Office 365 group. All the workspace administration is in Power BI, not in Office 365. In the new workspace experience, you can now add an Office 365 group in the workspace access list to continue managing user access to content through Office 365 groups.

## Administering new workspace experience workspaces
Administration for new workspace experience workspaces is now in Power BI, Power BI admins decide who in an organization can create workspaces. They can also manage and recover workspaces, using either the Power BI admin portal or PowerShell CmdLets. For classic workspaces based on Office 365 Groups, administration continues to occur in Office 365 admin portal and Azure Active Directory.

In **Workspace settings** in the admin portal, admins can use the Create workspaces (new workspace experience) setting to allow everybody or nobody in an organization to create new workspace experience workspaces. They can also limit creation to members of specific security groups.

> [!NOTE]
> The Create workspaces (new workspace experience) setting defaults to only allow users who can create Office 365 Groups to create the new workspaces in Power BI. Be sure to set a value in the Power BI admin portal to ensure appropriate users can create new workspace experience workspaces.

![Workspace settings in the admin portal](media/service-new-workspaces/power-bi-workspace-admin-settings.png)

The [workspaces list is available](service-admin-portal.md#workspaces) in the Power BI admin portal. 

![Workspaces list](media/service-admin-portal/workspaces-list.png)

## New workspaces side by side with classic workspaces

New, upgraded workspaces, and existing classic workspaces coexist side by side, and you can create either. The new workspace experience is the default workspace type. Power BI continues to list all Office 365 Groups the user is a Member of in Power BI to avoid changing existing workflows. To learn how to create a new workspace, read [Create new workspaces](service-create-the-new-workspaces.md). To learn how to create a classic workspace, read [Create the classic workspaces](service-create-workspaces.md).

## Roles in the new workspaces

To grant access to a new workspace, add user groups or individuals to one of the workspace roles: viewers, members, contributors, or admins. Everyone in a user group gets the role you’ve defined. If an individual is in several user groups, they get the highest level of permission provided by the roles they are assigned.

Roles let you manage who can do what in a workspace, so teams can collaborate. New workspaces allow you to assign roles to individuals, and to user groups: security groups, Office 365 groups, and distribution lists. 

When you assign roles to a user group, the individuals in the group have access to content. If you nest user groups, all the contained users have permission.

Here are the capabilities of the four roles: admins, members, contributors, and viewers. All of these capabilities, except viewing and interacting, require a Power BI Pro license.

|Capability   | Admin  | Member  | Contributor  | Viewer |
|---|---|---|---|---|
| Update and delete the workspace.  | X  |   |   |   | 
| Add/remove people, including other admins.  | X  |   |   |   |
| Add members or others with lower permissions.  |  X | X  |   |   |
| Publish and update an app. |  X | X  |   |   |
| Share an item or share an app. |  X | X  |   |   |
| Allow others to reshare items. |  X | X  |   |   |
| Create, edit, and delete content in the workspace.  |  X | X  | X  |   |
| Publish reports to the workspace, delete content.  |  X | X  | X  |   |
| Create a report in another workspace based on a dataset in this workspace.<sup>1</sup> |  X | X  | X  |   |
| Copy a report.<sup>1</sup> | X | X | X |  |
| View and interact with an item.<sup>2</sup> |  X | X  | X  | X  |

1. To copy a report, and to create a report in another workspace based on a dataset in this workspace, you need to meet additional criteria:
    - You need a Power BI Pro license. See the next section, [Licensing](#licensing), for details.
    - You need Build permission for the dataset. For datasets in this workspace, the people with the Admin, Member, and Contributor roles have Build permission through their workspace role.
2. Even if you don't have a Power BI Pro license, you can view and interact with items in the Power BI service if the items are in a workspace in a Premium capacity.

## Licensing
Everyone you add to a workspace in the shared capacity needs a Power BI Pro license. In the workspace, these users can all collaborate on dashboards and reports that you plan to publish to a wider audience, or even to your entire organization. 

If you want to distribute content to others inside your organization, you can assign Power BI Pro licenses to those users or place the workspace in a Power BI Premium capacity.

When the workspace is in a Power BI Premium capacity, users with the Viewer role can access the workspace even if they don't have a Power BI Pro license. However, if you assign these users a higher role like Admin, Member, or Contributor, they'll be prompted to start a Pro Trial when they try to access the workspace. To leverage the Viewer capability for users without Pro licenses, ensure the users in the Viewer role aren't in other workspace roles, either individually or through a user group. 

> [!NOTE]
> Publishing reports to new workspace experience has stricter enforcement of existing licensing rules. Users who try to publish from Power BI Desktop or other client tools without a Pro license see the error "Only users with Power BI Pro licenses can publish to this workspace."

## How the new workspaces are different

With the new workspaces, we've redesigned some features. Here are the changes you can expect to be permanent. 

* Creating these workspaces doesn't create Office 365 groups like classic workspaces do. However, you can now use an Office 365 group to give users access to your workspace by assigning it a role. 
* In classic workspaces, you can add only individuals to the members and admin lists. In the new workspaces, you can add multiple AD security groups, distribution lists, or Office 365 groups to these lists to allow for easier user management. 
- You can create an organizational content pack from a classic workspace. You can't create one from the new workspaces.
- You can consume an organizational content pack from a classic workspace. You can’t consume one from the new workspaces.

## Workspace contact list
The new **Contact list** feature allows you to specify which users receive notification about issues occurring in the workspace. By default, any user or group specified as a workspace admin is notified, but you can customize the list. Users or groups listed in the contact list will be shown in the user interface (UI) to help users get help related to the workspace. 

Read more about the [setting the workspace contact list](service-create-the-new-workspaces.md#workspace-contact-list).

## Workspace OneDrive
The Workspace OneDrive feature allows you to configure an Office 365 Group whose SharePoint Document Library file storage is available to workspace users. The group needs to be created outside of Power BI. 

Power BI doesn't synchronize permissions of users or groups who are configured to have workspace access with the Office 365 Group membership. The best practice is to manage workspace access through the same Office 365 Group whose file storage you configure in this setting. 

Read about how to [set and access the Workspace OneDrive](service-create-the-new-workspaces.md#workspace-onedrive).  
   
## Auditing
The following activities are audited by Power BI for new workspace experience workspaces.

| Friendly name |	Operation name |
|---|---|
| Created Power BI folder | CreateFolder |
| Deleted Power BI folder | DeleteFolder |
| Updated Power BI folder | UpdateFolder |
| Updated Power BI folder access| UpdateFolderAccess |

Read more about [Power BI auditing](service-admin-auditing.md#activities-audited-by-power-bi).

## Limitations and considerations

Limitations to be aware of:

- Workspaces can contain a maximum of 1,000 datasets, or 1,000 reports per dataset. 
- A person with a Power BI Pro license can be a member of a maximum 1,000 workspaces.
- Power BI publisher for Excel isn't supported.

## Workspace features that work differently

Some features work differently from current workspaces in the new workspaces. These differences are intentional, based on feedback we’ve received from customers, and enable a more flexible approach to collaboration with workspaces:

- Licensing enforcement: Publishing reports to new workspace experience enforces existing licensing rules that require a Power BI Pro license for users collaborating in workspaces or sharing content to others in the Power BI service. Users without a Pro license see the error "Only users with Power BI Pro licenses can publish to this workspace."
- Members can or can't reshare: replaced by the Contributor role
- Read-only workspaces: Instead of granting users read-only access to a workspace, assign users to the Viewer role, which allows similar read-only access to the content in a workspace.
- Users without a Pro license can access the workspace if the workspace is in a Power BI Premium capacity, even if users have only the Viewer role.
- To allow users with Viewer role to export data, ensure they have Build permission on the datasets in the workspace. Read more about [Build permission for datasets](service-datasets-build-permissions.md).
- No **Leave workspace** button.

## Frequently asked questions

**Are links to existing content affected by the new workspace experience GA**

No. Links to existing items in classic workspaces aren't affected by the new workspace experience. The general availability (GA) of the new workspace experience changes the default workspace you create, but doesn't change existing workspaces. 

**Are existing workspaces upgraded to the new workspace experience with GA**

No. The new workspace experience GA only changes the default workspace type to the new workspace experience. Existing classic workspaces that are based on Office 365 Groups remain unchanged.

**Are workspaces still automatically created for Office 365 Groups**

Yes. Since we support both types of workspaces side by side, we continue to list all Office 365 Groups the user has access to in the workspaces list.

## Next steps
* [Create the new workspaces in Power BI](service-create-the-new-workspaces.md)
* [Create the classic workspaces](service-create-workspaces.md)
* [Install and use apps in Power BI](service-create-distribute-apps.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
