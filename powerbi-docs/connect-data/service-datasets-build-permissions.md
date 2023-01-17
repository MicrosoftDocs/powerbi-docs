---
title: Build permission for shared datasets
description: Learn how you can control access to datasets by using Build permission in the Power BI service.
author: paulinbar
ms.author: painbar
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/17/2023
LocalizationGroup: Share your work
---
# Build permission for shared datasets

When you create a report in Power BI Desktop, you store the report data in a *data model*. When you publish your report to the Power BI service, you publish the data as a *dataset*. You can give other people *Build permission* to that report, so they can discover and reuse the dataset you shared. This article explains how you can control access to the dataset by using the Build permission.

Build permission applies to datasets. When you give users Build permission, they can build new content on your dataset, such as reports, dashboards, pinned tiles from Q&A, paginated reports, and Insights discovery.

Users also need Build permissions to do the following actions outside of Power BI:

- Export underlying data.
- Build new content on the dataset, such as with [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md).
- Access the data via the XML for Analysis (XMLA) endpoint.

## Ways to give Build permission

Users can get Build permission for a dataset in a few different ways:

- Members of a workspace with at least a Contributor role automatically have Build permission for datasets in that workspace, and permission to copy a report. For more information about roles in workspaces, see [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).
 
- Dataset owners can assign Build permission to specific users or security groups on the  **Manage permissions** page. For more information, see [Manage dataset access permissions](service-datasets-manage-access-permissions.md).

- An admin or member of the workspace where the dataset resides can decide during app publishing that users with permission for the app also get Build permission for the underlying datasets. For more information, see [Create and manage audiences](../collaborate-share/service-create-distribute-apps.md#create-and-manage-audiences).

- If you have Reshare and Build permission on a dataset, and you share a report or dashboard built on that dataset, you can specify that the recipients also get Build permission for the underlying dataset. For more information, see [Share Power BI reports and dashboards](../collaborate-share/service-share-dashboards.md).

If a report outside the dataset workspace uses your dataset, you can't delete the dataset. If you try to do so, you get an error message.

## Remove Build permission

You can remove Build permission. If you remove Build permission, the people whose permission you revoked can still see the report, but can no longer edit the report or export underlying data. Users with only read permission can still export summarized data.

To remove Build permission for users of a shared dataset, follow the instructions at [Manage permissions](service-datasets-manage-access-permissions.md#manage-direct-access).

### Remove Build permission for a dataset in an app

If you distribute an app from a workspace, removing people's access to the app doesn't automatically remove their build and reshare permissions. To remove their Build permissions, take the following extra steps:

1. On the workspace list page, select **Update app**. 

   ![Screenshot that shows Update app on the workspace list page.](media/service-datasets-build-permissions/power-bi-app-update.png)

1. On the **Permissions** tab, select the **X** next to a person or group's name to delete the person or group.

   ![Screenshot that shows selecting the X next to a person's name to remove their permissions.](media/service-datasets-build-permissions/power-bi-app-delete-user.png)

1. Select **Update app**.

   You see a message that you need to select **Manage permissions** to remove Build permission for users with existing access.

   :::image type="content" source="media/service-datasets-build-permissions/power-bi-dataset-app-remove-message.png" alt-text="Screenshot of the Manage permissions message.":::

1. Select **Update**.

1. Follow the instructions in [Manage permissions](service-datasets-manage-access-permissions.md#manage-direct-access) to see how to remove permissions from users with existing access. When you take away a user's Build permission on a dataset, they can still see reports built on the dataset, but they can no longer edit the reports.

## Configure how users request Build permission

Certain actions, such as creating a report with a dataset or accessing the details page of a dataset in the datasets hub, require Build permission on the dataset. By default, when users who don't have Build permission try these actions, they get a dialog box that lets them send an email request to the dataset owner for Build permission. The email includes the user's details, the name of the dataset they’re requesting access to, and any other information they optionally provide.

![Screenshot of the default Build permission request dialog.](media/service-datasets-build-permissions/build-permission-default-request-dialog.png)
 
### Change the access request behavior

If you have an [Admin, Member, or Contributor role](../collaborate-share/service-roles-new-workspaces.md) on the dataset's workspace, you can change the default access request behavior by using the **Request access** options in the **Datasets** tab of the app **Settings**.

![Screenshot of the Request access configuration dialog in the dataset settings.](media/service-datasets-build-permissions/build-permission-specific-instructions-dialog.png)
 
- The default option, not selected in the preceding image, is for Build permission requests to come to you via email. You're responsible for acting on the requests and notifying the requestors.

- The second option is for you to provide instructions about how to get Build permission, rather than receiving requests via email. You might choose this option, for example, if your organization uses an automated system for handling access requests. When users who don't have Build permissions try an action that they need Build permission for, they see a message with the instructions you provide.

  The **Instructions** text area in the preceding **Request access** example shows sample instructions. Instructions must be in plain text. HTML or any other type of code formatting render as plain text, rather than the code format. The following example shows the instructions users see when they try an action they need Build permission for.

  ![Screenshot of specific instructions for requesting Build permission.](media/service-datasets-build-permissions/build-permission-specific-instructions-example.png)

  >[!NOTE]
  > When you provide specific instructions, your email address is visible to users who request access.

## More granular permissions

Power BI provided Build permission as a complement to Read and Reshare permissions. At that time, all users who already had Read permission for datasets via app permissions, sharing, or workspace access also got Build permission for those datasets. Those users got Build permission automatically because Read permission already granted them the right to build new content on the dataset by using **Analyze in Excel** or **Export**.

With the more granular Build permission, you can choose who can only view the content in an existing report or dashboard, and who can create content connected to the underlying dataset.

## Next steps

* [Use datasets across workspaces](service-datasets-across-workspaces.md)
* [Share a dataset](service-datasets-share.md)
* [Roles in workspaces](../collaborate-share/service-roles-new-workspaces.md)
* [Manage dataset access permissions](service-datasets-manage-access-permissions.md)

Questions? [Try asking the Power BI Community](https://community.powerbi.com.)
