---
title: "Commonly used filters in a Power BI paginated report | Microsoft Docs"
description: Consider these examples of filters in a Power BI paginated report along with the filter equations you specify to create the filter in Power BI Report Builder.
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 01/18/2023
---
# Commonly used filters in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  To create a filter in a Power BI paginated report, you must specify one or more filter equations. A filter equation includes an expression, a data type, an operator, and a value. This topic provides examples of commonly used filters. 
  
## Filter examples  
 The following table shows examples of filter equations that use different data types and different operators. The scope for the comparison is determined by report item for which a filter is defined. For example, for a filter defined on a dataset, **TOP % 10** is the top 10 percent of values in the dataset; for a filter defined on a group, **TOP % 10** is the top 10 percent of values in the group.  
  
|Simple Expression|Data Type|Operator|Value|Description|  
|-----------------------|---------------|--------------|-----------|-----------------|  
|`[SUM(Quantity)]`|**Integer**|**>**|`7`|Includes data values that are greater than 7.|  
|`[SUM(Quantity)]`|**Integer**|**TOP N**|`10`|Includes the top 10 data values.|  
|`[SUM(Quantity)]`|**Integer**|**TOP %**|`20`|Includes the top 20% of data values.|  
|`[Sales]`|**Text**|**>**|`=CDec(100)`|Includes all values of type System. Decimal (SQL "money" data types) greater than $100.|  
|`[OrderDate]`|**DateTime**|**>**|`2088-01-01`|Includes all dates from January 1, 2008 to the present date.|  
|`[OrderDate]`|**DateTime**|**BETWEEN**|`2008-01-01`<br /><br /> `2008-02-01`|Includes dates from January 1, 2008 up to and including February 1, 2008.|  
|`[Territory]`|**Text**|**LIKE**|`*east`|All territory names that end in "east".|  
|`[Territory]`|**Text**|**LIKE**|`%o%th*`|All territory names that include North and South at the beginning of the name.|  
|`=LEFT(Fields!Subcat.Value,1)`|**Text**|**IN**|`B, C, T`|All subcategory values that begin with the letters B, C, or T.|  
  
## Examples with report parameters  
 The following table provides examples of filter expression that includes a single-value or multivalue parameter reference.  
  
|Parameter type|(Filter) Expression|Operator|Value|Data Type|  
|--------------------|---------------------------|--------------|-----------|---------------|  
|Single value|`[EmployeeID]`|=|`[@EmployeeID]`|Integer|  
|Multivalue|`[EmployeeID]`|IN|`[@EmployeeID]`|Integer|  
  
## Related content

- [Report Parameters (Power BI Report Builder)](../parameters/report-builder-parameters.md)
- [Add Dataset Filters, Data Region Filters, and Group Filters &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/add-dataset-filters-data-region-filters-and-group-filters)   
- [Expression Uses in Reports &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/expression-uses-in-reports-report-builder-and-ssrs)   
- [Expression examples in Power BI Report Builder](../expressions/report-builder-expression-examples.md)
- [Data Types in Expressions &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/data-types-in-expressions-report-builder-and-ssrs)  
  
  
