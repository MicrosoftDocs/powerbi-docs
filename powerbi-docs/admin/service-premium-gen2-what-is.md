---
title: What is Power BI Premium Gen2?
description: Power BI Premium Gen2 provides streamlined use and management of capacities for your organization.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 11/12/2021
ms.custom: licensing support, intro-overview
LocalizationGroup: Premium
---


# What is Power BI Premium Gen2?

Power BI Premium released a new version of Power BI Premium, **Power BI Premium Generation 2**, referred to as **Premium Gen2** for convenience. You can select to use the original version of Premium, or switch to using Premium Gen2. You can only use one or the other for your Premium capacity.

:::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-10.png" alt-text="Screenshot of using auto scale in Power B I Premium.":::

Premium Gen2 provides the following updates or improved experiences:

* Ability to license **Premium Per User** in addition to by capacity.

* Enhanced **performance** on any capacity size, anytime: Analytics operations run up to 16X faster on Premium Gen2. Operations will always perform at top speed and won't slow down when the load on the capacity approaches the capacity limits.

* **Greater scale**:
    * *No limits* on refresh concurrency, no longer requiring you to track schedules for datasets being refreshed on your capacity
    * Fewer memory restrictions
    * Complete separation between report interaction and scheduled refreshes

* **Improved and streamlined metrics** with clear and normalized capacity utilization data, that's dependent only on the complexity of analytics operations the capacity performs, and not on its size, the level of load on the system while performing analytics, or other factors. With the improved metrics, utilization analysis, budget planning, chargebacks, and the need to upgrade are clearly visible with built-in reporting.

* **Autoscale** is an optional feature that allows for *automatically adding* one v-core at a time for 24-hour periods when the load on the capacity exceeds its limits, preventing slowdowns caused by overload. Additional v-cores are charged to your Azure subscription on a pay-as-you-go basis. See [using Autoscale with Power BI Premium](service-premium-auto-scale.md) for steps on how to configure and use **Autoscale**.

* **Reduced management overhead** with proactive and configurable admin notifications about capacity utilization level and load increasing.

>[!NOTE]
>To review the Power BI Embedded Gen2 enhancements, refer to [Power BI Embedded Generation 2](../developer/embedded/power-bi-embedded-generation-2.md).

## Enabling Premium Gen2

Enable Premium Gen2 to take advantage of its updates. To enable Premium Gen2, take the following steps:

1. In the admin portal, navigate to **Capacity settings**.
1. Select **Power BI Premium**.
1. If you have already allocated capacity, select it.
1. A section appears titled **Premium Generation 2**, and in that section is a slider to enable Premium Generation 2. 
1. Move the slider to **Enabled**.

The following short video shows how to enable Premium Gen2. 

![Enabling Premium Generation 2](media/service-premium-what-is/enable-premium-gen2.gif#lightbox) 

Optionally, you can also [configure and use Autoscale with Power BI Premium](service-premium-auto-scale.md) to ensure capacity and performance for your Premium users.


## Workspaces and Premium Gen2

Workspaces reside within capacities. Each Power BI user has a personal workspace known as **My Workspace**. Additional workspaces known as **workspaces** can be created to enable collaboration. By default, workspaces, including personal workspaces, are created in the shared capacity. When you have Premium capacities, both My Workspaces and workspaces can be assigned to Premium capacities.

Capacity administrators automatically have their my workspaces assigned to Premium capacities.

## Capacity nodes for Premium Gen2

With **Premium Gen2** and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md), the amount of memory available on each node size is set to the limit of memory footprint of a single artifact, and not to the cumulative consumption of memory. For example, in Premium Gen2 P1 capacity, only a single dataset size is limited to 25 GB, in comparison to the original Premium, where the total memory footprint of the datasets being handled at the same time was limited to 25 GB.

## Refresh in Premium Gen2

Premium Gen2 and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md) don't require cumulative memory limits, and therefore concurrent dataset refreshes don't contribute to resource constraints. There is no limit on the number of refreshes running per v-core. However, the refresh of individual datasets continues to be governed by existing capacity memory and CPU limits. You can schedule and run as many refreshes as required at any given time, and the Power BI service will run those refreshes at the time scheduled as a best effort.


