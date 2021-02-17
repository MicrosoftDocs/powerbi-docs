---
title: Incremental refresh for datasets in Power BI
description: Describes incremental refresh features in Power BI
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: 
ms.topic: how-to
ms.date: 02/09/2021
LocalizationGroup: 
---
# Incremental refresh for datasets

This article provides an overview of incremental refresh for datasets. Incremental refresh is supported for Power BI Premium, Premium per user, and Power BI Pro shared subscriptions and datasets.

Incremental refresh extends single or scheduled refresh operations by providing partition creation and management for large import tables that contain continuously new and updated data. For most datasets, this is a fact table, or one or more tables that contain transaction data that changes often and can grow quite large. By partitioning the table and refreshing only the most recent partition significantly reduces the amount of data that has to be loaded from data sources.

With incremental refresh:

> [!div class="checklist"]
> * **Refreshes are faster** - Often, only the most recent data that has changed needs to be refreshed.  
> * **Refreshes are more reliable** - Long-running connections to volatile data sources aren't necessary. Queries to source data run faster, reducing potential for network problems to interfere.
> * **Resource consumption is reduced** - Less data to refresh reduces overall consumption of memory and other resources on both Power BI resources and source data systems.

Typically for large data models, like those in Azure Analysis Services, solution developers have to write complex code to create, manage, and refresh partitions that allow data models to scale as source data grows and changes. Incremental refresh in Power BI simplifies this often complex task by providing easy to use dialogs in Power BI Desktop to configure an incremental refresh *policy*. When published, the Power BI service then creates and manages dataset partitions defined by the incremental refresh policy and optimally refreshes and loads updates from the data source.

## Requirements

Incremental refresh is supported for Power BI Premium, Premium per user, and Power BI Pro shared subscriptions and datasets. To further extend advanced incremental refresh scenarios by using features supported with the XMLA endpoint, Premium per user workspaces or workspaces assigned to a Premium capacity are required.

