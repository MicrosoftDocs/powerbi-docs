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

# CPU smoothing

Power BI Premium Gen2 uses smoothing when it reports your CPU usage. Smoothing helps you avoid bursts of intensive CPU usage, by flattening your CPU usage over time. When your CPU usage is flatter, you can enjoy the full compute power of your Power BI capacity.

## CPU activity and usage

In Power BI, when operations activate the CPU, the outcome can be divided into *CPU activity* and *CPU usage*.

* **CPU activity** - CPU activity is the time it takes the CPU to perform an operation in Power BI. For example, a dataset refresh background operation triggered at 10:00 AM, might last 300 seconds, which will be the duration of this operation's CPU activity.

* **CPU usage** - CPU usage is a calculation that takes the *CPU activity* time and spreads it over a period of 24 hours. The CPU usage 24 hour period starts when the operation ends.

CPU smoothing refers to the way that CPU usage is reported over a 24 hour period. By smoothing the spikes in your Power BI operations, your capacity becomes efficient. You no longer need to implement throttling every time a short lived operation exceeds the capacity's computation power.

>[!NOTE]
>Smoothing can sometimes make it harder to understand how different operations effect your capacity. For example, because CPU usage is spread over 24 hours, the CPU may appear to have worked when it was actually idle.

## Calculating CPU usage

To calculate CPU usage, Power BI separates operations into two categories, [*interactive* and *background* operations](service-premium-gen2-faq.yml#what-s-the-difference-between-interactive-and-background-operations--). Interactive operations are shorter running operations, usually triggered by user interactions with the UI, and background operations are operations that run for a long period of time. Power BI handles these [operations](service-premium-gen2-faq.yml#which-operations-contribute-to-interactive-utilization--and-which-to-background-utilization-) in a different way, depending on their type.

* **Interactive operations** - Each operation is divided into short intervals that are used to calculate CPU usage per timepoint. The number of intervals changes depending on the amount of CPU usage needed by the operation, and can reach a maximum of 64 minutes per operation. The maximum CPU usage an interval can contain, is about half the total of the CPU usage for that operation.

* **Background operations** - Each operation is evenly split into 144 ten minute intervals that form a 24 hour period. To calculate the amount of CPU usage per a 30 second timepoint, Power BI takes the ten minute interval and divides it into 20.

*Interactive operations* average your capacity usage over a short time frame, such as ten minute intervals. *Background operations* on the other hand, average your capacity usage over a much larger 24 hours time frame. The benefit of this method is that operations that require a lot of resources, such as refreshed, get smoothed because they're averaged over a long period of time.

During each timepoint, Power BI adds up the average CPU usage from both the interactive and background operations. If the CPU usage for a specific timepoint exceeds the SKU limit for that timepoint, [autoscale](service-premium-auto-scale.md) kicks in if enabled. If autoscale isn't enabled, or if the CPU usage is higher than what autoscale can handle, throttling is applied.



## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [What is Power BI Premium?](service-premium-what-is.md)
