<properties pageTitle="Get data from files for Power BI" description="Get data from files for Power BI" services="powerbi" documentationCenter="" authors="v-anpasi" manager="mblythe" editor=""/>
<tags ms.service="powerbi" ms.devlang="NA" ms.topic="article" ms.tgt_pltfrm="NA" ms.workload="powerbi" ms.date="06/26/2015" ms.author="v-anpasi"/>
# Get Excel and Power BI Designer files into Power BI

[← Files in Power BI](https://support.powerbi.com/knowledgebase/topics/88767-files-in-power-bi)

If Excel is your go-to tool for working with data, you can leverage your Excel expertise and investments by using them in Power BI. You can use any XLSX Excel workbook as a dataset for your Power BI dashboards and reports. [Read about what makes a good Excel workbook](https://support.powerbi.com/knowledgebase/articles/424871) for Power BI.

You can also create reports in Power BI Designer, a free, downloadable app, and use those reports as datasets for Power BI. [Get the Power BI Designer](https://support.powerbi.com/knowledgebase/articles/464158).

You can upload Excel and Designer files from your computer, or connect to them on OneDrive for Business or OneDrive Personal. Here's the advantage of connecting to files on OneDrive: any changes to a file on OneDrive appear automatically in the dashboards and reports connected to the file in Power BI. 

Important: In Power BI Preview, the maximum size of an Excel or Power BI Designer file you can upload to your Power BI site is 250 megabytes. 

## Import or connect to files

1. Starting from the dashboard to which you want to add the workbook data, select **Get Data** at the bottom of the left navigation pane.

	![](media/powerbi-service-get-data-from-files/PBI_GetData.png)

2. In the **Files** box, select **Get**. 

	![](media/powerbi-service-get-data-from-files/PBI_GetFiles.png)

3. Depending on where your file is, select one of these options: 

	![](media/powerbi-service-get-data-from-files/PBI_GetFilesLocalOneDriveEtc.png)

	**Local File**: Browse to the file and select **Open**. Power BI uploads files on your computer to Power BI. 

	**OneDrive - Business and OneDrive - Personal:** Browse to the file and select **Connect**. Power BI creates a connection to the file. Any changes to files on OneDrive appear automatically in Power BI. 

	>**Note:** Power BI doesn't change the files on OneDrive. Read more about [refreshing data in Excel workbooks on OneDrive](https://support.powerbi.com/knowledgebase/articles/471009).

4. Power BI adds the new dataset. New items are marked with a yellow asterisk ![](media/powerbi-service-get-data-from-files/PBI_YellowAsteriskSm.png)

	**Excel workbooks**: If the workbook has Power View sheets, Power BI combines them to create a report. The report has the same name as the dataset, under the **Reports** heading.﻿ 

	**Power BI Designer files**: Power BI creates a report and a dataset with the same name.

	![](media/powerbi-service-get-data-from-files/PBI_NewExcelLeftNav.png)

	>**Tip:** Any changes you make in Power BI, for example, add, delete, or change visualizations in reports, aren't saved in the original Excel or Power BI Designer file. You can only change an Excel file in Excel, and a Power BI Designer file in the Designer. You can change the dataset and report names.  

## What can you do next?

- Click the dataset name to [explore the dataset in Power BI](http://support.powerbi.com/knowledgebase/articles/475159-explore-a-dataset).
- Or just type a [question in the question box on the dashboard](http://support.powerbi.com/knowledgebase/articles/474566-q-a-in-power-bi).
- [Pin a few visualizations to your dashboard](http://support.powerbi.com/knowledgebase/articles/430323-pin-a-tile-to-a-dashboard-from-a-report). 


## More about files in Power BI

-   [Excel data in Power BI](https://support.powerbi.com/knowledgebase/articles/424871-excel-data-in-power-bi)
-   [Refresh Excel data stored in OneDrive](https://support.powerbi.com/knowledgebase/articles/471009)