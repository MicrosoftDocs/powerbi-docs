---
title: Get started with Metrics
description: Learn how you can use the Power BI Metrics feature and how to manage key metrics across your organization.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: concept-article
ms.date: 11/1/2024
LocalizationGroup: Get started

#customer intent: As a business user, I want to learn about the metrics feature so that I can use it in my organization.
---

# Get started with Metrics

Metric sets aim to help organizations define, discover, and reuse trusted metrics. Currently, metrics are defined in semantic layers as measures in models. Over time, these models become large and complex, making them difficult to manage and use which leads to the creation of many specific models. When organizations have many specific models, it causes data silos and duplicate metrics, resulting in more metric redefinitions. The Fragmentation in models makes it hard for users to trust existing metrics and creates logistical challenges. Metric sets address this issue by giving users tools to manage and reuse key metrics across the organization.  

To use metric sets, a Power BI Admin must turn it on in tenant settings. [Metric hub tenant settings](/fabric/admin/service-admin-portal-goals-settings)

## Licensing Requirements

> [!WARNING]
> For Metrics sets to be used, an organization must have Fabric enabled in the tenant settings.    

|Permission|Requirements|
|----|----|
|Author and share metric sets and metrics|Power BI Premium workspace or Fabric workspace|
|View metric sets and metrics|Power BI Premium License|
|Use Copilot summaries for metrics|Power BI Premium workspace or Fabric F64 or greater capacity|

> [!NOTE]
> If you don’t meet the minimum requirements for any of these, contact your Power BI administrator before you begin.

## Limitations

- In Desktop experiences, connecting to a metric loads the entire source semantic model of the underlying measure.
- You need build permissions to the underlying semantic model to create a metric.
- Sharing the metric set artifact shares only the container. To see individual metrics and their associated data/dimensions, viewers need (minimum) read permission to the associated semantic model.
- There's currently no way for viewers to request access to a specific metric.
- Users need build permissions to customize views and visuals using "Explore."
- Similar dimensions across semantic models for metrics aren't inherently recognized as shared dimensions in report creation.
- Metric-specific APIs aren't public.
- There isn't yet GIT integration.

## Who is a Metrics Layer for?

After you sign in to the Power BI service, select Metrics from the navigation pane. Power BI displays the new Metrics hub page, which contains sections for metric sets and for scorecards. The default is to land on the metric set area. As a new user, your Metric set area is empty, as shown the following image.

Once your organization has content, you see metric sets populated in the browsing area, with tabs to look through All, Endorsed, and Favorites. You can also search for specific metrics or metric sets using the search bar in this experience. You can also use the workspace explorer to view metric sets in specific workspaces.

:::image type="content" source="./media/get-started-metrics/metric-overview.png" alt-text="Screenshot showing the overview page of selected metric.":::

## Explore the metrics hub page

After you sign in to the Power BI service, select Metrics from the navigation pane. Power BI displays the new Metrics hub page, which contains sections for metric sets and for scorecards. The default is to land on the metric set area. As a new user, your Metric set area is empty, as shown the following image.

:::image type="content" source="./media/get-started-metrics/metrics-hub-overview.png" alt-text="Screenshot showing the metrics hub page.":::

Once your organization has content, you see metric sets populated in the browsing area, with tabs to look through All, Endorsed, and Favorites. You can also search for specific metrics or metric sets using the search bar in this experience.
You can also use the workspace explorer to view metric sets in specific workspaces.

:::image type="content" source="./media/get-started-metrics/metrics-hub-search.png.png" alt-text="Screenshot showing how to search for a metric set on the metrics hub page.":::

## Related content

- [Create and manage metric sets](create-metric-sets.md)
- [View and explore metrics](view-explore-metrics.md)
