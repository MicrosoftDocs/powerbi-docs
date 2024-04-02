---
title: "Union function in a paginated report"
description: Find out about this function that returns the union of all the non-null numeric values in a paginated report that are specified by an expression.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Report Builder functions - Union function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns the union of all the non-null numeric values specified by the expression, evaluated in the given scope in a paginated report.

## Syntax

```syntaxsql
Union(expression , scope , recursive)
```

### Parameters

*expression*  
(**SqlGeometry** or **SqlGeography**) The expression on which to perform the aggregation.

*scope*  
(**String**) Optional. The name of a dataset, group, or data region that contains the report items to which to apply the aggregate function. If *scope* is not specified, the current scope is used.

*recursive*  
(**Enumerated Type**) Optional. **Simple** (default) or **RdlRecursive**. Specifies whether to perform the aggregation recursively.

## Return

Returns a spatial object, either **SqlGeometry** or **SqlGeography**, based on the expression type. For more information about **SqlGeometry** and **SqlGeography** spatial data types, see [Spatial Data Types Overview](/sql/relational-databases/spatial/spatial-data-types-overview).

## Remarks

The set of data specified in the expression must have the same data type.

The value of *scope* must be a string constant and cannot be an expression. For outer aggregates or aggregates that do not specify other aggregates, *scope* must refer to the current scope or a containing scope. Dataset scopes are not supported. For aggregates of aggregates, nested aggregates can specify a child scope.

*Expression* can contain calls to nested aggregate functions with the following exceptions and conditions:

- *Scope* for nested aggregates must be the same as, or contained by, the scope of the outer aggregate. For all distinct scopes in the expression, one scope must be in a child relationship to all other scopes.

- *Scope* for nested aggregates cannot be the name of a dataset.

- *Expression* must not contain **First**, **Last**, **Previous**, or **RunningValue** functions.

- *Expression* must not contain nested aggregates that specify *recursive*.

For more information, see [Aggregate Functions Reference (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md).

For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups (Power BI Report Builder)](./creating-recursive-hierarchy-groups-report-builder.md).

## Example

The following table shows examples of **SqlGeometry** expressions and **Union** result expression, shown in WKT (Well Known Text) format for spatial data.

| Field with spatial data | Example | Union result |
| --- | --- | --- |
| [PointLocation] | POINT(1 2)<br /><br />POINT(3 4) | MULTIPOINT((1 2), (3 4)) |
| [PathDefinition] | LINESTRING(1 2, 3 4)<br /><br />LINESTRING(5 6, 7 8) | MULTILINESTRING((7 8, 5 6), (3 4, 1 2)) |
| [PolygonDefinition] | POLYGON((1 2, 3 4, 5 2, 1 2))<br /><br />POLYGON((-1 2, -3 4, -5 2, -1 2)) | MULTIPOLYGON(((1 2, 5 2, 3 4, 1 2)), ((-5 2, -1 2, -3 4, -5 2))) |

```
=Union(Fields!PointLocation.Value)
=Union(Fields!PathDefinition.Value)
=Union(Fields!PolygonDefinition.Value, "Group1")
```

## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
