---
title: Create reports using datamarts (preview)
description: Learn how to create and share reports using datamarts in Power BI, including live connections, composite models, and SQL Endpoints.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 10/01/2024
LocalizationGroup: Data from files
#customer intent: As a Power BI user I want to learn how to share reports using datamarts in Power BI.
---

# Create reports using datamarts

Datamarts let you create reusable and auto-generated semantic models to create reports in various ways in Power BI. This article describes the various ways you can use datamarts, and their auto-generated semantic models, to create reports.
For example, you can establish a live connection to a shared semantic model in the Power BI service and create many different reports from the same semantic model. You can create your perfect data model in Power BI Desktop and publish it to the Power BI service. Then you and others can create multiple different reports in separate .pbix files from that common data model and save them to different workspaces.
Advanced users can build reports from a datamart using a composite model or using the SQL Endpoint.

Reports that use datamarts can be created in either of the following two tools:

* Using the Power BI service
* Using Power BI Desktop

Let's take a look at how datamarts can be used with each, in turn.

## Create reports in the Power BI service

**Scenario 1:** From within the datamart experience, using the ribbon and the main home tab, navigate to the **New report** button. This provides a native, quick way to create reports.

Selecting **New report** opens a browser tab to the report editing canvas to a new report that is built on the semantic model. When you save your new report you're prompted to choose a workspace, provided you have write permissions for that workspace. If you don't have write permissions, or if you're a free user and the semantic model resides in a Premium-capacity workspace, the new report is saved in your *My workspace*.

**Scenario 2:** Using the auto-generated semantic model and action menu in the workspace: In the Power BI workspace, navigate to the auto-generated semantic model and select the **More** menu (...) to create a report in the Power BI service.

Selecting the **More** opens the report editing canvas to a new report that is built on the semantic model. When you save your new report, it's saved in the workspace that contains the semantic model as long as you have write permissions on that workspace. If you don't have write permissions, or if you're a free user and the semantic model resides in a Premium-capacity workspace, the new report is saved in your *My workspace*.

**Scenario 3:** Using the auto-generated semantic model and semantic model details page. In the Power BI workspace list, select the auto-generated semantic model's name to get to the semantic model details page, where you can find details about the semantic model and see related reports. You can also create a report directly from this page. To learn more about creating a report in this fashion, see [semantic model details](../../connect-data/service-dataset-details-page.md).

In the data hub, you'll see datamarts and their associated auto-generated semantic models. Select the datamart to navigate to the datamart's details page where you can see the datamart’s metadata, supported actions, lineage and impact analysis, along with related reports created from that datamart. Auto-generated semantic models derived from datamarts behave the same as any semantic model.

To find the datamart, you begin with the data hub. The image below shows the data hub in the Power BI service, with the following numbered information:

1. Select a datamart to view its datamart details page
2. Select the **More** menu (...) to display the options menu
3. Select **Details** to view details summary.

:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-01.png" alt-text="Screenshot of how to find datamarts in the power B I service." lightbox="media/datamarts-create-reports/datamarts-create-reports-01.png":::

## Create reports using Power BI Desktop

You can build reports from semantic models with **Power BI Desktop** using a Live connection to the semantic model. For information on how to make the connection, see [connect to semantic models from Power BI Desktop](/power-bi/connect-data/desktop-report-lifecycle-datasets).  

For advanced situations where you want to add more data or change the storage mode, see [use composite models in Power BI Desktop](/power-bi/transform-model/desktop-composite-models).

Complete the following steps to connect to a datamart in Power BI Desktop:

1. Navigate to the datamart settings in your workspace and copy the SQL endpoint connection string.
2. In Power BI Desktop select the **SQL Server connector** from the ribbon or from **Get Data**.
3. Paste the connection string into the connector dialog.
4. For authentication, select *organizational account*.
5. Authenticate using Microsoft Entra ID - MFA (the same way you would connect to Power BI)
6. Select **Connect**.
7. Select the data items you want to include or not include in your semantic model.

For more information, see [connect to on-premises data in SQL Server](/power-bi/connect-data/service-gateway-sql-tutorial). You don't need to set up a gateway with datamarts to use them in Power BI.

## Related content

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
