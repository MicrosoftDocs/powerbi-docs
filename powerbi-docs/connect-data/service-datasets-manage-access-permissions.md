---
title: Manage Semantic Model Access Permissions in Power BI
description: "Learn how to review and manage semantic model access permissions in Power BI. Control direct access, manage shared report links, and secure your sensitive data. Start managing access today."
author: kgremban
ms.author: kgremban
ms.reviewer: yardena
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Share your work
ms.custom: sfi-image-nochange
#customer intent: As a semantic model owner, I want to manage access permissions to my semantic model so that I can ensure the security and proper access control of sensitive data.
---
# Manage semantic model access permissions (preview)

Manage semantic model access permissions in Power BI to keep your sensitive data secure. The semantic model manage permissions page enables you to monitor and control who has access to your semantic model through two tabs:

- **Direct access**: Monitor, add, modify, or delete access permissions for specific people or groups (distribution groups or security groups).
- **Shared report links**: Review and remove links that were generated for sharing reports, which may also grant access to your semantic model.

This article explains how to use the manage permissions page to control access to your semantic model.

>[!NOTE]
>To access a semantic model's manage permissions page, you must have an [Admin or Member role](../collaborate-share/service-roles-new-workspaces.md) in the workspace where the semantic model is located.

## Open the semantic model manage permissions page

To open the semantic model manage permissions page:

- From the [OneLake data hub](service-data-hub.md#find-the-data-you-need) or from the workspace for the semantic model: Select **Manage permissions** from the **More options (…)** menu available next to the semantic model name in the list.

    :::image type="content" source="media/service-datasets-manage-access-permissions/power-bi-dataset-manage-permissions-entry-datasets-hub-page.png" alt-text="Screenshot of menu command to open the semantic model manage permissions page from the list of items in a workspace or the OneLake data hub.":::

- From the [semantic model details page](service-dataset-details-page.md#supported-actions): Select the **Share** icon on the action bar at the top of the page and choose **Manage permissions**.

    :::image type="content" source="media/service-datasets-manage-access-permissions/power-bi-dataset-manage-permissions-entry-dataset-info-page.png" alt-text="Screenshot of menu command to open the semantic model manage permissions page from the semantic model info page.":::

These actions open the semantic models manage permissions page. The manage permissions page has two tabs to help you manage semantic model access.

## Manage direct access

The direct access tab lists users who have been granted access. For each user, you can see their email address and the permissions they have.

- To modify a user's permissions, select **More options (…)** and choose one of the available options.

    :::image type="content" source="media/service-datasets-manage-access-permissions/power-bi-dataset-direct-access-tab-modify.png" alt-text="Screenshot of modifying permissions from the direct access tab on the semantic model manage permissions page.":::

- To grant semantic model access to another user, select **+ Add user**. The [Share semantic model dialog](service-datasets-share.md) opens.

    :::image type="content" source="media/service-datasets-manage-access-permissions/power-bi-dataset-direct-access-tab-add-user.png" alt-text="Screenshot of granting access permissions from the direct access tab on the semantic model manage permissions page.":::

### Managing permissions granted through an app

Permissions on the semantic model granted through an app are indicated by the word "App" followed by the permissions enclosed in parentheses, as shown in the following image:

:::image type="content" source="media/service-datasets-manage-access-permissions/power-bi-dataset-direct-access-tab-app-permissions.png" alt-text="Screenshot of app permissions on semantic models Direct access tab.":::

You can't modify permissions granted through an app directly from the Direct access tab. You must first remove them from the app configuration. To remove such permissions:

1. [Edit the app](../collaborate-share/service-create-distribute-apps.md#change-your-published-app) and unselect the relevant permissions on the Permissions tab of the app's configuration settings.
1. Republish the app.
1. Go to the Direct access tab of the semantic model's manage semantic model permissions page as described in [Manage direct access](#manage-direct-access). The user still has the permissions granted via the app before update, but now they're not tied to the app (note that the parentheses are gone). Now you can remove whatever permissions you desire.

    :::image type="content" source="media/service-datasets-manage-access-permissions/power-bi-dataset-direct-access-tab-app-permissions-remove.png" alt-text="Screenshot of editing former app permissions.":::

## Manage links generated for report sharing

The shared report links tab lists [links that have been created to shared reports](../collaborate-share/service-share-dashboards.md) that are based on your semantic model. Such links might also grant access to the report's underlying semantic model, and so these links are listed here. You can see what permissions the link carries and who created the link. You can also delete the link from the system if you so desire.

>[!WARNING]
> Deleting a link removes it from the system. Users who use the link to access a report may lose access to that report.

:::image type="content" source="media/service-datasets-manage-access-permissions/power-bi-dataset-shared-report-links-tab.png" alt-text="Screenshot of shared report links tab on the semantic model manage permissions page.":::

## Related content

- [Semantic model permissions](./service-datasets-permissions.md)
- [Share access to a semantic model](./service-datasets-share.md)
- [Use semantic models across workspaces](./service-datasets-across-workspaces.md)
- [Share a report via link](../collaborate-share/service-share-dashboards.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
