---
title: Understanding and optimizing dataflows refresh
description: How to use and optimize refreshes for dataflows in Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 10/18/2021
LocalizationGroup: Data from files
---
# Understanding and optimizing dataflows refresh

Power BI dataflows enable you to connect to, transform, combine, and distribute data for downstream analytics. A key element in dataflows is the refresh process, which applies the transformation steps you authored in the dataflows and updates the data in the artifacts themselves. 

To understand run times, performance, and whether you're getting the most out of your dataflow, you can download the refresh history after a dataflow has been refreshed.

## Understanding refreshes

There are two types of refreshes applicable to dataflows:

* **Full**, which performs a complete flush and reload of your data.

* **Incremental (Premium only)**, which processes a subset of your data based on time-based rules, expressed as a filter, that you configure. The filter on the date column is used to dynamically partition the data into ranges in the Power BI service. After incremental refresh is configured, the dataflow automatically alters your query to include filtering by date. You can edit the automatically generated query by using the **Advanced Editor** in Power Query to fine-tune or customize your refresh. If you bring your own Azure Data Lake Storage, you can see time slices of your data based on the refresh policy you've set.

    > [!NOTE]
    > You can read more about [incremental refresh](/power-query/dataflows/incremental-refresh) and how it works.
    
Incremental refresh enables large dataflows in Power BI with the following benefits:

* Refreshes are faster after the first refresh, due to the following facts:

    * Power BI will refresh the last *N* partitions specified by the user (where partition is day/week/month, and so on), or:
    * Power BI will refresh only data that needs to be refreshed. For example, refreshing only the last five days of a 10-year dataset.
    * Power BI will only refresh only data that has changed, as long as you have specified the column to be checked for the change.

* Refreshes are more reliable - it's no longer necessary to maintain long-running connections to volatile source systems.
* Resource consumption is reduced - less data to refresh reduces overall consumption of memory and other resources.
* Wherever possible, Power BI employs parallel processing on partitions, which can lead to faster refreshes too.

In any of these refresh scenarios, if a refresh fails the data is not updated, which means that your data might be stale until the latest refresh completes, or you refresh it manually and it completes without error. Refresh occurs at a partition or entity, so if an incremental refresh fails, or an entity has an error, then the entire refresh transaction will not occur. Said another way, if a partition (incremental refresh policy) or entity fails for a particular dataflow, the entire refresh operation is set to fail, and no data gets updated.

## Understanding and optimizing refreshes

To better understand how a dataflow refresh operation performs, review the **Refresh History** for the dataflow by navigating to **Dataflow > Settings > Refresh History**. You can also select the dataflow in the **Workspace  > context menu (…) > Refresh History**.

:::image type="content" source="media/dataflows-understand-optimize-refresh/dataflows-understand-optimize-refresh-01.png" alt-text="Screenshot of dataflows refresh history.":::

The **Refresh History** provides an overview of refreshes, including the type – *on demand* or *scheduled*, the duration, and the run status. To see details in the form of a CSV file, select the download icon on the far right of the refresh description's row. The downloaded CSV includes the attributes described in the following table. Premium refreshes provide more information based on the additional compute and dataflows capabilities, versus Pro based dataflows that reside on shared capacity. As such, some of the following metrics are available only in Premium.



| Item | Description | Pro | Premium |
| --- | --- | --- | --- |
| Requested on | Time refresh was scheduled or refresh now was clicked, in local time | ✔ | ✔ |
| Dataflow name | Name of your Dataflow | ✔ | ✔ |
| Dataflow refresh status | Completed, Failed, Skipped (for an entity) are possible statuses. Use cases like Linked Entities are reasons why one might see skipped. | ✔ | ✔ |
| Entity name | Table name | ✔ | ✔ |
| Partition name | This is dependent on if the dataflow is premium or not, and if Pro will show as NA because it does not support incremental refreshes. Premium will show either FullRefreshPolicyPartition or IncrementalRefreshPolicyPartition-[DateRange] |  | ✔ |
| Refresh status | Refresh status of the individual entity or partition, which provides status for that time slice of data being refreshed. | ✔ | ✔ |
| Start time | In Premium, this is the time the dataflow was queued up to be processed for the entity or partition. This can differ if dataflows have dependencies and need to wait for the result set of an upstream dataflow to begin processing. | ✔ | ✔ |
| End time | This is the time the dataflow entity or partition completed, if applicable. | ✔ | ✔ |
| Duration | Total elapsed time for the dataflow to refresh expressed in HH:MM:SS | ✔ | ✔ |
| Rows processed | For a given entity or partition, # of rows scanned or written by the dataflows engine. This may not always contain data based on the operation you performed, such as when the Compute Engine is not used, or when using a gateway as the data is processed there. |  | ✔ |
| Bytes processed | For a given entity or partition, Data written by the dataflows engine, expressed in bytes.<br><br>Note, when using a gateway on this particular dataflow this information will not be provided. |  | ✔ |
| Max commit (KB) | Max Commit is the peak commit memory useful for diagnosing out-of-memory failures when the M query is not optimized.<br><br>When using a gateway on this particular dataflow, this information will not be provided. |  | ✔ |
| Processor Time | For a given entity or partition, Time, expressed in HH:MM:SS that the dataflows engine spent performing transformations.<br><br>When using a gateway on this particular dataflow, this information will not be provided. |  | ✔ |
| Wait time | For a given entity or partition, the time that an entity spent in wait status, based on workload on the Premium capacity. |  | ✔ |
| Compute engine | For a given entity or partition, Details on how the Compute Engine was used in the refresh operation. Values are the following:<br>- NA<br>- Folded<br>- Cached<br>- Cached + Folded<br><br>These elements are described in more detail later in this article. |  | ✔ |
| Error | If applicable, the detailed error message is described per entity or partition | ✔ | ✔ |

