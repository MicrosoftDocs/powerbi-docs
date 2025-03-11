---
title: View and explore metrics
description: Learn how to view and explore metric sets in Power BI so that your members of your organization can find and reuse key metrics.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: concept-article
ms.date: 03/10/2025
LocalizationGroup: Consumers
#customer intent: As a Power BI user, I want learn about the metrics sections in Power BI so that I can understand the insights the metrics are giving me.
---

# View and explore metrics

Metric sets are collections of metrics and key performance indicators you create and use for greater accuracy, consistency, and reliability in reports and analysis.
This article guides you through the preview area you see when you open a metric set in Fabric or the Power BI service. It also shows you how to use the Explore feature for in-depth analysis of metric set data. If you already have a metric set created in a workspace, the information provided here will familiarize you with the view and the actions you can take within it.

If you're new to metric sets and want to learn how to get started with this feature, see [Get started with metric sets](./get-started-metrics.md). [Create and manage metric sets](./create-metric-sets.md) shows you how to build a metric set of your own.

:::image type="content" source="./media/get-started-metrics/metric-overview.png" alt-text="Screenshot showing metric selected in open metric set."  lightbox="./media/get-started-metrics/metric-overview.png":::

## Metric set details

The **Metric set details** pane on the left side of the view lists all the metrics contained in the metric set. When you select a metric from the list, the details are shown in the preview area. You can also add a descriptive text to provide information about the metric set.

## Metric details

When you open a metric set, information about the selected metric is displayed in the view. The metric value is shown below the fields for the metric name and description. The **Details** area provides the following information about the selected metric:

- **Semantic model**: Name of the semantic model that the metric is based on.
- **Data updated**: Date when the semantic model  data for the metric was last updated.
- **Uses**: Total number of reports that use the metric. You can find more information in [Usage section](view-explore-metrics.md#usage-section).
- **Owner**: The point of contact for the metric set.

:::image type="content" source="./media/view-explore-metrics/metric-details.png" alt-text="Screenshot showing the metric details pane.":::

The metric value itself is located above the other details. It includes the time period or aggregation specified in the measure logic, or it shows a grand total value, as in the **Total** box shown in the preceding image.

## Usage section

The **Usage** section of a metric page is linked to the **Uses** section in the [metric details area](view-explore-metrics.md#metric-details). It lists the specific downstream applications of a metric. For example, if a metric (or its underlying measure) is used in 10 reports, all 10 reports appear in this table.

:::image type="content" source="./media/view-explore-metrics/metrics-usage-section.png" alt-text="Screenshot showing the metric usage section." lightbox="./media/view-explore-metrics/metrics-usage-section.png":::

This section is important for several reasons:

- Lineage: Metric authors can track how their metric is being used, which helps determine if any adjustments are needed. Additionally, a lineage view is available for more detailed insights.
- Trust: For viewers, the Usage section serves as a valuable trust indicator. If there are two metrics with similar names, the one with more usages and recognizable downstream reports is likely the more reliable metric.
- Navigation: It facilitates easy navigation to downstream solutions, enabling users to explore further analysis and applications of the metric.

> [!NOTE]
> The Usage table respects permissions.

## Analyze metrics

A metric's data is visualized in the **Visuals** area, so you can begin analysis with the provided visuals and Copilot summary without performing any extra action.

You can also use the **Dimensions tab** or the **Explore feature** to manipulate the data.

### Add dimensions

Dimensions associated with a metric are a crucial part of the metric itself. They specify the data that's most relevant to the metric. Use of the most relevant data helps both end users and creators understand how the metric should be analyzed and what groupings are available.

To select and use dimensions for a metric, go to the **Dimensions** tab, located next to the Details area. Select the checkboxes next to the fields you want to add.

:::image type="content" source="./media/view-explore-metrics/metrics-select-dimensions.png" alt-text="Screenshot showing anniversary month, education, primary interest, and month fields selected as dimensions.":::

> [!NOTE]
> The Dimensions tab shows the entire semantic model. When the metric is viewed in *Viewing mode*, only the selected dimensions are displayed to viewers, providing a streamlined overview of the relevant data.

After you select dimensions, visuals and Copilot summaries (if requirements are met for Copilot eligibility) appear in the **Visuals** area. These visuals are based on the metric and the associated dimensions. They aim to provide the first step in analysis of the metric, calling out interesting trends breakdowns in the available data.

### Explore data

If there are views or specific groupings you want to see from the Dimensions list that aren't yet visualized in the preview area, you can use the **Explore** feature. Select the **Explore** action button in the view, then manipulate the data to get the correct view you need.

:::image type="content" source="./media/view-explore-metrics/metrics-explore-dialog.png" alt-text="Screenshot showing the explore area for the selected metrics." lightbox="./media/view-explore-metrics/metrics-explore-dialog.png":::

When you view the Explore area, the data pane only displays the metric and its associated dimensions. This setup provides a controlled exploration experience, to make sure that users can only slice the metric by dimensions that are relevant and appropriate. The setup also prevents the use of unrelated or unsuitable dimensions.

You can save your analysis as an exploration or as a report. See [Use and monitor metrics](use-monitor-metrics.md) for information about how to use a metric in a report or notebook.

## Related content

- [Get started with metric sets](create-metric-sets.md)
- [Create and manage metric sets](create-metric-sets.md)
- [Use and monitor metrics](use-monitor-metrics.md)
