<properties 
   pageTitle="Refresh a dataset created from an Excel workbook on a local drive"
   description="Refresh a dataset created from an Excel workbook on a local drive"
   services="powerbi" 
   documentationCenter="" 
   authors="jastru" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/27/2015"
   ms.author="v-jastru"/>

# Refresh a dataset created from an Excel workbook on a local drive
[← Data refresh](https://support.powerbi.com/knowledgebase/topics/107925-data-refresh)

## What’s supported?  
In Power BI, Refresh Now and Schedule Refresh  is supported for datasets created from Excel workbooks imported from a local drive where Power Query (Get & Transform data in Excel 2016) or Power Pivot is used to connect to any of the following data sources and load data into the Excel data model:  
-   All online data sources shown in Power Query.
-   All on-premises data sources shown in Power Query except for Hadoop file (HDFS), Active Directory, Microsoft Exchange.
-   All online data sources shown in Power Pivot.\*
-   All on-premises data sources shown in Power Pivot except for Hadoop file (HDFS), Active Directory, Microsoft Exchange.

>**Notes:**  
>- [A Power BI Personal Gateway](https://support.powerbi.com/knowledgebase/articles/649846-power-bi-personal-gateway) must be installed in order for Power BI to connect to on-premises data sources and refresh the dataset.
>
>- When using Excel 2013, make sure you’ve updated Power Query to the latest version.
>
>- Refresh is not supported for Excel workbooks imported from a local drive where data exists only in  worksheets or linked tables. Refresh is supported for worksheet data if it is stored and imported from OneDrive. To learn more, see Refresh a dataset created from an Excel workbook on OneDrive.
>
>- When you refresh a dataset created from an Excel workbook imported from a local drive, only the data queried from data sources is refreshed. If you change the structure of the data model in Excel or Power Pivot; for example, create a new measure or change the name of a column, those changes will not be copied to the dataset. If you make such changes, you’ll need to re-upload or re-publish the workbook. If you expect to make regular changes to the structure of your workbook and you want those to be reflected in the dataset in Power BI without having to re-upload, consider putting your workbook on OneDrive. Power BI automatically refreshes both the structure and worksheet data from workbooks stored and imported from OneDrive.

## How do I make sure data is loaded to the Excel data model?  
When you use Power Query (Get & Transform data in Excel 2016) to connect to a data source, you have several options where to load the data. To make sure you load data into the data model, you must select the **Add this data to the Data Model** option in the **Load To** dialog box.

>**Note:**  
>The images here show Excel 2016.

In **Navigator**, click **Load To…**  
	![](media/powerbi-refresh-excel-file-local-drive/Refresh_LoadToDM_1.png)

Or, If you click **Edit** in Navigator, you’ll open the Query Editor. There you can click **Close & Load To….**  
	![](media/powerbi-refresh-excel-file-local-drive/Refresh_LoadToDM_2.png)

Then in **Load To**, make sure you select **Add this data to the Data Model**.  
	![](media/powerbi-refresh-excel-file-local-drive/Refresh_LoadToDM_3.png)

### What if I use Get External Data in Power Pivot?  
No problem. Whenever you use Power Pivot to connect to and query data from an on-premises or online data source, the data is automatically loaded to the data model.

## How do I schedule refresh?  
When you first import your workbook from a local drive, Power BI doesn’t actually upload the whole workbook. Power BI copies the structure and data in the workbook’s data model and then creates a dataset in Power BI. Power BI does not connect to the workbook on your local drive again unless you re-upload or re-publish. To refresh, Power BI will connect directly to the data sources using connection information and credentials in the dataset to query for updated data, then load the updated data into the dataset. Before you can setup a refresh schedule, you’ll need to do a couple of things first:

### Make sure your gateway is online (if required)  
If your dataset connects to on-premises data sources, a [Power BI Personal Gateway](https://support.powerbi.com/knowledgebase/articles/649846-power-bi-personal-gateway) must be installed and online before you can setup a refresh schedule.

In **My Workspace** &gt; **Datasets** &gt; **dataset** &gt; **SCHEDULE REFRESH** or **REFRESH NOW** to open the Settings page, then expand **Gateway Status**. Make sure your gateway is online before trying to setup a refresh schedule.  
	![](media/powerbi-refresh-excel-file-local-drive/Refresh_PGOnline.png)

### Sign into data sources  
In Power BI, when you import your file from a local drive, Power BI does not copy the credentials you used when you connected to and loaded data into the data model, so you’ll need to sign into the data sources again in Power BI. You only need to do this once. After that, Power BI retains those credentials as part of the dataset’s settings and uses them to sign into the data sources to query for updated data.

1. ﻿In **My Workspace** &gt; **Datasets** &gt; **dataset** &gt;  **SCHEDULE REFRESH** or **REFRESH NOW** to open the Settings page.  
	![](media/powerbi-refresh-excel-file-local-drive/Refresh_SignInToDS_1.png)

2. Expand **Data Source Credentials**, and then click **Edit Credentials**.  
	![](media/powerbi-refresh-excel-file-local-drive/Refresh_SignInToDS_2.png)

3. Select the **Authentication Method**, and enter account credentials if needed, then click **Sign In**. The type of authentication and credentials depend on the type of data source being connected to. In most cases, you won’t need to specify a different Authentication Method. It will be automatically selected for you based on the data source.  
	![](media/powerbi-refresh-excel-file-local-drive/Refresh_SignInToDS_3.png)

>**Note:**  
>If your dataset has more than one data source, you’ll have to sign into each one.

### Setup a refresh schedule  
In **Schedule Refresh** &gt; **Keep your data up-to-date** &gt; **Yes**. Select a Refresh frequency, Time zone, and Time, and then click **Apply**.  
	![](media/powerbi-refresh-excel-file-local-drive/Refresh_SetupSched.png)

## When things go wrong  
When things go wrong, it’s usually because Power BI can’t sign into data sources, or if the dataset connects to an on-premises data source, the Power BI Personal Gateway is offline. Make sure Power BI can sign into data sources. If a password you use to sign into a data source changes, or Power BI gets signed out from a data source, be sure to try signing into your data sources again in Data Source Credentials.

Be sure to leave the **Send refresh failure notification email to me checked**. You’ll want to know right away if a scheduled refresh fails.

To learn more about how to troubleshoot refresh issues, see [Troubleshooting refresh.scenarios](https://support.powerbi.com/knowledgebase/articles/742209-troubleshooting-refresh-scenarios)and [Tools for troubleshooting refresh issues](https://support.powerbi.com/knowledgebase/articles/742023-tools-for-troubleshooting-refresh-issues).

## Important notes  
\* Refresh is not supported for OData feeds connected to and queried from Power Pivot. When using an OData feed as a data source, use Power Query.