---
title: "Troubleshoot charts in Power BI paginated report | Microsoft Docs"

description: Use fields with numeric data types along the value axis, rather than formatted numbers, to display a numeric value in a Power BI paginated report.
ms.date: 03/10/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Troubleshoot charts in Power BI paginated report (Power BI Report Builder)


  These issues can be helpful when working with charts in a Power BI paginated report.  
  
> [!NOTE]  
>  You can create and modify Power BI paginated report definition (.rdl) files in Power BI Report Builder. 
  
## Why does my chart count, not sum, the values on the value axis?  
 Most chart types require numeric values along the value axis, which is typically the y-axis, in order to draw correctly. If the data type of your value field is **String**, the chart cannot display a numeric value, even if there are numerals in the fields. Instead, the chart displays a count of the total number of rows that contain a value in that field. To avoid this behavior, make sure that the fields that you use for value series have numeric data types, as opposed to strings that contain formatted numbers.  
  
  
## Next steps  
 [Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/charts-report-builder-and-ssrs)  
  
  
