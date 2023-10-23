---
title: "Aggregate function in a paginated report"
description: The Aggregate Function returns a custom aggregate of a specified expression in a paginated report as the expression is defined by the data provider.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Report Builder functions - Aggregate function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns a custom aggregate of the specified expression in a paginated report, as defined by the data provider.

## Syntax

```syntaxsql
Aggregate(expression , scope)
```

### Parameters

*expression*  
The expression on which to perform the aggregation. The expression must be a simple field reference.

*scope*  
(**String**) The name of a dataset, group, or data region that contains the report items to which to apply the aggregate function. *Scope* must be a string constant and can't be an expression. If *scope* isn't specified, the current scope is used.

## Return Type

Return type is determined by the data provider. Returns **Nothing** if the data provider doesn't support this function or data isn't available.

## Remarks

The **Aggregate** function provides a way to use aggregates that are calculated on the external data source. Support for this feature is determined by the data extension. For example, the SQL Server Analysis Services data processing extension retrieves flattened rowsets from an MDX query. Some rows in the result set can contain aggregate values calculated on the data source server. These are known as *server aggregates*. To view server aggregates in the graphical query designer for Analysis Services, you can use the **Show Aggregate** button on the toolbar. For more information, see [Analysis Services MDX Query Designer User Interface (Report Builder)](/previous-versions/sql/).

When you display the combination of aggregate and detail dataset values on detail rows of a Tablix data region, server aggregates wouldn't typically be included because they aren't detail data. However, you may want to display all values retrieved for the dataset and customize the way aggregate data is calculated and displayed.

Report Builder detects the use of the **Aggregate** function in expressions in your report in order to determine whether to display server aggregates on detail rows. If you include **Aggregate** in an expression in a data region, server aggregates can only appear on group total or grand total rows, not on detail rows. If you want to display server aggregates on detail rows, don't use the **Aggregate** function.

You can change this default behavior by changing the value of the **Interpret subtotals as details** option on the **Dataset Properties** dialog box. When this option is set to **True**, all data, including server aggregates, appears as detail data. When set to **False**, server aggregates appear as totals. The setting for this property affects all data regions that are linked to this dataset.

> [!NOTE]  
> All containing groups for the report item that references **Aggregate** must have simple field references for their group expressions, for example, `[FieldName]`. You can't use **Aggregate** in a data region that uses complex group expressions. For the SQL Server Analysis Services data processing extension, your query must include MDX fields of type **LevelProperty** (not **MemberProperty**) to support aggregation using the **Aggregate**function.

*Expression* can contain calls to nested aggregate functions with the following exceptions and conditions:

- *Scope* for nested aggregates must be the same as, or contained by, the scope of the outer aggregate. For all distinct scopes in the expression, one scope must be in a child relationship to all other scopes.

- *Scope* for nested aggregates can't be the name of a dataset.

- *Expression* must not contain **First**, **Last**, **Previous**, or **RunningValue** functions.

- *Expression* must not contain nested aggregates that specify *recursive*.

For more information, see [Aggregate Functions Reference (Power BI Report Builder)](../report-builder-functions-aggregate-functions-reference.md) and [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md).

For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups (Power BI Report Builder)](./creating-recursive-hierarchy-groups-report-builder.md).

## Compare the Aggregate and Sum Functions

The **Aggregate** function differs from numeric aggregate functions like **Sum** in that the **Aggregate** function returns a value that is calculated by the data provider or data processing extension. Numeric aggregate functions like **Sum** return a value that is calculated by the report processor on a set of data from the dataset that is determined by the *scope* parameter. For more information, see the aggregate functions listed in [Aggregate Functions Reference (Power BI Report Builder)](../report-builder-functions-aggregate-functions-reference.md).

## Example

The following code example shows an expression that retrieves a server aggregate for the field `LineTotal`. The expression is added to a cell in a row that belongs to the group `GroupbyOrder`.

```
=Aggregate(Fields!LineTotal.Value, "GroupbyOrder")
```

## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
