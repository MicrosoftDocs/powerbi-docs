---
title: Make Excel data work well with Q&A in Power BI
description: Learn how Power BI Q&A can work on any uploaded Excel file that contains tables, ranges, or a Power Pivot model.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 03/01/2023
LocalizationGroup: Ask questions of your data
---
# Make Excel data work well with Q&A in Power BI

If you create data models or build Excel workbooks for Power BI, this article can help you.

In Power BI, Q&A can search structured data and choose the right visualization for your question.

Q&A can work on any uploaded Excel file that contains tables, ranges, or a Power Pivot model. The more optimizations and data cleaning you do, the more robust Q&A performance is. If you plan on sharing reports and dashboards based on your semantic model, you want your colleagues to have an easy time asking questions and getting quality answers.

## How Q&A works with Excel

Q&A has a set of core natural language understanding abilities that work across your data. It has context-dependent keyword search for your Excel table, column, and calculated field names. It also has built-in knowledge for how to filter, sort, aggregate, group, and display data.

For example, in an Excel table named “Sales”, with columns “Product”, “Month”, “Units Sold”, “Gross Sales”, and “Profit”, you could ask questions about any of those entities. You could ask to show sales, total profit by month, sort products by units sold, and many others. Read more:

- [Using Q&A in dashboards and reports](power-bi-tutorial-q-and-a.md)
- [Visualization types you can specify in a Q&A query](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md)

Or get started.

## Prepare an Excel semantic model for Q&A

Q&A relies on the names of tables, columns, and calculated fields to answer data-specific questions, meaning what you call entities in your workbook is important!

Here are some tips for making the most of Q&A in your workbook:

* Make sure your data is in an Excel table. Here's [how to create an Excel table](https://support.office.com/article/Create-an-Excel-table-in-a-worksheet-e81aa349-b006-4f8a-9806-5af9df0ac664).
* Make sure the names of your tables, columns, and calculated fields make sense in natural speech.
  
    For example, if you have a table with sales data, call the table “Sales”. Column names like “Year”, “Product”, “Sales Rep”, and “Amount” work well with Q&A.

* If your workbook has a Power Pivot data model, you can do even more optimizations. Read [Demystifying Power BI Q&A part 2](https://powerbi.microsoft.com/blog/demystifying-power-bi-q-amp-a-part-2/) from our in-house team of natural language experts.

* Open the semantic model in Power BI Desktop. Create new columns and measures, concatenate fields to create unique values, and classify data by types such as dates, strings, geography, images, URLs, and more.

## Related content

- [Q&A for Power BI business users](../consumer/end-user-q-and-a.md)
- [Use Power BI Q&A to explore your data and create visuals](power-bi-tutorial-q-and-a.md)
- [Enable Q&A for live connections in Power BI](service-q-and-a-direct-query.md)
- [Data sources for the Power BI service](../connect-data/service-get-data.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
