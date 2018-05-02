---
title: Power BI Premium capcacity memory use and optimization
description: Understand Power BI Premium capacity memory management and optimization.
ms.date: 04/30/2018
ms.topic: article
ms.service: powerbi
ms.author: susuresh
ms.reviewer: susuresh
author: suds001
manager: kfile
---

 # Power BI Premium capacity resource management and optimization

 This article describes how the Power BI service uses premium capacity memory and provides tips on how you can optimize capacity memory in your solution.

 ## Premium capacity memory management

 Premium capacity memory is consumed by:

* Memory used by the loaded datasets
* Memory used by dataset refresh (both scheduled and on-demand)
* Memory used by report queries

When a request is issued against a published dataset in your capacity, that dataset is loaded into memory from persistent storage (this is also called image load). Keeping the dataset loaded in memory helps in fast response to future queries to this dataset. In addition to the memory needed for keeping the dataset loaded in the memory, report queries and dataset refreshes also consume additional memory.

### Dataset memory estimation

When attempting to load a dataset into memory, Power BI estimates the amount of memory that dataset will require to complete the requested command. Datasets in memory tend to be larger in size than what they are when saved to disk. During refresh of a dataset, memory capacity requires at least double the amount of memory than required when it is idle.

### Overcommitting capacity, eviction, and reloading of datasets

Power BI Premium gives you the advantage of overcommitting your capacity. For example, you can publish more datasets than capacity memory can hold. If the published datasets in your capacity need more memory than can fit in the capacity, some of the datasets will be stored seperately in a persistent storage. The persisitant storage is part of 100 TBs storage associated with each of your capacities.

So, what datasets stay in memory and what happens to the other datasets? As described earlier, when a request is issued against a dataset, it is loaded into memory (image load). The request could be a report query or a refresh operation.

Because you can overcommit your capacity, your capacity may also face memory pressure. When capacity faces memory pressure (because a new dataset needs to be loaded or the queries on some loaded datasets increase the memory requirement), the node *evicts one or more datasets* occupying the capacity memory. Datasets that are idle (not getting interactive report queries or refreshes), are evicted first. If new commands are issued to the evicted dataset, the service attempts to reload this into memory, potentially evicting other datasets. This behavior allows for more efficient utilization by allowing the capacity to serve many more datasets than its memory can hold.

Loading a dataset into memory is a fairly costly operation. Depending on the dataset size, it can last from a couple of seconds to tens of seconds for a very large dataset. Premium capacity attempts to minimize the number of times the capacity will need to be loaded by keeping the datasets that are in use (active datasets) in memory for as long as possible. An active dataset means the dataset has received a query in the last *x* number of minutes (The number of minutes (*x*) is not yet determined. It's still being optimized as we learn more about workload patterns).  When additional memory is needed, some datasets will need to be evicted and the system will attempt to choose the one that has the least impact on the user experience.

The eviction process itself is a fast operation. If the dataset is not in active use at the time of eviction, the user will not be able to determine much impact from the eviction. However, if too many datasets are in active use at the same time and there is not enough memory to hold them all, a lot of evictions can occur. This can lead to slow performance for users.

### Dataset refresh memory requirement competing with an active dataset memory requirement

Datasets can be refreshed on a schedule or on-demand by users. As described earlier, memory required for full refreshes are at least double the memory size of the loaded and idle datasets. Before refresh starts, a refresh memory requirement is estimated. If the total memory requirement is more than the available memory in the capacity, some datasets are evicted. Candidates for eviction are chosen in the following order:

1. Idle datasets (Not active. See active dataset definition earlier in this article).
2. Datasets executing background commands (scheduled refresh and tile refresh queries).

If the required memory is not available despite eviction, refresh is queued to be retried. The service retries until it succeeds or a new refresh action begins.

If an interactive query (report or refresh) is issued to any dataset in the capacity and there is not enough memory available because of an ongoing refresh, that refresh is queued to be retried and the eviction takes place in the order mentioned above.

## CPU resource management in premium capacity

There are two primary consumers of CPU resources:

- Queries from reports
- Refresh (processing)

### Queries from reports

Report queries consume CPU resources of your capacity. If your report has some queries that are inefficient or if you have many concurrent users, it can consume a lot of CPU resources and your existing capacity may not be sufficient to handle the load.

### Refresh parallelization policy

Memory is not the only resource that can constrain refreshing of datasets. The number of v-cores on a server can also be a factor. Since each refresh operation requires a certain number of v-cores, there is a limit as to how many refreshes can run in parallel. The limit per SKU is detailed in the following table. Additional refreshes that go beyond these limits will be queued.

 | SKU  | Backend V-Cores  | Model refresh parallelism   |
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
> If your refreshes are getting delayed, check the number of parallel refreshes supported by your capacity.

## Example scenarios

The following describe some common scenarios and the actions taken by the service:

 **Twenty scheduled refreshes submitted all at the same time** – Power BI attempts to start the first *x* refreshes at the same time. The value for *x* is determined by the refresh parallelization policy for that SKU. If Power BI is unable to obtain enough memory by evicting inactive datasets, not all *x* refreshes starts at the same time. Any refresh that is unable to start, is queued until it can start.

 **Two refreshes running at the same time and there is only enough memory for one to finish** – The one that can finish starts. The other is retried later.

 **Large number of datasets being queried while several datasets are being refreshed** – If enough memory is not available, Power BI attempts to stop active refreshes to give priority to interactive queries. This will decrease the refresh performance.

 **Dataset requires too much memory to be refreshed on current capacity size** – Refresh will fail. No attempts are made to obtain more memory by eviction.

 **Refreshing a single dataset which has a large spike in memory** – If the spike is larger than the amount of memory that can be obtained by evicting inactive datasets, refresh is retried later until there is enough memory to handle the spike.

 **Query is executed for a dataset which cannot obtain enough memory by evicting all inactive datasets and refreshes** - Those queries fail. For these kinds of workload requirements, higher capacity should be purchased.

## Troubleshooting and testing

If reports are slow or unresponsive, start by testing for just one user on your report. Then start increasing the concurrent user load to find the limit. In many cases, tuning your DAX (report queries) can drastically change the performance of your reports (and increase the number of concurrent users supported by your capacity).

Use Power BI Embedded capacity in Azure to test different SKUs and determine the best Premium SKU for your expected workload. The Power BI Embedded A4 SKU is equal to the P1, A5 = P2 and A6 = P3. In Azure you can easily switch between SKUs by scaling up and down in the Azure portal. When you find the SKU that works best for your workload and are done testing, you can delete the SKU.

In some cases, opening a PBIX file of the model on your computer and checking memory and CPU consumption tells a lot about the issue. This doesn't help for very large models, but for some smaller models, try opening, refreshing, and querying the model from your computer. Check the model size, memory, and CPU consumed when you open the model. Try refreshing and querying. Use task manager to check CPU and Memory consumption for the local PBIX file). Sometimes, those metrics on your computer itself can tell that lower premium capacity like P1/ P2 may not work for your solution.
