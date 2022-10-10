---
title: Composite model guidance in Power BI Desktop
description: Guidance for developing Composite models.
author: peter-myers
ms.author: kfollis
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 9/26/2022
---

# Composite model guidance in Power BI Desktop

This article targets data modelers developing Power BI composite models. It describes composite model use cases, and provides you with design guidance. Specifically, the guidance can help you determine whether a composite model is appropriate for your solution. If it is, then this article will also help you design an optimal model.

> [!NOTE]
> An introduction to composite models is not covered in this article. If you're not completely familiar with composite models, we recommend that you first read the [Use composite models in Power BI Desktop](../transform-model/desktop-composite-models.md) article.
>
> Because composite models consist of at least one DirectQuery source, it's also important that you have a thorough understanding of [model relationships](/power-bi/transform-model/desktop-relationships-understand), [DirectQuery models](/power-bi/connect-data/desktop-directquery-about), and [DirectQuery model design guidance](directquery-model-guidance.md).

## Composite model use cases

Whenever possible, it's best to develop a model in import mode. This mode provides the greatest design flexibility, and best performance.

However, challenges related to large data volumes, or reporting on near real-time data, cannot be solved by import models. In either of these cases, you can consider a DirectQuery model, providing your data is stored in a single data source that's [supported by DirectQuery mode](/power-bi/connect-data/power-bi-data-sources).

Further, you can consider developing a composite model in the following situations.

- Your model could be a DirectQuery model, but you want to boost performance. In a composite model, performance can be improved by setting up appropriate storage for each table. You can also add [aggregations](/power-bi/enterprise/aggregations-auto). Both of these optimizations are described later in this article.
- You want to combine a DirectQuery model with additional data, which must be imported into the model. You can load imported data from a different data source, or from calculated tables.
- You want to combine two or more DirectQuery data sources into a single model.

