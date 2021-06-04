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
# Automatic aggregations

Automatic aggregations for DirectQuery datasets uses state-of-the-art machine learning (ML) to self train and continuously optimize an in-memory cache with pre-aggregated query results, providing faster report visualization response times for even the largest datasets.

With automatic aggregations:

- Big data is not so big - By using MLs predictive modeling, automatic aggregations analyses backend data sources and user reporting query patterns to determine pre-defined aggregations to store in the dataset in-memory cache. The amount of pre-aggregated data stored in-memory is small, but can answer the vast majority of report queries.
- Report visualizations are faster - An optimal percentage of reporting queries are returned by the in-memory cache instead of backend data source systems. Outlier queries that cannot be returned by the in-memory cache are passed directly to the data source.
- Optimized dataset refresh - The in-memory cache stores only aggregated results. The number of rows stored is only a tiny fraction of import mode in-memory tables. With such a small amount of data kept in-memory, dataset refresh takes only a short amount of time.
- Balanced architectures - Because most query results are returned by the Power BI query engine and in-memory aggregations cache, query processing load on data source systems at peak reporting times is significantly reduced.

## Optimized query response

When using DirectQuery, latency, especially over very large datasets can often significantly reduce query response times. Each time a dataset user opens a report or interacts with visualization, DAX queries are passed to the query engine and then on to the backend data source. The data source must then calculate and return aggregated results for each query. That round trip can be both time and process intensive, often causing slow query response times in report visualizations.

When enabled for a dataset, automatic aggregations use machine learning (ML) predictive modeling  algorithms to determine client reporting query patterns passed to the DirectQuery data source. Because almost all dataset reporting queries calculate an aggregated result, an optimal percentage of those aggregations are then cached in-memory. Aggregated query results are then returned by the cache rather than being sent to and returned by the data source.

:::image type="content" source="media/aggregations-automatic/auto-aggregations.png" border="false" alt-text="Automatic aggregations diagram":::

Automatic aggregations predictive modeling continuously runs in the background. As users interact with reports, query patterns are identified. Those query patterns are then used to make predictions about aggregations that will answer those queries. A percentage of those aggregations are then cached in-memory. Your dataset is both self training and self optimizing. As client report query patterns change, automatic aggregations adjusts, prioritizing and caching those aggregations used most often. Those queries that are not cached are passed to the backend data source, just like a typical DirectQuery query.

## Requirements

### Supported plans

Automatic aggregations is supported for **Power BI Premium** and **Premium per user** datasets.

### Supported data sources

During preview, automatic aggregations is supported for the following data sources:

- Azure Synapse Dedicated SQL pool
- Google Cloud BigQuery
- Snowflake

### Supported modes

Automatic aggregations are supported for DirectQuery mode datasets. Composite models with both import tables and DirectQuery connections are supported, however automatic aggregations are supported for the DirectQuery connection only.

### Permissions

To enable and configure automatic aggregations, you must have **Owner** permissions for the dataset. Data source credentials must be configured and signed in (in dataset settings) before automatic aggregations can be enabled.

## Under the hood

Unlike a traditional DirectQuery only dataset, a dataset with automatic aggregations enabled in effect becomes a *composite model* dataset with one or more tables containing import data stored in-memory, and a DirectQuery connection to the data source. The query engine processes those queries it can from the in-memory tables, and passes on those queries that can only be calculated and returned from the data source (DirectQuery).

### Training

In order to create an aggregations cache for the dataset, the service creates a framework by sending cardinality estimation queries to the data source. These queries analyze the tables, columns, rows, and relationships at the data source to create in-memory tables. which is then used to determine probable aggregations to be stored in the in-memory cache. 

As user reporting queries are sent to the query engine, the ML algorithm analyzes the queries to determine the optimal aggregations to be calculated and included in the caches tables. 

### Refresh

### User defined aggregations

Automatic aggregations can work side-by-side with [user defined aggregations](aggregations-advanced.md). Automatic aggregations are identified as *System* aggregations. The automatic aggregations algorithm drops and creates only those *system* aggregations as reporting queries are analyzed and adjustments are made to maintain the optimal aggregations for the dataset. 


#### Percentage of queries cached

The automatic aggregations feature is based on the queries against the dataset generated by Power BI reports. The self-learning model analyzes these queries to determine the optimal set of aggregations. This setting also determines the number of aggregations created and thus the storage consumed by them. Finding the optimal setting for your workload can take a few iterations. The default setting is 75%.

The cache percentage setting determines the query coverage. Having a greater percentage means greater coverage and thus more aggregations created. While having more coverage is optimal for query performance, they also would mean longer training times. Having lesser coverage would help in this aspect, but would degrade performance as certain queries would have to hit the tables in the DirectQuery source. Finding the optimal setting requires an iterative process.

The optimal percentage of queries cached setting is a function of the use-case and workload and will vary on a case-by-case basis. However, you can use the lift chart tool in the automatic aggregations settings page to get an estimation of the level that you should be at. Please note that the lift chart tool provides estimations and is only to be used as a guidance tool. 

For example, a setting of 95% will cache nearly all queries detected. More queries will hit the cache rather than the data source, possibly resulting in faster results. However, if the percentage of aggregations cached setting is too high, the balance tips, and learning and refresh processes could take an excessive amount of time, possibly exceeding time limits causing the learning process to fail.

### Refresh

Because the aggregations are stored in memory, just like with any other import table, it's necessary to refresh aggregations tables to keep them in sync with the data source. You specify either a daily or weekly refresh, and you can specify up to 48 refreshed per day. The first refresh includes the training process. All subsequent refreshes that day or week update data only. 

:::image type="content" source="media/aggregations-automatic/auto-aggs-refresh.png" alt-text="Configure refresh for automatic aggregations":::


If a refresh fails, it typically will be the first refresh, that includes the training process.



## Fine-tuning

After you've run at least one refresh using the recommended default 75% of cached queries, you can change the percentage to better suit your particular dataset. When you expand **Visualize how changing the percent cached affects this workload**, lift chart and bar charts provide visual representation of how changing the percentage can affect query response times. 



### Query performance impact

The Query Performance Impact lift chart provides an estimation of the percentile of queries as a function of query run times. Using this tool, users can get a directional sense of the query cache level that they must set to achieve their desired SLA and thus the desired performance.

**Query run time** - 
**Percentile of queries** - 

#### Set threshold

Threshold appears as a marker line on the lift chart. Use the threshold setting to define a target query response time for reports. For example, by setting threshold to 10 seconds, you can then fine-tune the percentage of cached queries to determine a New cache query percentage that meets the 10 second threshold.


### Scenarios

#### Scenario 1

#### Scenario 2

#### Scenario 3

## See also

[DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)