## Dataflow refresh guidance 

The refresh statistics provide valuable information you can use to optimize and speed up performance of your dataflows. In the following sections, we describe some scenarios, what to watch out for, and how to optimize based on the information provided.

### Orchestration

Using dataflows in the same workspace allows straightforward orchestration. If you have dataflows A, B and C in a single workspace, and chaining like A > B > C, then if you refresh the source (A), the downstream entities also get refreshed. However, if you refresh C, then you'll have to refresh others independently.

For scenarios where you want to chain items together that don't fit the managed orchestration Power BI performs, or if you want to mix and match, you can use the APIs and/or use PowerAutomate. You can refer to the [API documentation](/rest/api/power-bi/dataflows/getdataflowtransactions) and the [PowerShell script](https://github.com/microsoft/powerbi-powershell/tree/master/examples/dataflows) for programmatic refresh. There is a Power Automate connector that enables doing this without writing any code. You can see [detailed samples](/power-query/dataflows/dataflow-power-automate-connector-templates), with specific walk-throughs for [sequential refreshes](/power-query/dataflows/trigger-dataflows-and-power-bi-dataset-sequentially).

### Monitoring

Using the enhanced refresh statistics described earlier in this article, you can get detailed per-dataflow refresh information. But if you would like to see dataflows with tenant-wide or workspace-wide overview of refreshes, perhaps to build a monitoring dashboard, you can use [the APIs](/rest/api/power-bi/dataflows) or [PowerAutomate templates](/power-query/dataflows/dataflow-power-automate-connector-templates). Similarly, for use cases such as [sending simple or complex notifications](/power-query/dataflows/send-notification-when-dataflow-refresh-completes), you can use the PowerAutomate connector or build your own custom application using our APIs.

### Timeout Errors

Optimizing the time it takes to perform extract, transform, and load scenarios is ideal. In Power BI, the following cases apply:

* Some connectors have explicit timeout settings you can configure. Check out the [Power Query Connector Reference](/power-query/connectors/) for more information
* Power BI dataflows, using Power BI Pro, can also experience timeouts for long running queries within an entity or dataflows themselves. That limitation does not exist in Power BI Premium workspaces.

#### Timeout guidance

Timeout thresholds for Power BI Pro dataflows are the following:

* Two hours at the individual entity level
* Three hours at the entire dataflow level

For example, if you have a dataflow with three tables, no individual table can take more than two hours and the entire dataflow will time out if the duration exceeds three hours.

If you are experiencing timeouts, consider optimizing your dataflow queries, and consider using [query folding](/power-query/power-query-folding) on your source systems.

Separately, consider upgrading to Premium Per User, which is not subject to these time-outs and offers increased performance due to many [Power BI Premium Per User features](../../admin/service-premium-per-user-faq.yml).

### Long durations

Complex or large dataflows can take more time to refresh, as can poorly optimized dataflows. The following sections provide guidance on how to mitigate long refresh durations.

#### Guidance for long refresh durations

[Dataflows best practices](dataflows-best-practices.md)

The first step to improve long refresh durations for dataflows is to build dataflows according to our [best practices](dataflows-best-practices.md). Notable patterns include the following:

