---
title: Power BI Premium features.
description: Learn which features are available for Power BI Premium.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: overview
ms.date: 02/20/2022
LocalizationGroup: Premium 
---

# Power BI Premium features

This article lists the main Power BI Premium features.

>[!IMPORTANT]
>During March 2022, Microsoft will transition all [Premium (original version)](service-premium-what-is.md) capacities to the modern [Gen2](service-premium-gen2-what-is.md) platform.

|Feature |Description |Required license |
|--------|------------|-----------------|
|[Advanced AI (Cognitive services, AutoML)](./../transform-model/dataflows/dataflows-machine-learning-integration.md) |Use artificial intelligence (AI) with dataflows |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Asynchronous refresh](./../connect-data/asynchronous-refresh.md) (preview) |Perform asynchronous data-refresh operations |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[Automatic aggregations](aggregations-auto.md) (preview) |Optimize DirectQuery datasets |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Autoscale](service-premium-auto-scale.md) |Automatically add compute capability when your capacity is overloaded |[Gen2](service-premium-gen2-what-is.md) |
|[Backup and restore](service-premium-backup-restore-dataset.md) |Backup and restore data using XMLA endpoints |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[Bring your own key (BYOK)](service-encryption-byok.md) |Use your own keys to encrypt data |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Dataflows computed entities](./../transform-model/dataflows/dataflows-premium-features.md#computed-entities) |Perform in-storage computations |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Dataflows enhanced compute engine](./../transform-model/dataflows/dataflows-premium-features.md#the-enhanced-compute-engine) |Optimize the use of dataflows |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md)</br>Both require A3 or larger capacities |
|[Dataflows incremental refresh](./../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh) |Use incremental refresh with dataflows |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Dataflows linked entities](./../transform-model/dataflows/dataflows-premium-features.md#linked-entities) |Reference other dataflows | [Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[Deployment pipelines](./../create-reports/deployment-pipelines-overview.md) |Manage the lifecycle of your Power BI content |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[DirectQuery with dataflows](./../transform-model/dataflows/dataflows-premium-features.md#use-directquery-with-dataflows-in-power-bi) |Connect directly to your dataflow without having to import its data |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|Hybrid tables (preview) |Incremental refresh augmented with real-time data |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[Insights](./../create-reports/insights.md) (preview) |Explore and find insights such as anomalies and trends in your reports |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[Large datasets](service-premium-what-is.md#large-datasets) |Datasets can be 12 GB in size |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[Model size limit](service-premium-gen2-what-is.md#capacity-nodes-for-premium-gen2) |Available memory is set to:</br>*Gen2* - The limit of memory footprint of a single Power BI item; see the column *RAM* in the table at the bottom of [Limitations in Premium Gen2](service-premium-gen2-what-is.md#limitations-in-premium-gen2)</br>*Premium (original version)* - The cumulative consumption of memory of the capacity; see the column *RAM* in the table at the bottom of [Capacity nodes](service-premium-what-is.md#capacity-nodes)</br>*PPU* - See [Considerations and limitations](service-premium-per-user-faq.yml#considerations-and-limitations) |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[Multi-geo](service-admin-premium-multi-geo.md) |Deploy content to data centers in regions other than the home region of your tenant |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|On-demand loading capabilities for large models |Improve report load time by loading datasets to memory on demand |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|[Paginated reports](./../paginated-reports/paginated-reports-report-builder-power-bi.md) |Pixel-perfect reports |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Power BI Report Server](./../report-server/get-started.md) |On-premises report server |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|Refresh rate |The ability to [refresh more than eight times a day](./../connect-data/refresh-data.md#data-refresh)|[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Query caching](./../connect-data/power-bi-query-caching.md) |Speed up reports by using local caching |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Storage](service-admin-manage-your-data-storage-in-power-bi.md) |Manage data storage |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[Streaming dataflows](./../transform-model/dataflows/dataflows-streaming.md) (preview) |Connect to, ingest, mash up, model, and build reports using near real-time data |Gen2 or Premium (original version) |
|[Unlimited content sharing](service-premium-what-is.md#unlimited-content-sharing) |Share Power BI content with anyone |[Gen2](service-premium-gen2-what-is.md) or [Premium (original version)](service-premium-what-is.md) |
|[XMLA read/write](service-premium-connect-tools.md) |Enable XMLA endpoint |[Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) or [Premium Per User (PPU)](service-premium-per-user-faq.yml) |

## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [What is Power BI Premium?](service-premium-what-is.md)
