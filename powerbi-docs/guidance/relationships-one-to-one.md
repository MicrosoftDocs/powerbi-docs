---
title: "One-to-one relationship guidance"
description: "Guidance for understanding, developing, and working with one-to-one model relationships in Power BI."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.custom: fabric-cat
ms.date: 12/27/2024
---

# One-to-one relationship guidance

This article targets you as a data modeler who works with Power BI Desktop. It provides you with guidance on working with one-to-one model relationships. A one-to-one relationship can be created when both tables each contain a column of common and unique values.

[!INCLUDE [relationships-prerequisite-reading](includes/relationships-prerequisite-reading.md)]

There are two scenarios that involve one-to-one relationships:

- **[Degenerate dimensions](#degenerate-dimensions)**: You can derive a [degenerate dimension](star-schema.md#degenerate-dimensions) from a fact table.
- **[Row data spans across tables](#row-data-spans-across-tables)**: A single business entity or subject is loaded as two (or more) model tables, possibly because their data is sourced from different data stores. This scenario can be common for dimension tables. For example, master product details are stored in an operational sales system, and supplementary product details are stored in a different source.

    It's unusual, however, that you'd relate two fact tables with a one-to-one relationship. That's because both fact tables would need to have the same dimensionality and granularity. Also, each fact table would need unique columns to allow the model relationship to be created.

## Degenerate dimensions

When columns from a fact table are used for filtering or grouping, you can consider making them available in a separate table. This way, you separate columns used for filtering or grouping from those columns used to summarize fact rows. This separation can:

- Reduce storage space.
- Simplify model calculations.
- Contribute to improved query performance.
- Deliver a more intuitive **Data** pane experience to your report authors.

Consider a source table named `Sales` that stores sales order line reference details in two columns.

:::image type="content" source="media/relationships-one-to-one/sales-order-rows.svg" alt-text="Diagram showing table rows for the Sales degenerate dimension table. The design is described in the following paragraph." border="false":::

The `OrderNumber` column stores the order number, and the `OrderLineNumber` column stores a sequence of lines within the order.

In the following image, notice that the order number and order line number columns haven't been loaded to the `Sales` table. Instead, their values were used to create a [surrogate key](star-schema.md#surrogate-keys) column named `OrderLineNumberID`. (The key value is calculated by multiplying the order number by 1000, and then adding the order line number.)

:::image type="content" source="media/relationships-one-to-one/sales-order-degenerate.svg" alt-text="Diagram showing two tables: Sales and Sales Order. A one-to-one relationship relates the Order Line Number ID columns." border="false":::

The `Sales Order` dimension table provides a rich experience for report authors with two columns: `Sales Order` and `Sales Order Line`. These particular columns support report designs that need to filter, group, or drill down through orders and order lines.

Because the `Sales Order` table is derived from the sales data, there should be exactly the same number of rows in each table. Further, there should be matching values between each `OrderLineNumberID` column.

## Row data spans across tables

Consider an example that involves two one-to-one related dimension tables: `Product` and `Product Category`. Each table represents imported data and has a `SKU` (stock-keeping unit) column that contains unique values.

Here's a partial model diagram of the two tables.

:::image type="content" source="media/relationships-one-to-one/product-to-product-category.svg" alt-text="Diagram showing a model that contains two tables where row data spans across tables. The design is described in the following paragraph." border="false":::

The first table is named `Product`, and it contains three columns: `Color`, `Product`, and `SKU`. The second table is named `Product Category`, and it contains two columns: `Category` and `SKU`. A one-to-one relationship relates the two `SKU` columns. The relationship filters in both directions, which is always the case for one-to-one relationships.

To help describe how the relationship filter propagation works, the following image reveals some table rows. All examples in this article are based on this data.

:::image type="content" source="media/relationships-one-to-one/product-to-product-category-2.svg" alt-text="Diagram showing the Product and Product Category tables and some rows of data. The row details are described in the following paragraph." border="false":::

The row details for the two tables are described in the following bulleted list:

- The `Product` table has three rows:
  - `SKU` **CL-01**, `Product` **T-shirt**, `Color` **Green**
  - `SKU` **CL-02**, `Product` **Jeans**, `Color` **Blue**
  - `SKU` **AC-01**, `Product` **Hat**, `Color` **Blue**
- The `Product Category` table has two rows:
  - `SKU` **CL-01**, `Category` **Clothing**
  - `SKU` **AC-01**, `Category` **Accessories**

Notice that the `Product Category` table doesn't include a row for the product SKU **CL-02**. We'll discuss the consequences of this missing row later in this article.

In the **Data** pane, report authors find product-related fields in two tables: `Product` and `Product Category`. Let's see what happens when fields from both tables are added to a table visual. In this example, the `SKU` column is sourced from the `Product` table.

:::image type="content" source="media/relationships-one-to-one/product-to-product-category-consequences.svg" alt-text="Diagram showing the Data pane with two tables, and a table visual that includes four columns. The Category value for product SKU CL-02 is BLANK." border="false":::

Notice that the `Category` value for product SKU **CL-02** is BLANK. That's because there's no corresponding row in the `Product Category` table for this product.

### Recommendations

When possible, we recommend you avoid creating one-to-one model relationships when row data spans across model tables. That's because this design can:

- Contribute to **Data** pane clutter, listing more tables than necessary.
- Make it difficult for report authors to find related fields, because they're distributed across multiple tables.
- Limit the ability to create hierarchies, as their levels must be based on columns from the same table.
- Produce unexpected results when there isn't a complete match of rows between the tables.

Specific recommendations differ depending on whether the one-to-one relationship is _intra source group_ or _cross source group_. For more information about relationship evaluation, see [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md#relationship-evaluation).

### Intra source group one-to-one relationship

When a one-to-one _intra source group_ relationship exists between tables, we recommend consolidating the data into a single model table. You can do that by merging the Power Query queries.

The following steps present a methodology to consolidate and model the one-to-one related data.

1. **Merge queries**: When [combining the two queries](../connect-data/desktop-shape-and-combine-data.md#combine-queries), give consideration to the completeness of data in each query. If one query contains a complete set of rows (like a master list), merge the other query with it. Set the merge transformation to use a _left outer join_, which is the default join type. This join type ensures you'll keep all rows of the first query, and supplement them with any matching rows of the second query. Expand all required columns of the second query into the first query.

    :::image type="content" source="media/relationships-one-to-one/product-to-product-category-consolidated.svg" alt-text="Diagram showing data consolidated to a single Product dimension table." border="false":::

1. **Disable query load**: Be sure to [disable the load](import-modeling-data-reduction.md#disable-power-query-query-load) of the second query. This way, it won't load its result as a model table. This configuration reduces the data model storage size, and helps to unclutter the **Data** pane.

    In our example, report authors now find a single table named `Product` in the **Data** pane. It contains all product-related fields.

1. **Replace missing values**: If the second query has unmatched rows, null values appear in the columns introduced from it. When appropriate, consider replacing null values with a token value. Replacing missing values is especially important when report authors filter or group by the column values, as BLANKs could appear in report visuals.

    In the following image, notice that the category for product SKU **CL-02** now reads **[Undefined]**. In the query, null categories were replaced with this token text value.
    
    :::image type="content" source="media/relationships-one-to-one/product-to-product-category-consolidated-consequences.svg" alt-text="Diagram showing the Data pane for the Product table. It also shows a table visual with four columns. The Category value for product SKU CL-02 is now labeled Undefined." border="false":::

1. **Create hierarchies**: If relationships exist _between the columns_ of the now-consolidated table, consider creating hierarchies. This way, report authors will quickly identify opportunities for report visual drilling.

    In our example, report authors now can use a hierarchy that has two levels: `Category` and `Product`.

    :::image type="content" source="media/relationships-one-to-one/product-to-product-category-data-pane-consolidated-with-hierarchy.svg" alt-text="Diagram showing the Data pane. The Product table includes the Products hierarchy." border="false":::

If you like how separate tables help organize your fields, we still recommend consolidating into a single table. You can still organize your fields, but by using _display folders_ instead.

In our example, report authors can find the `Category` field within the `Marketing` display folder.

:::image type="content" source="media/relationships-one-to-one/product-to-product-category-data-pane-consolidated-into-display-folder.svg" alt-text="Diagram showing the Data pane where the Category field is within a display folder named Marketing." border="false":::

Should you still decide to define one-to-one intra source group relationships in your model, when possible, ensure there are matching rows in the related tables. As a one-to-one intra source group relationship is evaluated as a [regular relationship](../transform-model/desktop-relationships-understand.md#regular-relationships), data integrity issues could surface in your report visuals as BLANKs. (You can see an example of a BLANK grouping in the first table visual presented in this article.)

### Cross source group one-to-one relationship

When a one-to-one _cross source group_ relationship exists between tables, there's no alternative model design—unless you pre-consolidate the data in your data source. Power BI will evaluate the one-to-one model relationship as a [limited relationship](../transform-model/desktop-relationships-understand.md#limited-relationships). Therefore, take care to ensure there are matching rows in the related tables, as unmatched rows are eliminated from query results.

:::image type="content" source="media/relationships-one-to-one/product-to-product-category-cross-source.svg" alt-text="Diagram showing a cross source group one-to-one relationship, which is a limited relationship." border="false":::

Let's see what happens when fields from both tables are added to a table visual, and a limited relationship exists between the tables.

:::image type="content" source="media/relationships-one-to-one/product-to-product-category-table-visual-weak-relationship.svg" alt-text="Diagram showing two table visuals, which are described in the following paragraph." border="false":::

The first table visual, which uses a cross-source group relationship, displays two rows only. Product SKU **CL-02** is missing because there's no matching row in the `Product Category` table. The second table visual, based on a single consolidated table in the model, displays three rows.

## Related content

For more information related to this article, check out the following resources:

- [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md)
- [Understand star schema and the importance for Power BI](star-schema.md)
- [Relationship troubleshooting guidance](relationships-troubleshoot.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
