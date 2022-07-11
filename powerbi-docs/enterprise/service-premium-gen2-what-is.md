---
title: What is Power BI Premium Gen2?
description: Power BI Premium Gen2 provides streamlined use and management of capacities for your organization.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 07/10/2022
ms.custom: licensing support, intro-overview
LocalizationGroup: Premium
---


# What is Power BI Premium Gen2?

**Power BI Premium Generation 2**, referred to as **Premium Gen2**, is the second generation of Power BI Premium.

The following table lists some of the Premium Gen2 enhancements.

|Enhancement  |Details  |
|---------|---------|
|**Premium Per User**     |See [Power BI Premium Per User](service-premium-per-user-faq.md).         |
|**Performance**     |Operations run up to 16 times faster than previously. Operations will always perform at top speed and won't slow down when the load on the capacity approaches the capacity limit.         |
|**Greater scale**     |         |
|**Improved metrics**     |Capacity performance depends only on the amount of CPU usage.         |
|**Autoscale**     |An optional feature that prevents slowdowns caused by throttling on overloaded capacities. When enabled, [autoscale](service-premium-auto-scale.md) automatically adds one v-core at a time for 24-hour periods, when the load on the capacity exceeds its limits. Additional v-cores are charged to your Azure subscription on a pay-as-you-go basis.        |
|**Separation**     |Complete separation between report interaction and scheduled refreshes         |

>[!NOTE]
>To review the Power BI Embedded Gen2 enhancements, refer to [Power BI Embedded Generation 2](../developer/embedded/power-bi-embedded-generation-2.md).

## Capacity 


The following table summarizes all the the capacity 

| Capacity SKUs | Total v-cores |Backend v-cores | Frontend v-cores | Max memory per dataset (GB)<sup>1, 2, 3</sup> | DirectQuery/Live connection (per second)<sup>1, 2</sup> | Max memory per query (GB)<sup>1, 2</sup> | Model refresh parallelism<sup>2</sup> |
| ----------------- | --- | ---- | ---- | --- | ------ | --- | ---- |
| EM1/A1            |   1 |  0.5 |  0.5 |   3 |   3.75 |  1  |   5  |
| EM2/A2            |   2 |  1   |  1   |   5 |   7.5  |  2  |  10  |
| EM3/A3            |   4 |  2   |  2   |  10 |  15    |  2  |  20  |
| P1/A4             |   8 |  4   |  4   |  25 |  30    |  6  |  40  |
| P2/A5             |  16 |  8   |  8   |  50 |  60    |  6  |  80  |
| P3/A6             |  32 | 16   | 16   | 100 | 120    | 10  | 160  |
| P4/A7<sup>4</sup> |  64 | 32   | 32   | 200 | 240    | 10  | 320  |
| P5/A8<sup>4</sup> | 128 | 64   | 64   | 400 | 480    | 10  | 640  |

<sup>1</sup> The [Power BI Premium Utilization and Metrics app](service-premium-install-gen2-app.md) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the datasets workload per capacity.

<sup>3</sup> The *Max memory per dataset (GB)* column represents an upper bound for the dataset size. However, an amount of memory must be reserved for operations such as refreshes and queries on the dataset. The maximum dataset size permitted on a capacity may be smaller than the numbers in this column.

<sup>4</sup> SKUs greater than 100 GB are not available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

## Subscriptions and licensing

Power BI Premium Gen2 is a tenant-level Microsoft 365 subscription, available in two SKU (Stock-Keeping Unit) families.

|Details        |P                                 |EM       |
|---------------|----------------------------------|---------|
|**Range**      |P1-P5                             |EM1-EM3  |
|**Use**        |Enterprise features and embedding |Organizational embedding ([embed for your organization](../developer/embedded/embedded-analytics-power-bi.md#embed-for-your-organization)) |
|**Commitment** |Monthly or yearly                 |Yearly   |
|**Billing**    |Monthly                           |Monthly  |
|**Additional information**    |Includes a license to install Power BI Report Server on-premises |EM1 and EM2 SKUs are available only through volume licensing plans. You can't purchase them directly.         |

## Purchasing

Power BI Premium subscriptions are purchased by administrators in the Microsoft 365 admin center. Specifically, only Global administrators or Billing Administrators can purchase SKUs. When purchased, the tenant receives a corresponding number of v-cores to assign to capacities, known as *v-core pooling*. For example, purchasing a P3 SKU provides the tenant with 32 v-cores. To learn more, see [How to purchase Power BI Premium](service-admin-premium-purchase.md).

## Workspaces and Premium Gen2

Workspaces reside within capacities. Each Power BI user has a personal workspace known as **My Workspace**. Additional workspaces known as **workspaces** can be created to enable collaboration. By default, workspaces, including personal workspaces, are created in the shared capacity. When you have Premium capacities, both My Workspaces and workspaces can be assigned to Premium capacities.

Capacity administrators automatically have their my workspaces assigned to Premium capacities.

## Memory allocation

With **Premium Gen2** and [Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md), the amount of memory available on each SKU is set to the limit of the memory footprint of a single Power BI item. For example, in a Premium Gen2 P1 capacity you can host as many Power BI items as you need, as long as the size of a your largest Power BI item is not bigger than 25 GB.

* Memory restrictions are different in Premium Gen2 and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md). In the first generation of Premium and Embedded, memory was restricted to a limited amount of RAM used by all items simultaneously running. In Gen2, there is no memory Limit for the capacity as a whole. Instead, individual items (such as datasets, dataflows, paginated reports) are subject to the following RAM limitations:

  * A single item cannot exceed the amount of memory the capacity SKU offers.

  * The limitation includes all the operations (interactive and background) being processed for the item while in use (for example, while a report is being viewed, interacted with, or refreshed).

  * Dataset operations like queries are also subject to individual memory limits, just as they are in the first version of Premium.

  * To illustrate the restriction, consider a dataset with an in-memory footprint of 1 GB, and a user initiating an on-demand refresh while interacting with a report based on the same dataset. Two separate actions determine the amount of memory attributed to the original dataset, which may be larger than two times the dataset size: 

      * The dataset needs to be loaded into memory.
      * The refresh operation will cause the memory used by the dataset to double, at least, since the original copy of data is still available for active queries, while an additional copy is being processed by the refresh. Once the refresh transaction commits, the memory footprint will reduce.
      * Report interactions will execute DAX queries. Each DAX query consumes a certain amount of temporary memory required to produce the results. Each query may consume a different amount of memory and will be subject to the query memory limitation as described.

## Refresh in Premium Gen2

Premium Gen2 and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md) don't require cumulative memory limits, and therefore concurrent dataset refreshes don't contribute to resource constraints. There is no limit on the number of refreshes running per v-core. However, the refresh of individual datasets continues to be governed by existing capacity memory and CPU limits. You can schedule and run as many refreshes as required at any given time, and the Power BI service will run those refreshes at the time scheduled as a best effort.

