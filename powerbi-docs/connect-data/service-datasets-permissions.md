---
title: Semantic model permissions
description: Describes semantic model permissions and how they're acquired by users.
author: paulinbar
ms.author: painbar
ms.reviewer: ogetchie
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 07/17/2024
LocalizationGroup: Share your work
---
# Semantic model permissions

This article describes semantic model permissions in the Power BI service and how these permissions are acquired by users.

## What are the semantic model permissions?

The following table describes the four levels of user permissions that control access to semantic models in the Power BI service. The table also describes the semantic model owner permissions and other actions that only the semantic model owner can perform.

|Permission  |Description  |
|------------|-------------|
|Read        |Allows user to access reports and other solutions, such as composite models on Premium/PPU workspaces, that read data from the semantic model.<br>Allows user to view semantic model settings.|
|Build       |Allows user to build new content from the semantic model, and find content that uses the semantic model.<br>Allows user to access reports that access composite models on Power BI Pro workspaces.<br>Allows user to build composite models.<br>Allows user to pull the data into Analyze in Excel.<br>Allows querying using external APIs such as XMLA.<br>Allows user to see hidden data fields. |
|Reshare     |Allows user to grant semantic model access. |
|Write       |Allows user to republish the semantic model.<br>Allows user to [backup and restore the semantic model](../enterprise/service-premium-backup-restore-dataset.md).<br>Allows user to make changes to the semantic model via XMLA.<br>Allows user to edit semantic model settings, except data refresh, credentials, and automatic aggregations.|
|Owner       |The semantic model owner isn't a permission in itself, but rather a conceptual role that has all the permissions on a semantic model. The first semantic model owner is the person who created the semantic model, and afterwards the last person to configure the semantic model after taking it over in the semantic model settings.<br><br>In addition to the permissions that can be granted explicitly in this table, a semantic model owner can configure semantic model refresh, credentials, and automatic aggregations.|

>[!NOTE]
>Build permission is primarily a discoverability feature. It enables users to easily discover semantic models and build Power BI reports and other consumable items based on the discovered models, such as Excel PivotTables and non-Microsoft data visualization tools, using the XMLA endpoint. Users who have Read permission without Build permission can consume and interact with existing reports that have been shared with them. Granting Read permission without Build permission should not be relied upon to secure sensitive data. Users with Read permission, even without Build permission, are able to access and interact with data in the semantic model.

## How are the semantic model permissions acquired?

### Permissions acquired implicitly via workspace role

A user's role in a workspace implicitly grants them permissions on the semantic models in the workspace, as described in the following table.

|                                       |Admin  |Member  |Contributor  |Viewer |
|---------------------------------------|-------|--------|-------------|-------|
|**Read**                               |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::    |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::            |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::     |
|**Build**                              |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::            |:::image type="icon" source="../includes/media/no-icon.svg" border="false":::   |
|**Reshare**                            |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/no-icon.svg" border="false":::          |:::image type="icon" source="../includes/media/no-icon.svg" border="false":::   |
|**Write**                              |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::      |:::image type="icon" source="../includes/media/yes-icon.svg" border="false":::            |:::image type="icon" source="../includes/media/no-icon.svg" border="false":::   |

>[!NOTE]
>Permissions inherited via workspace role can only be changed or taken away from a user by changing or removing their role in the workspace. They can't be changed or removed explicitly using the [manage permissions page](service-datasets-manage-access-permissions.md).

### Permissions granted explicitly via the manage semantic model permissions page

A user with an Admin or Member role in the workspace can explicitly grant permissions to other users using the [manage permissions page](service-datasets-manage-access-permissions.md).

### Permissions acquired via a link

When users share reports or semantic models, links are created that provide permissions on the semantic model. Users authorized to use those links are able to access the semantic model. Users with Admin or Member roles in the workspace where a semantic model is located can manage these links on the [manage permissions page](service-datasets-manage-access-permissions.md#manage-links-generated-for-report-sharing).

### Permissions granted in an app

Users can acquire permissions on a semantic model used in an app if the app owner allows this in the [app permissions configuration](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences). 

### Permissions granted via REST APIs

Semantic model permissions can be set via REST APIs. For more information, see [Semantic model permissions in the context of the Power BI REST APIs](../developer/embedded/datasets-permissions.md).

## Semantic model permissions and row-level security (RLS)

Row-level security might affect the ability of users with read or build permission on a semantic model to read data from the semantic model.

* When RLS **isn't** defined on the semantic model, users with write, read, or build permission on the semantic model can read data from the semantic model.
* When RLS **is** defined on the semantic model:
    * Users with only read or build permission on the semantic model cannot read data from the semantic model unless they belong to one of its RLS roles.
    * Users with write permission on the semantic model are able to read data from the semantic model regardless of whether or not they belong to any of its RLS roles.

## Related content

* [Share access to a semantic model](./service-datasets-share.md)
* [Manage semantic model permissions](service-datasets-manage-access-permissions.md)
* [Semantic model permissions in the context of the Power BI REST APIs](../developer/embedded/datasets-permissions.md)
