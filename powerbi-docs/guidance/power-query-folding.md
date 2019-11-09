---
title: Query folding guidance for Power BI Desktop
description: Guidance for achieving Power Query query folding in Power BI Desktop.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 11/09/2019
ms.author: v-pemyer
---

# Query folding guidance for Power BI Desktop

This article targets data modelers developing models in Power BI Desktop. It provides best practice guidance on when and how to achieve Power Query  query folding.

Query folding is the ability for a Power Query query to generate a single query statement to retrieve and transform source data. For more information about query folding, see the [Query folding](/power-query/power-query-folding) concept article.

## Guidance

In short, for a DirectQuery or Dual storage mode table, the Power Query query must achieve query folding. For an Import table based on a relational source, if a single SELECT statement can be constructed, _best data refresh performance_ is achieved by ensuring that query folding occurs. If the mashup engine is still required to process transformations, you should strive to minimize the work it needs to do, especially for large datasets.

The following bulleted list provides best practice guidance.

- **Delegate as much processing to the data source as possible:** When all steps of a Power Query query cannot be folded, discover the step that prevents query folding. When possible, move later steps earlier in sequence so they may be factored into the query folding. Note that the Power Query mashup engine may be smart enough to reorder your query steps when it generates the source query.

    For a relational data source, if the step that prevents query folding could be achieved in a single SELECT statement—or within the procedural logic of a stored procedure—consider using a native query statement, as described next.

- **Use a native SQL query:** When a Power Query query retrieves data from a relational source, it's possible to use a native SQL query. The query can in fact be any valid statement, including a stored procedure execution. If the statement produces multiple result sets, only the first will be returned. Parameters can be declared in the statement, and we recommend that you use the [Value.NativeQuery](/powerquery-m/value-nativequery) M function to safely and conveniently pass parameter values. It's important to understand that the Power Query mashup engine can't fold later query steps, and so it's important to include all (or as much) transformation logic in the native query statement.

    There are two important considerations to bear in mind when using native SQL queries:

    - For a DirectQuery model table, the query must be a SELECT statement, and it can't use Common Table Expressions (CTEs) or a stored procedure
    - Incremental refresh can't leverage a native SQL query, and so it would force the Power Query mashup engine to retrieve all source rows, and then apply filters to determine incremental changes

    > [!IMPORTANT]
    > A native query can potentially do more than retrieve data. Any valid statement can be executed (and possibly multiple times), including one that modifies or deletes data. It's important to apply the principle of least privilege to ensure that the account used to access the database has only read permission on required data.

- **Prepare and transformation data in the source:** If you identify that certain Power Query query steps can't be folded, it may be possible to apply the transformations in the data source. It could be achieved by writing a database view that logically transforms source data, or by physically preparing and materializing data, in advance of Power BI querying it. A relational data warehouse is an excellent example of prepared data, usually consisting of pre-integrated sources of organizational data.

## Next steps

For more information about Query Folding and related topics, check out the following resources:

- [Query Folding](/power-query/power-query-folding) concept article
- [Use composite models in Power BI Desktop](../desktop-composite-models.md)
- [Incremental refresh in Power BI Premium](../service-premium-incremental-refresh.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
