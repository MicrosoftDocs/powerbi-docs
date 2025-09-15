---
title: Many-to-many relationships in Power BI Desktop
description: Learn how to use relationships with a many-to-many cardinality to more easily create data models that contain two or more data sources in Power BI Desktop.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 09/15/2025
ms.custom: FY25Q1-Linter
LocalizationGroup: Transform and shape data
ai-usage: ai-assisted
#customer intent: As a Power BI user I want to learn how to use relationships with many-to-many cardinality in Power BI.
---

# Understand many-to-many relationships in Power BI Desktop

> This article applies to **Power BI Desktop**, not the Power BI service. If you're using the Power BI service, many-to-many relationships are not currently supported in the same way.

Many-to-many relationships occur when a value in one table can relate to multiple values in another—and vice versa. This is common in scenarios like customers with multiple accounts, or students enrolled in multiple courses.

## Why many-to-many relationships matter

In traditional one-to-many relationships, each value in one table matches only one value in another. But real-world data often breaks this rule. Power BI Desktop supports many-to-many relationships to help you model these scenarios accurately.

## How to model many-to-many relationships

To create a many-to-many relationship, you typically need a **bridging table**. This table connects the two main tables by listing all valid combinations of their keys.

### Example: Customers and accounts

Let’s say you have two tables:

- **Customer table**: Contains unique `CustomerID` values
- **Account table**: Contains unique `AccountID` values

The **Bridging table (AccountCustomer)** then contains rows like these:  

- `CustomerID = 91`, `AccountID = 1`
- `CustomerID = 92`, `AccountID = 1`  
- `CustomerID = 92`, `AccountID = 2`

This bridging table enables Power BI to understand which customers belong to which accounts—even when there are overlaps.

## Create the relationships

Once you set up your tables—including the bridging table—you need to define the relationships between them so Power BI can understand how the data connects. This step is essential for enabling accurate filtering and analysis across your model. You do this in Power BI Desktop’s **Manage relationships** view, where you can link fields and control how filters flow between tables.

1. Create one-to-many relationships:
   - From `CustomerID` in the **Customer** table to `CustomerID` in the **AccountCustomer** table.
   - From `AccountID` in the **Account** table to `AccountID` in the **AccountCustomer** table.
1. Hide the bridging table from report view if needed. It’s used for modeling, not reporting.

## Use the model

After you define the relationships, Power BI uses them to automatically connect and filter data across your tables. This allows you to build visuals that reflect real-world interactions—such as how customers are linked to accounts or how transactions relate to both.

The model handles the logic behind the scenes, so you don’t need to write complex DAX or manually join tables. Instead, you can focus on building reports that respond dynamically to filters and slicers.

Once relationships are set:

- You can filter accounts by customer and customers by account.
- You can add a **fact table** (for example, `Transactions`) that connects to `AccountID` and analyze activity across customers, accounts, and time.

## Tips for beginners

- Always use unique IDs in your tables.
- Use bridging tables to resolve many-to-many relationships.
- Avoid circular relationships—Power BI will warn you if they occur.
- This feature is only available in **Power BI Desktop**.

## Related content

- [Use composite models in Power BI Desktop](desktop-composite-models.md)
- [Manage storage mode in Power BI Desktop](desktop-storage-mode.md)
- [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)
- [Power BI data sources](../connect-data/power-bi-data-sources.md)
