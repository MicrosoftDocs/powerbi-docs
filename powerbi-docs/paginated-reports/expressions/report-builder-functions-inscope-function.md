---
title: "InScope function in a paginated report"
description: The InScope function in a paginated report indicates whether the current instance of an item is in the specified scope in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
ms.reviewer: rpatkar
---
# Report Builder functions - InScope function in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Indicates whether the current instance of an item is in the specified scope in a paginated report.  
  
## Syntax  
  
```  
InScope(scope)  
```  
  
#### Parameters  
 *scope*  
 (**String**) The name of a dataset, data region, or group that specifies a scope.  
  
## Return Type  
 Returns a **Boolean**.  
  
## Remarks  
 The **InScope** function tests the scope of the current instance of a report item for membership in the scope specified by the *scope* parameter.  
  
 *Scope* cannot be an expression.  
  
 A typical use for the **InScope** function is in data regions that have dynamic scoping. For example, **InScope** can be used in a drillthrough link in data region cells to provide a different report name and different sets of parameters depending on which cell is clicked. An example of this is as follows:  
  
-   The following expression, used as the report name in a drillthrough link, opens the `ProductDetail` report if the clicked cell is in the `Month` group, and the `ProductSummary` report if it is not.  
  
    ```  
    =Iif(InScope("Month"), "ProductDetail", "ProductSummary")  
    ```  
  
-   The following expression, used in the **Omit** property of a drillthrough report parameter, will pass the parameter to the target report only if the clicked cell is in the `Product` group.  
  
    ```  
    =Not(InScope("Product"))  
    ```  
  
 For more information, see [Aggregate Functions Reference &#40;Power BI Report Builder&#41;](./report-builder-functions-aggregate-functions-reference.md) and [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](./expression-scope-for-totals-aggregates-and-built-in-collections.md).  
  
## Example  
 The following code example indicates whether the current instance of the item is in the `Product` dataset, data region, or group scope.  
  
```  
=InScope("Product")  
```  
  
## See Also  
 [Expression Uses in Reports &#40;Power BI Report Builder&#41;](./expression-uses-reports-report-builder.md)   
 [Expression Examples &#40;Power BI Report Builder&#41;](./report-builder-expression-examples.md)   
 [Data Types in Expressions &#40;Power BI Report Builder&#41;](./data-types-expressions-report-builder.md)   
 [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](./expression-scope-for-totals-aggregates-and-built-in-collections.md)  
  
  