## Monitoring

When monitoring Premium Gen2 and [Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md), you only need to take into consideration one aspect: *how much CPU your capacity requires to serve the load at any moment*. To monitor your capacity, use the [Power BI Premium Capacity Utilization and Metrics](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.pbipremiumcapacitymonitoringreport?tab=Overview) app.

To install the app, see [Install the Gen2 metrics app](service-premium-install-gen2-app.md). You can learn how to use the app in the article [Use the Gen2 metrics app](service-premium-gen2-metrics-app.md).

Here's what happens when you exceed your CPU time per the SKU size you purchased:

* **Premium Gen2* - If enabled, [autoscale](service-premium-auto-scale.md) kicks in. If autoscale isn't enabled, your capacity throttles its [interactive operations](service-premium-interactive-background-operations.md#interactive-operations).

* **[Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md)** - Your capacity throttles its [interactive operations](service-premium-interactive-background-operations.md#interactive-operations). To autoscale in Embedded Gen2, see [Autoscaling in Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md#autoscaling-in-embedded-gen2).

## Paginated reports and Premium Gen2

In **Premium Gen2** and [Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md), there is no memory management for Paginated reports. With Premium Gen2 and Embedded Gen2, Paginated reports are also supported on the EM1-EM3 and A1-A3 SKUs.

When using Premium Gen2, Paginated reports in Power BI benefit from the architectural and engineering improvements reflected in Premium Gen2. The following sections describe the benefits of Premium Gen2 for Paginated reports.

* **Broader SKU availability** - Paginated reports running on Premium Gen2 can run reports across all available embedded and Premium SKUs. Billing is calculated per CPU hour, across a 24-hour period.

* **Enhanced security and code isolation** - Code isolation occurs at a per-user level rather than at per-capacity.

To learn more, see [Paginated reports in Power BI Premium](../paginated-reports/paginated-reports-report-builder-power-bi.md). To learn more about enabling the Paginated reports workload, see [Configure workloads](service-admin-premium-workloads.md).

## Limitations in Premium Gen2

The following known limitations currently apply to Premium Gen2:

* [Client applications and tools](service-premium-connect-tools.md#client-applications-and-tools) that connect to and work with datasets on Premium Gen2 capacities through the [XMLA endpoint](service-premium-connect-tools.md) require Analysis Services client libraries. Most client applications and tools install the most recent client libraries with regular updates, so manually installing the client libraries typically isn't necessary. Regardless of the client application or tool version, the following minimum client library versions are required:

    |Client Library | Version  |
    |---------|---------|
    |MSOLAP    |     15.1.65.22         |
    |AMO  |   19.12.7.0         |
    |ADOMD     |    19.12.7.0           |

    In some cases, manually installing the most recent client libraries may be necessary to reduce potential connection and operation errors. To learn more about verifying existing installed client library versions and manually installing the most recent versions, see [Analysis Services client libraries](/analysis-services/client-libraries?view=power-bi-premium-current&preserve-view=true).

* There's a 225 second limitation for rendering Power BI visuals. Visuals that take longer to render, will be timed-out and will not display.

* Throttling can occur in Power BI Premium capacities. Concurrency limits are applied per session. An error message will appear when too many operations are being processed concurrently.

## Next steps

> [!div class="nextstepaction"]
> [Power BI Premium Per User](service-premium-per-user-faq.yml)

> [!div class="nextstepaction"]
> [Managing Premium capacities](service-premium-capacity-manage.md)

> [!div class="nextstepaction"]
> [Power BI Embedded Generation 2](../developer/embedded/power-bi-embedded-generation-2.md)
