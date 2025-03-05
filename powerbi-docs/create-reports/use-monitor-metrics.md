---
title: Use and monitor metrics
description: Learn different methods to use metric sets in Power BI and how to ensure collaborators use accurate and trusted KPIs within your organization.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 03/05/2025
LocalizationGroup: Consumers
#customer intent: As a business user, I want learn the different ways I can use metrics and how to monitor them.
---

# Use and monitor metrics

Metric sets let you create and use reliable KPIs from trusted sources. See [Get started with Metrics](./get-started-metrics.md) for an overview of metric sets.
Also how to make sure accurate and trusted KPIs are used within your organization for higher data quality and simplified integration into complex models.

This article shows you how to use metrics in reports and notebooks. If you haven't created a metric set yet, see [Create and manage metric sets](create-metric-sets.md) for details.

## Use metrics in a report

To use a metric in a report:

1. In the open metric set, select the **Use metric** dropdown, then select **Use in new report**.

   :::image type="content" source="./media/use-monitor-metrics/metrics-use-in-report.png" alt-text="Screenshot showing the use in new report option selected with a red box around it.":::

1. A new report canvas opens for editing. Add data sources and build your report solution.

    :::image type="content" source="./media/use-monitor-metrics/metrics-new-report.png" alt-text="Screenshot showing the metrics report created." lightbox="./media/use-monitor-metrics/metrics-new-report.png":::

> [!NOTE]
> For all report authoring scenarios, connecting to a metric currently brings the entire semantic model into the Data pane. In the future, the Data pane will only show the selected metric and its related dimensions.

## Use metrics in notebooks

The metrics layer offers a powerful experience for using data outside of Power BI. You can generate a code snippet from a metric set, copy it, and apply it to use the metric in notebooks or other Python environments.

To use a metric in a notebook:

1. In the open metric set, select the **Use metric** dropdown, then select **Copy code to notebook**.

   :::image type="content" source="./media/use-monitor-metrics/metrics-copy-in-notebook.png" alt-text="Screenshot showing the copy code to notebook option highlighted in the use metric dropdown.":::

1. Copy the code snippet provided in the window that opens.

   :::image type="content" source="./media/use-monitor-metrics/metrics-notebook-snippet.png" alt-text="Screenshot showing the copy code for notebook window with a sample code snippet." lightbox="./media/use-monitor-metrics/metrics-notebook-snippet.png":::

1. Navigate to a new or existing notebook.
1. Paste the code snippet into a cell.
1. Use groupby additions to include specific dimensions (optional step).

    :::image type="content" source="./media/use-monitor-metrics/metrics-dataframe-sempy.png" alt-text="Screenshot showing an example of a dataframe." lightbox="./media/use-monitor-metrics/metrics-dataframe-sempy.png":::

1. Run the cell and produce a dataframe.

You can save this back to your lakehouse so that the data is accessible outside of Power BI.

## Use metrics with APIs

Metric sets are Fabric artifacts, so you can use them with public APIs. The APIs use the metric set metadata. However, the individual metrics that make up the metric set aren't accessable via the public Fabric APIs. For more information, read the [Microsoft Fabric REST API documentation](/rest/api/fabric/articles/).

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
