---
title: Automatic aggregations 
description: This article describes using automatic aggregations to optimize query performance.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 06/04/2021
LocalizationGroup: Transform and shape data
---
# Automatic aggregations (preview)

Automatic aggregations for DirectQuery datasets uses state-of-the-art machine learning (ML) to self train and continuously optimize an in-memory cache with pre-aggregated query results, providing faster report visualization response times for even the largest datasets.

With automatic aggregations:

- Big data is not so big - By using MLs predictive modeling, report query patterns are analyzed to determine pre-defined aggregations to store in the dataset in-memory cache. The amount of pre-aggregated data stored in-memory is small, but can answer the majority of report queries.
- Report visualizations are faster - An optimal percentage of report queries are returned by the in-memory cache instead of backend data source systems. Outlier queries that cannot be returned by the in-memory cache are passed directly to the data source using DirectQuery.
- Optimized dataset refresh - The in-memory cache stores only aggregated results. The number of rows stored is only a tiny fraction of import mode in-memory tables. With such a small amount of data kept in-memory, dataset refresh takes only a short amount of time.
- Balanced architectures - Because most query results are returned by the Power BI query engine and in-memory aggregations cache, query processing load on data source systems at peak reporting times is significantly reduced.
- Easy setup - Enable automatic aggregations and schedule one or more refreshes for the dataset - that's all it takes. With the first refresh, automatic aggregations takes over and begins creating the aggregations framework and optimal aggregations. The system automatically tunes itself over time, though with a single slide bar control you can easily fine-tune for your environment if needed.

## Optimized query response

When using DirectQuery, latency, especially over very large datasets can often significantly reduce query response times. Each time a dataset user opens a report or interacts with visualization, DAX queries are passed to the query engine and then on to the backend data source as SQL queries. The data source must then calculate and return aggregated results for each query. That round trip can be both time and process intensive, often causing slow query response times in report visualizations.

When enabled for a dataset, automatic aggregations use machine learning (ML) predictive modeling algorithms to determine client reporting query patterns passed to the DirectQuery data source. Because almost all dataset reporting queries calculate an aggregated result, an optimal percentage of those aggregations are then cached in-memory. Aggregated query results are then returned by the cache rather than being sent to and returned by the data source. Queries that require aggregations that are not included in the cache are passed to the backend data source, just like with typical DirectQuery.

:::image type="content" source="media/aggregations-automatic/auto-aggregations.png" border="false" alt-text="Automatic aggregations diagram":::

Automatic aggregations predictive modeling continuously runs in the background. As users interact with reports, query patterns are identified. Those query patterns are then used to make predictions about aggregations that will answer those queries. Those aggregations are then cached in-memory. Your dataset is both self training and self optimizing. As client report query patterns change, automatic aggregations adjusts, prioritizing and caching those aggregations used most often.

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

To enable and configure automatic aggregations, you must have **Owner** permissions for the dataset. Data source credentials must be configured and signed in (in dataset settings) before automatic aggregations can be enabled.

## Under the hood

### Query analysis

When automatic aggregations is enabled for a dataset, the query workload for that dataset, which includes all DAX queries passed from clients to the query engine are analyzed. Query patterns for the workload define telemetry which is then stored securely in Azure Data Explorer.

### Training

When configuring automatic aggregations, you specify one or more refresh operations by frequency: Day, Week, or Month. The first scheduled refresh operation for the frequency you choose first instantiates a *training* operation. The training operation uses machine learning predictive analytics to analyze the query telemetry to determine the tables and columns necessary to create aggregations for those queries. Cardinality estimation queries are then sent to the data source to determine the row count for those tables. In-memory tables are then created, dropped, or retained. Query patterns for the workload are then ranked based on frequency. Aggregations are created during the training process but are not populated with data. The refresh operation then populates the aggregations with data.

During the training operation, the service creates a framework by analyzing the query workload.
sending cardinality estimation queries to the data source. These queries analyze the tables, columns, rows, and relationships at the data source to create one or more aggregation tables in-memory. 

