---
title: Power BI Premium Gen2 capacity load, overload and autoscale
description: Understand your Power BI Premium Gen2 capacity load, what overload means and how to autoscale.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 10/04/2021
LocalizationGroup: Premium
---

# Premium Gen2 capacity load evaluation

To enforce CPU throughput limitations, Power BI evaluates the throughput from your Premium Gen2 capacity on an ongoing basis.

Power BI evaluates throughput every **30 seconds**. It allows operations to complete, collects execution time on the shared pool physical node’s CPUs, and then for all operations on your capacity, aggregates them into **30-second CPU intervals** and compares the results to what your purchased capacity is able to support.

The following image illustrates how Premium Gen2 evaluates and completes queries.

:::image type="content" source="media/service-premium-concepts/service-premium-concepts-01.png" alt-text="Diagram showing Premium generation two evaluates and processes queries."lightbox="media/service-premium-concepts/service-premium-concepts-01.png":::

Let's look at an example: a P1 with four backend v-cores can support 120 seconds (4 x 30 seconds = 120) of v-core execution time, also known as *CPU time*. 

The aggregation is complex. It uses specialized algorithms for different workloads, and for different types of operations, as described in the following points:

* **Slow-running operations**, such as dataset and dataflow refreshes, are considered *background operations* since they typically run in the background and users don’t actively monitor them or look at them visually. Background operations are lengthy and require significant CPU power to complete during the long process. Power BI spreads CPU costs of background operations over 24 hours, so that capacities don't hit maximum resource usage due to too many refreshes running simultaneously. This allows Power BI Premium Gen2 subscribers to run as many background operations as allowed by their purchased capacity SKU, and doesn’t limit them like the original Premium generation.

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

## Configure autoscale

To configure autoscale on a Power BI Premium Gen2 capacity, follow the instructions in [Using Autoscale with Power BI Premium](service-premium-auto-scale.md).

## Next steps

>[!div class="nextstepaction"]
>[What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

>[!div class="nextstepaction"]
>[Power BI Premium Gen2 architecture](service-premium-architecture.md)

>[!div class="nextstepaction"]
>[Using Autoscale with Power BI Premium](service-premium-auto-scale.md)

>[!div class="nextstepaction"]
>[Power BI Premium Gen2 FAQ](service-premium-gen2-faq.yml)

>[!div class="nextstepaction"]
>[Power BI Premium Per User FAQ (preview)](service-premium-per-user-faq.yml)

>[!div class="nextstepaction"]
>[Add or change Azure subscription administrators](/azure/cost-management-billing/manage/add-change-subscription-administrator)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
