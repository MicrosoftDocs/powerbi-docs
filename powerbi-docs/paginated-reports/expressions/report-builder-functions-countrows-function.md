---
title: CountRows function in a Power BI paginated report | Microsoft Docs
description: Learn about the CountRows function, which returns the number of rows in a specified scope, including rows with null values in a Power BI paginated report. 
ms.date: 04/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.assetid: 5b1c403d-6afd-44c8-b5f6-5ecff2a29a45
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rodolfoc
---
# CountRows function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Returns the number of rows in the specified scope in a Power BI paginated report, including rows with null values.  
  
## Syntax  
  
```  
  
CountRows(scope, recursive)  
```  
  
### Parameters  

 *scope*  
 (**String**) The name of a dataset, data region, or group that contains the report items to count.  
  
 *recursive*  
 (**Enumerated Type**) Optional. **Simple** (default) or **RdlRecursive**. Specifies whether to perform the aggregation recursively.  
  
## Return type  
 Returns an **Integer**.  
  
## Remarks

 **CountRows** counts all rows in the specified scope, including rows that have null values.  
  
 The value of *scope* can't be an expression and must refer to the current scope or a containing scope.  
  
 For more information, see [Aggregate Functions Reference &#40;Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference) and [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections).  
  
 For more information about recursive aggregates, see [Creating Recursive Hierarchy Groups &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/creating-recursive-hierarchy-groups-report-builder-and-ssrs).  
  
## Example

 The following code example shows an expression that calculates the number of rows in a row group named `GroupbyCategory` (based on the expression `[Category]`).  
  
```  
="Number of rows: " & CountRows("GroupbyCategory")  
```  
  
## Next steps

- [Expressions in Power BI Report Builder](../expressions/report-builder-expressions.md)
- [Expression examples in Power BI Report Builder](../expressions/report-builder-expression-examples.md)
- [Expression Uses in Reports &#40;Report Builder)](expression-uses-reports-report-builder.md)   
- [Data Types in Expressions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/data-types-in-expressions-report-builder-and-ssrs)   
- [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/expression-scope-for-totals-aggregates-and-built-in-collections)  
