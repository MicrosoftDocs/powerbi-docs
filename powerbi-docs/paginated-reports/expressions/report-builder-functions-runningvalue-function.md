---
title: "RunningValue function in a paginated report"
description: Get acquainted with the RunningValue function, which returns a running aggregate of all non-null numeric values in a paginated report specified by the expression in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Report Builder functions - RunningValue function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns a running aggregate of all non-null numeric values specified by the expression, evaluated for the given scope in a paginated report.

## Syntax

```syntaxsql
RunningValue(expression , function , scope)
```

### Parameters

*expression*  
The expression on which to perform the aggregation, for example, `[Quantity]`.

*function*  
(**Enum**) The name of the aggregate function to apply to the expression, for example, **Sum**. This function cannot be **RunningValue**, **RowNumber**, or **Aggregate**.

*scope*  
(**String**) A string constant that is the name of a dataset, data region, or group, or null (**Nothing** in Visual Basic), that specifies the context in which to evaluate the aggregation. **Nothing** specifies the outermost context, usually the report dataset.

## Return Type

Determined by the aggregate function that is specified in the *function* parameter.

## Remarks

The value for **RunningValue** resets to 0 for each new instance of the scope. If a group is specified, the running value is reset when the group expression changes. If a data region is specified, the running value is reset for each new instance of the data region. If a dataset is specified, the running value is not reset throughout the entire dataset.

**RunningValue** cannot be used in a filter or sort expression.

The set of data for which the running value is calculated must have the same data type. To convert data that has multiple numeric data types to the same data type, use conversion functions like **CInt**, **CDbl** or **CDec**. For more information, see [Type Conversion Functions](/dotnet/visual-basic/language-reference/functions/type-conversion-functions).

*Scope* cannot be an expression.

*Expression* can contain calls to nested aggregate functions with the following exceptions and conditions:

- Scope for nested aggregates must be the same as, or contained by, the scope of the outer aggregate. For all distinct scopes in the expression, one scope must be in a child relationship to all other scopes.

- Scope for nested aggregates cannot be the name of a dataset.

- *Expression* must not contain **First**, **Last**, **Previous**, or **RunningValue** functions.

- *Expression* must not contain nested aggregates that specify *recursive*.

To calculate the running value of the number of rows, use **RowNumber**. For more information, see [RowNumber Function (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-rownumber-function).

For more information, see [Aggregate Functions Reference (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md).

For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups (Power BI Report Builder)](./creating-recursive-hierarchy-groups-report-builder.md).

## Examples

The following code example provides a running sum of the field named `Cost` in the outermost scope, which is the dataset.

```
=RunningValue(Fields!Cost.Value, Sum, Nothing)
```

The following code example provides a running sum of the field named `Score` in the dataset named `DataSet1`.

```
=RunningValue(Fields!Score.Value,sum,"DataSet1")
```

The following code example provides a running sum of the field named `Traffic Charges` in the outermost scope.

```
=RunningValue(Fields!Traffic Charges.Value, Sum, Nothing)
```

## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
