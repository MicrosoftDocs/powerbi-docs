---
title: "Filter equation examples in a paginated report"
description: Find out how to create a paginated report filter. Consider these examples of often-used filters to create your own.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Filter equation examples in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  To create a filter in a paginated report, you must specify one or more filter equations. A filter equation includes an expression, a data type, an operator, and a value. This topic provides examples of commonly used filters.

## Filter Examples

The following table shows examples of filter equations that use different data types and different operators. The scope for the comparison is determined by the report item for which a filter is defined. For example, for a filter defined on a dataset, **TOP % 10** is the top 10 percent of values in the dataset; for a filter defined on a group, **TOP % 10** is the top 10 percent of values in the group.

| Simple Expression | Data Type | Operator | Value | Description |
| --- | --- | --- | --- | --- |
| `[SUM(Quantity)]` | **Integer** | **>** | `7` | Includes data values that are greater than 7. |
| `[SUM(Quantity)]` | **Integer** | **TOP N** | `10` | Includes the top 10 data values. |
| `[SUM(Quantity)]` | **Integer** | **TOP %** | `20` | Includes the top 20% of data values. |
| `[Sales]` | **Text** | **>** | `=CDec(100)` | Includes all values of type System.Decimal (SQL "money" data types) greater than $100. |
| `[OrderDate]` | **DateTime** | **>** | `2008-01-01` | Includes all dates from January 1, 2008 to the present date. |
| `[OrderDate]` | **DateTime** | **BETWEEN** | `2008-01-01`<br /><br />`2008-02-01` | Includes dates from January 1, 2008 up to and including February 1, 2008. |
| `[Territory]` | **Text** | **LIKE** | `*east` | All territory names that end in "east". |
| `[Territory]` | **Text** | **LIKE** | `%o%th*` | All territory names that include North and South at the beginning of the name. |
| `=LEFT(Fields!Subcat.Value,1)` | **Text** | **IN** | `B, C, T` | All subcategory values that begin with the letters B, C, or T. |

## Next steps

- [Report Parameters (Power BI Report Builder)](../parameters/paginated-reports-create-parameters.md)
- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
