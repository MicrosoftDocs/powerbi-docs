---
title: Find and explore datasets and their related reports
description: Learn how you can explore the datasets in your organization and their related reports.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 12/12/2020
LocalizationGroup: Share your work
---
# Find and explore datasets and their related reports

The datasets hub makes it easy to find and explore the datasets in your organization. It provides information about the datasets as well as entry points for creating reports on top of those datasets or for using those datasets with Analyze in Excel.

The datasets hub can be useful in many scenarios:
* Dataset owners can see dataset usage metrics, refresh status, related reports, and lineage to help monitor and manage their datasets.
* Report creators can use the hub to find suitable datasets to build their reports on and use links to easily create reports based on the dataset, either from scratch or from templates.
* Report consumers can use this page to find reports based on trustworthy datasets.

By making it easy to find quality datasets and their related reports, the datasets hub helps prevent the creation of redundant reports. It also makes it easy to find good reports to use as starting points for creating new reports. 

**The datasets you can see via the datasets hub are those that you have at least [build permissions](service-datasets-build-permissions.md) to. If you're a free user, you only see datasets in your My Workspace, or datasets for which you have Build permission that are in Premium-capacity workspaces**.

## Find the dataset you need

The dataset discovery experience starts on the datasets hub page. To get to the datasets hub page:
* In the Power BI service: Select Datasets in navigation pane.
* In the Power BI app in Teams: Select either the Datasets tab or Datasets in the navigation pane. 

![Screenshot of datasets hub page](media/service-datasets-hub/datasets-hub-main-page.png)

The datasets hub presents you with a selection of recommended datasets and a list of all the datasets in the organization that you have permissions to access.

The sections below describe these sections and the actions you can perform.

### Recommended datasets

Recommended datasets are endorsed datasets (promoted or certified) that are presented to you based on a calculation that takes into account how recently they've been refreshed and the number of recent visitors to reports based on them.

### Dataset list

The dataset list shows you datasets in the organization that you have at least [build permissions](service-datasets-build-permissions.md) to. The list has three tabs to filter the list of datasets.
* **All datasets**: Shows all the datasets in your organization that you have at least [build permissions](service-datasets-build-permissions.md) to.
* **Recent**: Shows datasets whose related reports you’ve recently accessed. When you access a report, there may be a delay of several minutes until the related dataset shows up in the Recent column.
* **My datasets**: Shows the datasets you own. 

Use the search box to further filter down the items on the current tab.

The columns of the list are described below. Click on a column header to sort by that column. 
* **Name**: The dataset name. Click the dataset name to explore reports that are built using this dataset.
* **Endorsement**: Endorsement status.
* **Owner**: Dataset owner.
* **Workspace**: The workspace the dataset is located in.
* **Refreshed**: Last refresh time (rounded to hour, day, month, and year. See the dataset info on the dataset detail page for exact time of last refresh).
* **Sensitivity**: Sensitivity, if set. Click on the info icon to view sensitivity label description.

### Create new reports or pull data into Excel via Analyze in Excel

To create a new report based on dataset, or to pull the data into Excel with Analyze in Excel, select **More options (...)** either at the bottom right corner of a recommended dataset tile, or on a dataset's line in the list of datasets. Other actions may be appear on the drop-down menu, depending on the permissions you have on the dataset.

When you create a new report based on the dataset, the report edit canvas opens. When you save the new report, it will be saved in the workspace that contains the dataset if you have write permissions on that workspace. If you don't have write permissions on that workspace, or if you are a free user and the dataset resides in a Premium-capacity workspace, the new report will be saved in "My workspace".

## Explore related reports

To see more information about the dataset, to explore related reports, or to create a new report based on the dataset from scratch or from a template, pick a dataset from the recommended datasets or from the datasets list. A page will open that shows you information about the dataset, lists the reports that are built on top of the dataset, and provides entry points for creating new reports based on the dataset or pulling the data into Excel via Analyze in Excel.

![Screenshot of datasets hub explore related reports page](media/service-datasets-hub/datasets-hub-explore-related-reports.png)

The page header displays the dataset name, endorsement, if any, and dataset owner. To send an email to the dataset owner or the dataset certifier (if any), click the header and then click the name of the owner.

### Dataset details

The dataset details section shows the name of the workspace where the dataset is located, the exact time of the last refresh, sensitivity (if set), the dataset description (if any), and certifier name (if certified). You can also open the dataset lineage from here.

### Related reports

The Explore related reports section shows you all the reports that are built on the selected dataset. You can create a copy of a report by selecting the report line in the list and then clicking the Save a copy of this report icon.

The columns in the list of related reports are:
* **Name**: Report name. If the name ends with (template), it means that this report has been specially constructed to be used as a template.
* **Endorsement**: Endorsement status.
* **Workspace**: The name of the workspace where the report is located.
* **Unique viewers**: Shows the total number of unique users who viewed the report at least once in the last 30 days, excluding today's views. Unique viewers helps you get an idea about whether people are actually looking at the data from you dataset.

### Create a report built on the dataset

In the Create a report section, click the **Create** button to open the report editing canvas. You can chose to create the report from scratch or from a template, if one exists.

The report will be saved in My workspace.

>[!NOTE]
> Only one template will be shown in the Create report drop-down, even if more than one report template exists for this dataset. 

### Pull the dataset into Excel via Analyze in Excel

In the Analyze in Excel section, select **Analyze** to pull the dataset into Excel via Analysis in Excel.
  
## Next steps
* [Use datasets across workspaces](service-datasets-across-workspaces.md)
* [Create reports based on datasets from different workspaces](service-datasets-discover-across-workspaces.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
