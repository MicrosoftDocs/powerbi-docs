---
title: Incremental refresh for datasets and real-time data in Power BI
description: Describes incremental refresh features in Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: chwade
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 12/16/2021
ms.custom: contperf-fy21q4
LocalizationGroup: 
---
# Incremental refresh and real-time data for datasets

Incremental refresh extends scheduled refresh operations by providing automated partition creation and management for dataset tables that frequently load new and updated data. For most datasets, this is one or more tables that contain transaction data that changes often and can grow exponentially, like a fact table in a relational or star database schema. An incremental refresh policy to partition the table, refreshing only the most recent import partition(s), and optionally leveraging an additional DirectQuery partition for real-time data can significantly reduce the amount of data that has to be refreshed while at the same time ensuring that even the latest changes at the data source are included in the query results.

With incremental refresh and real-time data:

- **Fewer refresh cycles for fast-changing data** – DirectQuery mode gets the latest data updates as queries are processed without requiring a high refresh cadence. 
- **Refreshes are faster** - Only the most recent data that has changed needs to be refreshed.
- **Refreshes are more reliable** - Long-running connections to volatile data sources aren't necessary. Queries to source data run faster, reducing potential for network problems to interfere.
- **Resource consumption is reduced** - Less data to refresh reduces overall consumption of memory and other resources in both Power BI and data source systems.
- **Enables large datasets** - Datasets with potentially billions of rows can grow without the need to fully refresh the entire dataset with each refresh operation.
- **Easy setup** - Incremental refresh *policies* are defined in Power BI Desktop with just a few tasks. When published, the service automatically applies those policies with each refresh.  

When you publish a Power BI Desktop model to the service, each table in the new dataset has a single partition. That single partition contains all rows for that table. If the table is large, say with tens of millions of rows or even more, a refresh for that table can take a long time and consume an excessive amount of resources.

With incremental refresh, the service dynamically partitions and separates data that needs to be refreshed frequently from data that can be refreshed less frequently. Table data is filtered by using Power Query date/time parameters with the reserved, case-sensitive names *RangeStart* and *RangeEnd*. When initially configuring incremental refresh in Power BI Desktop, the parameters are used to filter only a small period of data to be loaded into the model. When published to the service, with the first refresh operation, the service creates incremental refresh and historical partitions and optionally a real-time DirectQuery partition based on incremental refresh policy settings, and then overrides the parameter values to filter and query data for each partition based on date/time values for each row.

With each subsequent refresh, the query filters return only those rows within the refresh period dynamically defined by the parameters. Those rows with a date/time within the refresh period are refreshed. Rows with a date/time no longer within the refresh period then become part of the historical period, which is not refreshed. If a real-time DirectQuery partition is included in the incremental refresh policy, its filter is also updated so that it picks up any changes that occurred after the refresh period. Both the refresh and historical periods are rolled forward. As new incremental refresh partitions are created, refresh partitions no longer in the refresh period become historical partitions. Over time, historical partitions become less granular as they are merged together. When a historical partition is no longer in the historical period defined by the policy, it is removed from the dataset entirely. This is known as a *rolling window pattern*.

:::image type="content" source="media/incremental-refresh-overview/incremental-refresh-rolling-window-pattern.png" alt-text="Graphic representing a rolling window pattern.":::

The beauty of incremental refresh is the service handles all of this for you based on the incremental refresh policies you define. In fact, the process and partitions created from it are not even visible in the service. In most cases, a well-defined incremental refresh policy is all that is necessary to significantly improve dataset refresh performance. However, the real-time DirectQuery partition is only supported for datasets in Premium capacities, Power BI Premium also enables more advanced partition and refresh scenarios through the XMLA endpoint.

## Requirements

### Supported plans

Incremental refresh is supported for Power BI Premium, Premium per user, Power BI Pro, and Power BI Embedded datasets.

Getting the latest data in real time with DirectQuery is only supported for Power BI Premium, Premium per user, and Power BI Embedded datasets.

### Supported data sources

