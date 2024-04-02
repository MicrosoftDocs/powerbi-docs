---
title: "RowNumber function in a paginated report"
description: Use the RowNumber function in Power BI Report Builder to return a running count of the number of rows in a paginated report for the specified scope.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Report Builder functions - RowNumber function in a paginated report (Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns a running count of the number of rows for the specified scope in a paginated report.

## Syntax

```syntaxsql
RowNumber(scope)
```

### Parameters

*scope*  
(**String**) The name of a dataset, data region, or group, or null (**Nothing** in Visual Basic), that specifies the context in which to evaluate the number of rows. **Nothing** specifies the outermost context, usually the report dataset.

## Remarks

**RowNumber** returns a running value of the count of rows within the specified scope, just as [RunningValue](/sql/reporting-services/report-design/report-builder-functions-runningvalue-function) returns the running value of an aggregate function. When you specify a scope, you specify when to reset the row count to 1.

*scope* cannot be an expression. *scope* must be a containing scope. Typical scopes, from the outermost to the innermost containment, are report dataset, data region, row groups or column groups.

To increment values across columns, specify a scope that is the name of a column group. To increment numbers down rows, specify a scope that is the name of a row group.

> [!NOTE]  
> Including aggregates that specify both a row group and a column group in a single expression is not supported.

For more information, see [Aggregate Functions Reference (Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md).

## Code Example

The following is an expression that you can use for the **BackgroundColor** property of a Tablix data region detail row to alternate the color of detail rows for each group, always beginning with White.

```
=IIF(RowNumber("GroupbyCategory") Mod 2, "White", "PaleGreen")
```

## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
