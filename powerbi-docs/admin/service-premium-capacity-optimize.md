---
title: Optimize Microsoft Power BI Premium capacities
description: Describes optimization strategies for Power BI Premium capacities.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 04/02/2021
ms.custom: 
LocalizationGroup: Premium
---

# Optimizing Premium capacities

When Premium capacity performance issues arise, a common first approach is to optimize or tune your solutions to restore acceptable response times. The rationale being to avoid purchasing additional Premium capacity unless justified.

When additional Premium capacity is required, there are two options described in this article:

- Scale-up an existing Premium capacity
- Add a new Premium capacity

Finally, testing approaches and Premium capacity sizing conclude this article.

> [!NOTE]
> Power BI Premium recently released a new version of Premium, called **Premium Gen2**, which is currently in preview. Premium Gen2 will simplify the management of Premium capacities, and reduce management overhead. For more information, see [Power BI Premium Generation 2 (preview)](service-premium-what-is.md#power-bi-premium-generation-2-preview).
>
>To review the Power BI Embedded Gen2 enhancements, refer to [Power BI Embedded Generation 2](../developer/embedded/power-bi-embedded-generation-2.md).

> [!NOTE]
> You can also get Premium Per User (PPU) licenses for individuals, which provides many of the features and capabilities of a Premium capacity, and also incorporates all functionality included with a Power BI Pro license. For more information, see [Power BI Premium Per User](service-premium-per-user-faq.yml).


The recommendations and best practices recommended in this article ensure CPU utilization of each dataset, and other Power BI artifacts, are optimized.

## Best practices

When trying to get the best utilization and performance, there are some recommended best practices, including:

- Using workspaces instead of personal workspaces.
- Separating business critical and Self-Service BI (SSBI) into different capacities.

  ![Separating business critical and Self-Service BI into different capacities](media/service-premium-capacity-optimize/separate-capacities.png)

- If sharing content only with Power BI Pro users, there may be no need to store the content in a dedicated capacity.
- Use dedicated capacities when looking to achieve a specific refresh time, or when specific features are required. For example, with large datasets or paginated reporting.

### Addressing common questions

Optimizing Power BI Premium deployments is a complex subject involving an understanding of workload requirements, available resources, and their effective use.

This article addresses seven common support questions, describing possible issues and explanations, and information on how to identify and resolve them.

### Why is the capacity slow, and what can I do?

There are many reasons that can contribute to a slow Premium capacity. This question requires further information to understand what is meant by slow. Are reports slow to load? Or are they failing to load? Are report visuals slow to load or update when users interact with the report? Are refreshed taking longer to complete than expected, or previously experienced?

Having gained an understanding of the reason, you can then begin to investigate. Responses to the following six questions will help you to address more specific issues.

### What content is using up my capacity?

You can use the **Power BI Premium Capacity Metrics** app to filter by capacity, and review performance metrics for workspace content. It's possible to review the performance metrics and resource usage by hour for the past seven days for all content stored within a Premium capacity. Monitoring is often the first step to take when troubleshooting a general concern about Premium capacity performance.

Key metrics to monitor include:

- Average CPU and high utilization count.
- Average Memory and high utilization count, and memory usage for specific datasets, dataflows, and paginated reports.
- Active datasets loaded in memory.
- Average and maximum query durations.
- Average query wait times.
- Average dataset and dataflow refresh times.

In the Power BI Premium Capacity Metrics app, active memory shows the total amount of memory given to a report that cannot be evicted because it has been in use within the last three minutes. A high spike in refresh wait time could be correlated with a large and/or active dataset.

The **Top 5 by Average Duration** chart highlights the top five datasets, paginated reports, and dataflows consuming capacity resources. Content in the top five lists is candidates for investigation and possible optimization.

### Why are reports slow?

The following tables show possible issues and ways to identify and handle them.

#### Insufficient capacity resources

| Possible Explanations | How to Identify | How to Resolve |
| --- | --- | --- |
| High total active memory (model can't be evicted because it's in use within the last three minutes).<br><br> Multiple high spikes in query wait times.<br><br> Multiple high spikes in refresh wait times. | Monitor memory metrics \[[1](#endnote-1)\], and eviction counts \[[2](#endnote-2)\]. | Decrease the model size, or convert to DirectQuery mode. See the [Optimizing models](#optimizing-models) section in this article.<br><br> Scale-up the capacity.<br><br> Assign the content to a different capacity. |

#### Inefficient report designs

| Possible Explanations | How to Identify | How to Resolve |
| --- | --- | --- |
| Report pages contain too many visuals (interactive filtering can trigger at least one query per visual).<br><br> Visuals retrieve more data than necessary. | Review report designs.<br><br> Interview report users to understand how they interact with the reports.<br><br> Monitor dataset query metrics \[[3](#endnote-3)\]. | Redesign reports with fewer visuals per page. |

#### Dataset is slow, especially when reports have previously performed well

| Possible Explanations | How to Identify | How to Resolve |
| --- | --- | --- |
| Increasingly large volumes of import data.<br><br> Complex or inefficient calculation logic, including RLS roles.<br><br> Model not fully optimized.<br><br> (DQ/LC) Gateway latency.<br><br> Slow DQ source query response times. | Review model designs.<br><br> Monitor gateway performance counters. | See the [Optimizing models](#optimizing-models) section in this article. |

#### High concurrent report usage

| Possible Explanations | How to Identify | How to Resolve |
| --- | --- | --- |
| High query wait times.<br><br> CPU saturation.<br><br> DQ/LC connection limits exceeded. | Monitor CPU utilization \[[4](#endnote-4)\], query wait times, and DQ/LC utilization \[[5](#endnote-5)\] metrics + Query durations. If fluctuating, can indicate concurrency issues. | Scale-up the capacity, or assign the content to a different capacity.<br><br> Redesign reports with fewer visuals per page. |

**Notes:**   
<a name="endnote-1"></a>\[1\] Average Memory Usage (GB), and Highest Memory Consumption (GB).   
<a name="endnote-2"></a>\[2\] Dataset evictions.   
<a name="endnote-3"></a>\[3\] Dataset Queries, Dataset Average Query Duration (ms), Dataset Wait Count, and Dataset Average Wait Time (ms).   
<a name="endnote-4"></a>\[4\] CPU High Utilization Count and CPU Time of Highest Utilization (past seven days).   
<a name="endnote-5"></a>\[5\] DQ/LC High Utilization Count and DQ/LC Time of Highest Utilization (past seven days).   

### Why are reports not loading?

When reports fail to load, it's a sure sign the capacity has insufficient memory and is over-heated. This can occur when all loaded models are being actively queried and so cannot be evicted, and any refresh operations have been paused or delayed. The Power BI service will attempt to load the dataset for 30 seconds, and the user is gracefully notified of the failure with a suggestion to try again shortly.

Currently there is no metric to monitor for report loading failures. You can identify the potential for this issue by monitoring system memory, specifically highest utilization and time of highest utilization. High dataset evictions and long dataset refresh average wait time could suggest that this issue is occurring.

If this happens only very occasionally, this may not be considered a priority issue. Report users are informed that the service is busy and that they should retry after a short time. If this happens too frequently, the issue can be resolved by scaling up the Premium capacity or by assigning the content to a different capacity.

Capacity Admins (and Power BI service administrators) can monitor the **Query Failures** metric to determine when this happens. They can also restart the capacity, resetting all operations in case of system overload.

### Why are refreshes not starting on schedule?

Scheduled refresh start times are not guaranteed. Recall that the Power BI service will always prioritize interactive operations over background operations. Refresh is a background operation that can occur when two conditions are met:

- There is sufficient memory
- The number of supported concurrent refreshes for the Premium capacity is not exceeded

When the conditions are not met, the refresh is queued until the conditions are favorable.

For a full refresh, recall that at least double the current dataset memory size is required. If sufficient memory is not available, then the refresh cannot commence until model eviction frees up memory - this means delays until one or more datasets becomes inactive and can be evicted.

Recall that the supported number of maximum concurrent refreshes is set to 1.5 times the backend v-cores, rounded up.

A scheduled refresh will fail when it cannot commence before the next scheduled refresh is due to commence. An on-demand refresh triggered manually from the UI will attempt to run up to three times before failing.

Capacity Admins (and Power BI service administrators) can monitor the **Average Refresh Wait Time (minutes)** metric to determine average lag between the scheduled time and the start of the operation.

While not usually an administrative priority, to influence on-time data refreshes, ensure that sufficient memory is available. This may involve isolating datasets to capacities with known sufficient resources. It's also possible that admins could coordinate with dataset owners to help stagger or reduce scheduled data refresh times to minimize collisions. Note that it's not possible for an administrator to view the refresh queue, or to retrieve dataset schedules.

### Why are refreshes slow?

Refreshes can be slow - or perceived to be slow (as the previous common question addresses).

When the refresh is in fact slow, it can be due to several reasons:

- Insufficient CPU (refresh can be very CPU-intensive).
- Insufficient memory, resulting in refresh pausing (which requires the refresh to start over when conditions are favorable to recommence).
- Non-capacity reasons, including datasource system responsiveness, network latency, invalid permissions or gateway throughput.
- Data volume - a good reason to configure incremental refresh, as discussed below.

Capacity Admins (and Power BI service administrators) can monitor the **Average Refresh Duration (minutes)** metric to determine a benchmark for comparison over time, and the **Average Refresh Wait Time (minutes)** metrics to determine average lag between average lag between the scheduled time and the start of the operation.

Incremental refresh can significantly reduce data refresh duration, especially for large model tables. There are four benefits associated with incremental refresh:

- **Refreshes are faster** - Only a subset of a table needs loading, reducing CPU and memory usage, and parallelism can be higher when refreshing multiple partitions.
- **Refreshes occur only when required** - Incremental refresh policies can be configured to load only when data has changed.
- **Refreshes are more reliable** - Shorter running connections to volatile datasource systems are less susceptible to disconnection.
- **Models remain trim** - Incremental refresh policies can be configured to automatically remove history beyond a sliding window of time.

To learn more, see [Incremental refresh for datasets](../connect-data/incremental-refresh-overview.md).

### Why are data refreshes not completing?

When the data refresh commences but fails to complete, it can be due to several reasons:

- Insufficient memory, even if there is only one model in the Premium capacity, i.e. the model size is very large.
- Non-capacity reasons, including datasource system disconnection, invalid permissions or gateway error.

Capacity Admins (and Power BI service administrators) can monitor the **Refresh Failures due to out of Memory** metric.

## Optimizing models

Optimal model design is crucial to delivering an efficient and scalable solution. However, it's beyond the scope of this article to provide a complete discussion. Instead, this section will provide key areas for consideration when optimizing models.

### Optimizing Power BI hosted models

Optimizing models hosted in a Premium capacity can be achieved at the datasource(s) and model layers.

Consider the optimization possibilities for an Import model:

![Optimization possibilities for an Import model](media/service-premium-capacity-optimize/import-model-optimizations.png)

At the datasource layer:

- Relational data sources can be optimized to ensure the fastest possible refresh by pre-integrating data, applying appropriate indexes, defining table partitions that align to incremental refresh periods, and materializing calculations (in place of calculated model tables and columns) or adding calculation logic to views.
- Non-relational data sources can be pre-integrated with relational stores.
- Ensure that gateways have enough resources, preferably on dedicated machines, with sufficient network bandwidth and in close proximity to the data sources.

At the model layer:

- Power Query query designs can minimize or remove complex transformations and especially those that merge different data sources (data warehouses achieve this during their Extract-Transform-Load stage). Also, ensuring that appropriate datasource privacy levels are set, this can avoid requiring Power BI to load full results to produce a combined result across queries.
- The model structure determines the data to load and has a direct impact on the model size. It can be designed to avoid loading unnecessary data by removing columns, removing rows (especially historic data) or by loading summarized data (at the expense of loading detailed data). Dramatic size reduction can be achieved by removing high cardinality columns (especially text columns) which do not store or compress very efficiently.
- Model query performance can be improved by configuring single direction relationships unless there is a compelling reason to allow bi-directional filtering. Consider also using the [CROSSFILTER](/dax/crossfilter-function) function instead of bi-directional filtering.
- Aggregation tables can achieve fast query responses by loading pre-summarized data, however this will increase the size of the model and result in longer refresh times. Generally, aggregation tables should be reserved for very large models or Composite model designs.
- Calculated tables and columns increase the model size and result in longer refresh times. Generally, a smaller storage size and faster refresh time can be achieved when the data is materialized or calculated in the datasource. If this is not possible, using Power Query custom columns can offer improved storage compression.
- There may be opportunity to tune DAX expressions for measures and RLS rules, perhaps rewriting logic to avoid expensive formulas
- Incremental refresh can dramatically reduce refresh time and conserve memory and CPU. The incremental refresh can also be configured to remove historic data keeping model sizes trim.
- A model could be redesigned as two models when there are different and conflicting query patterns. For example, some reports present high-level aggregates over all history, and can tolerate 24 hours' latency. Other reports are concerned with today's data and need granular access to individual transactions. Rather than design a single model to satisfy all reports, create two models optimized for each requirement.

Consider the optimization possibilities for a DirectQuery model. As the model issues query requests to the underlying datasource, datasource optimization is critical to delivering responsive model queries.

 ![Optimization possibilities for a DirectQuery model](media/service-premium-capacity-optimize/direct-query-model-optimizations.png)

At the datasource layer:

- The datasource can be optimized to ensure the fastest possible querying by pre-integrating data (which is not possible at the model layer), applying appropriate indexes, defining table partitions, materializing summarized data (with indexed views), and minimizing the amount of calculation. The best experience is achieved when pass-through queries need only filter and perform inner joins between indexed tables or views.
- Ensure that gateways have enough resources, preferably on dedicated machines, with sufficient network bandwidth and in close proximity to the datasource.

At the model layer:

- Power Query query designs should preferably apply no transformations - otherwise attempt to keep transformations to an absolute minimum.
- Model query performance can be improved by configuring single direction relationships unless there is a compelling reason to allow bi-directional filtering. Also, model relationships should be configured to assume referential integrity is enforced (when this is the case) and will result in datasource queries using more efficient inner joins (instead of outer joins).
- Avoid creating Power Query query custom columns or model calculated column - materialize these in the datasource, when possible.
- There may be opportunity to tune DAX expressions for measures and RLS rules, perhaps rewriting logic to avoid expensive formulas.

Consider the optimization possibilities for a Composite model. Recall that a Composite model enables a mix of import and DirectQuery tables.

![Optimization possibilities for a composite model](media/service-premium-capacity-optimize/composite-model-optimizations.png)

- Generally, the optimization for Import and DirectQuery models apply to Composite model tables that use these storage modes.
- Typically, strive to achieve a balanced design by configuring dimension-type tables (representing business entities) as Dual storage mode and fact-type tables (often large tables, representing operational facts) as DirectQuery storage mode. Dual storage mode means both Import and DirectQuery storage modes, and this allows the Power BI service to determine the most efficient storage mode to use when generating a native query for pass-through.
- Ensure that gateways have enough resources, preferably on dedicated machines, with sufficient network bandwidth and in close proximity to the data sources
- Aggregations tables configured as Import storage mode can deliver dramatic query performance enhancements when used to summarize DirectQuery storage mode fact-type tables. In this case, aggregation tables will increase the size of the model and increase refresh time, and often this is an acceptable tradeoff for faster queries.

### Optimizing externally hosted models

Many optimization possibilities discussed in the [Optimizing Power BI hosted models](#optimizing-power-bi-hosted-models) section apply also to models developed with Azure Analysis Services and SQL Server Analysis Services. Clear exceptions are certain features which are not currently supported, including Composite models and aggregation tables.

An additional consideration for externally-hosted datasets is the database hosting in relation to the Power BI service. For Azure Analysis Services, this means creating the Azure resource in the same region as the Power BI tenant (home region). For SQL Server Analysis Services, for IaaS, this means hosting the VM in the same region, and for on-premises, it means ensuring an efficient gateway setup.

As an aside, it may be of interest to note that Azure Analysis Services databases and SQL Server Analysis Services tabular databases require that their models be loaded fully into memory and that they remain there at all times to support querying. Like the Power BI service, there needs to be sufficient memory for refreshing if the model must remain online during the refresh. Unlike the Power BI service, there is no concept that models are automatically aged in and out of memory according to usage. Power BI Premium, therefore, offers a more efficient approach to maximize model querying with lower memory usage.

## Capacity planning

The size of a Premium capacity determines its available memory and processor resources and limits imposed on the capacity. The number of Premium capacities is also a consideration, as creating multiple Premium capacities can help isolate workloads from each other. Note that storage is 100 TB per capacity node, and this is likely to be more than sufficient for any workload.

Determining the size and number of Premium capacities can be challenging, especially for the initial capacities you create. The first step when capacity sizing is to understand the average workload representing expected day-to-day usage. It's important to understand that not all workloads are equal. For example - at one end of a spectrum - 100 concurrent users accessing a single report page that contains a single visual is easily achievable. Yet - at the other end of the spectrum - 100 concurrent users accessing 100 different reports, each with 100 visuals on the report page, is going to make very different demands of capacity resources.

Capacity Admins will therefore need to consider many factors specific to your environment, content and expected usage. The overriding objective is to maximize capacity utilization while delivering consistent query times, acceptable wait times, and eviction rates. Factors for consideration can include:

- **Model size and data characteristics** - Import models must be fully loaded into memory to allow querying or refreshing. LC/DQ datasets can require significant processor time and possibly significant memory to evaluate complex measures or RLS rules. Memory and processor size, and LC/DQ query throughput are constrained by the capacity size.
- **Concurrent active models** - The concurrent querying of different import models will deliver best responsiveness and performance when they remain in memory. There should be sufficient memory to host all heavily-queried models, with additional memory to allow for their refresh.
- **Import model refresh** - The refresh type (full or incremental), duration and complexity of Power Query queries and calculated table/column logic can impact on memory and especially processor usage. Concurrent refreshes are constrained by the capacity size (1.5 x backend v-cores, rounded up).
- **Concurrent queries** - Many concurrent queries can result in unresponsive reports when processor or LC/DQ connections exceeds the capacity limit. This is especially the case for report pages that include many visuals.
- **Dataflows and paginated reports** - The capacity can be configured to support dataflows and paginated reports, with each requiring a configurable maximum percentage of capacity memory. Memory is dynamically allocated to dataflows, but is statically allocated to paginated reports.

In addition to these factors, Capacity Admins can consider creating multiple capacities. Multiple capacities allow for the isolation of workloads and can be configured to ensure priority workloads have guaranteed resources. For example, two capacities can be created to separate business-critical workloads from self-service BI (SSBI) workloads. The business-critical capacity can be used to isolate large corporate models providing them with guaranteed resources, with authoring access granted only to the IT department. The SSBI capacity can be used to host a growing number of smaller models, with access granted to business analysts. The SSBI capacity may at times experience query or refresh waits that are tolerable.

Over time, Capacity Admins can balance workspaces across capacities by moving content between workspaces, or workspaces between capacities, and by scaling capacities up or down. Generally, to host larger models you scale-up and for higher concurrency you scale out.

Recall that purchasing a license provides the tenant with v-cores. The purchase of a **P3** subscription can be used to create one, or up to four Premium capacities, i.e. 1 x P3, or 2 x P2, or 4 x P1. Also, before upsizing a P2 capacity to a P3 capacity, consideration can be given to splitting the v-cores to create two P1 capacities.

## Testing approaches

Once a capacity size is decided, testing can be performed by creating a controlled environment. A practical and economic option is to create an Azure (A SKUs) capacity, noting that a P1 capacity is the same size as an A4 capacity, with the P2 and P3 capacities the same size as the A5 and A6 capacities, respectively. Azure capacities can be created quickly and are billed on an hourly basis. So, once testing is complete, they can be easily deleted to stop accruing costs.

The test content can be added to the workspaces created on the Azure capacity, and then as a single user can run reports to generate a realistic and representative workload of queries. If there are import models, a refresh for each model should be performed also. Monitoring tools can then be used to review all metrics to understand resource utilization.

It's important that the tests are repeatable. Tests should be run several times and they should deliver approximately the same result each time. An average of these results can be used to extrapolate and estimate a workload under true production conditions.

If you already have a capacity and the reports you want to load test for, use the [PowerShell load generating tool](https://aka.ms/PowerBILoadTestingTool) to quickly generate a load test. The tool enables you to estimate how many instances of each report your capacity can run in an hour. You can use the tool to evaluate your capacity's ability for individual report rendering or for rendering several different reports in parallel. For more information, see the video [Microsoft Power BI: Premium capacity](https://www.youtube.com/watch?time_continue=1860&v=C6vk6wk9dcw).

To generate a more complex test, consider developing a load testing application that simulates a realistic workload. For more information, see the webinar [Load Testing Power BI Applications with Visual Studio Load Test](https://powerbi.microsoft.com/blog/week-4-11-webinars-load-testing-power-bi-applications-with-visual-studio-load-test-and-getting-started-with-cds-for-apps-based-model-driven-apps/).

## Acknowledgments

This article was written by Peter Myers, Data Platform MVP and independent BI expert with [Bitwise Solutions](https://www.bitwisesolutions.com.au/).

## Next steps

> [!div class="nextstepaction"]
> [Premium capacity scenarios](service-premium-capacity-scenarios.md)   
  
More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

Power BI has introduced Power BI Premium Gen2 as a preview offering, which improves the Power BI Premium experience with improvements in the following:
* Performance
* Per-user licensing
* Greater scale
* Improved metrics
* Autoscaling
* Reduced management overhead

For more information about Power BI Premium Gen2, see [Power BI Premium Generation 2 (preview)](service-premium-what-is.md#power-bi-premium-generation-2-preview).