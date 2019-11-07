---
title: Data reduction techniques for Import modeling
description: Understand different techniques to help reduce the data loaded into Import models.
author: peter-myers
manager: asaxton
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 08/05/2019
ms.author: v-pemyer
---
# Data reduction techniques for Import modeling

This article targets Power BI Desktop data modelers developing Import models. It describes different techniques to help reduce the data loaded into Import models.

Import models are loaded with data that is compressed and optimized and then stored to disk by the VertiPaq storage engine. When source data is loaded into memory, it is possible to see 10x compression, and so it is reasonable to expect that 10 GB of source data can compress to about 1 GB in size. Further, when persisted to disk an additional 20% reduction can be achieved.

Despite the efficiencies achieved by the VertiPaq storage engine, it is important that you strive to minimize the data that is to be loaded into your models. This is especially true for large models, or models that you anticipate will grow to become large over time. Four compelling reasons include:

- Larger model sizes may not be supported by your capacity. Shared capacity can host models up to 1 GB in size, while Premium capacities can host models up to 13 GB in size. For further information, read the [Power BI Premium support for large datasets](../service-premium-large-datasets.md) article.
- Smaller model sizes reduce contention for capacity resources, in particular memory. This allows more models to be concurrently loaded for longer periods of time, resulting in lower eviction rates. For further information, read the [How Capacities Function](../whitepaper-powerbi-premium-deployment.md#how-capacities-function) topic of the [Power BI Premium Deployment](../whitepaper-powerbi-premium-deployment.md) white paper.
- Smaller models achieve faster data refresh, resulting in lower latency reporting, higher dataset refresh throughput, and less pressure on source system and capacity resources.
- Smaller table row counts can result in faster calculation evaluations, which can deliver better overall query performance.

There are seven different data reduction techniques covered in this article. These include:

- [Remove unnecessary columns](#remove-unnecessary-columns)
- [Remove unnecessary rows](#remove-unnecessary-rows)
- [Group by and summarize](#group-by-and-summarize)
- [Optimize column data types](#optimize-column-data-types)
- [Preference for custom columns](#preference-for-custom-columns)
- [Disable Power Query query load](#disable-power-query-query-load)
- [Switch to Mixed mode](#switch-to-mixed-mode)

## Remove unnecessary columns

Model table columns serve two main purposes:

- **Reporting**, to achieve report designs that appropriate filter, group and summarize model data
- **Model structure**, by supporting model relationships, model calculations, security roles, and even data color formatting

Columns that don't serve these purposes be probably be removed. Removing columns is referred to as _vertical filtering_.

We recommend that you design models with exactly the right number of columns based on the known reporting requirements. Of course, these requirements may change over time, but bear in mind that it is easier to add columns later than it is to remove them later. Removing columns could break reports or the model structure.

## Remove unnecessary rows

Model tables should be loaded with as few rows as possible. This can be achieved by loading filtered rowsets into model tables for two different reasons: to filter by entity or by time. Removing rows is referred to as _horizontal filtering_.

**Filtering by entity** involves loading a subset of source data into the model. For example, instead of loading sales facts for all sales regions, only load facts for a single region. This design approach will result in many smaller models, and it can also eliminate the need to define row-level security (but will require granting specific dataset permissions in the Power BI service, and creating "duplicate" reports that connect to each dataset). You can leverage the use of Power Query parameters and Power BI Template files to simplify management and publication. For further information, read the [Deep Dive into Query Parameters and Power BI Templates](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/) blog entry.

**Filtering by time** involves limiting the amount of _data history_ loaded into fact-type tables (and limiting the date rows loaded into the model date tables). We suggest you don't automatically load all available history, unless this is a known reporting requirement. It is helpful to understand that time-based Power Query filters can be parameterized, and even set to use relative time periods (relative to the refresh date, for example, the past five years). Also, bear in mind that retrospective changes to time filters will not break reports; it will just result in less (or more) data history available in reports.

## Group by and summarize

Perhaps the most effective technique to reduce a model size is to load pre-summarized data. This technique can be used to raise the grain of fact-type tables. There is a distinct trade-off, however, resulting in loss of detail.

For example, a source sales fact table stores one row per order line. Significant data reduction could be achieved by summarizing all sales metrics, grouping by date, customer and product. Consider, then, that an even more significant data reduction could be achieved by grouping by date _at month level_. This could achieve a possible 99% reduction in model size, but of course, reporting at day level, or individual order level is no longer possible. Deciding to summarize fact-type data always involves tradeoffs. This tradeoff could be mitigated by a Mixed model design, and this will be discussed later in the [Switch to Mixed mode](#switch-to-mixed-mode) topic.

## Optimize column data types

The VertiPaq storage engine uses separate data structures for each column. By design, these data structures achieve the highest optimizations for numeric column data, which use value encoding. Text and other non-numeric data, however, uses hash encoding. This requires the storage engine to assign a numeric identifier to each unique text value contained in the column. It is the numeric identifier, then, that is then stored in the data structure, requiring a hash lookup during storage and querying.

In some specific instances, you can convert source text data into numeric values. For example, a sales order number may be consistently prefixed by a text value (e.g. "SO123456"). The prefix could be removed, and the order number value converted to whole number. For large tables, this can result in significant data reduction, especially when the column contains unique or high cardinality values.

In this example, we recommend that you set the column Default Summarization property to "Do Not Summarize". This will help to minimize the inappropriate summarization of the order number values.

## Preference for custom columns

The VertiPaq storage engine stores model calculated columns (defined in DAX) just like regular Power Query-sourced columns. However, the data structures are stored slightly differently, and typically achieve less efficient compression. Also, they are built once all Power Query tables are loaded, which can result in extended data refresh times. It is therefore less efficient to add table columns as _calculated_ columns than Power Query _computed_ columns (defined in M).

Preference should be creating custom columns in Power Query. When the source is a database, you can achieve greater load efficiency in two ways. The calculation can be defined in the SQL statement (using the native query language of the provider), or it can be materialized as a column in the data source.

However, in some instances, model calculated columns may be the better choice. This can be the case when the formula involves evaluating measures, or it requires specific modeling functionality only supported in DAX functions. For information on one such example, refer to the [Understanding functions for parent-child hierarchies in DAX](/dax/understanding-functions-for-parent-child-hierarchies-in-dax) article.

## Disable Power Query query load

Power Query queries that are intended support data integration with other queries should not be loaded to the model. To avoid loading the query to the model, take care to ensure that you disable query load in these instances.

![Disabling the load for a Power Query query](media/import-modeling-data-reduction/power-query-disable-query-load.png)

## Switch to Mixed mode

In Power BI Desktop, a Mixed mode design produces a Composite model. Essentially, it allows you to determine storage mode _for each table_. Therefore, each table can have its Storage Mode property set as Import or DirectQuery (Dual is another option).

An effective technique to reduce the model size is to set the Storage Mode property for larger fact-type tables to DirectQuery. Consider that this design approach could work well in conjunction with the [Group by and summarize](#group-by-and-summarize) topic introduced earlier. For example, summarized sales data could be used to achieve high performance "summary" reporting. A drill through page could display granular sales for specific (and narrow) filter context, displaying all in-context sales orders. In this example, the drill through page would include visuals based on a DirectQuery table to retrieve the sales order data.

There are, however, many security and performance implications related to Composite models. For further information, read the [Use composite models in Power BI Desktop](../desktop-composite-models.md) article.

## Next steps

For more information about Power BI Import model design, see the following articles:

- [Use composite models in Power BI Desktop](../desktop-composite-models.md)
- [Storage mode in Power BI Desktop](../desktop-storage-mode.md)
