---
title: Dataset discoverability
description: Learn how to make endorsed datasets discoverable for users who don't have access to them.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 02/17/2023
LocalizationGroup: Share your work
---
# Dataset discoverability

*Discoverability* is a feature that makes it possible for users to find endorsed datasets that they don't have access to. Without discoverability, the full value of [endorsement](service-endorsement-overview.md), that is, directing users to quality data, isn't fully realized.

## Discoverability overview

*Endorsement* is a way of telling users that a dataset is a trusted, quality source of data that they can safely use. However, in Power BI, endorsed datasets, like all other datasets, are only visible to users who have access to them. This makes it difficult for people without access to find these trusted sources of data. Not only do they not have access to an endorsed dataset, they don't know it exists, so they can't even request access.

To overcome this problem, authorized users who have an [Admin or Member role](service-roles-new-workspaces.md) in the workspace where an endorsed dataset resides can mark that dataset as discoverable. After the dataset has been marked as discoverable, it will be listed in the [data hub](../connect-data/service-data-hub.md), even for users who don't have access to it. They can then request [build permission](../connect-data/service-datasets-build-permissions.md) on the dataset by whatever [access request mechanism](../connect-data/service-datasets-build-permissions.md#configure-how-users-request-build-permission) is provided.

To be operable in an organization, dataset discovery must be set up by a Power BI administrator. See [How to set up dataset discoverability in an organization](#how-to-set-up-dataset-discovery-in-an-organization).

## How to mark a dataset as discoverable

If you have an [Admin or Member role](service-roles-new-workspaces.md) in the workspace where an endorsed dataset resides, you can mark that dataset as discoverable.

1. Go to dataset settings and open the **Endorsement and discovery** section.

1. In the dialog, select the **Make discoverable** checkbox. The checkbox will only be active if the dataset is promoted or certified.

    :::image type="content" source="media/service-discovery/dataset-make-discoverable-checkbox.png" alt-text="Screenshot of the Make discoverable checkbox under dataset settings.":::

When a dataset is marked as discoverable, users who don't yet have access to it can find it in the Datasets hub and request access to it.

## How to set up dataset discovery in an organization

You must be a Power BI administrator to set up dataset discoverability in your organization.

Go to  **Admin portal > Tenant settings > Discovery settings** and configure the following settings:

* **Make promoted content discoverable**: When you enable this setting, users you specify who have sufficient permissions to promote content can also mark that content as discoverable. You can also specify users and/or groups to exclude from the permitted, specified groups. 

* **Make certified content discoverable**: When you enable this setting, users you specify who are authorized to certify content can also mark that content as discoverable. You can also specify users and/or groups to exclude from the permitted, specified groups.

* **Discover content**: When you enable this setting, users you specify can find endorsed content that's marked as discoverable, even if they don't yet have access to it. You can also specify users and/or groups to exclude from the permitted, specified groups.

## Next steps
* [Data discovery using the data hub](../connect-data/service-data-hub.md)
* [Endorsement: Promoting and certifying Power BI content](service-endorsement-overview.md)
* [Build permission for shared datasets](../connect-data/service-datasets-build-permissions.md)
* Questions? [Ask the Power BI Community](https://community.powerbi.com/)