The training operation has a time limit of 60 minutes. Subsequent refreshes are refresh only operations. For example, if we choose a Day frequency and schedule refreshes at 4:00AM, 9:00AM, 2:00PM, and 7:00PM, the 4:00AM refresh each day will include both a training operation and a refresh operation. The 9:00AM, 2:00PM, and 7:00PM scheduled refreshes will be refresh operations only. 

Percentage of cached queries defines the amount in of total queries for which aggregations will be calculated and stored in-memory.

For example, if the percentage of cached queries is set to 85%, and query analysis determines 100 report queries are passed to the query engine, then 85 of those queries, based on rank are pre-aggregated and included in the in-memory aggregations cache. Rank is determine by a number of factors including how many times over the training frequency period the query is being passed to the query engine, cardinality, and so on. Queries excluded from the in-memory aggregations cache tend to be ad-hoc queries, or queries that cannot be pre-aggregated such as those that transit many-to-many relationships. 

Tables created contain rows of aggregated data at a higher level of granularity than the data source tables they're derived from. For example, a backend data source with a traditional star schema data warehouse has a Sales fact or *detail* table with tens of millions of rows of sales transaction data. The Sales table has relationships with Date, Product Subcategory, and Customer tables, and those tables have relationships with other tables such as Product, Product Category, and Geography. During training, aggregations tables are automatically created and contain only those rows summarized by an aggregation such as GroupBy, Sum, Count. Queries can transit many-to-one and one-to-many relationships to define the aggregations to be included in the aggregations table. Automatic aggregations, however, cannot transit many-to-many relationships. For those queries that cannot be aggregated from the in-memory aggregations tables are passed to the data source using DirectQuery.




### Building a framework

Automatic aggregations is built on top of existing [user defined aggregations](aggregations-advanced.md) functionality first introduced with composite models for Power BI. Automatic aggregations can work side-by-side with user defined aggregations, however, unlike user defined aggregations, automatic aggregations can be enabled for DirectQuery datasets only.

Unlike traditional DirectQuery only datasets, a dataset with automatic aggregations enabled becomes a *composite model* dataset with one or more aggregation tables containing pre-defined aggregations stored in-memory, and a DirectQuery connection to the data source. 

The query engine processes those queries it can from the in-memory aggregations tables, and passes on those queries that can only be calculated and returned from the data source (DirectQuery).

Under the hood, automatic aggregations are identified as *System* aggregations. The automatic aggregations algorithm creates and removes only those System aggregations as reporting queries are analyzed and adjustments are made to maintain the optimal aggregations for the dataset. 

### Training


### Refresh

Because aggregations are stored in memory, it's necessary to refresh the dataset to keep the aggregations in sync with the data source. When you first enable automatic aggregations, you must configure at least one refresh operation either daily, weekly, or monthly. When scheduling refresh in dataset settings, you can configure up to 48 refreshes each day, week, or month. Dataset refreshes through the XMLA endpoint are unlimited.

:::image type="content" source="media/aggregations-automatic/auto-aggs-refresh.png" alt-text="Configure refresh for automatic aggregations":::

The first refresh for the frequency you choose (Day, Week, Month) includes the training process. All subsequent refreshes that day, week, or month update the aggregations only. For that first refresh, the training process allows up to 60 minutes to complete, in-memory tables to be created or dropped, columns and rows to be added. Aggregations data, however, is not loaded into the tables during training - it's loaded during the subsequent refresh operation.

The time you choose for your first scheduled refresh should be when the data source system is least active, and prior to users actively working with reports. For most organizations, this will be overnight or early in the morning, after any ETL or maintenance processes at the data source have completed. This will give the training process in the first refresh plenty of system resources to complete and ensure the refresh operations gets the most recent data source data. Be sure to schedule refreshes often enough so aggregations data stored in-memory most closely reflects that of real-time data at the data source. At the same time, you don't want to schedule so many refreshes that system resources are used unnecessarily.

If a refresh fails, it typically will be the first refresh that includes the training process, and it will likely be the training operatuion itseld exceeded the 60 minute time limit. 

A single refresh operation has a total time allowed limit of 5 hours, however, because aggregations tables are typically quite small compared to normal import tables, it's unlikely a refresh operation will even come close to the time limit. The exception could be composite model datasets. If your dataset is already a composite model, and large tables are stored in-memory, refresh on those tables could take longer.

