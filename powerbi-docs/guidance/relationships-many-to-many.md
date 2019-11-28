---
title: Many-to-many relationship guidance
description: Guidance for developing many-to-many model relationships.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 11/25/2019
ms.author: v-pemyer
---

# Many-to-many relationship guidance

This article targets you as a data modeler working with Power BI Desktop. It describes three different many-to-many modeling scenarios. It also provides you with guidance on how to successfully design for them in your models.

> [!NOTE]
> An introduction to model relationships is not covered in this article. If you're not completely familiar with relationships, their properties or how to configure them, we recommend that you first read the [Model relationships in Power BI Desktop](../desktop-relationships-understand.md) article.
>
> It's also important that you have an understanding of star schema design. For more information, see [Understand star schema and the importance for Power BI](star-schema.md).

There are in fact three many-to-many scenarios:

- Relating two dimension-type tables
- Relating two fact-type tables
- Relating a dimension-type table to a fact-type table, when the fact-type table stores rows at a higher grain than the dimension-type table rows

## Relate many-to-many dimensions

Let's consider the first many-to-many scenario type with an example. The classic scenario that relates two entities involves bank customers and bank accounts. Consider that customers can have multiple accounts, and accounts can have multiple customers. When an account has multiple customers, they're commonly called _joint account holders_.

Modeling these entities is straight forward. One dimension-type table stores accounts, and another dimension-type table stores customers. As is characteristic of dimension-type tables, there is an ID column in each table. To model the relationship between the two tables, a third table is required. This table is commonly referred to as a _bridging table_. In this example, it's purpose is to store one row for each customer-account association. Interestingly, when this table only contains ID columns, it can be called a [_factless fact table_](star-schema#factless-fact-tables).

Here's a simplistic model diagram of the three tables.

![A model diagram contains three tables. The first table is named Account, and it contains two columns: AccountID and Account. The second table is named AccountCustomer, and it contains two columns: AccountID and CustomerID. The third table is named Customer, and it contains two columns: CustomerID and Customer. Relationships don't exist between any of the tables.](media/relationships-many-to-many/bank-account-customer-model-example.png)

Two one-to-many relationships can be added to relate the three tables.

Here's an updated model diagram of the related tables. A fact-type table that records account transactions has been added also. Notice that the bridging table and all ID columns have been hidden.

![A model diagram contains four tables. They are the same table described in the previous image, and with the addition of the AccountTransaction table. This table contains three columns: AccountID, Amount, and Date. Three relationships relate the four tables. Each relationship is one-to-many and filters in a single direction.](media/relationships-many-to-many/bank-account-customer-model-related-tables-1.png)

To easily describe how the relationship filter propagation works, the model diagram has been modified to display the table rows.

> [!NOTE]
> It's not possible to display table rows in the Power BI Desktop model diagram. It's been done to support the discussion in this article with clear examples.

![A model diagram contains four tables. This diagram is the same layout as described in the previous image. Each table now displays column headers and rows. The Account table has two rows: AccountID 1 is for Account-01; AccountID 2 is for Account-02. The Customer table has two rows: CustomerID 91 is for Customer-91; CustomerID 92 is for Customer-92. The AccountCustomer table has three rows: AccountID 1 relates to CustomerID 91; AccountID 1 relates to CustomerID 92; AccountID 3 relates to CustomerID 92. The Transaction table has three rows: Date January 1 2019, AccountID 1, Amount 100; Date February 2 2019, AccountID 2 Amount 200; Date March 3 2019, AccountID 1, Amount -25.](media/relationships-many-to-many/bank-account-customer-model-related-tables-2.png)

Let's see what happens when the model is queried.

Here are two visuals that summarize the **Amount** column from the **Transaction** table. The first visual groups by account, and so the sum of the **Amount** columns represents the _account balance_. The second visual groups by customer, and so the sum of the **Amount** columns represents the _customer balance_.

![Two report visuals sit side by side. The first visual has the title "Account Balance". It has two columns: Account and Amount. It has two rows: Account-01, amount 75; Account-02, amount 200. The total is 275. The second visual has the title "Customer Balance". It has two columns: Customer and Amount. It has two rows: Customer-91, amount 275; Customer-92, amount 275. The total is 275.](media/relationships-many-to-many/bank-account-customer-model-queried-1.png)

A quick glance at the table rows and the **Account Balance** visual reveals that the result is correct, for each account and the total. It's because each account grouping results in a filter propagation to the **Transaction** table for that account.

Something isn't right, however, with the **Customer Balance** visual. Each customer in the **Customer Balance** visual has the same balance as the total balance. This result could only be correct if every customer was a joint account holder of every account. That's clearly not the case in this example. The issue is to do with filter propagation not continuing the **Transaction** table.

If you follow the relationship filter directions from the **Customer** table to the **Transaction** table, it should be apparent that the relationship between the **Account** and **AccountCustomer** table is propagating in the wrong direction. The filter direction for this relationship must be set to _both_.

![The previous model diagram has been updated. A single change has been made to the relationship between the Account and AccountCustomer table. It now filters in both directions.](media/relationships-many-to-many/bank-account-customer-model-related-tables-3.png)

![The same two report visuals sit side by side. The first visual has not changed. The second visual with the title "Customer Balance", still has two columns: Customer and Amount. It now has two rows: Customer-91, amount 75; Customer-92, amount 275. The total is 275.](media/relationships-many-to-many/bank-account-customer-model-queried-2.png)

As expected, there has been on change to the **Account Balance** visual.

The **Customer Balance** visual now displays the correct result. Follow the filter directions for yourself, and see how the customer balances were calculated. Also, understand that the visual total means _all customers_.

Someone unfamiliar with the model relationships, however, might conclude that the result is incorrect. They might ask: _Why isn't the total balance for **Customer-91** and **Customer-92** equal to 350 (75 + 275)?_

The answer to their question lies in the understanding of the many-to-many relationship. Each customer balance could represent multiple accounts, and so the balances themselves are _non-additive_.

### Guidance

When you have a many-to-many relationship between dimension-type tables, we recommend the following guidance:

- Add each many-to-many related entity as a model table, ensuring it has a unique identifier (ID) column
- Add a bridging table to store each association of entities
- Create one-to-many relationships between the three tables
- Configure **one** bi-directional relationship to allow filter propagation to continue to the fact-type tables
- When it isn't appropriate to have missing ID values, set the **Is Nullable** property of ID columns to TRUE—data refresh will then fail if missing values are loaded
- Hide the bridging table (unless it contains additional columns or measures)
- Hide any ID columns that aren't suitable for reporting (for example, when IDs are surrogate keys)
- If it makes sense to leave an ID column visible, ensure that it's on the "one" slide of the relationship—always hide the "many" side column
- When appropriate, communicate explanations in your reports to avoid confusion or misinterpretation—you can add descriptions with text boxes or visual header tooltips

We don't recommend you relate many-to-many dimension-type tables directly. This design approach requires configuring a relationship with a many-to-many cardinality. Conceptually it can be achieved, yet it implies that the related columns will contain duplicate values. It's a well-accepted design practice, however, that dimension-type tables have an ID column. Dimension-type tables should use the ID column as the "one" side of a relationship.

## Relate many-to-many facts

## Relate higher grain facts

## Next steps

For more information about DirectQuery, check out the following resources:

- [Model relationships in Power BI Desktop](../desktop-relationships-understand.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
