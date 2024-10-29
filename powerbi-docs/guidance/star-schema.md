---
title: "Understand star schema and the importance for Power BI"
description: "Understand star schema design and its relevance to developing Power BI semantic models optimized for performance and usability."
author: peter-myers
ms.author: v-pemyers
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 10/29/2024
---

# Understand star schema and the importance for Power BI

This article targets Power BI Desktop data modelers. It describes star schema design and its relevance to developing Power BI semantic models optimized for performance and usability.

> [!IMPORTANT]
> Power BI semantic models depend on Power Query to import or connect to data. That means you must use [Power Query](/power-query/power-query-what-is-power-query) to transform and prepare the source data, which might be challenging when you have large data volumes or you need to implement advanced concepts like slowly changing dimensions (described [later in this article](#slowly-changing-dimensions)).
>
> When you're presented with these challenges, we recommend you first develop a data warehouse and Extract, Transform, and Load (ETL) processes to periodically load the data warehouse. Your semantic model can then connect to the data warehouse. For more information, see [Dimensional modeling in Microsoft Fabric Warehouse](/fabric/data-warehouse/dimensional-modeling-overview).

> [!TIP]
> This article isn't intended to provide a complete discussion on star schema design. For more information, refer directly to widely adopted published content, like _The Data Warehouse Toolkit: The Definitive Guide to Dimensional Modeling_ (3rd edition, 2013) by Ralph Kimball, and others.

## Star schema overview

_Star schema_ is a mature modeling approach widely adopted by relational data warehouses. It requires modelers to classify their model tables as either _dimension_ or _fact_.

- **Dimension tables** describe business entities—the _things_ you model. Entities can include products, people, places, and concepts including time itself. The most consistent table you'll find in a star schema is a date dimension table. A dimension table contains a key column (or columns) that acts as a unique identifier, and other columns. Other columns support filtering and grouping your data.
- **Fact tables** store observations or events, and can be sales orders, stock balances, exchange rates, temperatures, and more. A fact table contains dimension key columns that relate to dimension tables, and numeric measure columns. The dimension key columns determine the _dimensionality_ of a fact table, while the dimension key values determine the _granularity_ of a fact table. For example, consider a fact table designed to store sale targets that has two dimension key columns `Date` and `ProductKey`. It's easy to understand that the table has two dimensions. The granularity, however, can't be determined without considering the dimension key values. In this example, consider that the values stored in the `Date` column are the first day of each month. In this case, the granularity is at month-product level.

Generally, dimension tables contain a relatively small number of rows. Fact tables, on the other hand, can contain a large number of rows and continue to grow over time.

:::image type="content" source="media/star-schema/star-schema-example-1.svg" alt-text="Image shows an illustration of a star schema." border="false":::

## Normalization vs. denormalization

To understand some star schema concepts described in this article, it's important to know two terms: normalization and denormalization.

_Normalization_ is the term used to describe data that's stored in a way that reduces repetitious data. Consider a table of products that has a unique key value column, like the product key, and other columns that describe product characteristics, like product name, category, color, and size. A sales table is considered normalized when it stores only keys, like the product key. In the following image, notice that only the `ProductKey` column records the product.

:::image type="content" source="media/star-schema/normalized-data-example.svg" alt-text="Image shows a table of data that includes a Product Key column." border="false":::

If, however, the sales table stores product details beyond the key, it's considered _denormalized_. In the following image, notice that the `ProductKey` and other product-related columns record the product.

:::image type="content" source="media/star-schema/denormalized-data-example.svg" alt-text="Image shows a table of data that includes a Product Key and other product-related columns, including Category, Color, and Size." border="false":::

When you source data from an export file or data extract, it's likely that it represents a denormalized set of data. In this case, use [Power Query](/training/modules/clean-data-power-bi/) to transform and shape the source data into multiple normalized tables.

As described in this article, you should strive to develop optimized Power BI semantic models with tables that represent normalized fact and dimension data. However, there's one exception where a [snowflake dimension](#snowflake-dimensions) might be denormalized in order to produce a single model table.

## Star schema relevance to Power BI semantic models

Star schema design and many related concepts introduced in this article are highly relevant to developing Power BI models that are optimized for performance and usability.

Consider that each Power BI report visual generates a query that's sent to the Power BI semantic model. Generally, queries filter, group, and summarize model data. A well-designed model, then, is one that provides tables for filtering and grouping, and tables for summarizing. This design fits well with star schema principles:

- Dimension tables enable _filtering_ and _grouping_.
- Fact tables enable _summarization_.

There's no table property that modelers set to set the table type as dimension or fact. It's in fact determined by the [model relationships](../transform-model/desktop-relationships-understand.md). A model relationship establishes a filter propagation path between two tables, and it's the cardinality property of the relationship that determines the table type. A common relationship cardinality is _one-to-many_ or its inverse _many-to-one_. The "one" side is always a dimension table while the "many" side is always a fact table.

:::image type="content" source="media/star-schema/star-schema-example-2.svg" alt-text="Image shows a conceptual illustration of a star schema." border="false":::

A well-structured model design includes tables that are either dimension tables or fact tables. Avoid mixing the two types together for a single table. We also recommend that you strive to deliver the right number of tables with the right relationships in place. It's also important that fact tables always load data at a consistent grain.

Lastly, it's important to understand that optimal model design is part science and part art. Sometimes you can break with good guidance when it makes sense to do so.

There are many concepts related to star schema design that can be applied to a Power BI semantic model. These concepts include:

- [Measures](#measures)
- [Surrogate keys](#surrogate-keys)
- [Snowflake dimensions](#snowflake-dimensions)
- [Role-playing dimensions](#role-playing-dimensions)
- [Slowly changing dimensions](#slowly-changing-dimensions)
- [Junk dimensions](#junk-dimensions)
- [Degenerate dimensions](#degenerate-dimensions)
- [Factless fact tables](#factless-fact-tables)

## Measures

In star schema design, a _measure_ is a fact table column that stores values to be summarized. In a Power BI semantic model, a measure has a different—but similar—definition. A model supports both explicit and implicit measures.

- **Explicit measures** are expressly created and they're based on a formula written in [Data Analysis Expressions (DAX)](/dax/data-analysis-expressions-dax-reference) that achieves summarization. Measure expressions often use DAX aggregation functions like `SUM`, `MIN`, `MAX`, `AVERAGE`, and others to produce a scalar value result at query time (values are never stored in the model). Measure expression can range from simple column aggregations to more sophisticated formulas that override filter context and/or relationship propagation. For more information, read about [DAX Basics in Power BI Desktop](../transform-model/desktop-quickstart-learn-dax-basics.md).
- **Implicit measures** are columns that can be summarized by a report visual or [Q&A](../consumer/end-user-q-and-a.md). They offer a convenience for you as a model developer, as in many instances you don't need to create (explicit) measures. For example, the Adventure Works reseller sales `Sales Amount` column can be summarized in numerous ways (sum, count, average, median, min, max, and others), without the need to create a measure for each possible aggregation type.

In the **Data** pane, explicit measures are represented by the calculator icon while implicit measures are represented by the sigma symbol (∑).

:::image type="content" source="media/star-schema/field-list-example.svg" alt-text="Image shows icons found in the Data pane." border="false":::

However, there are three compelling reasons why you might create measures, even for simple column-level summarizations:

- When you know your report authors will query the semantic model by using [Multidimensional Expressions (MDX)](/sql/analysis-services/multidimensional-models/mdx/mdx-query-the-basic-query), the model must include explicit measures. That's because MDX can't achieve summarization of column values. Notably, MDX is used when performing [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) because PivotTables issue MDX queries.
- When you know your report authors will create Power BI paginated reports by using the MDX query designer, the semantic model must include explicit measures. Only the MDX query designer supports [server aggregates](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference). So, if report authors need to have measures evaluated by Power BI (instead of by the paginated report engine), they must use the MDX query designer.
- When you want to control how your report authors summarize columns in specific ways. For example, the reseller sales `Unit Price` column (which represents a per unit rate) can be summarized, but only by using specific aggregation functions. It should never be summed, but it's appropriate to summarize by using other aggregation functions like min, max, or average. In this instance, the modeler can hide the `Unit Price` column, and create measures for all appropriate aggregation functions.

  This design approach works well for reports authored in the Power BI service and for Q&A. However, Power BI Desktop [live connections](../connect-data/service-live-connect-dq-datasets.md#live-connection) allow report authors to show hidden fields in the **Data** pane, which can result in circumventing this design approach.

## Surrogate keys

A _surrogate key_ is a unique identifier that you add to a table to support star schema modeling. By definition, it's not defined or stored in the source data. Commonly, surrogate keys are added to relational data warehouse dimension tables to provide a unique identifier for each dimension table row.

Power BI semantic model relationships are based on a single unique column in one table, which propagates filters to a single column in a different table. When a dimension table in your semantic model doesn't include a single unique column, you must add a unique identifier to become the "one" side of a relationship. In Power BI Desktop, you can achieve this requirement by adding a Power Query [index column](/powerquery-m/table-addindexcolumn).

:::image type="content" source="media/star-schema/toolbar-index-column.svg" alt-text="Image shows the Create index column command in Power Query Editor." border="false":::

You must merge this query with the "many"-side query so that you can add the index column to it also. When you load these queries to the semantic model, you can then create a one-to-many relationship between the model tables.

## Snowflake dimensions

A _snowflake dimension_ is a set of normalized tables for a single business entity. For example, Adventure Works classifies products by category and subcategory. Products are assigned to subcategories, and subcategories are in turn assigned to categories. In the Adventure Works relational data warehouse, the product dimension is normalized and stored in three related tables: `DimProductCategory`, `DimProductSubcategory`, and `DimProduct`.

:::image type="content" source="media/star-schema/snowflake-design.svg" alt-text="Image shows an example of a snowflake diagram comprising three related tables." border="false":::

If you use your imagination, you can picture the normalized tables positioned outwards from the fact table, forming a snowflake design.

:::image type="content" source="media/star-schema/snowflake-dimension.svg" alt-text="Image shows a conceptual example of a snowflake diagram comprising three related tables." border="false":::

In Power BI Desktop, you can choose to mimic a snowflake dimension design (perhaps because your source data does) or combine the source tables to form a single, denormalized model table. Generally, the benefits of a single model table outweigh the benefits of multiple model tables. The most optimal decision can depend on the volumes of data and the usability requirements for the model.

When you choose to mimic a snowflake dimension design:

- Power BI loads more tables, which is less efficient from storage and performance perspectives. These tables must include columns to support model relationships, and it can result in a larger model size.
- Longer relationship filter propagation chains need to be traversed, which might be less efficient than filters applied to a single table.
- The **Data** pane presents more model tables to report authors, which can result in a less intuitive experience, especially when snowflake dimension tables contain only one or two columns.
- It's not possible to create a hierarchy that comprises columns from more than one table.

When you choose to integrate into a single model table, you can also define a hierarchy that encompasses the highest and lowest grain of the dimension. Possibly, the storage of redundant denormalized data can result in increased model storage size, particularly for large dimension tables.

:::image type="content" source="media/star-schema/hierarchy.svg" alt-text="Image shows an example of a hierarchy within a dimension table that has columns like Category, Subcategory, and Product." border="false":::

## Slowly changing dimensions

A _slowly changing dimension_ (or SCD) is one that appropriately manages change of dimension members over time. It applies when business entity values change _slowly_ over time in an unplanned manner. A good example of an SCD is a customer dimension, because its contact detail columns like email address and phone number change infrequently. In contrast, some dimensions are considered to be _rapidly_ changing when a dimension attribute changes often, like the market price of a stock. The common design approach in these instances is to store rapidly changing attribute values in a fact table measure.

Star schema design theory refers to two common SCD types: Type 1 and Type 2. A dimension table could be Type 1 or Type 2, or support both types simultaneously for different columns.

### Type 1 SCD

A _Type 1_ SCD always reflects the latest values, and when changes in source data are detected, the dimension table data is overwritten. This design approach is common for columns that store supplementary values, like the email address or phone number of a customer. When a customer email address or phone number changes, the dimension table updates the customer row with the new values. It's as if the customer always had this contact information.

:::image type="content" source="media/star-schema/slowly-changing-dimension-type-1.svg" alt-text="Image shows an example of a slowly changing dimension type 1 where an employee phone number is updated." border="false":::

A non-incremental refresh of a Power BI model dimension table achieves the result of a Type 1 SCD. It refreshes the table data to ensure the latest values are loaded.

### Type 2 SCD

A _Type 2_ SCD supports versioning of dimension members. If the source system doesn't store versions, it's usually the data warehouse load process that detects changes and appropriately manages the change in a dimension table. In this case, the dimension table must use a surrogate key to provide a unique reference to a _version_ of the dimension member. It also includes columns that define the date range validity of the version (for example, `StartDate` and `EndDate`) and possibly a flag column (for example, `IsCurrent`) to easily filter by current dimension members.

For example, Adventure Works assigns every salesperson to a sales region. When a salesperson relocates region, a new version of the salesperson must be created to ensure that historical facts remain associated with the former region. To support accurate historic analysis of sales by salesperson, the dimension table must store versions of salespeople and their associated region(s). The table should also include start and end date values to define the time validity. Current versions might define an empty end date (or 12/31/9999), which indicates that the row is the current version. The table must also have a [surrogate key](#surrogate-keys) because the business key (in this instance, employee ID) won't be unique.

:::image type="content" source="media/star-schema/slowly-changing-dimension-type-2.svg" alt-text="Image shows an example of a slowly changing dimension type 2 where an employee sales region is updated by creating a new version." border="false":::

It's important to understand that when the source data doesn't store versions, you must use an intermediate system (like a data warehouse) to detect and store changes. The table load process must preserve existing data and detect changes. When a change is detected, the table load process must expire the current version. It records these changes by updating the `EndDate` value and inserting a new version with the `StartDate` value commencing from the previous `EndDate` value. Also, related facts must use a time-based lookup to retrieve the dimension key value relevant to the fact date. A Power BI semantic model uses Power Query, and so it can't produce this result. It can, however, load data from a pre-loaded SCD Type 2 dimension table.

> [!TIP]
> To learn how to implement a Type 2 SCD dimension table in a Fabric warehouse, see [Manage historical change](/fabric/data-warehouse/dimensional-modeling-dimension-tables#manage-historical-change).

The Power BI semantic model should support querying historical data for a member, regardless of change, and for a version of the member, which represents a particular state of the member in time. In the context of Adventure Works, this design enables you to query the salesperson regardless of assigned sales region, or for a particular version of the salesperson.

To achieve this requirement, the Power BI semantic model dimension table must include a column for filtering the salesperson, and a different column for filtering a specific version of the salesperson. It's important that the version column provides a non-ambiguous description, like `David Campbell (12/15/2008-06/26/2019)` or `David Campbell (06/27/2019-Current)`. It's also important to educate report authors and consumers about the basics of SCD Type 2, and how to achieve appropriate report designs by applying correct filters.

It's a good design practice to include a hierarchy that allows visuals to drill down to the version level.

:::image type="content" source="media/star-schema/hierarchy-drill-down.svg" alt-text="Image shows the Data pane with columns for Salesperson and Salesperson Version." border="false":::

## Role-playing dimensions

A _role-playing dimension_ is a dimension that can filter related facts differently. For example, at Adventure Works the date dimension table has three relationships to the reseller sales facts. The same dimension table can be used to filter the facts by order date, ship date, or delivery date.

:::image type="content" source="media/star-schema/role-playing-dimensions.svg" alt-text="Image shows a conceptual example of a single role-playing dimension and relationships. The Date table has two relationships to the fact table for order date and ship date." border="false":::

In a data warehouse, the accepted design approach is to define a single date dimension table. At query time, the "role" of the date dimension is established by which fact column you use to join the tables. For example, when you analyze sales by order date, the table join relates to the reseller sales order date column.

In a Power BI semantic model, this design can be imitated by creating multiple relationships between two tables. In the Adventure Works example, the date and reseller sales tables would have three relationships.

:::image type="content" source="media/star-schema/relationships-single-dimension-table.svg" alt-text="Image shows an example of a single role-playing dimension and relationships. The Date table has three relationships to the fact table." border="false":::

While this design is possible, there can only be one _active_ relationship between two Power BI semantic model tables. All remaining relationships must be set to inactive. Having a single active relationship means there's a default filter propagation from date to reseller sales. In this instance, the active relationship is set to the most common filter that's used by reports, which at Adventure Works is the order date relationship.

The only way to use an inactive relationship is to define a DAX expression that uses the [USERELATIONSHIP](/dax/userelationship-function-dax) function. In our example, the model developer must create measures to enable analysis of reseller sales by ship date and delivery date. This work can be tedious, especially when the reseller table defines many measures. It also creates a cluttered **Data** pane that has an overabundance of measures. There are other limitations, too:

- When report authors rely on summarizing columns rather than defining measures, they can't achieve summarization for the inactive relationships without writing a report-level measure. Report-level measures can only be defined when authoring reports in Power BI Desktop.
- With only one active relationship path between date and reseller sales, it's not possible to simultaneously filter reseller sales by different types of dates. For example, you can't produce a visual that plots order date sales by shipped sales.

To overcome these limitations, a common Power BI modeling technique is to create a dimension table for each role-playing instance. You can create each dimension table as a [referencing query](power-query-referenced-queries.md) using Power Query, or a [calculated table](/dax/calculatetable-function-dax) using DAX. The model can contain a `Date` table, a `Ship Date` table and a `Delivery Date` table, each with a single and active relationship to their respective reseller sales table columns.

:::image type="content" source="media/star-schema/relationships-multiple-dimension-tables.svg" alt-text="Image shows an example of role playing dimensions and relationships. There are three different date dimension tables related to the fact table." border="false":::

This design approach doesn't require you to define multiple measures for different date roles, and it allows simultaneous filtering by different date roles. A minor price to pay with this design approach, however, is that there will be duplication of the date dimension table resulting in an increased model storage size. Because dimension tables typically store fewer rows relative to fact tables, it's rarely a concern.

We recommend you follow good design practices when creating model dimension tables for each role:

- Ensure that the column names are self-describing. While it's possible to have a `Year` column in all date tables (column names are unique within their table), it's not self-describing by default visual titles. Consider renaming columns in each dimension role table so that the `Ship Date` table has a year column named `Ship Year`, and so on.
- When relevant, ensure that table descriptions provide feedback to report authors (through **Data** pane tooltips) about how filter propagation is set up. This clarity is important when the model contains a generically named table, like `Date`, which is used to filter many fact tables. In the case that this table has, for example, an active relationship to the reseller sales order date column, consider providing a table description like `Filters reseller sales by order date`.

For more information, see [Active vs inactive relationship guidance](relationships-active-inactive.md).

## Junk dimensions

A _junk dimension_ is useful when there are many dimensions, especially consisting of few attributes (perhaps one), and when these attributes have few values. Good candidates include order status columns, or customer demographic columns like gender or age group.

The design objective of a junk dimension is to consolidate many _small_ dimensions into a single dimension to reduce the model storage size and also reduce **Data** pane clutter by surfacing fewer model tables.

A junk dimension table is typically the Cartesian product of all dimension attribute members, with a [surrogate key](#surrogate-keys) column to uniquely identify each row. You can build the dimension in a data warehouse, or by using Power Query to create a query that performs [full outer query joins](/powerquery-m/table-join), then adds a surrogate key (index column).

:::image type="content" source="media/star-schema/junk-dimension.svg" alt-text="Image shows an example of a junk dimension table. Order Status has three states while Delivery Status has two states. The junk dimension table stores all six combinations of the two statuses." border="false":::

You load this query to the model as a dimension table. You also need to merge this query with the fact query so the index column is loaded to the model to support the creation of a "one-to-many" model relationship.

## Degenerate dimensions

A _degenerate dimension_ refers to an attribute of the fact table that's required for filtering. At Adventure Works, the reseller sales order number is a good example. In this instance, it doesn't make sense to create an independent table consisting of just this one column because it would increase the model storage size and result in **Data** pane clutter.

In the Power BI semantic model, it can be appropriate to add the sales order number column to the fact table to allow filtering or grouping by sales order number. It's an exception to the formerly introduced rule that you shouldn't mix table types (generally, model tables should be either dimension or fact).

:::image type="content" source="media/star-schema/degenerate-dimension.svg" alt-text="Image shows the Data pane and the sales fact table, which includes the Order Number field." border="false":::

However, if the Adventure Works resellers sales table has order number _and_ order line number columns, and they're required for filtering, creating a degenerate dimension table would be a good design. For more information, see [One-to-one relationship guidance (Degenerate dimensions)](relationships-one-to-one.md#degenerate-dimensions).

## Factless fact tables

A _factless fact_ table doesn't include any measure columns. It contains only dimension keys.

A factless fact table could store observations defined by dimension keys. For example, at a particular date and time, a particular customer signed in to your web site. You could define a measure to count the rows of the factless fact table to perform analysis of when and how many customers signed in.

A more compelling use of a factless fact table is to store relationships between dimensions, and it's a Power BI semantic model design approach we recommend for defining many-to-many dimension relationships. In a [many-to-many dimension relationship design](relationships-many-to-many.md#relate-many-to-many-dimensions), the factless fact table is referred to as a _bridging table_.

For example, consider that salespeople can be assigned to one _or more_ sales regions. The bridging table would be designed as a factless fact table consisting of two columns: salesperson key and region key. Duplicate values can be stored in both columns.

:::image type="content" source="media/star-schema/factless-fact-table.svg" alt-text="Image shows a factless fact table bridging Salesperson and Region dimensions. The factless fact table comprises two columns, which are the dimension keys." border="false":::

This many-to-many design approach is well documented, and it can be achieved without a bridging table. However, the bridging table approach is considered the best practice when relating two dimensions. For more information, see [Many-to-many relationship guidance (Relate two dimension-type tables)](relationships-many-to-many.md#relate-many-to-many-dimensions).

## Related content

For more information about star schema design or Power BI semantic model design, see the following articles:

- [Dimensional modeling Wikipedia article](https://go.microsoft.com/fwlink/p/?linkid=246459)
- [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md)
- [One-to-one relationship guidance](relationships-one-to-one.md)
- [Many-to-many relationship guidance](relationships-many-to-many.md)
- [Bi-directional relationship guidance](relationships-bidirectional-filtering.md)
- [Active vs inactive relationship guidance](relationships-active-inactive.md)
- [Dimensional modeling in Microsoft Fabric Warehouse](/fabric/data-warehouse/dimensional-modeling-overview)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
