---
title: "Previous function in a Power BI paginated report"
description: The Previous function in Power BI Report Builder returns the value or the specified aggregate value for the previous instance of an item in a Power BI paginated report.
author: maggiesMSFT
ms.author: maggies
ms.date: 04/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
ms.reviewer: spendrick
---
# Previous function in a Power BI paginated report

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns the value or the specified aggregate value for the previous instance of an item within the specified scope in a Power BI paginated report.  
  
## Syntax  
  
```  
  
Previous(expression, scope)  
```  
  
### Parameters

 *expression*  
 (**Variant** or **Binary**) The expression to use to identify the data and for which to retrieve the previous value, for example, `Fields!Fieldname.Value` or `Sum(Fields!Fieldname.Value)`.  
  
 *scope*  
 (**String**) Optional. The name of a group or data region, or null (**Nothing** in  Visual Basic), that specifies the scope from which to retrieve the previous value specified by *expression*.  
  
## Return type

 Returns a **Variant** or **Binary**.  
  
## Remarks  
 The **Previous** function returns the previous value for the expression evaluated in the specified scope after all sorting and filtering have been applied.  
  
 If *expression* doesn't contain an aggregate, the **Previous** function defaults to the current scope for the report item.  
  
 In a details group, use **Previous** to specify the value of a field reference in the previous instance of the detail row.  
  
> [!NOTE]  
>  The **Previous** function only supports field references in the details group. For example, in a text box in the details group, `=Previous(Fields!Quantity.Value)` returns the data for the field `Quantity` from the previous row. In the first row, this expression returns a null (**Nothing** in  Visual Basic).  
  
 If *expression* contains an aggregate function that uses a default scope, **Previous** aggregates the data within the previous instance of the scope specified in the aggregate function call.  
  
 If *expression* contains an aggregate function that specifies a scope other than the default, the *scope* parameter for the **Previous** function must be a containing scope for the scope specified in the aggregate function call.  
  
 The functions **Level**, **InScope**, **Aggregate** and **Previous** can't be used in the *expression* parameter. Specifying the *recursive* parameter for any aggregate function isn't supported.  
  
 For more information, see [Aggregate Functions Reference &#40;Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections).  
  
## Examples  
  
### Description  
 The following code example, when placed in the default data row of a data region, provides the value for the field `LineTotal` in the previous row.  
  
### Code  
  
```  
=Previous(Fields!LineTotal.Value)  
```  
  
### Description  
 The following example shows an expression that calculates the sum of sales on a specific day of the month and the previous value for that day of the month in a previous year. The expression is added to a cell in a row that belongs to the child group `GroupbyDay`. Its parent group is `GroupbyMonth`, which has a parent group `GroupbyYear`. The expression displays the results for GroupbyDay (the default scope) and then for `GroupbyYear` (the parent of the parent group `GroupbyMonth`).  
  
 For example, for a data region with a parent group named `Year`, its child group named `Month`, and its child group named `Day` (3 nested levels). The expression `=Previous(Sum(Fields!Sales.Value,"Day"),"Year")` in a row associated with the group `Day` returns the sales value for the same day and month for the previous year.  
  
### Code  
  
```  
=Sum(Fields!Sales.Value) & " " & Previous(Sum(Fields!Sales.Value,"GroupbyDay"),"GroupbyYear")  
```  
  
## Related content

* [Expression uses in reports (Power BI Report Builder and service)](../expressions/expression-uses-reports-report-builder.md)   
 * [Expression examples (Power BI Report Builder and service)](../expressions/report-builder-expression-examples.md)   
 * [Data Types in Expressions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/data-types-in-expressions-report-builder-and-ssrs)   
 * [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections)  
  
  
