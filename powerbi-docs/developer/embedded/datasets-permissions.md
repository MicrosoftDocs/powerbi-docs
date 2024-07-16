---
title: Power BI REST APIs semantic model permissions
description: This article lists the Power BI REST APIs semantic model permissions
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
editor: ''
tags: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: reference
ms.date: 11/09/2023
---

# Semantic model REST API permissions

This article describes Power BI permissions in general, and semantic model permissions in the context of the [Power BI REST APIs](/rest/api/power-bi/).

## Power BI permissions

Power BI has two sets of permissions:

* [Workspace permissions](#workspace-permissions)

* [Item permissions](#item-permissions)

### Workspace permissions

Workspace permissions, also known as folder permissions or [roles](../../collaborate-share/service-roles-new-workspaces.md), are the highest level of permissions in Power BI. These permissions override permissions that are given to a specific item in the workspace folder.

The table below lists the four types of folder roles. It shows each role's level, and the code string returned by the Power BI REST APIs. Admin is the highest workspace permission level, and viewer is the lowest. Every permission level includes the capabilities of the permissions below it. You can review the capabilities of each permission in [Workspace roles](../../collaborate-share/service-roles-new-workspaces.md#workspace-roles).

|Folder Role |Level |Derived permissions for semantic models created in the workspace |
|------------|------|--------------------------|
|Admin       |4     |`ReadWriteReshareExplore` |
|Member      |3     |`ReadWriteReshareExplore` |
|Contributor |2     |`ReadWriteExplore`        |
|Viewer      |1     |`Read`                    |

>[!NOTE]
>The *write* permission is applied to Power BI semantic models created by *admin*, *member* and *contributor* users in a workspace they own. The write permission can be granted or deleted using workspace permissions only. It cannot directly be granted to, or deleted from, a Power BI item.

#### Get and add workspace permissions with APIs

To get and add workspace permissions programmatically, use these APIs:

* [Groups - Add Group User](/rest/api/power-bi/groups/add-group-user) - A POST API for adding workspace permissions

* [Groups - Update Group User](/rest/api/power-bi/groups/update-group-user) - A PUT API for changing workspace permissions

* [Groups - Get Group Users](/rest/api/power-bi/groups/get-group-users) - A GET API for getting workspace permissions

### Item permissions

Power BI items, such as reports, semantic models, and dashboards have their own permissions. Item permissions can't override workspace permissions, and can only be granted by someone who has at least the same level of permission.

## Semantic model permissions and REST APIs

Semantic model permissions are part of the [item permissions](#item-permissions). The table below lists the Power BI semantic model permissions and their representation in the [Power BI REST APIs](/rest/api/power-bi/).

>[!TIP]
>Although the API permissions are identical to the Power BI service permissions, [`build`](#build-permissions-and-rest-apis) permissions are referred to as *explore* permissions in the APIs.

|Permission             |Read     |Explore  |Reshare  |
|-----------------------|---------|---------|---------|
|Description            |Allows the user to read the content of the semantic model|Equivalent to [build permissions](#build-permissions-and-rest-apis) |Allows the user to share the content of the semantic model with other users who will get read, reshare, or explore permissions for it |
|**ReadReshareExplore** | :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::     |:::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::       |:::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::        |
|**ReadReshare**        |:::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::        |:::image type="icon" source="../../includes/media/no-icon.svg" border="false":::      |:::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::        |
|**ReadExplore**        |:::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::        |:::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::       |:::image type="icon" source="../../includes/media/no-icon.svg" border="false":::       |
|**Read**               |:::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::        |:::image type="icon" source="../../includes/media/no-icon.svg" border="false":::      |:::image type="icon" source="../../includes/media/no-icon.svg" border="false":::       |

>[!NOTE]
>To allow a user to perform write operations on a semantic model, first change the [workspace permissions](#workspace-permissions).

### Build permissions and REST APIs

In the [Power BI REST APIs](/rest/api/power-bi/), the `build` permission is returned as *explore*. For example, a string with the *read*, *reshare* and *build* permissions, will look like this: `ReadReshareExplore`.

When you give a user `build` permission, they can build new content on your semantic model. Examples of content they can build are reports, dashboards, pinned tiles from Q&A, paginated reports, and Insights Discovery.

Users also need `build` permissions to work with data outside Power BI:

* To export the underlying data.

* To build new content on the semantic model such as with Analyze in Excel.

* To access the data via the XMLA endpoint.

### Row-level security

For a semantic model that uses row-level security (RLS), any permissions *higher* than `build` will enable the user to view all the data in the semantic model. `Build`, and permissions lower than `build`, will only give the semantic model user access to the data they're allowed to see as configured in your RLS settings.

### Get and update semantic model permissions with APIs

* POST APIs let you add new permissions to a semantic model. You can use these APIs to add permissions for users but not to remove permissions. For example, you can add the `Reshare` permission to a user that has the `Read` permission. However, you can't remove the `Reshare` permission from a user that has both `Read` and `Reshare` permissions, by attempting to add the `Read` permission.

  * [Datasets - Post Dataset User](/rest/api/power-bi/datasets/post-dataset-user)
  * [Datasets - Post Dataset User In Group](/rest/api/power-bi/datasets/post-dataset-user-in-group)

* PUT APIs update the user’s permissions to a given dataset. The PUT API can't be used for changing write permissions or any folder level inherited permissions. This API also supports removing all permissions for a dataset for a given target.

  * [Datasets - Put Dataset User](/rest/api/power-bi/datasets/put-dataset-user)
  * [Datasets - Put Dataset User In Group](/rest/api/power-bi/datasets/put-dataset-user-in-group)

* GET APIs return a list of principals that have access to the specified dataset.

  * [Datasets - Get Dataset Users](/rest/api/power-bi/datasets/get-dataset-users)
  * [Datasets - Get Dataset Users In Group](/rest/api/power-bi/datasets/get-dataset-users-in-group)

## Considerations and limitations

Each of the above APIs comes with certain limitations regarding who can use them and how. To see the limitations of each API, select the link for that API.

## Related content

* [Power BI REST APIs](/rest/api/power-bi/).
* [Push datasets](/rest/api/power-bi/push-datasets).
