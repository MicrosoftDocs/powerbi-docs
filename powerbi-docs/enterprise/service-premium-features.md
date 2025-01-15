---
title: Power BI Premium features.
description: Power BI Premium features.
author: KesemSharabi
ms.author: kesharab
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: overview
ms.date: 01/12/2025
LocalizationGroup: Premium
---

# Power BI Premium features

This article lists the main Power BI Premium features. Most of the features apply to all the Power BI [Premium](service-premium-what-is.md) licenses, including [Premium Per User (PPU)](service-premium-per-user-faq.yml) and [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md). When a feature only works with a specific license, the required license is indicated in the *description* field. If no license is listed, the feature works with any license.

## Power BI Premium feature list

|Feature |Description |
|--------|------------|
|[Asynchronous refresh](../connect-data/asynchronous-refresh.md) |Perform asynchronous data-refresh operations |
|[Automatic aggregations](aggregations-auto.md) |Optimize DirectQuery datasets |
|[Autoscale](service-premium-auto-scale.md) |Automatically add compute capability when your capacity is overloaded</br></br>Available for [Premium](service-premium-what-is.md) only, excluding EM SKUs |
|[Backup and restore](service-premium-backup-restore-dataset.md) |Backup and restore data using XMLA endpoints |
|[Bring your own key (BYOK)](service-encryption-byok.md) |Use your own keys to encrypt data</br></br>Available for [Premium](service-premium-what-is.md) and [Embedded](../developer/embedded/embedded-analytics-power-bi.md) |
|[Dataflows](../transform-model/dataflows/dataflows-premium-features.md) |<ul><li>[Perform in-storage computations](../transform-model/dataflows/dataflows-premium-features.md#computed-entities)</li><li>[Optimize the use of dataflows](../transform-model/dataflows/dataflows-premium-features.md#the-enhanced-compute-engine)</li><li>[Use incremental refresh with dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)</li><li>[Reference other dataflows](../transform-model/dataflows/dataflows-premium-features.md#linked-entities)</li></ul> |
|[Datamarts](../transform-model/datamarts/datamarts-overview.md) |Self-service solution enabling users to store and explore data that's loaded in a fully managed database|
|[Deployment pipelines](../create-reports/deployment-pipelines-overview.md) |Manage the lifecycle of your Power BI content |
|[DirectQuery with dataflows](../transform-model/dataflows/dataflows-premium-features.md#use-directquery-with-dataflows-in-power-bi) |Connect directly to your dataflow without having to import its data |
|[Hybrid tables](../connect-data/service-dataset-modes-understand.md#hybrid-tables) |Incremental refresh augmented with real-time data |
|[Insights](../create-reports/insights.md) (preview) |Explore and find insights such as anomalies and trends in your reports |
|[Model size limit](service-premium-what-is.md#capacities-and-skus) |Available memory is set to:</br></br>*Premium* - The limit of memory footprint of a single Power BI dataset; see the column *Max memory per dataset* in the [Capacities and SKUs](service-premium-what-is.md#capacities-and-skus) table</br></br>*Premium Per User (PPU)* - See [Considerations and limitations](service-premium-per-user-faq.yml#considerations-and-limitations)</br></br>*Embedded* - See the column *Max memory per dataset* in the [SKU memory and computing power](../developer/embedded/embedded-capacity.md#sku-computing-power) table|
|[Multi-geo](../admin/service-admin-premium-multi-geo.md) |Deploy content to data centers in regions other than the home region of your tenant</br></br>Available for [Premium](service-premium-what-is.md) and [Embedded](../developer/embedded/embedded-analytics-power-bi.md)  |
|[On-demand loading capabilities for large models](service-premium-large-models.md#on-demand-load) |Improve report load time by loading datasets to memory on demand |
|[Power BI Report Server](./../report-server/get-started.md) |On-premises report server</br></br>Available for [Premium](service-premium-what-is.md) only, excluding EM SKUs |
|Refresh rate |The ability to [refresh more than eight times a day](../connect-data/refresh-data.md#data-refresh)|
|[Query caching](../connect-data/power-bi-query-caching.md) |Speed up reports by using local caching |
|[Storage](../admin/service-admin-manage-your-data-storage-in-power-bi.md) |Manage data storage |
|[Unlimited content sharing](../consumer/end-user-features.md) |Share Power BI content with anyone</br></br>Available for [Premium](service-premium-what-is.md) only, excluding EM SKUs |
|[Virtual network data gateway](/data-integration/vnet/overview) (preview) | Connect from Microsoft Cloud to Azure using a virtual network (VNet) |
|[XMLA read/write](service-premium-connect-tools.md) |Enable XMLA endpoint |

## Next steps

* [What is Power BI Premium?](service-premium-what-is.md)
