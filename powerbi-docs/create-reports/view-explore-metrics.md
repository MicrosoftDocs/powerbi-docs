---
title: View and explore metrics
description: Learn how to view and explore metric sets in Power BI so that your members of your organization can find and reuse key metrics.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: concept-article
ms.date: 03/05/2025
LocalizationGroup: Consumers
#customer intent: As a business user, I want learn about the metrics sections in Power BI so that I can understand the insights the metrics are giving me.
---

# View and explore metrics

Metric sets are collections of metrics and key performance indicators you create and use for greater accuracy, consistency, and reliability in reports and analysis.
This article guides you through the preview area you see when you open a metric set in Fabric or the Power BI service. It also shows you how to use the Explore feature for in-depth analysis of metric set data. If you already have a metric set created in a workspace, the information provided here will familiarize your with the view and the actions you can take within it.

If you're new to metric sets, and want to know how to get started with this feature, see [Get started with Metrics](./get-started-metrics.md). [Create and manage metric sets](./create-metric-sets.md) shows you how to build a metric set of your own.

## Metric set details

The expandable pane on the left side of the view has a Description field where information about the metric set can be added. It also lists all the metrics contained in the metric set. When you select a metric from the list, the details are shown in the preview area.

## Metric details

When you open a metric set, information about the selected metric is displayed in the view. The metric value is shown below the fields for the metric name and description. A **Details** area provides the following information about the selected metric:

- **Semantic model**: Name of the semantic model that the metric is based on.
- **Data updated**: Date when the semantic model  data for the metric was last updated.
- **Uses**: Total number of reports that use the metric. See [Usage section](view-explore-metrics.md#usage-section) further on for more information.
- **Owner**: The point of contact for the metric set.

:::image type="content" source="./media/view-explore-metrics/metric-details.png" alt-text="Screenshot showing the metric details pane.":::

The metric value itself is located above the other details. The metric value includes the time period or aggregation specified in the measure logic, or it shows a grand total value, as in the **Total** box shown in the image above.

## Usage section

The **Usage** section of a metric page is linked to the **Uses** section in the metric details area. It lists the specific downstream applications of a metric. For example, if a metric (or its underlying measure) is used in 10 reports, all 10 reports appear in this table.

:::image type="content" source="./media/view-explore-metrics/metrics-usage-section.png" alt-text="Screenshot showing the metric usage section.":::

This section is important for several reasons:

- Lineage: Metric authors can track how their metric is being used, which helps determine if any adjustments are needed. Additionally, a lineage view is available for more detailed insights.
- Trust: For viewers, the Usage section serves as a valuable trust indicator. If there are two metrics with similar names, the one with more usages and recognizable downstream reports is likely the more reliable metric.
- Navigation: It facilitates easy navigation to downstream solutions, enabling users to explore further analysis and applications of the metric.

> [!NOTE]
> The Usage table respects permissions.

## Analyze metrics

A metric's data is visualized in the **Visuals** area, so you can begin analysis with the provided visuals and Copilot summary without performing any extra action.

You can also select the **Dimensions** tab in the same pane as the metric details to view and add dimensions. Select the checkboxes next to the fields you want to add. The selected data is applied and automatically visualized in the **Visuals** area.

Users can favorite metric sets they use often, so that they can always come back and get the most up-to-date number.

If there are views or specific groupings you want to see from the Dimensions list that aren't yet visualized in the preview area, you can use the **Explore** feature. Select the **Explore** action button in the view, then manipulate the data to get the correct view you need.

:::image type="content" source="./media/view-explore-metrics/metrics-explore-dialog.png" alt-text="Screenshot showing the explore area for the selected metrics.":::

When you view the Explore area, the data pane only displays the metric and its associated dimensions. This setup provides a controlled exploration experience, to make sure that users can only slice the metric by dimensions that are relevant and appropriate. The setup also prevents the use of unrelated or unsuitable dimensions.

You can save your analysis as an exploration or as a report. See [Use and monitor metrics](use-monitor-metrics.md) for information about how to use a metric in a report or notebook.

## Related content

- [Get started with metrics](create-metric-sets.md)
- [Create and manage metric sets](create-metric-sets.md)
- [Use and monitor metrics](use-monitor-metrics.md)