* Use [linked entities](/power-query/dataflows/linked-entities) for data that can be used later in other transformations
* [Use computed entities](/power-query/dataflows/computed-entities-scenarios) to cache data, reducing data loading and data ingestion burden on source systems
* Split data into [staging dataflows](/power-query/dataflows/best-practices-for-data-warehouse-using-dataflows#staging-dataflows) and [transformation dataflows](/power-query/dataflows/best-practices-for-data-warehouse-using-dataflows#transformation-dataflows), separating the ETL (extract, transform, load) into different dataflows
* [Optimize expanding table operations](/power-query/optimize-expanding-table-columns)
* Follow [guidance for complex dataflows](/power-query/dataflows/best-practices-developing-complex-dataflows)

Next, it can help to evaluate whether you can use incremental refresh.

Using [incremental refresh](../../connect-data/incremental-refresh-overview.md) can improve performance. It's important that the partition filters are pushed to the source system when queries are submitted for refresh operations. To push filtering down means the data source should support query folding, or you can express business logic through a function or other means that can help Power Query eliminate and filter files or folders. Most data sources that support SQL queries support query folding, and some OData feeds can also support filtering. 

However, data sources like flat files, blobs, and APIs typically do not support filtering. In cases where the filter is not supported by the data source back-end, it cannot be pushed down. In such cases, the mash-up engine compensates and applies the filter locally, which may require retrieving the full dataset from the data source. This can cause incremental refresh to be very slow, and the process can run out of resources either in the Power BI service or in the on-premises data gateway, if used.

Given the various levels of query folding support for each data source, it's recommended that verification is performed to ensure the filter logic is included in the source queries. To make this easier, Power BI attempts to perform this verification for you, with [step folding indicators for Power Query Online](https://powerbi.microsoft.com/blog/step-folding-indicators-for-power-query-online/). Many of these optimizations are design-time experiences, but after a refresh occurs, you have an opportunity to analyze and optimize your refresh performance.

Finally, consider optimizing your environment. You can optimize the Power BI environment by scaling up your capacity, right-sizing data gateways, and reducing network latency with the following optimizations:

* When using capacities available with Power BI Premium or Premium Per User, you can increase performance by increasing your Premium instance, or assigning the content to a different capacity.

* A gateway is required whenever Power BI needs to access data that isn't available directly over the Internet. You can install the [on-premises data gateway](../../connect-data/service-gateway-onprem.md) on an on-premises server, or on a virtual machine.
      * To understand gateway workloads and sizing recommendations, see [on-premises data gateway sizing](../../guidance/gateway-onprem-sizing.md).
      * Also evaluate bringing the data first into a staging dataflow, and referencing it downstream using linked and computed entities.

* Network latency can impact refresh performance by increasing the time required for requests to reach the Power BI service, and for responses to be delivered. Tenants in Power BI are assigned to a specific region. To determine where your tenant is located, see [where is my Power BI tenant located?](../../admin/service-admin-where-is-my-tenant-located.md). When users from a tenant access the Power BI service, their requests always route to that region. As requests reach the Power BI service, the service may then send extra requests, for example, to the underlying data source, or a data gateway—which are also subject to network latency.
    * Tools such as [Azure Speed Test](https://azurespeedtest.azurewebsites.net/) provide an indication of network latency between the client and the Azure region. In general, to minimize the impact of network latency, strive to keep data sources, gateways, and your Power BI cluster as close as possible. Residing in the same region is preferable. If network latency is an issue, try locating gateways and data sources closer to your Power BI cluster by placing them inside cloud-hosted virtual machines.

### High Processor Time

If you see high processor time, you likely have expensive transformations that aren't being folded, either because of the number of applied steps you have, or the type of transformations you're making, each of which can result in higher refresh times.

#### Guidance for high processor time

There are two options for optimizing high processor time.

First, use query folding within the data source itself, which should reduce the load on the dataflow Compute Engine directly. Query folding within the data source allows the source system to do most of the work, allowing the dataflow to pass through queries in the native language of the source, rather than having to perform all the computations in memory after the initial query.

Not all data sources can perform query folding, and even when query folding is possible there may be dataflows that perform certain transformations that cannot fold to the source. In such cases, the [enhanced Compute Engine](./dataflows-premium-workload-configuration.md#guidance-for-common-scenarios) is a capability introduced by Power BI to potentially improve performance by up to 25 times, for transformations specifically.

### Using the Compute Engine to maximize performance

While Power Query has design-time visibility into query folding, the Compute Engine column provides details about whether the internal engine itself is used. The Compute Engine is helpful when you have a complex dataflow and you're performing transformations in memory. This is where the enhanced refresh statistics can be helpful, since the Compute Engine column provides details about whether or not the engine itself was used.

The following sections provide guidance about using the Compute Engine, and its statistics.

#### Guidance on Compute Engine Statuses

Turning on the Enhanced Compute Engine and understanding the various statuses is helpful. Internally, the enhanced Compute Engine uses a SQL database to read and store data. It's best to have your transformations execute against the query engine here. The paragraphs below provide various situations, and guidance about what to do for each.

**NA** - This status means that the Compute Engine was not used, either because: you are using Power BI Pro dataflows; you have it explicitly turned off; you are using query folding on the data source; or you are performing complex transformations that cannot make use of the SQL engine used to speed up queries.

If you're experiencing long durations and still get a status of **NA**, make sure that it is [turned on](dataflows-premium-workload-configuration.md) and not accidentally turned off. One recommended pattern is to use [staging dataflows to initially get your data into the Power BI service, then build dataflows on top of this data, once it is in a staging dataflow](/power-query/dataflows/best-practices-developing-complex-dataflows#split-data-transformation-dataflows-from-stagingextraction-dataflows). That pattern can reduce load on source systems and, together with the Compute Engine, provide a speed boost for transformations and improve performance.

**Cached** - If you see **cached** status, the dataflow data was stored in the Compute Engine and available to be referenced as part of another query. This is ideal if you're using it as a Linked Entity, because that data is cached for use downstream and doesn't need to be refreshed multiple times in the same dataflow. This is also potentially ideal if you want to use it for DirectQuery.

When cached, the performance impact on initial ingestion will pay off later, in the same dataflow or different dataflow in same workspace.

If you have a large duration for the entity, consider turning off the Compute Engine. To cache the entity, Power BI writes it to storage and to SQL. If it's a single-use entity, the performance benefit for users may not be worth the penalty of the double-ingestion.

**Folded** - Folded means that the dataflow was able to use SQL Compute to read data. The calculated entity used the table from SQL to read data, and the SQL used is related to the constructs of their query.

Folded status appears if, when you're using on-premises or cloud data sources, you first loaded data into a staging dataflow and referenced that in this dataflow. This status applies only to entities that reference another entity. It means your queries were run on top of the SQL engine, and thus have the potential to be improved with SQL compute. To ensure your transformations are processed by the SQL engine, use transformations that support SQL folding, such as merge (join), group by (aggregation), and append (union) actions in the Query Editor.

**Cached + Folded** - When you see **cached + folded**, it's likely that the data refresh has been optimized, as you have an entity that both references another entity and is referred to by another entity upstream. This will also run on top of the SQL and, as such, also has the potential to be improved with SQL compute. To be sure you're getting the best performance possible, use transformations that support SQL folding, like merge (join), group by (aggregation), and append (union) actions in the Query Editor.

### Guidance for Compute Engine performance optimization

The following steps will enable workloads to trigger the Compute Engine, and thereby, always improve performance:

**Computed and Linked Entities in the same workspace:**

For *ingestion*, focus on getting the data into the storage as fast as possible, using filters only if they reduce the overall dataset size. Keep your transformation logic separate from this step. Next, separate your transformation and business logic into a separate dataflow in the same workspace, using linked or computed entities; doing so allows for the engine to activate and accelerate your computations. For a simple analogy, it's like food preparation in a kitchen: food preparation is typically a separate and distinct step from gathering your raw ingredients, and a pre-requisite for putting the food in the oven. Similarly, your logic needs to be prepared separately before it can take advantage of the Compute Engine.

Ensure you perform the operations that fold, such as merges, joins, conversion, and [others](/power-query/power-query-folding#transformations-that-can-achieve-folding).

Also, build dataflows [within published guidelines and limitations](dataflows-features-limitations.md#dataflows-in-premium).

**When the Compute engine is on, but performance is slow:**

Take the following steps when investigating scenarios where the Compute Engine is on, but you're seeing poor performance:

* Limit computed and linked entities that exist across the workspace.
* If your initial refresh is performed with the Compute Engine turned on, data gets written in the lake *and* in the cache. This double-write results in refreshes being slower.
* If you have a dataflow linking to multiple dataflows, make sure you schedule refreshes of the source dataflows so that they don't all refresh at the same time.

## Considerations and limitations

When using a Power BI Pro license, dataflows refreshes are limited to 8 refreshes per day.

## Next steps

* [Using incremental refresh with dataflows](/power-query/dataflows/incremental-refresh)
* [Incremental refresh for datasets](../../connect-data/incremental-refresh-overview.md)
* [Troubleshooting refresh scenarios](../..//connect-data/refresh-troubleshooting-refresh-scenarios.md)
* [Dataflows best practices](dataflows-best-practices.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [Dataflows Limitations, restrictions and supported connectors and features](dataflows-features-limitations.md)
* [Troubleshooting refresh scenarios](../../connect-data/refresh-troubleshooting-refresh-scenarios.md)