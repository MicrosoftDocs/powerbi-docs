---
title: "Last function in a Power BI paginated report"
description: The Last function returns the final value in a set of data in a Power BI paginated report after all sorting and filtering have been applied at the specified scope in Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.date: 04/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
ms.reviewer: spendrick
---
# Last function in a Power BI paginated report

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns the last value in the given scope of the specified expression in a Power BI paginated report.  
  
## Syntax  
  
```  
  
Last(expression, scope)  
```  
  
### Parameters  
 *expression*  
 (**Variant** or **Binary**) The expression on which to perform the aggregation, for example, `=Fields!Fieldname.Value`.  
  
 *scope*  
 (**String**) (Optional) The name of a dataset, data region, or group that contains the report items to which to apply the function. If *scope* isn't specified, the current scope is used.  
  
## Return type  
 Determined by the type of expression.  
  
## Remarks  
 The **Last** function returns the final value in a set of data after all sorting and filtering have been applied at the specified scope.  
  
 The **Last** function can't be used in group filter expressions with anything except the current (default) scope.  
  
 You can also use **Last** in a page header to return the last value from the **ReportItems** collection for a page in order to produce dictionary-style headings that display the first and last entries on a page.  
  
 The value of *scope* must be a string constant and can't be an expression. For outer aggregates or aggregates that don't specify other aggregates, *scope* must refer to the current scope or a containing scope. For aggregates of aggregates, nested aggregates can specify a child scope.  
  
 *Expression* can contain calls to nested aggregate functions with the following exceptions and conditions:  
  
-   *Scope* for nested aggregates must be the same as, or contained by, the scope of the outer aggregate. For all distinct scopes in the expression, one scope must be in a child relationship to all other scopes.  
  
-   *Scope* for nested aggregates can't be the name of a dataset.  
  
-   *Expression* must not contain **First**, **Last**, **Previous**, or **RunningValue** functions.  
  
-   *Expression* must not contain nested aggregates that specify *recursive*.  
  
 For more information, see [Aggregate Functions Reference &#40;Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections).  
  
 For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/creating-recursive-hierarchy-groups-report-builder-and-ssrs).  
  
## Example  
 The following code example returns the last product number in the `Category` group of a data region.  
  
```  
=Last(Fields!ProductNumber.Value, "Category")  
```  
  
## Related content

- [Expression uses in reports (Power BI Report Builder and service)](../expressions/expression-uses-reports-report-builder.md)   
- [Expression examples (Power BI Report Builder and service)](../expressions/report-builder-expression-examples.md)   
- [Data Types in Expressions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/data-types-in-expressions-report-builder-and-ssrs)   
- [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections)  
  
  
