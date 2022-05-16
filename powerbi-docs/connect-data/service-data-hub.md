---
title: Data hub
description: Learn about the Data hub, a centralized place for finding data.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 03/17/2022
LocalizationGroup: Share your work
---
# Data hub

The data hub makes it easy to find, explore, and use the data in your organization. It provides information about data resources such as datasets and datamarts, as well as entry points for creating reports on top of those data resources, or for using those data resources with Analyze in Excel.

This article explains what you see on the data hub and describes how to use it.

## Find the data you need

The dataset discovery experience starts on the data hub. To get to the data hub:
* In the Power BI service: Select **Data hub** in the navigation pane.
* In the Power BI app in Teams: Select either the **Data hub** tab or **Data hub** in the navigation pane.

## What data resources do I see in the data hub?

# [Datasets](#tab/datasets)

* Datasets that you have at least [build permission](service-datasets-build-permissions.md) for.
* Datasets that you have [read-only permission](#read-only-permission-for-datasets) for. With read-only permission you have limited access to dataset info and capabilities. You can [request build permission](#read-only-permission-for-datasets) for more complete access to the dataset. 
* Datasets that have been made [discoverable](../collaborate-share/service-discovery.md) for you. Discoverable datasets appear grayed out. While you can find them, you need to [request access](#discoverable-datasets) in order to be able to access dataset info and capabilities.

# [Datamarts](#tab/datamarts)

* Datamarts that you have at least [build permission](service-datasets-build-permissions.md) for.
* Datamarts that have been made [discoverable](../collaborate-share/service-discovery.md) for you. Discoverable datamarts appear grayed out. While you can find them, you need to [request access](#discoverable-datasets) in order to be able to access datamart details and capabilities.

---

For a data resource to show up in the data hub, it must be located in a [new workspace experience](../collaborate-share/service-new-workspaces.md).

If you're a free user, see [Users with free licenses](#users-with-free-licenses) for details about viewing data resources and using the capabilities available on the data hub.

>[!NOTE]
> To be fully functional, the data hub requires that the [Use datasets across workspaces](../admin/service-admin-portal-workspace.md#use-datasets-across-workspaces) admin setting be enabled. If this setting is not enabled, you won't be able to access the data resources you see listed in the data hub unless you have an Admin, Member, or Contributor role in the workspace where the dataset is located.

## The data hub page

The dataset discovery experience starts on the data hub. To get to the data hub:
* In the Power BI service: Select **Data hub** in the navigation pane.
* In the Power BI app in Teams: Select either the **Data hub** tab or **Data hub** in the navigation pane.

The image below shows the data hub in the Power BI service.

![Screenshot of data hub.](media/service-datasets-hub/datasets-hub-main-page.png)

1. Click to view the data resource's details page.
1. Click to display options menu.
1. Click to view details summary.
1. A greyed-out icon indicates that you don't have permissions to access that data resource's details page. Data resources with greyed-out icons only show up for you in the list if [data discoverability](../collaborate-share/service-discovery.md) is enabled for you).
1. Click to request access.
1. Hover to view data resource description.

The sections below describe these sections and the actions you can perform.

## Recommended data

Recommended data resources are endorsed data resources (promoted or certified) that are presented to you based on a calculation that takes into account how recently they've been refreshed and how recently you've visited reports and/or dashboards that are related to them.

## Data resource list

The data resource list shows you data resources in the organization that you are [allowed to find](#what-datasets-do-i-see-in-the-datasets-hub).

The list has three tabs to filter the list of data resources.
* **All**: Shows all the data resources that you are [allowed to find](#what-datasets-do-i-see-in-the-datasets-hub).
* **My data**: Shows all the data resources that you are the owner of.
* **Trusted in your org**: Shows all the endorsed data resources in your organization that you are [allowed to find](#what-datasets-do-i-see-in-the-datasets-hub). Certified data resources are listed first, followed by promoted data resources.

Use the search box and filters to narrow down the lis of items. You can use type into the Filter by Keyword box to search for a particular string, or you can use the filters to display only the selected data resource types.

The columns of the list are described below. Click on a column header to sort by that column. 
* **Name**: The dataset name. Click the dataset name to open the dataset details page.
* **Endorsement**: Endorsement status.
* **Owner**: Dataset owner (All and Trusted in your org tabs only).
* **Workspace**: The workspace the dataset is located in.
* **Refreshed**: Last refresh time (rounded to hour, day, month, and year. See the dataset info on the dataset detail page for exact time of last refresh).
* **Next refresh**: The time of the next scheduled refresh (My datasets tab only).
* **Sensitivity**: Sensitivity, if set. Click on the info icon to view the sensitivity label description.

## Read-only permission for datasets

You get read-only permission on a dataset when someone shares a report or dataset with you but doesn’t grant you build permission on the dataset.

With read-only access, you can view some information about the dataset on the dataset hub and on the dataset's info page, as well as perform a limited number of actions on the dataset, but you can’t build new content based on the dataset. To be able to create content based on the dataset, or to perform other actions, you must have at least [build permissions](service-datasets-build-permissions.md) on the dataset.

To request build permission on a dataset, do one of the following:

* From the datasets hub: Find the dataset in the datasets list, hover over it with the mouse, and click the **Request access** icon that appears

    :::image type="content" source="media/service-datasets-hub/datasets-request-access-icon.png" alt-text="Request access icon on the datasets hub.":::

* From the dataset info page, click the **Request access** button at the top right corner of the dataset info page.

    :::image type="content" source="media/service-datasets-hub/datasets-request-access-button.png" alt-text="Request access icon on the datasets info page.":::

## Users with free licenses

Users with free licenses are known as free users. Free users can see all the datasets in their "My workspace", and most datasets hub capabilities will be available to them on those datasets, with the exception of **Share**, **Save a copy**, **Manage permissions**, and **Create from template**.

For datasets in other workspaces, free users can see all the datasets that have been shared with them and that they have sufficient permissions to access, but they won’t be able to use most of the dataset hub’s capabilities on those datasets unless the dataset they're working on is hosted in a Premium capacity. In that case more capabilities will be available.

See the [free users feature list](../consumer/end-user-features.md#feature-list) for a detailed list of the actions free users can perform on datasets in the datasets hub and on the dataset details page.

To be able to perform all available dataset actions, a free user needs an upgraded license, in addition to any necessary access permissions. When a free user tries to perform an action that is not available under the terms of the free user license, a pop-up message gives them the opportunity to upgrade their license. If a Power BI administrator has approved automatic upgrade, the upgrade happens automatically.

## Discoverable datasets

Dataset owners can make it possible for you to find a their dataset without actually granting you access to it by making it [discoverable](../collaborate-share/service-discovery.md). Discoverable datasets appear grayed out in the list of datasets, and you don't have access to the dataset's info page or capabilities. To see dataset info and to be able to use the dataset, you can request access.

To request access, on the datasets hub, hover the mouse over the desired "discoverable" dataset and then click the **Request access** icon that appears

:::image type="content" source="media/service-datasets-hub/datasets-request-access-icon-discoverable.png" alt-text="Request access icon for discoverable datasets.":::
 
## Next steps
* [Use datasets across workspaces](service-datasets-across-workspaces.md)
* [Create reports based on datasets from different workspaces](service-datasets-discover-across-workspaces.md)
* [Endorse your dataset](../collaborate-share/service-endorse-content.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
