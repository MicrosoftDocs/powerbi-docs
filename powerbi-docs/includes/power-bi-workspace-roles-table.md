---
title: Power BI workspace roles
description: Power BI workspace roles table
services: powerbi
author: maggiesMSFT

ms.service: powerbi
ms.topic: include
ms.date: 02/17/2021
ms.author: maggies
ms.custom: include file
---

|Capability   | Admin  | Member  | Contributor  | Viewer |
|---|---|---|---|---|
| Update and delete the workspace.  | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |   |   |   | 
| Add/remove people, including other admins.  |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |   |   |   |
| Allow Contributors to update the app for the workspace  |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |   |   |   |
| Add members or others with lower permissions.  |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |   |   |
| Publish, unpublish, and change permissions for an app |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |   |   |
| Update an app. |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |  If allowed <sup>1</sup>  |   |
| Share an item or share an app.<sup>2</sup> |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |   |   |
| Allow others to reshare items.<sup>2</sup> |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |   |   |
| Feature apps on colleagues' Home |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |   |   |
| Manage dataset permissions.<sup>3</sup> | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |  |  |
| Feature dashboards and reports on colleagues' Home |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |   |
| Create, edit, and delete content in the workspace.  |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |   |
| Publish reports to the workspace, delete content.  |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |   |
| Create a report in another workspace based on a dataset in this workspace.<sup>2</sup> |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |   |
| Copy a report.<sup>3</sup> | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |  |
| Create goals based on a dataset in the workspace.<sup>3</sup> | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |  |
| Schedule data refreshes via the on-premises gateway.<sup>4</sup> | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |  |
| Modify gateway connection settings.<sup>4</sup> | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |  |
| View and interact with an item.<sup>5</sup> |  ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png)  |
| Read data stored in workspace dataflows | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) | ![Yes checkmark](media/power-bi-workspace-roles-table/green-checkmark.png) |

<sup>1</sup> Contributors can [update the app associated with the workspace](../collaborate-share/service-create-the-new-workspaces.md#allow-contributors-to-update-the-app), if the workspace Admin delegates this permission to them. However, they can't publish a new app or change who has permission to it.

<sup>2</sup> Contributors and Viewers can also share items in a workspace if they have Reshare permissions.

<sup>3</sup> To copy a report, and to create a report in another workspace based on a dataset in this workspace, you need [Build permission for the dataset](../connect-data/service-datasets-build-permissions.md). For datasets in this workspace, the people with Admin, Member, and Contributor roles automatically have Build permission through their workspace role.

<sup>4</sup> Keep in mind that you also need permissions on the gateway. Those permissions are managed elsewhere, independent of workspace roles and permissions. See [Manage an on-premises gateway](/data-integration/gateway/service-gateway-manage) for details.

<sup>5</sup> Even if you don't have a Power BI Pro license, you can view and interact with items in the Power BI service if the items are in a workspace in a Premium capacity.
