---
title: Incremental refresh for datasets in Power BI
description: Describes incremental refresh features in Power BI
author: minewiskan
ms.author: owend
ms.reviewer: chwade
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 03/19/2021
LocalizationGroup: 
---
# Incremental refresh for datasets

Incremental refresh extends scheduled refresh operations by providing automated partition creation and management for dataset tables that frequently load new and updated data. For most datasets, this is one or more tables that contain transaction data that changes often and can grow exponentially, like a fact table in a relational or star database schema. By partitioning the table and refreshing only the most recent partition significantly reduces the amount of data that has to be refreshed.

With incremental refresh:

- **Refreshes are faster** - Only the most recent data that has changed needs to be refreshed.
- **Refreshes are more reliable** - Long-running connections to volatile data sources aren't necessary. Queries to source data run faster, reducing potential for network problems to interfere.
- **Resource consumption is reduced** - Less data to refresh reduces overall consumption of memory and other resources on both Power BI resources and source data systems.
- **Enables very large datasets** - Datasets with potentially billions of rows can grow without the need to fully refresh the entire dataset with each refresh operation.

For Power BI Desktop models with incremental refresh configured for one or more tables, when you first publish the model to the service, each table in the dataset has one partition containing all rows in the table. When you perform the first dataset refresh, tables with no incremental refresh policy defined will refresh all rows contained in that table's default single partition. Tables with an incremental refresh policy are partitioned according to the policy and the date/time for each row in the table. The partitions separate data that needs to be refreshed frequently from data that can be refreshed less frequently.

For those tables with an incremental refresh policy, with each refresh operation the data source query returns rows within the refresh period defined by *RangeStart* and *RangeEnd* parameters. Those rows are loaded into the current incremental refresh partition. Rows with a date/time no longer within the refresh period are moved to the partition for the previous period, which is *not* refreshed. Rows with a date/time no longer within the previous partition's period are moved to the partition before that. With each subsequent refresh, partitions become less granular as historical period partitions are merged together.

The beauty of incremental refresh is the service handles all of this for you based on the incremental refresh policy you define. In fact, this process and partitions created from it are not even visible in the service. In most cases, a well defined incremental refresh policy is all that is necessary to significantly improve dataset refresh performance. However, for datasets in a Premium capacity, additional advanced partition and refresh operation scenarios are supported through the XMLA endpoint.

## Requirements

### Supported plans

Incremental refresh is supported for Power BI Premium, Premium per user, and Power BI Pro datasets. To further extend incremental refresh scenarios by using advanced features supported with the XMLA endpoint, datasets in Premium per user workspaces or workspaces assigned to a Premium capacity are required.

### Supported data sources

Incremental refresh works best for structured, relational data sources, like SQL Database and Azure Synapse, but can also work for other data sources. In any case, your data source must support the following:

