---
title: Power BI Premium CPU smoothing.
description: Understand the CPU smoothing concept in Power BI Premium works.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: overview
ms.date: 12/15/2022
LocalizationGroup: Premium 
---

# Performance smoothing

Power BI runs performance smoothing on all Premium capacities. Smoothing is used to calculate the impact of your operations on your capacity. Knowing what impact your operations have on your capacity affects many Power BI functions such as billing, [autoscale](service-premium-auto-scale.md) and the metrics you see in the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app).

In a Premium capacity, CPU usage is the most important measure, because it determines how much of your capacity is in use. By flattening your CPU usage over time, smoothing helps you avoid being penalized due to bursts of intensive CPU usage. When your CPU usage is flatter, you can avoid being throttled when small bursts occur.

The figures below show the way CPU usage is reported in the [Utilization](/fabric/enterprise/metrics-app-compute-page#utilization) chart, as opposed to the way it used to be reported.  

:::row:::
   :::column span="":::
      **Currently**

        :::image type="content" source="media/service-premium-smoothing/cpu-usage-with-smoothing.png" alt-text="A screenshot showing the C P U over time chart in the Power B I Premium utilization and metrics app, with the smoothing affect.":::
   :::column-end:::
   :::column span="":::
      **Prior to May 2022**

        :::image type="content" source="media/service-premium-smoothing/cpu-usage-no-smoothing.png" alt-text="A screenshot showing the C P U over time chart in the Power B I Premium utilization and metrics app, before smoothing was introduced.":::
   :::column-end:::
:::row-end:::

By smoothing the spikes in your Power BI operations, your capacity becomes easier to manage. Throttling is no longer implemented every time a short lived operation exceeds the capacity's computation power.

## How is CPU usage calculated?

To calculate CPU usage, Power BI separates operations into two categories, [*interactive* and *background* operations](service-premium-interactive-background-operations.md). *Interactive operations* are shorter running operations, usually triggered by user interactions with the UI. *Background operations* are operations that run for a long period of time. Power BI calculates CPU usage for these operations differently, depending on their type.

*Interactive operations* average your capacity usage over a short time frame, such as five minute intervals. *Background operations* on the other hand, average your capacity usage over a much larger 24 hour time frame. The benefit of this method is that operations that require many resources, such as refreshes, get smoothed because they're averaged over a long period of time.

During each timepoint, Power BI adds up the average CPU usage from both the interactive and background operations. If the CPU usage for a specific timepoint exceeds the SKU limit, [autoscale](service-premium-auto-scale.md) kicks in if enabled. If autoscale isn't enabled, or if the CPU usage is higher than what autoscale can handle, throttling is applied.

## How to detect overload?

You can see if your capacity is overloading, by reviewing the [Utilization](/fabric/enterprise/metrics-app-compute-page#utilization) chart in the Premium metrics app. A spike that goes over the line indicates an overload. To further investigate the overload, drill through to the [timepoint](/fabric/enterprise/metrics-app-timepoint-page) page. You can then review both your *interactive* and *background* operations, and see which ones were responsible for overloading your capacity. You can also determine, when the overloading events took place.

## How to resolve overload?

When your capacity overloads, you can choose to either turn on [autoscale](service-premium-auto-scale.md), update your capacity to a higher SKU, or do nothing. The following table gives three examples of the type of action you might want to take, when your capacity is overloading.

| Scenario | Solution | Details  |
|----------|----------|----------|
| A few overload incidents during the night | Do nothing | It's likely that a small number of overloading incidents that don't last for long periods, will have a small impact on the performance of your capacity. If they occur during the night, and you evaluate that during this time the capacity isn't heavily used, you can decide not to take any action. However, when your capacity is experiencing overload, throttling will be applied. You should consider the implications of slower performance during these times when your capacity overloads. |
| A few overload incidents during the day | Turn on [autoscale](service-premium-auto-scale.md) | When you encounter a fairly low number of overload incidents, it's important to note when they happen. If these incidents happen during peak time, when your capacity is heavily used, throttling will be applied and slow down operations on your capacity. As a result, your capacity will provide a below average experience to the people who use it. In these situations, it's worth turning on [autoscale](service-premium-auto-scale.md), to avoid throttling. |
| Many overload incidents | Upgrade to a higher SKU | When your investigation indicates that there are many overload incidents on your capacity, it's worth considering an upgrade to a higher SKU. In such cases, consider the cost of constant autoscale versus the cost of upgrading to a higher SKU. |

## Related content

> [!div class="nextstepaction"]
> [What is Power BI Premium?](service-premium-what-is.md)
