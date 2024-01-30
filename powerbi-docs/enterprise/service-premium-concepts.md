---
title: Power BI Premium capacity load, overload, and autoscale
description: Understand your Power BI Premium capacity load, what overload means and how to autoscale.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 11/30/2022
LocalizationGroup: Premium
---
# Premium capacity load evaluation

>[!TIP]
>This article explains how to evaluate your Premium capacity load. It covers concepts such as *overload* and *autoscale*. You can also watch these videos which illustrate some of the Premium features described in this article.
>* [Premium fundamentals and capacity analytics deep dive](https://go.microsoft.com/fwlink/?linkid=2202475)
>* [Premium features breakdown](https://aka.ms/PBIGen2GAVideo)

To enforce CPU throughput limitations, Power BI evaluates the throughput from your Premium capacity on an ongoing basis.

Power BI evaluates throughput every **30 seconds**. It allows operations to complete, collects execution time on the shared pool physical node’s CPUs, and then for all operations on your capacity, aggregates them into **30-second CPU intervals** and compares the results to what your purchased capacity is able to support.

The following image illustrates how Premium evaluates and completes queries.

:::image type="content" source="media/service-premium-concepts/service-premium-concepts-01.png" alt-text="Diagram showing Premium evaluates and processes queries. "lightbox="media/service-premium-concepts/service-premium-concepts-01.png":::

Let's look at an example: A P1 with eight v-cores can support $8\times{30}=240$ seconds of v-core execution time, also known as *CPU time*.

The aggregation is complex. It uses specialized algorithms for different workloads, and for different types of operations, as described in the following points:

* **Slow-running operations**, such as semantic model and dataflow refresh, are considered *background operations* since they typically run in the background and users don’t actively monitor them or look at them visually. Background operations are lengthy and require significant CPU power to complete during the long process. Power BI spreads CPU costs of background operations over 24 hours, so that capacities don't hit maximum resource usage due to too many refreshes running simultaneously. This allows Power BI Premium subscribers to run as many background operations as allowed by their purchased capacity SKU.

* **Fast operations** like queries, report loads, and others are considered *interactive operations*. The CPU time required to complete those operations is aggregated, to minimize the number of 30-seconds windows that are impacted following that operation's completion.

## Premium background operation scheduling

Refreshes are run on Premium capacities at the time they are scheduled, or close to it, regardless of how many other background operations were scheduled for the same time. Semantic models and dataflows being refreshed are placed on a physical processing node that has enough memory available to load them, and then begin the refresh process.

While processing the refresh, semantic models may consume more memory to complete the refresh process. The refresh engine makes sure no item can exceed the amount of memory that their base SKU allows them to consume (for example, 25 GB on a P1 subscription, 50 GB on a P2 subscription, and so on).

## How capacity size limits are enforced when viewing reports

Power BI Premium evaluates utilization by aggregating utilization records every 30 seconds. Each evaluation consists of 2 different aggregations:

* Interactive utilization
* Background utilization

**Interactive utilization** is evaluated by considering all interactive operations that completed on or near the current 30-second evaluation cycle.

**Background utilization** is evaluated by considering all the background operations that completed during the past 24 hours. Each background operation contributes only 1/2880 of its total CPU cost (2880 is the number of evaluation cycles in a 24-hour period).

Each capacity consists of an defined number of v-cores. The CPU time measured in utilization records reflects the v-cores' utilization, and that utilization drives the need to autoscale.

If you have a P1 subscription with eight v-cores, each evaluation cycle quota equates to $8\times{30}=240$ seconds of CPU utilization. If the sum of both interactive and background utilizations *exceeds* the total v-core quote in your capacity, and you have *not* optionally enabled autoscale, the workload for your Premium capacity will exceed your available resources, also called your *capacity threshold*. The following image illustrates this condition, called *overload*, when autoscale is *not* enabled.

:::image type="content" source="media/service-premium-concepts/service-premium-concepts-02.png" alt-text="Diagram showing overload condition in a premium  capacity." lightbox="media/service-premium-concepts/service-premium-concepts-02.png":::

In contrast, if autoscale is optionally enabled, if your CPU utilizations exceeds the total v-core quota in your capacity, your capacity is automatically autoscaled (raised) by one v-core for the next 24 hours.

The following image shows how autoscale works.

:::image type="content" source="media/service-premium-concepts/service-premium-concepts-03.png" alt-text="Diagram showing auto scale operation in a premium capacity." lightbox="media/service-premium-concepts/service-premium-concepts-03.png":::

Autoscale always considers your current capacity size to evaluate how much you use. When you autoscale, one v-core is added to your capacity. This means that if you're using a P1 SKU with eight v-cores, your maximum capacity is now at 270 seconds ($8\times{30}+1\times{30}$) of CPU time in an evaluation cycle.

Autoscale always ensures that no single interactive operation can account for all of your capacity, and you must have two or more operations occurring in a single evaluation cycle to initiate autoscale.

## Using Premium without autoscale

If a capacity's utilization exceeded 100% of its resources, and it cannot initiate autoscale due to autoscale being turned off, or already being at its maximum v-core value, the capacity enters a temporary *interactive request delay* mode. During the *interactive request delay* mode, each interactive request (such as a report load, visual interaction, and others) is delayed before it is sent to the engine for execution.

The capacity stays in *interactive request delay* mode if the previous evaluation is evaluated at greater than 100% resource utilization.

## Configure autoscale

To configure autoscale on a Power BI Premium capacity, follow the instructions in [Using Autoscale with Power BI Premium](service-premium-auto-scale.md).

## Related content

>[!div class="nextstepaction"]
>[What is Power BI Premium?](service-premium-what-is.md)

>[!div class="nextstepaction"]
>[Power BI Premium architecture](service-premium-architecture.md)

>[!div class="nextstepaction"]
>[Using Autoscale with Power BI Premium](service-premium-auto-scale.md)

>[!div class="nextstepaction"]
>[Power BI Premium FAQ](service-premium-faq.yml)

>[!div class="nextstepaction"]
>[Power BI Premium Per User FAQ (preview)](service-premium-per-user-faq.yml)

>[!div class="nextstepaction"]
>[Add or change Azure subscription administrators](/azure/cost-management-billing/manage/add-change-subscription-administrator)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
