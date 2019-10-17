---
title: Data lineage (preview)
description: In modern business intelligence (BI) projects, understanding the flow of data from the data source to its destination is a key challenge for many customers.
author: paulinbar
manager: kfile
ms.reviewer: 

ms.service: powerbi
ms.topic: conceptual
ms.date: 10/03/2019
ms.author: painbar

LocalizationGroup: 
---
# Data lineage (preview)
In modern business intelligence (BI) projects, understanding the flow of data from the data source to its destination can be a challenge. The challenge is even bigger if you have built advanced analytical projects spanning multiple data sources, artifacts, and dependencies.  Questions like "What happens if I change this data?" or "Why isn’t this report up to date?" can be hard to answer. They may require a team of experts or deep investigation to understand. We designed data lineage view to help you answer these questions.

[ ![Power BI lineage view](media/service-data-lineage/power-bi-lineage-view-cropped.png) ](media/service-data-lineage/power-bi-lineage-view-full-size.png#lightbox)
 
Power BI has several artifact types, such as dashboards, reports, datasets, and dataflows. Many datasets and dataflows connect to external data sources such as SQL Server, and to external datasets in other workspaces. When a dataset is external to a workspace you own, it may be in a workspace owned by someone in IT or another analyst. External data sources and datasets make it harder to know where the data is coming from, ultimately. For complex projects and for simpler ones, we introduce lineage view. 

In lineage view, you see the lineage relationships between all the artifacts in a workspace, and all its external dependencies. Dataflows already had a diagram view, and lineage view expands that view. It shows connections between all workspace artifacts, including connections to dataflows, both upstream and downstream. The separate dataflows diagram view is going away starting in November.

## Explore lineage view

Every workspace, whether new or classic, automatically has a lineage view, except My Workspace. You do need at least a Contributor role in the workspace to view it. See [Permissions](#permissions) in this article for details. 

- To access lineage view, go to the workspace list view. Tap the arrow next to **List view** and select **Lineage view**.

    [ ![Switch to lineage view](media/service-data-lineage/power-bi-lineage-list-view-cropped.png) ](media/service-data-lineage/power-bi-lineage-list-view.png#lightbox)

    In this view, you see all the workspace artifacts and how the data flows from one to another.

**Data sources**

You see the data sources from which the datasets and dataflows get their data. On the data source cards, you see more information that can help identify the source. For example, for Azure SQL server you also see the database name.

![Lineage view data source with no gateway](media/service-data-lineage/power-bi-lineage-data-source-no-gateway.png)
 
**Gateways**

If a data source is connected via an on-premises gateway, the gateway information is added to the data source card. If you have permissions as either gateway admin or as a data source user, you see more information, such as the gateway name.

![Lineage view data source with gateway](media/service-data-lineage/power-bi-lineage-data-source-with-gateway.png)

**Datasets and dataflows**
 
On datasets, you see the last refresh time, and if a dataset is certified or promoted.

![Certified dataset in lineage view](media/service-data-lineage/power-bi-lineage-external-certified-dataset.png)
 
If a report in the workspace is built on a dataset in another workspace, you see the source workspace name on the dataset card. Select the source workspace name to go to that workspace.
 
- For any artifact, select the ellipsis (...) to view the options menu. It features all the same actions available in list view.
  
To see more metadata on datasets, select the dataset card itself. Additional information on the dataset is displayed in a side pane.

![Side pane with more information](media/service-data-lineage/power-bi-lineage-side-pane.png)
 
## Show lineage for any artifact 

Say you want to see the lineage for a specific artifact.

- Select the double arrows under an artifact.

    [ ![Highlight lineage for a specific artifact](media/service-data-lineage/power-bi-lineage-highlight-cropped.png) ](media/service-data-lineage/power-bi-lineage-highlight-full-size.png#lightbox)

    Power BI highlights all the artifacts related to that artifact, and dims the rest. 

## Navigation and full screen 

Lineage view is an interactive canvas. You can use the mouse and touchpad to navigate in the canvas, and zoom in or out.  

- To zoom in and out, either use the menu in the bottom-right corner, or your mouse or touchpad. 

- To have more room for the graph itself, use the full screen option on the bottom-right corner. 

    ![Zoom in or out, or full screen](media/service-data-lineage/power-bi-lineage-zoom-full-screen.png)

## Permissions

- You need a Power BI Pro license to see lineage view.
- Lineage view is available only to users with access to the workspace.
- Users have to have an Admin, Member, or Contributor role in the workspace. Users with on a Viewer role can't switch to lineage view.

## Considerations and limitations

Lineage view isn't available on Internet Explorer. See [Supported browsers for Power BI](power-bi-browsers.md) for details.

## Next steps

- [Intro to datasets across workspaces (preview)](service-datasets-across-workspaces.md)
