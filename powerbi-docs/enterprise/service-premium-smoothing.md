---
title: Power BI Premium Gen2 CPU smoothing.
description: Understand the CPU smoothing concept in Power BI Premium Gen2 works.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: overview
ms.date: 06/21/2022
LocalizationGroup: Premium 
---

# Performance smoothing

Power BI Premium Gen2 uses performance smoothing when it reports your CPU usage in the [Gen2 app](service-premium-gen2-metrics-app.md). Power BI uses the calculations behind the app's reports, to evaluate your CPU usage. CPU usage is the most important measure when it comes to your capacity, because it determines how much of your capacity is in use. By flattening your CPU usage over time, smoothing helps you avoid being penalized due to bursts of intensive CPU usage. When your CPU usage is flatter, you can enjoy the full compute power of your Power BI capacity.

The figures below show the way CPU usage is currently reported in the [CPU over time](service-premium-gen2-metrics-app.md#cpu-over-time) chart, as apposed to the way it used to be reported.  

:::row:::
   :::column span="":::
      **Currently, with smoothing**

        :::image type="content" source="media/service-premium-smoothing/CPU-usage-with-smoothing.png" alt-text="A screenshot showing the C P U over time chart in the Power B I Premium utilization and metrics app, with the smoothing affect.":::
   :::column-end:::
   :::column span="":::
      **Before smoothing was introduced**

        :::image type="content" source="media/service-premium-smoothing/CPU-usage-no-smoothing.png" alt-text="A screenshot showing the C P U over time chart in the Power B I Premium utilization and metrics app, before smoothing was introduced.":::
   :::column-end:::
:::row-end:::

## CPU activity and usage

In Power BI, when operations activate the CPU, the outcome can be divided into *CPU activity* and *CPU usage*.

* **CPU activity** - CPU activity is the time it takes the CPU to perform an operation in Power BI. For example, a dataset refresh background operation triggered at 10:00 AM, might last 300 seconds, which will be the duration of this operation's CPU activity.

* **CPU usage** - CPU usage is a calculation that takes the *CPU activity* time and spreads it over a period of 24 hours. The CPU usage 24 hour period starts when the operation ends.

CPU smoothing refers to the way that CPU usage is reported over a 24 hour period. By smoothing the spikes in your Power BI operations, your capacity becomes efficient. Throttling is no longer implemented every time a short lived operation exceeds the capacity's computation power.

>[!NOTE]
>Smoothing can sometimes make it harder to understand how different operations affect your capacity. For example, because CPU usage is spread over 24 hours, the CPU may appear to have worked when it was actually idle.

## How is CPU usage calculated?

To calculate CPU usage, Power BI separates operations into two categories, [*interactive* and *background* operations](service-premium-interactive-background-operations.md). *Interactive operations* are shorter running operations, usually triggered by user interactions with the UI. *Background operations* are operations that run for a long period of time. Power BI handles these operations in a different way, depending on their type.

* **Interactive operations** - Each operation is divided into short intervals that are used to calculate CPU usage per timepoint. The number of intervals changes depending on the amount of CPU usage needed by the operation, and can reach a maximum of 64 minutes per operation. The maximum CPU usage an interval can contain, is about half the total of the CPU usage for that operation.

* **Background operations** - Each operation is evenly split into 144 ten-minute intervals that form a 24 hour period. To calculate the amount of CPU usage per timepoint, Power BI takes the ten-minute interval and divides it so that it fits the timepoint duration.

*Interactive operations* average your capacity usage over a short time frame, such as ten-minute intervals. *Background operations* on the other hand, average your capacity usage over a much larger 24 hours time frame. The benefit of this method is that operations that require many resources, such as refreshes, get smoothed because they're averaged over a long period of time.

During each timepoint, Power BI adds up the average CPU usage from both the interactive and background operations. If the CPU usage for a specific timepoint exceeds the SKU limit for that timepoint, [autoscale](service-premium-auto-scale.md) kicks in if enabled. If autoscale isn't enabled, or if the CPU usage is higher than what autoscale can handle, throttling is applied.

## How to detect overload?

You can see if your capacity is overloading, by reviewing the [CPU over time](service-premium-gen2-metrics-app.md#cpu-over-time) chart in the Gen2 app. A spike that goes over the yellow line, indicates an overload. To further investigate the overload, drill through to the [timepoint](service-premium-gen2-metrics-app.md#timepoint) page. You can then review both your *interactive* and *background* operations, and see which ones were responsible for overloading your capacity. You can also determine, when the overloading events took place.

## How to resolve overload?

When your capacity overloads, you can choose to either turn on [autoscale](service-premium-auto-scale.md), update your capacity to a higher SKU, or do nothing. The following table gives three examples of the type of action you might want to take, when your capacity is overloading.


| Scenario | Solution | Details  |
|----------|----------|----------|
| A few overload incidents during the night | Do nothing | It's likely that a small number of overloading incidents that don't last for long periods, will have a small impact on the performance of your capacity. If they occur during the night, and you evaluate that during this time the capacity isn't heavily used, you can decide not to take any action. However, when your capacity is experiencing overload, throttling will be applied. You should consider the implications of slower performance during these times when your capacity overloads. |
| A few overload incidents during the day | Turn on [autoscale](service-premium-auto-scale.md) | When you encounter a fairly low number of overload incidents, it's important to note when they happen. If these incidents happen during peak time, when your capacity is heavily used, throttling will be applied and slow down operations on your capacity. As a result, your capacity will provide a below average experience to the people who use it. In these situations, it's worth turning on [autoscale](service-premium-auto-scale.md), to avoid throttling. |
| Many overload incidents | Upgrade to a higher SKU | When your investigation indicates that there are many overload incidents on your capacity, it's worth considering to upgrade to a higher SKU. In such cases, even if you turn on autoscale, it's likely that the accumulative result of the multiple incidents, will exceed the performance enhancement that [autoscale](service-premium-auto-scale.md) can provide. In other words, your capacity might hit the autoscale limits and still experience throttling. Another thing to consider in such cases, is the cost of constant autoscale versus the cost of upgrading to a higher SKU. |

## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [What is Power BI Premium?](service-premium-what-is.md)
