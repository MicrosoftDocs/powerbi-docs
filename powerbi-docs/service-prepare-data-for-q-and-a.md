---
title: Make your data work well with Q&A in Power BI
description: Make your data work well with Q&A in Power BI
services: powerbi
documentationcenter: ''
author: mihart
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/26/2017
ms.author: mihart

---
# Make your data work well with Q&A in Power BI
If you are a person who creates data models or builds Excel workbooks that will be used with Power BI, read on...

In Power BI, Q&A can search structured data and choose the right visualization for your question -- that's what makes it a compelling tool to use.   

Q&A can work on any uploaded Excel file that has tables, ranges, or contains a PowerPivot model, but the more optimizations and data cleaning you do, the more robust Q&A performance is. 

## How Q&A works
Q&A has a set of core natural language understanding abilities that work across your data. It has context-dependent keyword search for your Excel table, column, and calculated field names. Second, it has built-in knowledge for how to filter, sort, aggregate, group, and display data. 

For example, in an Excel table named “Sales”, with columns “Product”, “Month”, “Units Sold”, “Gross Sales”, and “Profit”, you could ask questions about any of those entities.  You could ask to show sales, total profit by month, sort products by units sold, and many others. Read more about the [kinds of questions you can ask](http://blogs.msdn.com/b/powerbi/archive/2014/02/27/demystifying-power-bi-q-amp-a-part-1.aspx), and [asking questions using a question template](service-q-and-a.md) and [visualization types you can specify in a Q&A query](power-bi-visualization-types-for-reports-and-q-and-a.md).

## Prepare a workbook for Q&A
Q&A relies on the names of tables, columns, and calculated fields to answer data-specific questions, meaning what you call entities in your workbook is important!

Here are some tips for making the most of Q&A in your workbook.

* Make sure your data is in an Excel table. Here's [how to create an Excel table](https://support.office.com/article/Create-an-Excel-table-in-a-worksheet-e81aa349-b006-4f8a-9806-5af9df0ac664?ui=en-US&rs=en-US&ad=US).
* Make sure the names of your tables, columns, and calculated field make sense in English.
  
  For example, if you have a table with sales data, call the table “Sales”. Column names like “Year”, “Product”, “Sales Rep”, and “Amount” will work well with Q&A.

> [!NOTE]
> If your workbook has a Power Pivot data model, you can do even more optimizations. Read more about [Demystifying Power BI Q&A part 2](http://blogs.msdn.com/b/powerbi/archive/2014/02/27/demystifying-power-bi-q-amp-a-part-2.aspx) from our in-house team of natural language experts.
> 
> 

## Next steps
[Q&A in Power BI](service-q-and-a.md)  
[Tutorial: Introduction to Power BI Q&A](power-bi-visualization-introduction-to-q-and-a.md)  
[Get data (for Power BI)](service-get-data.md)  
[Power BI - Basic Concepts](service-basic-concepts.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

