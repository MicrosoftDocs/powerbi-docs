---
title: Get started with Metrics
description: Learn how you can use the Power BI Metrics feature to standardize and manage key metrics across your organization.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: concept-article
ms.date: 03/10/2025
LocalizationGroup: Get started
#customer intent: As a Power BI user, I want to learn how to use and manage metric sets so that I can ensure accuracy, consistency, and reliability in my organization's reports and analysis.
---

# Get started with metric sets

**APPLIES TO:** :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::Power BI service for business users :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::Power BI service for designers & developers :::image type="icon" source="../includes/media/no-icon.svg" border="false":::Power BI Desktop :::image type="icon" source="../includes/media/yes-icon.svg" border="false":::Requires Premium Per User or Fabric license

Metric sets help organizations define, discover, and reuse trusted metrics. When you create a metric set, you establish the metrics within it as reliable sources that people in your organization should use for greater accuracy, consistency, and reliability in their reports and analysis. Bundle selected metrics from your data into a metric set that you can endorse and share with others.

Currently, metrics are defined in semantic layers as measures in models. Over time, these models become large and complex, making them difficult to manage and use, which leads to the creation of many specific models. When organizations have many specific models, it causes data silos and duplicate metrics, resulting in more metric redefinitions. The fragmentation in models makes it hard for users to trust existing metrics and creates logistical challenges. Metric sets address this issue by giving users tools to manage and reuse key metrics across the organization.

This article tells you how to get started with metric sets. You'll learn who should use metric sets, where to find them in the Power BI service, and what considerations you need to factor into their use.

## Who are metric sets for?

Metric sets are for report authors and data scientists who want to create and use reliable metrics from trusted sources. Designed for reuse and wide distribution, metric sets ensure creators consistently use the most accurate and trusted key performance indicators (KPIs) within their organization. Reports built on these metrics benefit from higher data quality, as they use standardized and validated KPIs.

Data scientists can now incorporate these reliable metrics directly into their complex models without needing to reverse engineer data. Through SemPy integration, they can easily access and reuse the metrics defined in the Power BI semantic model. You can read more about connectivity to semantic models in [Power BI connectivity with semantic link](/fabric/data-science/semantic-link-power-bi).

## Prerequisites

> [!WARNING]
> To use metric sets, an organization must have Fabric enabled in the [tenant settings](/fabric/admin/service-admin-portal-goals-settings).

Metric sets have the following licensing requirements:

|Permission|Requirements|
|----|----|
|Author and share metric sets and metrics|Power BI Premium Per User workspace or Fabric workspace|
|View metric sets and metrics|Power BI Premium Per User license|
|Use Copilot summaries for metrics|Power BI Premium Per User workspace or Fabric F64 or greater capacity|

> [!NOTE]
> If you don’t meet these minimum requirements, contact your Fabric administrator before you begin.

Permissions also factor into the ability to view and edit metric sets:

- Users need Read permission for the semantic model to access and view a metric set.
- Sharing the metric set artifact only shares the container. To see individual metrics and their associated data/dimensions, viewers must have at least Read permission for the associated semantic model.
- To create a metric, users need Build permission for the underlying semantic model.
- Users need Build permission to customize views and visuals using the Explore feature.
- Users must have at least a Contributor role in the workspace to create and manage metric sets.

## Explore the Metrics hub

After you sign in to the Power BI service, select Metrics from the navigation pane. Power BI displays the new Metrics hub, which contains sections for metric sets and for scorecards. The default is to land on the Metric sets area. Once your organization has content, you see metric sets populated in the browsing area, with tabs to look through *All*, *Endorsed*, and *Favorites*.

Use the search bar to search for specific metrics or metric sets. You can also use the workspace explorer to view metric sets in specific workspaces.

:::image type="content" source="./media/get-started-metrics/metrics-hub-overview.png" alt-text="Screenshot showing the metrics hub page." lightbox="./media/get-started-metrics/metrics-hub-overview.png":::

## Limitations

- In Power BI Desktop, connecting to a metric loads the entire source semantic model of the underlying measure.
- There's currently no way for viewers to request access to a specific metric.
- Similar dimensions across semantic models for metrics aren't inherently recognized as shared dimensions in report creation.
- Metric-specific APIs aren't public.
- There's no GIT integration yet.

## Related content

- [Create and manage metric sets](create-metric-sets.md)
- [View and explore metrics](view-explore-metrics.md)
