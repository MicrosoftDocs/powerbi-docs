---
title: Data lineage (Preview)
description: In modern business intelligence (BI) projects, understanding the flow of data from the data source to its destination is a key challenge for many customers.
author: maggiesMSFT
manager: kfile
ms.reviewer: 

ms.service: powerbi
ms.topic: conceptual
ms.date: 09/11/2019
ms.author: maggies

LocalizationGroup: 
---
# Data lineage (Preview)
In modern business intelligence (BI) projects, understanding the flow of data from the data source to its destination can be a challenge. The challenge is even bigger if you have built advanced analytical projects spanning multiple data sources, artifacts, and dependencies.  Questions like "What happens if I change this data?" or "Why isn’t this report up to date?" can be hard to answer. They may require a team of experts or deep investigation to understand. Data lineage view is our way to answer these questions.

[update image]
 
Power BI has several artifact types, such as dashboards, reports, datasets, and dataflows. Many datasets and dataflows connect to external data sources such as SQL Server, and to external datasets in other workspaces. When a dataset is external to a workspace you own, it may be in a workspace owned by someone in IT or another analyst. External data sources and datasets make it harder to know where the data is coming from, ultimately. For complex projects and for simpler ones, we introduce Lineage view. 

In Lineage view, you see the lineage relationships between all the artifacts in a workspace, and all its external dependencies. Dataflows already had a diagram view, and Lineage view expands that view. It shows connections between all workspace artifacts, including connections to dataflows, both upstream and downstream. The separate dataflows diagram view is going away starting in November.

## Explore Lineage view

Every workspace automatically has a Lineage view, except My Workspace. You do need at least a Contributor role in the workspace. See [Permissions](#permissions) in this article for details. 

- To access Lineage view, go to List view in a workspace. Tap the arrow next to **List view** and select **Lineage view**.

[update image]

In this view, you see all the workspace artifacts and how the data flows from one to another.

[Add image of Lineage view]

**Data sources**

You see the data sources from which the datasets and dataflows get their data. On the data source nodes, you see more information that can help identify the source. For example, for Azure SQL server you also see the database name.
 
**Gateways**

If a data source is connected to an on-premises data source by way of a gateway, the gateway is represented as one of the nodes in Lineage view. If you have permissions as either gateway admin or as a data source user, you see more information, such as the gateway name.

**Datasets and dataflows**
 
On datasets you see the last refresh time, and if a dataset is certified or promoted.
 
If a report in the workspace is built on a dataset in another workspace, you see the source workspace name on the dataset card. Select the source workspace name to go to that workspace.
 
- For any artifact, select the ellipsis (...) to view the options menu. It features all the actions also available in list view.
  
To see more metadata on datasets, select the dataset node itself. Additional information on the dataset is displayed in a side pane.
 
## Show lineage for any artifact 

Say you want to see the lineage for a specific artifact.

- Select the double arrows under an artifact.

Power BI highlights all the artifacts related to that artifact, and dims the rest. 


## Permissions

- You need a Pro license to see Lineage view.
- Lineage view is available only to users with access to the workspace.
- Users have to have an Admin, Member, or Contributor role in the workspace. Users with on a Viewer role can't switch to Lineage view.

## Considerations and limitations

Lineage view isn't available on Internet Explorer. See [Supported browsers for Power BI](power-bi-browsers.md) for details.

## Next steps

- [Self-service data prep in Power BI](service-dataflows-overview.md)
- [Intro to datasets across workspaces (Preview)](service-datasets-across-workspaces.md)
