---
title: Power BI REST APIs datasets permissions
description: This article lists the Power BI REST APIs dataset permissionss
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
editor: ''
tags: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: reference
ms.date: 01/03/2022
---

# Datasets permissions

Power BI has two sets of permissions:

* [Workspace permissions](#workspace-permissions)

* [Item permissions](#item-permissions)

## Workspace permissions

Workspace permissions, sometimes referred to as folder permissions or [roles](./../collaborate-share/service-roles-new-workspaces.md), are the highest level of permissions in Power BI. These permissions override permissions that are given to a specific item in the workspace folder. There are four types of workspace permissions:

* Admin

* Member

* Contributor

* Viewer

Admin is the highest workspace permission level, and viewer is the lowest. Every permission level includes the capabilities of the permissions below it. You can review the capabilities of each permission in [Workspace roles](./../collaborate-share/service-roles-new-workspaces.md#workspace-roles).

### Write

There's one more permission, which is titled *write*. The write permission is higher than the admin permission, but it can't be granted or deleted. You get the write permission if you created the a Power BI item (such as a dataset), or if the item is in your Power BI service *my workspace* folder.

## Item permissions

Power BI items, such as reports, datasets and dashboards have their own permissions. Item permissions cannot override workspace permissions, and can only be granted by someone who has at least the same permission level.

### Dataset permissions

The table below describes the Power BI dataset permissions.

>[!TIP]
>Although the API permissions are identical to the Power BI service permissions, [build](#build) permissions are referred to as *explore* permissions in the APIs.

|Permission             |Read     |Explore (also known as build)  |Reshare  |
|-----------------------|---------|---------|---------|
|Description            |Allows the user to read the content of the dataset|Equivalent to [build permissions](#build-permisions) |Allows the user to share the content of the dataset with other users who will get read permissions for it |
|**ReadReshareExplore** |✔️       |✔️      |✔️       |
|**ReadReshare**        |✔️       |❌      |✔️       |
|**ReadExplore**        |✔️       |✔️      |❌       |
|**Read**               |✔️       |❌      |❌       |

>[!NOTE]
>To allow a user to perform write operations on a dataset, you need to change the [workspace permissions](#workspace-permissions).

### Build permissions

In the [Power BI REST APIs](/rest/api/power-bi/), the build permission is returned as *explore*.

When you give a user the build permission, the user can build new content on your dataset. Examples for such content are reports, dashboards, pinned tiles from Q&A, paginated reports, and Insights Discovery.

Users also need Build permissions to work with data outside Power BI:

* To export the underlying data.

* To build new content on the dataset such as with Analyze in Excel.

* To access the data via the XMLA endpoint.

### Row-level security

When you add or change permissions in an organization that uses row-level security (RLS), any permissions higher than build will enable the user to view all the data in the dataset. Build, and permissions lower than build, will let the dataset user have access only to the data they're allowed to see as configured in your RLS settings.

### Dataset APIs for changing permissions

To add permissions for using datasets, use the APIs listed below. You can only add permissions for datasets, to users that don't have any permissions for the specified dataset.

* [Datasets - Post Dataset User](/rest/api/power-bi/datasets/post-dataset-user)

* [Datasets - Post Dataset User In Group](/rest/api/power-bi/datasets/post-dataset-user-in-group)

### Limitations

These limitations are relevant for the [Datasets - Post Dataset User](/rest/api/power-bi/datasets/post-dataset-user) and [Datasets - Post Dataset User In Group](/rest/api/power-bi/datasets/post-dataset-user-in-group) APIs.

* The API caller must have at leaser ReadReshare permissions on the dataset.

* The API caller cannot grant permissions that are higher than his permissions for the dataset.

* Write permissions cannot be granted.

* These APIs only support datasets that were created in the [new workspace experience](/collaborate-share/service-new-workspaces). Datasets that reside on the classic workspace are not supported.

* These APIs only support users and groups. Service principals are not supported.

* You cannot use this API to remove dataset permissions.

## Next steps

>[!div class="nextstepaction"]
>[Power BI REST APIs](/rest/api/power-bi/).

>[!div class="nextstepaction"]
>[Push datasets](/rest/api/power-bi/push-datasets).