> [!NOTE]
> Composite models cannot combine connections to external analytic databases. These include live connections to [external-hosted models](/power-bi/connect-data/service-datasets-understand#external-hosted-models), SAP Business Warehouse, and SAP HANA when [treating SAP HANA as a multidimensional source](/power-bi/connect-data/desktop-directquery-sap-hana).

## Optimize model design

You can optimize a composite model by setting table [storage modes](/power-bi/transform-model/desktop-storage-mode), and by adding [aggregations](/power-bi/enterprise/aggregations-auto).

### Table storage mode

In a composite model, you can set the storage mode for each table (except calculated tables).

- **DirectQuery:** We recommend that you set this mode for tables that represent large data volumes, or which need to deliver near real-time results. Data will never be imported into these tables. Usually, these tables will be [fact-type tables](/power-bi/guidance/star-schema#star-schema-overview)—tables used for summarization.
- **Import:** We recommend that you set this mode for tables that aren't used for filtering and grouping of fact tables in DirectQuery or Hybrid mode. It's also the only option for tables based on sources not supported by DirectQuery mode. Calculated tables are always import tables.
- **Dual:** We recommend that you set this mode for [dimension-type tables](/power-bi/guidance/star-schema#star-schema-overview), when there's a possibility they'll be queried together with DirectQuery fact-type tables from the same source.
- **Hybrid:** We recommend that you set this mode by adding import partitions, as well as one DirectQuery partition to a fact table when you want to include the latest data changes in real time, or when you want to provide fast access to the most frequently used data through import partitions while leaving the bulk of more infrequently used data in the data warehouse.

There are several possible scenarios when Power BI queries a composite model.

- **Queries only import or dual table(s):** Power BI retrieves all data from the model cache. It will deliver the fastest possible performance. This scenario is common for dimension-type tables queried by filters or slicer visuals.
- **Queries dual table(s) or DirectQuery table(s) from the same source:** Power BI retrieves all data by sending one or more native queries to the DirectQuery source. It will deliver good performance, especially when appropriate indexes exist on the source tables. This scenario is common for queries that relate dual dimension-type tables and DirectQuery fact-type tables. These queries are _intra source group_, and so all one-to-one or one-to-many relationships are evaluated as [regular relationships](/power-bi/transform-model/desktop-relationships-understand#regular-relationships).
- **Queries dual table(s) or hybrid table(s) from the same source**: This scenario is a combination of the previous two scenarios. Power BI retrieves data from the model cache when it's available in import partitions, otherwise it sends one or more native queries to the DirectQuery source. It will deliver the fastest possible performance because only a slice of the data is queried in the data warehouse, especially when appropriate indexes exist on the source tables. As for the dual dimension-type tables and DirectQuery fact-type tables, these queries are intra source group, and so all one-to-one or one-to-many relationships are evaluated as regular relationships.
- **All other queries**: These queries involve cross source group relationships. It's either because an import table relates to a DirectQuery table, or a dual table relates to a DirectQuery table from a different source—in which case it behaves as an import table. All relationships are evaluated as [limited relationships](/power-bi/transform-model/desktop-relationships-understand#limited-relationships). It also means that groupings applied to non-DirectQuery tables must be sent to the DirectQuery source as a virtual table. In this case, the native query can be inefficient, especially for large grouping sets. Lastly, it has the potential to expose sensitive data in the native query.

In summary, we recommend that you:

- Consider carefully that a composite model is the right solution—while it allows model-level integration of different data sources, it also introduces design complexities with possible consequences.
- Set the storage mode to **DirectQuery** when a table is a fact-type table storing large data volumes, or when it needs to deliver near real-time results.
- Consider using Hybrid mode by defining an incremental refresh policy and real-time data or by partitioning the fact table through TOM, TMSL, or a third-party tool. For more information, see [Incremental refresh and real-time data for datasets](../connect-data/incremental-refresh-overview.md) and the [Advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) usage scenario.
- Set the storage mode to **Dual** when a table is a dimension-type table, and it will be queried together with **DirectQuery** or **Hybrid** fact-type tables based on the same source.
- Set appropriate refresh frequencies to keep the model cache for dual and hybrid tables (and any dependent calculated tables) in sync with the source database(s).
- Strive to ensure data integrity across data sources (including the model cache)—limited relationships will eliminate rows when related column values don't match.
- Optimize DirectQuery data sources with appropriate indexes for efficient joins, filtering, and grouping.
- Don't load sensitive data into import, dual or hybrid tables if there's risk of a native query being intercepted—for more information, see [Use composite models in Power BI Desktop (Security implications)](/power-bi/transform-model/desktop-composite-models#security-implications).

### Aggregations

You can add aggregations to DirectQuery tables in your composite model. When aggregations are cached in the model they behave as import tables (although they can't be used like a model table). Their purpose is to improve performance for _higher grain_ queries. For more information, see [Aggregations in Power BI Desktop](/power-bi/enterprise/aggregations-auto).

> [!NOTE]
> Hybrid tables don't support aggregations because some of the partitions operate in import mode. It's not possible to add aggregations at the level of an individual DirectQuery partition.

We recommend that an aggregation follows a basic rule: Its row count should be at least a factor of 10 smaller than the underlying table. For example, if the underlying table stores 1 billion rows, then the aggregation table shouldn't exceed 100 million rows. This rule ensures that there's an adequate performance gain relative to the cost of creating and maintaining the aggregation.

## Connecting to tabular models

You can create a composite model that connects to a Power BI dataset or an [Analysis Services tabular model](/analysis-services/tabular-models/tabular-models-ssas?view=asallproducts-allversions&preserve-view=true). In either case, you're connecting to a data source that's another tabular model. You might create this type of composite model to:

- Extend a source model with additional data.
- Combine multiple models.

> [!NOTE]
> When a model connects to a tabular model but doesn't combine it with additional data, it's not a composite model. In this case, it's a DirectQuery model that connects to a remote model that comprises just one source group. You might create this type of model to modify source model object properties, like a table name, column sort order, or format.

Connecting to tabular models is especially relevant when extending an _enterprise semantic model_ (when it's a Power BI dataset or Analysis Services model). An enterprise semantic model is fundamental to the development and operation of a data warehouse. It provides an abstraction layer over the data in the data warehouse to present business definitions and terminology. It's commonly used as a link between physical data models and reporting tools, like Power BI. In most organizations, it's managed by a central team, and that's why it's described as ' _enterprise_. For more information, see the [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) usage scenario.

When you create a composite model that connects to another tabular model, we recommend that you optimize your model for performance and the user experience. You should consider cross source group relationships and the specific modeling techniques that are described in this section.

### Cross source group relationships

When a relationship spans source groups, it's known as a _cross source group relationship_. For more information, see [Relationship evaluation](/power-bi/transform-model/desktop-relationships-understand#relationship-evaluation).

When defining cross source group relationships, consider the following points.

- **Avoid combining multiple enterprise semantic models:** While it's possible to combine multiple enterprise semantic models, we don't recommend that you do because it could negatively impact on performance. Instead, extend the enterprise semantic model itself, whenever possible.
- **Use low-cardinality relationship columns:** For best performance, we recommend that the relationship columns be low cardinality, meaning they should store less than 50,000 unique values. This recommendation is especially true for non-text columns.
- **Avoid using large text relationship columns:** If you must use text columns in a relationship, calculate the expected text length for the filter by multiplying the cardinality by the average length of the text column. The possible text length should not exceed 250,000 characters.
- **Strive to achieve a simple relationship design:** Only create a cross source group relationship when it's needed, and try to limit the number of tables in the relationship path. This design approach will help to improve performance and avoid [ambiguous relationship paths](/power-bi/transform-model/desktop-relationships-understand#resolve-relationship-path-ambiguity).

> [!WARNING]
> Because Power BI Desktop doesn't validate cross group relationships, it's possible to create overly complex or ambiguous relationships.

#### Cross source group relationship example 1

Consider an example of a complex relationship and how it could produce different, yet valid results. In this example, the **Region** table in source group **A** has a relationship to the **Calendar** table and **Sales** table in source group **B**. The relationship between the **Region** table and the **Calendar** table is active, and the relationship between the **Region** table and the **Sales** table is inactive. Also, there's an active relationship between the **Region** table and the **Sales** table, both of which are in source group **B**. The **Sales** table includes a measure named **TotalSales**, and the **Region** table includes two measures, named **RegionalSales** and **RegionalSalesDirect**.

:::image type="content" source="media/composite-model-guidance/example-multi-path-filter-propagation.png" alt-text="Diagram shows the model design as described in the previous paragraph.":::

Here are the measure definitions.

```dax
TotalSales = SUM(Sales[Sales])
RegionalSales = CALCULATE([TotalSales], USERELATIONSHIP(Region[RegionID], Sales[RegionID]))
RegionalSalesDirect = CALCULATE(SUM(Sales[Sales]), USERELATIONSHIP(Region[RegionID], Sales[RegionID]))
```

Notice how the **RegionalSales** measure refers to the **TotalSales** measure, while the **RegionalSalesDirect** measure does not. Instead, the **RegionalSalesDirect** measure uses the expression `SUM(Sales[Sales])`, which is equivalent to the expression in the **TotalSales** measure.

The difference in the result in subtle. When Power BI evaluates the **RegionalSales** measure, it applies the filter from the **Region** table to both the **Sales** table and the **Calendar** table. Therefore, the filter propagates from the **Calendar** table to the **Sales** table too. In contrast, when Power BI evaluates the **RegionalSalesDirect** measure, it only propagates the filter from the **Region** table to the **Sales** table. The results returned by **RegionalSales** measure and the **RegionalSalesDirect** measure could differ, even though the expressions appear the same.

#### Cross source group relationship example 2

Consider an example where the dimension-type **Date** table is related to the fact-type **Sales** table on the **DateKey** columns, and these tables reside in different source groups. Further, it's a high-cardinality relationship: The earliest date in the **Date** table is 01/01/1900 and the latest date is 12/31/2100, so there's a total of 73,415 rows in the table (one row for each date in the 1900-2100 time span).

:::image type="content" source="media/composite-model-guidance/example-cross-source-group-relationship.png" alt-text="Diagram shows the example model design as described in the previous paragraph.":::

There are two concerns.

- If columns from Date are used as pure filters, the filters from Date will be translated to a filter on Sales[DateKey] when the measures are evaluated. Assuming Sales[DateKey] is an integer and follows the typical yyyymmdd format, the DAX query to Sales will contain a filter that’s equivalent to Sales[DateKey] IN { 19000101, 20000102, …, 21001231 }. The text representation of the filter will be a part of every DAX query to Sales. The size of the query can be huge if the number of distinct values in the filter is large or when the filter values are big strings. In this example, the number of distinct values is 7671 and as a result the filter will list all values resulting in a very big query string.
- If columns [Year], [Quarter], …, [Month] from Date are used as grouping columns, the query to Sales will include all unique combinations of [Year], [Quarter], …, [Month], and [DateKey] where the values of [Year] through [Month] are always integers but the values of [DateKey] will be actual values in the column. The text representation of the combinations can be huge if the number of grouping columns and/or the cardinality of the join column [DateKey] is big.

These two cases highlight that cross source group relationships can lead to issues, including—but not limited to—performance issues.

### Modeling techniques

Here are some modeling considerations you may want to keep in mind as you use this composite models on Power BI datasets or Analysis Services models:

- Keep dimension tables separate from fact tables to ensure data is being interpreted correctly instead of joining them together. This is true not just for composite models.
- Keep dimension tables and fact tables in the same source group as much as possible. Avoid having dimension tables in one source group that relate to a fact table in another. It’s better to have relationships across source group between dimension tables than between a dimension table and its related fact table, because of the potential for high-cardinality key columns in cross source group relationships. Note that the same applies to high-cardinality key columns between dimensions.
- If you use calculation groups with a composite model on Power BI dataset or an Analysis Services model, the results returned might be unexpected. Please see the documentation about calculation groups in composite models.
- You can also try using sync slicers to avoid creating a DAX relationship. Using sync slicers limits the blending of multiple data sources in a safe fashion. Consider the example data model below.

:::image type="content" source="media/composite-model-guidance/sync-slicers-example.png" alt-text="Diagram including two source groups; Source group A contains the Product and ResellerSales tables and source group B contains the Product2 and InternetSales tables.":::

In this example, the Product dimension table is equivalent but added twice. A slicer is added to the report that slices Product\[Color\], which will filter ResellerSales, but not InternetSales. You can add a hidden slider on Product2\[Color\] and keep both slicers in sync using the advanced settings in the Sync slicers pane. When this is set up any filter a user makes using the slicer on Product\[Color\] will automatically set the Product2\[Color\] slicer to the same value and as a result any measures defined on either ResellerSales or InternetSales will be filtered by the corresponding slicers respectively.
  
Note that this is an alternative to creating a many-to-many relationship as it impacts only the visuals affected by the slicers, whereas adding a many-to-many relationship would impact all visuals going forward and filters on any column in one Product table will be propagated to the other Product table.
  
Keep in mind that using this technique increases the complexity of your model considerably, making it harder to use to get meaningful results. You should make sure to properly educate others on how your model works if planning to use this technique. Also, make sure to hide dimension tables you don’t want others to use to avoid confusion.

[Please read the documentation to learn how to sync slicers](/power-bi/visuals/power-bi-visualization-slicers#sync-separate-slicers).

#### Keep calculated columns over large tables simple

Calculated columns defined over a DirectQuery table to relational databases, such as SQL Server, are limited to expressions that operate on a single row at a time. These expressions cannot use iterator functions, such as `SUMX`.

A calculated column expression on remote DirectQuery table is confined to intra-row evaluation only. However, you can author such an expression, only to get an error when using the calculated column in a visual. For example, adding a calculated column on the remote DirectQuery table DimProduct with the expression `[Product Sales] / SUM (DimProduct[ProductSales])` will work fine, but will result in an error when used in a visual because of it violating the intra-row evaluation restriction.

In contrast, calculated columns defined over a DirectQuery table to tabular databases, such as a Power BI dataset or Azure Analysis Services can be much more flexible. In this scenario, all DAX functions are allowed if the expression can be evaluated within the target tabular model. Many expressions require the calculated column to be materialized first before it can be used as in a group-by, a filter, or an aggregation. When a calculated column is materialized over a large table, it can be very costly in both CPU and memory, depending on the cardinality of the columns that the calculated column depends on. We recommend users move those expensive calculated columns into the source model.

#### Create visuals to limit fields from a single remote model

Queries generated for visuals benefit from the best performance due to an optimized query plan when the result can be retrieved from a single remote model. If it’s acceptable to create two visuals to retrieve data from two models instead of a single visual combining data from the two models, choose the two-visual design.

### Performance and scale

If you previously were live connected to a Power BI dataset or Azure Analysis Services, you could share visual caches in the Power BI service. Once you change that connection to DirectQuery, you can no longer see those caches. This may cause latency or failures in refreshes. Overall, this may add more load on the Service, which may require you to upgrade your capacity or optimize to reduce the load. [Learn more about data refresh and caching in Power BI](/power-bi/connect-data/refresh-data).

### Security

If your model includes aggregation tables, calculated columns on import tables, or calculated tables, be sure to check that row level security is set properly to ensure that the intended security is being used.

### Schema Updates

If you want to get schema updates from remote models, you should occasionally refresh your model in Power BI Desktop and re-publish it to the service.

### Governance

It is not recommended to make a dataset that leverages this feature the "single source of data truth" in your organization, as it leaves reports built off this dataset more susceptible to being broken by other report authors. Rather, it is recommended to mark an enterprise semantic model as the source of data truth and leverage this feature to enable users to make customizations on top of that source of data truth. [Learn more about chaining and its limitations](https://go.microsoft.com/fwlink/?linkid=2153208).

It is also not recommended to rename workspaces and dataset names. Keep in mind that datasets are linked together by their names. Renaming a workspace or dataset name could cause reports dependent on these artifacts to break.

You can leverage the [Data Lineage](/power-bi/collaborate-share/service-data-lineage) and [Dataset Impact analysis](/power-bi/collaborate-share/service-dataset-impact-analysis) features in the Service to understand which and how your datasets relate. Note that only the immediate related items are shown in the impact analysis – i.e., if you have a chain of datasets only the first dependent items are shown.

## Next steps

For more information related to this article, check out the following resources.

- [Use composite models in Power BI Desktop](/power-bi/transform-model/desktop-composite-models)
- [Model relationships in Power BI Desktop](/power-bi/transform-model/desktop-relationships-understand)
- [DirectQuery models in Power BI Desktop](/power-bi/connect-data/desktop-directquery-about)
- [Use DirectQuery in Power BI Desktop](/power-bi/connect-data/desktop-use-directquery)
- [DirectQuery model troubleshooting in Power BI Desktop](/power-bi/connect-data/desktop-directquery-troubleshoot)
- [Power BI data sources](/power-bi/connect-data/power-bi-data-sources)
- [Storage mode in Power BI Desktop](/power-bi/transform-model/desktop-storage-mode)
- [Aggregations in Power BI Desktop](/power-bi/enterprise/aggregations-auto)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)
