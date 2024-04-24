---
title: Power BI Premium features.
description: Learn which features are available for Power BI Premium.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: overview
ms.date: 06/21/2022
LocalizationGroup: Premium
---

# Power BI Premium features

This article lists the main Power BI Premium features. Most of the features apply to all the Power BI [Premium](service-premium-what-is.md) licenses, including [Premium Per User (PPU)](service-premium-per-user-faq.yml) and [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md). When a feature only works with a specific license, the required license is indicated in the *description* field. If no license is listed, the feature works with any license.

## Power BI Premium feature list

|Feature |Description |
|--------|------------|
|[Advanced AI](../transform-model/dataflows/dataflows-machine-learning-integration.md) |Use artificial intelligence (AI) with dataflows |
|[Asynchronous refresh](../connect-data/asynchronous-refresh.md) |Perform asynchronous data-refresh operations |
|[Automatic aggregations](aggregations-auto.md) |Optimize DirectQuery semantic models |
|[Autoscale](service-premium-auto-scale.md) |Automatically add compute capability when your capacity is overloaded</br></br>Available for [Premium](service-premium-what-is.md) only |
|[Backup and restore](service-premium-backup-restore-dataset.md) |Backup and restore data using XMLA endpoints |
|[Bring your own key (BYOK)](service-encryption-byok.md) |Use your own keys to encrypt data</br></br>Available for [Premium](service-premium-what-is.md) and [Embedded](../developer/embedded/embedded-analytics-power-bi.md) |
|[Dataflows](../transform-model/dataflows/dataflows-premium-features.md) |<ul><li>[Perform in-storage computations](../transform-model/dataflows/dataflows-premium-features.md#computed-entities)</li><li>[Optimize the use of dataflows](../transform-model/dataflows/dataflows-premium-features.md#the-enhanced-compute-engine)</li><li>[Use incremental refresh with dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)</li><li>[Reference other dataflows](../transform-model/dataflows/dataflows-premium-features.md#linked-entities)</li></ul> |
|[Datamarts](../transform-model/datamarts/datamarts-overview.md) |Self-service solution enabling users to store and explore data that's loaded in a fully managed database|
|[Deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) |Manage the lifecycle of your Power BI content |
|[DirectQuery with dataflows](../transform-model/dataflows/dataflows-premium-features.md#use-directquery-with-dataflows-in-power-bi) |Connect directly to your dataflow without having to import its data |
|Hybrid tables (preview) |Incremental refresh augmented with real-time data |
|[Insights](../create-reports/insights.md) (preview) |Explore and find insights such as anomalies and trends in your reports |
|[Model size limit](service-premium-what-is.md#semantic-model-sku-limitation) |Available memory is set to:</br></br>*Premium* - The limit of memory footprint of a single Power BI semantic model; see the column *Max memory per semantic model* in the [Capacities and SKUs](service-premium-what-is.md#capacities-and-skus) table</br></br>*Premium Per User (PPU)* - See [Considerations and limitations](service-premium-per-user-faq.yml#considerations-and-limitations)</br></br>*Embedded* - See the column *Max memory per semantic model* in the [SKU memory and computing power](../developer/embedded/embedded-capacity.md#sku-computing-power) table|
|[Multi-geo](../admin/service-admin-premium-multi-geo.md) |Deploy content to data centers in regions other than the home region of your tenant</br></br>Available for [Premium](service-premium-what-is.md) and [Embedded](../developer/embedded/embedded-analytics-power-bi.md)  |
|On-demand loading capabilities for large models |Improve report load time by loading semantic models to memory on demand |
|[Power BI Report Server](./../report-server/get-started.md) |On-premises report server</br></br>Available for [Premium](service-premium-what-is.md) only |
|Refresh rate |The ability to [refresh more than eight times a day](../connect-data/refresh-data.md#data-refresh)|
|[Query caching](../connect-data/power-bi-query-caching.md) |Speed up reports by using local caching |
|[Storage](../admin/service-admin-manage-your-data-storage-in-power-bi.md) |Manage data storage |
|[Streaming dataflows](./../transform-model/dataflows/dataflows-streaming.md) (preview) |Connect to, ingest, mash up, model, and build reports using near real-time data |
|Unlimited content sharing |Share Power BI content with anyone</br></br>Available for [Premium](service-premium-what-is.md) only |
|[Virtual network data gateway](/data-integration/vnet/overview) (preview) | Connect from Microsoft Cloud to Azure using a virtual network (VNet) |
|[XMLA read/write](service-premium-connect-tools.md) |Enable XMLA endpoint |

## Related content

> [!div class="nextstepaction"]
> [What is Power BI Premium?](service-premium-what-is.md)
