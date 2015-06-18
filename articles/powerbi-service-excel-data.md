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
   ms.date="06/18/2015"
   ms.author="v-anpasi"/>

#Excel data in Power BI

[← Files in Power BI](https://support.powerbi.com/knowledgebase/topics/88767-files-in-power-bi)

You can use any XLSX Excel workbook - Excel 2007, 2010, and 2013 - as a dataset for your Power BI dashboards and reports. For the best results, your Excel workbook data:

-  is in table format. ( [Instructions for formatting Excel data as a table](https://support.office.com/en-us/article/Create-an-Excel-table-in-a-worksheet-e81aa349-b006-4f8a-9806-5af9df0ac664?ui=en-US&rs=en-US&ad=US))
-  is prepared as an Excel data model (typically created using Power Pivot). Don't worry if you don't know how to do this, it's not required.
-  has columns marked by data type (e.g, date, number). For more information:
	-   [data types in Excel data models](https://support.office.com/en-US/Article/Data-Types-Supported-in-Data-Models-e2388f62-6122-4e2b-bcad-053e3da9ba90)
	-   [formatting number data types in Excel](https://support.office.com/en-us/article/Format-numbers-f27f865b-2dc5-4970-b289-5286be8b994a)

![](media/powerbi-service-excel-data/importantIcon.png) **Important:** **** Only the person who uploads the dataset (the owner) can access the underlying data.  If you share your dashboard with others, they'll be able to see and interact with the reports in [Reading View](http://support.powerbi.com/knowledgebase/articles/439920-open-a-report-in-reading-view), but they won't be able to explore or access the underlying data.

##Instructions


1.  Start from the dashboard to which you want to add the workbook data, and select **Get Data**.  
	![](media/powerbi-service-excel-data/PBI_GetData.png)  
    **NOTE:** The Retail Analysis sample dashboard is write-protected, so if you start from there, Power BI creates a blank dashboard and adds the new dataset to it. The new dashboard will have the same name as the dataset. You can download your own copy of:  
    The Retail Analysis sample dashboard: After you select Get Data, select  Retail Analysis Sample.
    Or: the [Retail Analysis](https://support.powerbi.com/knowledgebase/articles/474807) sample workbook.
    
2.  Select **Excel Workbook** \> **Connect.**
    
	**TIP**: If you need a workbook to try, select **Download this one** and save the file to your desktop or OneDrive.

3.  Browse to the workbook, select **Open**, then **Connect**.

    **Workbooks on your computer**: Power BI uploads them to Power BI.

    **Workbooks on OneDrive**: Power BI creates a connection to them and any changes to workbooks on OneDrive appear automatically in Power BI. Power BI does not alter the workbooks on OneDrive. Read more about [refreshing data in Excel workbooks on OneDrive](https://support.powerbi.com/knowledgebase/articles/471009). 

    ![](media/powerbi-service-excel-data/PBI_GetDataExcel.png)
    
    
4.  The new dataset is added to Power BI.  If the workbook has Power View sheets, Power BI combines them to create a report.  The report is given the same name as the dataset, and appears under the **Reports** heading.**﻿** You can change the dataset and report names. 
    
    ![](media/powerbi-service-excel-data/PBI_GetDataPane.png)
5.  Click the dataset name to [explore the dataset in Power BI](http://support.powerbi.com/knowledgebase/articles/475159-explore-a-dataset).  
6.  Or just type a [question in the question box](http://support.powerbi.com/knowledgebase/articles/474566-q-a-in-power-bi) on the dashboard.
7.  [Pin a few visualizations to your dashboard](http://support.powerbi.com/knowledgebase/articles/430323-pin-a-tile-to-a-dashboard-from-a-report). 

##What is imported?

Power BI brings in the data in the workbook from worksheet tables or from the Excel data model. Data model content takes precedence over worksheet content.

Power BI brings in Power View sheets, but doesn't yet recognize PivotTables or PivotCharts or custom fields.

### Data types

Power BI recognizes values and supports these data types: Whole Number, Decimal Number, Currency, Date, True/False, Text).  Marking data as specific data types in Excel will improve the Power BI experience.

##Refreshing Excel data
-   When you upload an Excel workbook from your computer, you can't refresh the data. 
-   When you connect to an [Excel workbook in OneDrive](http://support.powerbi.com/knowledgebase/articles/471009-excel-data-stored-in-onedrive), you can [refresh the data](http://support.powerbi.com/knowledgebase/articles/474669-refresh-data-in-power-bi).

##Troubleshooting
Currently in the Preview, when connecting to Excel, Power BI only imports data that is part of a named table or a data model. As a result:  

-   When importing a workbook, if there are no named tables, Power View sheets, or Excel data models in the workbook, you see this error. The article "[We couldn't find any data in your Excel workbook](https://support.powerbi.com/knowledgebase/articles/501937--we-couldn-t-find-any-data-in-your-excel-workbook)" explains how to fix the workbook and reimport it.

###See also


[Get data](http://support.powerbi.com/knowledgebase/articles/434354-get-data)  
[Get started with Power BI](http://support.powerbi.com/knowledgebase/articles/430814-get-started-with-power-bi)  
[Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029-power-bi-preview-basic-concepts)