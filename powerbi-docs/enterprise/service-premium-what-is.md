---
title: What is Power BI Premium?
description: Power BI Premium provides streamlined use and management of capacities for your organization.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 07/14/2024
ms.custom: licensing support, intro-overview
LocalizationGroup: Premium
---

# What is Power BI Premium?

This article describes Power BI Premium operations and considerations, to view a high level description of how Microsoft Fabric works, see [Microsoft Fabric concepts and licenses](/fabric/enterprise/licenses).

Power BI Premium provides enhancements to Power BI, and a comprehensive portfolio of [Premium features](service-premium-features.md). The following table lists some of the Premium enhancements.

|Enhancement           |Details  |
|----------------------|---------|
|Purchase Premium for individuals in your organization  |See [Power BI Premium Per User (PPU)](service-premium-per-user-faq.yml). |
|Improved metrics      |Capacity performance depends only on the amount of CPU usage. Metrics can be easily understood using the [Microsoft Fabric Capacity Metrics](/fabric/enterprise/metrics-app) app. |
|Autoscale             |An optional feature that prevents slowdowns caused by throttling on overloaded capacities. When enabled, if the load on the capacity exceeds the capacity limits, [autoscale](service-premium-auto-scale.md) automatically adds one v-core at a time for 24-hour periods. Additional v-cores are charged to your Azure subscription on a pay-as-you-go basis. |

## Capacities and SKUs

[!INCLUDE [what is capacity](../includes/what-is-capacity.md)]

[!INCLUDE [capacity and SKUs](../includes/capacity-and-skus.md)]

[!INCLUDE [Power BI capacity and SKUs](../includes/capacity-table.md)]

## Subscriptions and licensing

Power BI Premium is a tenant-level Microsoft 365 subscription, available in two SKU (Stock-Keeping Unit) families.

