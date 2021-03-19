---
title: Troubleshooting incremental refresh in Power BI
description: Describes common troubleshooting scenarios for incremental refresh.
author: minewiskan
ms.author: minewiskan
ms.reviewer: chwade
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 03/19/2021
LocalizationGroup: 
---
# Troubleshooting incremental refresh

Because there are two phases when implementing an incremental refresh solution, the first being configuring parameters, filtering, and a policy in Power BI Desktop, and the second being the initial dataset refresh operation and subsequent refreshes in the service, we will look at troubleshooting separately for each of these phases.

Before troubleshooting incremental refresh, be sure to review [Incremental refresh for datasets](incremental-refresh-overview.md) and step-by-step information in [Configure incremental refresh](incremental-refresh-configure.md).

## Configuring in Power BI Desktop

Most problems that occur when configuring incremental refresh have to do with query folding. As described in [Incremental refresh for datasets overview](incremental-refresh-overview.md#supported-data-sources), your data source must support query folding.

**Problem:** In Power Query Editor, after filtering data and then clicking **Close & Apply**, importing data from the data source takes an excessive amount of time and computer resources.

**Cause:** This can be caused by a data type mismatch where Date/Time is the required data type for the RangeStart and RangeEnd parameters, but the table date column on which the filters are applied are not Date/Time data type, or vice-versa. Both the parameters data type and the filtered data column must be Date/Time data type and the format must be the same. If not, the query cannot be folded.

**Solution:** Verify the data/time column for the incremental refresh table is of Date/Time data type. If your table does not contain a column of Date/Time data type, but instead uses an integer data type, you can create a function that converts the date/time value in the RangeStart and RangeEnd parameters to match the integer surrogate key of the data source table. To learn more, see [Convert DateTime to integer](incremental-refresh-configure.md#convert-datetime-to-integer).

**Cause:** The data source does not support query folding.

**Solution:** In most cases, a warning is shown in the Incremental refresh policy dialog indicating if the query to be executed against the data source will not support query folding. However, in some cases it may be necessary to further ensure query folding is possible. If possible, monitor the query being passed to the data source by using a tool like SQL Profiler. A query with filters based on RangeStart and RangeEnd must be executed in a single query.

You can also specify a short date/time period in the RangeStart and RangeEnd parameters that will include no more than a few thousand rows. If the load of filtered data from the data source to the model takes a long time and is process intensive, it likely means the query isn't being folded.

If you determine the query isn't being folded, refer to [Query folding guidance in Power BI Desktop](../guidance/power-query-folding.md) and [Power Query query folding](/power-query/power-query-folding) for help identifying what may be preventing query folding and how, or if, the data source can even support query folding.

## Dataset refresh in the service

Troubleshooting incremental refresh issues in the service will differ depending on the type of capacity your dataset has been published to. Datasets on Premium capacities support using tools like SQL Server Management Studio (SSMS) to view and selectively refresh individual partitions. Datasets on a shared capacity on the other hand do not provide tool access through the XMLA endpoint, so troubleshooting incremental refresh issues may require a little more trial and error.

**Problem:** The first refresh after publishing times out.

**Cause:** Scheduled refresh for datasets on a share capacity timeout after two hours. This timeout is increased to five hours for datasets for a Premium capacity. Data source systems may also impose a query return size limit or query timeout.

**Solution:** Verify query folding is occuring. Use a tracing tool at the data source to determine the query being passed is a single query that includes a filter based on the RangeStart and RangeEnd parameters. If not, verify query folding is occuring in the Power BI Desktop model when loading a small filtered amount of data into the model. If not, get it fixed in the model first, perform a metadata only update to the dataset (via XMLA endpoint), or if on a Shared capacity, delete the incomplete dataset in the service, re-publish, and try an initial refresh operation again.

**Solution:** In many cases, the timeout is caused by the amount of data that must be queried and loaded into the dataset partitions exceeds the time limits imposed by the capacity. Reduce the size or complexity of your dataset, or consider breaking the dataset into smaller pieces.

**Solution:** For datasets on a Premium capacity, you can bootstrap the initial refresh operation. Bootstrapping allows the service to create table and partition objects for the dataset, but not load and process historical data into any of the partitions. To learn more, see [Prevent timeouts on initial full refresh](incremental-refresh-xmla.md#prevent-timeouts-on-initial-full-refresh).

**Problem:** In some cases, datasets configured for [Large dataset storage format](service-premium-large-models.md) can be slower for refresh operations. For datasets on a Premium Gen2 capacity or a Premium Per User capacity, you may see the following error:

“Resource Governing: The operation failed because of insufficient memory. If the dataset is hosted on Premium capacity/server, please consider upgrading the capacity to one with more memory or reducing the memory footprint of your operation. Additional information: Requested 10768269KB, Command Memory Limit 10768269KB, Database Size Before Command Execution 15446131KB.”

**Cause:** This can occur when refresh operations require more memory than the capacity allows. If during an incremental refresh, a large amount of data must be added, and if partitions haven't been updated for a few weeks or months, use SSMS via the XMLA endpoint to refresh the new partitions individually instead of all partitions being refresh in parallel as would be done by the Service. If the refresh of one partition still gives the error, it can mean the capacity must be increased in size to provide enough memory for refresh operations.

**Problem:** Refresh fails because of duplicate values in a table.

**Cause:** With a refresh operation, only data that has changed at the data source is refreshed in the dataset. As the data is divided by a date, it’s recommended post dates are not changed.

If a date is changed accidentally, then two issues can occur: Users notice some totals changed in the historical data (that is not supposed to happen), or during a refresh an error is returned indicating a unique value is not unique.
For the latter, this can happen when the table with incremental refresh configured is used in a 1:N relationship with another table as the 1 side and should have unique values. When the data is changed (for a specific id) that id then appears in another partition and the Analysis Services engine will detect the value is not unique.

**Solution:** In the case there is a business need to change some past data from the dates, one solution is to use the XMLA endpoint to refresh all partitions from the point where was located the data to the current partitions, thus keeping the 1 side of the relationship unique.

**Cause:** Some data sources, like Azure Data Explorer, Log Analytics, and Application Insights have a limit of 64MB (compressed) on data that can be returned for an external query. Azure Data Explorer may return an explicit error, but for others like Log Analytics and Application Insights, the data returned is just truncated.

**Solution:** Specify smaller refresh and store periods in the policy. For example, if you specified a refresh period of 1 year, and a query error is returned or data returned is truncated, try a refresh period of 12 *months*. You'll want to ensure queries for the current refresh partition or any historical partitions based on the Refresh and Store periods do not return more than 64mb of data.

## See also

[Data refresh in Power BI](../connect-data/refresh-data.md)  
[Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md)  
[Incremental refresh for dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)
