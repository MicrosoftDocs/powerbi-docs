---
title: "Data reduction techniques for Import modeling"
description: "Understand different techniques to help reduce the data loaded into Import data models."
author: peter-myers
ms.author: v-pemyers
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/25/2024
---

# Data reduction techniques for Import modeling

This article targets Power BI Desktop data modelers who develop and publish Power BI semantic models. Specifically, it describes various techniques to help reduce the data loaded into [Import models](../connect-data/service-dataset-modes-understand.md#import-mode).

Import models are loaded with data that's compressed and optimized, and then stored to disk by the VertiPaq storage engine. When source data is loaded into memory, it's possible to achieve 10x compression, and so it's reasonable to expect that 10 GB of source data can compress to about 1 GB in size. Further, when persisted to disk an extra 20% reduction can be achieved.

Despite the efficiencies achieved by the VertiPaq storage engine, you should strive to minimize the data that's loaded into your models. That's especially true for large models, or models that you anticipate will grow to become large over time. Four compelling reasons include:

- Larger model sizes might not be supported by your capacity. Shared capacity can host models up to 1 GB in size, while Premium capacities can host larger models depending on the SKU. For more information, see [Large semantic models in Power BI Premium](../enterprise/service-premium-large-models.md).
- Smaller model sizes reduce contention for capacity resources, in particular memory. Many smaller models in a capacity can be concurrently loaded for longer periods of time, resulting in lower eviction rates.
- Smaller model sizes achieve faster data refresh, resulting in lower latency reporting, higher semantic model refresh throughput, and less pressure on source system and capacity resources.
- Smaller table row counts can lead to faster calculation evaluations, which result in better overall query performance.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

## Remove unnecessary columns

Model table columns serve two main purposes:

- **Reporting**, to achieve report designs that appropriately filter, group, and summarize model data.
- **Model structure**, by supporting model relationships, model calculations, security roles, and even data color formatting.

You can probably remove any column that doesn't serve either of these purposes. Removing a column from a table is sometimes referred to as _vertical filtering_.

We recommend that you design models with exactly the right number of columns based on your known reporting requirements. Your requirements might change over time, but bear in mind that it's easier to add columns later than it is to remove them later. Removing columns can break reports or the model structure.

## Remove unnecessary rows

You should load model tables with as few rows as possible. You can achieve that by loading filtered rowsets into model tables for two different reasons: to filter by time or by entity. Removing rows is sometimes referred to as _horizontal filtering_.

- **Filtering by time** involves limiting the amount of _data history_ loaded into fact tables (and limiting the date rows loaded into the model date tables). We recommend that you don't load all available history by default, unless it's a known reporting requirement. You can implement time-based Power Query filters with parameters, and even set them to use relative time periods (relative to the refresh date—for example, the past five years). Also, bear in mind that a retrospective change to time filters won't break reports; it will just result in less (or more) data history available in reports.
- **Filtering by entity** involves loading a subset of source data into the model. For example, instead of loading sales facts for all sales regions, only load facts for a single region. This design approach results in many smaller models, and it can also eliminate the need to define [row-level security (RLS)](rls-guidance.md)—but it requires granting specific semantic model permissions in the Power BI service, and creating duplicate reports that connect to each semantic model. You can use Power Query parameters and Power BI Template files to simplify management and publication. For more information, see [Create and use report templates in Power BI Desktop](../create-reports/desktop-templates.md).

## Group by and summarize

Perhaps the most effective technique to reduce a model size is to load pre-summarized data. You can use this technique to raise the grain of fact tables. There's a distinct trade-off, however, resulting in loss of detail.

Consider an example where a source sales fact table stores one row per order line. Significant data reduction can be achieved by summarizing all sales metrics, grouping by date, customer, and product. An even more significant data reduction can be achieved by grouping by date _at month level_. While it could achieve a possible 99% reduction in model size, reporting at day level or individual order line level is no longer possible. Deciding to summarize fact data always involves tradeoffs. Tradeoff could be mitigated by a model design that includes some tables in DirectQuery storage mode, which is described [later](#use-directquery-storage-mode) in this article.

## Optimize column data types

The VertiPaq storage engine uses separate internal data structures for each column. By design, these data structures achieve the highest optimizations for numeric column data, which uses _value encoding_. Text and other non-numeric data, however, uses _hash encoding_. Hash encoding requires the storage engine to assign a numeric identifier to each unique value contained in the column. It's the numeric identifier then, that's stored in the data structure, requiring a hash lookup during storage and querying.

In some specific instances, you can convert source text data into numeric values. For example, a sales order number might be consistently prefixed by a text value (for example `SO123456`). In this case, the prefix `SO` could be removed, and the order number value converted to a whole number. For large tables, this modification can result in significant data reduction, especially when the column contains unique or high-cardinality values.

In this example, we recommend that you set the column default summarization property to `Do Not Summarize`. It helps to avoid inappropriate summarization of the order number values.

## Preference for custom columns

The VertiPaq storage engine stores model [calculated columns](../transform-model/desktop-calculated-columns.md) (defined in DAX) just like regular Power Query-sourced columns. However, the internal data structures are stored slightly differently, and typically achieve less efficient compression. Also, the data structures are built once all Power Query tables are loaded, which can result in extended data refresh times. It's therefore less efficient to add table columns as _calculated_ columns than Power Query _computed_ columns (defined in M).

Whenever possible, preference creating custom columns in Power Query. When the source is a database, you can achieve greater load efficiency in two ways: The calculation can be defined in the SQL statement (using the native query language of the provider), or it can be materialized as a column in the data source.

However, in some instances, model calculated columns might be the better choice. That's true when the formula involves evaluating measures, or it requires specific modeling functionality only supported in DAX functions. For information on one such example, see [Understanding functions for parent-child hierarchies in DAX](/dax/understanding-functions-for-parent-child-hierarchies-in-dax).

## Disable Power Query query load

Power Query queries that are intended to support data integration with other queries shouldn't be loaded to the model. To avoid loading these queries to the model, ensure that you disable the query load in these instances.

:::image type="content" source="media/import-modeling-data-reduction/power-query-disable-query-load.png" alt-text="Screenshot of Power Query showing the Enable load option." border="false":::

## Disable auto date/time

Power BI Desktop includes an option called _Auto date/time_. When enabled, it creates hidden auto date/time tables for each date column in the model. This option supports report authors when configuring filters, grouping, and drill-down actions for calendar time periods. The hidden tables are in fact calculated tables that increase the size of the model.

For more information, see [Auto date/time guidance in Power BI Desktop](auto-date-time.md).

## Use DirectQuery storage mode

DirectQuery storage mode is an alternative to Import storage mode. DirectQuery model tables don't import data. Instead, they consist only of metadata defining the table structure. When the table is queried, native queries are used to retrieve data from the underlying data source. When you combine Import and DirectQuery storage mode tables in a single model, it's known as a _Composite model_.

An effective technique to reduce the model size is to set the storage mode for larger fact tables to DirectQuery. Consider that this design approach often works well with the [Group by and summarize](#group-by-and-summarize) technique introduced earlier. For example, summarized sales data could be used to achieve high performance summary reporting. A drillthrough page could display granular sales for specific (and narrow) filter context, displaying all in-context sales orders. In this example, the drillthrough page could include visuals based on a DirectQuery model table to retrieve the sales order data.

There are, however, many security and performance implications related to DirectQuery storage mode and Composite models. For more information, see [Use composite models in Power BI Desktop](../transform-model/desktop-composite-models.md).

## Related content

For more information related to this article, check out the following articles:

- [Semantic model modes in the Power BI service](../connect-data/service-dataset-modes-understand.md)
- [Storage mode in Power BI Desktop](../transform-model/desktop-storage-mode.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
