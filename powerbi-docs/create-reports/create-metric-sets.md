---
title: Create and manage metric sets
description: Learn how to create and manage metric sets in Power BI so that members of your organization can find and reuse key metrics.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 03/05/2025
LocalizationGroup: Consumers
#customer intent: As a business user, I want create and manage metric sets so that my metrics are reusable and discoverable in my organization.
---

# Create and manage metric sets

Intro and purpose of article; create and manage metric sets; refer to overview article
Metric sets aim to help organizations define, discover, and reuse trusted metrics. Currently, metrics are defined in semantic layers as measures in models. Over time, these models become large and complex, making them difficult to manage and use which leads to the creation of many specific models. When organizations have many specific models, it causes data silos and duplicate metrics, resulting in more metric redefinitions. The Fragmentation in models makes it hard for users to trust existing metrics and creates logistical challenges. Metric sets address this issue by giving users tools to manage and reuse key metrics across the organization.  

## Prerequisites

To create and manage metric sets, you must:

- Create the metric set in a Fabric or Power BI Premium Per User (PPU) workspace.
- Turn Fabric on for your organization.
- Have at least a Contributor role in the workspace.
- Have Build permission for a semantic model.

## Create a metric set

1. Sign in to the [**Power BI service**](https://app.powerbi.com) in your browser.
1. Select **Metrics** in the left navigation pane to open the **Metrics** hub.
1. In the **Metrics** hub, select **New metric set**.

    :::image type="content" source="./media/create-metric-sets/metrics-create-metric-set.png" alt-text="Screenshot showing the new metric set window with a name and destination workspace chosen.":::

1. In the **New metric set** window, enter a name for the metric and specify the workspace where it will be saved.
1. Select **Create** to create the metric and close the window. A new metric set opens, which you can start populating with metrics.

     :::image type="content" source="./media/create-metric-sets/metrics-blank-metric-set.png" alt-text="Screenshot showing an empty metric set after creation.":::

## Settings

You can configure settings for a metric set in the Settings panel. To open the Settings panel:

1. Locate the metric set in the Metrics hub or in the workspace list view, as shown in the following image.
1. Hover over the metric set in the list and select the ellipsis (...) that appears.
1. In the **More options** menu, select **Settings**.

     :::image type="content" source="./media/create-metric-sets/access-metrics-settings.png" alt-text="Screenshot showing menu command to access settings for a metric set listed in the Metrics hub.":::

Some settings, like the description and endorsement, can be changed directly in the opened metric set.

- **Description**: A description of the metric set helps users understand the collection's intended use and which groups can access it.
- **Endorsement**: Help users in your organization find the metric set by adding an endorsement.
- **Configure**: Turn Copilot summaries on or off.

> [!NOTE]
> Copilot summaries in metrics are enabled by default in eligible workspaces.

## Add a metric

To add a metric to a metric set:

1. In the **Metric set details** pane, select **Add metric** in the Metrics list. The same option is shown in the preview area if no metrics have been added yet.
1. In the **Select a semantic model** window, choose the semantic model that contains the measure you want to use to build a metric, then select **Next**.
1. Select the measure you want to use, then select **Next**.

As the metric is created, any measure description saved in the semantic model automatically shows in the description area.

## Add dimensions

Dimensions associated with a metric are a crucial part of the metric itself. They specify the data that is most relevant to the metric. Use of the most relevant data helps both end users and creators understand how the metric should be analyzed and what groupings are available.

Use the following instructions to select and use dimensions for a metric:

1. Select **Dimensions**, located next to the Details area.
1. Select **relevant columns**: Check the box next to the field that you want to use with this metric.

:::image type="content" source="./media/create-metric-sets/metrics-select-dimensions.png" alt-text="Screenshot showing anniversary month, education, primary interest, and month fields selected as dimensions.":::

> [!NOTE]
> The Dimensions tab shows the entire semantic model. When the metric is viewed in *Viewing mode*, only the selected dimensions will be displayed to viewers, providing a streamlined overview of the relevant data.

After you select dimensions, visuals and Copilot summaries (if requirements are met for Copilot eligibility) appear in the preview section. These visuals are based on the metric and the associated dimensions. They aim to provide the first step in analysis of the metric, calling out interesting trends breakdowns in the available data.

## Share the metric set

Sharing is the easiest way to give people access to your metric set in Power BI service. You can share with people inside your organization.

When you share a metric set, the people you share it with can view and interact with it. They can also see all semantic model data and edit it if they have an [Admin, Member, or Contributor role in the workspace](../collaborate-share/service-roles-new-workspaces.md).

Users that don’t have access to the semantic model receive access to the metric set and can see metadata like metric name and owner. However, these users can't see the metric value, visuals, or other information coming from the semantic model.

Users that have access to the metric set and semantic model see data according to their row-level security or object-level security roles.

The coworkers you share with can also share with their coworkers, if you allow them to.

> [!NOTE]
> When you share metric sets, your recipients need Fabric or Power BI PPU licenses.

To share a metric set:

1. Select the **Share** button in the action bar.
1. In the **Create and send link** window, enter or search for an email address for the individual or group you want to share the metric set with.
1. Select **Specific people can view** to show the **Select permissions** window.

:::image type="content" source="./media/create-metric-sets/metrics-share-metric-set.png" alt-text="Screenshot showing the create and send link window beside the select permissions window.":::

1. Select any **additional permissions** you want your collaborators to have.
1. Select the **Apply** button to set the permissions.
1. Select **Send** to send the link to the metric set to the selected recipients.

> [!NOTE]
> If you share a metric set artifact, this won't automatically give users access to the metric data coming from the semantic model. For users to see metric data, you need to share underlying semantic model read access either from the artifact (semantic model) or the workspace (roles).

## Related content

- [Get started with metrics](create-metric-sets.md)
- [View and explore metrics](view-explore-metrics.md)
- [Use and monitor metrics](use-monitor-metrics.md)
