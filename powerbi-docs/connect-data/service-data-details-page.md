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

The data details page helps you explore, monitor, and leverage the data items such as datasets and datamarts in your organization. When you click on a data item in the [data hub](./service-data-hub.md), a workspace, or other place in Power BI, the details page for that item opens. The details page shows you:
* Metadata about the data item, including description, endorsement, and sensitivity label.
* Actions such as share, refresh, create new, Analyze in Excel, and more.
* Related reports (related reports are reports that were built on top of the dataset/datamart).

The main sections and many of the actions available on the data details page are common to most data items. This article describes these sections and actions, and notes differences between data items when they occur.

For any particular data item, the options and actions available may differ from user to user, depending on permissions. Thus not all of the options and actions described in this article will be available for all users.  

Image

# [Datamsets](#tab/datasets)

The dataset details page
* Shows you information about the dataset
* Lists the reports and scorecards that are built on top of the dataset
* Provides entry points for creating new reports built on the dataset, pulling the data into Excel via [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md), and creating formatted tables.

[ ![Screenshot of dataset details page.](media/service-data-details-page/dataset-details-page-inline-and-expanded.png)](media/service-data-details-page/dataset-details-page-inline-and-expanded.png#lightbox)

The page header displays the dataset name, endorsement, if any, and dataset owner. To send an email to the dataset owner or the dataset certifier (if any), click the header and then click the name of the owner.

# [Datamarts](#tab/datamarts)

The datamart details page
* Shows you information about the dataset
* Lists the reports and scorecards that are built on top of the dataset
* Provides entry points for creating new reports built on the dataset, pulling the data into Excel via [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md), and creating formatted tables.

[ ![Screenshot of datamart details page.](media/service-data-details-page/datamart-details-page-inline-and-expanded.png)](media/service-data-details-page/datamart-details-page-inline-and-expanded.png#lightbox)

---

## Action bar

The Action bar at the top of the page contains a number of actions that you can launch. The actions available vary from user to user depending on their permissions on the data item.

# [Datasets](#tab/datasets)

|Action  |Description  |
|---------|---------|
|**File**     | Download the .pbix file for this dataset, manage permissions to this dataset, or go to dataset settings.       |
|**Refresh**     | Refresh this dataset or set a scheduled refresh.        |
|**Share**     | Share this dataset.        |
|**Create a report**     | Create a report based on this dataset, either auto-generated, from scratch, from a template (if one exists), or as a formatted table.        |
|**Analyze in Excel**     | Launch [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) using this dataset.        |
|**Lineage**     | Open the [lineage view](../collaborate-share/service-data-lineage.md) or the [impact analysis side pane](../collaborate-share/service-dataset-impact-analysis.md) for this dataset.        |
|**Chat in Teams**     | Invite people to start [chatting in Teams](../collaborate-share/service-share-report-teams.md). People you invite will receive a Teams chat message from you with a link to this dataset details page. If they have access to the dataset, the link will open this dataset details page in Teams.        |
|**Show tables**     | Open a side panel showing the dataset's tables. In the tables view you can create table previews by selecting desired columns.       |

# [Datamarts](#tab/datamarts)

|Action  |Description  |
|---------|---------|
|**File**     | Manage permissions for this datamart, or go to [datamart settings](../transform-model/datamarts/datamarts-create-reports.md#datamart-settings).       |
|**Refresh**     | Refresh this datamart, set up scheduled refresh, or view refresh history.        |
|**Share**     | Share this datamart. Sharing a datamart confers [Build permission](./service-datasets-permissions.md#what-are-the-dataset-permissions) on the datamart.        |
|**Create a report**     | Create a report based on this datamart.        |
|**Analyze in Excel**     | Launch [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) using this datamart.        |
|**Lineage**     | Open the [lineage view](../collaborate-share/service-data-lineage.md) or the [impact analysis side pane](../collaborate-share/service-dataset-impact-analysis.md) for this datamart.        |
|**Edit**     | Opens the datamart in the Datamart editor.        |

---

## Data details

# [Datasets](#tab/datasets)

image

The dataset details section shows
* The name of the workspace where the item is located.
* Endorsement status and certifier (if certified).
* The exact time of the last refresh.
* Sensitivity (if set).
* Description (if any). You can create or edit the description from here.

# [Datamarts](#tab/datamarts)

:::image type="content" source="media/service-data-details-page/datamart-details-page-details-section.png" alt-text="Screenshot of datamart details section on data details page.":::

The datamart details section shows
* The name of the workspace where the item is located.
* Endorsement status and certifier (if certified).
* The exact time of the last refresh.
* Sensitivity (if set).
* SQL connection string (Datamarts).
* Description (if any). You can create or edit the description from here.

---

## Explore related reports

# [Datasets](#tab/datasets)

image

The explore related reports section shows you all the reports and scorecards that are built on the dataset. You can create a copy of a report or scorecard by selecting the line the item is on and clicking the **Save a copy** icon that appears.

# [Datamarts](#tab/datamarts)

The **See what already exists section** shows you reports that are built on top of the datamart's auto-generated dataset.

:::image type="content" source="media/service-data-details-page/datamart-details-page-related-section.png" alt-text="Screenshot of datamart related section on data details page.":::

>[!NOTE]
> Reports build on top of other datasets created from the datamart **aren't** shown in this section. 

This section also shows you usage metrics for the related items.

You can create a copy of a report by selecting the report line in the list and then clicking the Save a copy of this report icon.

The columns in the list of related reports are:
* **Name**: Report name. If the name ends with (template), it means that this report has been specially constructed to be used as a template. For example, "Sales (template)".
* **Type**: Item type, for example, report or scorecard.
* **Endorsement**: Endorsement status.
* **Workspace**: The name of the workspace where the related item is located.
* **Unique viewers**: Shows the total number of unique users who viewed the item at least once in the last 30 days, excluding the current day's views.
* **Views**: Shows the total number of times an item was viewed in the last 30 days, excluding the current day's views.

---

### Visualize this data

In the Create a report section, click the **Create** button. Choose the desired option:

# [Datasets](#tab/datasets)

* **Auto-create**: Creates an auto-generated report from the dataset.
* **From template**: Creates a copy of the template in *My workspace*.
* **From scratch**: Opens the report editing canvas to a new report built on the dataset. When you save your new report, it will be saved in the workspace that contains the dataset if you have write permissions on that workspace. If you don't have write permissions on the workspace, or if you are a free user and the dataset resides in a Premium-capacity workspace, the new report will be saved in *My workspace*.
* **As formatted table**: Opens the formatted table editing canvas.

>[!NOTE]
> Only one template will be shown in the Create report drop-down, even if more than one report template exists for this dataset.

# [Datamarts](#tab/datamarts)

:::image type="content" source="media/service-data-details-page/datamart-details-page-visualize-data-section.png" alt-text="Screenshot of datamart visualize this data section on data details page.":::

In the **Visualize this data** section, click the **Create from scratch** button. If there is a report template for the dataset, a drop-down menu will offer two options:
* **From template**: Creates a copy of the template in *My workspace*.
* **From scratch**: Opens the report editing canvas to a new report built on the dataset. When you save your new report, it will be saved in the workspace that contains the dataset if you have write permissions on that workspace. If you don't have write permissions on the workspace, or if you are a free user and the dataset resides in a Premium-capacity workspace, the new report will be saved in *My workspace*.

If there are no report templates, clicking **Create** will open the report editing canvas directly.

>[!NOTE]
> Only one template will be shown in the Create report drop-down, even if more than one report template exists for this dataset. 

---

## Share this data

# [Datasets](#tab/datasets)

You can share the dataset with other users in your organization. Clicking the **Share dataset** button opens the **Share dataset** dialog, where you can choose which permissions to grant on the dataset.

:::image type="content" source="media/service-data-details-page/datamart-details-page-share-datamart-section.png" alt-text="Screenshot of datamart share this data section on data details page.":::

# [Datamarts](#tab/datamarts)

You can share the datamart with other users in your organization. Sharing grants [Build permission](./service-datasets-permissions.md#what-are-the-dataset-permissions) that allows the people you are sharing with to creat new content on top of the datamart.

:::image type="content" source="media/service-data-details-page/datamart-details-page-share-datamart-section.png" alt-text="Screenshot of datamart share this data section on data details page.":::

The **Share datamart** button opens the **Share datamart** dialog.

---
  
## Next steps
* [Use datasets across workspaces](service-datasets-across-workspaces.md)
* [Create reports based on datasets from different workspaces](service-datasets-discover-across-workspaces.md)
* [Endorse your dataset](../collaborate-share/service-endorse-content.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
