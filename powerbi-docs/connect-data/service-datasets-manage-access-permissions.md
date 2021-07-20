---
title: Share access to a dataset
description: As a dataset owner, you share and grant access to your datasets so that others can use them. Learn how to grant access to your datasets.
author: paulinbar
ms.author: painbar
ms.reviewer: yardena
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 07/20/2021
LocalizationGroup: Share your work
---
# Manage dataset access permissions

The dataset access management page enables you monitor and manage access to your dataset. It has two and sometimes three tabs that help you control access to your dataset:
* **Direct access**: Enables you to monitor, add, modify, or delete access permissions for individual named users.
* **Shared report links**: Shows you [links that were generated for sharing reports](../collaborate-share/service-share-dashboards.md). Such links sometimes also give access to your dataset. On this tab you can review them and remove them if necessary.
* **Pending**: Shows you pending access requests for your dataset and enables you to grant or reject them.

This document explains how to get to the dataset access management page and how to use the three tabs it contains.

## View the dataset access management page

To view the dataset access management page:

* From the [datasets hub](service-datasets-hub.md#find-the-dataset-you-need): Click **Manage permissions** on the **More options (…)** menu.

    ![Screenshot of dataset access management page entry points on the datasets hub.](media/service-datasets-manage-access-permissions/power-bi-dataset-manage-permissions-entry-datasets-hub-page.png)

* From the [dataset info page](service-datasets-hub.md#view-dataset-details-and-explore-related-reports): Click the **Share** icon on the action bar at the top of the page and choose **Manage permissions**.

    ![Screenshot of dataset access management page entry points on the dataset info page.](media/service-datasets-manage-access-permissions/power-bi-dataset-manage-permissions-entry-dataset-info-page.png)

* From the [Share dataset dialog](service-datasets-share.md#share-your-dataset): In the dialog header, click **Manage permissions** on the **More options (…)** menu. A **Manage permissions** side pane will open. Choose **Advanced** at the bottom of the pane.

    ![Screenshot of dataset access management page entry point on the Share dataset dialog.](media/service-datasets-manage-access-permissions/power-bi-dataset-manage-permissions-entry-share-dataset-dialog.png)
 
These actions will open the datasets access management page. The access management page opens.  The access management page has two and possibly three tabs to help you manage dataset access.

## Manage direct access

The direct access tab lists users who have been granted access. For each user you can see their email address and the permissions they have.

To modify a user’s permissions, click **More options (…)** and choose one of the available options.
 
Click **+ Add user** to grant dataset access to another user. The [Share dataset dialog](service-datasets-share.md#share-your-dataset) will open.

![Screenshot of direct access tab on the dataset access management page.](media/service-datasets-manage-access-permissions/power-bi-dataset-direct-access-tab.png)

## Manage links generated for report sharing

The shared report links tab lists [links that have been created to shared reports](../collaborate-share/service-share-dashboards.md) that are based on your dataset. Such links may also grant access to the report’s underlying dataset, and so they are listed here. You can see what permissions the link carries and who created the link. You can also delete the link from the system if you so desire.

>[!WARNING] Deleting a link removes it from the system. Users who use the link to access a report may lose access to that report.

![Screenshot of shared report links tab on the dataset access management page.](media/service-datasets-manage-access-permissions/power-bi-dataset-shared-report-links-tab.png)
 
## Review and act on pending access requests

The pending tab lists dataset access requests that are waiting for your decision. This tab is not present if no access requests are pending.

![Screenshot of pending tab on the dataset access management page.](media/service-datasets-manage-access-permissions/service-datasets-manage-access.png)

## Next steps

* [Use datasets across workspaces](service-datasets-across-workspaces.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
