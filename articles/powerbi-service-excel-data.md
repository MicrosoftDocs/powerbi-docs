<properties 
   pageTitle="Excel data in Power BI"
   description="Excel data in Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="v-anpasi" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="09/28/2015"
   ms.author="v-anpasi"/>
# Excel data in Power BI

[← Files in Power BI](https://support.powerbi.com/knowledgebase/topics/88767-files-in-power-bi)

You can use any XLSX Excel workbook - Excel 2007, 2010, and 2013 - as a dataset for your Power BI dashboards and reports. [Get your Excel data into Power BI](https://support.powerbi.com/knowledgebase/articles/597003).

For the best results, your Excel workbook data:
-  is in table format. ( [Instructions for formatting Excel data as a table](https://support.office.com/en-us/article/Create-an-Excel-table-in-a-worksheet-e81aa349-b006-4f8a-9806-5af9df0ac664?ui=en-US&rs=en-US&ad=US))
-  is prepared as an Excel data model (typically created using Power Pivot). Don't worry if you don't know how to do this, it's not required.
-  has columns marked by data type (e.g, date, number). For more information:
	-   [data types in Excel data models](https://support.office.com/en-US/Article/Data-Types-Supported-in-Data-Models-e2388f62-6122-4e2b-bcad-053e3da9ba90)
	-   [formatting number data types in Excel](https://support.office.com/en-us/article/Format-numbers-f27f865b-2dc5-4970-b289-5286be8b994a)

## What is imported?

Power BI brings in:
-   **The data in the workbook** from worksheet tables or from the Excel data model. Data model content takes precedence over worksheet content.
-   **Power View sheets**, but not PivotTables or PivotCharts or custom fields. If your workbook has PivotTables or PivotCharts, consider [bringing the whole Excel file into Power BI](https://support.powerbi.com/knowledgebase/articles/640168) instead.

### Data types

Power BI recognizes values and supports these data types: Whole Number, Decimal Number, Currency, Date, True/False, Text).  Marking data as specific data types in Excel will improve the Power BI experience.

## Refreshing Excel data

-   When you upload an Excel workbook from your computer, you can't refresh the data. 
-   When you connect to an [Excel workbook in OneDrive](http://support.powerbi.com/knowledgebase/articles/471009-excel-data-stored-in-onedrive), you can [refresh the data](http://support.powerbi.com/knowledgebase/articles/474669-refresh-data-in-power-bi).

## Troubleshooting

Currently, when you connect to an Excel workbook as a dataset, Power BI only imports data that is part of a named table or a data model. As a result:

-   If the workbook contains no named tables, Power View sheets, or Excel data models, you see this error. The article "[We couldn't find any data in your Excel workbook](https://support.powerbi.com/knowledgebase/articles/501937--we-couldn-t-find-any-data-in-your-excel-workbook)" explains how to fix the workbook and reimport it.

See also

-  [Get data](http://support.powerbi.com/knowledgebase/articles/434354-get-data)
-  [Get started with Power BI](http://support.powerbi.com/knowledgebase/articles/430814-get-started-with-power-bi) 
-  [Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029-power-bi-preview-basic-concepts)

