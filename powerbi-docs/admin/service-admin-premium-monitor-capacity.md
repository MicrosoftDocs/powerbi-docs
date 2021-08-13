---
title: Monitor Power BI Premium capacities with the Premium Capacity Metrics app.
description: Use the Power BI admin portal and Power BI Premium Capacity Metrics app
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 04/20/2021
LocalizationGroup: Premium 
---

# Monitor Premium capacities with the app

Monitoring your capacities is essential to making informed decisions on how best to utilize your Premium capacity resources. You can monitor capacities in the Admin portal or with the **Power BI Premium Capacity Metrics** app. This article describes using the Premium Capacity Metrics app. The app provides the most in-depth information into how your capacities are performing. For a higher level overview of average use metrics over the last seven days, you can use the Admin portal. To learn more about monitoring in the portal, see [Monitor Premium capacities in the Admin portal](service-admin-premium-monitor-portal.md).

The app is updated regularly with new features and functionality. Make sure you're running the latest version. When a new version becomes available, you will receive [notification](../connect-data/service-template-apps-install-distribute.md#update-a-template-app).

> [!IMPORTANT]
> If your Power BI Premium capacity is experiencing high resource usage, resulting in performance or reliability issues, you can receive notification emails to identify and resolve the issue. This can be a streamlined way to troubleshoot overloaded capacities. See [capacity and reliability notifications](service-interruption-notifications.md#capacity-and-reliability-notifications) for more information.

> [!NOTE]
> Power BI Premium recently released a new version of Premium, called **Premium Gen2**, which is currently in preview. Premium Gen2 will simplify the management of Premium capacities, and reduce management overhead. For more information, see [Power BI Premium Generation 2 (preview)](service-premium-what-is.md#power-bi-premium-generation-2-preview).
>
>To review the Power BI Embedded Gen2 enhancements, refer to [Power BI Embedded Generation 2](../developer/embedded/power-bi-embedded-generation-2.md).

> [!NOTE]
> The metrics app cannot be used to monitor Premium Per User (PPU) activities or capacity.

## Install the app

Go to [Connect to Power BI Premium Capacity Metrics](../connect-data/service-connect-to-pbi-premium-capacity-metrics.md) to see how to install the app and connect to data. Alternatively, you can [go straight to the app](https://go.microsoft.com/fwlink/?linkid=2114036).

## Get app refresh history

To check the last time your Premium Capacity Metrics app refreshed:

1. Go to the workspace that was installed with the app.

   :::image type="content" source="media/service-admin-premium-monitor-capacity/powerbi-premium-workspace-select.png" alt-text="Screenshot that shows the selection of a workspace with the Premium Capacity Metrics app.":::

1. The last refresh performed is shown in the **Refreshed** column.

   :::image type="content" source="media/service-admin-premium-monitor-capacity/powerbi-capacity-metrics-refresh.png" alt-text="Screenshot that shows the refresh time and date for the app in the Refreshed column.":::

## Monitor capacities with the app

Now that you've installed the app, you can see metrics for the capacities in your organization. The app provides a Dashboard with metrics summaries, and detailed metrics Reports.

### Dashboard

To see a dashboard that summarizes key metrics for capacities for which you are an admin, in **Dashboards**, click **Power BI Premium Capacity Metrics**. A dashboard appears.

![Metrics app dashboard](media/service-admin-premium-monitor-capacity/app-dashboard.png)

The dashboard includes the following metrics:

#### Top

| Metric | Description |
| --- | --- |
| Version | App version. | 
| Capacities | Number of capacities for which you are admin. | 
| Workspaces | Number of workspaces in your capacities that are reporting metrics.|
|||

#### System Summary

| Metric | Description |
| --- | --- |
| CPU Highest Utilization Capacity | Capacity with the maximum number of times CPU exceeded 80% of the thresholds in the past seven days. |
| CPU Highest Utilization Count | Number of times CPU the named capacity exceeded 80% of the thresholds in the past seven days. | 
| Memory Max Utilization Capacity | Capacity with the maximum number of times max memory limit was hit in the past seven days, split into three-minute buckets.  |
| Memory Max Utilization Count| Number of times the named capacity reached the max memory limit in the past seven days, split into three-minute buckets. |
|||

#### Dataset Summary

| Metric | Description |
| --- | --- |
| Datasets | Total number of datasets across all workspaces in your capacities.|
| Datasets Average Size (MB) | Average size of datasets across all workspaces in your capacities.|  
| Datasets Average Loaded Count | Average count of datasets loaded into memory. |  
| Datasets - Average Active Dataset (%)| Average active datasets in the past seven days. A dataset is defined as active if the user has interacted on the visuals with the past three minutes. |
| CPU - Datasets Max (%)| Max CPU consumption by dataset workload in the past seven days. |
| CPU - Datasets Average (%)| Average CPU consumption by dataset workload in the past seven days. |
| Memory - Datasets Average (GB) | Average memory consumption by dataset workload in the past seven days. |
| Memory - Datasets Max (GB) | Max memory consumption by dataset workload in the past seven days.|
| Datasets Evictions | Total number of datasets evicted due to memory pressure. |
| DirectQuery/Live High Utilization Count| Number of times DirectQuery/Live connections exceeded 80% of the thresholds in the past seven days, split into three-minute buckets. |
| DirectQuery/Live Max Utilization Count| Most times the DirectQuery/Live connections exceeded 80% in the past seven days, split into one-hour buckets. |
| DirectQuery/Live Max High Utilization | Maximum number of times DirectQuery/Live connections exceeded 80% of the thresholds in the past seven days, split into three-minute buckets.|
| DirectQuery/Live Max Occurred Time | Time in UTC that DirectQuery/Live connections exceeded 80% the most times in an hour. |
| Refreshes Total | Total number of refreshes in the past seven days. |
| Refresh Reliability (%) | Number of successful refreshes divided by the total number of refreshes in the past seven days. |
| Refreshes Average Duration (Minutes) | Average amount of time to complete refresh. |
| Refreshes Average Wait Time (Minutes)| Average amount of time before starting refresh. |
| Queries Total |  Total number of queries run in the past seven days. |
| Queries Total Wait Count | Total number of queries that had to wait before being executed. |
| Queries Average Duration (MS) | Average time taken to complete queries. |
| Queries Average Wait Time (MS) | Average time queries waited on system resources before being executed. |
|||

#### Dataflow Summary

| Metric | Description |
| --- | --- |
| Dataflows |  Total number of dataflows across all workspaces in your capacities.|
| Refreshes Total | Total number of refreshes in the past seven days.|  
| Refreshes Average Duration (Minutes) | The time taken to complete the refresh. |
| Refreshes Average Wait Times (Minutes) | The lag between the scheduled time and actual start of the refresh.|
| CPU - Dataflows Max (%) | Max CPU consumption by dataflows workload in the past seven days. |
| CPU - Dataflows Average (%) | Average CPU consumption by dataflows workload in the past seven days. |
| Memory - Dataflows Max (GB) | Max memory consumption by dataflows workload in the past seven days. |
| Memory - Dataflows Average (GB) | Average memory consumption by dataflows workload in the past seven days. |
|||

#### Paginated Report Summary

| Metric | Description |
| --- | --- |
| Paginated Reports |  Total number of paginated reports across all workspaces in your capacities. |
| Views Total | Total number of times that all reports have been viewed by users. | 
| Rows Total | Total number of rows of data in all reports.|
| Total Time | Total time it takes for all phases (data retrieval, processing, and rendering) of all reports, in milliseconds. |
| CPU - Paginated Reports Max (%) | Maximum CPU consumption by paginated report workload in the past seven days. |
| CPU - Paginated Reports Average (%) | Average CPU consumption by paginated report workload in the past seven days. |
| Memory - Paginated Reports Max (GB) | Maximum memory consumption by paginated report workload in the past seven days. |
| Memory - Paginated Reports Average (GB) | Average memory consumption by paginated report workload in the past seven days. |
|||

#### AI Summary

| Metric | Description |
| --- | --- |
| AI Function Execution | Total number of executions in the past seven days. |
| AI Function Execution Reliability (%) | Number of successful executions divided by the total number of executions in the past seven days. |
| CPU Max (%)| Max CPU consumption by the AI workload in the past seven days. |
| Memory Max (GB) | Max memory consumption by the AI workload in the past seven days.|
| AI Function Execution Max Wait Time (MS) | Maximum amount of time before starting execution. |
| AI Function Execution Average Wait Time (MS)| Average amount of time before starting execution. |
| AI Function Execution Max Duration (MS) | Maximum amount of time to complete execution. |
| AI Function Execution Average Duration (MS)| Average amount of time to complete execution. |
| | |

### Reports

Reports provide more detailed metrics. To see reports for capacities for which you are an admin, in **Reports**, click **Power BI Premium Capacity Metrics**. Or, from the dashboard, click a metric cell to go to the underlying report. 

At the bottom of the report, there are five *tabs*:

[**Datasets**](#datasets) - Provides detailed metrics on the health of the Power BI datasets in your capacities.
[**Paginated Reports**](#paginated-reports) - Provides detailed metrics on the health of the paginated reports in your capacities.
[**Dataflows**](#dataflows) - Provides detailed refresh metrics for dataflows in your capacities.
[**AI**](#ai) - Provides detailed metrics on the health of the AI functions used in your capacities.
[**Resource Consumption**](#resource-consumption) - Provides detailed resource metrics including memory and CPU high utilization.
[**IDs and Info**](#ids-and-info) - Names, IDs, and owners for capacities, workspaces, and workloads.

Each tab opens a page where you can filter metrics by capacity and date range. If no filters are selected, the report defaults to show the past week’s metrics for all capacities that are reporting metrics. 

### Datasets

The Datasets page has different *areas*, which include  **Refreshes**, **Query Durations**, **Query Waits**, and **Datasets**. Use the buttons at the top of the page to navigate to different areas.

#### Refreshes area

| Report section | Metrics |
| --- | --- |
| Refreshes |  Total Count: Total refreshes for each dataset.<br>  Reliability: The percentage of refreshes that completed for each dataset.<br>  Avg Wait Time: The average lag between the scheduled time and start of a refresh for the dataset, in minutes.<br>  Max Wait Time: The maximum wait time for the dataset, in minutes.<br>  Avg Duration: The average duration of refresh for the dataset, in minutes.<br>  Max Duration: The duration of the longest-running refresh for the dataset, in minutes. |
| Top 5 Datasets by Average Duration (minutes) |  The five datasets with the longest average refresh duration, in minutes. |
| Top 5 Datasets by Average Wait Time (minutes) |  The five datasets with the longest average refresh wait time,  in minutes. |
| Hourly Refresh Count and Memory Consumption (GB) |  Successes, failures, and memory consumption, split into one-hour buckets, reported in UTC time. |
| Hourly Average Refresh Wait Times (minutes) |  The average refresh wait time, split into one-hour buckets, reported in UTC time. Multiple spikes with high refresh wait times are indicative of the capacity running hot. |
|  |  |

#### Query Durations area

| Report section | Metrics |
| --- | --- |
| Query Durations |  Data in this section is sliced by datasets, workspace, and hourly buckets in the past seven days.<br>  Total: The total number of queries run for the dataset.<br>  Average: The average query duration for the dataset, in milliseconds<br>  Max: The duration of the longest-running query in the dataset, in milliseconds.|
| Query Duration Distribution |  The query duration histogram is bucketed by query durations (in milliseconds) into the following categories: <= 30ms, 30-100ms, 100-300ms, 300ms-1sec, 1sec-3sec, 3sec-10sec, 10sec-30sec, and > 30 seconds intervals. Long query durations and long wait times are indicative of the capacity running hot. It may also mean that a single dataset is causing problems and further investigation is needed. |
| Top 5 Datasets by Average Duration |  The five datasets with the longest average query duration, in milliseconds. |
| Hourly Query Duration Distributions |  Query counts and average duration (in milliseconds) vs. memory consumption in GB, split into one-hour buckets, reported in UTC time. |
| DirectQuery / Live Connections (> 80% Utilization) |  The times that a DirectQuery or live connection exceeded 80% CPU utilization, split into one-hour buckets, reported in UTC time. |
|  |  |

#### Query Waits area

| Report section | Metrics |
| --- | --- |
| Query Wait Times |  Data in this section is sliced by datasets, workspace, and hourly buckets in the past seven days.<br>  Total: The total number of queries run for the dataset.<br>  Wait count: The number of queries in the dataset that waited on system resources before starting execution.<br>  Average: The average query wait time for the dataset, in milliseconds.<br>  Max: The duration of the longest-waiting query in the dataset, in milliseconds.|
| Top 5 Datasets by Average Wait Time |  The five datasets with the longest average wait time to start executing a query,  in milliseconds. |
| Wait Time Distributions |  The query duration histogram is bucketed by query durations (in milliseconds) into the following categories: <= 50ms , 50-100ms , 100-200ms , 200-400ms 400ms-1sec , 1 sec-5 sec and > 5 seconds intervals. |
| Hourly Query Wait Time Distributions |  Query wait counts and average wait time (in milliseconds) vs. memory consumption in GB, split into one-hour buckets reported in UTC time. |
|  |  |

#### Datasets area

| **Report section** | **Metrics** |
| --- | --- |
| Dataset Sizes  |  Max size: The maximum size of the dataset in MB for the period shown. |
| Dataset Eviction Counts |  Total: The total number of dataset *evictions* for each capacity. When a capacity faces memory pressure, the node evicts one or more datasets from memory. Datasets that are inactive (with no query/refresh operation currently executing) are evicted first. Then the eviction order is based on a measure of 'least recently used' (LRU).|
| Hourly Loaded Dataset Counts |  Number of datasets loaded into memory vs. memory consumption in GB, split into one-hour buckets, reported in UTC time. |
| Hourly Dataset Evictions and Memory Consumption |  Dataset evictions vs. memory consumption in GB, split into one-hour buckets, reported in UTC time. |
| Consumed Memory Percentages |  Total active datasets in memory as a percentage of total memory. The delta between Active and All define datasets that can be evicted. Shown hourly, for the previous seven days. |
|  |  |

### Paginated Reports

| **Report section** | **Metrics** |
| --- | --- |
| Overall usage |  Total Views: The number of times that the report has been viewed by users.<br>  Row Count: The number of rows of data in the report.<br>  Retrieval (avg): The average amount of time it takes to retrieve data for the report, in milliseconds. Long durations can indicate slow queries or other data source issues. <br>  Processing (avg): The average amount of time it takes to process the data for a report, in milliseconds.<br> Rendering (avg): The average amount of time it takes to render a report in the browser, in milliseconds.<br>  Total time: The time it takes for all phases of the report, in milliseconds. |
| Top 5 Reports by Average Data Retrieval Time |  The five reports with the longest average data retrieval time, in milliseconds. |
| Top 5 Reports by Average Report Processing Time |  The five reports with the longest average report processing time, in milliseconds. |
| Hourly Results |  Successes, failures, and memory consumption, split into one-hour buckets, reported in UTC time. |
| Hourly Durations |  Data retrieval vs. processing and rendering time, split into one-hour buckets, reported in UTC time. |
|  |  |

### Dataflows

| **Report section** | **Metrics** |
| --- | --- |
| Refreshes |  Total: Total refreshes for each dataflow.<br>  Reliability: The percentage of refreshes that completed for each dataflow.<br>  Avg Wait Time: The average lag between the scheduled time and start of a refresh for the dataflow, in minutes.<br>  Max Wait Time: The maximum wait time for the dataflow, in minutes.<br>  Avg Duration: The average duration of refresh for the dataflow, in minutes.<br>  Max Duration: The duration of the longest-running refresh for the dataflow, in minutes. |
| Top 5 dataflows by Average Refresh Duration |  The five dataflows with the longest average refresh duration, in minutes. |
| Top 5 dataflows by Average Wait Time |  The five dataflows with the longest average refresh wait time,  in minutes. |
| Hourly Average Refresh Wait Times |  The average refresh wait time, split into one-hour buckets, reported in UTC time. Multiple spikes with high refresh wait times are indicative of the capacity running hot. |
| Hourly Refresh Count and Memory Consumption |  Successes, failures, and memory consumption, split into one-hour buckets, reported in UTC time. |
|  |  |

### AI

| **Report section** | **Metrics** |
| --- | --- |
| AI Memory Consumption | Memory consumption in GB, split into one-hour buckets, reported in UTC time. |
| Hourly AI Function Execution and Average Wait Time | AI executions and average wait time, in milliseconds, split into one-hour buckets, reported in UTC time. |
| Overall Usage | Total count: Number of AI functions in a workspace or dataflow. <br> System Reliability: The percentage of executions that completed.<br> Avg. Wait Time: The average lag between the scheduled time and start of an execution, in milliseconds.<br> Max Wait Time: The maximum wait time, in milliseconds.<br> Avg. Duration: The average duration of an execution, in milliseconds.<br> Max Duration: The duration of the longest-running execution, in milliseconds.<br> Avg Total Size: The average size, in bytes, of the input and output data for the AI function. |
| | |

### Resource Consumption

| **Report section** | **Metrics** |
| --- | --- |
| CPU consumption |  Maximum CPU consumption during the hour, by workload as a percentage of total CPU capacity. Shown hourly, for the previous seven days. |
| Memory consumption |  Maximum memory consumption during the hour, in GB by workload (solid lines), overlaid with workload limits (dotted line). Shown hourly, for the previous seven days. |
|  |  |

### IDs and Info

The **IDs and Info** tab contains areas for **Capacities**, **Workspaces**, **Datasets**, **Paginated Reports**, and **Dataflows**.

#### Capacities area

| Report section | Metrics |
| --- | --- |
| SKU and Workload Information | SKU and workload settings for the capacity. |
| Administrators | Names of administrators for the capacity. |
|||

#### Workspaces area

| Report section | Metrics |
| --- | --- |
| Workspaces | Names and IDs for all workspaces. |
|||

#### Datasets area

| Report section | Metrics |
| --- | --- |
| Datasets | Workspace names and IDs for all datasets. |
|||

#### Paginated Reports area

| Report section | Metrics |
| --- | --- |
| Paginated Reports | Names, workspace names, and IDs for all paginated reports. |
|||

#### Dataflows area

| Report section | Metrics |
| --- | --- |
| Dataflows | Dataflow names, workspace names, and IDs for all dataflows. |
|||

## Monitor Power BI Embedded capacity

You can use the Power BI Premium Capacity Metrics app to monitor *A SKU* capacities in Power BI Embedded. Those capacities will show up in the report as long as you are an admin of the capacity. However, refresh of the report fails unless you grant certain permissions to Power BI on your A SKUs:

1. Open your capacity in the Azure portal.

1. Click **Access control (IAM)**, and then add the **Power BI Premium** app to the reader role. If you are unable to find the app by name, you can also add it by client identifier: `cb4dc29f-0bf4-402a-8b30-7511498ed654`.

    ![Permissions for Power BI Embedded](media/service-admin-premium-monitor-capacity/embedded-permissions.png)

> [!NOTE]
> You can monitor Power BI Embedded capacity usage in the app or the Azure portal, but not in the Power BI admin portal.


## Next steps

> [!div class="nextstepaction"]
> [Optimizing Power BI Premium capacities](service-premium-capacity-optimize.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)

Power BI has introduced Power BI Premium Gen2 as a preview offering, which improves the Power BI Premium experience with improvements in the following:
* Performance
* Per-user licensing
* Greater scale
* Improved metrics
* Autoscaling
* Reduced management overhead

For more information about Power BI Premium Gen2, see [Power BI Premium Generation 2 (preview)](service-premium-what-is.md#power-bi-premium-generation-2-preview).