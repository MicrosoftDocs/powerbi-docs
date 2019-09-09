---
title: Data lineage (Preview)
description: In modern BI projects, understanding the flow of data from the data source to its destination is a key challenge for many customers.
author: maggiesMSFT
manager: kfile
ms.reviewer: 

ms.service: powerbi
ms.topic: conceptual
ms.date: 09/09/2019
ms.author: maggies

LocalizationGroup: 
---
# Data lineage (Preview)
In modern business intelligence (BI) projects, understanding the flow of data from the data source to its destination can be a key challenge. The challenge becomes even bigger if you have built advanced analytical projects spanning multiple data sources, artifacts, and dependencies.  Questions like "What happens if I change this data?" or "Why isn’t this report up to date?" are difficult to answer. They sometimes require a team of experts or deep investigation to understand.

[update image]
 
Power BI has several artifact types, such as dashboards, reports, datasets and dataflows. Many datasets and dataflows connect to external data sources such as SQL Server, and to external datasets in other workspaces. When datasets are external, often someone in IT or another analyst owns the dataset isn't the same person as the analyst who creates the reports on top of it.
Power BI allows multiple users and multiple artifact projects that span workspaces. For complex projects and for simpler ones, we introduce Lineage view. 

In Lineage view, you see the lineage relationships between all the artifacts in a workspace and all its external dependencies. Dataflows already had a diagram view. Lineage view expands on that view. It shows connections between all workspace artifacts, including connections to dataflows, both upstream and downstream. The separate dataflows diagram view (add link to doc) is going away starting in November.

## Get started
Lineage view works automatically for any workspace other than My Workspace. You do need at least a Contributor role in the workspace. See [Permissions](#permissions) in this article for details. 

1. To access Lineage view, go to List view in a workspace. Tap the arrow next to List view to go to Lineage view.

[update image]

You see all the workspace artifacts and how they are connected to one another.

[Add image of Lineage view]

You can also see the data sources from which the datasets and dataflows get their data. On the data source nodes you can see some more information that can assist you to identify the source. For example, for Azure SQL server you also see the database name.
 
If a data source is connected via on-prem gateway you see the gateway name. You need to have permissions as either gateway admin or as a data source user.
 
On datasets you can see the last refresh time, and if a dataset is certified or promoted.
 
If a report in the workspace is built on a dataset in another workspace, then you see the source workspace name on the dataset card. Select the source workspace name to navigate to the external workspace.
 
For datasets and dataflows, select the ellipsis (...) to view the options menu. It features all the actions available in list view.
  
To see more metadata on datasets, select the dataset node. Additional information on the dataset is displayed in a side pane.
 
## Highlight 

Say you want to see the lineage for a specific artifact. 

- Select the double arrows under an artifact.

Power BI highlights all the related artifacts and dims the rest. 


## Permissions

- You need a Pro license to see Lineage view.
- Lineage view is available only to users with access to the workspace.
- Users have to have an Admin, Member, or Contributor role in the workspace. Users with on a Viewer role can't switch to Lineage view.

## Considerations and limitations

Lineage view isn't available on Internet Explorer. See [Supported browsers for Power BI](consumer/end-user-browsers.md) for details.

## Next steps

- [Self-service data prep in Power BI](service-dataflows-overview.md)
- [Intro to datasets across workspaces (Preview)](service-datasets-across-workspaces.md)
