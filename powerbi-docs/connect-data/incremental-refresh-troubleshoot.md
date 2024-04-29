---
title: Troubleshoot incremental refresh and real-time data in Power BI
description: Learn about common troubleshooting scenarios for incremental refresh, divided into configuration and refresh operations.
author: kfollis
ms.author: kfollis
ms.reviewer: chwade
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 04/26/2024
LocalizationGroup: 
---
# Troubleshoot incremental refresh and real-time data

There are two phases when implementing an incremental refresh and real-time data solution, the first being configuring parameters, filtering, and defining a policy in Power BI Desktop, and the second being the initial semantic model refresh operation and subsequent refreshes in the service. This article discusses troubleshooting separately for each of these phases.

Having partitioned the table in the Power BI service, it's important to keep in mind that incrementally refreshed tables that are also getting real-time data with DirectQuery are now operating in hybrid mode, meaning they operate in both import and DirectQuery mode. Any tables with relationships to such an incrementally refreshed hybrid table must use Dual mode so that they can be used in import and DirectQuery mode without performance penalties. Moreover, report visuals might cache results to avoid sending queries back to the data source, which would prevent the table from picking up the latest data updates in real time. The final troubleshooting section covers these hybrid-mode issues.

Before troubleshooting incremental refresh and real-time data, be sure to review [Incremental refresh for models and real-time data](incremental-refresh-overview.md) and step-by-step information in [Configure incremental refresh and real-time data](incremental-refresh-configure.md).

## Configuring in Power BI Desktop

