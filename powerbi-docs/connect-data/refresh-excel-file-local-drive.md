---
title: Refresh a dataset created from an Excel workbook - local
description: Refresh a dataset created from an Excel workbook on a local drive
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 11/29/2018
LocalizationGroup: Data refresh
---
# Refresh a dataset created from an Excel workbook on a local drive
## What’s supported?
In Power BI, Refresh Now and Schedule Refresh is supported for datasets created from Excel workbooks imported from a local drive where Power Query (Get & Transform data in Excel 2016) or Power Pivot is used to connect to any of the following data sources and load data into the Excel data model:  

### Power BI Gateway - Personal
* All online data sources shown in Power Query.
* All on-premises data sources shown in Power Query except for Hadoop file (HDFS) and Microsoft Exchange.
* All online data sources shown in Power Pivot.\*
* All on-premises data sources shown in Power Pivot except for Hadoop file (HDFS) and Microsoft Exchange.

<!-- Refresh Data sources-->
[!INCLUDE [refresh-datasources](../includes/refresh-datasources.md)]

> **Notes:**  
> 
> * A gateway must be installed and running in order for Power BI to connect to on-premises data sources and refresh the dataset.
> * When using Excel 2013, make sure you’ve updated Power Query to the latest version.
> * Refresh is not supported for Excel workbooks imported from a local drive where data exists only in  worksheets or linked tables. Refresh is supported for worksheet data if it is stored and imported from OneDrive. To learn more, see [Refresh a dataset created from an Excel workbook on OneDrive, or SharePoint Online](refresh-excel-file-onedrive.md).
> * When you refresh a dataset created from an Excel workbook imported from a local drive, only the data queried from data sources is refreshed. If you change the structure of the data model in Excel or Power Pivot; for example, create a new measure or change the name of a column, those changes will not be copied to the dataset. If you make such changes, you’ll need to re-upload or re-publish the workbook. If you expect to make regular changes to the structure of your workbook and you want those to be reflected in the dataset in Power BI without having to re-upload, consider putting your workbook on OneDrive. Power BI automatically refreshes both the structure and worksheet data from workbooks stored and imported from OneDrive.
> 
> 

## How do I make sure data is loaded to the Excel data model?
When you use Power Query (Get & Transform data in Excel 2016) to connect to a data source, you have several options where to load the data. To make sure you load data into the data model, you must select the **Add this data to the Data Model** option in the **Load To** dialog box.

> [!NOTE]
> The images here show Excel 2016.
> 
> 

In **Navigator**, click **Load To…**  
    ![Screenshot of the Load To in Navigator, showing the Load To selection.](media/refresh-excel-file-local-drive/refresh_loadtodm_1.png)

Or, If you click **Edit** in Navigator, you’ll open the Query Editor. There you can click **Close & Load To….**  
    ![Screenshot of the Home tab in Navigator, showing the Close and Load To selection.](media/refresh-excel-file-local-drive/refresh_loadtodm_2.png)

Then in **Load To**, make sure you select **Add this data to the Data Model**.  
    ![Screenshot of the Load To dialog, showing the Add this data to the Data Model box is checked.](media/refresh-excel-file-local-drive/refresh_loadtodm_3.png)

### What if I use Get External Data in Power Pivot?
No problem. Whenever you use Power Pivot to connect to and query data from an on-premises or online data source, the data is automatically loaded to the data model.

## How do I schedule refresh?
When you setup a refresh schedule, Power BI will connect directly to the data sources using connection information and credentials in the dataset to query for updated data, then load the updated data into the dataset. Any visualizations in reports and dashboards based on that dataset in the Power BI service are also updated.

For details on how to setup schedule refresh, see [Configure Schedule Refresh](refresh-scheduled-refresh.md).

## When things go wrong
When things go wrong, it’s usually because Power BI can’t sign into data sources, or if the dataset connects to an on-premises data source, the gateway is offline. Make sure Power BI can sign into data sources. If a password you use to sign into a data source changes, or Power BI gets signed out from a data source, be sure to try signing into your data sources again in Data Source Credentials.

Be sure to leave the **Send refresh failure notification email to me checked**. You’ll want to know right away if a scheduled refresh fails.

>[!IMPORTANT]
>Refresh is not supported for OData feeds connected to and queried from Power Pivot. When using an OData feed as a data source, use Power Query.

## Troubleshooting
Sometimes refreshing data may not go as expected. Typically this will be an issue connected with a gateway. Take a look at the gateway troubleshooting articles for tools and known issues.

[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)

[Troubleshooting the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)

## Next steps
More questions? [Try the Power BI Community](https://community.powerbi.com/)
