---
title: "Bi-directional relationship guidance"
description: "Guidance for developing bi-directional filtering model relationships."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/27/2024
---

# Bi-directional relationship guidance

This article targets you as a data modeler who works with Power BI Desktop. It provides you with guidance on when to create bi-directional model relationships. A bi-directional relationship is one that filters in _both directions_.

[!INCLUDE [relationships-prerequisite-reading](includes/relationships-prerequisite-reading.md)]

Generally, we recommend that you minimize the use of bi-directional relationships. That's because they can negatively impact on model query performance, and possibly deliver confusing experiences for your report users.

However, there are three scenarios when bi-directional filtering can solve specific requirements:

- [Special model relationships](#special-model-relationships)
- [Slicer options "with data"](#slicer-options-with-data)
- [Dimension-to-dimension analysis](#dimension-to-dimension-analysis)

## Special model relationships

Bi-directional relationships play an important role when creating the following two special model relationship types:

- **One-to-one**: All one-to-one relationships must be bi-directional—it isn't possible to configure otherwise. Generally, we don't recommend creating these types of relationships. For a complete discussion and alternative design patterns, see [One-to-one relationship guidance](relationships-one-to-one.md).
- **Many-to-many**: When relating two [dimension tables](star-schema.md#dimension-tables), a [bridging table](star-schema.md#factless-fact-tables) is required. A bi-directional filter is required to ensure filters propagate across the bridging table. For more information, see [Many-to-many relationship guidance](relationships-many-to-many.md#relate-many-to-many-dimensions).

## Slicer options "with data"

Bi-directional relationships can deliver slicers that limit options to where data exists. (If you're familiar with Excel PivotTables and slicers, it's the default behavior when sourcing data from a Power BI semantic model or an Analysis Services model.) To help explain what it means, first consider the following model diagram.

:::image type="content" source="media/relationships-bidirectional-filtering/sales-model-diagram.svg" alt-text="Diagram showing a model containing three tables. The design is described in the following paragraph." border="false":::

The first table is named `Customer`., and it contains three columns: `Country-Region`, `Customer`, and `CustomerCode`. The second table is named `Product`, and it contains three columns: `Color`, `Product`, and `SKU`. The third table is named `Sales`, and it contains four columns: `CustomerCode`, `OrderDate`, `Quantity`, and `SKU`. The `Customer` and `Product` tables are dimension tables, and each has a one-to-many relationship to the `Sales` table. Each relationship filters in a single direction.

To help describe how bi-directional filtering works, the model diagram has been modified to reveal the table rows. All examples in this article are based on this data.

:::image type="content" source="media/relationships-bidirectional-filtering/sales-model-diagram-rows.svg" alt-text="Diagram showing that the model now reveals the table rows. The row details are described in the following paragraph." border="false":::

The row details for the three tables are described in the following bulleted list:

- The `Customer` table has two rows:
  - `CustomerCode` **CUST-01**, `Customer` **Customer-1**, `Country-Region` **United States**
  - `CustomerCode` **CUST-02**, `Customer` **Customer-2**, `Country-Region` **Australia**
- The `Product` table has three rows:
  - `SKU` **CL-01**, `Product` **T-shirt**, `Color` **Green**
  - `SKU` **CL-02**, `Product` **Jeans**, `Color` **Blue**
  - `SKU` **AC-01**, `Product` **Hat**, `Color` **Blue**
- The `Sales` table has three rows:
  - `OrderDate` **January 1 2019**, `CustomerCode` **CUST-01**, `SKU` **CL-01**, `Quantity` **10**
  - `OrderDate` **February 2 2019**, `CustomerCode` **CUST-01**, `SKU` **CL-02**, `Quantity` **20**
  - `OrderDate` **March 3 2019**, `CustomerCode` **CUST-02**, `SKU` **CL-01**, `Quantity` **30**

Now consider the following report page.

:::image type="content" source="media/relationships-bidirectional-filtering/sales-report-no-bi-directional-filter.svg" alt-text="Diagram showing the report page containing three visuals. The details are described in the following paragraph." border="false":::

The page consists of two slicers and a card visual. The first slicer is based on the `Country-Region` field, and it has two options: Australia and United States. It currently slices by Australia. The second slicer is based on the `Product` field, and it has three options: Hat, Jeans, and T-shirt. No items are selected (meaning _no products_ are filtered). The card visual displays a quantity of 30.

When report users slice by Australia, you might want to limit the product slicer to display options where data _relates_ to Australian sales. That's what's meant by showing slicer options "with data". You can achieve this behavior by setting the relationship between the `Product` and `Sales` tables to filter _in both directions_.

:::image type="content" source="media/relationships-bidirectional-filtering/sales-model-diagram-rows-bi-directional-filter.svg" alt-text="Diagram showing a model that the relationship between the Product and Sales tables is now bi-directional." border="false":::

The product slicer now lists a single option: T-shirt. This option represents the only product sold to Australian customers.

:::image type="content" source="media/relationships-bidirectional-filtering/sales-report-bi-directional-filter.svg" alt-text="Diagram showing the report page containing three visuals with Product called out. The details are described in the following paragraph." border="false":::

First, we recommend that you consider carefully whether this design works for your report users. Some report users find the experience confusing because they don't understand why slicer options dynamically appear or disappear when they interact with other slicers.

If you do decide to show slicer options "with data", we don't recommend you set up a bi-directional relationships. Bi-directional relationships require more processing and so they can negatively impact on query performance—especially as the number of bi-directional relationships in the model increases.

There's a better way to achieve the same result: Instead of using bi-directional filters, you can apply a visual-level filter to the product slicer itself.

Let's now consider that the relationship between the `Product` and `Sales` tables no longer filters in both directions. And, the following measure definition has been added to the `Sales` table.

```dax
Total Quantity = SUM(Sales[Quantity])
```

To show the product slicer options "with data", it simply needs to be filtered by the `Total Quantity` measure by using the "is not blank" condition.

:::image type="content" source="media/relationships-bidirectional-filtering/filter-product-slicer-measure-is-not-blank.svg" alt-text="Diagram showing that the Filters pane for the Product slicer now filters by Total Quantity is not blank." border="false":::

## Dimension-to-dimension analysis

A different scenario involving bi-directional relationships treats a [fact table](star-schema.md#fact-tables) like a [bridging table](star-schema.md#factless-fact-tables). This way, it supports analyzing dimension table data within the filter context of a different dimension table.

Using the example model in this article, consider how the following questions can be answered:

- How many colors were sold to Australian customers?
- How many countries/regions purchased jeans?

Both questions can be answered _without_ summarizing data in the bridging fact table. They do, however, require that filters propagate from one dimension table to the other. When filters propagate via the fact table, summarization of dimension table columns can be achieved using the [DISTINCTCOUNT](/dax/distinctcount-function-dax) DAX function—and possibly the [MIN](/dax/min-function-dax) and [MAX](/dax/max-function-dax) DAX functions.

As the fact table behaves like a bridging table, you can apply the many-to-many relationship guidance to relate two dimension tables. It will require setting up at least one relationship to filter in both directions. For more information, see [Many-to-many relationship guidance](relationships-many-to-many.md#relate-many-to-many-dimensions).

However, as already described in this article, this design will likely result in a negative impact on performance, and the user experience consequences related to [slicer options "with data"](#slicer-options-with-data). So, we recommend that you activate bi-directional filtering _in a measure definition_ by using the [CROSSFILTER](/dax/crossfilter-function) DAX function instead. You can use the CROSSFILTER function to modify filter directions—or even disable the relationship—during the evaluation of an expression.

Consider the following measure definition added to the `Sales` table. In this example, the model relationship between the `Customer` and `Sales` tables has been set up to filter in a _single direction_.

```dax
Different Countries Sold =
CALCULATE(
    DISTINCTCOUNT(Customer[Country-Region]),
    CROSSFILTER(
        Customer[CustomerCode],
        Sales[CustomerCode],
        BOTH
    )
)
```

During the evaluation of the `Different Countries Sold` measure, the relationship between the `Customer` and `Sales` tables filters in both directions.

The following table visual present statistics for each product sold. The `Quantity` column is simply the sum of quantity values. The `Different Countries Sold` column represents the distinct count of country-region values of all customers who have purchased the product.

:::image type="content" source="media/relationships-bidirectional-filtering/country-sales-crossfilter-function.svg" alt-text="Diagram showing that two products are listed in a table visual. In the Different Countries Sold column, Jeans is 1, and T-shirt is 2." border="false":::

## Related content

For more information related to this article, check out the following resources:

- [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md)
- [Understand star schema and the importance for Power BI](star-schema.md)
- [One-to-one relationship guidance](relationships-one-to-one.md)
- [Many-to-many relationship guidance](relationships-many-to-many.md)
- [Relationship troubleshooting guidance](relationships-troubleshoot.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
