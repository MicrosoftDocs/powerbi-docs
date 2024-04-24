---
title: Datamart details page
description: Learn about the information and actions available to you on the datamart details page. The details page helps you explore, monitor, and use datamarts.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.date: 03/13/2023
LocalizationGroup: Share your work
---
# Datamart details

The datamart details page helps you explore, monitor, and use datamarts. When you select a datamart in the data hub, the details page for that datamart opens.

:::image type="content" source="media/service-datamart-details-page/datamart-details-page-inline-and-expanded.png" alt-text="Screenshot of datamart details page." lightbox="media/service-datamart-details-page/datamart-details-page-inline-and-expanded.png":::

The datamart details page:

* Shows you metadata about the datamart, including description, endorsement, and sensitivity, and connection string.
* Provides actions that you can perform on the datamart, such as share, refresh, create new, and Analyze in Excel.
* Lists the reports that are built on top of the datamart.

## Supported actions

The datamart details page enables you to perform actions on the datamart. The following table lists all supported actions. On the datamart details page you may see only a subset of this list, as only actions you have permission to perform are listed.

| Action | Description | On Action bar, choose: |
|--|--|
| **Manage permissions** | Opens the manage datamart permissions page. | **File** > **Manage permissions** |
| **Settings** | Opens the datamart settings page. | **File** > **Settings** |
| **Refresh now** | Launches a refresh of the semantic model. | **Refresh** > **Refresh now** |
| **Schedule refresh** | Opens the semantic model settings page where you can set scheduled refresh. | **Refresh** > **Schedule refresh** |
| **Refresh history** | Opens Refresh history window where you see the time, duration, and status of each refresh. You can download the history as a *.csv* file. | **Refresh** > **Refresh history** |
| **Share** | Opens the **Share datamart** dialog. Sharing a datamart allows recipients to build content based on the underlying semantic model and query the corresponding SQL endpoint. | **Share**, or use the [Share this data](#share-this-data) tile. |
| **Create a report from scratch** | Opens the report editing canvas where you can create a new report based on the datamart. | **Create a report** > **From scratch**, or use the [Visualize this data](#visualize-this-data) tile. |
| **Analyze in Excel** | Launches [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) using this datamart. | **Analyze in Excel** |
| **Open lineage view** | Opens the [lineage view](../collaborate-share/service-data-lineage.md) for the datamart. | **Lineage** > **Open lineage view** |
| **Impact analysis** | Opens the [impact analysis side pane](../collaborate-share/service-dataset-impact-analysis.md) for this datamart. | **Lineage** > **Impact analysis** |
| **Edit** | Opens the datamart in the Datamart editor. | **Edit** |

## View datamart metadata

:::image type="content" source="media/service-datamart-details-page/datamart-details-page-datamart-details.png" alt-text="Screenshot of datamart details section on the datamart details page.":::

The datamart details section shows:

* The location of the datamart.
* Endorsement status (and certifier, if certified).
* The exact time of the last refresh.
* Sensitivity, if set.
* T-SQL connection string.
* Description, if any.

## Explore related reports

The **See what already exists** section shows you reports that are built on top of the datamart's auto-generated semantic model. You can create a copy of a report by selecting the line the item is on and clicking the **Save a copy** icon that appears. This section also shows you usage metrics for the related items.

:::image type="content" source="media/service-datamart-details-page/datamart-details-page-explore-related-reports.png" alt-text="Screenshot of datamart explore related reports section on datamart details page." lightbox="media/service-datamart-details-page/datamart-details-page-explore-related-reports.png":::

> [!NOTE]
> Reports build on top of other semantic models created from the datamart aren't shown in this section.

The columns in the list of related reports are:

* **Name**: Report name. If the name ends with **(template)**, the report has been specially constructed to be used as a template. For example, "Sales (template)".
* **Type**: Item type, for example, report or scorecard.
* **Location**: The name of the workspace where the related item is located.
* **Refreshed**: Time of last refresh.
* **Endorsement**: Endorsement status.
* **Sensitivity**: Sensitivity.
* **Unique viewers**: Shows the total number of unique users who viewed the item at least once in the last 30 days, excluding the current day's views.
* **Views**: Shows the total number of times an item was viewed in the last 30 days, excluding the current day's views.

## Visualize this data

To create a report based on the semantic model, select the **Create a report** button on this tile and choose the desired option.

:::image type="content" source="media/service-datamart-details-page/datamart-details-page-visualize-data.png" alt-text="Screenshot of datamart related section on datamart details page.":::

* The **Create from scratch** option opens the report editing canvas to a new report built on the semantic model.

  When you save your new report, it's saved in the workspace that contains the semantic model, if you have write permissions on that workspace.

  If you don't have write permissions on the workspace, the report is saved in My workspace. If you're a free user and the semantic model resides in a Premium-capacity workspace, the report is saved in My workspace.

* The **Paginated report** option opens the paginated report online editor. For information about creating a paginated report using the online editor, see [Create exportable paginated reports in the Power BI service](../paginated-reports/web-authoring/paginated-formatted-table.md).

## Share this data

You can share the datamart with other users in your organization. Selecting the **Share datamart** button opens the [Share datamart dialog](service-datasets-share.md). People you share the datamart with can build content based on the underlying semantic model and query the corresponding SQL endpoint.

:::image type="content" source="media/service-datamart-details-page/datamart-details-page-share-datamart.png" alt-text="Screenshot of datamart share this data section on datamart details page.":::
  
## Related content

* [Create exportable paginated reports in the Power BI service](../paginated-reports/web-authoring/paginated-formatted-table.md)
* [Endorse your content](../collaborate-share/service-endorse-content.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)