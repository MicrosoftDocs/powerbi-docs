---
title: Automatic aggregations 
description: Describes using automatic aggregations to optimize query performance.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 07/06/2021
LocalizationGroup: Transform and shape data
---
# Automatic aggregations (Preview)

Automatic aggregations for DirectQuery datasets uses state-of-the-art machine learning (ML) to self train and continuously optimize an in-memory cache with pre-aggregated query results, providing faster report visualization response times for even the largest datasets.

With automatic aggregations:

- Big data isn't so big - By using MLs predictive modeling, report query patterns are analyzed to determine pre-defined aggregations to store in the dataset in-memory aggregations cache. The amount of pre-aggregated data stored in-memory is typically small, but can answer the majority of report queries.
- Report visualizations are faster - An optimal percentage of report queries are returned by the in-memory aggregations cache instead of backend data source systems. Outlier queries that cannot be returned by the in-memory cache are passed directly to the data source using DirectQuery.
- Balanced architecture - Because most query results are returned by the Power BI query engine and in-memory aggregations cache, query processing load on data source systems at peak reporting times is significantly reduced.
- Easy setup - Enable automatic aggregations and schedule one or more refreshes for the dataset - that's all it takes. With the first refresh, automatic aggregations takes over and begins creating the aggregations framework and optimal aggregations. The system automatically tunes itself over time, though with a single slide bar control you can easily fine-tune for your environment.

> [!NOTE]
> Automatic aggregations is in Preview. When in preview, functionality and documentation are likely to change.

## Optimized query response

With DirectQuery, each time a dataset user opens a report or interacts with a visualization, DAX queries are passed to the query engine and then on to the backend data source as SQL queries. The data source must then calculate and return aggregated results for each query. Compared to import mode datasets that are stored in-memory, that round trip can be both time and process intensive, often causing slow query response times in report visualizations. 

When enabled for a DirectQuery dataset, automatic aggregations use machine learning (ML) predictive modeling algorithms to determine client reporting query patterns. Because almost all report queries calculate an aggregated result, a percentage of those aggregations are then cached in-memory. Aggregated query results are then returned by the in-memory cache rather than being sent to and returned by the data source. Report and ad-hoc queries that require aggregations not included in the in-memory cache are passed to the backend data source, just like with typical DirectQuery.

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

Automatic aggregations are supported for DirectQuery mode datasets. Composite model datasets with both import tables and DirectQuery connections are supported, however automatic aggregations are supported for the DirectQuery connection only.

### Permissions

To enable and configure automatic aggregations, you must have **Admin** permissions for the workspace.

## Configure

1. In dataset Settings, expand **Optimize performance**.
1. Click the **Enable automatic aggregations** slider to **On**. If the enable slider is greyed out, ensure Data source credentials for the dataset are configured and signed in.
    
    :::image type="content" source="media/aggregations-automatic/auto-aggs-enable.png" alt-text="Enable automatic aggregations":::