#### Cache refresh history

Each refresh operation is recorded in the dataset cache refresh history.

:::image type="content" source="media/aggregations-automatic/cache-refresh-history.png" alt-text="":::

Refresh history provides information about how scheduled training and refresh operations are going. Because the first scheduled refresh of the day, week, or month includes the training operation, additional details about how much memory new aggregations are using in the in-memory cache are provided. If you want to drill down a little further, click Show details.

## Fine-tuning

By default, the amount of cached aggregations is 75%. A higher percentage means

The cache percentage setting determines the query coverage. Having a greater percentage means greater coverage and thus more aggregations created. While having more coverage is optimal for query performance, they also would mean longer training times. Having lesser coverage would help in this aspect, but would degrade performance as certain queries would have to hit the tables in the DirectQuery source. Finding the optimal setting requires an iterative process.

Before adjusting the percentage of cached aggregations, it's recommended several iterations of the learning/refresh cycle have completed. If you've scheduled refreshes for daily frequency, you might want to wait a full week. This gives the ML training algorithm time to evaluate report queries over a broader time period and adjust accordingly. 

After at least one refresh has completed, the **Visualize how changing the percent cached affects this workload**, the lift chart and bar charts provide visual representations of how changing the percentage can affect query response times.

The automatic aggregations feature is based on the queries against the dataset generated by Power BI reports. The self-learning model analyzes these queries to determine the optimal set of aggregations. This setting also determines the number of aggregations created and thus the storage consumed by them. Finding the optimal setting for your workload can take a few iterations. The default setting is 75%.

The cache percentage setting determines the query coverage. Having a greater percentage means greater coverage and thus more aggregations created. While having more coverage is optimal for query performance, it can also mean longer training times. Having lesser coverage would help in this aspect, but would degrade performance as certain queries would have to hit the tables in the DirectQuery source. Finding the optimal setting requires an iterative process.

For example, a setting of 95% will cache nearly all queries detected. More queries will hit the cache rather than the data source, possibly resulting in faster results. However, if the percentage of aggregations cached setting is too high, the balance tips, and learning and refresh processes could take longer, possibly exceeding time limits causing the learning process to fail.

If training fails, it could be because too high of percentage of report queries are being evaluated. Try lowering the percentage of 

#### Query performance impact lift chart

The Query Performance Impact lift chart provides an estimation of the percentile of queries as a function of query run times. Using this tool, users can get a directional sense of the query cache level that they must set to achieve their desired SLA and thus the desired performance.

**::Insert image**

##### Set threshold

Threshold appears as a marker line on the lift chart. Use the threshold setting to define a target query response time for reports. For example, by setting threshold to 10 seconds, you can then fine-tune the percentage of cached queries to determine a New cache query percentage that meets the 10 second threshold.

#### Aggregation tables bar chart

**::Insert image**

#### Average row count bar chart

**::Insert image**

### Scenarios

#### Scenario 1

#### Scenario 2

#### Scenario 3

## Configuring

Automatic aggregations are enabled in dataset settings, in **Optimize performance**. 

:::image type="content" source="media/aggregations-automatic/auto-aggs-not-enabled.png" alt-text="Automatic aggregations not enabled in dataset settings":::

Data source credentials must be configured and signed in before the Optimize performance settings are enabled.


:::image type="content" source="media/aggregations-automatic/auto-aggs-default.png" alt-text="Automatic aggregations settings":::

#### 1 - Enable

Enable automatic aggregations with the slider. Data source credentials must be configured and signed in before you can enable automatic aggregations.

#### 2 - Fine-tune 

This setting defines the percentage of workload report queries that are evaluated for aggregations to be included in the in-memory aggregations tables.

#### 3 - Visualize

After at least one Refresh operation has run, you can visualize how changing the percentage of cached queries can change query response times. We'll go into more detail later, in [Fine-tuning](#fine-tuning).

#### 4 - Refresh

You must specify at least one refresh. The limit is 48 refreshes per day. If your dataset is already composite, the same refresh operation refreshes all imported tables, including the aggregations tables.

#### 5 - Notifications

By default, the dataset owner will get e-mail notifications if a refresh fails. You can specify others to get notifications too. 


## See also

[DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)

