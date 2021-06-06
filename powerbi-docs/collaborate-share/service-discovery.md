---
title: Discovery
description: Learn about making endorsed content discoverable for users without access to it
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 06/07/2021
LocalizationGroup: Share your work
---
# Discoverability

Discoverability is a feature that makes it possible for users to find endorsed datasets that they don't have access to. Without discoverability, the full value of [endorsement](service-endorsement-overview.md), that is, directing users to quality data, is not fully realized.

## Discoverability overview

Endorsement is a way of telling users that a dataset is a trusted, quality source of data that they can safely use. However, in Power BI, endorsed datasets, like all other datasets, are only visible to those who have access to them. This makes it difficult for people without access to find these trusted sources of data. Not only do they not have access to an endorsed dataset, they don't know it exists, so they can't even request access.

To overcome this problem, users who have an [Admin or Member role](service-new-workspaces.md#roles-in-the-new-workspaces) in the workspace where a endorsed dataset resides can mark that dataset as discoverable. After the dataset has been marked as discoverable, it will be listed in the [datasets hub](../connect-data/service-datasets-hub.md), even for users who don't have access to it. They can then request [build permission](../connect-data/service-datasets-build-permissions.md) on the dataset by whatever [access request mechanism](../connect-data/service-datasets-build-permissions.md#configure-how-users-request-build-permission) has been provided.

## How to mark a dataset as discoverable

If you have an [Admin or Member role](service-new-workspaces.md#roles-in-the-new-workspaces) in the workspace where an endorsed dataset resides, you can mark that dataset as discoverable.

1. Go to dataset settings and open the **Endorsement and discovery** section.

1. In the dialog, select the **Make discoverable** checkbox.

![Screenshot of the Make discoverable checkbox in the dataset endorsement and discovery settings.](media/service-discovery/dataset-make-discoverable-checkbox.png)


 When a dataset is marked as discoverable, users who don't yet have access to it will be able to find it in the Datasets hub, and will be able to request access to it.

 when they promote or certify it.To see how to mark endorsed datasets as discoverable, refer to [Endorse your content](collaborate-share/service-endorse-content.md).

Power BI administrators: To see how to set up discoverability on your tenant, refer to [Discovery settings](../admin/service-admin-portal.md#discovery-settings).

## Next steps
* [Datasets hub](../connect-data/service-datasets-hub.md)
* [Endorsement](service-endorsement-overview.md)
* [Build permission for shared datasets](../connect-data/service-datasets-build-permissions.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)