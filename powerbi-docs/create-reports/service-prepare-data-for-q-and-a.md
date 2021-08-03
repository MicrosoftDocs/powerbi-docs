---
title: Make Excel data work well with Q&A in Power BI
description: How to make your data work well with Q&A in Power BI
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 05/13/2019
LocalizationGroup: Ask questions of your data
---
# Make Excel data work well with Q&A in Power BI
If you are a person who creates data models or builds Excel workbooks that will be used with Power BI, read on...

In Power BI, Q&A can search structured data and choose the right visualization for your question -- that's what makes it a compelling tool to use.   

Q&A can work on any uploaded Excel file that has tables, ranges, or contains a PowerPivot model, but the more optimizations and data cleaning you do, the more robust Q&A performance is.  If you plan on sharing reports and dashboards based on your dataset, you'll want your colleagues to have an easy time asking questions and getting quality answers.

## How Q&A works with Excel
Q&A has a set of core natural language understanding abilities that work across your data. It has context-dependent keyword search for your Excel table, column, and calculated field names. It also has built-in knowledge for how to filter, sort, aggregate, group, and display data. 

For example, in an Excel table named “Sales”, with columns “Product”, “Month”, “Units Sold”, “Gross Sales”, and “Profit”, you could ask questions about any of those entities.  You could ask to show sales, total profit by month, sort products by units sold, and many others. Read more about [using Q&A in dashboards and reports](power-bi-tutorial-q-and-a.md), and [visualization types you can specify in a Q&A query](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md).

## Prepare an Excel dataset for Q&A
Q&A relies on the names of tables, columns, and calculated fields to answer data-specific questions, meaning what you call entities in your workbook is important!

Here are some tips for making the most of Q&A in your workbook.

* Make sure your data is in an Excel table. Here's [how to create an Excel table](https://support.office.com/article/Create-an-Excel-table-in-a-worksheet-e81aa349-b006-4f8a-9806-5af9df0ac664).
* Make sure the names of your tables, columns, and calculated field make sense in natural speech.
  
  For example, if you have a table with sales data, call the table “Sales”. Column names like “Year”, “Product”, “Sales Rep”, and “Amount” will work well with Q&A.

* If your workbook has a Power Pivot data model, you can do even more optimizations. Read more about [Demystifying Power BI Q&A part 2](https://powerbi.microsoft.com/blog/demystifying-power-bi-q-amp-a-part-2/) from our in-house team of natural language experts.

* Open the dataset in Power BI Desktop and create new columns, create measures, concatenate fields to create unique values, classify data by type (e.g., dates, strings, geography, images, URLs), and more.

## Next steps

- [Q&A for consumers](../consumer/end-user-q-and-a.md)  
- [Use Q&A in dashboards and reports](power-bi-tutorial-q-and-a.md)
- [Prepare on-premises datasets for Q&A](service-q-and-a-direct-query.md)   
- [Get data (for Power BI)](../connect-data/service-get-data.md)  

More questions? [Try the Power BI Community](https://community.powerbi.com/)
