---
title: Troubleshoot incremental refresh in Power BI
description: Describes common troubleshooting scenarios for incremental refresh.
author: minewiskan
ms.author: owend
ms.reviewer: chwade
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 04/08/2021
LocalizationGroup: 
---
# Troubleshoot incremental refresh

Because there are two phases when implementing an incremental refresh solution, the first being configuring parameters, filtering, and defining a policy in Power BI Desktop, and the second being the initial dataset refresh operation and subsequent refreshes in the service, we will look at troubleshooting separately for each of these phases.

Before troubleshooting incremental refresh, be sure to review [Incremental refresh for datasets](incremental-refresh-overview.md) and step-by-step information in [Configure incremental refresh](incremental-refresh-configure.md).

## Configuring in Power BI Desktop

Most problems that occur when configuring incremental refresh have to do with query folding. As described in [Incremental refresh for datasets overview - Supported data sources](incremental-refresh-overview.md#supported-data-sources), your data source must support query folding.

### Problem: Loading data takes too long

In Power Query Editor, after clicking Apply, loading data takes an excessive amount of time and computer resources. There are several potential causes:

#### Cause: Data type mismatch

This can be caused by a data type mismatch where Date/Time is the required data type for the RangeStart and RangeEnd parameters, but the table date column on which the filters are applied are not Date/Time data type, or vice-versa. Both the parameters data type and the filtered data column must be Date/Time data type and the format must be the same. If not, the query cannot be folded.

#### Solution: Verify data type

Verify the date/time column for the incremental refresh table is of Date/Time data type. If your table does not contain a column of Date/Time data type, but instead uses an integer data type, you can create a function that converts the date/time value in the RangeStart and RangeEnd parameters to match the integer surrogate key of the data source table. To learn more, see [Configure incremental refresh - Convert DateTime to integer](incremental-refresh-configure.md#convert-datetime-to-integer).

#### Cause: The data source does not support query folding

As described in [Incremental refresh for datasets - Requirements](incremental-refresh-overview.md#requirements), incremental refresh is designed for data sources that support query folding. Make sure data source queries are being folded in Power BI Desktop before publishing to the service, where query folding issues can be significantly compounded.

#### Solution: Verify and test queries

In most cases, a warning is shown in the Incremental refresh policy dialog indicating if the query to be executed against the data source does not support query folding. However, in some cases it may be necessary to further ensure query folding is possible. If possible, monitor the query being passed to the data source by using a tool like SQL Profiler. A query with filters based on RangeStart and RangeEnd must be executed in a single query.

You can also specify a short date/time period in the RangeStart and RangeEnd parameters that will include no more than a few thousand rows. If the load of filtered data from the data source to the model takes a long time and is process intensive, it likely means the query isn't being folded.

If you determine the query isn't being folded, refer to [Query folding guidance in Power BI Desktop](../guidance/power-query-folding.md) and [Power Query query folding](/power-query/power-query-folding) for help with identifying what may be preventing query folding and how, or if, the data source can even support query folding.

## Dataset refresh in the service

Troubleshooting incremental refresh issues in the service will differ depending on the type of capacity your dataset has been published to. Datasets on Premium capacities support using tools like SQL Server Management Studio (SSMS) to view and selectively refresh individual partitions. Power BI Pro datasets on the other hand do not provide tool access through the XMLA endpoint, so troubleshooting incremental refresh issues may require a little more trial and error.

### Problem: Initial refresh times out

Scheduled refresh for Power BI Pro datasets on a shared capacity have a time limit of two hours. This time limit is increased to five hours for datasets in a Premium capacity. Data source systems may also impose a query return size limit or query timeout.

#### Cause: Data source queries aren't being folded

While problems with query folding can usually be determined in Power BI Desktop before publishing to the service, it's possible dataset refresh queries are not being folded, leading to excessive refresh times and query mashup engine resource utilization. This is because a query is created for every partition in the dataset. If the queries are not being folded, and data is not being filtered at the data source, the engine then attempts to filter the data.

#### Solution: Verify query folding

Use a tracing tool at the data source to determine the query being passed for each partition is a single query that includes a filter based on the RangeStart and RangeEnd parameters. If not, verify query folding is occurring in the Power BI Desktop model when loading a small filtered amount of data into the model. If not, get it fixed in the model first, perform a metadata only update to the dataset (via XMLA endpoint), or if a Power BI Pro dataset on a shared capacity, delete the incomplete dataset in the service, republish, and try an initial refresh operation again.

If you determine queries aren't being folded, refer to [Query folding guidance in Power BI Desktop](../guidance/power-query-folding.md) and [Power Query query folding](/power-query/power-query-folding) for help with identifying what may be preventing query folding.

#### Cause: Data loaded into partitions is too large

#### Solution: Reduce dataset size

In many cases, the timeout is caused by the amount of data that must be queried and loaded into the dataset partitions exceeds the time limits imposed by the capacity. Reduce the size or complexity of your dataset, or consider breaking the dataset into smaller pieces.

#### Solution: Enable Large dataset storage format

For datasets published to Premium capacities, if the dataset will grow beyond 1 GB or more, you can improve refresh operation performance and ensure the dataset doesn't max out size limits by enabling Large dataset storage format *before* performing the first refresh operation in the service. To learn more, see [Large datasets in Power BI Premium](../admin/service-premium-large-models.md).

#### Solution: Bootstrap initial refresh

For datasets published to Premium capacities, you can bootstrap the initial refresh operation. Bootstrapping allows the service to create table and partition objects for the dataset, but not load and process historical data into any of the partitions. To learn more, see [Advanced incremental refresh - Prevent timeouts on initial full refresh](incremental-refresh-xmla.md#prevent-timeouts-on-initial-full-refresh).

#### Cause: Data source query timeout

Queries can be limited by a default time limit for the data source. 

#### Solution: Override the time limit in the query expression

Many data sources allow overriding time limit in the query expression. To learn more, see [Incremental refresh for datasets - Time limits](incremental-refresh-overview.md#time-limits).

### Problem: Refresh fails because of duplicate values

#### Cause: Post dates have changed

With a refresh operation, only data that has changed at the data source is refreshed in the dataset. As the data is divided by a date, it’s recommended post (transaction) dates are not changed.

If a date is changed accidentally, then two issues can occur: Users notice some totals changed in the historical data (that is not supposed to happen), or during a refresh an error is returned indicating a unique value is not in fact unique.
For the latter, this can happen when the table with incremental refresh configured is used in a 1:N relationship with another table as the 1 side and should have unique values. When the data is changed (for a specific ID), that ID then appears in another partition and the engine will detect the value is not unique.

#### Solution: Refresh specific partitions

Where there is a business need to change some past data from the dates, a possible solution is to use SSMS to refresh all partitions from the point where the change is located up to the current refresh partition, thus keeping the 1 side of the relationship unique.

### Problem: Data is truncated

#### Cause: Data source query limit has been exceeded

Some data sources, like Azure Data Explorer, Log Analytics, and Application Insights have a limit of 64 MB (compressed) on data that can be returned for an external query. Azure Data Explorer may return an explicit error, but for others like Log Analytics and Application Insights, the data returned is truncated.

#### Solution: Specify smaller refresh and store periods

Specify smaller refresh and store periods in the policy. For example, if you specified a refresh period of one year, and a query error is returned or data returned is truncated, try a refresh period of 12 *months*. You'll want to ensure queries for the current refresh partition or any historical partitions based on the Refresh and Store periods do not return more than 64 MB of data.

### Problem: Refresh fails because of partition-key conflicts

#### Cause: Date in the date column at the data source is updated

The filter on the date column is used to dynamically partition the data into period ranges in the Power BI service. Incremental refresh isn't designed to support cases where the filtered date column is updated in the source system. An update is interpreted as an insertion and a deletion, not an actual update. If the deletion occurs in the historical range and not the incremental range, it won't get picked up, which can cause data refresh failures due to partition-key conflicts.

## See also

[Data refresh in Power BI](../connect-data/refresh-data.md)  
[Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md)  
[Incremental refresh for dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)