Most problems that occur when configuring incremental refresh and real-time data have to do with query folding. As described in [Incremental refresh for models overview - Supported data sources](incremental-refresh-overview.md#supported-data-sources), your data source must support query folding.

### Problem: Loading data takes too long

In Power Query Editor, after selecting **Apply**, loading data takes an excessive amount of time and computer resources. There are several potential causes.

#### Cause: Data type mismatch

This issue can be caused by a data type mismatch where `Date/Time` is the required data type for the `RangeStart` and `RangeEnd` parameters, but the table date column on which the filters are applied aren't `Date/Time` data type, or vice-versa. Both the parameters data type and the filtered data column must be `Date/Time` data type and the format must be the same. If not, the query can't be folded.

#### Solution: Verify data type

Verify the date/time column for the incremental refresh table is of `Date/Time` data type. If your table doesn't contain a column of `Date/Time` data type, but instead uses an integer data type, you can create a function that converts the date/time value in the `RangeStart` and `RangeEnd` parameters to match the integer surrogate key of the data source table. To learn more, see [Configure incremental refresh - Convert DateTime to integer](incremental-refresh-configure.md#convert-datetime-to-integer).

#### Cause: The data source doesn't support query folding

As described in [Incremental refresh and real-time data for models - Requirements](incremental-refresh-overview.md#requirements), incremental refresh is designed for data sources that support query folding. Make sure data source queries are being folded in Power BI Desktop before publishing to the service, where query folding issues can be significantly compounded. This approach is especially important when including real-time data in an incremental refresh policy because the real-time DirectQuery partition requires query folding.

#### Solution: Verify and test queries

In most cases, a warning is shown in the Incremental refresh policy dialog indicating if the query to be executed against the data source doesn't support query folding. However, in some cases it might be necessary to further ensure query folding is possible. If possible, monitor the query being passed to the data source by using a tool like SQL Profiler. A query with filters based on `RangeStart` and `RangeEnd` must be executed in a single query.

You can also specify a short date/time period in the `RangeStart` and `RangeEnd` parameters that include no more than a few thousand rows. If the load of filtered data from the data source to the model takes a long time and is process intensive, it likely means the query isn't being folded.

If you determine the query isn't being folded, refer to [Query folding guidance in Power BI Desktop](../guidance/power-query-folding.md) and [Power Query query folding](/power-query/power-query-folding) for help with identifying what might be preventing query folding and how, or if, the data source can even support query folding.

## Semantic model refresh in the service

Troubleshooting incremental refresh issues in the service differ depending on the type of capacity your model has been published to. Semantic models on Premium capacities support using tools like SQL Server Management Studio (SSMS) to view and selectively refresh individual partitions. Power BI Pro models on the other hand don't provide tool access through the XMLA endpoint, so troubleshooting incremental refresh issues might require a little more trial and error.

### Problem: Initial refresh times out

Scheduled refresh for Power BI Pro models on a shared capacity have a time limit of two hours. This time limit is increased to five hours for models in a Premium capacity. Data source systems might also impose a query return size limit or query timeout.

#### Cause: Data source queries aren't being folded

While problems with query folding can usually be determined in Power BI Desktop before publishing to the service, it's possible that model refresh queries aren't being folded, leading to excessive refresh times and query mashup engine resource utilization. This situation happens because a query is created for every partition in the model. If the queries aren't being folded, and data isn't being filtered at the data source, the engine then attempts to filter the data.

#### Solution: Verify query folding

Use a tracing tool at the data source to determine the query being passed for each partition is a single query that includes a filter based on the RangeStart and RangeEnd parameters. If not, verify query folding is occurring in the Power BI Desktop model when loading a small filtered amount of data into the model. If not, get it fixed in the model first, perform a metadata only update to the model (by using XMLA endpoint), or if a Power BI Pro model on a shared capacity, delete the incomplete model in the service, republish, and try an initial refresh operation again.

If you determine queries aren't being folded, refer to [Query folding guidance in Power BI Desktop](../guidance/power-query-folding.md) and [Power Query query folding](/power-query/power-query-folding) for help with identifying what might be preventing query folding.

#### Cause: Data loaded into partitions is too large

#### Solution: Reduce model size

In many cases, the timeout is caused by the amount of data that must be queried and loaded into the model partitions exceeds the time limits imposed by the capacity. Reduce the size or complexity of your model, or consider breaking the model into smaller pieces.

#### Solution: Enable Large model storage format

For models published to Premium capacities, if the model grows beyond 1 GB or more, you can improve refresh operation performance and ensure the model doesn't max out size limits by enabling Large model storage format *before* performing the first refresh operation in the service. To learn more, see [Large models in Power BI Premium](../enterprise/service-premium-large-models.md).

#### Solution: Bootstrap initial refresh

For models published to Premium capacities, you can bootstrap the initial refresh operation. Bootstrapping allows the service to create table and partition objects for the model, but not load and process historical data into any of the partitions. To learn more, see [Advanced incremental refresh - Prevent timeouts on initial full refresh](incremental-refresh-xmla.md#prevent-timeouts-on-initial-full-refresh).

#### Cause: Data source query timeout

Queries can be limited by a default time limit for the data source.

#### Solution: Override the time limit in the query expression

Many data sources allow overriding time limit in the query expression. To learn more, see [Incremental refresh for models - Time limits](incremental-refresh-overview.md#time-limits).

### Problem: Refresh fails because of duplicate values

#### Cause: Post dates have changed

With a refresh operation, only data that has changed at the data source is refreshed in the model. As the data is divided by a date, it's recommended that post (transaction) dates aren't changed.

If a date is changed accidentally, then two issues can occur: Users notice some totals changed in the historical data (that isn't supposed to happen), or during a refresh an error is returned indicating a unique value isn't in fact unique.
For the latter, this situation can happen when the table with incremental refresh configured is used in a `1:N` relationship with another table as the `1` side and should have unique values. When the data is changed for a specific ID, that ID then appears in another partition and the engine detects the value isn't unique.

#### Solution: Refresh specific partitions

Where there's a business need to change some past data from the dates, a possible solution is to use SSMS to refresh all partitions from the point where the change is located up to the current refresh partition, thus keeping the `1` side of the relationship unique.

### Problem: Data is truncated

#### Cause: Data source query limit has been exceeded

Some data sources, like Azure Data Explorer, Log Analytics, and Application Insights, have a limit of 64 MB (compressed) on data that can be returned for an external query. Azure Data Explorer might return an explicit error, but for others like Log Analytics and Application Insights, the data returned is truncated.

#### Solution: Specify smaller refresh and store periods

Specify smaller refresh and store periods in the policy. For example, if you specified a refresh period of one year, and a query error is returned or data returned is truncated, try a refresh period of 12 *months*. You want to ensure queries for the current refresh partition or any historical partitions based on the Refresh and Store periods don't return more than 64 MB of data.

### Problem: Refresh fails because of partition-key conflicts

#### Cause: Date in the date column at the data source is updated

The filter on the date column is used to dynamically partition the data into period ranges in the Power BI service. Incremental refresh isn't designed to support cases where the filtered date column is updated in the source system. An update is interpreted as an insertion and a deletion, not an actual update. If the deletion occurs in the historical range and not the incremental range, it isn't picked up, which can cause data refresh failures due to partition-key conflicts.

## Hybrid mode in the service (Preview)

When Power BI applies an incremental refresh policy with real-time data, it turns the incrementally refreshed table into a hybrid table that operates in both import and DirectQuery mode. Notice the DirectQuery partition at the end of the following partitions list of a sample table. The presence of a DirectQuery partition has implications for related tables and report visuals that query this table.

:::image type="content" source="media/incremental-refresh-troubleshoot/hybrid-table-01.png" alt-text="Screenshot of hybrid table." lightbox="media/incremental-refresh-troubleshoot/hybrid-table-01.png":::

### Problem: Query performance is poor

#### Cause: Related tables aren't in Dual mode

Hybrid tables operating in both import and DirectQuery mode require any related tables to operating in Dual mode so that they can act as either cached or not cached, depending on the context of the query that's submitted to the Power BI model. Dual mode enables Power BI to reduce the number of limited relationships in the model and generate efficient data source queries to ensure good performance. Limited relationships can't be pushed to the data source requiring Power BI to retrieve more data than necessary. Because Dual tables can act as either DirectQuery or Import tables, this situation is avoided.

#### Solution: Convert related tables to Dual mode

When configuring an incremental refresh policy, Power BI Desktop reminds you to switch any related tables to Dual mode when you select **Get the latest data in real time with DirectQuery (Premium only)**. In addition, make sure you review all existing table relationships in Model View.

:::image type="content" source="media/incremental-refresh-troubleshoot/hybrid-table-02.png" alt-text="Screenshot showing converting related tables to dual mode." lightbox="media/incremental-refresh-troubleshoot/hybrid-table-02.png":::

Tables currently operating in DirectQuery mode, are easily switched to Dual mode. In the table properties, under Advanced, select Dual from the Storage mode listbox. Tables currently operating in import mode, however, require manual work. Dual tables have the same functional constraints as DirectQuery tables. Power BI Desktop therefore can't convert import tables because they might rely on other functionality not available in Dual mode. You must manually recreate these tables in DirectQuery mode and then convert them to Dual mode. To learn more, see [Manage storage mode in Power BI Desktop](../transform-model/desktop-storage-mode.md).

### Problem: Report visuals don’t show the latest data

#### Cause: Power BI caches query results improve performance and reduce back-end load

By default, Power BI caches query results, so that queries of report visuals can be processed quickly even if they're based on DirectQuery. Avoiding unnecessary data source queries improves performance and reduces data source load, but it might also mean that the latest data changes at the source aren't included in the results.

#### Solution: Configure automatic page refresh

To keep fetching the latest data changes from the source, configure automatic page refresh for your reports in the Power BI service. Automatic page refresh can be performed in fixed intervals, such as five seconds or ten minutes. When that specific interval is reached, all visuals in that page send an update query to the data source and update accordingly. Alternatively, you can refresh visuals on a page based on detecting changes in the data. This approach requires a change detection measure that Power BI then uses to poll the data source for changes. Change detection is only supported in workspaces that are part of a Premium capacity. To learn more, see [Automatic page refresh in Power BI](../create-reports/desktop-automatic-page-refresh.md).

## Related content

- [Data refresh in Power BI](../connect-data/refresh-data.md)
- [Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md)
- [Incremental refresh for dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)
