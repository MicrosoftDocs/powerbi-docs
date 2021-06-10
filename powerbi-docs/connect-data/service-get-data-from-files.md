---
title: Get data from files for Power BI
description: Learn how to get data from Excel, Power BI Desktop, and CSV files into Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 06/10/2021
LocalizationGroup: Data from files
---
# Get data from files for Power BI
![Excel, Power B I Desktop, and C S V icon](media/service-get-data-from-files/file_icons.png)

In Power BI, you can connect to or import data and reports from three types of files.

* Microsoft Excel (.xlsx or .xlsm)
* Power BI Desktop (.pbix)
* Comma Separated Value (.csv)

## What does get data from a file really mean?
In Power BI the data you explore comes from a dataset. But in order to have a dataset, you first need to get some data. For this article, we're going to focus on getting data from files.

To better understand the importance of datasets, and how we get data for them, let’s look at an automobile. Take a seat in your car and look at the dashboard. That’s a lot like sitting in front of your computer looking at a dashboard in Power BI. The dashboard shows you all the things your car is doing; how fast the engine is revving, temperature, what gear you’re in, your speed, etc.

In Power BI, a dataset is like the engine in your car. The dataset provides the data, metrics, and information that’s displayed in your Power BI dashboard. Of course your engine, or dataset, needs fuel, and in Power BI, that fuel is data. Your car has a fuel tank that provides gas to the engine. Much the same in Power BI, you need a fuel tank that has data you can feed to your dataset. In our case, that fuel tank is a Power BI Desktop file, an Excel workbook file, or a .CSV file.

We can even take it one step further. A fuel tank in a car has to be filled with gas. The gas for our Power BI Desktop, Excel, or .CSV file is data from another data source. We get data from another data source and put it into an Excel, Power BI Desktop, or .CSV file. If it's an Excel workbook or .CSV file, we can manually enter rows of data. Or, we can connect to an external data source to query and load data into our file. Once we have a file with some data, we can get it into Power BI as a dataset.

> [!NOTE]
> Data in Excel workbooks must be in a table, or in the data model, to be imported by Power BI.
> 
> 

## Where your file is saved makes a difference
**Local** - If you save your file to a local drive on your computer or another location in your organization, from Power BI, you can *import* your file into Power BI. Your file will actually remain on your local drive, so the whole file isn’t really imported into Power BI. What really happens is a new dataset is created in your Power BI site and data, and in some cases the data model, are loaded into the dataset. If your file has any reports, those will appear in your Power BI site under Reports.

**OneDrive - Business** – If you have OneDrive for Business and you sign into it with the same account you sign into Power BI with, this is by-far the most effective way to keep your work in Excel, Power BI Desktop, or a .CSV file and your dataset, reports, and dashboards in Power BI in-sync. Because both Power BI and OneDrive are in the cloud, Power BI connects to your file on OneDrive about every hour. If any changes are found, your dataset, reports, and dashboards are automatically updated in Power BI.

**OneDrive - Personal** – If you save your files to your own OneDrive account, you’ll get many of the same benefits as you would with OneDrive for Business. The biggest difference is when you first connect to your file (using Get Data > Files > OneDrive – Personal) you’ll need to sign in to your OneDrive with your Microsoft account, which is usually different from what you use to sign in to Power BI. When signing in with your OneDrive with your Microsoft account, be sure to select the Keep me signed in option. This way, Power BI will be able to connect to your file about every hour and make sure your dataset in Power BI is in-sync.

**SharePoint Team-Sites** – Saving your Power BI Desktop files to SharePoint – Team Sites is much the same as saving to OneDrive for Business. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder.

## Ready to get started?
See the following articles to learn more about getting your file into Power BI.

* [Get data from Excel workbook files](service-excel-workbook-files.md)
* [Get data from Power BI Desktop files](service-desktop-files.md)
* [Get data from Comma Separated Value files](service-comma-separated-value-files.md)