1. In **Refresh schedule**, specify a refresh frequency and time zone.
1. Click **Add another time**, and then specify one or more refreshes.

    :::image type="content" source="media/aggregations-automatic/auto-aggs-refresh.png" alt-text="Configure aggregations refresh dialog":::

    You must configure at least one refresh. The first refresh for the frequency you select will include both a training process and a refresh that loads new and updated aggregations into the in-memory cache. Schedule additional refreshes to ensure report queries that hit the aggregations cache are getting results that are most in-sync with the backend data source. To learn more, see [Refresh](#refresh) later in this article.

1. Click **Apply**.

## Fine-tuning

By default, when you first enable automatic aggregations, the percentage of queries that will use the aggregations cache setting is 75%. The setting determines the percentage of report queries that will use aggregations from the in-memory cache. It does not determine the percentage of all potential aggregations stored in the aggregations cache. At first, this might seem counter-intuitive, however, before the system can determine the optimal aggregations to include in the cache, it must first know the report query patterns being used most often.

### Adjusting the percentage

Before adjusting the percentage of queries that will use the aggregations cache, allow several iterations of the training/refresh operation to be completed. This gives the training algorithm time to analyze report queries over a broader time period and self-adjust accordingly. For example, if you've scheduled refreshes for daily frequency, you might want to wait a full week. User reporting patterns on some days of the week may be different than others.

Increasing the percentage means a greater number of report queries are ranked higher and therefore aggregations for them are included in the in-memory aggregations cache. While increasing the percentage can mean more queries are answered from the in-memory cache, it can also mean longer training and refresh times. Training and refresh operations are process and resource intensive for both Power BI system and data source system resources. Increasing the percentage means more aggregations must be queried and calculated from data sources during training and refresh operations, increasing the probability of excessive use of system resources and potentially causing timeouts.

Adjusting to a lower percentage can mean shorter training and refresh times, and less resource utilization, but report visualization performance could diminish because fewer report queries would be answered by the in-memory aggregations cache. Those report queries instead have to be passed to the data source by using DirectQuery.

An optimal percentage strikes a balance between providing pre-aggregated results from the in-memory aggregations cache for the most frequently used report queries, while accepting slower results for outlier and ad-hoc queries in exchange for faster training and refresh times and reduced burden on system resources.

#### Query performance impact

The **Query performance impact** lift chart provides an estimated report query run times as a function of the percentage of queries that will use cached aggregations. By default, the chart will show 0.0 for all metrics until at least one training/refresh operation is performed. After an initial training/refresh operation, the chart can help you determine if adjusting the percentage of queries that use the in-memory aggregations cache can potentially further improve query response.

:::image type="content" source="media/aggregations-automatic/lift-chart.png" alt-text="Lift chart":::

Metrics:

**DirectQuery** - An estimated duration in seconds for a report query sent to and returned from the data source by using DirectQuery. Queries that cannot be answered by the in-memory aggregations cache will typically be within this estimate.

**Current query percentage** - An estimated duration in seconds for report queries answered from the in-memory aggregations cache, based on the percentage setting for the most recent training/refresh operation.

**New query percentage** - An estimated duration in seconds for report queries answered from the in-memory aggregations cache for a newly selected percentage. As the percentage slider is changed, this metric reflects the potential change.

##### Set target to seconds

Threshold appears as a marker line on the lift chart. Use the threshold setting to define a target query response time for reports. For example, by setting threshold to 10 seconds, you can then fine-tune the percentage of queries that will use the aggregations cache to determine a new query percentage that meets the 10 second threshold.

#### Aggregation tables bar chart

During training, automatic aggregations creates and deletes tables in the in-memory cache. The tables contain rows of aggregations and are not visible to report users.

:::image type="content" source="media/aggregations-automatic/tables-chart.png" alt-text="Aggregation tables bar chart":::

#### Average row count bar chart

:::image type="content" source="media/aggregations-automatic/row-count-chart.png" alt-text="Average row count bar chart":::

## Refresh

Because aggregations are stored in the in-memory dataset aggregations cache, it's necessary to refresh the dataset to keep those aggregations in sync with new and updated data at the data source. When you first enable automatic aggregations, you must configure at least one refresh operation for either day or week frequency. The first refresh for the frequency you choose (Day or Week) includes the training process. During training, in-memory tables are created, updated, or dropped, and queries are sent to the data source to determine aggregations to be added. Aggregations data, however, is not loaded into the tables during training - it's loaded during the subsequent refresh operation. The training operation has a time limit of 60 minutes. Subsequent refreshes are refresh only operations. For example, if you choose a **Day** frequency and schedule refreshes at 4:00AM, 9:00AM, 2:00PM, and 7:00PM, the 4:00AM refresh each day will include both a training operation *and* a refresh operation. The 9:00AM, 2:00PM, and 7:00PM scheduled refreshes will be refresh operations only.

If your data source is continuously being updated with near real time data, you may want to schedule more refreshes to ensure aggregations stored in the cached are more closely in sync with the data source. At the same time, refresh operations for both the Power BI service and data source systems can be resource intensive.  Refresh operations must be given enough time to complete before the next scheduled refresh begins.

In dataset settings, you can configure up to 48 refreshes each day. Dataset refreshes through the XMLA endpoint, however, are unlimited.

:::image type="content" source="media/aggregations-automatic/auto-aggs-refresh.png" alt-text="Configure refresh for automatic aggregations":::

Data latency is the time between an update at the data source and when that update is reflected in a report. With DirectQuery, report queries are passed directly to and returned from the data source *almost* eliminating latency. We say *almost* because the time between data source system calculating and returning a result to the client report is in effect latency. between data at the data source and data stored in the dataset in-memory cache.

The time you choose for your first scheduled refresh should be when the data source system is least active and prior to users actively working with reports. For most organizations, this will be overnight or early in the morning, after any ETL or maintenance processes at the data source have completed. This will give the training process in the first refresh plenty of system resources to complete and ensure refresh operations query and calculate aggregations from most recent source data. Be sure to schedule refreshes often enough so aggregations data stored in-memory most closely reflects that of data at the data source. At the same time, ensure you don't schedule so many refreshes that system resources are used unnecessarily.

A single refresh operation has a total time allowed limit of 5 hours. However, because aggregations tables are typically quite small compared to normal import tables, it's unlikely a refresh operation will exceed the time limit. The exception could be composite model datasets. If your dataset is already a composite model, and large tables are stored in-memory, refresh on those tables could take longer.

If a refresh fails, it typically will be the first refresh that includes the training process, and it will likely be the training operation exceeds the 60 minute time limit. 

#### Cache refresh history

Each refresh operation is recorded in the dataset cache refresh history.

:::image type="content" source="media/aggregations-automatic/cache-refresh-history.png" alt-text="":::

Refresh history provides information about how scheduled training and refresh operations are going. Because the first scheduled refresh of the day or week includes the training operation, additional details about how much memory aggregations are using in the in-memory cache are provided. If you want to drill down a little further, click **Show** details. Ensure your scheduled refresh operations are completing within and acceptable period. If a training or refresh operation fails, reduce the percentage of queries that use the in-memory aggregations cache. This will reduce the number of aggregations created, but allow more time for refresh operations to complete.

## User defined aggregations

Automatic aggregations is built on top of existing [user defined aggregations](aggregations-advanced.md) functionality first introduced with composite models for Power BI. Automatic aggregations can work side-by-side with user defined aggregations. Aggregations created in the in-memory cache by the automatic aggregations training algorithm are identified as *System* aggregations. The training algorithm creates and deletes only those System aggregations as reporting queries are analyzed and adjustments are made to maintain the optimal aggregations for the dataset.

Both aggregations created by using automatic aggregations and user defined aggregations are refreshed with dataset refresh. Only those aggregations created by automatic aggregations and marked as *System* are included in the training process.

## See also

[DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)