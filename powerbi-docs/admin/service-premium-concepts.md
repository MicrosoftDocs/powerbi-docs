---
title: Understanding Power BI Premium Gen2 (preview)
description: Understand how Power BI Premium Gen2 operates, with concepts about its main features.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 09/29/2021
LocalizationGroup: Premium
---
# Understanding Power BI Premium Gen2 (preview)

**Power BI Premium Generation 2**, referred to as **Premium Gen2** for convenience, is an improved and architecturally redesigned generation of Power BI Premium. Premium Gen2 is currently in preview, and is available for Premium subscribers to use during the preview period. You can select to use the original version of Premium, or switch to using Premium Gen2. You can only use one or the other for your Premium capacity.

This article describes important concepts and implications for Power BI Premium Gen2, including how it differs from the original version of Power BI Premium. 

![Enabling Premium Generation 2](media/service-premium-what-is/enable-premium-gen2.gif#lightbox) 

## Premium Gen2 architecture improvements

Architectural changes in Premium Gen2, especially around how CPU resources are allocated and used, enables more versatility in offerings, and more flexibility in licensing models. For example, the new architecture enables offering Premium on a per-user basis, offered (currently in preview) as [Premium Per User](service-premium-per-user-faq.yml). The architecture also provides customers with better performance, and better governance and control over their Power BI expenses.

The most significant update in the architecture of Premium Gen2 is the way capacities' back-end v-cores (CPUs, often referred to as v-cores) are implemented:

* In the original version of Power BI Premium, backend v-cores were reserved physical computing nodes in the cloud, with differences in the number of v-cores and the amount of onboard memory according to the customer's licensing SKU. Customer administrators were required to keep track of how busy these nodes were, using the *Premium metrics app*. They had to use the app and other tools to determine how much capacity their users required to meet their computing needs.

* Each administrator had the ability to tweak and configure capacities to avoid resource contention between workloads (datasets, dataflows, paginated reports, and AI) or other performance impactful effects to make sure capacity performance remained tuned or acceptable.

In Premium Gen2, backend v-cores are implemented on regional clusters of physical nodes in the cloud, which are shared by all tenants using Premium capacities in that Power BI region. The regional cluster is further divided into specialized groups of nodes, where each group handles a different Power BI workload (datasets, dataflows, or paginated reports). These specialized groups of nodes help avoid resource contention between fundamentally different workloads running on the same node.

The contents of workspaces assigned to a Premium Gen2 capacity is stored on your organizations capacity's storage layer, which is implemented on top of capacity-specific Azure storage blob containers, similar to the original version of Premium. This approach enables features like BYOK to be used for your data.

When the content needs to be viewed or refreshed, it is read from the storage layer and placed on a Premium Gen2 backend node for computing. Power BI uses a placement mechanism that assures the optimal node is chosen within the proper group of computing nodes. The mechanism typically places new content on the node with the most available memory at the time the content is loaded, so that the view or refresh operation can gain access to the most resources and can perform optimally. 

As your capacity renders and refreshes additional content, it uses additional computation nodes, each with enough resources to complete operations fast and successfully.This means your capacity may use multiple computational nodes and in some cases, content might even move between nodes due to the Power BI service performing internal load-balancing across nodes or resources. When such load balancing occurs, Power BI makes sure content movement doesn't impact end-user experiences.

There are several positive results from distributing backend processing of content (datasets, dataflows and paginated reports) across shared backend nodes:

1. The shared nodes are at least as large as an original Premium P3 node, which means there are more v-cores to perform any operations, which can increase performance by up to 16x when comparing to an original Premium P1.
2. Whatever node your processing lands on, the placement mechanism makes sure memory remains available for your operation to complete, within the applicable memory constraints of your capacity. (see limitations section of this doc for full detail of memory constraints)
3. Internal noisy neighbor problems in your capacity don't occur, since each of the *view* and *refresh* operations uses its own set of physical v-cores, with their own memory, on different computing nodes.
4. Cross-workloads resource contention is prevented by separating the shared nodes into specialized workload groups.
5. The limitations on different capacity SKUs are not based on the physical constraints as they were in the original version of Premium; rather, they are based on an expected and clear set of rules that the Power BI Premium service enforces:
    * Total capacity CPU throughput is at or below the throughput possible with the v-cores your purchased capacity has.
    * Memory consumption required for viewing and refresh operations remains within the memory limits of your purchased capacity.
6. Because of this new architecture, customer admins do not need to monitor their capacities for signs of approaching the limits of their resources, and instead are provided with clear indication when such limits are met. This significantly reduces the effort and overhead required of capacity administrators to maintain optimal capacity performance.

## Premium Gen2 capacity load evaluation

To enforce CPU throughput limitations, Power BI evaluates the throughput from your Premium Gen2 capacity on an ongoing basis. 

Power BI evaluates throughput every **30 seconds**. It allows operations to complete, collects execution time on the shared pool physical node’s CPUs, and then for all operations on your capacity, aggregates them into **30-second CPU intervals** and compares the results to what your purchased capacity is able to support. 

The following image illustrates how Premium Gen2 evaluates and completes queries.

:::image type="content" source="media/service-premium-concepts/service-premium-concepts-01.png" alt-text="Diagram showing Premium generation two evaluates and processes queries."lightbox="media/service-premium-concepts/service-premium-concepts-01.png":::

Let's look at an example: a P1 with four backend v-cores can support 120 seconds (4 x 30 seconds = 120) of v-core execution time, also known as *CPU time*. 

The aggregation is complex. It uses specialized algorithms for different workloads, and for different types of operations, as described in the following points:

* **Slow-running operations**, such as dataset and dataflow refreshes, are considered *background operations* since they typically run in the background and users don’t actively monitor them or look at them visually. Background operations are lengthy and require a lot of CPU power to complete during the long process. Power BI spreads CPU costs of background operations over 24 hours, so that capacities don't hit maximum resource usage due to too many refreshes running simultaneously. This allows Power BI Premium Gen2 subscribers to run as many background operations as allowed by their purchased capacity SKU, and doesn’t limit them like the original Premium generation.

* **Fast operations** like queries, report loads, and others are considered *interactive operations*. The CPU time required to complete those operations is aggregated, to minimize the number of 30-seconds windows that are impacted following that operation's completion.


## Premium Gen2 background operation scheduling

Refreshes are run on Premium Gen2 capacities at the time they are scheduled, or close to it, regardless of how many other background operations were scheduled for the same time. Datasets and dataflows being refreshed are placed on a physical processing node that has enough memory available to load them, and then begin the refresh process. 

While processing the refresh, datasets may consume more memory to complete the refresh process. The refresh engine makes sure no artifact can exceed the amount of memory that their base SKU allows them to consume (for example, 25 GB on a P1 subscription, 50 GB on a P2 subscription, and so on).
	
## How capacity size limits are enforced when viewing reports

Premium Gen2 evaluates utilization by aggregating utilization records every 30 seconds. Each evaluation consists of 2 different aggregations: 
* Interactive utilization
* Background utilization

**Interactive utilization** is evaluated by considering all interactive operations that completed on or near the current 30-second evaluation cycle.

**Background utilization** is evaluated by considering all the background operations that completed during the past 24 hours. Each background operation contributes only 1/2880 of its total CPU cost (2880 is the number of evaluation cycles in a 24-hour period).

Each capacity consists of an equal number of frontend and backend v-cores. The CPU time measured in utilization records reflect the backend v-cores' utilization, and that utilization drives the need to autoscale. Utilization of frontend v-cores is *not* tracked, and you cannot convert frontend v-cores to backend v-cores.

If you have a P1 subscription with 4 backend v-cores, each evaluation cycle quota equates to 120 seconds ( 4*30 = 120 seconds) of CPU utilization. If the sum of both interactive and background utilizations *exceeds* the total backend v-core quote in your capacity, and you have *not* optionally enabled autoscale, the workload for your Gen2 capacity will exceed your available resources, also called your *capacity threshold*. The following image illustrates this condition, called *overload*, when autoscale is *not* enabled.

:::image type="content" source="media/service-premium-concepts/service-premium-concepts-02.png" alt-text="Diagram showing overload condition in premium generation two capacity." lightbox="media/service-premium-concepts/service-premium-concepts-02.png":::

In contrast, if autoscale is optionally enabled, if the sum of both interactive and background utilizations exceeds the total backend v-core quota in your capacity, your capacity is automatically autoscales (raised) by one v-core for the next 24 hours.

The following image shows how autoscale works.

:::image type="content" source="media/service-premium-concepts/service-premium-concepts-03.png" alt-text="Diagram showing auto scale operation in premium generation two capacity." lightbox="media/service-premium-concepts/service-premium-concepts-03.png":::

Autoscale always considers your current capacity size to evaluate how much you use, so if you already autoscaled into one v-core, that v-core is spread evenly at 50% for frontend utilization and 50% for backend utilization. This means your maximum capacity is now at (120 + 0.5 * 30 = 135 seconds) of CPU time in an evaluation cycle.

Autoscale always ensures that no single interactive operation can account for all of your capacity, and you must have two or more operations occurring in a single evaluation cycle to initiate autoscale.


## Using Premium Gen2 without autoscale

If a capacity's utilization exceeded 100% of its resources, and it cannot initiate autoscale due to autoscale being turned off, or already being at its maximum v-core value, the capacity enters a temporary *interactive request delay* mode. During the *interactive request delay* mode, each interactive request (such as a report load, visual interaction, and others) is delayed before it is sent to the engine for execution. 

The amount of delay is proportionate to the amount of overload detected, as follows:
* Overload of 100% incurs a delay of 20 seconds
* Overloads smaller than 10% are ignored

The capacity stays in *interactive request delay* mode if the previous evaluation is evaluated at greater than 100% resource utilization.

## Next steps

* [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)
* [Using Autoscale with Power BI Premium](service-premium-auto-scale.md)
* [Power BI Premium Gen2 FAQ](service-premium-gen2-faq.yml)
* [Power BI Premium Per User FAQ (preview)](service-premium-per-user-faq.yml)
* [Add or change Azure subscription administrators](/azure/cost-management-billing/manage/add-change-subscription-administrator)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
