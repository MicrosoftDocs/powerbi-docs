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

You can upgrade any classic workspace to the new workspace experience. However, there may be changes to your workspace that you need to be aware of and plan for.

Learn about the [new workspace experience](../service-new-workspaces.md).

## Upgrade considerations and limitations

- The URLs and IDs of your workspace, the content it contains, and the app published from the workspace don't change. Content from content packs installed in your workspace are handled separately as discussed in this document.
- Content packs aren't supported in the new workspace experience. Read the sections about **published content packs** or **installed content packs** to learn about how these are handled during upgrade. We recommend deleting content packs installed or published in your workspace before you upgrade.
- The Office 365 group for your classic workspace isn't affected by the workspace upgrade in Power BI. Any Teams, SharePoint sites, mailboxes, or other resources managed by Office 365 aren't changed and remain intact after you upgrade your Power BI workspace. The Office 365 group continues to exist as before.
- There are changes to how your workspace is secured after the upgrade. These are covered the **workspace permissions after upgrade** section.
- An option to **go back to a classic workspace** is provided in case you need it. However, it doesn't fully restore some aspects of your workspace before it was upgraded. If you start using features that work only in the new workspace experience, you won't be able to go back. The go back option is available for 30 days after you upgrade.

## Upgrade a classic workspace

Any workspace admin can upgrade the workspace. To upgrade a workspace, follow these steps.

1. Go to the workspace and view the content list.
2. Select **More options** ( **...** ) > **Edit this workspace**.

1. Expand **Advanced**.

1. Select **Upgrade now** to start the upgrade.

1. Review the dialog information. You see warnings if you've published or installed content packs in the workspace. When you're ready, select the checkbox and select **Upgrade**.
2. During upgrade, you see the **Upgrading** message. It usually takes less than a minute to upgrade your workspace.

1. After upgrade finishes you see the confirmation dialog. We recommend reading the documentation so you're familiar with how new workspaces differ from classic workspaces. [Organize work in the new workspaces in Power BI](../service-new-workspaces.md).

### Impact on other workspace users

We recommend upgrading during off-hours when few users are actively viewing or editing items in the workspace.

Users who are actively using the workspace are asked to refresh their browser. Those editing a report are given the option to save before they refresh.

## Permissions changes to your workspace after upgrade

Use **Access** at the top of the workspace content list to review the permissions after upgrade.


Each Office 365 group Owner is added individually to the Admin role for the upgraded workspace. The Office 365 group itself is added to a workspace role, as described later in this section.

The Office 365 group is added to a different role if the workspace is *read-only* or *read-write*:

- When the workspace is set to **Members can edit Power BI content**, after upgrade the Office 365 group is added to the workspace access list with the **Member** role.
- When the workspace is set to **Members can only read Power BI content**, after upgrade the Office 365 group is added to the workspace access list with the **Viewer** role.

Because the Office 365 group is given a role in the workspace, any user added to the Office 365 group after upgrade has that role in the workspace. However, if you add new Owners to the Office 365 group after the upgrade, they don't have the Admin role for the workspace.

Important differences in workspace roles before and after upgrade:

- **Members** can share individual items and give access to the entire workspace through the Member, Contributor, or Viewer roles
- **Viewers** can only view content and can't export underlying data or analyze in Excel for any workspace datasets, unless they have the Build permission.

The new workspace experience enables you to give workspace roles to Office 365 groups, security groups, or distribution lists.

Any users who have access to items in the workspace through sharing or app permission continue to have access to those items.

- Anyone with access to the workspace also has access to the app published from the workspace. These users aren't listed in the app access list.

We recommend evaluating whether to use the new Contributor role. After upgrade, you can change the Office 365 group to have the Contributor role in the Access pane.

After upgrade, you may consider creating a security or Office 365 group or distribution list for workspace admins, instead of managing access through role assignments to individual users.

## Other new workspace experience features

Use **Settings** at the top of the workspace content list to access the workspace settings.

Under **Advanced**, the workspace **Contact list** is configured to be the Office 365 group the workspace was upgraded from. You can add more users or groups, or switch it to workspace admins.

After upgrade, the workspace **OneDrive** is connected to the Office 365 group SharePoint document library. This shows as the **OneDrive** option in the **Get Data > Files** experience. Be aware that not all workspace users may have permission to that document library, if they're not in the Office 365 group.

