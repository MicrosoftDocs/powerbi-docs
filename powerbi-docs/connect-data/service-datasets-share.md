---
title: Share access to a dataset
description: As a dataset owner, you share and grant access to your datasets so that others can use them. Learn how to grant access to your datasets.
author: paulinbar
ms.author: painbar
ms.reviewer: yardena
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 08/06/2021
LocalizationGroup: Share your work
---
# Share access to a dataset

To make it possible for other users to take advantage of your dataset, you can grant them access to it by sharing it. This document shows you how to grant access to your dataset using the **Share dataset** dialog.

To share your dataset

1. On either the [datasets hub page](service-datasets-hub.md#find-the-dataset-you-need) or on the [dataset info page](service-datasets-hub.md#view-dataset-details-and-explore-related-reports), choose **Share** as follows:

    * **Datasets hub**: In the datasets list, click the **Share** icon. On a recommended dataset tile, choose **Share** on the **More options (…)** menu.

        ![Screenshot of dataset share option on the datasets hub.](media/service-datasets-share/power-bi-dataset-share-dataset.png)

    * **Dataset info page**: Click the **Share** icon on the action bar at the top of the page.

        ![Screenshot of dataset share icon on the dataset info page.](media/service-datasets-share/power-bi-dataset-share-icon.png)

1. In the **Share dataset** dialog that appears, enter the names of the users and/or security groups you want to grant access to, then choose the types of access you wish to grant.

    ![Screenshot of the Share dataset dialog.](media/service-datasets-share/power-bi-dataset-grant-access-dialog.png)

    * **Allow recipients to share this dataset**: This option allows the recipients to grant access to other users via sharing.
    * **Allow recipients to build content with the data associated with this dataset**: This option grants the recipients [Build permission](service-datasets-build-permissions.md) on the dataset, which enables them to build new reports and dashboards based on the data associated it.

        If you clear this checkbox, the user will get **read-only** permission on the dataset. Read-only permission allows them to explore the dataset on the [dataset's info page](service-datasets-hub.md#view-dataset-details-and-explore-related-reports) but doesn't allow them to build new content based on the dataset.
    * **Send an email notification**: When this option is selected, an email will be sent to the recipients notifying them that they have been granted access to the dataset. You can add an optional message to the email message.

1. Click **Grant access**.

> [!NOTE]
> When you press **Grant access**, access is granted automatically. No further approval is required. 

To monitor, change, or remove user access to your dataset, see [Manage dataset access permissions](service-datasets-manage-access-permissions.md).

## Next steps

* [Manage dataset access permissions](service-datasets-manage-access-permissions.md)
* [Use datasets across workspaces](service-datasets-across-workspaces.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