Incremental refresh and real-time data works best for structured, relational data sources, like SQL Database and Azure Synapse, but can also work for other data sources. In any case, your data source must support the following:

**Date column** - The table must contain a date column of date/time or integer data type. The RangeStart and RangeEnd parameters (which must be date/time data type) filter table data based on the date column. For date columns of integer surrogate keys in the form of `yyyymmdd`, you can create a function that converts the date/time value in the RangeStart and RangeEnd parameters to match the integer surrogate keys of the date column. To learn more, see [Configure incremental refresh - Convert DateTime to integer](incremental-refresh-configure.md#convert-datetime-to-integer).

**Query folding** - Incremental refresh is designed for data sources that support *query folding*, which is Power Query's ability to generate a single query expression to retrieve and transform source data, especially if getting the latest data in real time with DirectQuery. Most data sources that support SQL queries support query folding. Data sources like flat files, blobs, and some web feeds often do not.

When incremental refresh is configured, a Power Query expression that includes a date/time filter based on the RangeStart and RangeEnd parameters is executed against the data source. The filter is in effect a *transformation* included in the query that defines a WHERE clause based on the parameters. In cases where the filter is not supported by the data source, it cannot be included in the query expression. If the incremental refresh policy includes getting real-time data with DirectQuery, non-folding transformations can't be used. If it’s a pure import mode policy without real-time data, the query mashup engine might compensate and apply the filter locally, which requires retrieving all rows for the table from the data source. This can cause incremental refresh to be slow, and the process can run out of resources either in the Power BI service or in an On-premises Data Gateway - effectively defeating the purpose of incremental refresh.

Because support for query folding is different for different types of data sources, verification should be performed to ensure the filter logic is included in the queries being executed against the data source. In most cases, Power BI Desktop attempts to perform this verification for you when defining the incremental refresh policy. For SQL based data sources such as SQL Database, Azure Synapse, Oracle, and Teradata, this verification is reliable. However, other data sources may be unable to verify without tracing the queries. If Power BI Desktop is unable to confirm, a warning is shown in the Incremental refresh policy configuration dialog.

:::image type="content" source="media/incremental-refresh-overview/query-folding-warning.png" alt-text="Query folding warning":::

If you see this warning and want to verify the necessary query folding is occurring, use the Power Query Diagnostics feature or trace queries by using a tool supported by the data source, like SQL Profiler. If query folding is not occurring, verify the filter logic is included in the query being passed to the data source. If not, it's likely the query includes a transformation that prevents folding.

Before configuring your incremental refresh solution, be sure to thoroughly read and understand [Query folding guidance in Power BI Desktop](../guidance/power-query-folding.md) and [Power Query query folding](/power-query/power-query-folding). These articles can help you determine if your data source and queries support query folding.

#### Other data source types

By using additional custom query functions and query logic, incremental refresh can be used with other types of data sources provided filters based on RangeStart and RangeEnd can be passed in a single query. For example, Excel workbook files stored in a folder, files in SharePoint, or RSS feeds. Keep in mind these are advanced scenarios that require additional customization and testing beyond what is described here. Be sure to check the [Community](#community) section later in this article for suggestions on how you can find more info about using incremental refresh for unique scenarios like these.

## Time limits

Regardless of incremental refresh, Power BI Pro datasets have a refresh time limit of **two hours** and do not support getting real-time data with DirectQuery. For datasets in a Premium capacity, the time limit is **five hours**. Refresh operations are process and memory intensive. A full refresh operation can use as much as double the amount of memory required by the dataset alone because the service maintains a snapshot of the dataset in memory until the refresh operation is complete. Refresh operations can also be process intensive, consuming a significant amount of available CPU resources. Refresh operations must also rely on volatile connections to data sources, and the ability of those data source systems to quickly return query output. The time limit is a safeguard to limit over-consumption of your available resources.

> [!NOTE]
> With Premium capacities, refresh operations performed through the XMLA endpoint have no time limit. To learn more, see [**Advanced incremental refresh with the XMLA endpoint**](incremental-refresh-xmla.md).

Because incremental refresh optimizes refresh operations at the partition level in the dataset, resource consumption can be significantly reduced. At the same time, even with incremental refresh, unless through the XMLA endpoint, refresh operations are bound by those same two and five-hour limits. An effective incremental refresh policy not only reduces the amount of data processed with a refresh operation, but also reduces the amount of unnecessary historical data stored in your dataset.

Queries can also be limited by a default time limit for the data source. Most relational data sources allow overriding time limits in the Power Query M expression. For example, the expression below uses the [SQL Server data-access function](/powerquery-m/sql-database) to set CommandTimeout to 2 hours. Each period defined by the policy ranges submits a query observing the command timeout setting.

```powerquery-m
let
    Source = Sql.Database("myserver.database.windows.net", "AdventureWorks", [CommandTimeout=#duration(0, 2, 0, 0)]),
    dbo_Fact = Source{[Schema="dbo",Item="FactInternetSales"]}[Data],
    #"Filtered Rows" = Table.SelectRows(dbo_Fact, each [OrderDate] >= RangeStart and [OrderDate] < RangeEnd)
in
    #"Filtered Rows"
```

For *very large* datasets in Premium capacities that will likely contain billions of rows, the initial refresh operation can be bootstrapped. Bootstrapping allows the service to create table and partition objects for the dataset, but not load and process data into any of the partitions. By using SQL Server Management Studio, partitions can then be processed individually, sequentially, or in parallel that can both reduce the amount of data returned in a single query, but also bypass the five-hour time limit. To learn more, see [Advanced incremental refresh - Prevent timeouts on initial full refresh](incremental-refresh-xmla.md#prevent-timeouts-on-initial-full-refresh).

### Current date and time

The current date and time is based on the system date at the time of refresh. If scheduled refresh is enabled for the dataset in the service, the specified time zone will be taken into account when determining the current date and time. Both individual and scheduled refreshes through the service observe the time zone if available. For example, a refresh that occurs at 8 PM Pacific Time (US and Canada) with a time zone specified will determine the current date and time based on Pacific Time, not GMT (which would otherwise be the next day). Refresh operations not invoked through the service, such as the [TMSL refresh command](/analysis-services/tmsl/refresh-command-tmsl?view=power-bi-premium-current&preserve-view=true), will not consider the scheduled refresh time zone.

:::image type="content" source="media/incremental-refresh-overview/time-zone2.png" alt-text="Time zone":::

## Configuring incremental refresh and real-time data

We'll go over important concepts of configuring incremental refresh and real-time data here. When you're ready for more detailed step-by-step instructions, be sure to check out [Configure incremental refresh and real-time data for datasets](incremental-refresh-configure.md).

Configuring incremental refresh is done in Power BI Desktop. For most models, only a few tasks are required. However, keep the following in mind:

- When published to the service, you can't publish the same model again from Power BI Desktop. Republishing would remove any existing partitions and data already in the dataset. If you're publishing to a Premium capacity, subsequent metadata schema changes can be made with tools such as the open-source ALM Toolkit or by using Tabular Model Scripting Language (TMSL). To learn more, see [Advanced incremental refresh - Metadata-only deployment](incremental-refresh-xmla.md#metadata-only-deployment).
- When published to the service, you can't download the dataset back as a PBIX to Power BI Desktop. Because datasets in the service can grow so large, it's impractical to download back and open on a typical desktop computer.
- When getting real-time data with DirectQuery, you can't publish the dataset to a non-Premium workspace. Incremental refresh with real-time data is only supported with Power BI Premium.

### Create parameters

When configuring incremental refresh in Power BI Desktop, you first create two Power Query date/time parameters with the reserved, case-sensitive names **RangeStart** and **RangeEnd**. These parameters, defined in the Manage Parameters dialog in Power Query Editor are initially used to filter the data loaded into the Power BI Desktop model table to include only those rows with a date/time within that period. After the model is published to the service, RangeStart and RangeEnd are overridden automatically by the service to query data defined by the refresh period specified in the incremental refresh policy settings.

For example, our FactInternetSales data source table averages 10k new rows per day. To limit the number of rows initially loaded into the model in Power BI Desktop, we specify a two-day period between RangeStart and RangeEnd.

:::image type="content" source="media/incremental-refresh-overview/manage-parameters-small.png" alt-text="Manage Parameters dialogue":::

### Filter data

With RangeStart and RangeEnd parameters defined, you then apply custom Date filters on your table's date column. The filters you apply select a subset of data that will be loaded into the model when you click **Apply**.

:::image type="content" source="media/incremental-refresh-overview/custom-filter.png" alt-text="Custom filter":::

Using our FactInternetSales example, after creating filters based on the parameters and applying steps, two days of data, roughly 20k rows is loaded into our model.

### Define policy

After filters have been applied and a subset of data has been loaded into the model, you then define an incremental refresh policy for the table. After the model is published to the service, the policy is used by the service to create and manage table partitions and perform refresh operations. To define the policy, you will use the **Incremental refresh and real-time data** dialog box to specify both required settings and optional settings.

:::image type="content" source="media/incremental-refresh-overview/incremental-refresh-dialog-02.png" alt-text="Define policy dialog":::


## Publish

After configuring the incremental refresh policy, you publish the model to the service. When publishing is complete, you can perform the initial refresh operation on the *dataset*.

> [!NOTE]
> Datasets with an incremental refresh policy to get the latest data in real time with DirectQuery can only be published to a Premium workspace.

For datasets published to workspaces assigned to Premium capacities, if you think the dataset will grow beyond 1 GB or more, you can improve refresh operation performance and ensure the dataset doesn't max out size limits by enabling Large dataset storage format *before* performing the first refresh operation in the service. To learn more, see [Large datasets in Power BI Premium](../admin/service-premium-large-models.md).

> [!IMPORTANT]
> After being published to the service, you cannot download the PBIX back.

## Refresh

After publishing to the service, you perform an initial refresh operation on the dataset. This should be an individual (manual) refresh so you can monitor progress. The initial refresh operation can take quite a while to complete. Partitions must be created, historical data loaded, objects such as relationships and hierarchies are built or rebuilt, and calculated objects are recalculated.

Subsequent refresh operations, either individual or scheduled are much faster because only the incremental refresh partition(s) is refreshed. Other processing operations must still occur, like merging partitions and recalculation, but it usually takes only a small fraction of time compared to the initial refresh.

## Automatic report refresh
For reports using a dataset with an incremental refresh policy to get the latest data in real time with DirectQuery, it is a good idea to enable automatic page refresh at a fixed interval or based on change detection so that the reports include the latest data without delay. To learn more, see [Automatic page refresh in Power BI](../create-reports/desktop-automatic-page-refresh.md).


## Advanced incremental refresh

If your dataset is on a Premium capacity with the XMLA endpoint enabled, incremental refresh can be further extended for advanced scenarios. For example, you can use SQL Server Management Studio to view and manage partitions, bootstrap the initial refresh operation, or refresh backdated historical partitions. To learn more, see [Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md).

## Community

Power BI has a vibrant community where MVPs, BI pros, and peers share expertise in discussion groups, videos, blogs and more. When learning about incremental refresh, be sure to check out these additional resources:

- [Power BI Community](https://community.powerbi.com/)  
- [Search "Power BI incremental refresh" on Bing](https://www.bing.com/search?q=power+bi+incremental+refresh)
- [Search "Incremental refresh for files" on Bing](https://www.bing.com/search?q=incremental+refresh+for+files)
- [Search "Keep existing data using incremental refresh" on Bing](https://www.bing.com/search?q=keep+existing+data+using+incremental+refresh)

## Next steps

[Configure incremental refresh for datasets](incremental-refresh-configure.md)  
[Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md)  
[Troubleshoot incremental refresh](incremental-refresh-troubleshoot.md)  
[Incremental refresh for dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)
