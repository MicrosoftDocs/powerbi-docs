---
title: Power BI Premium features.
description: Learn which features are available for Power BI Premium.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: overview
ms.date: 02/16/2022
LocalizationGroup: Premium 
---

# Power BI Premium features

This article lists all the Power BI Premium features.

|Feature |Description |Required license |
|--------|------------|-----------------|
|[Advanced AI (Cognitive services, AutoML)](./../transform-model/dataflows/dataflows-machine-learning-integration.md) |Use artificial intelligence (AI) with dataflows |Gen2</br>Premium (original version) |
|[Asynchronous refresh](./../connect-data/asynchronous-refresh.md) preview) |Perform asynchronous data-refresh operations |Gen2</br>Premium (original version)</br>PPU |
|[Automatic aggregations](aggregations-auto.md) (preview) |Optimize DirectQuery datasets |Gen2</br>Premium (original version) |
|[Autoscale](service-premium-auto-scale.md) |Automatically add compute capability when your capacity is overloaded |Gen2 |
|[Backup and restore](service-premium-backup-restore-dataset.md) |Backup and restore data using XMLA endpoints |Gen2</br>Premium (original version)</br>PPU |
|[Bring your own key (BYOK)](service-encryption-byok.md) |Use your own keys to encrypt data |Gen2</br>Premium (original version) |
|[Dataflows computed entities](./../transform-model/dataflows/dataflows-premium-features.md#computed-entities) |Perform in-storage computations |Gen2</br>Premium (original version) |
|[Dataflows enhanced compute engine](./../transform-model/dataflows/dataflows-premium-features.md#the-enhanced-compute-engine) |Optimize the use of dataflows |Gen2</br>Premium (original version)</br>Both require A3 or larger capacities |
|[Dataflows incremental refresh](./../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh) |Use incremental refresh with dataflows |Gen2</br>Premium (original version) |
|[Dataflows linked entities](./../transform-model/dataflows/dataflows-premium-features.md#linked-entities) Reference other dataflows |Gen2</br>Premium (original version)</br>PPU |
|[Deployment pipelines](./../create-reports/deployment-pipelines-overview.md) |Manage the lifecycle of your Power BI content |Gen2</br>Premium (original version)</br>PPU |
|[DirectQuery with dataflows](./../transform-model/dataflows/dataflows-premium-features.md#use-directquery-with-dataflows-in-power-bi) |Connect directly to your dataflow without having to import its data |Gen2</br>Premium (original version) |
|Hybrid Tables (preview) |Incremental refresh augmented with real-time data |Gen2</br>Premium (original version)</br>PPU |
|[Insights](./../create-reports/insights.md) (preview) |Explore and find insights such as anomalies and trends in your reports |Gen2</br>Premium (original version)</br>PPU |
|[Large datasets](service-premium-what-is.md#large-datasets) |Datasets can be 12 GB in size |Gen2</br>Premium (original version)</br>PPU |
|[Model size limit](service-premium-gen2-what-is.md#capacity-nodes-for-premium-gen2) |Available memory is set to:</br>*Gen2* - The limit of memory footprint of a single Power BI item; see the column *RAM* in the table at the bottom of [Limitations in Premium Gen2](service-premium-gen2-what-is.md#limitations-in-premium-gen2)</br>*Premium (original version)* - The cumulative consumption of memory of the capacity; see the column *RAM* in the table at the bottom of [Capacity nodes](service-premium-what-is.md#capacity-nodes) |Gen2</br>Premium (original version) |
|[Multi-geo](service-admin-premium-multi-geo.md) |Deploy content to data centers in regions other than the home region of your tenant |Gen2</br>Premium (original version) |
|On-demand loading capabilities for large models |Improve report load time by loading some pages only when needed |Gen2</br>Premium (original version)</br>PPU |
|[Paginated reports](./../paginated-reports/paginated-reports-report-builder-power-bi.md) |Reports that are designed for print |Gen2</br>Premium (original version) |
|[Power BI Report Server](./../report-server/get-started.md) |On-premises report server |Gen2</br>Premium (original version) |
|Refresh rate |[*Gen2*](service-premium-gen2-what-is.md#refresh-in-premium-gen2) - Concurrent dataset refreshes don't contribute to resource constraints</br>*Premium (original version)* - See the table at the bottom of [Capacity nodes](service-premium-what-is.md#capacity-nodes) |Gen2</br>Premium (original version) |
|[Query caching](./../connect-data/power-bi-query-caching.md) |Speed up reports by using local caching |Gen2</br>Premium (original version) |
|[Storage](service-admin-manage-your-data-storage-in-power-bi.md) |Manage data storage |Gen2</br>Premium (original version) |
|[Streaming dataflows](./../transform-model/dataflows/dataflows-streaming.md) (preview) |Connect to, ingest, mash up, model, and build reports using near real-time data |Gen2</br>Premium (original version) |
|[Unlimited content sharing](service-premium-what-is.md#unlimited-content-sharing) |Share Power BI content with anyone |Gen2</br>Premium (original version) |
|[XMLA read/write](service-premium-connect-tools.md) |Enable XMLA endpoint |Gen2</br>Premium (original version)</br>PPU |

## Next steps

> [!div class="nextstepaction"]
> [Install the Gen2 metrics app](service-premium-install-gen2-app.md)
