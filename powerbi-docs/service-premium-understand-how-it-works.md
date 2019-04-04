---
title: Power BI Premium capacity memory use and optimization
description: Understand Power BI Premium capacity memory management and optimization.
ms.date: 02/05/2019
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-admin
ms.author: owend
ms.reviewer: owend
author: minewiskan
manager: kfile
---

# Microsoft Power BI Premium capacity resource management and optimization

This article describes how Power BI Premium manages resources; the article also provides examples and troubleshooting suggestions. For an overview, see [What is Power BI Premium?](service-premium.md).

## Premium capacity memory management

 Premium capacity memory is consumed by:

* The datasets that are loaded into memory
* Dataset refresh (both scheduled and on-demand)
* Workloads that the capacity supports
* Report queries

When a request is issued against a published dataset in your capacity, that dataset is loaded into memory from persistent storage (this is also called image load). Keeping the dataset loaded in memory helps in fast response to future queries to this dataset. In addition to the memory needed for keeping the dataset loaded in the memory, report queries and dataset refresh consume additional memory.

### Dataset memory estimation

When attempting to load a dataset into memory, Power BI estimates the amount of memory that the dataset will require to complete the requested command. Datasets in memory tend to be larger in size than they are when saved to disk. During refresh of a dataset, Power BI requires at least double the amount of memory than required when the dataset is idle.

### Overcommitting capacity, eviction, and reloading of datasets

Power BI Premium gives you the advantage of *overcommitting* your capacity. For example, you can publish more datasets than your capacity can hold. If the published datasets need more memory than what's available in the capacity, some of the datasets are stored separately in persistent storage. The persistent storage is part of the 100 TB of storage associated with each of your capacities.

So what datasets stay in memory and what happens to the other datasets? As described earlier, when a request is issued against a dataset, it is loaded into memory (image load). The request could be a report query or a refresh operation. But because you can overcommit your capacity, the capacity may also face memory pressure. When a capacity faces memory pressure, the node *evicts* one or more datasets from memory. Datasets that are inactive (with no query/refresh operation currently executing) are evicted first. Then the eviction order is based on a measure of 'least recently used' (LRU). If new commands are issued to the evicted dataset, the service attempts to reload the dataset into memory, potentially evicting other datasets. This behavior allows for more efficient utilization by allowing the capacity to serve many more datasets than its memory can hold.

Loading a dataset into memory is a fairly costly operation. Depending on the dataset size, it can last from a couple of seconds for small datasets to tens of seconds or even minutes for significant datasets like ~10-GB datasets. Premium capacity attempts to minimize the number of times the capacity will need to be loaded by keeping the least recently used datasets in memory for as long as possible. When additional memory is needed, some datasets will need to be evicted and the system will attempt to choose the one that has the least impact on the user experience. When additional memory is needed, some datasets will need to be evicted and the system will attempt to choose the one that has the least impact on the user experience. For example, the system will avoid evicting datasets that were actively used within the last few minutes. These datasets are likely to be queried again very soon.

The eviction process itself is a fast operation. If the dataset is not in active use at the time of eviction, the user will not be able to determine much impact from the eviction. However, if too many datasets are in active use at the same time and there is not enough memory to hold them all, many evictions can occur. Too many active datasets can lead to a ‘thrashing’ situation, where datasets are constantly being evicted and reloaded, and users could see a noticeable drop in response times and performance.

### Dataset refresh memory requirement competing with an active dataset memory requirement

Datasets can be refreshed on a schedule or on-demand by users. As described earlier, the memory required for full refreshes is at least doubled the memory size of the loaded and idle datasets. Before refresh starts, a refresh memory requirement is estimated. If the total memory requirement is more than the available memory in the capacity, some datasets are evicted. Again, eviction is based on LRU.

If the required memory is not available despite eviction, the refresh is queued to be retried. The service retries until it succeeds or a new refresh action begins.

If an interactive query is issued to any dataset in the capacity and there is not enough memory available because of an ongoing refresh, that request fails and needs to be retried by the user.

### Workloads

