---
title: Composite model guidance in Power BI Desktop
description: Guidance for developing Composite models.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 12/24/2019
ms.author: v-pemyer
---

# Composite model guidance in Power BI Desktop

This article targets data modelers developing Power BI Composite models. It describes Composite model use cases, and provides you with design guidance. Specifically, the guidance is to help you determine whether Composite mode is appropriate for your solution. If it is, then this article will also help you design an optimal model.

> [!NOTE]
> An introduction to Composite models is not covered in this article. If you're not completely familiar with Composite models, we recommend you first read the [Use composite models in Power BI Desktop](../desktop-composite-models.md) article.
>
> Because Composite models consist of at least one DirectQuery source, it's also important that you have a thorough understanding of [model relationships](../desktop-relationships-understand.md), [DirectQuery models](../desktop-directquery-about.md), and [DirectQuery model design guidance](directquery-model-guidance.md).

## Composite model use cases

Whenever possible, it's best to develop a model in Import mode. This mode provides the greatest design flexibility, and best performance.

However, challenges related to large data volumes, or reporting on near real-time data, cannot be solved by Import models. In either of these cases, you can consider a DirectQuery model, providing your data is stored in a single data source that's [supported by DirectQuery mode](../power-bi-data-sources.md).

Further, you can consider developing a Composite model when:

- Your model could be a DirectQuery model, but you want to boost performance. In a Composite model, performance can be improved by configuring appropriate table storage. You can also add [aggregations](../desktop-aggregations.md). Both of this optimization will be described later in this article.
- You want to combine a DirectQuery model with additional data, which must be imported into the model. Imported data can be loaded from a different data source, or by creating calculated tables.
- You want to combine two or more DirectQuery data sources into a single model.

> [!NOTE]
> Composite models cannot combine Live Connection sources or DirectQuery analytic database sources. Live Connection sources include [external-hosted models](../service-datasets-understand.md#external-hosted-models), and Power BI datasets. DirectQuery analytic database sources include SAP Business Warehouse, and SAP HANA.

## Optimize model design

A Composite model can be optimized by configuring table [storage modes](../desktop-storage-mode.md), and by adding [aggregations](../desktop-aggregations.md).

### Table storage mode

In a Composite model, you can configure the storage mode for each table (except calculated tables):

- **DirectQuery**: We recommend this mode be set for tables that represent large data volumes, or which need to deliver near real-time results. Data will never be imported into these tables. Usually, these tables will be fact-type tables—tables used for summarization.
- **Import**: We recommend this mode be set for dimension-type tables—tables used for filtering and grouping. In fact, it's the only option for tables based on sources not supported by DirectQuery mode. Calculated tables are always Import tables.
- **Dual**: We recommend this mode be set for dimension-type tables, when there's a possibility they'll be queried together with DirectQuery fact-type tables from the same source.

There are several possible scenarios when Power BI queries a Composite model:

- **Queries only an Import or Dual table**: All data is retrieved from the model cache. It will deliver the fastest possible performance. This scenario is common for dimension-type tables queried by filters or slicers.
- **Queries Dual table(s) or DirectQuery table(s) from the same source**: All data is retrieved by sending one or more native queries to the DirectQuery source. It will deliver the fastest possible performance, especially when appropriate indexes exist on the source tables. This scenario is common for Dual dimension-type tables and DirectQuery fact-type tables. These queries are _intra-island_, and so all one-to-one or one-to-many relationships are evaluated as [strong relationships](../desktop-relationships-understand.md#strong-relationships).
- **All other queries**: It means the query involves cross-island relationships. It's either because an Import table relates to a DirectQuery table, or a Dual table relates to a DirectQuery table from a different source—in which case it behaves as an Import table. All relationships are evaluated as [weak relationships](../desktop-relationships-understand.md#weak-relationships). It also means that groupings applied to non-DirectQuery tables must be sent to the DirectQuery source as a virtual table. The native query can be inefficient, especially for large grouping sets. And, it has the potential to expose sensitive data in the native query.

In summary, we recommend that you:

- Consider carefully that a Composite model is the right solution—while it allows model-level integration of different data sources, it also introduces design complexities and consequences
- Set the storage mode to **DirectQuery** when a table is a fact-type table storing large data volumes, or it needs to deliver near real-time results
- Set the storage mode to **Dual** when a table is a dimension-type table, and it will be queried together with **DirectQuery** fact-type tables based on the same source
- Configure appropriate refresh frequencies to keep the model cache for Dual tables—and any dependent calculated tables—in sync with the source database
- Strive to ensure data integrity across the data sources (including the model cache)—weak relationships will eliminate rows when related column values don't match
- Optimize DirectQuery data sources with appropriate indexes for efficient joins, filtering and grouping
- Don't load sensitive data into Import or Dual tables if there's risk of a native query being intercepted—for more information, see [Use composite models in Power BI Desktop (Security implications)](../desktop-composite-models.md#security-implications)

### Aggregations

You can add aggregations to DirectQuery tables in your Composite model. Aggregations are cached in the model, and so they behave as Import tables. Their purpose is to performance for "higher grain" queries. For more information, see [Aggregations in Power BI Desktop](../desktop-aggregations.md).

We recommend that an aggregation table follows a basic rule: Its row count should be at least a factor of 10 smaller than the underlying table. For example, if the underlying table stores 1 billion rows, then the aggregation table shouldn't exceed 100 million rows. This rule ensures there's an adequate performance gain relative to the cost of creating and maintaining the aggregation table.

## Next steps

For more information related to this article, check out the following resources:

- [Use composite models in Power BI Desktop](../desktop-composite-models.md)
- [Model relationships in Power BI Desktop](../desktop-relationships-understand.md)
- [DirectQuery models in Power BI Desktop](../desktop-directquery-about.md)
- [Use DirectQuery in Power BI Desktop](../desktop-use-directquery.md)
- [DirectQuery model troubleshooting in Power BI Desktop](../desktop-directquery-troubleshoot.md)
- [Power BI data sources](../power-bi-data-sources.md)
- [Storage mode in Power BI Desktop](../desktop-storage-mode.md)
- [Aggregations in Power BI Desktop](../desktop-aggregations.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
