---
title: Query folding guidance in Power BI Desktop
description: Guidance for achieving Power Query query folding in Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 11/10/2023
---

# Query folding guidance in Power BI Desktop

This article targets data modelers developing models in Power BI Desktop. It provides best practice guidance on when—and how—you can achieve Power Query query folding.

_Query folding_ is the ability for a Power Query query to generate a single query statement that retrieves and transforms source data. For more information, see [Power Query query folding](/power-query/power-query-folding).

## Guidance

Query folding guidance differs based on the model mode.

For a **DirectQuery** or **Dual** storage mode table, the Power Query query must achieve query folding.

For an **Import** table, it may be possible to achieve query folding. When the query is based on a relational source—and if a single SELECT statement can be constructed—you achieve _best data refresh performance_ by ensuring that query folding occurs. If the Power Query mashup engine is still required to process transformations, you should strive to minimize the work it needs to do, especially for large semantic models ([previously known as datasets](../connect-data/service-datasets-rename.md)).

The following bulleted-list provides specific guidance.

- **Delegate as much processing to the data source as possible**: When all steps of a Power Query query can't be folded, discover the step that prevents query folding. When possible, move later steps earlier in sequence so they may be factored into the query folding. Note the Power Query mashup engine may be smart enough to reorder your query steps when it generates the source query.

    For a relational data source, if the step that prevents query folding could be achieved in a single SELECT statement—or within the procedural logic of a stored procedure—consider using a native SQL query, as described next.

- **Use a native SQL query**: When a Power Query query retrieves data from a relational source, it's possible for some sources to use a native SQL query. The query can in fact be any valid statement, including a stored procedure execution. If the statement produces multiple result sets, only the first will be returned. Parameters can be declared in the statement, and we recommend that you use the [Value.NativeQuery](/powerquery-m/value-nativequery) M function. This function was designed to safely and conveniently pass parameter values. It's important to understand that the Power Query mashup engine can't fold later query steps, and so you should include all—or as much—transformation logic in the native query statement.

    There are two important considerations you need to bear in mind when using native SQL queries:

    - For a DirectQuery model table, the query must be a SELECT statement, and it can't use Common Table Expressions (CTEs) or a stored procedure.
    - Incremental refresh can't use a native SQL query. So, it would force the Power Query mashup engine to retrieve all source rows, and then apply filters to determine incremental changes.

    > [!IMPORTANT]
    > A native SQL query can potentially do more than retrieve data. Any valid statement can be executed (and possibly multiple times), including one that modifies or deletes data. It's important that you apply the principle of least privilege to ensure that the account used to access the database has only read permission on required data.

- **Prepare and transform data in the source**: When you identify that certain Power Query query steps can't be folded, it may be possible to apply the transformations in the data source. The transformations could be achieved by writing a database view that logically transforms source data. Or, by physically preparing and materializing data, in advance of Power BI querying it. A relational data warehouse is an excellent example of prepared data, usually consisting of pre-integrated sources of organizational data.

## Related content

For more information about this article, check out the following resources:

- Power Query [Query folding](/power-query/power-query-folding) concept article
- [Incremental refresh for semantic models](../connect-data/incremental-refresh-overview.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
