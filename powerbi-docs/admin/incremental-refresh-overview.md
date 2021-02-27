---
title: Incremental refresh for datasets in Power BI
description: Describes incremental refresh features in Power BI
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: 
ms.topic: how-to
ms.date: 02/24/2021
LocalizationGroup: 
---
# Incremental refresh for datasets

Incremental refresh extends scheduled refresh operations by providing automated partition creation and management for tables that frequently import new and updated data. For most datasets, this is one or more tables that contain transaction data that changes often and can grow exponentially, like a fact table in a relational or star database schema. By partitioning the table and refreshing only the most recent partition significantly reduces the amount of data that has to be refreshed.

With incremental refresh:

> [!div class="checklist"]
> * **Refreshes are faster** - Only the most recent data that has changed needs to be refreshed.
> * **Refreshes are more reliable** - Long-running connections to volatile data sources aren't necessary. Queries to source data run faster, reducing potential for network problems to interfere.
> * **Resource consumption is reduced** - Less data to refresh reduces overall consumption of memory and other resources on both Power BI resources and source data systems.

Partitions divide portions of data you need to refresh frequently from data that can be refreshed less frequently. Partitions work by dividing a table into logical partition objects. Individual partitions, each containing a unique segment or period of data, can then be refreshed individually, sequentially, or in parallel independent of other partitions, or excluded from refresh operations altogether.

For Power BI Desktop models with incremental refresh configured, when you first publish the model to the service, each table in the dataset has one partition containing all rows in the table. When you perform the first dataset refresh, tables with no incremental refresh policy defined will refresh all rows contained in that table's default single partition. Tables with an incremental refresh policy defined are partitioned according to the policy and the date/time for each row in the table.

With each refresh operation, a data source query is made to return rows within the refresh period defined by RangeStart and RangeEnd parameters. If no rows have a date/time within the refresh period. Rows with a date/time no longer within the refresh period are moved to the partition for the previous period, which is *not* refreshed. Rows with a date/time no longer within the previous partition's period are moved to the partition before that, and so on. With each subsequent refresh, partitions become less granular as periods are combined. For example, after a full month is complete, all day partitions are combined into a single month historical partition. After a full three months is complete, those three month partitions are rolled into a single quarter partition, and so on. This is known as a rolling window pattern.

The beauty of incremental refresh is the service handles all of this for you, based on the incremental refresh policy you define. In fact, this process and any partitions created from it are not even visible in the service. In most cases, a well defined incremental refresh policy is all that is necessary to significantly improve dataset refresh performance. That said, for datasets in a Premium capacity, additional advanced partition and refresh operation scenarios are supported for through the XMLA endpoint.

## Supported plans

Incremental refresh is supported for Power BI Premium, Premium per user, and Power BI Pro shared subscriptions and datasets. To further extend incremental refresh scenarios by using advanced features supported with the XMLA endpoint, Premium per user workspaces or workspaces assigned to a Premium capacity are required.

## Data sources

Incremental refresh works best for structured data sources, like SQL Database and Azure Synapse. Your data source should support *query folding*. We'll go into more detail about query folding later, but in short, query folding is the ability for a single query statement to retrieve and transform data from the data source. Most structured data sources support query folding.

