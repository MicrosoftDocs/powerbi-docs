---
title: Data lineage
description: Learn how data lineage view helps you understand the flow of data from the data source to its destination.
author: paulinbar
ms.author: painbar
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: how-to
ms.date: 02/14/2023
ms.custom: video-RE4HmJG
LocalizationGroup: 
---

# Data lineage

In modern business intelligence (BI) projects, understanding the flow of data from the data source to its destination can be a challenge. The challenge is even bigger if you've built advanced analytical projects spanning multiple data sources, artifacts, and dependencies. Questions like "What happens if I change this data?" or "Why isn't this report up to date?" can be hard to answer. They might require a team of experts or deep investigation to understand. Power BI's data lineage view helps you answer these questions.

:::image type="content" source="media/service-data-lineage/service-data-lineage-view.png" alt-text="Screenshot of the data lineage view in Power BI.":::

Power BI has several artifact types, such as dashboards, reports, semantic models, and dataflows. Many semantic models and dataflows connect to external data sources such as SQL Server, and to external semantic models in other workspaces. When a semantic model is external to a workspace you own, it might be in a workspace owned by someone in IT or another analyst. External data sources and semantic models make it harder to know where the data is coming from, ultimately. For complex projects and for simpler ones, we introduce lineage view.

In lineage view, you see the lineage relationships between all the artifacts in a workspace, and all its external dependencies. It shows connections between all workspace artifacts, including connections to dataflows, both upstream and downstream.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4HmJG]

## Explore lineage view

Every workspace automatically has a lineage view. You need at least a *Contributor* role in the workspace to view it. See [Permissions](#permissions) in this article for details.

* To access lineage view, go to the workspace list view. Tap the arrow next to **View** and select **Lineage**.

    :::image type="content" source="media/service-data-lineage/service-data-lineage-view-select.png" alt-text="Screenshot of the lineage option in the View dropdown menu.":::

In this view, you see all the workspace artifacts and how the data flows from one artifact to another.

**Data sources**

You see the data sources from which the semantic models and dataflows get their data. On the data source cards, you see more information that can help identify the source. For example, for Azure SQL server, you also see the database name.

:::image type="content" source="media/service-data-lineage/service-data-lineage-data-source-card.png" alt-text="Screenshot of the lineage view data source with no gateway.":::

**Gateways**

If a data source is connected via an on-premises gateway, the gateway information is added to the data source card. If you have permissions, either as a gateway admin or as a data source user, you see more information, such as the gateway name.

:::image type="content" source="media/service-data-lineage/service-data-lineage-data-gateway-card.png" alt-text="Screenshot of the lineage view data source with a gateway.":::

**Semantic models and dataflows**

On semantic models and dataflows, you see the last refresh time, as well as if the semantic model or dataflow is certified or promoted.

:::image type="content" source="media/service-data-lineage/service-data-lineage-promoted-certified.png" alt-text="Screenshot of certified semantic models in lineage view.":::

If a report in the workspace is built on a semantic model or a dataflow that's located in another workspace, you see the source workspace name on the card of that semantic model or dataflow. Select the name of the source workspace to go to that workspace.

* For any artifact, select **More options (...)** to view the options menu. It features all the same actions that are available in list view.

To see more metadata on any artifact, select the artifact card itself. Additional information about the artifact is displayed in a side pane. In the following image, the side pane displays the metadata of a selected semantic model.

:::image type="content" source="media/service-data-lineage/service-data-lineage-side-pane.png" alt-text="Screenshot of the side pane with more information.":::

## Show lineage for any artifact 

Say you want to see the lineage for a specific artifact.

* Select the double arrows under the artifact.

    :::image type="content" source="media/service-data-lineage/service-data-lineage-specific-artifact.png" alt-text="Screenshot of highlighted lineage for a specific artifact.":::

   Power BI highlights all the artifacts related to that artifact, and dims the rest. 

## Navigation and full screen 

Lineage view is an interactive canvas. You can use the mouse and touchpad to navigate in the canvas, as well as to zoom in or out.

* To zoom in and out, use either the menu in the bottom-right corner or your mouse or touchpad.
* To have more room for the graph itself, use the full screen option at the bottom-right corner. 

    :::image type="content" source="media/service-data-lineage/service-data-lineage-zoom.png" alt-text="Screenshot of zoom in or out, or full screen options.":::

## Permissions

* You need a Power BI Pro license to see lineage view.
* Lineage view is available only to users with access to the workspace.
* Users must have an Admin, Member, or Contributor role in the workspace. Users with a Viewer role can't switch to lineage view.

## Considerations and limitations

* Lineage view isn't available in Internet Explorer. For more information, see [Supported browsers for Power BI](../fundamentals/power-bi-browsers.md).
* Correct display of semantic model<->dataflow lineage is guaranteed only if the **Get Data** UI is used to set up the connection to the dataflow, and the **Dataflows** connector is used. Correct display of semantic model<->dataflow lineage isn't guaranteed if a manually created Mashup query is used to connect to the dataflow.

## Related content

* [Introduction to semantic models across workspaces](../connect-data/service-datasets-across-workspaces.md)
* [Semantic model impact analysis](service-dataset-impact-analysis.md)