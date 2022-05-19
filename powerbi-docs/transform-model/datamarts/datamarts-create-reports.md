---
title: Create reports using datamarts (preview)
description: Use your datamarts to create reports and share with users
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 05/24/2022
LocalizationGroup: Data from files
---

# Create reports using datamarts

Datamarts let you create reusable and auto-generated datasets to create reports in various ways in Power BI. This article describes the various ways you can use datamarts, and their auto-generated datasets, to create reports.

For example, you can establish a live connection to a shared dataset in the Power BI service and create many different reports from the same dataset. You can create your perfect data model in Power BI Desktop and publish it to the Power BI service. Then you and others can create multiple different reports in separate .pbix files from that common data model and save them to different workspaces. 

Advanced users can build reports from a datamart using a composite model or using the SQL Endpoint.

Reports that use datamarts can be created in either of the following two tools:

* Using the Power BI service
* Using Power BI Desktop

Let's take a look at how datamarts can be used with each, in turn.

## Create reports in the Power BI service 

**Scenario 1:** Using the auto-generated dataset and action menu in the workspace: In the Power BI workspace, navigate to the auto-generated dataset and select the **More** menu (...) to create a report in the Power BI service. 

Selecting the **More** opens the report editing canvas to a new report that is built on the dataset. When you save your new report, it's saved in the workspace that contains the dataset as long as you have write permissions on that workspace. If you don't have write permissions, or if you're a free user and the dataset resides in a Premium-capacity workspace, the new report is saved in your *My workspace*.

**Scenario 2:** Using the auto-generated dataset and dataset information page. In the Power BI workspace list, navigate to the auto-generated dataset to get to the Dataset information page, where you can find details about the dataset and see related reports. You can also create a report directly from this page. To learn more about creating a report in this fashion, see [discovering datasets in the Power BI service](/power-bi/connect-data/service-datasets-hub).

In the data hub, you'll see datamarts and their associated auto-generated datasets. Select the datamart to navigate to the information page where you can see datamart’s metadata, supported actions, lineage and impact analysis, along with related reports created from that datamart. Auto-generated datasets derived from datamarts behave the same as any dataset.

To find the datamart you, begin with the datasets hub page. The following image below shows the datasets hub in the Power BI service, with the following numbered information: 

1.	Select a datamart to view its datamart details page
2.	Select the **More** menu (...) to display the options menu
3.	Select **Details** to view details summary.

:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-01.png" alt-text="Screenshot of how to find datamarts in the power B I service." lightbox="media/datamarts-create-reports/datamarts-create-reports-01.png":::


## Create reports using Power BI Desktop

You can build reports from datasets with **Power BI Desktop** using a Live connection to the dataset. For information on how to make the connection, see [connect to datasets from Power BI Desktop](/power-bi/connect-data/desktop-report-lifecycle-datasets).  

For advanced situations where you want to add more data or change the storage mode, see [use composite models in Power BI Desktop](/power-bi/transform-model/desktop-composite-models).

Complete the following steps to connect to a datamart in Power BI Desktop:

1.	Navigate to the datamart settings in your workspace and copy the SQL endpoint connection string. 
2.	In Power BI Desktop select the **SQL Server connector** from the ribbon or from **Get Data**. 
3.	Paste the connection string into the connector dialog. 
4.	For authentication, select *organizational account*.
5.	Authenticate using Azure Active Directory - MFA (the same way you would connect to Power BI)
6.	Select **Connect**.
7.	Select the data items you want to include or not include in your dataset.

For more information, see [connect to on-premises data in SQL Server](/power-bi/connect-data/service-gateway-sql-tutorial). You don't need to set up a gateway with datamarts to use them in Power BI. 


## Datamart context menus

Datamarts offer a familiar experience to create reports and access supported actions using its context menus. 

:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-02.png" alt-text="Screenshot of the datamart context menu.":::

The following table describes the datamart context menu options:

