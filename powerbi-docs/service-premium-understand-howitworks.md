---
title: How Power BI Premium Service Works
description: Understand how Power BI Premium Service Works. This understanding helps in better managing your capacity and troubleshooting problems.
services: powerbi
documentationcenter: ''
author: suds001
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 04/30/2018
ms.author: susuresh

LocalizationGroup: Premium
---

   # How Power BI Premium Service Works

   This document will help you understand how Power BI Premium Service works. This knowledge is useful for better planning and management of your premium capacity.  

   ## Memory Management in Premium Capacity

   Your capacity memory is consumed by following:

   • Memory used by the Loaded Datasets in Capacity Memory

   • Memory used by Processing/ Refreshes of the Datasets (scheduled as well as on demand)

   • Memory used by the report queries

   ## Memory used by the Loaded Datasets, Refreshes, and Report Queries

   When a request is issued against a published dataset in your capacity, that dataset is loaded into memory from persistent storage (this is also called image load). Keeping dataset loaded in memory helps in fast response to future queries to this dataset. In addition to the memory needed for keeping the dataset loaded in the memory, report queries and dataset refreshes also consume additional memory.

   ## Dataset Memory Estimation

   When attempting to load a dataset into memory, Power BI estimates the amount of memory that dataset will require to complete the requested command. Datasets in memory tend to be larger in size than what they are when saved to disk. During refresh of a dataset, it requires at least double the amount of memory that it requires when it is idle.

   ## Overcommitting Capacity, Eviction, and Reloading of Datasets

   Premium gives you the advantage of overcommitting your capacity i.e. you can publish more datasets than Premium Capacity Memory can hold. If the published datasets in your capacity need more memory than can fit in the memory of the capacity, some of the datasets will be stored offline in a persistent storage as part of 100 TB storage associated with each of your capacities.

   So, what datasets stay in memory and what happens to the other datasets? As mentioned earlier, when a request is issued against a dataset, it is loaded into memory (image load). Request could be a report query or a refresh.

   Since you can overcommit your capacity, your capacity may also face memory pressure. When capacity faces memory pressure (because a new dataset needs to be loaded or the queries on some loaded datasets increase the memory requirement), the node evicts 1 or more datasets that are occupying the capacity memory. Datasets that are idle (not getting interactive report queries or refreshes), are evicted first. If new commands are issued to the evicted dataset, our service tries to reload this into memory potentially evicting other datasets. This behavior allows for more efficient utilization of a capacity allowing the capacity to serve many more datasets than its memory can hold.

   Loading a dataset into memory is a fairly costly operation. Depending on the dataset size, it can last from a couple of seconds to tens of seconds for a very large dataset. Premium capacity tries to minimize the number of times the capacity will need to be loaded by trying to keep the datasets that are in use (&quot;Active Datasets&quot;) in memory for as long as possible. &quot;Active Dataset&quot; means that the dataset received a query in the last x minutes (we tune this x minutes as we learn more about workload patterns, so not specifying exact x here).  When additional memory is needed, some dataset will need to be evicted and the system will attempt to choose the one that has the least impact on the user experience.

   The eviction process itself is a fast operation and if the dataset is not in active use at the time of eviction, the user will not feel much impact from the act of eviction. However, if too many datasets are in active use at the same time and there isn&#39;t enough memory to hold them all, a lot of evictions happens. This can lead to slow performance for your end users.

   ## Dataset Refresh Memory Requirement Competing with Active Dataset Memory Requirement

   Datasets can be refreshed on schedule or on demand by the users. As indicated earlier, memory required for full refreshes are at least double the memory size of the loaded and idle dataset. Before refresh starts, refresh memory requirement is estimated. If the total memory requirement is more than the available memory in the capacity, some datasets are evicted. Candidates for eviction are chosen in the following order:

   1. Idle datasets (Not active. See active definition earlier in the doc)

   2. Datasets executing background commands (scheduled refresh &amp; tile refresh queries)

   If the required memory is not available despite eviction, refresh is queued to be retried next time. System keeps retrying until it succeeds, or a new refresh action starts.

   If an interactive query (report or refresh) is issued to any dataset in the capacity and there is not enough memory available because of an ongoing refresh, that refresh is queued to be retried and the eviction takes place in the order mentioned above.

   # CPU Resource Management in Premium Capacity

   There are 2 main sources that consume CPU resources:

   • Queries coming through reports

   • Refreshes/ Processing

   ## Queries coming through the reports

   Report Queries consume CPU resources of your capacity. If your report has some queries that are inefficient or if you have many concurrent users, it can consume a lot of CPU resources and your existing capacity may not be sufficient to handle the load.

   ## Refresh Parallelization Policy

   Memory is not the only resource that can constrain refreshing of datasets. The number of v-cores on a server will also factor in. Since each refresh operation requires a certain number of v-cores, there is a limit as to how many refreshes can run in parallel. The limit per SKU is detailed in the below table. Additional refreshes that go beyond these limits will be queued.

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

   So, if your refreshes are getting delayed, you may want to check out the parallel refreshes supported by your capacity.

   # Understand These Concepts With Some Example Scenarios

   **20 scheduled refreshes submitted all at the same time** – Power BI attempts to start the first x refreshes at the same time. The value for x is determined by the refresh parallelization policy for that SKU. Not all x refreshes will start at the same time if Power BI is unable to obtain enough memory by evicting inactive datasets. Any refresh that is unable to start, will be queued until it can.

   **2 refreshes running at the same time and there is only enough memory for one to finish** – The one that can finish will start. Other one will be retried later.

   **Large number of datasets being queried while several datasets being refreshed** – If enough memory is not available, Power BI attempts to stop active refreshes to give priority to interactive queries. This will decrease the refresh performance.

   **Dataset requires too much memory to be refreshed on current capacity size** – Refresh will fail. No attempts will be made to try to obtain more memory by eviction.

   **Refreshing a single dataset which has a large spike in memory** – if the spike is larger than the amount of memory which can be obtained by evicting inactive datasets, refresh will be retried later until there is enough memory to handle the spike.

   **Query is executed for a dataset which cannot obtain enough memory by evicting all inactive datasets and refreshes** -  Those queries fail. For these kinds of workload requirement, higher capacity should be purchased.



   # Some Troubleshooting &amp; Testing Tips

   - In case of reports being slow or unresponsive, start by testing for just 1 user on your report. And then start increasing the concurrent user load to find the limit. In many cases, tuning your DAX (report queries) can drastically change the performance of your reports (and increase the concurrent number of users supported by your capacity)

   - You can use Power BI Embedded service in Azure to test out the different SKUs and determine the best Premium SKU for your expected workload. The A4 embedded SKU is equal to the P1, A5 = P2 and A6 = P3. In Azure you can easily switch between the SKUs by scaling up and down in the Azure portal. When you find the SKU that works best for your workload and are done testing, you can simply delete this SKU.

   - In some cases, just opening the PBIX file of the model on your computer and checking memory and CPU consumption tells a lot about the issue. This doesn&#39;t help for very big models but for some not so big models, try opening/ refreshing/ querying the model from your computer. Check the model size, memory and CPU consumed when you open the model and try refreshing/ querying (you can use task manager of your machine to check CPU and Memory consumption for local PBIX files). Sometimes, those metrics on your computer itself can tell that lower premium capacity like P1/ P2 may not work.
