---
title: Refresh a dataset created from an Excel workbook - cloud
description: Refresh a dataset created from an Excel workbook on OneDrive, or SharePoint Online
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 06/07/2019
LocalizationGroup: Data refresh
---
# Refresh a dataset created from an Excel workbook on OneDrive, or SharePoint Online

You can import Excel workbooks that are stored on your local machine, or in cloud storage such as OneDrive for Business or SharePoint Online. We will look at the advantages of using cloud storage for your Excel files. For more information on how to import Excel files into Power BI, see [Get data from Excel workbook files](service-excel-workbook-files.md).

## What are the advantages?

Importing files from OneDrive, or SharePoint Online, is a great way to make sure the work you’re doing in Excel stays in-sync with the Power BI service. Any data you’ve loaded into your file’s model is imported into the dataset, and any reports you’ve created in the file are loaded into Reports in Power BI. If you make changes to your file on OneDrive, or SharePoint Online, like add new measures, change column names, or edit visualizations, once you save, those changes are updated in Power BI too, usually within about an hour.

When you import an Excel workbook from your personal OneDrive, any data in the workbook, like tables in worksheets and/or data that are loaded into the Excel data model and the structure of the data model, are imported into a new dataset in Power BI. Any Power View visualizations are re-created in Reports. Power BI automatically connects to the workbook on OneDrive, or SharePoint Online, about every hour to check for updates. If the workbook has changed, Power BI will refresh the dataset and reports in the Power BI service.

You can refresh the dataset in the Power BI service. When you manually refresh, or schedule refresh, on the dataset, Power BI connects directly to the external data sources to query for updated data it then loads into the dataset. Refreshing a dataset from within Power BI does not refresh the data in the workbook on OneDrive, or SharePoint Online. 

## What’s supported?

In Power BI, **Refresh Now** and **Schedule Refresh** are supported for datasets created from Power BI Desktop files imported from a local drive where Get data/Power Query Editor is used to connect to and load data from any of the following data sources:  

### Power BI Gateway - Personal

* All online data sources shown in Power BI Desktop’s Get data and Power Query Editor.
* All on-premises data sources shown in Power BI Desktop’s Get data and Power Query Editor except for Hadoop file (HDFS) and Microsoft Exchange.

<!-- Refresh Data sources-->
[!INCLUDE [refresh-datasources](../includes/refresh-datasources.md)]

> [!NOTE]
> A gateway must be installed and running in order for Power BI to connect to on-premises data sources and refresh the dataset.
>
>

## OneDrive or OneDrive for Business. What’s the difference?

If you have both a personal OneDrive and OneDrive for Business, it’s recommended you keep any files you want to import into Power BI in OneDrive for Business. Here’s why: You likely use two different accounts to sign into them.

Connecting to OneDrive for Business in Power BI is typically seamless because the same account you use to sign into Power BI is often the same account used to sign into OneDrive for Business. But, with personal OneDrive, you likely sign in with a different [Microsoft account](https://account.microsoft.com).

When you sign in with your Microsoft account, be sure to select **Keep me signed in**. Power BI can then synchronize any updates you make in the file in Power BI Desktop with datasets in Power BI.  

![Keep me signed in check box](media/refresh-excel-file-onedrive/refresh_signin_keepmesignedin.png)

If you make changes to your file on OneDrive that cannot be synchronized with the dataset or reports in Power BI, because your Microsoft account credentials might have changed, you’ll need to connect to and import your file again from your personal OneDrive.

## Options for connecting to Excel file

When you connect to an Excel workbook in OneDrive for Business, or SharePoint Online, you’ll have two options on how to get what’s in your workbook into Power BI.

[**Import Excel data into Power BI**](service-excel-workbook-files.md#import-or-connect-to-an-excel-workbook-from-power-bi) – When you import an Excel workbook from your OneDrive for Business, or SharePoint Online, it works as described above.

[**Connect, Manage, and View Excel in Power BI**](service-excel-workbook-files.md#one-excel-workbook--two-ways-to-use-it) – When using this option, you create a connection from Power BI right to your workbook on OneDrive for Business, or SharePoint Online.

When you connect to an Excel workbook this way, a dataset is not created in Power BI. However, the workbook will appear in the Power BI service under Reports with an Excel icon next to the name. Unlike with Excel Online, when you connect to your workbook from Power BI, if your workbook has connections to external data sources that load data into the Excel data model, you can set up a refresh schedule.

When you set up a refresh schedule this way, the only difference is refreshed data goes into the workbook’s data model on OneDrive, or SharePoint Online, rather than a dataset in Power BI.

## How do I make sure data is loaded to the Excel data model?

When you use Power Query (**Get & Transform** in Excel 2016) to connect to a data source, you have several options where to load the data. To make sure you load data into the data model, you must select the **Add this data to the Data Model** option in the **Load To** dialog box.

> [!NOTE]
> The images here show Excel 2016.
>
>

In **Navigator**, click **Load To…**  

![Load To... command](media/refresh-excel-file-onedrive/refresh_loadtodm_1.png)

Or, If you click **Edit** in **Navigator**, you’ll open the Query Editor. There you can click **Close & Load To….**  

![Close & Load To... command](media/refresh-excel-file-onedrive/refresh_loadtodm_2.png)

Then in **Load To**, make sure you select **Add this data to the Data Model**.  

![Add this to the Data Model check box](media/refresh-excel-file-onedrive/refresh_loadtodm_3.png)

### What if I use Get External Data in Power Pivot?

No problem. Whenever you use Power Pivot to connect to and query data from an on-premises or online data source, the data is automatically loaded to the data model.

## How do I schedule refresh?

When you set up a refresh schedule, Power BI connects directly to the data sources using connection information and credentials in the dataset to query for updated data, then loads the updated data into the dataset. Any visualizations in reports and dashboards based on that dataset in the Power BI service are also updated.

For details on how to set up scheduled refresh, see [Configure scheduled refresh](refresh-scheduled-refresh.md).

## When things go wrong

When things go wrong, it’s usually because Power BI can’t sign into data sources, or if the dataset connects to an on-premises data source, the gateway is offline. Make sure Power BI can sign into data sources. If a password you use to sign into a data source changes, or Power BI gets signed out from a data source, be sure to try signing into your data sources again in Data Source Credentials.

Be sure to leave the **Send refresh failure notification email to me checked**. You’ll want to know right away if a scheduled refresh fails.

## Important notes

Refresh is not supported for OData feeds connected to and queried from Power Pivot. When using an OData feed as a data source, use Power Query.

## Troubleshooting

Sometimes refreshing data may not go as expected. Typically this is an issue connected with a gateway. Take a look at the gateway troubleshooting articles for tools and known issues:

- [Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)
- [Troubleshooting the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
