---
title: Monitor Power BI Premium capacities by using the admin portal
description: Use the Power BI admin portal to monitor your Premium capacities.
author: mgblythe
ms.author: mblythe
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 04/10/2019
LocalizationGroup: Premium 
---

# Monitor capacities in the Admin portal

The **Health** tab in the **Capacity settings** area in the Admin portal provides a metrics summary about your capacity and enabled workloads.  

![Capacity Health tab in the portal](media/service-admin-premium-monitor-portal/admin-portal-health.png)

If you need more comprehensive metrics, use the [Power BI Premium Capacity Metrics](service-admin-premium-monitor-capacity.md) app. The app provides drill-down and filtering, and the most detailed metrics for near every aspect affecting capacity performance. To learn more, see [Monitor Premium capacities with the app](service-admin-premium-monitor-capacity.md).

## System Metrics

On the **Health** tab, at the highest level, CPU utilization and memory usage provide a quick view of the most important metrics for the capacity. These metrics are cumulative, including all enabled workloads for the capacity.

| **Metric** | **Description** |
| --- | --- |
| CPU UTILIZATION | Average CPU utilization, as a percentage of total available CPU. |
| MEMORY USAGE | Average memory usage in gigabytes (GB).|

## Workload metrics

For each workload enabled for the capacity. CPU utilization and memory usage are shown.

| **Metric** | **Description** |
| --- | --- |
| CPU UTILIZATION | Average CPU utilization, as a percentage of total available CPU. |
| MEMORY USAGE | Average memory usage in gigabytes (GB).|

### Detailed workload metrics

Each workload has additional metrics. The type of metrics shown depend on the workload. To see detailed metrics for a workload, click the expand (down) arrow.

![Workload health expand](media/service-admin-premium-monitor-portal/admin-portal-health-expand.png)

#### Dataflows

##### Dataflow Operations

| **Metric** | **Description** |
| --- | --- |
| Total Count | Total refreshes for each dataflow. |
| Success Count | Total successful refreshes for each dataflow.|
| Average Duration (min) | The average duration of refresh for the dataflow, in minutes |
| Max Duration (min) | The duration of the longest-running refresh for the dataflow, in minutes. |
| Average Wait Time (min) | The average lag between the scheduled time and start of a refresh for the dataflow, in minutes. |
| Max Wait Time (min) | The maximum wait time for the dataflow, in minutes.  |

#### Datasets

##### Refresh

| **Metric** | **Description** |
| --- | --- |
| Total Count | Total refreshes for each dataset. |
| Success Count | Total successful refreshes for each dataset. |
| Failure Count | Total failed refreshes for each dataset. |
| Success Rate  | Number of successful refreshes divided by the total refreshes to measure. reliability. |
| Average Duration (min) | The average duration of refresh for the dataset, in minutes.  |
| Max Duration (min) | The duration of the longest-running refresh for the dataset, in minutes. |
| Average Wait Time (min) | The average lag between the scheduled time and start of a refresh for the dataset, in minutes. |
| Max Wait Time (min) | The maximum wait time for the dataset, in minutes. |

##### Query

| **Metric** | **Description** |
| --- | --- |
| Total Count | The total number of queries run for the dataset. |
| Average Duration (ms) |The average query duration for the dataset, in milliseconds|
| Max Duration (ms) |The duration of the longest-running query in the dataset, in milliseconds. |
| Average Wait Time (ms) |The average query wait time for the dataset, in milliseconds. |
| Max Wait Time (ms) |The duration of the longest-waiting query in the dataset, in milliseconds. |

##### Eviction

| **Metric** | **Description** |
| --- | --- |
| Model Count | The total number of dataset evictions for this capacity. When a capacity faces memory pressure, the node evicts one or more datasets from memory. Datasets that are inactive (with no query/refresh operation currently executing) are evicted first. Then the eviction order is based on a measure of 'least recently used' (LRU). |

#### Paginated Reports

##### Report Execution

| **Metric** | **Description** |
| --- | --- |
| Execution Count  | The number of times the report was been executed and viewed by users.|

##### Report Usage

| **Metric** | **Description** |
| --- | --- |
| Success Count | The number of times the report has been viewed by a user. |
| Failure Count |The number of times the report has been viewed by a user.|
| Row Count |The number of rows of data in the report. |
| Data Retrieval Duration (ms) |The average amount of time it takes to retrieve data for the report, in milliseconds. Long durations can indicate slow queries or other data source issues.  |
| Processing Duration (ms) |The average amount of time it takes to process the data for a report, in milliseconds. |
| Rendering Duration (ms) |The average amount of time it takes to render a report in the browser, in milliseconds. |

> [!NOTE]
> Detailed metrics for the **AI** workload are not yet available.

## Next steps

Now that you understand how to monitor Power BI Premium capacities, learn more about optimizing capacities.

> [!div class="nextstepaction"]
> [Optimizing Power BI Premium capacities](service-premium-capacity-optimize.md)