| Menu Option | Option Description |
| --- | --- |
| Analyze in Excel | Uses the existing Analyze in Excel capability on auto-generated dataset. Learn more about [Analyze in Excel](/power-bi/collaborate-share/service-analyze-in-excel) |
| Create report | Build a Power BI report in DirectQuery mode. Learn more about [get started creating in the Power BI service](/power-bi/fundamentals/service-get-started#step-1-get-data) |
| Delete | Delete dataset from workspace. A confirmation dialog notifies you of the impact of delete action. If **Delete** action is confirmed, then the datamart and related downstream artifacts will be deleted<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-03.png" alt-text="Screenshot of the datamart delete datamart menu."::: |
| Manage permissions | Enables users to add other recipients with specified permissions, similar to allowing the sharing of an underlying dataset or allowing to build content with the data associated with the underlying dataset.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-04.png" alt-text="Screenshot of the datamart grant people access menu."::: |
| Refresh history | Provides the history of refresh activity with the duration of activity and status.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-05.png" alt-text="Screenshot of the datamart refresh history window."::: |
| Rename | Updates the datamart and auto-generated dataset with the new name.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-06.png" alt-text="Screenshot of the datamart rename window."::: |
| Settings | Learn more about [datamart settings](#datamart-settings) |
| Share | Lets users share the datamart to build content based on the underlying auto-generated dataset and query the corresponding SQL endpoint. Shares the datamart access (SQL- read only, and autogenerated dataset) with other users in your organization. Users receive an email with links to access the detail page where they can find the SQL Server URL and can access the auto-generated dataset to create reports based on it.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-07.png" alt-text="Screenshot of the datamart share menu."::: |
| View lineage | This shows the end-to-end lineage of datamarts from the data sources to the datamart, the auto-generated dataset, and other datasets (if any) that were built on top of the datamarts, all the way to deports, dashboards and apps.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-08.png" alt-text="Screenshot of the datamart view lineage window." lightbox="media/datamarts-create-reports/datamarts-create-reports-08.png"::: |




## Datamart settings

Datamart settings are accessible from the context menu for datamarts. This section describes and explains the datamart settings options and their description. The following image shows the datamart settings menu.

:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-09.png" alt-text="Screenshot of the datamart context menu with settings selected.":::

The following is a list of settings available for each datamart.

| Setting | Detail |
| --- | --- |
| Datamart description | Lets users add metadata details to provide descriptive information about a datamart.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-10.png" alt-text="Screenshot of the datamart description menu."::: |
| Server settings | The SQL endpoint connection string for a datamart. You can use the connection string to create a connection to the datamart using various tools, such as SSMS.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-11.png" alt-text="Screenshot of the datamart connection string."::: |
| Data source credentials | Lets you get data source information and edit credentials.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-12.png" alt-text="Screenshot of the datamart source credentials menu."::: |
| Schedule refresh | Data refresh information for the datamart, based on the schedule defined by the user.<br>:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-13.png" alt-text="Screenshot of the datamart scheduled refresh menu."::: |
| Sensitivity label | Sensitivity label applied on datamart, which also gets propagated on the downstream auto-generated dataset, reports, and so on.<br> :::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-14.png" alt-text="Screenshot of the datamart sensitivity label settings."::: <br><br>The sensitivity labels propagation to downstream dataset, reports won't happen in the following scenarios:<ul><li>Sensitivity label downgrade<li>Specific artifacts when the sensitivity label was manually set</ul> |

The following table shows settings for auto-generated datasets. When these settings are applied on an auto-generated dataset, they're also applied to datamart as well.

| Setting | Details |
| --- | --- |
| Endorsement and discovery | :::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-15.png" alt-text="Screenshot of the endorsement and discovery setting."::: |
| Request access | :::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-16.png" alt-text="Screenshot of the request access setting."::: |
| Q&amp;A | :::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-17.png" alt-text="Screenshot of the Q and A setting."::: |
| Query caching | :::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-18.png" alt-text="Screenshot of the query caching setting."::: |


## Next steps
This article provided information about creating reports using datamarts. 

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Understand datamarts](datamarts-understand.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Access control in datamarts](datamarts-access-control.md)
* [Datamart administration](datamarts-administration.md)


For more information about dataflows and transforming data, see the following articles:
* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)

