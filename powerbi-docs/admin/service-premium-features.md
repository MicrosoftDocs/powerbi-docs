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

This article lists the main Power BI Premium features.

|Feature |Description |Required license |
|--------|------------|-----------------|
|[Advanced AI (Cognitive services, AutoML)](./../transform-model/dataflows/dataflows-machine-learning-integration.md) |Use artificial intelligence (AI) with dataflows |Gen2 or Premium (original version) |
|[Asynchronous refresh](./../connect-data/asynchronous-refresh.md) (preview) |Perform asynchronous data-refresh operations |Gen2, Premium (original version) or Premium Per User (PPU) |
|[Automatic aggregations](aggregations-auto.md) (preview) |Optimize DirectQuery datasets |Gen2 or Premium (original version) |
|[Autoscale](service-premium-auto-scale.md) |Automatically add compute capability when your capacity is overloaded |Gen2 |
|[Backup and restore](service-premium-backup-restore-dataset.md) |Backup and restore data using XMLA endpoints |Gen2, Premium (original version) or Premium Per User (PPU) |
|[Bring your own key (BYOK)](service-encryption-byok.md) |Use your own keys to encrypt data |Gen2 or Premium (original version) |
|[Dataflows computed entities](./../transform-model/dataflows/dataflows-premium-features.md#computed-entities) |Perform in-storage computations |Gen2 or Premium (original version) |
|[Dataflows enhanced compute engine](./../transform-model/dataflows/dataflows-premium-features.md#the-enhanced-compute-engine) |Optimize the use of dataflows |Gen2 or Premium (original version)</br>Both require A3 or larger capacities |
|[Dataflows incremental refresh](./../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh) |Use incremental refresh with dataflows |Gen2 or Premium (original version) |
|[Dataflows linked entities](./../transform-model/dataflows/dataflows-premium-features.md#linked-entities) |Reference other dataflows | Gen2, Premium (original version) or Premium Per User (PPU) |
|[Deployment pipelines](./../create-reports/deployment-pipelines-overview.md) |Manage the lifecycle of your Power BI content |Gen2, Premium (original version) or Premium Per User (PPU) |
|[DirectQuery with dataflows](./../transform-model/dataflows/dataflows-premium-features.md#use-directquery-with-dataflows-in-power-bi) |Connect directly to your dataflow without having to import its data |Gen2 or Premium (original version) |
|Hybrid tables (preview) |Incremental refresh augmented with real-time data |Gen2, Premium (original version) or Premium Per User (PPU) |
|[Insights](./../create-reports/insights.md) (preview) |Explore and find insights such as anomalies and trends in your reports |Gen2, Premium (original version) or Premium Per User (PPU) |
|[Large datasets](service-premium-what-is.md#large-datasets) |Datasets can be 12 GB in size |Gen2, Premium (original version) or Premium Per User (PPU) |
|[Model size limit](service-premium-gen2-what-is.md#capacity-nodes-for-premium-gen2) |Available memory is set to:</br>*Gen2* - The limit of memory footprint of a single Power BI item; see the column *RAM* in the table at the bottom of [Limitations in Premium Gen2](service-premium-gen2-what-is.md#limitations-in-premium-gen2)</br>*Premium (original version)* - The cumulative consumption of memory of the capacity; see the column *RAM* in the table at the bottom of [Capacity nodes](service-premium-what-is.md#capacity-nodes) |Gen2 or Premium (original version) |
|[Multi-geo](service-admin-premium-multi-geo.md) |Deploy content to data centers in regions other than the home region of your tenant |Gen2 or Premium (original version) |
|On-demand loading capabilities for large models |Improve report load time by loading some pages only when needed |Gen2, Premium (original version) or Premium Per User (PPU) |
|[Paginated reports](./../paginated-reports/paginated-reports-report-builder-power-bi.md) |Reports that are designed for print |Gen2 or Premium (original version) |
|[Power BI Report Server](./../report-server/get-started.md) |On-premises report server |Gen2 or Premium (original version) |
|Refresh rate |[*Gen2*](service-premium-gen2-what-is.md#refresh-in-premium-gen2) - Concurrent dataset refreshes don't contribute to resource constraints</br>*Premium (original version)* - See the table at the bottom of [Capacity nodes](service-premium-what-is.md#capacity-nodes) |Gen2 or Premium (original version) |
|[Query caching](./../connect-data/power-bi-query-caching.md) |Speed up reports by using local caching |Gen2 or Premium (original version) |
|[Storage](service-admin-manage-your-data-storage-in-power-bi.md) |Manage data storage |Gen2 or Premium (original version) |
|[Streaming dataflows](./../transform-model/dataflows/dataflows-streaming.md) (preview) |Connect to, ingest, mash up, model, and build reports using near real-time data |Gen2 or Premium (original version) |
|[Unlimited content sharing](service-premium-what-is.md#unlimited-content-sharing) |Share Power BI content with anyone |Gen2 or Premium (original version) |
|[XMLA read/write](service-premium-connect-tools.md) |Enable XMLA endpoint |Gen2, Premium (original version) or Premium Per User (PPU) |

## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [What is Power BI Premium?](service-premium-what-is.md)