|               |P                                 |EM       |
|---------------|----------------------------------|---------|
|**Range**      |P1-P5                             |EM1-EM3  |
|**Use**        |Enterprise features and embedding |Organizational embedding ([embed for your organization](../developer/embedded/embedded-analytics-power-bi.md#embed-for-your-organization)) |
|**Commitment** |Monthly or yearly                 |Yearly   |
|**Billing**    |Monthly                           |Monthly  |
|**Additional information**    |Includes a license to install [Power BI Report Server](../report-server/get-started.md) on-premises |EM1 and EM2 SKUs are available only through volume licensing plans. You can't purchase them directly.         |

## Purchasing

Power BI Premium subscriptions are purchased by administrators in the Microsoft 365 admin center. Specifically, only global administrators or billing administrators can purchase SKUs. When purchased, the tenant receives a corresponding number of v-cores to assign to capacities, known as *v-core pooling*. For example, purchasing a P3 SKU provides the tenant with 32 v-cores. To learn more, see [How to purchase Power BI Premium](/power-bi/enterprise).

## Workspaces

Workspaces reside within capacities. Each Power BI user has a personal workspace known as *My Workspace*. Additional workspaces known as *workspaces* can be created to enable collaboration. By default, workspaces, including personal workspaces, are created in the shared capacity. When you have Premium capacities, both My Workspaces and workspaces can be assigned to Premium capacities.

Capacity administrators automatically have their My workspaces assigned to Premium capacities.

## Semantic model SKU limitation

With *Power BI Premium* and [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md), there are memory limits and other constraints for each SKU listed in the table below.

| SKU | Max memory (GB)<sup>1, 2</sup> | Max concurrent DirectQuery connections (per semantic model)<sup>1</sup> | Max DirectQuery parallelism<sup>3</sup> | Live connection (per second)<sup>1</sup> | Max memory per query (GB)<sup>1</sup> | Model refresh parallelism | Direct Lake rows per table (in millions)<sup>1, 4</sup>  | Max Direct Lake model size on OneLake (GB)<sup>1, 4</sup> |
| ---   | --- | --- | --- | -------    | -- | ----- | ------ | --------- |
| F2    |   3 |   5 |   1     |   2    |  1 |     1 |    300 | 10        |
| F4    |   3 |   5 |   1     |   2    |  1 |     2 |    300 | 10        |
| F8    |   3 |  10 |   1     |   3.75 |  1 |     5 |    300 | 10        |
| F16   |   5 |  10 |   1     |   7.5  |  2 |    10 |    300 | 20        |
| F32   |  10 |  10 |   1     |  15    |  5 |    20 |    300 | 40        |
| F64   |  25 |  50 |  4 - 8  |  30    | 10 |    40 |  1,500 | Unlimited |
| F128  |  50 |  75 |  6 - 12 |  60    | 10 |    80 |  3,000 | Unlimited |
| F256  | 100 | 100 |  8 - 16 | 120    | 10 |   160 |  6,000 | Unlimited |
| F512  | 200 | 200 | 10 - 20 | 240    | 20 |   320 | 12,000 | Unlimited |
| F1024 | 400 | 200 | 12 - 24 | 480    | 40 |   640 | 24,000 | Unlimited |
| F2048 | 400 | 200 |         | 960    | 40 | 1,280 | 24,000 | Unlimited |

<sup>1</sup> The [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) doesn't currently expose these metrics.

<sup>2</sup> The *Max memory (GB)* column represents an upper bound for the semantic model size. However, an amount of memory must be reserved for operations such as refreshes and queries on the semantic model. The maximum semantic model size permitted on a capacity might be smaller than the numbers in this column.

<sup>3</sup> [DirectQuery parallelism](https://powerbi.microsoft.com/blog/query-parallelization-helps-to-boost-power-bi-dataset-performance-in-directquery-mode/) can improve your query response times. The lower number indicates the default maximum number of queries that can be processed at the same time. The higher number indicates the maximum number of queries that can be processed at the same time. To change the default use the [Model.MaxParallelismPerQuery](/dotnet/api/microsoft.analysisservices.tabular.model.maxparallelismperquery) property.

<sup>4</sup> These limits apply to Direct Lake tables and models, and are guardrails that affect fallback to DirectQuery. Direct Lake semantic models have additional constraints that are based on SKUs, as listed in [fallback](/fabric/get-started/direct-lake-overview#fallback).

### Semantic model memory usage

Semantic model operations such as queries are subject to individual memory limits. To illustrate the restriction, consider a semantic model with an in-memory footprint of 1 GB, and a user initiating an on-demand refresh while interacting with a report based on the same semantic model. Three separate actions determine the amount of memory attributed to the original semantic model, which may be larger than two times the semantic model size. The total amount of memory used by one Power BI item can't exceed the SKU's *Max memory per semantic model* allocation.

* **Loading the semantic model** - The first action is loading the semantic model into the memory.

* **Refreshing the semantic model** - The second action is refreshing the semantic model after it's loaded into the memory. The refresh operation will cause the memory used by the semantic model to double. The required memory doubles because the original copy of data is still available for active queries, while another copy is being processed by the refresh. Once the refresh transaction commits, the memory footprint will reduce.

* **Interacting with the report** - The third action is caused by the user's interaction with the report. During the semantic model refresh, report interactions will execute DAX queries. Each DAX query consumes a certain amount of temporary memory required to produce the results. Each query may consume a different amount of memory. The memory used to query the semantic model is added to the memory needed to load the semantic model, and refresh it.

## Refreshes

Power BI Premium and [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md) don't require cumulative memory limits, and therefore concurrent semantic model refreshes don't contribute to resource constraints. However, refreshing individual semantic models is governed by existing capacity memory and CPU limits, and the model refresh parallelism limit for the SKU, as described in [Capacities and SKUs](#capacities-and-skus).

You can schedule and run as many refreshes as required at any given time, and the Power BI service will run those refreshes at the time scheduled as a best effort.

## Monitoring

When monitoring Power BI Premium and [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md), you only need to take into consideration one aspect: *how much CPU your capacity requires to serve the load at any moment*. To monitor your capacity, use the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) app.

To install the app, see [Install the Microsoft Fabric capacity metrics app](/fabric/enterprise/metrics-app-install). You can learn how to use the app in the article [Microsoft Fabric Capacity Metrics](/fabric/enterprise/metrics-app).

Here's what happens when you exceed your CPU limit per the SKU size you purchased:

* **Power BI Premium** - If enabled, [autoscale](service-premium-auto-scale.md) kicks in. If autoscale isn't enabled, your capacity throttles its [interactive operations](/fabric/enterprise/fabric-operations#interactive-operations).

* **[Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md)** - Your capacity throttles its [interactive operations](/fabric/enterprise/fabric-operations#interactive-and-background-operations). To autoscale in Power BI Embedded, see [Autoscaling in Power BI Embedded](../developer/embedded/azure-pbie-scale-capacity.md#autoscale-your-capacity).

## Paginated reports

When using *Power BI Premium* and [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md), Power BI [paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md) benefit from the architectural and engineering improvements reflected in Power BI Premium.

* **Memory** - There's no memory management for Paginated reports.

* **SKU availability** - Paginated reports running on Power BI Premium can run reports across all available embedded and Premium SKUs, including the EM1-EM3 and A1-A3 SKUs. Billing is calculated per CPU hour, across a 24-hour period.

* **Enhanced security and code isolation** - Code isolation occurs at a per-user level, rather than at a per-capacity level.

## Dataflows Gen1 and Gen2

Each SKU can run a set number of Dataflows [parallel tasks](/power-query/dataflows/what-licenses-do-you-need-in-order-to-use-dataflows#power-bi-premium), as listed in this table.

| Fabric SKU | Dataflow Gen1 parallel tasks | Dataflow Gen2 parallel tasks |
| ---------- | ---------------------------- |------------------------------|
| F2         |  2                           | 96                           |
| F4         |  2                           | 96                           |
| F8         |  4                           | 96                           |
| F16        |  8                           | 96                           |
| F32        | 16                           | 96                           |
| F64        | 32                           | 384                          |
| F128       | 64                           | 384                          |
| F256       | 64                           | 384                          |
| F512       | 64                           | 1536                         |
| F1024      | 64                           | 1536                         |
| F2048      | 64                           | 1536                         |

To learn about Dataflow Gen2, see [Getting from Dataflow Generation 1 to Dataflow Generation 2](/fabric/data-factory/dataflows-gen2-overview).

## Considerations and limitations

The following known limitations currently apply to Power BI Premium.

* **Rendering visuals** - There's a 225-second limitation for rendering Power BI visuals. Visuals that take longer to render, will be timed-out and won't display.

* **Throttling** - Throttling can occur in Power BI Premium capacities. Concurrency limits are applied per session. An error message will appear when too many operations are being processed concurrently. To mitigate throttling, you can use [autoscale](service-premium-auto-scale.md). When autoscale is enabled, if CPU consumption exceeds the additional limits, throttling will still take place. To read more about throttling in Fabric, see [The Fabric throttling policy](/fabric/enterprise/throttling).

* **Client library version** - [Client applications and tools](service-premium-connect-tools.md#client-applications-and-tools) that connect to and work with semantic models on Premium capacities through the [XMLA endpoint](service-premium-connect-tools.md) require Analysis Services client libraries. Most client applications and tools install the most recent client libraries with regular updates, so manually installing the client libraries isn't usually necessary. Regardless of the client application or tool version, the following minimum client library versions are required.

    | Client Library | Version    |
    |----------------|------------|
    | MSOLAP         | 15.1.65.22 |
    | AMO            | 19.12.7.0  |
    | ADOMD          | 19.12.7.0  |

    In some cases, manually installing the most recent client libraries may be necessary to reduce potential connection and operation errors. To learn more about verifying existing installed client library versions and manually installing the most recent versions, see [Analysis Services client libraries](/analysis-services/client-libraries?view=power-bi-premium-current&preserve-view=true).

* **Semantic models compatibility** - Some semantic models are incompatible with the Power BI service modern infrastructure:
    * Semantic models created in Power BI service from CSV files.
    * Semantic models in the [admin monitoring workspace](/fabric/admin/monitoring-workspace) and usage metrics models.
    * Semantic models that still use 1103 compatibility level.
    * [Push semantic models](../connect-data/service-real-time-streaming.md#push-semantic-model).
    * Semantic models that use deprecated features such as content packs.

## Related content

> [!div class="nextstepaction"]
> [Power BI Premium Per User](service-premium-per-user-faq.yml)

> [!div class="nextstepaction"]
> [Managing Premium capacities](service-premium-capacity-manage.md)

> [!div class="nextstepaction"]
> [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md)
