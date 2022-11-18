---
title: What is Power BI Premium Gen2?
description: Power BI Premium Gen2 provides streamlined use and management of capacities for your organization.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 09/15/2022
ms.custom: licensing support, intro-overview
LocalizationGroup: Premium
---


# What is Power BI Premium Gen2?

*Power BI Premium Generation 2*, referred to as *Premium Gen2*, is the second generation of Power BI Premium. Premium Gen2 provides additional enhancements to Power BI, and a comprehensive portfolio of [Premium features](service-premium-features.md).

The following table lists some of the Premium Gen2 enhancements.

|Enhancement           |Details  |
|----------------------|---------|
|Purchase Premium for individuals in your organization  |See [Power BI Premium Per User (PPU)](service-premium-per-user-faq.yml). |
|Better performance    |Power BI operations will run at up to 16 times faster than previously, always perform at top speed, and won't slow down when the load on the capacity approaches the capacity limit. Premium Gen2 also provides separation between report interaction and scheduled refreshes across datasets, because datasets in a capacity are hosted across multiple backend nodes. |
|Improved metrics      |Capacity performance depends only on the amount of CPU usage. Metrics can be easily understood using the [Power BI Premium Capacity Utilization and Metrics](service-premium-gen2-metrics-app.md) app. |
|Autoscale             |An optional feature that prevents slowdowns caused by throttling on overloaded capacities. When enabled, if the load on the capacity exceeds the capacity limits, [autoscale](service-premium-auto-scale.md) automatically adds one v-core at a time for 24-hour periods. Additional v-cores are charged to your Azure subscription on a pay-as-you-go basis. |

>[!NOTE]
>To review the Power BI Embedded Gen2 enhancements, refer to [Power BI Embedded Generation 2](../developer/embedded/power-bi-embedded-generation-2.md).

## Capacities and SKUs

[!INCLUDE [what is capacity](../includes/what-is-capacity.md)]

[!INCLUDE [capacity and SKUs](../includes/capacity-and-skus.md)]

The table below describes the resources and limits of each SKU.

| Capacity          |     |      |         | Dataset |        |     |       | Dataflow | Export API |
| ----------------- | --- | ---- | ------- | --- | ------ | --- | ----- | -------- | ---- |
| **Capacity SKUs** | **Total v-cores** |**Backend v-cores** | **Frontend v-cores** | **Max memory per dataset (GB)**<sup>1, 2, 3</sup> | **DirectQuery/Live connection (per second)**<sup>1, 2</sup> | **Max memory per query (GB)**<sup>1, 2</sup> | **Model refresh parallelism**<sup>2</sup> | **Dataflow parallel tasks**<sup>5</sup>  | **Max Concurrent Pages**<sup>6</sup> |
| EM1/A1            |   1 |  0.5 |  0.5 |   3 |   3.75 |  1  |   5  |  4 | 20 |
| EM2/A2            |   2 |  1   |  1   |   5 |   7.5  |  2  |  10  |  8 | 25 |
| EM3/A3            |   4 |  2   |  2   |  10 |  15    |  2  |  20  | 16 | 35 |
| P1/A4             |   8 |  4   |  4   |  25 |  30    |  6  |  40  | 32 | 50 |
| P2/A5             |  16 |  8   |  8   |  50 |  60    |  6  |  80  | 64 | 95 |
| P3/A6             |  32 | 16   | 16   | 100 | 120    | 10  | 160  | 64 | 175 |
| P4/A7<sup>4</sup> |  64 | 32   | 32   | 200 | 240    | 10  | 320  | 64 | 200 |
| P5/A8<sup>4</sup> | 128 | 64   | 64   | 400 | 480    | 10  | 640  | 64 | 200 |

<sup>1</sup> The [Power BI Premium Utilization and Metrics app](service-premium-install-gen2-app.md) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the datasets workload per capacity.

