---
title: Share access to a dataset
description: As a dataset owner, you share and grant access to your datasets so that others can use them. Learn how to grant access to your datasets.
author: paulinbar
ms.author: painbar
ms.reviewer: yardena
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 08/23/2022
LocalizationGroup: Share your work
---
# Share access to a dataset (preview)

To make it possible for other users to take advantage of a dataset, you can *share* it with them. Sharing a dataset means granting access to it. This document shows you how to grant access to a dataset using the **Share dataset** dialog.

## Share a dataset

To share a dataset

1. On either the [data hub page](service-data-hub.md#find-the-data-you-need) or on the [data details page](service-data-details-page.md), choose **Share** as follows:

    * **Data  hub**: In the data items list, click the **Share** icon. On a recommended data item tile, choose **Share** on the **More options (…)** menu.

        ![Screenshot of data item share option on the data hub.](media/service-datasets-share/power-bi-dataset-share-dataset.png)

    * **Dataset info page**: Click the **Share** icon on the action bar at the top of the page.

        ![Screenshot of dataset share icon on the dataset info page.](media/service-datasets-share/power-bi-dataset-share-icon.png)

1. In the **Share dataset** dialog that appears, enter the names or email addresses of the specific people or groups (distribution groups or security groups) that you want to grant access to, then choose the types of access you wish to grant. You can optionally choose to send them an email notifying them that they've been granted access.

    ![Screenshot of the Share dataset dialog.](media/service-datasets-share/power-bi-dataset-grant-access-dialog.png)

    * **Allow allow recipients to modify this dataset**: This option allows the recipients to modify the dataset.
    * **Allow recipients to share this dataset**: This option allows the recipients to grant access to other users via sharing.
    * **Allow recipients to build content with the data associated with this dataset**: This option grants the recipients [Build permission](service-datasets-build-permissions.md) on the dataset, which enables them to build new reports and dashboards based on the data associated it.

        If you clear this checkbox, the user will get **read-only** permission on the dataset. Read-only permission allows them to explore the dataset on the [dataset's info page](service-dataset-details-page.md) but doesn't allow them to build new content based on the dataset.
    * **Send an email notification**: When this option is selected, an email will be sent to the recipients notifying them that they have been granted access to the dataset. You can add an optional message to the email message.

1. Click **Grant access**.

> [!NOTE]
> When you press **Grant access**, access is granted automatically. No further approval is required. 

To monitor, change, or remove user access to your dataset, see [Manage dataset access permissions](service-datasets-manage-access-permissions.md).

## Next steps

* [Dataset permissions](service-datasets-permissions.md)
* [Manage dataset access permissions](service-datasets-manage-access-permissions.md)
* [Use datasets across workspaces](service-datasets-across-workspaces.md)
* [Share a report via link](../collaborate-share/service-share-dashboards.md#share-a-report-via-link)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
