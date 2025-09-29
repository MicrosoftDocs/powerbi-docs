---
title: Create and manage metric sets
description: Learn how to create and manage metric sets in Power BI so that members of your organization can find and reuse key metrics.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 03/10/2025
LocalizationGroup: Consumers
#customer intent: As a Power BI user, I want create and manage metric sets so that my metrics are reusable and discoverable in my organization.
---

# Create and manage metric sets

Metric sets are collections of metrics and key performance indicators you create and use for greater accuracy, consistency, and reliability in reports and analysis.
This article tells you how to create a metric set in the Power BI service. It also covers prerequisites, settings, and how to share a metric set with others.

If you're new to metric sets and are looking for an introduction to this feature, see [Get started with metric sets](./get-started-metrics.md).

> [!WARNING]
> Metric sets are going away. Starting October 25th, creating new Metric sets will no longer be possible, but you can access existing Metric sets until November 15, 2025. Please note that Scorecards and all associated datasets or measures will not be impacted by this change.

## Prerequisites

To create and manage metric sets, you must:

- Create the metric set in a Fabric or Power BI Premium Per User workspace.
- Turn on Fabric for your organization.
- Have at least a Contributor role in the workspace.
- Have Build permission for the semantic model.

## Create a metric set

1. Sign in to the [**Power BI service**](https://app.powerbi.com) in your browser.

1. Select **Metrics** in the left navigation pane to open the Metrics hub.

1. In the Metrics hub, select **New metric set**.

   :::image type="content" source="./media/create-metric-sets/metrics-create-metric-set.png" alt-text="Screenshot showing the new metric set window with a name and destination workspace chosen.":::

1. In the **New metric set** window, enter a name for the metric and specify the workspace where it should be saved.

1. Select **Create** to create the metric and close the window. The new metric set opens, which you can start filling with metrics.

   :::image type="content" source="./media/create-metric-sets/metrics-blank-metric-set.png" alt-text="Screenshot showing an empty metric set after creation." lightbox="./media/create-metric-sets/metrics-blank-metric-set.png":::

## Settings

You can configure settings for a metric set in the **Settings panel**. To open the Settings panel:

1. Locate the metric set in the Metrics hub or in the workspace list view, as shown in the following image.

   :::image type="content" source="./media/create-metric-sets/metrics-hub-overview.png" alt-text="Screenshot showing metric sets listed in the Metrics hub." lightbox="./media/create-metric-sets/metrics-hub-overview.png":::

1. Hover over the metric set in the list and select the ellipsis (...) that appears.

1. In the **More options** menu, select **Settings**.

   :::image type="content" source="./media/create-metric-sets/access-metric-set-settings.png" alt-text="Screenshot showing menu command to access settings for a metric set listed in the Metrics hub.":::

Some settings, like the description and endorsement, can be changed directly in the opened metric set.

- **Description**: A description of the metric set helps users understand its intended use and which groups have access.
- **Endorsement**: Help users in your organization find the metric set by adding an [endorsement](../collaborate-share/service-endorsement-overview.md).
- **Configure**: Turn Copilot summaries on or off.

> [!NOTE]
> Copilot summaries in metrics are enabled by default in eligible workspaces.

## Add a metric

To add a metric to a metric set:

1. In the **Details** pane, select **Add metric** in the Metrics list. The same option is shown in the preview area if no metrics have been added yet.

1. In the **Select a semantic model** window, choose the semantic model that contains the measure you want to use to build a metric, then select **Next**.

1. Select the measure you want to use, then select **Next**.

As the metric is created, any measure description saved in the semantic model automatically shows in the description area.

:::image type="content" source="./media/get-started-metrics/metric-overview.png" alt-text="Screenshot showing metric selected in open metric set." lightbox="./media/get-started-metrics/metric-overview.png":::

## Share the metric set

Sharing is the easiest way to give people access to your metric set in Power BI service. You can share with people inside your organization.

When you share a metric set, the people you share it with can view and interact with it. They can also see and edit all semantic model data if they have an [Admin, Member, or Contributor role in the workspace](../collaborate-share/service-roles-new-workspaces.md).

Users that don’t have access to the semantic model receive access to the metric set and can see metadata like metric name and owner. However, these users can't see the metric value, visuals, or other information coming from the semantic model.

Users that have access to the metric set and semantic model see data according to their row-level security or object-level security roles.

The coworkers you share with can also share with their coworkers, if you allow them to.

> [!NOTE]
> When you share metric sets, your recipients need Fabric or Power BI Premium Per User licenses.

To share a metric set:

1. Select the **Share** button in the action bar.

1. In the **Create and send link** window, enter or search for an email address for the individual or group you want to share the metric set with.

1. Select **Specific people can view** to show the **Select permissions** window, as shown in the following images.

   :::image type="content" source="./media/create-metric-sets/metrics-share-metric-set.png" alt-text="Screenshot showing the create and send link window beside the select permissions window.":::

1. Select any **Additional permissions** you want your collaborators to have.

1. Select **Apply** to set the permissions.

1. Select **Send** to send the link to the metric set to the selected recipients.

> [!NOTE]
> If you share a metric set artifact, it doesn't automatically give users access to the metric data coming from the semantic model. For users to see metric data, you need to share underlying semantic model read access either from the artifact (semantic model) or the workspace (roles).

## Related content

- [Get started with metric sets](create-metric-sets.md)
- [View and explore metrics](view-explore-metrics.md)
- [Use and monitor metrics](use-monitor-metrics.md)
