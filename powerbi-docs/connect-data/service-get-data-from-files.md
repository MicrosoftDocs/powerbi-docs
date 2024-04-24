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
ms.date: 11/10/2023
LocalizationGroup: Data from files
---

# Get data from files for Power BI

In Power BI, you can connect to or import data and reports from these types of files:

- Microsoft Excel *.xlsx* and *.xlsm* files
- Power BI Desktop *.pbix* report files
- Comma-separated value (CSV) *.csv* files

## What it means to get data from a file

In Power BI, the data you explore comes from a semantic model. To have a semantic model, you need some data. This article focuses on getting data from files.

To better understand the importance of semantic models and how to get data for them, consider an automobile. Sitting in your car and looking at the dashboard is like sitting in front of your computer looking at a dashboard in Power BI. The dashboard shows all the things your car is doing, like how fast the engine is revving, the temperature, what gear you’re in, and your speed.

In Power BI, a semantic model is like the engine in your car. The semantic model provides the data, metrics, and information that's displayed in your Power BI dashboard. Your engine, or semantic model, needs fuel, and data is the fuel in Power BI. Your car has a fuel tank that provides gas to the engine. Power BI also needs a fuel tank of data you can feed your semantic model. That fuel tank can be a Power BI Desktop file, Excel workbook file, or CSV file.

To take it one step further, a fuel tank in a car has to be filled with gas. The gas for a Power BI Desktop, Excel, or CSV file is data from a data source that you put into the Excel, Power BI Desktop, or CSV file. You can manually enter rows of data into an Excel workbook or CSV file, or you can connect to the external data source to query and load data into your file. After you have a file that contains some data, you can get the file into Power BI as a semantic model.

> [!NOTE]
> When you import Excel data into Power BI, the data must be in a table or data model.

## Where to save your file

Where you save your file makes a difference.

- **Local**. If you save your workbook file to a drive on your computer or another location in your organization, you can *import* your file into Power BI. Your file remains on the source drive. When you import the file, Power BI creates a new semantic model in your site and loads your data, and in some cases your data model, into the semantic model. Any reports in your file appear in **My workspace** as **Reports**.

- **OneDrive for work or school**. If you have OneDrive for work or school, sign in with the same account that you use for Power BI. This method is the most effective way to keep your work in Excel, Power BI Desktop, or CSV files in sync with your Power BI semantic model, reports, and dashboards. Both Power BI and OneDrive are in the cloud, and Power BI connects to your file on OneDrive about once an hour. If Power BI finds any changes, it automatically updates your Power BI semantic model, reports, and dashboards. 

  > [!NOTE]
  > You can't upload files from personal OneDrive accounts, but you can upload files from your computer.

- **SharePoint team site**. Saving your Power BI Desktop files to a SharePoint team site is much like saving to OneDrive for work or school. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder.

> [!NOTE]
> You can't update semantic models imported from OneDrive for work or school from local files. For Power BI to update the semantic model, you must replace the file in OneDrive for work or school. Alternatively, you can delete the semantic model and its related items and then import again from a local file.

## Related content

- [Get data from Excel workbook files](service-excel-workbook-files.md)
- [Get data from Power BI Desktop files](service-desktop-files.md)
- [Get data from comma-separated value (CSV) files](service-comma-separated-value-files.md)
