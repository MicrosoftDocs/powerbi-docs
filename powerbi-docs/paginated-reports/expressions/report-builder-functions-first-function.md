---
title: First function in a Power BI paginated report | Microsoft Docs
description: Use the First function in a Power BI paginated report to return the first value in the given scope of the specified expression in Power BI Report Builder.
ms.date: 04/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.assetid: d0914520-30c5-4d63-9b59-8d9342ed63b9
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rodolfoc
---
# First function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns the first value in the given scope of the specified expression in a Power BI paginated report.  
  
## Syntax  
  
```  
  
First(expression, scope)  
```  
  
### Parameters

 *expression*  
 (**Variant** or **Binary**) The expression on which to perform the aggregation, for example, `=Fields!FieldName.Value`.  
  
 *scope*  
 (**String**) Optional. The name of a dataset, group, or data region that contains the report items to which to apply the aggregate function. If *scope* isn't specified, the current scope is used.  
  
## Return type

 Determined by the type of expression.  
  
## Remarks

 The **First** function returns the first value in a set of data after all sorting and filtering have been applied at the specified scope.  
  
 The **First** function can't be used in group filter expressions with anything except the current (default) scope.  
  
 You can also use **First** in a page header to return the first value from the **ReportItems** collection for a page in order to produce dictionary-style headings that display the first and last entries on a page.  
  
 The value of *scope* must be a string constant and can't be an expression. For outer aggregates or aggregates that don't specify other aggregates, *scope* must refer to the current scope or a containing scope. For aggregates of aggregates, nested aggregates can specify a child scope.  
  
 *Expression* can contain calls to nested aggregate functions with the following exceptions and conditions:  
  
-   *Scope* for nested aggregates must be the same as, or contained by, the scope of the outer aggregate. For all distinct scopes in the expression, one scope must be in a child relationship to all other scopes.  
  
-   *Scope* for nested aggregates can't be the name of a dataset.  
  
-   *Expression* must not contain **First**, **Last**, **Previous**, or **RunningValue** functions.  
  
-   *Expression* must not contain nested aggregates that specify *recursive*.  
  
 For more information, see [Aggregate Functions Reference &#40;Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections).  
  
 For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/creating-recursive-hierarchy-groups-report-builder-and-ssrs).  
  
## Example

 The following code example returns the first product number in the `Category` group of a data region:  
  
```  
=First(Fields!ProductNumber.Value, "Category")  
```  
  
## Next steps

- [Expressions in Power BI Report Builder](../expressions/report-builder-expressions.md)
- [Expression examples in Power BI Report Builder](../expressions/report-builder-expression-examples.md)
- [Expression uses in Power BI reports](expression-uses-reports-report-builder.md)   
- [Data Types in Expressions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/data-types-in-expressions-report-builder-and-ssrs)   
- [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections)  
