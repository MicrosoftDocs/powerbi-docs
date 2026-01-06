---
title: "User-defined aggregations"
description: Describes using manually configured aggregations to speed up data analysis over large semantic models.
author: kgremban
ms.author: kgremban
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 05/28/2025
LocalizationGroup: Transform and shape data
---

# User-defined aggregations

Aggregations in Power BI can improve query performance over large DirectQuery semantic models. By using aggregations, you cache data at the aggregated level in-memory. You can manually configure aggregations in Power BI in the data model, as described in this article. For Premium subscriptions, you can enable the [Automatic aggregations](../enterprise/aggregations-auto.md) feature in model Settings to create them automatically.

## Creating aggregation tables

Depending on the data source type, you can create an aggregations table at the data source as a table or view, native query. For greatest performance, create an aggregations table as an import table created in Power Query. Use the Manage aggregations dialog in Power BI Desktop to define aggregations for aggregation columns with summarization, detail table, and detail column properties.

Dimensional data sources, like data warehouses and data marts, can use [relationship-based aggregations](#aggregation-based-on-relationships). Hadoop-based large-data sources often [base aggregations on GroupBy columns](#aggregation-based-on-groupby-columns). This article describes typical Power BI data modeling differences for each type of data source.

### Manage aggregations

In the **Data** pane of any Power BI Desktop view, right-click the aggregations table, and then select **Manage aggregations**.

:::image type="content" source="media/aggregations-advanced/aggregations-06-2.png" alt-text="Screenshot of select manage aggregations." :::

The **Manage aggregations** dialog shows a row for each column in the table, where you can specify the aggregation behavior. In the following example, queries to the **Sales** detail table are internally redirected to the **Sales Agg** aggregation table. 

![Screenshot shows the Manage aggregations dialog box.](media/aggregations-advanced/aggregations_07.png)

In this relationship-based aggregation example, the GroupBy entries are optional. Except for DISTINCTCOUNT, they don't affect aggregation behavior and are primarily for readability. Without the GroupBy entries, the aggregations still get hit, based on the relationships. This behavior is different from the [big data example](#aggregation-based-on-groupby-columns) later in this article, where the GroupBy entries are required.

### Validations

The **Manage aggregations** dialog enforces validations:

- The **Detail Column** must have the same data type as the **Aggregation Column**, except for the Count and Count table rows **Summarization** functions. Count and Count table rows are only available for integer aggregation columns, and don't require a matching data type.
- Chained aggregations covering three or more tables aren't allowed. For example, aggregations on **Table A** can't refer to a **Table B** that has aggregations referring to a **Table C**.
- Duplicate aggregations, where two entries use the same **Summarization** function and refer to the same **Detail Table** and **Detail Column**, aren't allowed.
- The **Detail Table** must use DirectQuery storage mode, not Import.
- Grouping by a foreign key column used by an inactive relationship, and relying on the USERELATIONSHIP function for aggregation hits, isn't supported. As an alternative, you can use the TREATAS function instead of USERELATIONSHIP. When using TREATAS, ensure there are no active relationships between the tables. Aggregates can still be hit when using TREATAS with this configuration.
- Aggregations based on GroupBy columns can use relationships between aggregation tables but authoring relationships between aggregation tables isn't supported in Power BI Desktop. If necessary, you can create relationships between aggregation tables by using a third-party tool or a scripting solution through XML for Analysis (XMLA) endpoints.

Most validations are enforced by disabling dropdown values and showing explanatory text in the tooltip.

![Validations shown by tooltip](media/aggregations-advanced/aggregations_08.png)

### Aggregation tables are hidden

Users with read-only access to the model can't query aggregation tables. Read-only access avoids security concerns when used with *row-level security (RLS)*. Consumers and queries refer to the detail table, not the aggregation table, and don't need to know about the aggregation table.

For this reason, aggregation tables are hidden from **Report** view. If the table isn't already hidden, the **Manage aggregations** dialog sets it to hidden when you select **Apply all**.

### Storage modes

The aggregation feature works with table-level storage modes. Power BI tables can use *DirectQuery*, *Import*, or *Dual* storage modes. DirectQuery sends queries directly to the backend, while Import caches data in memory and sends queries to the cached data. All Power BI Import and non-multidimensional DirectQuery data sources work with aggregations. 

To set the storage mode of an aggregated table to Import to speed up queries, select the aggregated table in Power BI Desktop **Model** view. In the **Properties** pane, expand **Advanced**, drop down the selection under **Storage mode**, and select **Import**. Once you set the storage mode to Import, you can't change it again.

:::image type="content" source="media/aggregations-advanced/aggregations-04-2.png" alt-text="Screenshot of select the storage mode." :::

For more information about table storage modes, see [Manage storage mode in Power BI Desktop](desktop-storage-mode.md).

### RLS for aggregations

To work correctly for aggregations, RLS expressions should filter both the aggregation table and the detail table.

In the following example, the RLS expression on the **Geography** table works for aggregations, because Geography is on the filtering side of relationships to the **Sales** table and the **Sales Agg** table. Queries that use the aggregation table and queries that don't both have RLS successfully applied.

![Successful RLS for aggregations](media/aggregations-advanced/manage-roles.png)

An RLS expression on the **Product** table filters only the detail **Sales** table, not the aggregated **Sales Agg** table. Since the aggregation table is another representation of the data in the detail table, it would be insecure to answer queries from the aggregation table if the RLS filter can't be applied. Filtering only the detail table isn't recommended, because user queries from this role don't benefit from aggregation hits.

An RLS expression that filters only the **Sales Agg** aggregation table and not the **Sales** detail table isn't allowed.

![RLS on aggregation table only is not allowed](media/aggregations-advanced/filter-agg-error.png)

For [aggregations based on GroupBy columns](#aggregation-based-on-groupby-columns), an RLS expression applied to the detail table can filter the aggregation table, because all the GroupBy columns in the aggregation table are covered by the detail table. On the other hand, an RLS filter on the aggregation table can't filter the detail table, so it's disallowed.

## Aggregation based on relationships

Dimensional models typically use *aggregations based on relationships*. Power BI models from data warehouses and data marts resemble star and snowflake schemas, with relationships between dimension tables and fact tables.

In the following example, the model gets data from a single data source. Tables use DirectQuery storage mode. The **Sales** fact table contains billions of rows. Setting the storage mode of **Sales** to Import for caching would consume considerable memory and resource overhead.

![Detail tables in a model](media/aggregations-advanced/aggregations_02.png)

Instead, create the **Sales Agg** aggregation table. In the **Sales Agg** table, the number of rows equals the sum of **SalesAmount** grouped by **CustomerKey**, **DateKey**, and **ProductSubcategoryKey**. The **Sales Agg** table is at a higher granularity than **Sales**, so instead of billions, it might contain millions of rows, which are easier to manage.

If the following dimension tables are used most commonly for the queries with high business value, they can filter **Sales Agg**, using *one-to-many* or *many-to-one* relationships.

- Geography
- Customer
- Date
- Product Subcategory
- Product Category

The following image shows this model.

![Aggregation table in a model](media/aggregations-advanced/aggregations_03.png)

The following table shows the aggregations for the **Sales Agg** table.

![Aggregations for the Sales Agg table](media/aggregations-advanced/aggregations-table_01.png)

> [!NOTE]
> The **Sales Agg** table, like any table, has the flexibility of being loaded in various ways. You can perform the aggregation in the source database by using ETL or ELT processes, or by using the [M expression](/powerquery-m/power-query-m-function-reference) for the table. The aggregated table can use Import storage mode, with or without [Incremental refresh for semantic models](../connect-data/incremental-refresh-overview.md). Or, it can use DirectQuery and be optimized for fast queries by using [columnstore indexes](/sql/relational-databases/indexes/columnstore-indexes-overview). This flexibility enables balanced architectures that can spread query load to avoid bottlenecks.

Changing the storage mode of the aggregated **Sales Agg** table to **Import** opens a dialog box saying that the related dimension tables can be set to storage mode *Dual*.

![Storage mode dialog](media/aggregations-advanced/aggregations_05.png)

Setting the related dimension tables to Dual lets them act as either Import or DirectQuery, depending on the subquery. In the example:

- Queries that aggregate metrics from the Import-mode **Sales Agg** table, and group by attributes from the related Dual tables, return results from the in-memory cache.
- Queries that aggregate metrics from the DirectQuery **Sales** table, and group by attributes from the related Dual tables, return results in DirectQuery mode. The query logic, including the GroupBy operation, is passed down to the source database.

For more information about Dual storage mode, see [Manage storage mode in Power BI Desktop](desktop-storage-mode.md).

### Regular vs. limited relationships

Aggregation hits based on relationships require regular relationships.

Regular relationships include the following storage mode combinations, where both tables are from a single source:

| Table on the *many* sides | Table on the *1* side |
| ------------- |----------------------|
| Dual          | Dual                 |
| Import        | Import or Dual       |
| DirectQuery   | DirectQuery or Dual  |

The only case where a *cross-source* relationship is regular is if both tables are set to Import. Many-to-many relationships are always limited.

For *cross-source* aggregation hits that don't depend on relationships, see [Aggregations based on GroupBy columns](#aggregation-based-on-groupby-columns).

### Relationship-based aggregation query examples

The following query uses the aggregation because columns in the **Date** table are at the granularity that can use the aggregation. The **SalesAmount** column uses the **Sum** aggregation.

![Successful relationship-based aggregation query](media/aggregations-advanced/aggregations-code_02.png)

The following query doesn't use the aggregation. Despite requesting the sum of **SalesAmount**, the query is performing a GroupBy operation on a column in the **Product** table, which isn't at the granularity that can use the aggregation. If you observe the relationships in the model, a product subcategory can have multiple **Product** rows. The query can't determine which product to aggregate to. In this case, the query reverts to DirectQuery and submits a SQL query to the data source.

![Query that can't use the aggregation](media/aggregations-advanced/aggregations-code_03.png)

Aggregations aren't just for simple calculations that perform a straightforward sum. Complex calculations can also benefit. Conceptually, a complex calculation is broken down into subqueries for each SUM, MIN, MAX, and COUNT. Each subquery is evaluated to determine if it can use the aggregation. This logic doesn't hold true in all cases due to query-plan optimization, but in general it should apply. The following example uses the aggregation:

![Complex aggregation query](media/aggregations-advanced/aggregations-code_04.png)

The COUNTROWS function can benefit from aggregations. The following query uses the aggregation because there's a **Count table rows** aggregation defined for the **Sales** table.

![COUNTROWS aggregation query](media/aggregations-advanced/aggregations-code_05.png)

The AVERAGE function can benefit from aggregations. The following query uses the aggregation because AVERAGE internally gets folded to a SUM divided by a COUNT. Since the **UnitPrice** column has aggregations defined for both SUM and COUNT, the aggregation is used.

![AVERAGE aggregation query](media/aggregations-advanced/aggregations-code_06.png)

In some cases, the DISTINCTCOUNT function can benefit from aggregations. The following query uses the aggregation because there's a GroupBy entry for **CustomerKey**, which maintains the distinctness of **CustomerKey** in the aggregation table. This technique might still hit the performance threshold where more than 2 to 5 million distinct values can affect query performance. However, it can be useful in scenarios where there are billions of rows in the detail table, but 2 to 5 million distinct values in the column. In this case, the DISTINCTCOUNT can perform faster than scanning the table with billions of rows, even if it were cached into memory.

![DISTINCTCOUNT aggregation query](media/aggregations-advanced/aggregations-code_07.png)

Data Analysis Expressions (DAX) time-intelligence functions are aggregation aware. The following query uses the aggregation because the DATESYTD function generates a table of **CalendarDay** values, and the aggregation table is at a granularity that is covered for group-by columns in the **Date** table. This is an example of a table-valued filter to the CALCULATE function, which can work with aggregations.

![SUMMARIZECOLUMNS aggregation query](media/aggregations-advanced/aggregations-code-07b.png)

## Aggregation based on GroupBy columns

Hadoop-based big data models have different characteristics than dimensional models. To avoid joins between large tables, big data models often don't use relationships, but denormalize dimension attributes to fact tables. You can unlock such big data models for interactive analysis by using *aggregations based on GroupBy columns*.

The following table contains the **Movement** numeric column to aggregate. All the other columns are attributes to group by. The table contains IoT data and a massive number of rows. The storage mode is DirectQuery. Queries on the data source that aggregate across the whole model are slow because of the sheer volume.

![An IoT table](media/aggregations-advanced/aggregations_09.png)

To enable interactive analysis on this model, add an aggregation table that groups by most of the attributes, but excludes the high-cardinality attributes like longitude and latitude. This approach dramatically reduces the number of rows and is small enough to comfortably fit into an in-memory cache.

![Driver Activity Agg table](media/aggregations-advanced/aggregations_10.png)

Define the aggregation mappings for the **Driver Activity Agg** table in the **Manage aggregations** dialog. 

![Manage aggregations dialog for the Driver Activity Agg table](media/aggregations-advanced/aggregations_11.png)

In aggregations based on GroupBy columns, the **GroupBy** entries aren't optional. Without them, the aggregations don't get hit. This behavior is different from using aggregations based on relationships, where the GroupBy entries are optional.

The following table shows the aggregations for the **Driver Activity Agg** table.

![Driver Activity Agg aggregations table](media/aggregations-advanced/aggregations-table_02.png)

Set the storage mode of the aggregated **Driver Activity Agg** table to Import.

### GroupBy aggregation query example

The following query uses the aggregation because the **Activity Date** column is covered by the aggregation table. The COUNTROWS function uses the **Counted table rows** aggregation.

![Successful GroupBy aggregation query](media/aggregations-advanced/aggregations-code_08.png)

Especially for models that contain filter attributes in fact tables, it's a good idea to use **Count table rows** aggregations. Power BI can submit queries to the model using COUNTROWS in cases where it isn't explicitly requested by the user. For example, the filter dialog shows the count of rows for each value.

![Filter dialog](media/aggregations-advanced/aggregations-12.png)

## Combined aggregation techniques

You can combine the relationships and GroupBy columns techniques for aggregations. Aggregations based on relationships can require the denormalized dimension tables to be split into multiple tables. If this requirement is costly or impractical for certain dimension tables, you can replicate the necessary attributes in the aggregation table for those dimensions, and use relationships for others.

For example, the following model replicates **Month**, **Quarter**, **Semester**, and **Year** in the **Sales Agg** table. There's no relationship between **Sales Agg** and the **Date** table, but there are relationships to **Customer** and **Product Subcategory**. The storage mode of **Sales Agg** is Import.

![Combined aggregation techniques](media/aggregations-advanced/aggregations_15.png)

The following table shows the entries set in the **Manage aggregations** dialog for the **Sales Agg** table. The GroupBy entries where **Date** is the detail table are mandatory, to use aggregations for queries that group by the **Date** attributes. As in the previous example, the **GroupBy** entries for **CustomerKey** and **ProductSubcategoryKey** don't affect aggregation use, except for DISTINCTCOUNT, because of the presence of relationships.

![Entries for the Sales Agg aggregations table](media/aggregations-advanced/aggregations-table_04.png)

### Combined aggregation query examples

The following query uses the aggregation, because the aggregation table covers **CalendarMonth**, and you can access **CategoryName** through one-to-many relationships. The query uses the **SUM** aggregation for **SalesAmount**.

![Query example that hits the aggregation](media/aggregations-advanced/aggregations-code_09.png)

The following query doesn't use the aggregation, because the aggregation table doesn't cover **CalendarDay**.

![Screenshot shows text of a query that includes CalendarDay.](media/aggregations-advanced/aggregations-code_10.png)

The following time-intelligence query doesn't use the aggregation, because the DATESYTD function generates a table of **CalendarDay** values, and the aggregation table doesn't cover **CalendarDay**.

![Screenshot shows text of a query that includes the DATESYTD function.](media/aggregations-advanced/aggregations-code_11.png)

## Aggregation precedence

Aggregation precedence allows a single subquery to consider multiple aggregation tables.

The following example is a [composite model](desktop-composite-models.md) containing multiple sources:

- The **Driver Activity** DirectQuery table contains over a trillion rows of IoT data sourced from a large-data system. It serves drillthrough queries to view individual IoT readings in controlled filter contexts.
- The **Driver Activity Agg** table is an intermediate aggregation table in DirectQuery mode. It contains over a billion rows in Azure Synapse Analytics (formerly SQL Data Warehouse) and is optimized at the source using columnstore indexes.
- The **Driver Activity Agg2** Import table is at a high granularity, because the group-by attributes are few and low cardinality. The number of rows could be as low as thousands, so it can easily fit into an in-memory cache. These attributes happen to be used by a high-profile executive dashboard, so queries referring to them should be as fast as possible.

> [!NOTE]
> DirectQuery aggregation tables that use a different data source from the detail table are only supported if the aggregation table is from a SQL Server, Azure SQL, or Azure Synapse Analytics (formerly SQL Data Warehouse) source.

The memory footprint of this model is relatively small, but it unlocks a huge model. It represents a balanced architecture because it spreads the query load across components of the architecture, utilizing them based on their strengths.

![Tables for a small-footprint model that unlocks a huge model](media/aggregations-advanced/aggregations_13.png)

The **Managed aggregations** dialog for **Driver Activity Agg2** sets the **Precedence** field to *10*, which is higher than for **Driver Activity Agg**. The higher precedence setting means queries that use aggregations consider **Driver Activity Agg2** first. Subqueries that aren't at the granularity that **Driver Activity Agg2** can answer can consider **Driver Activity Agg** instead. Detail queries that can't be answered by either aggregation table can direct to **Driver Activity**.

The table specified in the **Detail Table** column is **Driver Activity**, not **Driver Activity Agg**, because chained aggregations aren't allowed.

![Screenshot shows the Manage aggregations dialog box with Precedence called out.](media/aggregations-advanced/aggregations_14.png)

The following table shows the aggregations for the **Driver Activity Agg2** table.

![Driver Activity Agg2 aggregations table](media/aggregations-advanced/aggregations-table_03.png)

## Detect whether queries hit or miss aggregations

SQL Profiler can detect whether queries come from the in-memory cache storage engine, or if DirectQuery pushes them to the data source. You can use the same process to detect whether aggregations are being used. For more information, see [Queries that hit or miss the cache](desktop-storage-mode.md#queries-that-hit-or-miss-the-cache). 

SQL Profiler also provides the `Query Processing\Aggregate Table Rewrite Query` extended event.

The following JSON snippet shows an example of the output of the event when an aggregation is used.

- **matchingResult** shows that the subquery uses an aggregation.
- **dataRequest** shows the GroupBy columns and aggregated columns the subquery uses.
- **mapping** shows the columns in the aggregation table that are mapped to.

![Output of an event when aggregation is used](media/aggregations-advanced/aggregations-code_01.png)

## Keep caches in sync

Aggregations that combine DirectQuery, Import, and Dual storage modes can return different data unless the in-memory cache stays in sync with the source data. For example, query execution doesn't attempt to mask data problems by filtering DirectQuery results to match cached values. You might need to handle these problems at the source. Performance optimizations should never compromise your ability to meet business requirements. You need to understand your data flows and design accordingly.

## Considerations and limitations

- Aggregations don't support [Dynamic M Query Parameters](../connect-data/desktop-dynamic-m-query-parameters.md).

- Beginning August 2022, due to changes in functionality, Power BI ignores import mode aggregation tables with single sign-on (SSO) enabled data sources because of potential security risks. To ensure optimal query performance with aggregations, disable SSO for these data sources.

## Community

Power BI has a vibrant community where MVPs, BI pros, and peers share expertise in discussion groups, videos, blogs, and more. When learning about aggregations, be sure to check out these resources:

- [Power BI Community](https://community.powerbi.com/)  
- [Search "Power BI aggregations" on Bing](https://www.bing.com/search?q=power+bi+aggregations)

## Related content

- [Automatic aggregations](../enterprise/aggregations-auto.md)  
- [Composite models](desktop-composite-models.md)  
