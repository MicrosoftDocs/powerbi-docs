---
title: Create and manage metric sets
description: Learn how to create and manage metric sets in Power BI so that members of your organization can find and reuse key metrics.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 11/1/2024
LocalizationGroup: Consumers
#customer intent: As a business user, I want create and manage metric sets so that my metrics are reusable and discoverable in my organization.
---

# Create and manage metric sets

Metric sets aim to help organizations define, discover, and reuse trusted metrics. Currently, metrics are defined in semantic layers as measures in models. Over time, these models become large and complex, making them difficult to manage and use which leads to the creation of many specific models. When organizations have many specific models, it causes data silos and duplicate metrics, resulting in more metric redefinitions. The Fragmentation in models makes it hard for users to trust existing metrics and creates logistical challenges. Metric sets address this issue by giving users tools to manage and reuse key metrics across the organization.  

## Prerequisites

To create and manage metrics sets, you must:

- create the metric set in a Premium workspace
- turn Fabric on for your organization
- be at least in a Contributor role in the workspace
- have build permission for a semantic model

## Create a metric set

1. Sign in to the **Power BI service** (app.powerbi.com) in your browser.
1. Select **Metrics** in the left navigation pane to open the **Metrics** hub.
1. In the **Metrics** hub, select **New metric set**:
    :::image type="content" source="./media/create-metric-sets/metrics-create-metric-set.png" alt-text="Screenshot showing the new metric set window with a name and destination workspace chosen.":::
    1. Give the metric set a name.
    1. Specify a workspace.
    1. A new metric set opens, which you can start populating with metrics.
     :::image type="content" source="./media/create-metric-sets/metrics-blank-metric-set.png" alt-text="Screenshot showing a measure selected.":::
1. **Give** the metric set a **description** (optional step). A description of the metric set helps users understand the collection's intended use and which groups can access it.
1. **Endorse** your metric set (optional step).
1. **Configure** Copilot settings (optional step).

> [!NOTE]
> Copilot summaries in metrics are enabled by default in eligible workspaces.  Metric set authors can disable this setting. To disable the setting, open the **Metric Set** settings pane and set the toggle to **off**.

## Create a metric

1. Select **add metric** in either the metric list or the empty state in the preview area.
1. Select **the semantic model** that contains the measure you want to use to build a metric.
    :::image type="content" source="./media/create-metric-sets/metrics-select-semantic-model.png" alt-text="Screenshot showing a semantic model selected.":::
1. Select the measure.
    :::image type="content" source="./media/create-metric-sets/Metrics-select-measure.png" alt-text="Screenshot showing a new metric set that is blank.":::

As the metric is created, any measure description saved in semantic model automatically shows in the description area.

## Add dimensions

Dimensions associated with a metric are a crucial part of the metric itself. They specify the data that is most relevant to the metric. Use of the most relevant data helps both end users and creators understand how the metric should be analyzed and what groupings are available.

Use the following instructions to select and use dimensions for a metric:

1. Select **dimensions**, located next to the details area.
1. Select **relevant columns**: Choose the columns that you want to use with this metric.

:::image type="content" source="./media/create-metric-sets/metrics-select-dimensions.png" alt-text="Screenshot showing anniversary month, education, primary interest, and month selected as dimensions.":::

> [!NOTE]
> In the Dimensions tab, you will see the entire semantic model. When the metric is viewed in "viewing" mode, only the selected dimensions will be displayed to viewers, providing a streamlined overview of the relevant data.

After you select dimensions, visuals and Copilot summaries (if requirements are met for Copilot eligibility) appear in the preview section. These visuals are based on the metric and the associated dimensions. They aim to provide the first step in analysis of the metric, calling out interesting trends breakdowns in the available data.

## Share the metric set

Sharing is the easiest way to give people access to your metric set in Power BI service. You can share with people inside your organization.

When you share a metric set, the people you share it with can view and interact with it. They can also see all semantic model data and edit it if they have an [Admin, Member, or Contributor role in the workspace](../collaborate-share/service-roles-new-workspaces.md).

Users that don’t have access to the semantic model receive access to the metric set and can see metadata like metric name and owner. However, these users can't see the metric value, visuals, or other information coming from the semantic model.

Users that have access to the metric set and semantic model see data according to their Role Level Security (RLS) or Object Level Security (OLS) roles. The coworkers you share with can also share with their coworkers, if you allow them to.

> [!NOTE]
> When you share metric sets, your recipients need Power BI PPU licenses, unless the content is in a [Power BI Premium](../enterprise/service-premium-what-is.md) capacity.

To share a metric set:

1. Select the **Share** button in the action bar.
1. Select **the permissions** to determine who can view the metric set.
1. Select any **additional permissions** you want your collaborators to have.
1. Select the **Apply** button to set your permissions and share the metric set.

:::image type="content" source="./media/create-metric-sets/metrics-share-metric-set.png" alt-text="Screenshot showing the select permissions pane open, with people in your organization selected to view the metric set when the user shares.":::

> [!NOTE]
> If you share a metric set artifact, this won't automatically give users access to the metric data coming from the semantic model. For users to see metric data, you need to share underlying semantic model read access either from the artifact (semantic model) or the workspace (roles).

## Related content

- [Get started with metrics](create-metric-sets.md)
- [View and explore metrics](view-explore-metrics.md)
- [Use and monitor metrics](use-monitor-metrics.md)
