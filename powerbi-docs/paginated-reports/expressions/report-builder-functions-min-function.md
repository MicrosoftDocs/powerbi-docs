---
title: "Min function in a paginated report"
description: Learn about the Min function in a paginated report, which returns the minimum value of all non-null numeric values specified by an expression in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Report Builder functions - Min function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns the minimum value of all non-null numeric values specified by the expression, in the context of the given scope in a paginated report.

## Syntax

```syntaxsql
Min(expression , scope , recursive)
```

### Parameters

*expression*  
(**Variant**) The expression on which to perform the aggregation.

*scope*  
(**String**) Optional. The name of a dataset, group, or data region that contains the report items to which to apply the aggregate function. If *scope* isn't specified, the current scope is used.

*recursive*  
(**Enumerated Type**) Optional. **Simple** (default) or **RdlRecursive**. Specifies whether to perform the aggregation recursively.

## Return Type

Determined by the type of the expression.

## Remarks

The set of data specified in the expression must have the same data type. To convert data that has multiple numeric data types to the same data type, use conversion functions like **CInt**, **CDbl** or **CDec**. For more information, see [Type Conversion Functions](/dotnet/visual-basic/language-reference/functions/type-conversion-functions).

The value of *scope* must be a string constant and can't be an expression. For outer aggregates or aggregates that don't specify other aggregates, *scope* must refer to the current scope or a containing scope. For aggregates of aggregates, nested aggregates can specify a child scope.

*Expression* can contain calls to nested aggregate functions with the following exceptions and conditions:

- *Scope* for nested aggregates must be the same as, or contained by, the scope of the outer aggregate. For all distinct scopes in the expression, one scope must be in a child relationship to all other scopes.

- *Scope* for nested aggregates can't be the name of a dataset.

- *Expression* must not contain **First**, **Last**, **Previous**, or **RunningValue** functions.

- *Expression* must not contain nested aggregates that specify *recursive*.

For more information, see [Aggregate Functions Reference (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md).

For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups (Power BI Report Builder)](./creating-recursive-hierarchy-groups-report-builder.md).

## Example

The following code example provides the lowest total in the current scope.

```
=Min(Fields!OrderTotal.Value)
```

## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