While not recommended, by using additional custom query functions and query logic, incremental refresh can be used with other types of data sources that don't support query folding. For example, Excel workbook files stored in a folder, files or lists in SharePoint, or scenarios where a data source like an OData or RSS feed that doesn't retain historical data, but just keeps updating each day, and you want keep existing historical data in the dataset and append new data to it. Keep in mind these are advanced scenarios that will require additional customization and testing beyond what is described here. Be sure to check out the [Community](#community) section later in this article for suggestions on how you can find more info about using incremental refresh for unique scenarios like these.

### Prerequisites

**Date column** - Your model table must contain a date column of Date/Time data type. The RangeStart and RangeEnd parameters filter table data based on the date column. If your table contains a date column of integer surrogate keys in the form of yyyymmdd, you can create a function that converts the date/time value in the parameters to match the integer surrogate key of the data source table. To learn more, see [Convert DateTime to integer](incremental-refresh-configure.md#convert-datetime-to-integer).

**Query folding** - While not required, incremental refresh works best for data sources that support *query folding*, which is Power Query's ability to generate a single query statement to retrieve and transform data source data. Most data sources that support SQL queries support query folding. However, data sources like flat files, blobs, and web feeds typically do not. In cases where the filter is not supported by the data source back-end, it cannot be pushed down. In such cases, the query mashup engine compensates and applies the filter locally, which may require retrieving the full dataset from the data source. This can cause incremental refresh to be very slow, and the process can run out of resources either in the Power BI service or in an on-premises data gateway if used.

Given the various levels of query folding support for different types of data sources, verification should be performed to ensure the filter logic is included in the source queries. In most cases, Power BI Desktop attempts to perform this verification for you when defining the incremental refresh policy. While SQL based data sources such as SQL, Oracle, and Teradata, verification is reliable, other data sources however may be unable to verify without tracing queries. If Power BI Desktop is unable to confirm, a warning is shown in the Incremental refresh policy configuration dialog.

 ![Query folding warning](media/incremental-refresh-overview/query-folding-warning.png)

If you see this warning and want to verify the necessary query folding is occurring, use the Power Query Diagnostics feature or trace queries received by the data source database by using a tool like SQL Profiler supported by the data source.

### Race against time

Regardless of incremental refresh, datasets assigned to shared capacities have a refresh timeout of **two hours**. For Premium capacities, that timeout is **five hours**. Refresh operations are process and memory intensive. A full refresh operation can use as much as double the amount of memory required by the dataset because the service maintains a snapshot of the dataset in memory until the refresh operation is complete. Refresh operations can also be process intensive, consuming a significant amount of available CPU resources. Refresh operations must also rely on volatile connections to data sources, and the ability of those data source systems to quickly return query output. The timeout is a safeguard to limit over-consumption of your available resources.

> [!NOTE]
> For datasets in a Premium capacity, advanced refresh operations through the XMLA endpoint have no time limit. To learn more, see [Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md).

Because incremental refresh optimizes refresh operations at the partition level, resource consumption can be significantly reduced. At the same time, even with incremental refresh configured, refresh operations are bound by those same time two and five hour limits. An effective incremental refresh policy not only reduces the amount of historical data retained in your dataset, but also reduces the amount of data processed with a refresh operation.

Think carefully about how much historical data you really need to retain. While incremental refresh will automatically create and manage partitions for historical data, too much historical data will unnecessarily consume memory. For datasets in Premium capacities, historical partitions can be viewed and managed through the XMLA endpoint, but here too, having too much historical data can create an unnecessary number of partitions for data that just doesn't need to be retained. The amount of historical data that will be retained is determined by a a time period, either days, months, quarters, or years. You specify this period when defining the incremental refresh policy.

Most important is determining the period in which rows within a period, either days, months, quarters, or years are refreshed. It is this period that defines the partition that is refreshed

## Configuring incremental refresh

We'll go over the basics of configuring incremental refresh here. When you're ready for more detailed step-by-step instructions, be sure to check out [Configure incremental refresh for datasets](incremental-refresh-configure.md).

Configuring incremental refresh for new data models is done in Power BI Desktop. For most models, only a few tasks are required. But keep in mind, once you publish your model to the service, you can't download it back or publish it again from Power BI Desktop. If you're publishing to a Premium capacity, subsequent dataset metadata schema changes can be made through the XMLA endpoint by using the open-source ALM Toolkit.

### RangeStart and RangeEnd parameters

When configuring incremental refresh in Power BI Desktop, you first create two Power Query date/time parameters with the reserved, case-sensitive names **RangeStart** and **RangeEnd**. These parameters, defined in the Manage Parameters dialog in Power Query Editor are initially used to filter the data loaded into the Power BI Desktop *model* table to include only those rows with a date/time within that period. After the model is published to the service, RangeStart and RangeEnd are overridden automatically by the service to dynamically partition *dataset* table data into a refresh period specified in the incremental refresh policy settings. 

For example, our FactInternetSales data source table averages 1m new rows per day. To limit the number of rows initially loaded into the model, we specify a two day period between RangeStart and RangeEnd. After creating filters based on the parameters and applying changes, 2 days of data, roughly 2m rows is loaded into our model. In our incremental refresh policy, we specify a refresh period of 7 days. With a refresh operation, the service overrides the RangeStart and RangeEnd parameters to create a query for rows with a date/time within a 7 day period, beginning and ending dependent on the current date/time. With this type of policy, we can expect our FactInternetSales dataset table in the service to refresh and process roughly 7m rows with each refresh operation.

If defining policies for more than one table, the same parameters can be used.

![Manage Parameters dialog](media/incremental-refresh-overview/manage-parameters-small.png)

### Filter data

With RangeStart and RangeEnd parameters defined, you then apply custom Date filters on your table's date column. The filters you apply select a subset of data that will be imported into the model. 

![Custom filter](media/incremental-refresh-overview/custom-filter.png)

### Define policy

After filters have been applied, you define an incremental refresh policy for the table. After the model is published to the service, the policy is used by the service to create and manage table partitions and load historical data.

To define the policy, there are three required settings and two optional settings:

![Define policy dialog](media/incremental-refresh-overview/pbid-incremental-refresh-dialog.png)

#### 1 - Table

The Table listbox defaults to the table you selected. Enable incremental refresh for the table with the slider.  

#### 2 - Store rows in the last

This **required** setting determines the period in which *all* rows in that period are included in the dataset table. For example, if you specify 5 years, your table will store the last five full years of data up to the most recent refresh of a complete period. Rows older than this period are deleted from the dataset in the next refresh. This setting effectively determines the entire range of data available in the dataset table by row date/time.

#### 3 - Refresh rows in the last

This setting is **required**. This setting determines the time period in which all rows with a date/time in that period are included in the latest partition and refreshed. For example, if you specify 7 days, all rows with a date/time in the last seven days up to the current refresh operation time are refreshed. Rows older than seven days are moved to the previous partition and excluded from the refresh. The majority of system resources used during a refresh operation are consumed for this period. Be sure to specify a period in which the most important new and updated rows at the data source are within this period. It's important this not be such a long period that system resources are used unnecessarily refreshing rows that have not been updated or added within the period.

#### 4 - Detect data changes

This setting is optional. Incremental refresh of ten days is more efficient than a full refresh of five years. However, it's possible to do even better. With the **Detect data changes** option, you can select a date/time column used to identify and refresh only those days where the data has changed. This assumes such a column exists in the data source, which is typically for auditing purposes. This should *not* be the same column used to partition the data with the RangeStart/RangeEnd parameters. The maximum value of this column is evaluated for each of the periods in the incremental range. If it hasn't changed since the last refresh, there's no need to refresh the period. In this example, this could potentially further reduce the days incrementally refreshed from ten to around two.

The current design requires that the column to detect data changes is persisted and cached into memory. The following techniques can be used to reduce cardinality and memory consumption:

- Persist only the maximum value of the column at time of refresh, perhaps by using a Power Query function.
- Reduce the precision to a acceptable level, given your refresh-frequency requirements.
- Define a custom query for detecting data changes by using the XMLA endpoint and avoid persisting the column value altogether. To learn more, see [Custom queries for detect data changes](incremental-refresh-xmla.md#custom-queries-for-detect-data-changes).

In some cases, enabling the Detect data changes option can produce unwanted results. For example, you may want to avoid persisting a last-update column in the in-memory cache, or enable scenarios where a configuration/instruction table is prepared by ETL processes for flagging only those partitions that need to be refreshed. In cases like these, for Premium capacities with the XMLA endpoint enabled, use TMSL and/or TOM to override the detect data changes behavior. To learn more, see [Custom queries for detect data changes](incremental-refresh-xmla.md#custom-queries-for-detect-data-changes).

#### 5 - Only refresh complete days

This setting is optional. Let's say your refresh is scheduled to run at 4:00 AM every morning. If new rows of data appear in the data source table during those four hours between midnight and 4:00 AM, you may not want to account for it. Some business metrics like barrels per day in the oil and gas industry make no sense with partial days. Another example is refreshing data from a financial system where data for the previous month is approved on the 12th calendar day of the month. You could set the incremental range to 1 month and schedule the refresh to run on the 12th day of the month. With this option checked, it would for example refresh January data on February 12th.

Keep in mind, refresh operations in the service run under UTC time. This can determine the effective date and affect complete periods.

### Apply changes

After creating parameters, filtering the data, and defining an incremental refresh policy, you apply your changes in Power Query Editor. Power BI Desktop connects to your data source, queries the data source table for rows with a date/time within the RangeStart and RangeEnd parameters and loads those rows into the data model.

## Community

Power BI has a vibrant community where BI pros and peers share their expertise in discussions groups, videos, blogs and more. When learning about incremental refresh, be sure to check out these additional resources:

- [Power BI Community](https://community.powerbi.com/)  
- [Search "Power BI incremental refresh" on Bing](https://www.bing.com/search?q=power+bi+incremental+refresh)
- [Search for "Incremental refresh for files" on Bing](https://www.bing.com/search?q=incremental+refresh+for+files)

## Next steps

[Configure incremental refresh for datasets](incremental-refresh-configure.md)  
[Advanced incremental refresh with the XMLA endpoint](incremental-refresh-xmla.md)  
[Troubleshoot incremental refresh](incremental-refresh-troubleshoot.md)  
[Incremental refresh for dataflows](../transform-model/dataflows/dataflows-premium-features.md#incremental-refresh)