**Date column** - Your table must contain a date column of Date/Time data type. The RangeStart and RangeEnd parameters filter table data based on the date column. If your table contains a date column of integer surrogate keys in the form of yyyymmdd, you can create a function that converts the date/time value in the parameters to match the integer surrogate key of the data source table. To learn more, see [Convert DateTime to integer](incremental-refresh-configure.md#convert-datetime-to-integer).

**Query folding** - Incremental refresh requires your data source supports *query folding*, which is Power Query's ability to generate a single query expression to retrieve and transform source data. Most data sources that support SQL queries support query folding. Data sources like flat files, blobs, and some web feeds often do not.

When incremental refresh is configured, a Power Query expression that includes a filter based on RangeStart and RangeEnd date/time parameters is executed against the data source. The filter is in-effect a *transformation* included the query that defines a WHERE clause based on the parameters. In cases where the filter is not supported by the data source back-end, it cannot be included in the query expression. The query mashup engine compensates and applies the filter locally, which may require retrieving the full dataset from the data source. This can cause incremental refresh to be very slow, and the process can run out of resources either in the Power BI service or in an on-premises data gateway if used.

Because support for query folding is different for different types of data sources, verification should be performed to ensure the filter logic is included in the source queries. In most cases, Power BI Desktop attempts to perform this verification for you when defining the incremental refresh policy. While SQL based data sources such as SQL, Oracle, and Teradata, this verification is reliable, other data sources however may be unable to verify without tracing queries. If Power BI Desktop is unable to confirm, a warning is shown in the Incremental refresh policy configuration dialog.

:::image type="content" source="media/incremental-refresh-overview/query-folding-warning.png" alt-text="Query folding warning":::

If you see this warning and want to verify the necessary query folding is occurring, use the Power Query Diagnostics feature or trace queries by using a tool supported by the data source, like SQL Profiler. If query folding is not occuring, verify the query being passed to the data source is done so as a single query. If not, it's likely the query includes a transformation that prevents folding.

Before configuring your incremental refresh solution, be sure to thoroughly read and understand [Query folding guidance in Power BI Desktop](../guidance/power-query-folding.md) and [Power Query query folding](/power-query/power-query-folding). These articles will help you determine if your data source supports query folding.

#### Other data source types

By using additional custom query functions and query logic, incremental refresh can be used with other types of data sources provided filters based on RangeStart and RangeEnd can be passed in a single query. For example, Excel workbook files stored in a folder, files in SharePoint, or RSS feeds that don't retain historical data, but just keep updating each day and you want keep existing historical data in the dataset and append new data to it. Keep in mind these are advanced scenarios that will require additional customization and testing beyond what is described here. Be sure to check out the [Community](#community) section later in this article for suggestions on how you can find more info about using incremental refresh for unique scenarios like these.

## Race against time

Regardless of incremental refresh, datasets assigned to shared capacities have a refresh timeout of **two hours**. For Premium capacities, that timeout is **five hours**. Refresh operations are process and memory intensive. A full refresh operation can use as much as double the amount of memory required by the dataset alone because the service maintains a snapshot of the dataset in memory until the refresh operation is complete. Refresh operations can also be process intensive, consuming a significant amount of available CPU resources. Refresh operations must also rely on volatile connections to data sources, and the ability of those data source systems to quickly return query output. The timeout is a safeguard to limit over-consumption of your available resources.

> [!NOTE]
> For datasets in a Premium capacity, advanced refresh operations through the XMLA endpoint have no time limit. To learn more, see [Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md).

Because incremental refresh optimizes refresh operations at the partition level, resource consumption can be significantly reduced. At the same time, even with incremental refresh configured refresh operations are bound by those same two and five hour limits. An effective incremental refresh policy not only reduces the amount of data processed with a refresh operation, but also reduces the amount of historical data retained in your dataset.

Queries can also be limited by the default timeout for the data source. Most relational sources allow overriding timeouts in the M expression. For example, the expression below uses the [SQL Server data-access function](/powerquery-m/sql-database) to set it to 2 hours. Each period defined by the policy ranges submits a query observing the command timeout setting.

```powerquery-m
let
    Source = Sql.Database("myserver.database.windows.net", "AdventureWorks", [CommandTimeout=#duration(0, 2, 0, 0)]),
    dbo_Fact = Source{[Schema="dbo",Item="FactInternetSales"]}[Data],
    #"Filtered Rows" = Table.SelectRows(dbo_Fact, each [OrderDate] >= RangeStart and [OrderDate] < RangeEnd)
in
    #"Filtered Rows"
```

For *very large* datasets in Premium capacities that will likely contain billions of rows, the initial refresh operation can be bootstrapped Bootstrapping allows the service to create table and partition objects for the dataset but not load and process historical data into any of the partitions. Partitions can then be processed individually, sequentially, or in parallel which can both reduce the amount of data returned in a single query, but also bypass the five hour time limit. To learn more, see [Prevent timeouts on initial full refresh](incremental-refresh-xmla.md#prevent-timeouts-on-initial-full-refresh).

### Current date and time

The current date and time is based on the system date at the time of refresh. If scheduled refresh is enabled for the dataset in the service, the specified time zone will be taken into account when determining the current date and time. Both individual and scheduled refreshes through the service observe the time zone if available. For example, a refresh that occurs at 8 PM Pacific Time (US and Canada) with a time zone specified will determine the current date and time based on Pacific Time, not GMT (which would otherwise be the next day). Refresh operations not invoked through the service, such as the [TMSL refresh command](/analysis-services/tmsl/refresh-command-tmsl?view=power-bi-premium-current&preserve-view=true), will not consider the scheduled refresh time zone.

:::image type="content" source="media/incremental-refresh-overview/time-zone2.png" alt-text="Time zone":::

## Configuring incremental refresh

We'll go over the basic concepts of configuring incremental refresh here. When you're ready for more detailed step-by-step instructions, be sure to check out [Configure incremental refresh for datasets](incremental-refresh-configure.md).

Configuring incremental refresh for new data models is done in Power BI Desktop. For most models, only a few tasks are required. Keep in mind, once you publish your model to the service, you can't download it back or publish it again from Power BI Desktop. If you're publishing to a Premium capacity, subsequent dataset metadata schema changes can be made through the XMLA endpoint by using TMSL or with the open-source ALM Toolkit.

### Create parameters

When configuring incremental refresh in Power BI Desktop, you first create two Power Query date/time parameters with the reserved, case-sensitive names **RangeStart** and **RangeEnd**. These parameters, defined in the Manage Parameters dialog in Power Query Editor are initially used to filter the data loaded into the Power BI Desktop model table to include only those rows with a date/time within that period. After the model is published to the service, RangeStart and RangeEnd are overridden automatically by the service to query data defined by the refresh period specified in the incremental refresh policy settings.

For example, our FactInternetSales data source table averages 100k new rows per day. To limit the number of rows initially loaded into the model in Power BI Desktop, we specify a two day period between RangeStart and RangeEnd. After creating filters based on the parameters and applying changes, 2 days of data, roughly 200k rows is loaded into our model. In our incremental refresh policy, we specify a refresh period of 7 days. With a refresh operation, the service overrides the RangeStart and RangeEnd parameters to create a query for rows with a date/time within a 7 day period, beginning and ending dependent on the current  date and time. With this type of policy, we can expect our FactInternetSales dataset table in the service to refresh and process roughly 700k rows with each refresh operation. If defining policies for more than one table, the same RangeStart and RangeEnd parameters can be used even if a different refresh period is defined for each table.

:::image type="content" source="media/incremental-refresh-overview/manage-parameters-small.png" alt-text="Manage Parameters dialogr":::

### Filter data

With RangeStart and RangeEnd parameters defined, you then apply custom Date filters on your table's date column. The filters you apply select a subset of data that will be loaded into the model in Power BI Desktop.

:::image type="content" source="media/incremental-refresh-overview/custom-filter.png" alt-text="Custom filter":::

### Define policy

After filters have been applied, you define an incremental refresh policy for the table. After the model is published to the service, the policy is used by the service to create and manage table partitions and perform refresh operations.

To define the policy, there are three required settings and two optional settings:

:::image type="content" source="media/incremental-refresh-overview/pbid-incremental-refresh-dialog.png" alt-text="Define policy dialog":::

#### 1 - Table

The Table listbox defaults to the table you select in Data view. Enable incremental refresh for the table with the slider. If the Power Query expression for the table doesn't include a filter based on the RangeStart and RangeEnd parameters, the toggle is disabled.

#### 2 - Store rows in the last

This **required** setting determines the period in which rows in that period are included in the dataset table, plus rows for the current period up to the current date and time. For example, if you specify 5 years, your table will store the last five whole years of historical data in year partitions, plus rows for the current year up to the most recent refresh. For datasets on Premium capacities, backdated historical partitions can be selectively refreshed at a granularity determined by this setting.

#### 3 - Refresh rows in the last

This **required** setting determines the incremental refresh period in which all rows with a date/time in that period are included in the latest partition and refreshed. For example, if you specify 7 days, all rows with a date/time in the last seven days up to the current refresh operation time are refreshed. The majority of system resources used during a refresh operation are consumed for this period. Be sure to specify a period in which the most important new and updated rows are within this period.

#### 4 - Detect data changes

This setting is **optional**. Incremental refresh of ten days is more efficient than a full refresh of five years. However, refreshes can be even more selective. With the Detect data changes option, you can select a date/time column used to identify and refresh only those days where the data has changed. This assumes such a column exists in the data source, which is typically for auditing purposes. This should *not* be the same column used to partition the data with the RangeStart and RangeEnd parameters. The maximum value of this column is evaluated for each of the periods in the incremental range. If it hasn't changed since the last refresh, there's no need to refresh the period. In this example, this could potentially further reduce the days incrementally refreshed from ten to around two.

The current design requires that the column to detect data changes is persisted and cached into memory. The following techniques can be used to reduce cardinality and memory consumption:

- Persist only the maximum value of the column at time of refresh, perhaps by using a Power Query function.
- Reduce the precision to a acceptable level, given your refresh-frequency requirements.
- Define a custom query for detecting data changes by using the XMLA endpoint and avoid persisting the column value altogether. To learn more, see [Custom queries for detect data changes](incremental-refresh-xmla.md#custom-queries-for-detect-data-changes).

In some cases, enabling the Detect data changes option can produce unwanted results. For example, you may want to avoid persisting a last-update column in the in-memory cache, or enable scenarios where a configuration/instruction table is prepared by ETL processes for flagging only those partitions that need to be refreshed. In cases like these, for Premium capacities with the XMLA endpoint enabled, use TMSL and/or TOM to override the detect data changes behavior. To learn more, see [Custom queries for detect data changes](incremental-refresh-xmla.md#custom-queries-for-detect-data-changes).

#### 5 - Only refresh complete days

This setting is **optional**. Let's say your refresh is scheduled to run at 4:00 AM every morning. If new rows of data appear in the data source table during those four hours between midnight and 4:00 AM, you may not want to account for them. Some business metrics like barrels per day in the oil and gas industry make no sense with partial days. Another example is refreshing data from a financial system where data for the previous month is approved on the 12th calendar day of the month. You could set the refresh period to 1 month and schedule the refresh to run on the 12th day of the month. With this option checked, it would for example refresh January data on February 12th.

Keep in mind, refresh operations in the service run under UTC time. This can determine the effective date and affect complete periods.

## Publish

After configuring an incremental refresh policy, you publish the model to the service. When publishing is complete, you can perform the initial refresh operation on the *dataset*.

> [!IMPORTANT]
> When published to the service from Power BI Desktop, you cannot download the PBIX back.

## Refresh

After publishing to the service, you perform an initial refresh operation on the dataset. This should be an individual (manual) refresh so you can monitor progress. The initial refresh operation can take quite a while to complete. Partitions must be created, historical data loaded, objects such as relationships and hierarchies are built or rebuilt, and calculated objects are recalculated.

Subsequent refresh operations, either individual or scheduled will be much faster because only the most recent partition is refreshed. Other processing operations must still occur, like moving data in and out of partitions and recalculation, but it will usually only take only a small fraction of time compared to that first refresh.

## Community

Power BI has a vibrant community where BI pros and peers share expertise in discussions groups, videos, blogs and more. When learning about incremental refresh, be sure to check out these additional resources:

- [Power BI Community](https://community.powerbi.com/)  
- [Search "Power BI incremental refresh" on Bing](https://www.bing.com/search?q=power+bi+incremental+refresh)
- [Search "Incremental refresh for files" on Bing](https://www.bing.com/search?q=incremental+refresh+for+files)
- [Search "Keep existing data using incremental refresh" on Bing](https://www.bing.com/search?q=keep+existing+data+using+incremental+refresh)

## Next steps

[Configure incremental refresh for datasets](incremental-refresh-configure.md)  
[Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md)  
[Troubleshoot incremental refresh](incremental-refresh-troubleshoot.md)  
[Incremental refresh for dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)
