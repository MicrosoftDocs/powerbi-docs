---
title: Automatic aggregations 
description: This article describes using automatic aggregations to optimize query performance.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 05/18/2021
LocalizationGroup: Transform and shape data
---
# Automatic aggregations

Automatic aggregations uses state-of-the-art machine learning (ML) to self train and continuously optimize an in-memory cache with pre-aggregated query results, providing blazing fast report visualization response times for even the largest DirectQuery datasets.

With automatic aggregations:

- Big data is not so big anymore - By using MLs predictive modeling, automatic aggregations analyses both your backend data source and report query patterns to determine the optimal pre-defined aggregations to store in the Power BI dataset's in-memory cache.
- Report visualizations are faster - An optimal percentage of reporting queries are returned by the in-memory cache instead of backend data source systems. Outlier queries that cannot be returned by the in-memory cache are passed directly to the data source.
- Optimized dataset refresh - The in-memory cache stores only aggregated results. The number of rows stored is only a tiny fraction of a traditional in-memory tables. With such a small amount of data kept in-memory, dataset refresh times are significantly reduced.
- Balanced architectures - Because most query results are calculated and returned by the Power BI analytics engine and in-memory cache, query processing load on data source systems at peak reporting times is significantly reduced.

## Requirements

### Supported plans

Automatic aggregations is supported for **Power BI Premium** and **Premium per user** datasets.

### Permissions

To enable and configure automatic aggregations, you must have **Admin permissions** for the dataset. Data source credentials must be configured and signed in (in dataset settings) before automatic aggregations can be enabled.

### Supported data sources

During preview, automatic aggregations is supported for the following data sources:

- Azure Synapse Dedicated SQL pool
- Google Cloud BigQuery
- Snowflake

### Supported modes

Automatic aggregations are supported for DirectQuery mode datasets. Composite models are supported, however automatic aggregations are supported for the DirectQuery connection only.

## Under the hood

When using DirectQuery, latency, especially over very large datasets can often reduce query response times. Each time a dataset user opens a report or interacts with a visualization, queries are passed to the data source. The data source must then calculate and return aggregated results for each query. That round trip can be both time and process intensive, often causing slower query response times in report visualizations.

:::image type="content" source="media/aggregations-automatic/auto-aggregations.png" border="false" alt-text="Automatic aggregations diagram":::

When enabled for a dataset, automatic aggregations use machine learning predictive analytics algorithms to determine client reporting query patterns against DirectQuery data sources. Because almost all dataset reporting queries calculate an aggregated result, an optimal percentage of those aggregations are then cached in-memory. Aggregated results are then returned by the cache rather than being sent to and returned by the data source.

Unlike a traditional DirectQuery only dataset, a dataset with automatic aggregations enabled in-effect becomes a *composite model* dataset. 

Automatic aggregations predictive modeling continuously runs in the background. As users interact with reports, query patterns are identified. Those query patterns are then used to make predictions about aggregations that will answer those queries. A percentage of those aggregations are then cached in-memory. Your dataset is both self training and self optimizing. As client report query patterns change, automatic aggregations adjusts, prioritizing and caching those aggregations used most often. Those queries that are not cached are passed to the backend data source, just like a typical DirectQuery query.

Machine learning uses algorithms to identify patterns within data, and those patterns are then used to create a data model that can make predictions. With increased data and experience, the results of machine learning are more accurate



## Starting the engine

### Training

In order to create the aggregations cache, the service must first create a framework. This process is referred to as *training*. During training, machine learning algorithms query the data source to determine cardinality. 

Query patterns are ranked by frequency. 

Training refers to the process of creating the aggregation framework and hydrating them with the appropriate data from the data sources. Training differs from the refresh process, in that refresh process does not create new aggregations, but updates the existing ones. Due to the nature of these processes, training can be more resource intensive than refresh processes. 

How often should I train?
Training can be scheduled to occur on a daily, weekly or monthly basis. Training can be triggered in two ways. When scheduled using the UI, training would occur during the first refresh slot created by the user. For example, if I have three refresh slots created, (8:00 AM, 9:00 AM, and 10:00 AM), then training would occur at 8:00 AM (along with the refresh). During the other two slots, only refresh would occur.
You can also manually trigger training at any time using the TOM command <Insert command>

How often should I train?
The suitable training frequency depends on your workload. The intent of training is to revisit the existing aggregations and determine if they suitably address the current query workloads. Determining this frequency and scheduling your training appropriately will help using your computational resources optimally.

What should I do if the training fails?
Given that the cardinality estimation queries are correlated to the percentage of queries cached (based on the user input), reducing the percentage of queries cached can alleviate the issue. 

#### Percentage of queries cached

The automatic aggregations feature is based on the queries against the dataset generated by Power BI reports. The self-learning model analyzes these queries to determine the optimal set of aggregations. This setting also determines the number of aggregations created and thus the storage consumed by them. Finding the optimal setting for your workload can take a few iterations. The default setting is 75% (based on prior experience)

The optimal percentage of queries cached setting is a function of the use-case and workload and will vary on a case-by-case basis. However, you can use the lift chart tool in the automatic aggregations settings page to get an estimation of the level that you should be at. Please note that the lift chart tool provides estimations and is only to be used as a guidance tool. 

The default query cache percentage in 75%. This value 

For example, a setting of 95% will cache nearly all queries detected. More queries will hit the cache rather than the data source, possibly resulting in faster results. but learning and refresh processes could take an excessive amount of time, possibly exceeding time limits causing the learning process to fail. 

### Refresh

Because the aggregations are stored in memory, just like with any other import table it's necessary to refresh the agg table to keep it in sync with the data source. You specify either a daily or weekly refresh, and you can specify up to 48 refreshed per day. The first refresh includes the training process. All subsequent refreshes that day or week update data only. 

:::image type="content" source="media/aggregations-automatic/auto-aggs-refresh.png" alt-text="Configure refresh for automatic aggregations":::


If a refresh fails, it typically will be the first refresh, that includes the training process.



## Fine-tuning

After you've run at least one refresh using the recommended default 75% of cached queries, you can change the percentage to better suit your particular dataset. When you expand **Visualize how changing the percent cached affects this workload**, a lift chart and bar charts can giv you a visual representation of how changing the percentage can affect query response times.

The cache percentage setting determines the query coverage. Having a greater percentage means greater coverage and thus more aggregations created. While having more coverage is optimal for query performance, they also would mean longer training times. Having lesser coverage would help in this aspect, but would degrade performance as certain queries would have to hit the tables in the DirectQuery source. Finding the optimal setting requires an iterative process.

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



