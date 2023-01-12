---
title: Dataset permissions
description: Describes dataset permissions and how they are acquired by users.
author: paulinbar
ms.author: painbar
ms.reviewer: ogetchie
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 11/08/2022
LocalizationGroup: Share your work
---
# Dataset permissions

This article describes dataset permissions in the Power BI service and how these permissions are acquired by users.

## What are the dataset permissions?

The table below describes the four levels of permission that control access to datasets in the Power BI service. It also describes the permissions that the dataset owner has on the dataset, and other actions that only the dataset owner can perform.

|Permission  |Description  |
|------------|-------------|
|Read        |Allows user to access reports and other solutions, such as composite models on Premium/PPU workspaces, that read data from the dataset.<br>Allows user to view dataset settings.|
|Build       |Allows user to build new content from the dataset, as well as find content that uses the dataset.<br>Allows user to access reports that access composite models on Power BI Pro workspaces.<br>Allows user to build composite models.<br>Allows user to pull the data into Analyze in Excel.<br>Allows querying using external APIs such as XMLA. |
|Reshare     |Allows user to grant dataset access. |
|Write       |Allows user to republish the dataset.<br>Allows user to [backup and restore the dataset](../enterprise/service-premium-backup-restore-dataset.md).<br>Allows user to make changes to the dataset via XMLA.<br>Allows user to edit dataset settings, except data refresh, credentials, and automatic aggregations.|
|Owner       |The dataset owner is not a permission per se, but rather a conceptual role that has all the permissions on a dataset. The first dataset owner is the person who created the dataset, and afterwards the last person to configure the dataset after taking it over in the dataset settings.<br><br>The dataset owner can do all of the things mentioned in the permissions above, as well as configure dataset refresh, credentials, and automatic aggregations.|

## How are the dataset permissions acquired?

### Permissions acquired implicitly via workspace role

A user's role in a workspace implicitly grants them permissions on the datasets in the workspace, as described in the following table.

|                                       |Admin  |Member  |Contributor  |Viewer |
|---------------------------------------|-------|--------|-------------|-------|
|**Read**                               |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::    |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::            |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::     |
|**Build**                              |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::            |:::image type="icon" source="../includes/media/no-icon.svg" border="false":::   |
|**Reshare**                            |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/no-icon.svg" border="false":::          |:::image type="icon" source="../includes/media/no-icon.svg" border="false":::   |
|**Write**                              |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::            |:::image type="icon" source="../includes/media/no-icon.svg" border="false":::   |

>[!NOTE]
>Permissions inherited via workspace role can only be changed or taken away from a user by changing or removing their role in the workspace. They can't be changed or removed explicitly using the [manage permissions page](service-datasets-manage-access-permissions.md).

### Permissions granted explicitly via the manage dataset permissions page

A user with an Admin or Member role in the workspace can explicitly grant permissions to other users using the [manage permissions page](service-datasets-manage-access-permissions.md).

### Permissions acquired via a link

When users share reports or datasets, links are created that provide permissions on the dataset. Users authorized to use those links will be able to access the dataset. Users with Admin or Member roles in the workspace where a dataset is located can manage these links on the [manage permissions page](service-datasets-manage-access-permissions.md#manage-links-generated-for-report-sharing).

### Permissions granted in an app

Users may acquire permissions on a dataset used in an app if the app owner allows this in the [app permissions configuration](../collaborate-share/service-create-distribute-apps.md#create-and-manage-audiences). 

### Permissions granted via REST APIs

Dataset permissions can be set via REST APIs. For more information, see [Dataset permissions in the context of the Power BI REST APIs](../developer/embedded/datasets-permissions.md).

## Dataset permissions and row-level security (RLS)

Row-level security may affect the ability of users with read or build permission on a dataset to read data from the dataset.

* When RLS **isn't** defined on the dataset, users with write, read, or build permission on the dataset can read data from the dataset.
* When RLS **is** defined on the dataset:
    * Users with only read or build permission on the dataset will not be able to read data from the dataset unless they belong to one of its RLS roles.
    * Users with write permission on the dataset will be able to read data from the dataset regardless of whether or not they belong to any of its RLS roles.

## Next steps
* [Share access to a dataset](./service-datasets-share.md)
* [Manage dataset permissions](service-datasets-manage-access-permissions.md)
* [Dataset permissions in the context of the Power BI REST APIs](../developer/embedded/datasets-permissions.md)
