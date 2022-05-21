---
title: Data details page
description: Learn about the data details shown to you on the data details page.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 05/20/2022
LocalizationGroup: Share your work
---
# Data details

The data details page provides detail about the data item, shows you reports that are based on the data item, and provides entry points for creating new reports based on the data item or for using it with Analyze with Excel.

[ ![Screenshot of datasets hub explore related reports page.](media/service-data-details-page/datasets-hub-details-page-inline-and-expanded.png)](media/service-data-datails-page/datasets-hub-details-page-inline-and-expanded.png#lightbox)



# [Datasets](#tab/datasets)

The dataset details page
* Shows you information about the dataset
* Lists the reports and scorecards that are built on top of the dataset
* Provides entry points for creating new reports built on the dataset, pulling the data into Excel via [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md), and creating formatted tables.

[ ![Screenshot of dataset details page.](media/service-data-details-page/datasets-details-page-inline-and-expanded.png)](media/service-data-datails-page/datasets-hub-details-page-inline-and-expanded.png#lightbox)

The page header displays the dataset name, endorsement, if any, and dataset owner. To send an email to the dataset owner or the dataset certifier (if any), click the header and then click the name of the owner.

### Action bar

The Action bar at the top of the page contains a number of actions that you can launch.

|Action  |Description  |
|---------|---------|
|**File**     | Download the .pbix file for this dataset, manage permissions to this dataset, or go to dataset settings.       |
|**Refresh**     | Refresh this dataset.        |
|**Share**     | Share this dataset.        |
|**Create a report**     | Create a report based on this dataset either from scratch or from a template, if one exists.        |
|**Analyze in Excel**     | Launch [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) using this dataset.        |
|**Lineage**     | Open the [lineage view](../collaborate-share/service-data-lineage.md) of this dataset.        |
|**Chat in Teams**     | Invite people to start [chatting in Teams](../collaborate-share/service-share-report-teams.md). People you invite will receive a Teams chat message from you with a link to this dataset details page. If they have access to the dataset, the link will open this dataset details page in Teams.        |
|**Show tables**     | Open a side panel showing the dataset's tables.        |


### Dataset details

The dataset details section shows the name of the workspace where the dataset is located, the exact time of the last refresh, sensitivity (if set), the dataset description (if any), and certifier name (if certified). You can also open the dataset lineage from here.

### Related reports

The Explore related reports section shows you all the reports that are built on the selected dataset. You can create a copy of a report by selecting the report line in the list and then clicking the Save a copy of this report icon.

The columns in the list of related reports are:
* **Name**: Report name. If the name ends with (template), it means that this report has been specially constructed to be used as a template. For example, "Sales (template)".
* **Endorsement**: Endorsement status.
* **Workspace**: The name of the workspace where the report is located.

### Create a report built on the dataset

In the Create a report section, click the **Create** button. If there is a report template for the dataset, a drop-down menu will offer two options:
* **From template**: Creates a copy of the template in *My workspace*.
* **From scratch**: Opens the report editing canvas to a new report built on the dataset. When you save your new report, it will be saved in the workspace that contains the dataset if you have write permissions on that workspace. If you don't have write permissions on the workspace, or if you are a free user and the dataset resides in a Premium-capacity workspace, the new report will be saved in *My workspace*.

If there are no report templates, clicking **Create** will open the report editing canvas directly.

>[!NOTE]
> Only one template will be shown in the Create report drop-down, even if more than one report template exists for this dataset. 

### Pull the dataset into Excel via Analyze in Excel

In the Analyze in Excel section, select **Analyze** to pull the dataset into Excel via Analyze in Excel.

# [Datamarts](#tab/datamarts)

### Action bar

The Action bar at the top of the page contains a number of actions that you can launch.

|Action  |Description  |
|---------|---------|
|**File**     | Download the .pbix file for this dataset, manage permissions to this dataset, or go to dataset settings.       |
|**Refresh**     | Refresh this dataset.        |
|**Share**     | Share this dataset.        |
|**Create a report**     | Create a report based on this dataset either from scratch or from a template, if one exists.        |
|**Analyze in Excel**     | Launch [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) using this dataset.        |
|**Lineage**     | Open the [lineage view](../collaborate-share/service-data-lineage.md) of this dataset.        |
|**Chat in Teams**     | Invite people to start [chatting in Teams](../collaborate-share/service-share-report-teams.md). People you invite will receive a Teams chat message from you with a link to this dataset details page. If they have access to the dataset, the link will open this dataset details page in Teams.        |
|**Show tables**     | Open a side panel showing the dataset's tables.        |


### Dataset details

The dataset details section shows the name of the workspace where the dataset is located, the exact time of the last refresh, sensitivity (if set), the dataset description (if any), and certifier name (if certified). You can also open the dataset lineage from here.

### Related reports

The Explore related reports section shows you all the reports that are built on the selected dataset. You can create a copy of a report by selecting the report line in the list and then clicking the Save a copy of this report icon.

The columns in the list of related reports are:
* **Name**: Report name. If the name ends with (template), it means that this report has been specially constructed to be used as a template. For example, "Sales (template)".
* **Endorsement**: Endorsement status.
* **Workspace**: The name of the workspace where the report is located.

### Create a report built on the dataset

In the Create a report section, click the **Create** button. If there is a report template for the dataset, a drop-down menu will offer two options:
* **From template**: Creates a copy of the template in *My workspace*.
* **From scratch**: Opens the report editing canvas to a new report built on the dataset. When you save your new report, it will be saved in the workspace that contains the dataset if you have write permissions on that workspace. If you don't have write permissions on the workspace, or if you are a free user and the dataset resides in a Premium-capacity workspace, the new report will be saved in *My workspace*.

If there are no report templates, clicking **Create** will open the report editing canvas directly.

>[!NOTE]
> Only one template will be shown in the Create report drop-down, even if more than one report template exists for this dataset. 

### Pull the dataset into Excel via Analyze in Excel

In the Analyze in Excel section, select **Analyze** to pull the dataset into Excel via Analyze in Excel.

---
  
## Next steps
* [Use datasets across workspaces](service-datasets-across-workspaces.md)
* [Create reports based on datasets from different workspaces](service-datasets-discover-across-workspaces.md)
* [Endorse your dataset](../collaborate-share/service-endorse-content.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
