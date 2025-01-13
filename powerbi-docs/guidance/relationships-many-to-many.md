---
title: "Many-to-many relationship guidance"
description: "Guidance for developing many-to-many model relationships."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/27/2024
---

# Many-to-many relationship guidance

This article targets you as a data modeler who works with Power BI Desktop. It describes three different many-to-many modeling scenarios. It also provides you with guidance on how to successfully design for them in your models.

[!INCLUDE [relationships-prerequisite-reading](includes/relationships-prerequisite-reading.md)]

There are three different many-to-many scenarios. They can occur when you're required to:

- [Relate two dimension tables](#relate-many-to-many-dimensions)
- [Relate two fact tables](#relate-many-to-many-facts)
- [Relate higher grain fact tables](#relate-higher-grain-facts), when the [fact table](star-schema.md#fact-tables) stores rows at a higher grain than the dimension table rows

## Relate many-to-many dimensions

The classic many-to-many scenario relates two entities, for example bank customers and bank accounts. Consider that customers can have multiple accounts, and accounts can have multiple customers. When an account has multiple customers, they're commonly called _joint account holders_.

Modeling these entities is straight forward. One [dimension table](star-schema.md#dimension-tables) stores accounts, and another dimension table stores customers. As is characteristic of dimension tables, there's a unique identifier (ID) column in each table. To model the relationship between the two tables, a third table is required. This table is commonly referred to as a _bridging table_. In this example, it's purpose is to store one row for each customer-account association. Interestingly, when this table only contains identifier columns, it's called a [factless fact table](star-schema.md#factless-fact-tables).

Here's a simplistic diagram of the three model tables.

:::image type="content" source="media/relationships-many-to-many/bank-account-customer-model-example.svg" alt-text="Diagram showing three model tables. The design is described in the following paragraph." border="false":::

The first table is named `Account`, and it contains two columns: `AccountID` and `Account`. The second table is named `AccountCustomer`, and it contains two columns: `AccountID` and `CustomerID`. The third table is named `Customer`, and it contains two columns: `CustomerID` and `Customer`. Relationships don't exist between any of the tables.

Two one-to-many relationships are added to relate the tables. Here's an updated model diagram of the related tables. A fact table named `Transaction` has been added. It records account transactions. The bridging table and all identifier columns have been hidden.

:::image type="content" source="media/relationships-many-to-many/bank-account-customer-model-related-tables-1.svg" alt-text="Diagram showing that a model diagram comprising four tables. One-to-many relationships have been added to relate all tables." border="false":::

To help describe how the relationship filter propagation works, the model diagram has been modified to reveal the table rows.

:::image type="content" source="media/relationships-many-to-many/bank-account-customer-model-related-tables-2.svg" alt-text="Diagram showing the model tables and their rows. The row details for the four tables are described in the following paragraph." border="false":::

The row details for the four tables are presented in the following bulleted list:

- The `Account` table has two rows:
  - `AccountID` **1** is for **Account-01**
  - `AccountID` **2** is for **Account-02**
- The `Customer` table has two rows:
  - `CustomerID` **91** is for **Customer-91**
  - `CustomerID` **92** is for **Customer-92**
- The `AccountCustomer` table has three rows:
  - `AccountID` **1** is associated with `CustomerID` **91**
  - `AccountID` **1** is associated with `CustomerID` **92**
  - `AccountID` **2** is associated with `CustomerID` **92**
- The `Transaction` table has three rows:
  - `Date` **January 1 2019**, `AccountID` **1**, `Amount` **100**
  - `Date` **February 2 2019**, `AccountID` **2**, `Amount` **200**
  - `Date` **March 3 2019**, `AccountID` **1**, `Amount` **-25**

Let's see what happens when the model is queried.

In the following image, there are two table visuals that summarize the `Amount` column of the `Transaction` table. The first visual groups by account, and so the sum of the `Amount` columns represents the _account balance_. The second visual groups by customer, and so the sum of the `Amount` columns represents the _customer balance_.

:::image type="content" source="media/relationships-many-to-many/bank-account-customer-model-queried-1.svg" alt-text="Diagram showing two table visuals sitting side by side. The visuals are described in the following paragraph." border="false":::

The first table visual (Account Balance) has two columns: `Account` and `Amount`. It displays the following result:

- **Account-01** balance amount is **75**.
- **Account-02** balance amount is **200**.
- The total is **275**.

The second table visual (Customer Balance) has two columns: `Customer` and `Amount`. It displays the following result:

- **Customer-91** balance amount is **275**.
- **Customer-92** balance amount is **275**.
- The total is **275**.

A quick glance at the table rows and the Account Balance visual reveals that the result is correct, for each account and the total amount. That's because each account grouping results in a filter propagation to the `Transaction` table for that account.

However, something doesn't appear correct with the Customer Balance visual. Each customer in this visual has the same balance as the total balance. This result could only be correct if every customer was a joint account holder of every account. That's not the case in this example. There's an issue, and it's related to filter propagation. Filters aren't flowing all the way to the `Transaction` table.

If you follow the relationship filter directions from the `Customer` table to the `Transaction` table, you can determine that the relationship between the `Account` and `AccountCustomer` tables is propagating in the wrong direction. The filter direction for this relationship must be set to `Both`.

:::image type="content" source="media/relationships-many-to-many/bank-account-customer-model-related-tables-3.svg" alt-text="Diagram showing that the model has been updated. It now filters in both directions." border="false":::

:::image type="content" source="media/relationships-many-to-many/bank-account-customer-model-queried-2.svg" alt-text="Diagram showing the same two report visuals sitting side by side. The first visual hasn't changed, while the second visual has." border="false":::

As expected, there has been no change to the Account Balance visual.

The Customer Balance visual, however, now displays the following result:

- **Customer-91** balance amount is **75**.
- **Customer-92** balance amount is **275**.
- The total is **275**.

The Customer Balance visual now displays a correct result. Follow the filter directions for yourself, and see how the customer balances were calculated. Also, understand that the visual total means _all customers_.

Someone unfamiliar with the model relationships could conclude that the result is incorrect. They might ask: _Why isn't the total balance for `Customer-91` and `Customer-92` equal to 350 (75 + 275)?_

The answer to their question lies in understanding the many-to-many relationship. Each customer balance can represent the addition of multiple account balances, and so the customer balances are _non-additive_.

### Relate many-to-many dimensions guidance

When you have a many-to-many relationship between dimension tables, follow this guidance:

- Add each many-to-many related entity as a model table, ensuring it has an ID column.
- Add a bridging table to store associated entities.
- Create one-to-many relationships between the three tables.
- Set _one_ bi-directional relationship to allow filter propagation to continue to the fact table.
- When it isn't appropriate to have missing ID values, disable the `Is Nullable` property—data refresh will fail when missing values are sourced.
- Hide the bridging table (unless it contains other columns or measures required for reporting).
- Hide any ID columns that aren't suitable for reporting (for example, when the columns store surrogate key values).
- If it makes sense to leave an ID column visible, ensure that it's on the "one" side of the relationship—always hide the "many" side column. That's because filters applied to the "one" slide result in better filter performance.
- To avoid confusion or misinterpretation, communicate explanations to your report users—you can add descriptions with text boxes or [visual header tooltips](report-page-tooltips.md).

We don't recommend that you relate many-to-many dimension tables directly. This design approach requires setting up a relationship with a many-to-many cardinality. Conceptually it can be achieved, yet it implies that the related columns might contain duplicate values. It's a well-accepted design practice, however, that dimension tables have an ID column. Dimension tables should always use the ID column as the "one" side of a relationship.

## Relate many-to-many facts

A different many-to-many scenario type involves relating two fact tables. Two fact tables can be related directly. This design technique can be useful for quick and simple data exploration. However, and to be clear, we generally don't recommend this design approach. We'll explain why later in this section.

Let's consider an example that involves two fact tables: `Order` and `Fulfillment`. The `Order` table contains one row per order line, and the `Fulfillment` table can contains zero or more rows per order line. Rows in the `Order` table represent sales orders. Rows in the `Fulfillment` table represent order items that have been shipped. A many-to-many relationship relates the `OrderID` columns in each table, with filter propagation only from the `Order` table (meaning the `Order` table filters the `Fulfillment` table).

:::image type="content" source="media/relationships-many-to-many/order-fulfillment-model-example.svg" alt-text="Diagram showing a model containing two tables: Order and Fulfillment." border="false":::

The relationship cardinality is set to `Many-to-many` to support storing duplicate `OrderID` column values in both tables. In the `Order` table, duplicate ID values can exist because an order can have multiple lines. In the `Fulfillment` table, duplicate ID values can exist because orders can have multiple lines, and order lines can be fulfilled by many shipments.

Let's now take a look at the table rows. In the `Fulfillment` table, notice that order lines can be fulfilled by multiple shipments. (The absence of an order line means the order is yet to be fulfilled.)

:::image type="content" source="media/relationships-many-to-many/order-fulfillment-model-related-tables.svg" alt-text="Diagram showing the model table rows. The row details for the two tables are described in the following paragraph." border="false":::

The row details for the two tables are described in the following bulleted list:

- The `Order` table has five rows:
  - `OrderDate` **January 1 2019**, `OrderID` **1**, `OrderLine` **1**, `ProductID` **Prod-A**, `OrderQuantity` **5**, `Sales` **50**
  - `OrderDate` **January 1 2019**, `OrderID` **1**, `OrderLine` **2**, `ProductID` **Prod-B**, `OrderQuantity` **10**, `Sales` **80**
  - `OrderDate` **February 2 2019**, `OrderID` **2**, `OrderLine` **1**, `ProductID` **Prod-B**, `OrderQuantity` **5**, `Sales` **40**
  - `OrderDate` **February 2 2019**, `OrderID` **2**, `OrderLine` **2**, `ProductID` **Prod-C**, `OrderQuantity` **1**, `Sales` **20**
  - `OrderDate` **March 3 2019**, `OrderID` **3**, `OrderLine` **1**, `ProductID` **Prod-C**, `OrderQuantity` **5**, `Sales` **100**
- The `Fulfillment` table has four rows:
  - `FulfillmentDate` **January 1 2019**, `FulfillmentID` **50**, `OrderID` **1**, `OrderLine` **1**, `FulfillmentQuantity` **2**
  - `FulfillmentDate` **February 2 2019**, `FulfillmentID` **51**, `OrderID` **2**, `OrderLine` **1**, `FulfillmentQuantity` **5**
  - `FulfillmentDate` **February 2 2019**, `FulfillmentID` **52**, `OrderID` **1**, `OrderLine` **1**, `FulfillmentQuantity` **3**
  - `FulfillmentDate` **January 1 2019**, `FulfillmentID` **53**, `OrderID` **1**, `OrderLine` **2**, `FulfillmentQuantity` **10**

Let's see what happens when the model is queried. Here's a table visual comparing order and fulfillment quantities by the `Order` table `OrderID` column.

:::image type="content" source="media/relationships-many-to-many/order-fulfillment-model-queried.svg" alt-text="Diagram showing a table visual with three columns: OrderID, OrderQuantity, and FulfillmentQuantity." border="false":::

The visual presents an accurate result. However, the usefulness of the model is limited because you can only filter or group by the `Order` table `OrderID` column.

### Relate many-to-many facts guidance

Generally, we don't recommend that you relate two fact tables directly by using many-to-many cardinality. The main reason is because the model won't provide flexibility in the ways your report visuals filter or group. In the example, it's only possible for visuals to filter or group by the `Order` table `OrderID` column. Another reason relates to the quality of your data. If your data has integrity issues, it's possible some rows might be omitted during querying due to the nature many-to-man cardinality and [limited relationships](../transform-model/desktop-relationships-understand.md#relationship-evaluation).

Instead of relating fact tables directly, we recommend that you implement a [star schema](star-schema.md) design. That means you add dimension tables. These dimension tables then relate to the fact tables by using one-to-many relationships. This design approach is robust as it efficiently delivers flexible reporting options. It lets you filter or group by using any of the dimension table columns, and summarize columns of any related fact table.

Let's consider a better solution.

:::image type="content" source="media/relationships-many-to-many/order-fulfillment-model-improved.svg" alt-text="Diagram showing a model comprising six tables: OrderLine, OrderDate, Order, Fulfillment, Product, and FulfillmentDate." border="false":::

Notice the following design changes:

- The model now has four extra tables: `OrderLine`, `OrderDate`, `Product`, and `FulfillmentDate`.
- The four extra tables are all dimension tables where one-to-many relationships relate them to the fact tables.
- The `OrderLine` table contains the `OrderLineID` column, which stores the `OrderID` value multiplied by 100, plus the `OrderLine` column value—an ID for each order line.
- The `Order` and `Fulfillment` tables now each contain an `OrderLineID` column, and they no longer contain the `OrderID` and `OrderLine` columns.
- The `Fulfillment` table now contains `OrderDate` and `ProductID` columns.
- The `FulfillmentDate` table has a relationship only to the `Fulfillment` table.
- All ID columns are hidden.

Taking the time to adopt a star schema design delivers the following benefits:

- Your report visuals can _filter or group_ by any visible column from the dimension tables.
- Your report visuals can _summarize_ any visible column from the fact tables.
- Filters applied to the `OrderLine`, `OrderDate`, or `Product` tables propagate to both fact tables.
- All relationships are one-to-many, and each relationship is a _regular relationship_. Data integrity issues won't be masked. For more information about relationship evaluation, see [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md#relationship-evaluation).

## Relate higher grain facts

This many-to-many scenario is very different from the other two already described in this article.

Let's consider an example involving four tables: `Date`, `Sales`, `Product`, and `Target`. The `Date` and `Product` tables are dimension tables, and one-to-many relationships relate each to the `Sales` fact table. So far, it represents a good star schema design. The `Target` table, however, is yet to be related to the other tables.

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-example.svg" alt-text="Diagram showing a model comprising four tables: Date, Sales, Product, and Target." border="false":::

The `Target` table contains three columns: `Category`, `TargetQuantity`, and `TargetYear`. The table rows reveal a granularity of year and product category. In other words, targets—used to measure sales performance—are set each year for each product category.

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-target-rows.svg" alt-text="Diagram showing the Sales and Target fact tables. The Target fact table has three columns: TargetYear, Category, and TargetQuantity." border="false":::

Because the `Target` table stores data at a higher level than the dimension tables, a one-to-many relationship can't be created. Well, it's true for just one of the relationships. Let's explore how the `Target` table can be related to the dimension tables.

### Relate higher grain time periods

A relationship between the `Date` and `Target` tables should be a one-to-many relationship. That's because the `TargetYear` column values are dates. In this example, each `TargetYear` column stores the first date of the target year.

> [!TIP]
> When storing facts at a higher time granularity than day, set the column data type to **Date** (or **Whole number** if you're using date keys). In the column, store a value representing the first day of the time period. For example, a year period is recorded as January 1 of the year, and a month period is recorded as the first day of that month.

Care must be taken, however, to ensure that month or date level filters produce a meaningful result. Without any special calculation logic, report visuals might report that target dates are literally the first day of each year. All other days—and all months except January—will summarize the target quantity as BLANK.

The following matrix visual shows what happens when the report user drills down from a year into its months. The visual summarizes the `TargetQuantity` column. (The [Show items with no data](../create-reports/desktop-show-items-no-data.md) option has been enabled for the matrix rows.)

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-matrix-blank-months-bad.svg" alt-text="Diagram showing a matrix visual revealing the year 2020 target quantity as 270. It produces incorrect values by date." border="false":::

To avoid this behavior, we recommend that you control the summarization of your fact data by using measures. One way to control the summarization is to return BLANK when lower-level time periods are queried. Another way—defined with some sophisticated DAX—is to apportion values across lower-level time periods.

Consider the following measure definition that uses the [ISFILTERED](/dax/isfiltered-function-dax) DAX function. It only returns a value when the `Date` and `Month` columns aren't filtered.

```dax
Target Quantity =
IF(
    NOT ISFILTERED('Date'[Date])
        && NOT ISFILTERED('Date'[Month]),
    SUM(Target[TargetQuantity])
)
```

The following matrix visual uses the `Target Quantity` measure. It shows that all monthly target quantities are BLANK.

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-matrix-blank-months-good.svg" alt-text="Diagram showing two matrix visuals. The first reveals the first month target of 2020 as 270 while the second is blank." border="false":::

### Relate higher grain (non-date)

A different design approach is required when relating a non-date column from a dimension table to a fact table (and it's at a higher grain than the dimension table).

The `Category` columns (from both the `Product` and `Target` tables) contains duplicate values. So, there's no "one" side for a one-to-many relationship. In this case, you'll need to create a many-to-many relationship. The relationship should propagate filters in a single direction, from the dimension table to the fact table.

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-relate-non-date.svg" alt-text="Diagram showing a model of the Target and Product tables. A many-to-many relationship relates the two tables." border="false":::

Let's now take a look at the table rows.

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-relate-non-date-tables.svg" alt-text="Diagram showing a model containing two tables: Target and Product. A many-to-many relationship relates the two Category columns." border="false":::

In the `Target` table, there are four rows: two rows for each target year (2019 and 2020), and two categories (Clothing and Accessories). In the `Product` table, there are three products. Two belong to the clothing category, and one belongs to the accessories category. One of the clothing colors is green, and the remaining two are blue.

A table visual grouping by the `Category` column from the `Product` table produces the following result. However, this visual produces the correct result. Let's now consider what happens when the `Color` column from the `Product` table is used to group target quantity.

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-visual-color-targets-bad.svg" alt-text="Diagram showing two table visuals. The first groups by Category and the second groups by Color. The second visual produces an incorrect result." border="false":::

The visual produces a misrepresentation of the data. What is happening here?

A filter on the `Color` column from the `Product` table results in two rows. One of the rows is for the Clothing category, and the other is for the Accessories category. These two category values are propagated as filters to the `Target` table. In other words, because the color blue is used by products from two categories, _those categories_ are used to filter the targets.

To avoid this behavior, as described earlier, we recommend that you control the summarization of your fact data by using measures.

Consider the following measure definition. Notice that all `Product` table columns that are beneath the category level are tested for filters.

```dax
Target Quantity =
IF(
    NOT ISFILTERED('Product'[ProductID])
        && NOT ISFILTERED('Product'[Product])
        && NOT ISFILTERED('Product'[Color]),
    SUM(Target[TargetQuantity])
)
```

The following table visual uses the `Target Quantity` measure. It shows that all color target quantities are BLANK.

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-visual-color-targets-good.svg" alt-text="Diagram showing two table visuals. The first groups by Category and the second groups by Color. The second visual produces a correct result of blank." border="false":::

The final model design looks like the following.

:::image type="content" source="media/relationships-many-to-many/sales-targets-model-example-final.svg" alt-text="Diagram showing a model with Date and Target tables related with a one-to-many relationship." border="false":::

### Relate higher grain facts guidance

When you need to relate a dimension table to a fact table, and the fact table stores rows at a higher grain than the dimension table rows, follow this guidance:

- **For higher grain fact dates**
  - In the fact table, store the first date of the time period.
  - Create a one-to-many relationship between the date table and the fact table.
- **For other higher grain facts**
  - Create a many-to-many relationship between the dimension table and the fact table.
- **For both types**
  - Control summarization with measure logic—return BLANK when lower-level dimension columns are used to filter or group.
  - Hide summarizable fact table columns—that ensures only measures can be used to summarize the fact table.

## Related content

For more information related to this article, check out the following resources:

- [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md)
- [Understand star schema and the importance for Power BI](star-schema.md)
- [Relationship troubleshooting guidance](relationships-troubleshoot.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
