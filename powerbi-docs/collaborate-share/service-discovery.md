---
title: Discovery
description: Learn about making endorsed content discoverable for users without access to it
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 06/02/2021
LocalizationGroup: Share your work
---
# Discoverability

Discoverability is a feature that makes it possible for users to find endorsed datasets that they don't have access to. Without discoverability, the full value of [endorsement](service-endorsement-overview.md), that is, directing users to quality data, is not fully realized.

## Discoverability overview

Endorsement is a way of telling users that a dataset is a trusted, quality source of data that they can safely use. However, in Power BI, endorsed datasets, like all other datasets, are only visible to those who have access to them. This makes it difficult for people without access to find these trusted sources of data. Not only do they not have access to an endorsed dataset, they don't know it exists, so they can't even request access.

To overcome this problem, users who have an [Admin or Member role](service-new-workspaces.md#roles-in-the-new-workspaces) in the workspace where dataset resides can mark that dataset as discoverable when they promote or certify it. After the dataset has been marked as discoverable, it will be listed in the [datasets hub](../connect-data/service-datasets-hub.md), even for users who don't have access to it. They can then request [build permission](../connect-data/service-datasets-build-permissions.md) on the dataset by whatever [access request mechanism](../connect-data/service-datasets-build-permissions.md#configure-how-users-request-build-permission) has been provided.

To see how to mark endorsed datasets as discoverable, refer to [Endorse your content](collaborate-share/service-endorse-content.md).

Power BI administrators: To see how to set up discoverability on your tenant, refer to [Discovery settings](../admin/service-admin-portal.md#discovery-settings).

## Discovery settings

[Discoverability](../collaborate-share/service-discovery.md) is a feature that content owners can use to make their endorsed content discoverable by users who don't yet have access to it.

Discoverability on your tenant is controlled by three independent settings located in the discovery settings section of the tenant settings. To get to these settings, go to **Admin portal > Tenant settings > Discovery settings**.

### Make promoted content discoverable

When you enable this setting, users who can promote content will be able to mark their content as discoverable when they are promoting it. You can specify users and/or groups who will be able to mark their content as discoverable if they have the permissions to promote their content. You can also specify users and/or groups to exclude from the specified groups. 

### Make certified content discoverable

When you enable this setting, users who are authorized to certify content will be able to mark that content as discoverable when they are certifying it. You can specify users and/or groups who will be able to mark content as discoverable if they have the permissions to certify it. You can also specify users and/or groups to exclude from the specified groups. 

### Discover content

When you enable this setting, users will be able to find endorsed content that they don't yet have access to. You can specify users and/or groups who will be able to find discoverable content. You can also specify users and/or groups to exclude from the specified groups.

## Next steps
* [Datasets hub](../connect-data/service-datasets-hub.md)
* [Endorsement](service-endorsement-overview.md)
* [Build permission for shared datasets](../connect-data/service-datasets-build-permissions.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)