---
title: "Plan a paginated report in Power BI Report Builder"
description: Learn how to create many kinds of paginated reports in Power BI Report Builder. To create a useful, easily understood report, it helps to plan first.
author: kfollis
ms.author: kfollis
ms.date: 01/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.assetid: 79113505-1ce8-4f8c-9260-d861838f7813
---
# Plan a paginated report in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

Power BI Report Builder lets you create many kinds of paginated reports. For example, you can create reports that show summary or detailed sales data, marketing and sales trends, operational reports, or dashboards. You can also create reports that take advantage of richly formatted text, such as for sales orders, product catalogs, or form letters. All these reports are created by using different combinations of the same basic building blocks in Report Builder. To create a useful, easily understood report, it helps to plan first. Here are some things you might want to consider before you get started:  
  
## What format do you want the report to appear in?
  
You can render reports online in a browser such as the Power BI portal or export them to other formats such as Excel, Word, or PDF. The final form your report takes is an important consideration because not all features are available in all export formats. 
  
## What structure do you want to use to present the data?
  
You have a choice among tabular, matrix (similar to a cross-tab or PivotTable report), chart, free-form structures, or any combination of these to present data. For more information, see [Tables, matrices, and lists in Power BI Report Builder](report-builder-tables-matrices-lists.md).  
  
## How do you want your report to look?
  
Report Builder provides numerous report items that you can add to your report to make it easier to read, highlight key information, help your audience navigate the report, and so on. Knowing how you want the report to appear can determine whether you need report items such as text boxes, rectangles, images, and lines. You might also want to show or hide items, add a document map, include drillthrough reports or subreports, or link to other reports.   
  
## Should the data be filtered?
  
You might want to narrow the scope of the report to specific users or locations, or to a particular time period. To filter the report data, use parameters to retrieve and display only the data you want. For more information, see [Report parameters in Power BI Report Builder](parameters/paginated-reports-create-parameters.md). 
  
## Do you need to create calculations? 
  
Sometimes, your data source and datasets don't contain the exact fields that you need for your report. You might have to create your own calculated fields. For example, you can multiply the price per unit times the quantity to get a line item sales amount. Expressions are also used to provide conditional formatting and other advanced features. For more information, see [Expressions in Power BI Report Builder](expressions/report-builder-expressions.md).  
  
## Do you want to hide report items initially?
  
Consider whether you want to hide report items, including data regions, groups, and columns, when the report is first run. For example, you can initially present a summary table, and then drill down into the detailed data. 
  
## How are you going to deliver your report?  
  
You can save your report to your local computer and continue to work on it, or run it locally for your own information. However, to share your report with others, you need to upload the report to Power BI. Uploading it to Power BI lets others run it whenever they want to. Alternatively, you can set up a subscription and deliver the report by email to other individuals. You can have the report delivered in a specific export format, if you prefer. 
  
## Related content

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