<sup>3</sup> The *Max memory per dataset (GB)* column represents an upper bound for the dataset size. However, an amount of memory must be reserved for operations such as refreshes and queries on the dataset. The maximum dataset size permitted on a capacity may be smaller than the numbers in this column.

<sup>4</sup> SKUs greater than 100 GB aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

<sup>5</sup> Learn more about [parallel tasks in dataflows](/power-query/dataflows/what-licenses-do-you-need-in-order-to-use-dataflows#power-bi-premium).

<sup>6</sup> Review [Export API Considerations and Limitations](../developer/embedded/export-to#concurrent-requests) for Power BI interactive (not paginated) reports.

## Subscriptions and licensing

Power BI Premium Gen2 is a tenant-level Microsoft 365 subscription, available in two SKU (Stock-Keeping Unit) families.

|               |P                                 |EM       |
|---------------|----------------------------------|---------|
|**Range**      |P1-P5                             |EM1-EM3  |
|**Use**        |Enterprise features and embedding |Organizational embedding ([embed for your organization](../developer/embedded/embedded-analytics-power-bi.md#embed-for-your-organization)) |
|**Commitment** |Monthly or yearly                 |Yearly   |
|**Billing**    |Monthly                           |Monthly  |
|**Additional information**    |Includes a license to install [Power BI Report Server](../report-server/get-started.md) on-premises |EM1 and EM2 SKUs are available only through volume licensing plans. You can't purchase them directly.         |

## Purchasing

Power BI Premium subscriptions are purchased by administrators in the Microsoft 365 admin center. Specifically, only global administrators or billing administrators can purchase SKUs. When purchased, the tenant receives a corresponding number of v-cores to assign to capacities, known as *v-core pooling*. For example, purchasing a P3 SKU provides the tenant with 32 v-cores. To learn more, see [How to purchase Power BI Premium](service-admin-premium-purchase.md).

## Workspaces

Workspaces reside within capacities. Each Power BI user has a personal workspace known as *My Workspace*. Additional workspaces known as *workspaces* can be created to enable collaboration. By default, workspaces, including personal workspaces, are created in the shared capacity. When you have Premium capacities, both My Workspaces and workspaces can be assigned to Premium capacities.

Capacity administrators automatically have their My workspaces assigned to Premium capacities.

## Memory allocation

With *Premium Gen2* and [Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md), the amount of memory available on each SKU is set to the limit of the memory consumption of a single Power BI item. For example, in a Premium Gen2 P1 capacity, you can host as many Power BI items as you need, as long as the size of your largest Power BI item isn't bigger than 25 GB. You can find the memory upper limits for each SKU, in the *Max memory per dataset* column of the [Capacities and SKUs](#capacities-and-skus) table.

In the first generation of Premium and Embedded, memory was restricted to a limited amount of RAM used by all items simultaneously running. In *Premium Gen2* and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md), there's no memory limit for the capacity as a whole. Instead, individual items (such as datasets, dataflows and paginated reports) can't exceed the amount of memory the capacity SKU offers. This includes all the operations ([interactive and background](service-premium-interactive-background-operations.md)) being processed for the item while it's in use. Dataset operations such as queries are also subject to individual memory limits.

To illustrate the restriction, consider a dataset with an in-memory footprint of 1 GB, and a user initiating an on-demand refresh while interacting with a report based on the same dataset. Three separate actions determine the amount of memory attributed to the original dataset, which may be larger than two times the dataset size. The total amount of memory used by one Power BI item can't exceed the SKU's *Max memory per dataset* allocation.

* **Loading the dataset** - The first action is loading the dataset into the memory.

* **Refreshing the dataset** - The second action is refreshing the dataset after it's loaded into the memory. The refresh operation will cause the memory used by the dataset to double. The required memory doubles because the original copy of data is still available for active queries, while another copy is being processed by the refresh. Once the refresh transaction commits, the memory footprint will reduce.

* **Interacting with the report** - The third action is caused by the user's interaction with the report. During the dataset refresh, report interactions will execute DAX queries. Each DAX query consumes a certain amount of temporary memory required to produce the results. Each query may consume a different amount of memory. The memory used to query the dataset is added to the memory needed to load the dataset, and refresh it.

## Refreshes

Premium Gen2 and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md) don't require cumulative memory limits, and therefore concurrent dataset refreshes don't contribute to resource constraints. There's no limit on the number of refreshes running per v-core. However, the refresh of individual datasets continues to be governed by existing capacity memory and CPU limits. You can schedule and run as many refreshes as required at any given time, and the Power BI service will run those refreshes at the time scheduled as a best effort.

## Monitoring

When monitoring Premium Gen2 and [Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md), you only need to take into consideration one aspect: *how much CPU your capacity requires to serve the load at any moment*. To monitor your capacity, use the [Power BI Premium Capacity Utilization and Metrics](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.pbipremiumcapacitymonitoringreport?tab=Overview) app.

To install the app, see [Install the Gen2 metrics app](service-premium-install-gen2-app.md). You can learn how to use the app in the article [Use the Gen2 metrics app](service-premium-gen2-metrics-app.md).

Here's what happens when you exceed your CPU limit per the SKU size you purchased:

* **Premium Gen2** - If enabled, [autoscale](service-premium-auto-scale.md) kicks in. If autoscale isn't enabled, your capacity throttles its [interactive operations](service-premium-interactive-background-operations.md#interactive-operations).

* **[Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md)** - Your capacity throttles its [interactive operations](service-premium-interactive-background-operations.md#interactive-operations). To autoscale in Embedded Gen2, see [Autoscaling in Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md#autoscaling-in-embedded-gen2).

## Paginated reports

When using *Premium Gen2* and [Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md), Power BI [paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md) benefit from the architectural and engineering improvements reflected in Premium Gen2.

* **Memory** - There's no memory management for Paginated reports.

* **SKU availability** - Paginated reports running on Premium Gen2 can run reports across all available embedded and Premium SKUs, including the EM1-EM3 and A1-A3 SKUs. Billing is calculated per CPU hour, across a 24-hour period.

* **Enhanced security and code isolation** - Code isolation occurs at a per-user level, rather than at a per-capacity level.

## Considerations and limitations

The following known limitations currently apply to Premium Gen2.

* **Rendering visuals** - There's a 225-second limitation for rendering Power BI visuals. Visuals that take longer to render, will be timed-out and won't display.

* **Throttling** - Throttling can occur in Power BI Premium capacities. Concurrency limits are applied per session. An error message will appear when too many operations are being processed concurrently. To mitigate throttling, you can use [autoscale](service-premium-auto-scale.md). When autoscale is enabled, if CPU consumption exceeds the additional limits, throttling will still take place.

* **Client library version** - [Client applications and tools](service-premium-connect-tools.md#client-applications-and-tools) that connect to and work with datasets on Premium Gen2 capacities through the [XMLA endpoint](service-premium-connect-tools.md) require Analysis Services client libraries. Most client applications and tools install the most recent client libraries with regular updates, so manually installing the client libraries isn't usually necessary. Regardless of the client application or tool version, the following minimum client library versions are required.

    | Client Library | Version    |
    |----------------|------------|
    | MSOLAP         | 15.1.65.22 |
    | AMO            | 19.12.7.0  |
    | ADOMD          | 19.12.7.0  |

    In some cases, manually installing the most recent client libraries may be necessary to reduce potential connection and operation errors. To learn more about verifying existing installed client library versions and manually installing the most recent versions, see [Analysis Services client libraries](/analysis-services/client-libraries?view=power-bi-premium-current&preserve-view=true).

## Next steps

> [!div class="nextstepaction"]
> [Power BI Premium Per User](service-premium-per-user-faq.yml)

> [!div class="nextstepaction"]
> [Managing Premium capacities](service-premium-capacity-manage.md)

> [!div class="nextstepaction"]
> [Power BI Embedded Generation 2](../developer/embedded/power-bi-embedded-generation-2.md)
