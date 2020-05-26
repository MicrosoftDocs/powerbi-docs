---
title: Power BI workspace roles
description: Power BI workspace roles table
services: powerbi
author: maggiesMSFT

ms.service: powerbi
ms.topic: include
ms.date: 05/26/2020
ms.author: maggies
ms.custom: include file
---

Here are the capabilities of the four roles: admins, members, contributors, and viewers. All of these capabilities, except viewing and interacting, require a Power BI Pro license.

|Capability   | Admin  | Member  | Contributor  | Viewer |
|---|---|---|---|---|
| Update and delete the workspace.  |  |   |   |   | 
| Add/remove people, including other admins.  | :::image type="icon" source="media/power-bi-workspace-roles-table/green-checkmark.png" border="false":::  |   |   |   |
| Add members or others with lower permissions.  |  X | X  |   |   |
| Publish and update an app. |  X | X  |   |   |
| Share an item or share an app.<sup>1</sup> |  X | X  |   |   |
| Allow others to reshare items.<sup>1</sup> |  X | X  |   |   |
| Feature apps on colleagues' Home |  X | X  |   |   |
| Feature dashboards and reports on colleagues' Home |  X | X  | X |   |
| Create, edit, and delete content in the workspace.  |  X | X  | X  |   |
| Publish reports to the workspace, delete content.  |  X | X  | X  |   |
| Create a report in another workspace based on a dataset in this workspace.<sup>2</sup> |  X | X  | X  |   |
| Copy a report.<sup>2</sup> | X | X | X |  |
| Schedule data refreshes via the on-premises gateway.<sup>3</sup> | X | X | X |  |
| Modify gateway connection settings.<sup>3</sup> | X | X | X |  |
| View and interact with an item.<sup>4</sup> |  X | X  | X  | X  |
| Read data stored in workspace dataflows | X | X | X | X |

<sup>1</sup> Contributors and Viewers can also share items in a workspace if they have Reshare permissions.
<sup>2</sup> To copy a report, and to create a report in another workspace based on a dataset in this workspace, you need [Build permission for the dataset](../connect-data/service-datasets-build-permissions.md). For datasets in this workspace, the people with Admin, Member, and Contributor roles automatically have Build permission through their workspace role.
<sup>3</sup> Keep in mind that you also need permissions on the gateway. Those permissions are managed elsewhere, independent of workspace roles and permissions. See [Manage an on-premises gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-manage) for details.
<sup>4</sup> Even if you don't have a Power BI Pro license, you can view and interact with items in the Power BI service if the items are in a workspace in a Premium capacity.