By default, capacities for **Power BI Premium** and **Power BI Embedded** support only the workload associated with running Power BI queries in the cloud. We now offer preview support for two additional workloads: **Paginated reports** and **Dataflows**. If enabled, these workloads can impact memory usage in your capacity. 

## CPU resource management in premium capacity

There are two primary consumers of CPU resources:

* Queries from reports
* Refresh (processing)

### Queries from reports

Report queries consume CPU resources in your capacity. Reports with inefficient queries, or many concurrent users, can consume a lot of CPU resources. Your existing capacity may not be sufficient to handle the load.

### Refresh parallelization policy

Memory is not the only resource that can constrain dataset refresh. The number of v-cores on a server can also be a factor. Because each refresh operation requires a certain number of v-cores, there is a limit as to how many refreshes can run in parallel. The limit per SKU is detailed in the following table. Additional refreshes that go beyond these limits are queued.

 | SKU | Backend V-Cores | Model refresh parallelism |
 | --- | --- | --- |
 | A1  | 0.5  | 1  |
 | A2  | 1  | 2  |
 | A3  | 2  | 3  |
 | A4  | 4  | 6  |
 | A5  | 8  | 12  |
 | A6  | 16  | 24  |
 | EM1  | 0.5  | 1  |
 | EM2  | 1  | 2  |
 | EM3  | 2  | 3  |
 | P1  | 4  | 6  |
 | P2  | 8  | 12  |
 | P3  | 16  | 24  |
 | P4  | 32  | 48  |
 | P5  | 64  | 96  |

 > [!TIP]
> If your refreshes are delayed, check the number of parallel refreshes supported by your capacity.

## Example scenarios

Here are some common scenarios and the actions taken by the service:

**Twenty scheduled refreshes submitted all at the same time**. Power BI attempts to start the first *x* refreshes at the same time. The value for *x* is determined by the refresh parallelization policy for that SKU. If Power BI is unable to obtain enough memory by evicting inactive datasets (datasets not used recently), not all *x* refreshes will start at the same time. Any refresh that cannot start is queued until it can start.

**Two refreshes running at the same time and there is only enough memory for one to finish**. The one that can finish starts. The other is retried later.

**Large number of datasets being queried while several datasets are being refreshed**. If enough memory is not available, Power BI attempts to stop active refreshes to give priority to interactive queries. This decreases the refresh performance.

**Dataset requires too much memory to be refreshed on current capacity size**. Refresh fails. No attempts are made to obtain more memory by eviction.

**Refreshing a single dataset which has a large spike in memory**. If the spike is larger than the amount of memory that can be obtained by evicting inactive datasets, refresh is retried later until there is enough memory to handle the spike.

**Query is executed for a dataset which cannot obtain enough memory by evicting all inactive datasets and refreshes**. Those queries fail. For these kinds of workload requirements, higher capacity should be purchased.

## Troubleshooting and testing

If reports are slow or unresponsive, start by testing for just one user on your report. Then start increasing the concurrent user load to find the limit. In many cases, tuning your DAX queries can dramatically change the performance of your reports. Query tuning also increases the number of concurrent users supported by your capacity. [Monitor your capacity](service-admin-premium-monitor-capacity.md) to identify potential performance issues.

Use Power BI Embedded capacity in Azure to test different SKUs and determine the best Premium SKU for your expected workload. The Power BI Embedded A4 SKU is equal to the P1, A5 = P2, and A6 = P3. In Azure you can easily switch between SKUs by scaling up and down in the Azure portal. When you find the SKU that works best for your workload and are done testing, you can delete the SKU.

In some cases, opening a Power BI Desktop (.pbix) file of the model on your computer and checking memory and CPU consumption tells a lot about the issue. This doesn't help for very large models, but for some smaller models, try opening, refreshing, and querying the model from your computer. Check the model size, memory, and CPU consumed when you open the model. Try refreshing and querying. Use task manager to check CPU and memory consumption for the local file. Sometimes, those metrics on your computer itself can tell that lower premium capacity like P1/ P2 may not work for your solution.

