---
title: "Prepare data for display in a tablix data region in a Power BI paginated report | Microsoft Docs"
description: Learn how to customize the paginated report display of data in Power BI Report Builder to show either all data retrieved or a subset of the data.
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Prepare data for display in a tablix data region in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  A tablix data region displays data from a dataset in a paginated report. You can view all the data retrieved for the dataset or you can create filters so that you see only a subset of the data. You can also add conditional expressions to fill in null values or modify the query for a dataset to include columns that define the sort order for an exist column.  
  
  
## Work with nulls and blanks in field values  
 Data for the field collection in a dataset includes all values retrieved from the data source at run time, including null values and blanks. Normally null values and blanks are indistinguishable. In most cases, this is the desired behavior. For example, Numeric aggregate functions like [Sum](/sql/reporting-services/report-design/report-builder-functions-sum-function) and [Avg](/sql/reporting-services/report-design/report-builder-functions-avg-function) ignore null values. For more information, see [Aggregate Functions Reference &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference).  
  
 If you do want to handle null values differently, you can use conditional expressions or custom code to substitute a custom value for the null value. For example, the following expression substitutes the text `Null` wherever a null value occurs in the field `[Size]`.  
  
```  
=IIF(Fields!Size.Value IS NOTHING,"Null",Fields!Size.Value)  
```  
  
 For more information about eliminating nulls in your data before retrieving the data from a SQL Server data source using Transact-SQL queries, see [NULL and UNKNOWN (Transact-SQL)](/sql/t-sql/language-elements/null-and-unknown-transact-sql).  
  
## Handle null field names  
 Testing for null values in an expression is fine as long as the field itself exists in the query result set. From custom code, you can test whether the field itself is present in the collection fields returned from the data source at run time. For more information, see [Dataset Fields Collection References &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/built-in-collections-dataset-fields-collection-references-report-builder.md).  
  
## Add a sort order column  
 By default, you can alphabetically sort values in a dataset field. To sort in a different order, you can add a new column to your dataset that defines the sort order you want in a data region. For example, to sort on the field `[Color]` and sort white and black items first, you can add a column `[ColorSortOrder]`, shown in the following query:  
  
```  
SELECT ProductID, p.Name, Color,  
   CASE  
      WHEN p.Color = 'White' THEN 1  
      WHEN p.Color = 'Black' THEN 2  
      WHEN p.Color = 'Blue' THEN 3  
      WHEN p.Color = 'Yellow' THEN 4  
      ELSE 5  
   END As ColorSortOrder  
FROM Production.Product p  
```  
  
 To sort a table data region according to this sort order, set the sort expression on the detail group to `=Fields!ColorSortOrder.Value`. For more information, see [Sort Data in a Data Region &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/sort-data-data-region-report-builder.md).  
  
## Related content

- [Dataset Fields Collection &#40;Power BI Report Builder&#41;](../../paginated-reports/report-data/dataset-fields-collection-report-builder.md)   
- [Expressions &#40;Power BI Report Builder&#41;](../../paginated-reports/expressions/report-builder-expressions.md)   
- [Filter, Group, and Sort Data &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/filter-group-sort-data-report-builder.md)  
  
  
