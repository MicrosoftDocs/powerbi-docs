---
title: Upgrade classic workspaces to the new workspaces
description: Learn about upgrading a classic workspace to the new workspace experience. You can upgrade any workspace, but you may need to be aware of and plan for some changes.
author: maggiesMSFT
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 11/11/2019
ms.author: maggies

LocalizationGroup: Share your work
---

# Upgrade classic workspaces to the new workspaces in Power BI

You can upgrade a classic workspace to the new workspace experience. You can upgrade any workspace. However, there may be changes to your workspace that you need to be aware of and plan for.

Learn about the [new workspace experience](https://docs.microsoft.com/en-us/power-bi/service-new-workspaces)

## Upgrade considerations and limitations

- The URLs and IDs of your workspace, the content it contains, and the app published from the workspace will not change. Content from content packs installed in your workspace are handled separately as discussed in this document.
- Content packs are not supported in the new workspace experience. Read the sections about **published content packs** or **installed content pack** to learn about how these are handled by upgrade. It is recommended you delete content packs installed or published in your workspace before you upgrade.
- The Office 365 Group for your classic workspace is not affected by the workspace upgrade in Power BI. Any Teams, SharePoint sites, mailboxes, or other resources managed by Office 365 are not changed and remain intact after you upgrade your Power BI workspace. The Office 365 Group will continue to exist as before.
- There are changes to how your workspace is secured after the upgrade. These are covered the **workspace permissions after upgrade** section.
- An option to **go**** back to a classic workspace** is provided in case you need it. However, it does not fully restore some aspects of your workspace before it was upgraded. If you start using features that work only in the new workspace experience, you won&#39;t be able to go back. The go back option is available for 30 days after you upgrade.

## Upgrading a classic workspace

Any workspace admin can upgrade the workspace.

To upgrade a workspace follow these steps:

1. Go to the workspace and view the content list
2. Select **More options** ( **...** ) \&gt; **Edit this workspace**

1. Expand **Advanced**

1. Select **Upgrade now** to start the upgrade.

1. Review the dialog information. You will see warnings if you&#39;ve published or installed content packs in the workspace. When you&#39;re ready, check the checkbox and press Upgrade.
2. During upgrade, the upgrading message is shown. It usually takes less than a minute to upgrade your workspace.

1. After upgrade finishes you&#39;ll see the confirmation dialog. We recommend you read the documentation so you&#39;re familiar with how new workspaces differ from classic workspaces.

## Impact on other workspace users

It&#39;s recommended you upgrade during off-hours when few users are actively viewing or editing items in the workspace.

Users who are actively using the workspace will be asked to refresh their browser. Those editing a report are given the option to save before they refresh.

## Permissions changes to your workspace after upgrade

Use **Access** at the top of the workspace content list to review the permissions after upgrade.



Each Office 365 Group Owners is added individually to the Admin role for the upgraded workspace. The Office 365 Group itself is added to a workspace role as described later in this section.

The Office 365 Group is added to different role if the workspace is &#39;read-only&#39; or &#39;read-write&#39;, as specified below:

- When the workspace is set to &quot;Members can edit Power BI content&quot;, after upgrade the Office 365 Group is added to the workspace access list with &quot;Member&quot; role
- When the workspace is set to &quot;Members can only read Power BI content&quot;, after upgrade the Office 365 Group is added to the workspace access list with &quot;Viewer&quot; role

Because the Office 365 group is given a role on the workspace, any user added to the Office 365 group after upgrade will have that role in the workspace. If you add a new Owner to the Office 365 group after the upgrade, they will not have the Admin role for the workspace

Important differences in workspace roles before and after upgrade:

- Members can share individual items and give access to the entire workspace through the Member, Contributor, or Viewer roles
- Viewers can only view content and can&#39;t export underlying data or analyze in excel for any workspace datasets where they don&#39;t have the Build permission.

The new workspace experience enables you to give workspace roles to Office 365 Groups, Security Groups, or Distribution Lists.

Any users who received access to items in the workspace through Sharing or App permission continue to have access to those items.

- Anyone who has access to the workspace also has access to the app published from the workspace. These users will not be listed in the App access list.

It is recommended to evaluate whether to use the new Contributor role. You can change the Office 365 Group to have Contributor role after upgrade completes in the access pane.

After upgrade, you may consider creating a user group (security, Office 365, or distribution) for workspace admins instead of managing access through role assignments to individual users.

## Other new workspace experience features

Use **Settings** at the top of the workspace content list to access the workspace settings.

Under **Advanced** the workspace C **ontact list** is configured to be the Office 365 Group the workspace was upgraded from. You can add more users or groups or switch it to workspace admins.

The **Workspace OneDrive** is connected after upgrade to the Office 365 Group&#39;s SharePoint document library. This shows the **OneDrive** option in the **Get Data -\&gt; Files** experience. Be aware that not all workspace users may have permission to that document library if they don&#39;t have access to the Office 365 Group.

## Go back to a classic workspace

As part of the upgrade experience the option to go back to a classic workspace is provided for 30 days after the upgrade. This capability restores the association of workspace content to the original Office 365 Group. It is available in case your organization encounters major issues using the new workspace experience.

To go back, you need to be an Owner of the Office 365 group the workspace was associated with before the upgrade occurred.

To go back to a classic workspace, follow these steps:

1. Go to the workspace content list.
2. Select More options ( **…** )  \&gt; **Workspace settings.**

1. Expand **Advanced**

1. Click the **Switch back to classic** link. This option may not be available to you, if it&#39;s not check the limitations in this document.

1. When you&#39;re ready to go back, check the box and press **Switch to classic.** Remember who can access the workspace will be set back to the Office 365 Group admins and members. You many see warnings or blockers in this UI. Read the considerations for going back in this documentation if you encounter these issues.

1. When switch back completes, you&#39;ll see a confirmation dialog

### Considerations for switching back to classic

You can&#39;t switch back if you&#39;re using any of the following features in your workspace:

- The Office 365 Group was deleted
- It&#39;s been more than 30 days since you upgraded

- Datasets in the workspace are used by reports or dashboards in other workspaces
  - This occurs immediately after upgrade if you had published a content pack from the workspace before upgrade, and someone installed the content pack in another workspace
- The workspace is part of an application life cycle management pipeline
- The workspace is used for template apps
- The workspace uses the Premium Files capability
- The workspace uses the new usage metrics feature

When you switch back to a classic workspace you are not restoring an exact copy of the original workspace. The following changes occur:

- Permissions for the workspace will be set by the Office 365 Group the upgraded workspace was originally connected to.
  - Any admins of the Office 365 Group will become admins of the classic workspace.
  - Any members of the Office 365 Group will become members of the classic workspace. If the classic workspace was set to &quot;members can only read Power BI content&quot;, this will be restored.
  - Any users or user groups added to the workspace after upgrade completed (outside the Office 365 group) will lose access to the workspace. You will need to add them to the office 365 group to give them access. Note that Office 365 Groups do not allow nesting security or distribution groups in the membership.
  - Users who received access to the app for the workspace will continue to have access to the app
  - Users who received access to items in the workspace through sharing will continue to have access to them.
- Content packs published from the classic workspace before upgrade aren&#39;t restored
- Content packs installed in the classic workspace before upgrade aren&#39;t restored
- Subscriptions created by users in the workspace after upgrade are removed. Subscriptions that existed before upgrade continue to work as expected.
- Data alerts are not preserved by the restore, they are removed.
- If you renamed the workspace after upgrade, the name of the workspace will be restored to match the name of the Office 365 Group.
- In progress operations, like refreshes are not impacted by workspace upgrade



## How content packs are handled during upgrade

The new workspace experience does not support content packs, instead you should use apps and shared datasets to distribute content in the workspace. It is recommended you remove published or installed content pack from the workspace prior to upgrade. However, if when you upgrade there are published or installed content packs, the upgrade process attempts to preserve the content as described below.  There is no way to restore the content pack or the association of content to the content pack after you upgrade.

### Published content packs

Content packs published from the workspace will be removed during the upgrade. You won&#39;t be able to publish or update it after upgrade, even if you use the go back to classic workspace option. If users have installed your content pack in their own workspaces, after upgrade they will see a copy of the content pack content in their workspaces. Will behave as described in the **installed content packs** section.

### Installed content packs

When you upgrade your workspace, or the workspace from which the content pack is published is upgraded important changes will happen to installed content packs. After the upgrade, your workspace will contain a copy of the content pack content. It will be connected to the original dataset in the original workspace.

However, there are important changes that are made:

1. The content will no longer update if the content pack is updated.
2. The URLs and item identifiers will change and require any bookmarks or links you&#39;ve shared with others to be updated
3. Any user customizations on the original content pack from your workspace are lost. This includes subscriptions, alerts, personal bookmarks, persistent filters, and favorites.
4. New users many not have access to the datasets that were in the content pack. You&#39;ll need work with the dataset owner to ensure workspace users have access to the data.

## Known issues

- After upgrade

## Next steps
* [Create the new workspaces in Power BI](service-create-the-new-workspaces.md)
* [Create the classic workspaces](service-create-workspaces.md)
* [Install and use apps in Power BI](service-create-distribute-apps.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
