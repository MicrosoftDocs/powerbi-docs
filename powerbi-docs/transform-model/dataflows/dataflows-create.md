---
title: Creating a dataflow
description: Learn about the different options to create a dataflow or build on top of an existing dataflow in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 09/16/2024
ms.custom: FY25Q1-Linter
LocalizationGroup: Data from files
#customer intent: As a Power BI user I want to learn different options to create a dataflow and build on existing dataflows in Power BI.
---
# Creating a dataflow

A **dataflow** is a collection of tables that are created and managed in workspaces in the Power BI service. A **table** is a set of columns that are used to store data, much like a table within a database. You can add and edit tables in your dataflow, and manage data refresh schedules, directly from the workspace in which your dataflow was created.
To create a dataflow, launch the Power BI service in a browser then select a **workspace** (dataflows aren't available in *my-workspace* in the Power BI service) from the nav pane. You can also create a new workspace in which to create your new dataflow.

There are multiple ways to create or build on top of a new dataflow:

* [Create a dataflow by using new source](#create-a-dataflow-by-using-new-source)
* [Create a dataflow by using linked tables](#create-a-dataflow-by-using-linked-tables)
* [Create a dataflow by using a CDM folder](#create-a-dataflow-by-using-a-cdm-folder)
* [Create a dataflow by using import/export](#create-a-dataflow-by-using-importexport)

The following sections explore each of these ways to create a dataflow in detail.

> [!NOTE]
> Dataflows can be created by users in a Premium workspace, users with a Pro license, and users with a Premium Per User (PPU) license.

## Create a dataflow by using new source

Using the New source option lets you define a new table and connect to a new data source.

1. Select the **Get data...* link on the screen, or select a source using **New source** in the ribbon.

:::image type="content" source="media/dataflows-create/create-connectors.png" alt-text="Screenshot showing options for data sources." lightbox="media/dataflows-create/create-connectors.png":::

2. When you select a data source, you're prompted to provide the connection settings, including the account to use when connecting to the data source, as shown in the following image.
:::image type="content" source="media/dataflows-create/azure-sql-connector.png" alt-text="Screenshot of the form displayed after you choose Azure SQL as a connector.":::
3. Once connected, you can select which data to use for your table. When you choose data and a source, Power BI reconnects to the data source. The reconnection keeps the data in your dataflow refreshed at the frequency that you select later in the setup process.
:::image type="content" source="media/dataflows-create/choose-table.png" alt-text="Screenshot of a table selection on the Choose Data screen.":::
4. After you select the data for use in the table, you can use dataflow editor to shape or transform that data into the format necessary for use in your dataflow.

## Create a dataflow by using linked tables

Creating a dataflow by using linked tables enables you to reference an existing table, defined in another dataflow, in a read-only fashion. The following list describes some of the reasons you might choose this approach:

* If you want to reuse a table across multiple dataflows, such as a date table or a static lookup table, you should create a table once and then reference it across the other dataflows.

* If you want to avoid creating multiple refreshes to a data source, it's better to use linked tables to store the data and act as a cache. Doing so allows every subsequent consumer to use that table, reducing the load to the underlying data source.

* If you need to perform a merge between two tables.

> [!NOTE]
> Linked tables are available only with Power BI Premium.

## Create a dataflow by using a computed table

Creating a dataflow by using a computed table allows you to reference a linked table and perform operations on top of it in a write-only fashion. The result is a new table, which is part of the dataflow. There are two ways to convert a linked table into a computed table. You can create a new query from a merge operation. Or if you want to edit or transform the table, you can create a reference or duplicate of the table.

### How to create computed tables

After you have a dataflow with a list of tables, you can perform calculations on those tables.
In the dataflow authoring tool in the Power BI service, select **Edit tables**, then right-click on the table you want to use as the basis for your computed table and on which you want to perform calculations. In the context menu, choose **Reference**.
For the table to be eligible as a computed table, the **Enable load** selection must be checked, as shown in the following image. Right-click on the table to display this context menu.

:::image type="content" source="media/dataflows-create/computed-entity-step-1.png" alt-text="Screenshot of the context menu on a selected table with enable load highlighted.":::

By selecting **Enable load**, you create a new table for which its source is the referenced table. The icon changes, and shows the **computed** icon, as shown in the following image.

:::image type="content" source="media/dataflows-create/computed-entity-step-2.png" alt-text="Screenshot of the changed icon of the table highlighted.":::

Any transformation you perform on this newly created table is run on the data that already resides in Power BI dataflow storage. That means that the query won't run against the external data source from which the data was imported, like the data pulled from the SQL database. Instead the query is performed on the data that resides in the dataflow storage.

### Example use cases

What kind of transformations can be performed with computed tables? Any transformation that you usually specify by using the transformation user interface in Power BI, or the M editor, are all supported when performing in-storage computation.

Consider the following example: you have an *Account* table that contains the raw data for all the customers from your Dynamics 365 subscription. You also have *ServiceCalls* raw data from the Service Center, with data from the support calls that were performed from the different account in each day of the year.

Imagine you want to enrich the *Account* table with data from the *ServiceCalls*.
First you would need to aggregate the data from the *ServiceCalls* to calculate the number of support calls that were done for each account in the last year.

:::image type="content" source="media/dataflows-create/computed-entity-step-3.png" alt-text="Screenshot of the Group by accountid screen.":::

Next, you would want to merge the *Account* table with the *ServiceCallsAggregated* table to calculate the enriched *Account* table.

:::image type="content" source="media/dataflows-create/computed-entity-step-4.png" alt-text="Screenshot of the Merge screen":::

And then you can see the results, shown as *EnrichedAccount* in the following image.

:::image type="content" source="media/dataflows-create/computed-entity-step-5.png" alt-text="Screenshot of the merge results" lightbox="media/dataflows-create/computed-entity-step-5.png":::

And that's it - the transformation is performed on the data in the dataflow that resides in your Power BI Premium subscription, not on the source data.

> [!NOTE]
> Computed tables are a premium only feature

## Create a dataflow by using a CDM folder

Creating a dataflow from a CDM folder allows you to reference a table that written by another application in the Common Data Model (CDM) format. You're prompted to provide the complete path to the CDM format file stored in ADLS Gen 2.

 :::image type="content" source="media/dataflows-create/attach-cdm.png" alt-text="Screenshot of the Attach a new CDM folder to a new dataflow screen.":::

There are a few requirements for creating dataflows from CDM folders, as the following list describes:

* The ADLS Gen 2 account must have the appropriate permissions set up in order for PBI to access the file.

* The ADLS Gen 2 account must be accessible by the user trying to create the dataflow.

* The URL must be a direct file path to the JSON file and use the ADLS Gen 2 endpoint; blob.core isn't supported.

## Create a dataflow by using import/export

Creating a dataflow by using import/export lets you import a dataflow from a file. This tool is useful if you want to save a dataflow copy offline, or move a dataflow from one workspace to another.

To export a dataflow, select the dataflow you created and select the **More** menu item (the ellipsis) to expand the options, and then select **Export .json**. You're prompted to begin the download of the dataflow represented in CDM format.

:::image type="content" source="media/dataflows-create/export-dataflow.png" alt-text="Screenshot of a selected dataflow with the more dropdown menu opened.":::

To import a dataflow, select the import box and upload the file. Power BI creates the dataflow for you, and allows you to save the dataflow as is, or to perform other transformations.

## Related content

By putting your data into a dataflow you can use Power BI Desktop and the Power BI service to create semantic models, reports, dashboards, and apps. These new resources can give you insights into your business activities. The following articles go into more detail about common usage scenarios for dataflows:

* [Introduction to dataflows and self-service data prep](dataflows-introduction-self-service.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Configuring Dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [AI with dataflows](dataflows-machine-learning-integration.md)
* [Dataflows considerations and limitations](dataflows-features-limitations.md)
* [Dataflows best practices](dataflows-best-practices.md)
