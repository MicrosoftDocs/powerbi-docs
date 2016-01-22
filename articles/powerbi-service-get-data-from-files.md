<properties
   pageTitle="Get data from Excel, Power BI Desktop, and CSV files into Power BI"
   description="Get data from Excel, Power BI Desktop, and CSV files into Power BI"
   services="powerbi"
   documentationCenter=""
   authors="Minewiskan"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/20/2016"
   ms.author="owend"/>
# Get data from Excel, Power BI Desktop, and CSV files into Power BI

**Excel files**

If Excel is your go-to tool for working with data, you can leverage your Excel expertise and investments by using them in Power BI. You have two options:

-   Use an XLSX Excel workbook as a dataset for your Power BI dashboards and reports. Read about [what makes a good Excel workbook](powerbi-service-excel-data.md) for Power BI.  Want a sample Excel file to use as dataset? Download the [Financial Sample Excel file](powerbi-sample-download-the-financial-sample-workbook.md).

-   Bring a whole Excel workbook into Power BI intact . Explore the whole file, exactly as you would in Excel Online. [Bring whole Excel files into Power BI](powerbi-bring-in-whole-excel-files.md)

**Power BI Desktop files**

You can also create reports in Power BI Desktop, a free, downloadable app, and use those reports as datasets for Power BI. [Get Power BI Desktop](powerbi-desktop-get-the-desktop.md).


**CSV files**

A comma-separated values (CSV) text file can be a dataset for your Power BI dashboards and reports, too. For best results, CSV files need to use comma delimiters and have a header row. [Download a sample CSV file](http://go.microsoft.com/fwlink/?LinkID=619356).

### Import or connect to files 

You can bring in Excel, Power BI Desktop, and CSV files from your computer, or connect to them on OneDrive for Business, OneDrive Personal, or SharePoint - Team Sites.

**Tip**: When you keep your files on OneDrive or SharePoint Team-Sites, if you make changes, for example, add rows to a table, those changes will appear automatically in dashboards and reports in Power BI created from the data, usually in about an hour.

**Important**: The maximum file size is 250 megabytes for any file you upload to your Power BI site.

1.  Starting from the dashboard to which you want to add the workbook data, select **Get Data** at the bottom of the left navigation pane. 

    ![](media/powerbi-service-get-data-from-files/PBI_GetData.png)


2.  In the **Files** box, select **Get**.

    ![](media/powerbi-service-get-data-from-files/PBI_GetFiles.png)

3.  Depending on where your file is, select one of these options:

    ![](media/powerbi-service-get-data-from-files/pbi_getfiles_local_od_sp.png)

    **Local File:** Browse to the file and select Open. Power BI uploads files on your computer to Power BI. 

    **OneDrive - Business** and **OneDrive - Personal**: Browse to the file and select **Connect**. Power BI creates a connection to the file. Any changes to files on OneDrive appear automatically in Power BI.

    **SharePoint Team-Sites**: When prompted, enter a site URL and then click **Connect**.
 


New items are marked with a yellow asterisk ![](media/powerbi-service-get-data-from-files/PBI_YellowAsteriskSm.png).  

**Excel workbooks**: If the workbook has Power View sheets, Power BI combines them to create a report. The report has the same name as the dataset, under the **Reports** heading.﻿ 

**Power BI Desktop files**: Power BI creates a report and a dataset with the same name.

![](media/powerbi-service-get-data-from-files/PBI_NewExcelLeftNav.png)

**Tip**: Any changes you make in Power BI -- for example, add, delete, or change visualizations in reports -- aren't saved in the original Excel or Power BI Desktop file. You can only change an Excel file in Excel, and a Power BI Desktop file in Power BI Desktop. You can change the dataset and report names.  

### What's next?

Once you get data and reports from your file into Power BI, it's time to explore. If your file already had reports in it, they'll appear in My Workspace > Reports. If, your file just had data, you can create new reports by [exploring your dataset](powerbi-service-explore-a-dataset.md).


### More about files in Power BI

-   [Data refresh in Power BI](powerbi-refresh-data.md)

-   [Bring whole Excel files into Power BI](powerbi-bring-in-whole-excel-files.md)
