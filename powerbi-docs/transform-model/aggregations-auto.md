---
title: Automatic aggregations 
description: This article describes using automatic aggregations to optimize query performance.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 06/28/2021
LocalizationGroup: Transform and shape data
---
# Automatic aggregations (preview)

Automatic aggregations for DirectQuery datasets uses state-of-the-art machine learning (ML) to self train and continuously optimize an in-memory cache with pre-aggregated query results, providing faster report visualization response times for even the largest datasets.

With automatic aggregations:

- Big data is not so big - By using MLs predictive modeling, report query patterns are analyzed to determine pre-defined aggregations to store in the dataset in-memory cache. The amount of pre-aggregated data stored in-memory is typically small, but can answer the majority of report queries.
- Report visualizations are faster - An optimal percentage of report queries are returned by the in-memory cache instead of backend data source systems. Outlier queries that cannot be returned by the in-memory cache are passed directly to the data source using DirectQuery.
- Optimized dataset refresh - The in-memory cache stores only aggregated results. The number of rows stored is only a tiny fraction of import mode in-memory tables. With such a small amount of data kept in-memory, dataset refresh usually takes only a short amount of time.
- Balanced architectures - Because most query results are returned by the Power BI query engine and in-memory aggregations cache, query processing load on data source systems at peak reporting times is significantly reduced.
- Easy setup - Enable automatic aggregations and schedule one or more refreshes for the dataset - that's all it takes. With the first refresh, automatic aggregations takes over and begins creating the aggregations framework and optimal aggregations. The system automatically tunes itself over time, though with a single slide bar control you can easily fine-tune for your environment if needed.

## Optimized query response

When using DirectQuery, latency, especially over very large datasets can significantly reduce query response times. Each time a dataset user opens a report or interacts with visualization, DAX queries are passed to the query engine and then on to the backend data source as SQL queries. The data source must then calculate and return aggregated results for each query. That round trip can be both time and process intensive, often causing slow query response times in report visualizations.

When enabled for a dataset, automatic aggregations use machine learning (ML) predictive modeling algorithms to determine client reporting query patterns. Because almost all report queries calculate an aggregated result, an optimal percentage of those aggregations are then cached in-memory. Aggregated query results are then returned by the in-memory cache rather than being sent to and returned by the data source. Queries that require aggregations that are not included in the in-memory cache are passed to the backend data source, just like with typical DirectQuery.

:::image type="content" source="media/aggregations-automatic/auto-aggregations.png" border="false" alt-text="Automatic aggregations diagram":::

Automatic aggregations predictive modeling continuously runs in the background. Your dataset is both self training and self optimizing. As client report query patterns change, automatic aggregations adjusts, prioritizing and caching those aggregations used most often.

## Requirements

### Supported plans

Automatic aggregations is supported for **Power BI Premium** and **Premium per user** datasets.

### Supported data sources

During preview, automatic aggregations is supported for the following data sources:

- Azure SQL Database
- Azure Synapse Dedicated SQL pool
- Google Cloud BigQuery
- Snowflake

### Supported modes

Automatic aggregations are supported for DirectQuery mode datasets. Composite models with both import tables and DirectQuery connections are supported, however automatic aggregations are supported for the DirectQuery connection only.

### Permissions

To enable and configure automatic aggregations, you must have **Admin** permissions for the dataset. Data source credentials must be configured and signed in (in dataset settings) before automatic aggregations can be enabled.

## Under the hood

### Query analysis

When automatic aggregations is enabled for a dataset, queries passed from reporting clients to the query engine are analyzed. Query pattern telemetry is identified and stored. This query pattern telemetry is then used by the ML training algorithm.

### Training

When configuring automatic aggregations, you specify one or more refresh operations by frequency: Day, Week, or Month. The first scheduled refresh operation for the frequency you choose first instantiates a *training* operation. The training operation uses ML predictive analytics to analyze the query telemetry to determine the tables and columns necessary to create aggregations for those queries. Query patterns are ranked based on frequency. Cardinality estimation queries are sent to the data source to determine the row count for tables that will either be created, retained, or dropped from the in-memory cache. Tables, columns, and rows in the in-memory cache are created for the aggregations during the training process but are not populated with data. The subsequent refresh operation then populates the aggregations with data.

The training operation has a time limit of 60 minutes. Subsequent refreshes are refresh only operations. For example, if you choose a **Day** frequency and schedule refreshes at 4:00AM, 9:00AM, 2:00PM, and 7:00PM, the 4:00AM refresh each day will include both a training operation *and* a refresh operation. The 9:00AM, 2:00PM, and 7:00PM scheduled refreshes will be refresh operations only.

For example, if the percentage of cached queries is set to 85%, and query analysis determines 100 report queries are passed to the query engine, then 85 of those queries, based on rank are pre-aggregated and included in the in-memory aggregations cache. Rank is determine by a number of factors including how many times over the training frequency period the query is being passed to the query engine, cardinality, and so on. Queries excluded from the in-memory aggregations cache tend to be ad-hoc queries, or queries that cannot be pre-aggregated such as those that transit many-to-many relationships. 

Tables created contain rows of aggregated data at a higher level of granularity than the data source tables they're derived from. For example, a backend data source with a traditional star schema data warehouse has a Sales fact or *detail* table with tens of millions of rows of sales transaction data. The Sales table has relationships with Date, Product Subcategory, and Customer tables, and those tables have relationships with other tables such as Product, Product Category, and Geography. During training, aggregations tables are automatically created and contain only those rows summarized by an aggregation such as GroupBy, Sum, Count. Queries can transit many-to-one and one-to-many relationships to define the aggregations to be included in the aggregations table. Automatic aggregations, however, cannot transit many-to-many relationships. For those queries that cannot be calculated from the in-memory aggregations tables are passed to the data source using DirectQuery.

