---
title: Get data from files for Power BI
description: Learn how to get data from Excel, Power BI Desktop, and CSV files into Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/09/2023
LocalizationGroup: Data from files
---
# Get data from files for Power BI

In Power BI, you can connect to or import data and reports from three types of files:

- Microsoft Excel *.xlsx* and *.xlsm* files.
- Power BI Desktop *.pbix* report files.
- Comma-separated value (CSV) *.csv* files.

## What it means to get data from a file

In Power BI, the data you explore comes from a dataset. To have a dataset, you need some data. This article focuses on getting data from files.

To better understand the importance of datasets and how to get data for them, look at an automobile. Sitting in your car and looking at the dashboard is like sitting in front of your computer looking at a dashboard in Power BI. The dashboard shows you all the things your car is doing, such as how fast the engine is revving, the temperature, what gear you’re in, and your speed.

In Power BI, a dataset is like the engine in your car. The dataset provides the data, metrics, and information that's displayed in your Power BI dashboard. Your engine, or dataset, needs fuel, and data is the fuel in Power BI. Your car has a fuel tank that provides gas to the engine. Power BI also needs a fuel tank of data you can feed your dataset. That fuel tank can be a Power BI Desktop file, Excel workbook file, or CSV file.

To take it one step further, a fuel tank in a car has to be filled with gas. The gas for a Power BI Desktop, Excel, or CSV file is data from a data source that you put it into the Excel, Power BI Desktop, or CSV file. You can manually enter rows of data into an Excel workbook or CSV file, or you can connect to the external data source to query and load data into your file. Once you have a file with some data, you can get the file into Power BI as a dataset.

> [!NOTE]
> Data in Excel workbooks must be in a table or data model to import into Power BI.

## Where to save your file

Where you save your file makes a difference.

- **Local**. If you save your workbook file to a drive on your computer or another location in your organization, you can *import* your file into Power BI. Your file actually remains on the source drive, so Power BI doesn't really import the file. Power BI actually creates a new dataset in your site and loads your data and in some cases your data model into the dataset. Any reports in your file appear in your Power BI site under **Reports**.

- **OneDrive for work or school**. If you have OneDrive for work or school, sign in with the same account you use for Power BI. This method is by far the most effective way to keep your work in Excel, Power BI Desktop, or CSV files in sync with your Power BI dataset, reports, and dashboards. Both Power BI and OneDrive are in the cloud, so Power BI connects to your file on OneDrive about once an hour. If Power BI finds any changes, it automatically updates your Power BI dataset, reports, and dashboards.

- **Personal OneDrive**. If you save your workbook files to your personal OneDrive account, you get many of the same benefits as with OneDrive for work or school. The biggest difference is that when you first connect to your file by using **Get Data** > **Files** > **OneDrive – Personal**, you need to sign in to your OneDrive with your Microsoft account, which might be different from the account you use to sign in to Power BI.

  When you sign in to your personal OneDrive with your Microsoft account, be sure to select the **Keep me signed in** option. Power BI can then connect to your workbook file about every hour and make sure your Power BI dataset is in sync.

- **SharePoint Team Sites**. Saving your Power BI Desktop files to SharePoint Team Sites is much like saving to OneDrive for work or school. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder.

> [!NOTE]
> You can't update datasets imported from OneDrive for work or school or OneDrive Personal from local files. For Power BI to update the dataset, you must replace the file in OneDrive for work or school or OneDrive Personal. Alternatively, you can delete the dataset and its related items and then reimport from a local file.

## Next steps

See the following articles to learn more about getting your file into Power BI.

- [Get data from Excel workbook files](service-excel-workbook-files.md)
- [Get data from Power BI Desktop files](service-desktop-files.md)
- [Get data from comma-separated value (CSV) files](service-comma-separated-value-files.md)
