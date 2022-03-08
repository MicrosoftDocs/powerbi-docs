---
title: Power BI Premium features.
description: Learn which features are available for Power BI Premium.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: overview
ms.date: 02/28/2022
LocalizationGroup: Premium 
---

# Power BI Premium features

This article lists the main Power BI Premium features. Most of the features apply to all the Power BI Premium licenses, [Premium Gen2](service-premium-gen2-what-is.md), [Premium (original version)](service-premium-what-is.md) and [Premium Per User (PPU)](service-premium-per-user-faq.yml). When a feature only works with a specific license, the required license is indicated in the *description* field. If no license is listed, the feature works with any license.

>[!IMPORTANT]
>During March 2022, Microsoft will transition all [Premium (original version)](service-premium-what-is.md) capacities to the modern [Premium Gen2](service-premium-gen2-what-is.md) platform.

## Power BI Premium feature list

|Feature |Description |
|--------|------------|
|[Advanced AI](../../transform-model/dataflows/dataflows-machine-learning-integration.md) |Use artificial intelligence (AI) with dataflows |
|[Asynchronous refresh](../../connect-data/asynchronous-refresh.md) (preview) |Perform asynchronous data-refresh operations |
|[Automatic aggregations](aggregations-auto.md) (preview) |Optimize DirectQuery datasets |
|[Autoscale](service-premium-auto-scale.md) |Automatically add compute capability when your capacity is overloaded</br></br>Available for [Premium Gen2](service-premium-gen2-what-is.md) only |
|[Backup and restore](service-premium-backup-restore-dataset.md) |Backup and restore data using XMLA endpoints |
|[Bring your own key (BYOK)](service-encryption-byok.md) |Use your own keys to encrypt data</br></br>Available for [Premium Gen2](service-premium-gen2-what-is.md) and [Premium (original version)](service-premium-what-is.md) |
|[Dataflows computed entities](../../transform-model/dataflows/dataflows-premium-features.md#computed-entities) |Perform in-storage computations |
|[Dataflows enhanced compute engine](../../transform-model/dataflows/dataflows-premium-features.md#the-enhanced-compute-engine) |Optimize the use of dataflows |
|[Dataflows incremental refresh](../../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh) |Use incremental refresh with dataflows |
|[Dataflows linked entities](../../transform-model/dataflows/dataflows-premium-features.md#linked-entities) |Reference other dataflows |
|[Deployment pipelines](../../create-reports/deployment-pipelines-overview.md) |Manage the lifecycle of your Power BI content |
|[DirectQuery with dataflows](../../transform-model/dataflows/dataflows-premium-features.md#use-directquery-with-dataflows-in-power-bi) |Connect directly to your dataflow without having to import its data |
|Hybrid tables (preview) |Incremental refresh augmented with real-time data |
|[Insights](../../create-reports/insights.md) (preview) |Explore and find insights such as anomalies and trends in your reports |
|[Model size limit](service-premium-gen2-what-is.md#capacity-nodes-for-premium-gen2) |Available memory is set to:</br></br>*Premium Gen2* - The limit of memory footprint of a single Power BI item; see the column *RAM* in the table at the bottom of [Limitations in Premium Gen2](service-premium-gen2-what-is.md#limitations-in-premium-gen2)</br></br>*Premium (original version)* - The cumulative consumption of memory of the capacity; see the column *RAM* in the table at the bottom of [Capacity nodes](service-premium-what-is.md#capacity-nodes)</br></br>*Premium Per User (PPU)* - See [Considerations and limitations](service-premium-per-user-faq.yml#considerations-and-limitations) |
|[Multi-geo](../../admin/service-admin-premium-multi-geo.md) |Deploy content to data centers in regions other than the home region of your tenant</br></br>Available for [Premium Gen2](service-premium-gen2-what-is.md) and [Premium (original version)](service-premium-what-is.md) |
|On-demand loading capabilities for large models |Improve report load time by loading datasets to memory on demand |
|[Paginated reports](../../paginated-reports/paginated-reports-report-builder-power-bi.md) |Pixel-perfect reports |
|[Power BI Report Server](../../report-server/get-started.md) |On-premises report server</br></br>Available for [Premium Gen2](service-premium-gen2-what-is.md) and [Premium Per User (PPU)](service-premium-per-user-faq.yml) |
|Refresh rate |The ability to [refresh more than eight times a day](../../connect-data/refresh-data.md#data-refresh)|
|[Query caching](../../connect-data/power-bi-query-caching.md) |Speed up reports by using local caching |
|[Storage](../../admin/service-admin-manage-your-data-storage-in-power-bi.md) |Manage data storage |
|[Streaming dataflows](./../transform-model/dataflows/dataflows-streaming.md) (preview) |Connect to, ingest, mash up, model, and build reports using near real-time data |
|[Unlimited content sharing](service-premium-what-is.md#unlimited-content-sharing) |Share Power BI content with anyone</br></br>Available for [Premium Gen2](service-premium-gen2-what-is.md) and [Premium (original version)](service-premium-what-is.md) |
|[Virtual network data gateway](/data-integration/vnet/overview) (preview) | Connect from Microsoft Cloud to Azure using a virtual network (VNet) |
|[XMLA read/write](service-premium-connect-tools.md) |Enable XMLA endpoint |

## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [What is Power BI Premium?](service-premium-what-is.md)
