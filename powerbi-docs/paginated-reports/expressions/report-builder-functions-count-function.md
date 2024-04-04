---
title: "Count function in a paginated report"
description: Learn about the Count function, which returns a count of non-null values specified by an expression, which is evaluated in the context of a specified scope in a paginated report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Report Builder functions - Count function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns a count of non-null values specified by the expression in a paginated report, evaluated in the context of the given scope.

## Syntax

```syntaxsql
Count(expression , scope , recursive)
```

### Parameters

*expression*  
(**Variant** or **Binary**) The expression on which to perform the aggregation, for example, `=Fields!FieldName.Value`.

*scope*  
(**String**) The name of a dataset, group, or data region that contains the report items to which to apply the aggregate function. If *scope* isn't specified, the current scope is used.

*recursive*  
(**Enumerated Type**) Optional. **Simple** (default) or **RdlRecursive**. Specifies whether to perform the aggregation recursively.

## Return Type

Returns an **Integer**.

## Remarks

The value of *scope* must be a string constant and can't be an expression. For outer aggregates or aggregates that don't specify other aggregates, *scope* must refer to the current scope or a containing scope. For aggregates of aggregates, nested aggregates can specify a child scope.

*Expression* can contain calls to nested aggregate functions with the following exceptions and conditions:

- *Scope* for nested aggregates must be the same as, or contained by, the scope of the outer aggregate. For all distinct scopes in the expression, one scope must be in a child relationship to all other scopes.

- *Scope* for nested aggregates can't be the name of a dataset.

- *Expression* must not contain **First**, **Last**, **Previous**, or **RunningValue** functions.

- *Expression* must not contain nested aggregates that specify *recursive*.

For more information, see [Aggregate Functions Reference (Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md).

For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups (Power BI Report Builder)](./creating-recursive-hierarchy-groups-report-builder.md).

## Description

The following code example shows an expression that calculates the number of non-null values of `Size` for the default scope and for a parent group scope. The expression is added to a cell in a row that belongs to the child group `GroupbySubcategory`. The parent group is `GroupbyCategory`. The expression displays the results for `GroupbySubcategory` (the default scope) and then for `GroupbyCategory` (the parent group scope).

> [!NOTE]  
> Expressions should not contain actual carriage returns and line breaks; these are included in the example to support documentation renderers. If you copy the following example, remove carriage returns from each line.

## Code

```
="Count (Subcategory): " & Count(Fields!Size.Value) &
"Count (Category): " & Count(Fields!Size.Value,"GroupbyCategory")
```

## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
