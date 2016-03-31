<properties
   pageTitle="Import Excel data into Power BI"
   description="Import Excel data into Power BI"
   services="powerbi"
   documentationCenter=""
   authors="Minewiskan"
   manager="mblythe"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/20/2016"
   ms.author="owend"/>
# Import Excel data into Power BI

You can use any XLSX Excel workbook - Excel 2007, 2010, and 2013 - as a dataset for your Power BI dashboards and reports.

**Note:** This article describes importing data into a new dataset and Power View sheets into reports. You can also connect to your Excel workbooks (without importing any data or reports) on OneDrive for Business. To learn more, see [Bring whole Excel files into Power BI](powerbi-bring-in-whole-excel-files.md).

When importing, for the best results:
-  Your data should be in table format. To learn more, see [Instructions for formatting Excel data as a table](https://support.office.com/article/Create-an-Excel-table-in-a-worksheet-e81aa349-b006-4f8a-9806-5af9df0ac664?ui=en-US&rs=en-US&ad=US).
-  Your data should be loaded into the Excel data model. Don't worry if you don't know how to do this, it's not required, but if you want to learn more, see [Create a Data Model in Excel](https://support.office.com/en-us/article/Create-a-Data-Model-in-Excel-87e7a54c-87dc-488e-9410-5c75dbcb0f7b).
-  Data types for columns are specified (e.g, date, number). To learn more, see [Data types in Excel data models](https://support.office.com/Article/Data-Types-Supported-in-Data-Models-e2388f62-6122-4e2b-bcad-053e3da9ba90) and [Formatting number data types in Excel](https://support.office.com/article/Format-numbers-f27f865b-2dc5-4970-b289-5286be8b994a).

This video demonstrates getting your Excel data ready for Power BI:

<iframe width="500" height="281" src="https://www.youtube.com/embed/l2wy4XgQIu0" frameborder="0" allowfullscreen></iframe>

## What's imported?

Power BI brings in:
-   **The data in the workbook** from worksheet tables or from the Excel data model. Data model content takes precedence over worksheet content.
-   **Power View sheets**, but not PivotTables or PivotCharts or custom fields. If your workbook has PivotTables or PivotCharts, consider [bringing the whole Excel file into Power BI](powerbi-bring-in-whole-excel-files.md) instead.
-   **Measures** from a data model. If your workbook contains a data model, and you've created your own measures in Power Pivot, they'll be imported along with the data.

## Data types

Power BI recognizes values and supports these data types: Whole Number, Decimal Number, Currency, Date, True/False, Text.  Marking data as specific data types in Excel will improve the Power BI experience.

## Refresh Excel workbook data
One of the really great features in Power BI is being able to automatically refresh the data behind your reports. The type of data you have in your workbook and where you connected to your workbook from will make a big difference on what and how you can refresh your data. Before jumping right in, it's important to understand how refresh in Power BI works and how you can setup refresh for your particular scenario. It's a pretty big subject, and we're not going to cover it all here, but you can get all the info you need in [Data refresh in Power BI](powerbi-refresh-data.md).

## Troubleshooting

Currently, when you connect to an Excel workbook as a dataset, Power BI only imports data that is part of a named table or a data model. As a result, if the workbook contains no named tables, Power View sheets, or Excel data models, you might see this error: "We couldn't find any data in your Excel workbook". [This article](powerbi-admin-troubleshoot-excel-workbook-data.md) explains how to fix your workbook and re-import it.
