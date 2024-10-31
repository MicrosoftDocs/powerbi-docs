---
title: Use and monitor metrics
description: Learn how to create and manage metric sets in Power BI so that your members of your organization can find and reuse key metrics.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-explore
ms.topic: how-to
ms.date: 11/1/2024
LocalizationGroup: Consumers
#customer intent: As a business user, I want learn the different ways I can use metrics and how to monitor them.
---

# Use and monitor metrics

There are methods for report authors and data scientists to use these metrics. Them methods make sure creators consistently use the most accurate and trusted KPIs within their organization, designed for reuse and wide distribution. Reports built on these metrics benefit from higher data quality, as they use standardized and validated KPIs. Data scientists can now incorporate these reliable metrics directly into their complex models without needing to reverse engineer data. Through Sempy integration, they can easily access and reuse the metrics defined in the Power BI semantic model.

This article shows you how to use metrics in reports and notebooks. Also how to make sure accurate and trusted KPIs are used within your organization for higher data quality and simplified integration into complex models.

## Prerequisites

To create and manage metrics sets, you must:

- have a Power BI Pay-per-user(PPU)/Premium license to author and share metrics in standard workspaces.
- work in a Fabric capacity.
- be at least in a Contributor role in a workspace. Read more about roles in workspaces.
- have build permission for a semantic model.

## Use in a report

To use in a report:

1. Select the **use metric** dropdown
1. Select **use in report**
    :::image type="content" source="./media/use-monitor-metrics/metrics-use-in-report.png" alt-text="Screenshot showing the use in new report option selected with a red box around it.":::
1. Add data sources and build your report solution

    :::image type="content" source="./media/use-monitor-metrics/metrics-new-report.png" alt-text="Screenshot showing the metrics report created.":::

> [!NOTE]
> For all report authoring scenarios, connecting to a metric currently brings the entire semantic model into the data pane. In the future the data pane will only show the metric and its related dimensions.

## Use in Notebooks

Using data outside of Power BI is a powerful experience in the metrics layer. Use a metric to generate a code snippet, using SemPy + semantic link. Use this code snippet to use the metric in Notebooks or other python environments.

1. Select the **use metric dropdown**.
1. Select **copy code to notebook**.
     :::image type="content" source="./media/use-monitor-metrics/metrics-copy-in-notebook.png" alt-text="Screenshot showing the copy code to notebook option selected with a red box around it.":::
1. Copy the code snippet provided.
    :::image type="content" source="./media/use-monitor-metrics/metrics-notebook-snippet.png" alt-text="Screenshot showing the Copy code for notebook pane with a code sample code snippet.":::
1. Navigate to a new or existing notebook.
1. Paste the code snippet into a cell.
1. Include groupby additions to include specific dimensions (optional step).
    :::image type="content" source="./media/use-monitor-metrics/metrics-dataframe-sempy.png" alt-text="Screenshot showing an example of a dataframe.":::
1. Run the cell and produce a dataframe.

You can save this back to your lakehouse so that the data is accessible outside of Power BI.

## Use with APIs

Metric sets are Fabric artifacts, so you can use the public APIs for Fabric artifacts. The APIs use the metric set metadata. However, Metric sets are made up of individual metrics, which aren't accessed via the public Fabric APIs. For more information, read [Microsoft Fabric REST API references](https://learn.microsoft.com/rest/api/fabric/articles/).

To use metric data via API, you can use semantic link, and use SemPy, which is a python library that simplifies working with semantic data. You can use SemPy, which uses elements of APIs, to connect to a Power BI Measure that powers a metric. You can access a pregenerated code snippet in the **use in notebook** section of the metric details page. For more information, read [Use in notebooks](#use-in-notebooks) for more information.

## Understand lineage

In Power BI, the lineage view is essential for creators. The lineage view offers visibility into data flow, supports impact analysis, aids in troubleshooting, enforces data governance, optimizes performance, enhances collaboration, and provides documentation. This comprehensive understanding is critical for maintaining the accuracy, efficiency, and effectiveness of data-driven projects.

Metric sets show up in both workspace lineage views and data lineage views:

- Workspace Lineage View: Focuses on the relationships between items within a specific Power BI workspace, helping users understand how different components are interconnected.
     :::image type="content" source="./media/use-monitor-metrics/metrics-workspace-lineage.png" alt-text="Screenshot showing the workspace lineage view.":::
- Data Lineage View: Provides an end-to-end view of how data is sourced, transformed, and used in reports and dashboards, covering the entire data lifecycle.

There are a couple other ways for creators to understand lineage and usage of a metric:  

- **Usage section**: Users can also utilize the Usage section of a metric page, which is linked to the Uses section in the details area. This section displays the specific downstream applications of a metric. For example, if a metric (or its underlying measure) is used in 10 reports, all 10 reports appear in this table.
    :::image type="content" source="./media/view-explore-metrics/metrics-usage-section.png" alt-text="Screenshot showing the metric usage section.":::
- **Details page for semantic model**: Metric set artifacts show up in the **See what already exists** table for a specific semantic model if a metric uses a measure located in that model.
   :::image type="content" source="./media/use-monitor-metrics/metrics-semantic-model-view.png" alt-text="Screenshot showing the semantic model view with the see what exists table displayed.":::

## Related content

- [Get started with metrics](create-metric-sets.md)
- [Create and manage metric sets](create-metric-sets.md)
- [View and explore metrics](view-explore-metrics.md)