### Refresh

Because aggregations are stored in-memory, it's necessary to refresh the dataset to keep the aggregations stored in the in-memory cache in sync with the data source. When you first enable automatic aggregations, you must configure at least one refresh operation either daily or weekly. When scheduling refresh in dataset settings, you can configure up to 48 refreshes each day, however dataset refreshes through the XMLA endpoint are unlimited. 

:::image type="content" source="media/aggregations-automatic/auto-aggs-refresh.png" alt-text="Configure refresh for automatic aggregations":::

The first refresh for the frequency you choose (Day, Week) includes the training process that builds, retains, or drops table and column objects from the in-memory cache. All subsequent refreshes that day or week update the aggregations only. For that first refresh, the training process allows up to 60 minutes to complete, in-memory tables to be created or dropped, columns and rows to be added. Aggregations data, however, is not loaded into the tables during training - it's loaded during the subsequent refresh operation.

The time you choose for your first scheduled refresh should be when the data source system is least active, and prior to users actively working with reports. For most organizations, this will be overnight or early in the morning, after any ETL or maintenance processes at the data source have completed. This will give the training process in the first refresh plenty of system resources to complete and ensure the refresh operations gets the most recent data source data. Be sure to schedule refreshes often enough so aggregations data stored in-memory most closely reflects that of real-time data at the data source. At the same time, you don't want to schedule so many refreshes that system resources are used unnecessarily.

If a refresh fails, it typically will be the first refresh that includes the training process, and it will likely be the training operation exceeded the 60 minute time limit. 

A single refresh operation has a total time allowed limit of 5 hours, however, because aggregations tables are typically quite small compared to normal import tables, it's unlikely a refresh operation will exceed the time limit. The exception could be composite model datasets. If your dataset is already a composite model, and large tables are stored in-memory, refresh on those tables could take longer.

#### Cache refresh history

Each refresh operation is recorded in the dataset cache refresh history.

:::image type="content" source="media/aggregations-automatic/cache-refresh-history.png" alt-text="":::

Refresh history provides information about how scheduled training and refresh operations are going. Because the first scheduled refresh of the day or week includes the training operation, additional details about how much memory new aggregations are using in the in-memory cache are provided. If you want to drill down a little further, click **Show** details.

## Fine-tuning

The percentage of queries that will use aggregated caches setting determines the percentage of queries against the dataset that are included in training. This setting does not determine a percentage of all aggregations calculated to be stored in the in-memory cache. 

By default, when you first enable automatic aggregations, the percentage of queries that will use aggregated caches is 75%. Before adjusting the percentage, be sure to allow several iterations of the learning/refresh cycle to be completed. This gives the training algorithm time to evaluate report queries over a broader time period and self-adjust accordingly. For example, if you've scheduled refreshes for daily frequency, you might want to wait a full week.

### Adjusting the percentage

The setting determines the percentage of queries that use aggregations. It does not determine the percentage of total aggregations stored in-memory. Having a greater percentage means a greater number of queries from reports are ranked on frequency and therefore aggregations for them are included in the in-memory aggregations cache. While adjusting to a higher percentage can mean more queries are answered from the in-memory aggregations cache, it can also mean longer training and refresh times. Adjusting to a lower percentage can mean shorter training and refresh times, but report visualization performance could be diminished because more queries would not be answered by the in-memory aggregations cache, but instead have to be passed to the data source by using DirectQuery.

For example, a setting of 95% will cache nearly all queries detected. More queries will hit the cache rather than the data source, possibly resulting in faster results. However, if the percentage of aggregations cached setting is too high, the balance tips, and learning and refresh processes could take longer, possibly exceeding time limits causing the learning process to fail.

#### Query performance impact lift chart

The **Query performance impact** lift chart provides an estimation of the percentage of queries as a function of query run times. 

:::image type="content" source="media/aggregations-automatic/lift-chart.png" alt-text="Lift chart":::

**DirectQuery** - 

**Current query percentage** - 

**New query percentage** - 


##### Set target to seconds

Threshold appears as a marker line on the lift chart. Use the threshold setting to define a target query response time for reports. For example, by setting threshold to 10 seconds, you can then fine-tune to determine a new query percentage that meets the 10 second threshold. 

#### Aggregation tables bar chart

During training, automatic aggregations creates, alters, and deletes tables in the in-memory cache depending on the historical query patterns. These tables are not visible to report users.

:::image type="content" source="media/aggregations-automatic/tables-chart.png" alt-text="Aggregation tables bar chart":::

#### Average row count bar chart

:::image type="content" source="media/aggregations-automatic/row-count-chart.png" alt-text="Average row count bar chart":::

### User defined aggregations

Automatic aggregations is built on top of existing [user defined aggregations](aggregations-advanced.md) functionality first introduced with composite models for Power BI. Automatic aggregations can work side-by-side with user defined aggregations. Aggregations created in the in-memory cache by the automatic aggregations training algorithm are identified as *System* aggregations. The training algorithm creates and deletes only those System aggregations as reporting queries are analyzed and adjustments are made to maintain the optimal aggregations for the dataset.

Both aggregations created by using automatic aggregations and user defined aggregations are refreshed with dataset refresh. Only those aggregations created by automatic aggregations and marked as *System* are included in the training process, which can be removed from cached aggregations.

There is no process in the automatic aggregations feature that can exclude similar existing user defined aggregations from being included in the automatic aggregations training. Some aggregations can potentially be included both in the automatic aggregation in-memory cache and in the user defined aggregations.  


## See also

[DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)