**Date column** - Your model table must contain a date column of Date/Time data type. The RangeStart and RangeEnd parameters filter table data based on the date column. If your table contains a date column of integer surrogate keys in the form of yyyymmdd, you can create a function that converts the date/time value in the parameters to match the integer surrogate key of the data source table. To learn more, see [Convert DateTime to integer](incremental-refresh-configure.md#convert-datetime-to-integer).

**Query folding** - Partition filters are pushed to the source system when queries are submitted for refresh operations. To push filtering down means the data source should support *query folding*.

[Query folding](/power-query/power-query-folding) is the ability for a Power Query query to generate a single query statement to retrieve and transform data source data. Most data sources that support SQL queries support query folding. However, data sources like flat files, blobs, and web feeds typically do not. In cases where the filter is not supported by the data source back-end, it cannot be pushed down. In such cases, the query mashup engine compensates and applies the filter locally, which may require retrieving the full dataset from the data source. This can cause incremental refresh to be very slow, and the process can run out of resources either in the Power BI service or in the on-premises data gateway if used.

Given the various levels of query folding support for different types of data sources, verification should be performed to ensure the filter logic is included in the source queries. In most cases, Power BI Desktop attempts to perform this verification for you when defining the incremental refresh policy. While SQL based data sources such as SQL, Oracle, and Teradata, verification is reliable, other data sources however may be unable to verify without tracing queries. If Power BI Desktop is unable to confirm, a warning is shown in the Incremental refresh policy configuration dialog.

 ![Query folding warning](media/incremental-refresh-overview/query-folding-warning.png)

If you see this warning and want to verify the necessary query folding is occurring, use the Power Query Diagnostics feature or trace queries received by the data source database by using a tool like SQL Profiler supported by the data source.

### Partitions

After a data model with an incremental refresh policy defined for a table has been published to the service and the first refresh operation is run, the service automatically partitions the table according to the settings defined in the policy. Partitions are not exposed in the service 

## Configuring incremental refresh

Configuring incremental refresh for new data models done in Power BI Desktop. For most models, only a few tasks are required. 

### RangeStart and RangeEnd parameters

When configuring incremental refresh, datasets are filtered by using Power Query date/time parameters with the reserved, case-sensitive names **RangeStart** and **RangeEnd**. These parameters, defined in the Manage Parameters dialog in Power Query Editor are used to filter the data loaded into Power BI Desktop. When the model is published to the service, the parameters are used to dynamically partition the data into ranges. They are then overridden automatically by the service according to the incremental refresh policy settings. If defining policies for more than one table, the same parameters can be used.

![Manage Parameters dialog](media/incremental-refresh-overview/manage-parameters-small.png)

### Filter data

With RangeStart and RangeEnd parameters defined, you then apply custom Date filters on your table's date column. The filters you apply select a subset of data that will be imported when c

![Custom filter](media/incremental-refresh-overview/custom-filter.png)

### Define policy

After filtering has been applied, you define an incremental refresh policy for the table. Settings in the Incremental refresh dialog are enabled only for tables that have filters based on RangeStart and RangeEnd parameters defined for the query. After the model is published to the service, the policy is used by the service to create and manage partitions for the table and load the specified new and historical data. 

To define the policy, there are three required settings and two optional settings:

![Define policy dialog](media/incremental-refresh-overview/pbid-incremental-refresh-dialog.png)

#### 1 - Table

The Table listbox defaults to the table you selected. You enable incremental refresh for the table with the slider.

#### 2 - Store rows in the last

This required setting determines the time period in which *all* rows in that period are included in the dataset. For example, if you specify 5 years, your dataset will store the last five years of data up to the most recent refresh. Rows older than this period are deleted from the dataset in the next refresh. This setting effectively determines the oldest data available in the dataset and will determine available rows in reporting.

#### 3 - Refresh rows in the last

This setting is required, and it's one of the most important. This setting determines the time period in which all rows in that period are refreshed. For example, if you specify 7 days, all rows in the last seven days up to the current refresh operation time are refreshed. Rows older than seven days are are excluded from the next refresh. The majority of system resources used during a refresh operation are consumed for this period. Be sure to specify a time period in which the most important new and updated rows at the data source are within this period. It's also important this not be such a long period that system resources are used unnecessarily refreshing rows that have not updated within the period.

#### 4 - Detect data changes

This setting is optional. Incremental refresh of ten days is more efficient than full refresh of five years. However, it's possible to do even better. With the **Detect data changes** option, you can select a date/time column to be used to identify and refresh only those days where the data has changed. This assumes such a column exists in the source system, which is typically for auditing purposes. **This should not be the same column used to partition the data with the RangeStart/RangeEnd parameters.** The maximum value of this column is evaluated for each of the periods in the incremental range. If it has not changed since the last refresh, there is no need to refresh the period. In the example, this could further reduce the days incrementally refreshed from ten to around two.

The current design requires that the column to detect data changes is persisted and cached into memory. The following techniques can be used to reduce cardinality and memory consumption:

- Persist only the maximum value of this column at time of refresh, perhaps using a Power Query function.
- Reduce the precision to a level that is acceptable given your refresh-frequency requirements.
- Define a custom query for detecting data changes by using the XMLA endpoint and avoid persisting the column value altogether. To learn more, see [Custom queries for detect data changes](incremental-refresh-xmla.md#custom-queries-for-detect-data-changes).

In some cases, enabling the Detect data changes option can produce unwanted results. For example, you may want to avoid persisting a last-update column in the in-memory cache, or enable scenarios where a configuration/instruction table is prepared by ETL processes for flagging only those partitions that need to be refreshed. In cases like these, for Premium capacities with the XMLA endpoint enabled, use TMSL and/or TOM to override the detect data changes behavior. To learn more, see [Custom queries for detect data changes](incremental-refresh-xmla.md#custom-queries-for-detect-data-changes).

#### 5 - Only refresh complete days

Let's say your refresh is scheduled to run at 4:00 AM every morning. If data appears in the source system during those four hours between midnight and 4:00 AM, you may not want to account for it. Some business metrics such as barrels per day in the oil and gas industry make no sense with partial days.

Another example is refreshing data from a financial system where data for the previous month is approved on the 12th calendar day of the month. You could set the incremental range to 1 month and schedule the refresh to run on the 12th day of the month. With this option checked it would, for example, refresh January data on February 12th.

Keep in mind, refresh operations in the service run under UTC time. This can determine the effective date and affect complete periods.

## Handling deletes

**Need body**

## Community

Power BI has a vibrant community where BI pros and peers share their expertise in discussions groups, videos, blogs and more. When learning about incremental refresh, be sure to check out these additional resources:

- [Power BI Community](https://community.powerbi.com/)  
- [Search Power BI incremental refresh on Bing](https://www.bing.com/search?q=power+bi+incremental+refresh)

## Next steps

[Configure incremental refresh for datasets](incremental-refreh-configure.md)  
[Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md)  
[Troubleshoot incremental refresh](incremental-refresh-troubleshoot.md)  
[Incremental refresh for dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)
