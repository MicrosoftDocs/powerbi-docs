---
title: CountDistinct function in a Power BI paginated report | Microsoft Docs
description: Get a count of all distinct non-null values that are specified by an expression in a Power BI paginated report in the context of a given scope.
ms.date: 04/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.assetid: 902c251e-e1e8-41d2-ac20-5bb6138ac410
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rodolfoc
---
# CountDistinct function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns a count of all distinct non-null values specified by the expression in a Power BI paginated report, evaluated in the context of the given scope.  
  
## Syntax  
  
```  
  
CountDistinct(expression, scope, recursive)  
```  
  
### Parameters

 *expression*  
 (**Variant**) The expression on which to perform the aggregation.  
  
 *scope*  
 (**String**) Optional. The name of a dataset, group, or data region that contains the report items to which to apply the aggregate function. If *scope* isn't specified, the current scope is used.  
  
 *recursive*  
 (**Enumerated Type**) Optional. **Simple** (default) or **RdlRecursive**. Specifies whether to perform the aggregation recursively.  
  
## Return type

 Returns an **Integer**.  
  
## Remarks

 The value of *scope* must be a string constant and can't be an expression. For outer aggregates or aggregates that don't specify other aggregates, *scope* must refer to the current scope or a containing scope. For aggregates of aggregates, nested aggregates can specify a child scope.  
  
 *Expression* can contain calls to nested aggregate functions with the following exceptions and conditions:  
  
-   *Scope* for nested aggregates must be the same as, or contained by, the scope of the outer aggregate. For all distinct scopes in the expression, one scope must be in a child relationship to all other scopes.  
  
-   *Scope* for nested aggregates can't be the name of a dataset.  
  
-   *Expression* must not contain **First**, **Last**, **Previous**, or **RunningValue** functions.  
  
-   *Expression* must not contain nested aggregates that specify *recursive*.  
  
 For more information, see [Aggregate Functions Reference &#40;Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder)](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections).  
  
 For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/creating-recursive-hierarchy-groups-report-builder-and-ssrs).  
  
## Example  
 The following code example shows an expression that calculates the number of unique non-null values of `Size` for the default scope and for a parent group scope. The expression is added to a cell in a row that belongs to the child group `GroupbySubcategory`. The parent group is `GroupbyCategory`. The expression displays the results for `GroupbySubcategory` (the default scope) and then for `GroupbyCategory` (the parent group scope).  
  
> [!NOTE]  
> Expressions should not contain actual carriage returns and line breaks; these are included in the example code to support documentation renderers. If you copy the following example, remove carriage returns from each line.  
  
```  
="Distinct count (Subcategory): " & CountDistinct(Fields!Size.Value) &   
"Distinct count (Category): " & CountDistinct(Fields!Size.Value,"GroupbyCategory")  
```  
  
## Next steps

- [Expressions in Power BI Report Builder](../expressions/report-builder-expressions.md)
- [Expression examples in Power BI Report Builder](../expressions/report-builder-expression-examples.md)
- [Expression Uses in Reports &#40;Report Builder and SSRS&#41;](expression-uses-reports-report-builder.md)   
- [Data Types in Expressions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/data-types-in-expressions-report-builder-and-ssrs)   
- [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections)  
