---
title: Creating a dataflow
description: Overview of the different options to create a dataflow
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 10/01/2020
ms.author: davidi

LocalizationGroup: Data from files
---
# Creating a dataflow
A **dataflow** is a collection of entities (entities are similar to tables) that are created and managed in workspaces in the Power BI service. An **entity/Table** is a set of fields that are used to store data, much like a table within a database. You can add and edit entities/tables in your dataflow, as well as manage data refresh schedules, directly from the workspace in which your dataflow was created.

To create a dataflow, launch the Power BI service in a browser then select a **workspace** (dataflows are not available in *my-workspace* in the Power BI service) from the nav pane on the left, as shown in the following screen. You can also create a new workspace in which to create your new dataflow.
![start a dataflow](media/dataflows-create/create-options.png)

There are a multiple of ways to create or build on top of a new dataflow:

* [Create a dataflow using define new entities](#create-a-dataflow-using-define-new-entities)
* [Create a dataflow using linked entities](#create-a-dataflow-using-linked-entities)
* [Create a dataflow using a computed entity](#create-a-dataflow-using-a-computed-entity)
* [Create a dataflow using import/export](#create-a-dataflow-using-importexport)

The following sections explore each of these ways to create a dataflow in detail.

## Create a dataflow using define new entities

Using the Define new entities option lets you define a new entity/table and connect to a new data source.
[ ![choose a connector](media/dataflows-create/create-connectors.png) ](media/dataflows-create/create-connectors.png#lightbox)

When you select a data source, you're prompted to provide the connection settings, including the account to use when connecting to the data source, as shown in the following image.
![azure sql connector](media/dataflows-create/azure-sql-connector.png)

Once connected, you can select which data to use for your entity. When you choose data and a source, Power BI reconnects to the data source in order to keep the data in your dataflow refreshed, at the frequency you select later in the setup process.
![select table](media/dataflows-create/choose-table.png)

Once you select the data for use in the entity, you can use dataflow editor to shape or transform that data into the format necessary for use in your dataflow. 

## Create a dataflow using linked entities

Creating a dataflow using linked entities enables you to reference an existing entity, defined in another dataflow, in a read-only fashion. The following list describes some of the reasons you may choose this approach:

* If you want to reuse an entity across multiple dataflows, such as a date entity or a static lookup table, you should create an entity once and then reference it across the other dataflows.

* If you want to avoid creating multiple refreshes to a data source, it's better to use linked entities to store the data and act as a cache. Doing so allows every subsequent consumer to leverage that entity, reducing the load to the underlying data source.

* If you need to perform a merge between two entities.

> [!NOTE]
> Linked entities are available only with Power BI Premium.

## Create a dataflow using a computed entity

Creating a dataflow using a computed entity allows you to reference a linked entity and perform operations on top of it in a write-only fashion. The result is a new entity, which is part of the dataflow. To convert a linked entity into a computed entity, you can either create a new query from a merge operation, or if you want to edit or transform the entity, create a reference or duplicate of the entity.

### How to create computed entities

Once you have a dataflow with a list of entities, you can perform calculations on those entities.
In the dataflow authoring tool in the Power BI service, select **Edit entities**, then right-click on the entity you want to use as the basis for your computed entity and on which you want to perform calculations. In the context menu, choose **Reference**.
For the entity to be eligible as a computed entity, the **Enable load** selection must be checked, as shown in the following image. Right-click on the entity to display this context menu.

![create computed entity step 1](media/dataflows-create/computed-entity-step-1.png)

By selecting **Enable load**, you create a new entity for which its source is the referenced entity. The icon changes, and shows the **computed** icon, as shown in the following image.

![create computed entity step 2](media/dataflows-create/computed-entity-step-2.png)

Any transformation you perform on this newly created entity is run on the data that already resides in Power BI dataflow storage. That means that the query will not run against the external data source from which the data was imported (for example, the SQL database from which the data was pulled), but rather, is performed on the data that resides in the dataflow storage.

**Example use cases**
What kind of transformations can be performed with computed entities? Any transformation that you usually specify using the transformation user interface in Power BI, or the M editor, are all supported when performing in-storage computation.

Consider the following example: you have an *Account* entity that contains the raw data for all the customers from your Dynamics 365 subscription. You also have *ServiceCalls* raw data from the Service Center, with data from the support calls that were performed from the different account in each day of the year.

Imagine you want to enrich the *Account* entity with data from the *ServiceCalls*.
First you would need to aggregate the data from the *ServiceCalls* to calculate the number of support calls that were done for each account in the last year.

![create computed entity step 3](media/dataflows-create/computed-entity-step-3.png)

Next, you would want to merge the *Account* entity with the *ServiceCallsAggregated* entity to calculate the enriched *Account* table.

![create computed entity step 4](media/dataflows-create/computed-entity-step-4.png)

And then you can see the results, shown as *EnrichedAccount* in the following image.

![create computed entity step 5](media/dataflows-create/computed-entity-step-5.png)

And that's it - the transformation is performed on the data in the dataflow that resides in your Power BI Premium subscription, not on the source data.

> [!NOTE]
> Computed entities are a premium only feature

## Create a dataflow using a CDM folder

Creating a dataflow from a CDM folder allows you to reference an entity that has been written by another application in the Common Data Model (CDM) format. You are prompted to provide the complete path to the CDM format file stored in ADLS Gen 2.

 ![create computed entity step 6](media/dataflows-create/attach-cdm.jpg)

There are a few requirements for creating dataflows from CDM folders, as the following list describes:

* The ADLS Gen 2 account must have the appropriate permissions set up in order for PBI to access the file

* The ADLS Gen 2 account must be accessible by the user trying to create the dataflow

* Creating dataflows from CDM folders is only available in the new workspace experience

* The URL must be a direct file path to the JSON file and use the ADLS Gen 2 endpoint; blob.core is not supported

## Create a dataflow using import/export

Creating a dataflow using import/export lets you import a dataflow from a file. This is useful if you want to save a dataflow copy offline, or move a dataflow from one workspace to another. 

To export a dataflow, select the dataflow you created and select the **More** menu item (the ellipsis) to expand the options, and then select **export .json**. You are prompted to begin the download of the dataflow represented in CDM format.

![create computed entity step 7](media/dataflows-create/export-dataflow.png)

To import a dataflow, select the import box and upload the file. Power BI creates the dataflow for you, and allows you to save the dataflow as is, or to perform additional transformations.

## Next steps

Once you create a dataflow, you can use Power BI Desktop and the Power BI service to create datasets, reports, dashboards, and apps that are based on the data you put into Power BI dataflows, and thereby gain insights into your business activities. The following articles go into more detail about common usage scenarios for dataflows:

* [Introduction to dataflows and self-service data prep](dataflows-introduction-self-service.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Configuring Dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [AI with dataflows](dataflows-machine-learning-integration.md)
* [Dataflows limitations and considerations](dataflows-features-limitations.md)