## Monitoring in Gen2

The intent of monitoring in Premium Gen2 is to simplify monitoring and management of Premium capacities. Premium Gen2 customers can adapt their monitoring approach from a tool to ensure their Premium capacities are running properly, into a tool that alerts them if attention should be applied to correct overusage or if more resources are required. In other words, rather than constantly having to monitor for issues and adjust, Premium Gen2 aims to assure that everything is running properly and only alerts users if they must act. 

**Updates for Premium Gen2 and Embedded Gen2** - Premium Gen2 and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md) only require monitoring a single aspect: how much CPU time your capacity requires to serve the load at any moment.

This reduction in the need for monitoring is a departure from the many metrics that the original version of Power BI Premium required. Organizations that created a cadence of monitoring and reporting on their original Premium capacities will need to transition their existing rhythm of monitoring their Premium Gen2 capacities, due to the streamlined metrics and monitoring requirements of Premium Gen2.

In Premium Gen2, if you exceed your CPU time per the SKU size you purchased, your capacity either autoscales to accommodate the need (if you've optionally enabled autoscale), or throttles your interactive operations, based on your configuration settings.

In [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md), if you exceed your CPU time per the SKU size you purchased, your capacity throttles your interactive operations, based on your configuration settings. To autoscale in Embedded Gen 2, see [Autoscaling in Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md#autoscaling-in-embedded-gen2).


### Updates for Premium Gen2

**Premium Gen2** and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md) capacities use the Capacity Utilization App. 

You can download and install the metrics app for Premium Gen2 and [Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md) using the [following link](https://appsource.microsoft.com/product/power-bi/pbi_pcmm.pbipremiumcapacitymonitoringreport?tab=Overview).


## Paginated reports and Premium Gen2

In **Premium Gen2** and [Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md), there is no memory management for Paginated reports. With Premium Gen2 and Embedded Gen2, Paginated reports are also supported on the EM1-EM3 and A1-A3 SKUs.

When using Premium Gen2, Paginated reports in Power BI benefit from the architectural and engineering improvements reflected in Premium Gen2. The following sections describe the benefits of Premium Gen2 for Paginated reports.

* **Broader SKU availability** - Paginated reports running on Premium Gen2 can run reports across all available embedded and Premium SKUs. Billing is calculated per CPU hour, across a 24-hour period. This greatly expands the SKUs that support Paginated reports.

* **Dynamic scaling** - With Premium Gen2, challenges associated with spikes in activity, or need for resources, can be handled dynamically as need arises. 

* **Improved caching** - Prior to Premium Gen2, Paginated reports were required to perform many operations in the context of memory allocated on the capacity for the workload. Now, using Premium Gen2, reductions in the required memory for many operations enhance customers' ability to perform long-running operations without impacting other user sessions. 

* **Enhanced security and code isolation** - With Premium Gen2, code isolation can occur at a per-user level rather than at per-capacity, as was the case in the original Premium offering. 

To learn more, see [Paginated reports in Power BI Premium](../paginated-reports/paginated-reports-report-builder-power-bi.md). To learn more about enabling the Paginated reports workload, see [Configure workloads](service-admin-premium-workloads.md).


## Subscriptions and licensing

Power BI Premium Gen2 is a tenant-level Microsoft 365 subscription available in two SKU (Stock-Keeping Unit) families:

- **P** SKUs (P1-P5) for embedding and enterprise features, requiring a monthly or yearly commitment, billed monthly, and includes a license to install Power BI Report Server on-premises.

- **EM** SKUs (EM1-EM3) for _organizational_ embedding, requiring a yearly commitment, billed monthly. EM1 and EM2 SKUs are available only through volume licensing plans. You can't purchase them directly.

In addition, **Premium Per User** has the benefits available with Premium Gen2, but on an individual user basis.

### Purchasing

Power BI Premium subscriptions are purchased by administrators in the Microsoft 365 admin center. Specifically, only Global administrators or Billing Administrators can purchase SKUs. When purchased, the tenant receives a corresponding number of v-cores to assign to capacities, known as *v-core pooling*. For example, purchasing a P3 SKU provides the tenant with 32 v-cores. To learn more, see [How to purchase Power BI Premium](service-admin-premium-purchase.md).

## Limitations in Premium Gen2

The following known limitations currently apply to Premium Gen2:

* [Client applications and tools](service-premium-connect-tools.md#client-applications-and-tools) that connect to and work with datasets on Premium Gen2 capacities through the [XMLA endpoint](service-premium-connect-tools.md) require Analysis Services client libraries. Most client applications and tools install the most recent client libraries with regular updates, so manually installing the client libraries typically isn't necessary. Regardless of the client application or tool version, the following minimum client library versions are required:

    |Client Library | Version  |
    |---------|---------|
    |MSOLAP    |     15.1.65.22         |
    |AMO  |   19.12.7.0         |
    |ADOMD     |    19.12.7.0           |

    In some cases, manually installing the most recent client libraries may be necessary to reduce potential connection and operations errors. To learn more about verifying existing installed client library versions and manually installing the most recent versions, see [Analysis Services client libraries](/analysis-services/client-libraries?view=power-bi-premium-current&preserve-view=true).

* There's a 225 second limitation for rendering Power BI visuals. Visuals that take longer to render, will be timed-out and will not display.

* Memory restrictions are different in Premium Gen2 and [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md). In the first generation of Premium and Embedded, memory was restricted to a limited amount of RAM used by all artifacts simultaneously running. In Gen2, there is no memory Limit for the capacity as a whole. Instead, individual artifacts (such as datasets, dataflows, paginated reports) are subject to the following RAM limitations:

    * A single artifact cannot exceed the amount of memory the capacity SKU offers. 

    * The limitation includes all the operations (interactive and background) being processed for the artifact while in use (for example, while a report is being viewed, interacted with, or refreshed).

    * Dataset operations like queries are also subject to individual memory limits, just as they are in the first version of Premium.

    * To illustrate the restriction, consider a dataset with an in-memory footprint of 1 GB, and a user initiating an on-demand refresh while interacting with a report based on the same dataset. Two separate actions determine the amount of memory attributed to the original dataset, which may be larger than two times the dataset size: 

        * The dataset needs to be loaded into memory.
        * The refresh operation will cause the memory used by the dataset to double, at least, since the original copy of data is still available for active queries, while an additional copy is being processed by the refresh. Once the refresh transaction commits, the memory footprint will reduce.
        * Report interactions will execute DAX queries. Each DAX query consumes a certain amount of temporary memory required to produce the results. Each query may consume a different amount of memory and will be subject to the query memory limitation as described.

    The following table summarizes all the limitations that are dependent on the capacity size:

    | Capacity SKU | Total v-cores | Backend v-cores | Frontend v-cores | RAM (GB)\* |  DirectQuery/Live connection (per second)\* | Max memory per query [GB]\* | Model refresh parallelism |
    | ------ | --- | ---- | ---- | --- | ------ | --- | --- |
    | EM1/A1 |   1 |  0.5 |  0.5 |   3 |   3.75 |  1  |   5 |
    | EM2/A2 |   2 |  1   |  1   |   6 |   7.5  |  2  |  10 |
    | EM3/A3 |   4 |  2   |  2   |  10 |  15    |  2  |  20 |
    | P1/A4  |   8 |  4   |  4   |  25 |  30    |  6  |  40 |
    | P2/A5  |  16 |  8   |  8   |  50 |  60    |  6  |  80 |
    | P3/A6  |  32 | 16   | 16   | 100 | 120    | 10  | 160 |
    | P4/A7* |  64 | 32   | 32   | 200 | 240    | 10  | 320 |
    | P5/A8* | 128 | 64   | 64   | 400 | 480    | 10  | 640 |

    \* The Premium Gen2 app doesn't currently expose these metrics.

    \** SKUs greater than 100 GB are not available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

## Next steps

The following articles provide additional information about Power BI Premium.

* [Power BI Premium Per User](service-premium-per-user-faq.yml)
* [Managing Premium capacities](service-premium-capacity-manage.md)
* [Azure Power BI Embedded Documentation](https://azure.microsoft.com/services/power-bi-embedded/)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
