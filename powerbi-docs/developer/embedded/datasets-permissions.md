---
title: Power BI REST APIs datasets permissions
description: This article lists the Power BI REST APIs dataset permissions
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
editor: ''
tags: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: reference
ms.date: 01/23/2022
---

# Datasets permissions

This article describes Power BI permissions in general, and dataset permissions in the context of the [Power BI REST APIs](/rest/api/power-bi/).

## Power BI permissions

Power BI has two sets of permissions:

* [Workspace permissions](#workspace-permissions)

* [Item permissions](#item-permissions)

### Workspace permissions

Workspace permissions, also known as folder permissions or [roles](../../collaborate-share/service-roles-new-workspaces.md), are the highest level of permissions in Power BI. These permissions override permissions that are given to a specific item in the workspace folder.

The table below lists the four types of folder roles. It shows each role's level, and the code string returned by the Power BI REST APIs. Admin is the highest workspace permission level, and viewer is the lowest. Every permission level includes the capabilities of the permissions below it. You can review the capabilities of each permission in [Workspace roles](../../collaborate-share/service-roles-new-workspaces.md#workspace-roles).

|Folder Role |Level |Permissions               |
|------------|------|--------------------------|
|Admin       |4     |`ReadWriteReshareExplore` |
|Member      |3     |`ReadReshareExplore`      |
|Contributor |2     |`ReadExplore`             |
|Viewer      |1     |`Read`                    |

>[!NOTE]
>The *write* permission is applied to Power BI items created by *admin*, *member* and *contributor* users in a workspace they own. The write permission can be granted or deleted using workspace permissions only. It cannot directly be granted to, or deleted from, a Power BI item.

#### Get and add workspace permissions with APIs

To get and add workspace permissions programmatically, you can use these APIs:

* [Groups - Add Group User](/rest/api/power-bi/groups/add-group-user) - A POST API for adding workspace permissions

* [Groups - Update Group User](/rest/api/power-bi/groups/update-group-user) - A PUT API for changing workspace permissions

*  [Groups - Get Group Users](/rest/api/power-bi/groups/get-group-users) - A GET API for getting workspace permissions

### Item permissions

Power BI items, such as reports, datasets, and dashboards have their own permissions. Item permissions cannot override workspace permissions, and can only be granted by someone who has at least the same permission level.

## Dataset permissions and REST APIs

Dataset permissions are part of the [item permissions](#item-permissions). The table below lists  the Power BI dataset permissions and their representation in the [Power BI REST APIs](/rest/api/power-bi/).

>[!TIP]
>Although the API permissions are identical to the Power BI service permissions, [build](#build-permissions-and-rest-apis) permissions are referred to as *explore* permissions in the APIs.

|Permission             |Read     |Explore  |Reshare  |
|-----------------------|---------|---------|---------|
|Description            |Allows the user to read the content of the dataset|Equivalent to [build permissions](#build-permissions-and-rest-apis) |Allows the user to share the content of the dataset with other users who will get read, reshare, or explore permissions for it |
|**ReadReshareExplore** |✔️       |✔️      |✔️       |
|**ReadReshare**        |✔️       |❌      |✔️       |
|**ReadExplore**        |✔️       |✔️      |❌       |
|**Read**               |✔️       |❌      |❌       |

>[!NOTE]
>To allow a user to perform write operations on a dataset, you need to change the [workspace permissions](#workspace-permissions).

### Build permissions and REST APIs

In the [Power BI REST APIs](/rest/api/power-bi/), the build permission is returned as *explore*. For example, a string with the *read*, *reshare* and *build* permissions, will look like this: `ReadReshareExplore`.

When you give a user the build permission, the user can build new content on your dataset. Examples for such content are reports, dashboards, pinned tiles from Q&A, paginated reports, and Insights Discovery.

Users also need build permissions to work with data outside Power BI:

* To export the underlying data.

* To build new content on the dataset such as with Analyze in Excel.

* To access the data via the XMLA endpoint.

### Row-level security

When you add or change permissions on a dataset that uses row-level security (RLS), any permissions higher than build will enable the user to view all the data in the dataset. Build, and permissions lower than build, will let the dataset user have access only to the data they're allowed to see as configured in your RLS settings.

### Dataset APIs for changing permissions

To add permissions for using datasets, use the POST APIs listed below. Using these APIs, you can add dataset permissions to users that don't have any permissions for the specified dataset, or to users that have a lower permissions level. For example, you can add the *Reshare* permission to a user that has the *Read* permission. However, you cannot remove the *Reshare* permission from a user that has both *Read* and *Reshare* permissions, by attempting to add the *Read* permission.

* [Datasets - Post Dataset User](/rest/api/power-bi/datasets/post-dataset-user)

* [Datasets - Post Dataset User In Group](/rest/api/power-bi/datasets/post-dataset-user-in-group)

### Limitations

These limitations are relevant for the [Datasets - Post Dataset User](/rest/api/power-bi/datasets/post-dataset-user) and [Datasets - Post Dataset User In Group](/rest/api/power-bi/datasets/post-dataset-user-in-group) APIs.

* The API caller must have at least ReadReshare permissions on the dataset.

* The API caller cannot grant permissions that are higher than his permissions for the dataset.

* Write permissions cannot be granted.

* These APIs only support datasets that were created in the [new workspace experience](/collaborate-share/service-new-workspaces). Datasets that reside on the classic workspace are not supported.

* These APIs only support users and groups. Service principals are not supported.

* You cannot use these APIs to remove dataset permissions.

## Next steps

>[!div class="nextstepaction"]
>[Power BI REST APIs](/rest/api/power-bi/).

>[!div class="nextstepaction"]
>[Push datasets](/rest/api/power-bi/push-datasets).