## Go back to a classic workspace

As part of the upgrade experience, you have the option to go back to a classic workspace for 30 days after the upgrade. This capability restores the association of workspace content to the original Office 365 group. It's available in case your organization encounters major issues using the new workspace experience.

To go back, you need to be an Owner of the Office 365 group the workspace was associated with before it was upgraded.

To go back to a classic workspace, follow these steps:

1. Go to the workspace content list.
2. Select **More options** ( **…** )  > **Workspace settings**.

1. Expand **Advanced**.

1. Select **Switch back to classic**. This option may not be available to you. If not, check the limitations in this document.

1. When you're ready to go back, check the box and select **Switch to classic**. Remember who can access the workspace is set back to the Office 365 group admins and members. You many see warnings or blockers in this UI. Read the considerations for going back in this documentation if you encounter these issues.

1. When switch back completes, you see a confirmation dialog.

### Considerations for switching back to classic

You can't switch back if you're using any of the following statements about your workspace are true:

- The Office 365 group was deleted.
- It's been more than 30 days since you upgraded.

- Datasets in the workspace are used by reports or dashboards in other workspaces. This occurs immediately after upgrade if you had published a content pack from the workspace before upgrade, and someone installed the content pack in another workspace.
- The workspace is part of an application life cycle management pipeline.
- The workspace is used for template apps.
- The workspace uses the Premium Files capability.
- The workspace uses the new usage metrics feature.

When you switch back to a classic workspace you aren't restoring an exact copy of the original workspace. The following changes occur:

- Permissions for the workspace are set by the Office 365 group the upgraded workspace was originally connected to.
  - Any admins of the Office 365 group become admins of the classic workspace.
  - Any members of the Office 365 group become members of the classic workspace. If the classic workspace was set to **members can only read Power BI content**, this setting is restored.
  - Any users or user groups added to the workspace after upgrade completed (outside the Office 365 group) lose access to the workspace. You need to add them to the office 365 group to give them access. Note that Office 365 groups don't allow nesting security or distribution groups in the membership.
  - Users who received access to the app for the workspace continue to have access to the app.
  - Users who received access to items in the workspace through sharing continue to have access to them.
- Content packs published from the classic workspace before upgrade aren't restored.
- Content packs installed in the classic workspace before upgrade aren't restored.
- Subscriptions created by users in the workspace after upgrade are removed. Subscriptions that existed before upgrade continue to work as expected.
- Data alerts aren't preserved. They're removed.
- If you renamed the workspace after upgrade, the name of the workspace is restored to match the name of the Office 365 group.
- In-progress operations like refreshes aren't impacted by workspace upgrade.

## How content packs are handled during upgrade

The new workspace experience doesn't support content packs. Instead, use apps and shared datasets to distribute content in the workspace. We recommend removing published or installed content packs from the workspace prior to upgrade. However, if there are published or installed content packs when you upgrade, the upgrade process attempts to preserve the content, as described below.  There is no way to restore the content pack or the association of content to the content pack after you upgrade.

### Published content packs

Content packs published from the workspace are removed during the upgrade. You won't be able to publish or update them after upgrade, even if you revert back to the classic workspace. If others have installed your content pack in their own workspaces, after upgrade they see a copy of the content pack content in their workspaces. See the **installed content packs** section for details.

### Installed content packs

When you upgrade your workspace, or the workspace from which the content pack is published is upgraded, important changes happen to installed content packs. After the upgrade, your workspace contains a copy of the content pack content. It's connected to the original dataset in the original workspace.

However, there are important changes:

1. The content no longer updates if the content pack is updated.
2. The URLs and item identifiers change and require any bookmarks or links you've shared with others to be updated.
3. Any user customizations on the original content pack from your workspace are lost. This includes subscriptions, alerts, personal bookmarks, persistent filters, and favorites.
4. New users many not have access to the datasets that were in the content pack. You need work with the dataset owner to ensure workspace users have access to the data.

## Known issues

- After upgrade

## Next steps
* [Create the new workspaces in Power BI](../service-create-the-new-workspaces.md)
* [Create the classic workspaces](../service-create-workspaces.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
