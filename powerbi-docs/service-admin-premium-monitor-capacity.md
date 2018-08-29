---
title: Monitor Power BI Premium capacities in your organization
description: Use the Power BI admin portal and Power BI Premium Capacity Metrics app
author: mgblythe
ms.author: mblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-admin
ms.topic: conceptual
ms.date: 08/29/2018
LocalizationGroup: Premium 
---

# Monitor Power BI Premium capacities in your organization

This article provides an overview of monitoring the metrics for your Power BI Premium capacities. Monitoring metrics enables you to take an informed approach to managing your capacities. 

You can monitor capacity with the Power BI Premium Capacity Metrics app or in the admin portal. We recommend the app, because it provides much more detail, but this article covers both options.

## Install the Premium Capacity Metrics app

You can go straight to the [Premium Capacity Metrics app](https://app.powerbi.com/groups/me/getapps/services/capacitymetrics) or install it like you do other apps in Power BI:

1. In Power BI, click **Apps**.

    ![Go to Apps](media/service-admin-premium-monitor-capacity/apps.png)

2. On the right side, click **Get apps**.

3. In the **Apps** category, search for **Power BI Premium Capacity Metrics app**.

    ![Select the app](media/service-admin-premium-monitor-capacity/report-app.png)

4. Subscribe to install the app.

Now that you've installed the app, you can see metrics about the capacities in your organization. Let's take a look at some of the key metrics that are available.

## Use the monitoring app 
When you open the app, it first shows a dashboard with a summary of all the capacities for which you have admin rights.

![Premium report overview](media/service-admin-premium-monitor-capacity/app-dashboard.png)

### Filtering

The **Filters applied to all pages** tab allows you to select a capacity, a dataset, and/or a date range within the past seven days. These filters apply the selection to all the relevant pages and tiles in this report. If nothing is selected, the report defaults to show the past week’s metrics on every capacity you own.

![Premium report overview](media/service-admin-premium-monitor-capacity/premium-report-overview.png)

### Summary tab

The **Summary** tab shows a view of the capacity based on entities, system, and datasets.

![Filters that apply to all pages](media/service-admin-premium-monitor-capacity/filters-applied-to-all-pages.png)

| **Area** | **Metrics** |
| --- | --- |
| **Entities** | * The number of capacities you own<br> * The distinct number of datasets in your capacity<br> * The distinct number of workspaces in your capacity |
| **System** | * The average memory usage in GB over the past seven days<br> * Highest memory consumption in GB in the past seven days and the local time it occurred.<br> * The number of times CPU exceeded 80% of the thresholds in the past seven days split into 3-minute buckets<br> * Most times the CPU exceeded 80% in the past seven days split by hour buckets and the local time it occurred.<br> * The number of times Direct query/Live connections exceeded 80% of the thresholds in the past seven days split into 3-minute buckets<br> * Most times the Direct query/Live connections exceeded 80% in the past seven days split by hour buckets and the local time it occurred. |
| **Dataset Workloads** | * Total number of refreshes in the past seven days<br> * Total number of successful refreshes in the past seven days<br> * Total number of failed refreshes in the past seven days<br> * Total number of failed refreshes due to out of memory<br> * Average refresh duration is measured in minutes, the time taken to complete the operation<br> * Average refresh wait-time is measured in minutes, the average lag between the scheduled time and start of the operation.<br> * Total number of queries run in the past seven days<br> * Total number of successful queries in the past seven days<br> * Total number of failed queries in the past seven days<br> * Average queries duration is measured in minutes, the time taken to complete the operation<br> * Total number of models evicted due to memory pressure |
|  |  |

### Refreshes tab

The **Refreshes** tab lists out the complete refreshes, success measures, average/max refresh wait-time and average/max refresh duration sliced by datasets in the past seven days. The bottom two charts show the refreshes vs. memory consumption in GB and average wait-times split by one-hour buckets reported in local time. The top bar charts list the top five datasets by the total of the max time it took to complete the dataset to refresh (refresh duration), and max refresh waits time. Multiple high refresh wait-time spikes are indicative of the capacity running hot.

![Premium refresh report](media/service-admin-premium-monitor-capacity/premium-refresh-report.png)

### Datasets tab

The **Datasets** tab shows complete datasets evicted due to memory pressure by the hour.

![Premium datasets report](media/service-admin-premium-monitor-capacity/premium-datasets-report.png)

### System tab

The **System** tab shows the CPU High utilization (number of times exceeded 80% utilization), Direct Query/Live connections high utilization, and Memory Consumption.

![Premium System report](media/service-admin-premium-monitor-capacity/premium-system-report.png)

## Monitor Power BI Embedded capacity

The Premium Capacity Metrics app can also be used to monitor A SKU capacities in Power BI Embedded. Those capacities will show up in the report as long as you are an admin of the capacity. However, refresh of the report fails unless you grant certain permissions to Power BI on your A SKUs:

1. Open your capacity in the Azure portal.
1. Click **Access control (IAM)**, and add the “Power BI Premium” app to the reader role. If you are unable to find the app by name, you can also add it by its client Id: cb4dc29f-0bf4-402a-8b30-7511498ed654.

    [Permissions for Power BI Embedded](media/service-admin-premium-monitor-capacity/embedded-permissions.png)

## Basic monitoring in the admin portal

![Usage in 7 days](media/service-admin-premium-monitor-capacity/usage-in-days.png)

The **Capacity settings** area of the admin portal provides four gauges that indicate the loads placed and the resources utilized by your capacity for the past seven days. These four tiles work on an hourly time window that indicates how many hours in the past seven days the corresponding metric was above 80%. This metric indicates a potential degradation for the end-user experience.

> [!NOTE]
> You can monitor Power BI Embedded capacity usage in the app or the Azure portal, but not in the Power BI admin portal.

| **Metric** | **Description** |
| --- | --- |
| CPU |Number of times CPU exceeded 80% utilization. |
| Memory Thrashing |Represents the memory pressure on your backend cores. Specifically, this is a metric of how many times datasets are evicted from memory due to memory pressure from the usage of multiple datasets. |
| Memory Usage |Average memory usage, represented in gigabytes (GB). |
| DQ/s | Number of times Direct Query and Live Connections count exceeded 80% of the limit. <br> * We limit the total number of DirectQuery and live connection queries per second.* The limits are 30/s for P1, 60/s for P2 and 120/s for P3. * Direct Query and live connection queries count add to the above throttle. For example, if you have 15 DirectQueries and 15 live connections in a second, you hit your throttle.<br>* This applies equally to on-premises and cloud connections. |
|  |  |

Metrics reflect utilization over the past week.  If you'd like to see a more detailed view of the metrics, you can do so by clicking any of the summary tiles.  This will take you to detailed charts for each of the metrics for your premium capacity. The following chart shows details for the CPU metric.

![Detailed usage chart CPU](media/service-admin-premium-monitor-capacity/premium-usage-detailed-chart-cpu.png)

These charts are summarized on an hourly basis for the past week, and can help isolate when you may have had specific performance-related events in your premium capacity.

You may also export the underlying data for any of the metrics to a csv file.  This export will give you detailed information in three minute intervals for each day of the past week.

## Next Steps

Now that you have gone through the report to monitor Power BI Premium capacities, you can learn more about optimizing capacities.

> [!div class="nextstepaction"]
> [Power BI Premium capacity resource management and optimization](service-premium-understand-how-it-works.md)