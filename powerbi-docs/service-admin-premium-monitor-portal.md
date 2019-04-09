---
title: Monitor Power BI Premium capacities by using the admin portal
description: Use the Power BI admin portal to monitor your Premium capacities.
author: minewiskan
ms.author: owend
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 02/05/2019
LocalizationGroup: Premium 
---

# Monitor capacities in the Admin portal

This article describes how you can use the Capacity settings area in the Admin portal to get a quick view of your capacity's performance.  To get the most in-depth metrics about your capacity, it's best to use the [Power BI Premium Capacity Metrics](service-admin-premium-monitor-capacity.md) app.

## Capacity metrics

The **Capacity settings** area of the admin portal provides four gauges that indicate the loads placed and the resources utilized by your capacity for the past seven days. These four tiles work on an hourly time window that indicates how many hours in the past seven days the corresponding metric was above 80%. This metric indicates a potential degradation for the end-user experience.

![Usage in 7 days](media/service-admin-premium-monitor-capacity/usage-in-days.png)

| **Metric** | **Description** |
| --- | --- |
| CPU |Number of times CPU exceeded 80% utilization. |
| Memory Thrashing |Represents the memory pressure on your backend cores. Specifically, this is a metric of how many times datasets are evicted from memory due to memory pressure from the usage of multiple datasets. |
| Memory Usage |Average memory usage, represented in gigabytes (GB). |
| DQ/s | Number of times Direct Query and Live Connections count exceeded 80% of the limit. <br>  The total number of DirectQuery and live connection queries per second is limited. The limits are 30/s for P1, 60/s for P2 and 120/s for P3.  Direct Query and live connection queries count add to the above throttle. For example, if you have 15 DirectQueries and 15 live connections in a second, you hit your throttle<br> This applies equally to on-premises and cloud connections. |
|  |  |

Metrics reflect utilization over the past week.  If you'd like to see a more detailed view of the metrics, you can do so by clicking any of the summary tiles.  This will take you to detailed charts for each of the metrics for your premium capacity. The following chart shows details for the CPU metric.

![Detailed usage chart CPU](media/service-admin-premium-monitor-capacity/premium-usage-detailed-chart-cpu.png)

These charts are summarized on an hourly basis for the past week, and can help isolate when you may have had specific performance-related events in your premium capacity.

You may also export the underlying data for any of the metrics to a csv file.  This export will give you detailed information in three minute intervals for each day of the past week.

## Next steps

Now that you understand how to monitor Power BI Premium capacities, learn more about optimizing capacities.

> [!div class="nextstepaction"]
> [Optimizing Power BI Premium capacities](service-premium-capacity-optimize.md)
