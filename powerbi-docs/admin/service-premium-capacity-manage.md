---
title: Monitor Microsoft Power BI Premium capacities
description: Describes management tasks for Power BI Premium capacities.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 09/29/2021
ms.custom:
LocalizationGroup: Premium
---

# Monitoring Power BI capacities

Monitoring Premium capacities provides administrators with an understanding of how the capacities are performing. Capacities can be monitored by using the Power BI Admin portal or the **Power BI Premium Capacity Metrics** (Power BI) app.

## Power BI Admin portal

In the Admin portal, for each capacity, the **Health** tab provides summary metrics for the capacity and each enabled workload. Metrics show an average over the past seven days.  

At the capacity level, metrics are cumulative of all enabled workloads. the following metrics are provided:

- **CPU UTILIZATION** - Provides average CPU utilization as a percentage of total available CPU for the capacity.  
- **MEMORY USAGE** - Provides average memory usage (in GB) as a total of available memory for the capacity. 

For each enabled workload, CPU utilization and memory usage are provided, as well as a number of workload specific metrics. For example, for the Dataflow workload, **Total Count** shows total refreshes for each dataflow, and **Average Duration** shows the average duration of refresh for the dataflow.

![Capacity Health tab in the portal](media/service-premium-capacity-manage/admin-portal-health-dataflows.png)

To learn more about all available metrics for each workload, see [Monitor capacities in the Admin portal](service-admin-premium-monitor-portal.md).

The monitoring capabilities in the Power BI Admin portal are designed to provide a quick summary of key capacity metrics. For more detailed monitoring, it's recommended you use the **Power BI Premium Capacity Metrics** app.

## Power BI Premium Capacity Metrics app

The [Power BI Premium Capacity Metrics app](https://appsource.microsoft.com/en-us/product/power-bi/pbi_pcmm.capacity-metrics-dxt?tab=Overview) is a Power BI app available to capacity admins and is installed like any other Power BI app. It contains a dashboard and report.

![Power BI Premium Capacity Metrics app](media/service-premium-capacity-manage/capacity-metrics-app.png)

When the app opens, the dashboard is loaded to present numerous tiles expressing an aggregated view over all capacities of which the user is a Capacity Admin. The dashboard layout includes five main sections:

- **Overview** - App version, number of capacities and workspaces
- **System Summary** - Memory and CPU metrics
- **Dataset Summary** - Number of datasets, DQ/LC, refresh, and query metrics
- **Dataflow Summary** - Number of dataflows, and dataset metrics
- **Paginated Report Summary** - Refresh and view metrics

The underlying report, from which the dashboard tiles were pinned, can be accessed by clicking on any dashboard tile. It provides a more detailed perspective of each of the dashboard sections and supports interactive filtering. 

Filtering can be achieved by setting slicers by date range, capacity, workspace and workload (report, dataset, dataflow), and by selecting elements within report visuals to cross filter the report page. Cross filtering is a powerful technique to narrow down to specific time periods, capacities, workspaces, datasets, etc. and can be very helpful when performing root cause analysis.

For detailed information about dashboard and report metrics in the app, see [Monitor Premium capacities with the app](service-admin-premium-monitor-capacity.md).

## Interpreting metrics

Metrics should be monitored to establish a baseline understanding of resource usage and workload activity. If the capacity becomes slow, it is important to understand which metrics to monitor, and the conclusions you can make.

Ideally, queries should complete within a second to deliver responsive experiences to report users and enable higher query throughput. It is usually of lesser concern when background processes - including refreshes - take longer times to complete.

In general, slow reports can be an indication of an over-heating capacity. When reports fail to load, this is an indication of an over-heated capacity. In either situation, the root cause could be attributable to many factors, including:

- **Failed queries** certainly indicate memory pressure, and that a model could not be loaded into memory. The Power BI service will attempt to load a model for 30 seconds before failing.

- **Excessive query wait times** can be due to several reasons:
  - The need for the Power BI service to first evict model(s) and then load the to-be-queried model (recall that higher dataset eviction rates alone are not an indication of capacity stress, unless accompanied by long query wait times that indicate memory thrashing).
  - Model load times (especially the wait to load a large model into memory).
  - Long running queries.
  - Too many LC\DQ connections (exceeding capacity limits).
  - CPU saturation.
  - Complex report designs with an excessive number of visuals on a page (recall that each visual is a query).

- **Long query durations** can indicate that model designs are not optimized, especially when multiple datasets are active in a capacity, and just one dataset is producing long query durations. This suggests that the capacity is sufficiently resourced, and that the in-question dataset is sub-optimal or just slow. Long running queries can be problematic as they can block access to resources required by other processes.
- **Long refresh wait times** indicate insufficient memory due to many active models consuming memory, or that a problematic refresh is blocking other refreshes (exceeding parallel refresh limits).

A more detailed explanation of how to use the metrics is covered in the [Optimizing Premium capacities](service-premium-capacity-optimize.md) article.

## Acknowledgments

This article was written by Peter Myers, Data Platform MVP and independent BI expert with [Bitwise Solutions](https://www.bitwisesolutions.com.au/).

## Next steps

> [!div class="nextstepaction"]
> [Optimizing Premium capacities](service-premium-capacity-optimize.md)   
> [!div class="nextstepaction"]
> [Configure workloads in a Premium capacity](service-admin-premium-workloads.md)   

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

Power BI has introduced Power BI Premium Gen2 as a preview offering, which improves the Power BI Premium experience with improvements in the following:
* Performance
* Per-user licensing
* Greater scale
* Improved metrics
* Autoscaling
* Reduced management overhead

For more information about Power BI Premium Gen2, see [Power BI Premium Generation 2](service-premium-what-is.md#power-bi-premium-generation-2).
