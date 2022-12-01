---
title: Dataflows Limitations, restrictions and supported connectors and features
description: Overview of all the capabilities of dataflows
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 08/02/2022
LocalizationGroup: Data from files
---
# Dataflows considerations and limitations

There are a few dataflow limitations across authoring, refreshes, and capacity management that users should keep in mind, as described in the following sections.

## General limitations

* Feature parity across government environments can be found in the [Power BI feature availability for government](../../enterprise/service-govus-overview.md#power-bi-feature-availability) article.
* Deleted datasources aren't removed from the dataflow datasource page. This is a benign behavior and doesn't impact the refresh or editing of dataflows. In **[Lineage View](../../collaborate-share/service-data-lineage.md)**, deleted data sources appear as lineage for a dataflow.
* Deleted datasources  will still appear in the Setting page in the gateway drop-down.
* *Depth* equates to dataflows linked to other dataflows. The current maximum depth is 32.
* *Breadth* equates to entities within a dataflow.
    * There's no guidance or limits for the optimal number of entities is in a dataflow, however, shared dataflows have a refresh limit of two hours per entity, and three per dataflow. So if you have two entities, and each takes two hours, you shouldn't put them in the same dataflow.
    * For Power BI Premium, guidance and limits are driven by individual use cases rather than specific requirements. The only limit for Power BI Premium is a 24-hour refresh per dataflow.
* A Power BI Premium subscription is required in order to refresh more than 10 dataflows cross workspace
* PowerQuery limitations are found in the [Power Query Online Limits](https://learn.microsoft.com/power-query/power-query-online-limits) article
* Power BI dataflows don't support use of global variables in a URL argument.
* Multi-Geo is currently not supported unless configuring storage to use your own Azure Data Lake Gen2 storage account.
* Vnet support is achieved by using a gateway.
* When using *Computed entities* with gateway data sources, the data ingestion should be performed in different data sources than the computations. The computed entities should build upon entities that are only used for ingestion, and not ingest data within their own mash-up steps.
* In Power BI dataflows, you can use parameters but you can't edit them unless you edit the entire dataflow. In this regard, parameters in dataflows behave similar to declared constants.


## Dataflow authoring

When authoring dataflows, users should be mindful of the following considerations:

* Authoring in Dataflows is done in the Power Query Online (PQO) environment; see the limitations described in [Power Query limits](/power-query/power-query-online-limits).
Because dataflows authoring is done in the  Power Query Online (PQO) environment, updates performed on the Dataflows workload configurations  only impact refreshes, and won't have an impact on the authoring experience

* Dataflows can only be modified by their owners

* Dataflows aren't available in *My Workspace*

* Dataflows using gateway data sources don't support multiple credentials for the same data source

* Using the Web.Page connector requires a gateway

## API considerations

More about supported Dataflows REST APIs can be found in the [REST API reference](/rest/api/power-bi/dataflows). Here are some considerations to keep in mind:

* Exporting and Importing a dataflow gives that dataflow a new ID

* Importing dataflows that contain linked tables won't fix the existing references within the dataflow (these queries should be fixed manually before importing the dataflow)

* Dataflows can be overwritten with the *CreateOrOverwrite* parameter, if they have initially been created using the import API

## Dataflows in shared capacities

There are limitations for Dataflows in shared capacities (non-Premium capacities):

* When refreshing Dataflows, timeouts in a shared capacity are 2 hours per table, and 3 hours per Dataflow
* Linked tables can't be created in shared Dataflows, although they can exist within the Dataflow as long as the *Load Enabled* property on the query is disabled
* Computed tables can't be created in shared Dataflows
* AutoML and Cognitive services aren't available in shared Dataflows
* Incremental refresh doesn't work in shared Dataflows

## Dataflows in Premium

Dataflows that exist in Premium have the following considerations and limitations.

**Refreshes and data considerations:**

* When refreshing Dataflows, timeouts are 24 hours (no distinction for tables and/or dataflows)

* Changing a dataflow from an incremental refresh policy to a normal refresh, or vice versa, will drop all data

* Modifying a dataflow's schema will drop all data

* When using a Premium Per User (PPU) license with dataflows, data is cleared when moving data out of a PPU environment

* When a dataflow is refreshed in a Premium Per User (PPU) context, the data isn't visible to non-PPU users

* Incremental refresh works with dataflows only when the enhanced compute engine is enabled


**Linked and Computed tables:**

* Linked tables can go down to a depth of 32 references

* Cyclic dependencies of linked tables aren't allowed

* A linked table can't be joined with a regular table that gets its data from an on-premises data source

* When a query (query *A*, for example) is used in the calculation of another query (query *B*) in dataflows, query *B* becomes a calculated table. Calculated tables can't refer to on-premises sources.


**Compute Engine:**

* While using the Compute engine, there's an approximate 10% to 20% initial increase in time for data ingestion.

  * This only applied to the first dataflow that is on the compute engine, and reads data from the data source
  * Subsequent dataflows that use the source dataflow won't incur the same penalty

* Only certain operations make use of the compute engine, and only when used through a linked table or as a computed table. A full list of operations is available in [this blog post](http://petcu40.blogspot.com/2019/06/m-folding-in-enhanced-engine-of-power.html).


**Capacity Management:**

* By design, the Premium Power BI Capacities have an internal Resource Manager which throttles the workloads in different ways when the capacity is running on low memory.

  1. For Dataflows, this throttling pressure reduces the number of available M Containers
  2. The memory for Dataflows can be set to 100%, with an appropriately sized container for your data sizes, and the workload will manage the number of containers appropriately

* The approximate number of containers can be found out by dividing the total memory allocated to the workload by the amount of memory allocated to a container

## Dataflow usage in datasets

* When creating a dataset in Power BI Desktop, and then publishing it to the Power BI service, ensure the credentials used in Power BI Desktop for the Dataflows data source are the same credentials used when the dataset is published to the service.
  1. Failing to ensure those credentials are the same results in a *Key not found* error upon dataset refresh

> [!NOTE]
> If the Dataflow structure is changed, such as a new or renamed column, the dataset will not show the change, and the change may also cause a data refresh to fail in the Power BI service for the dataset, until refreshed in Power BI Desktop and re-published.

## Dataflows and named connections

When using dataflows with [named connections](/power-query/connection-authentication-pqo), the following limitations apply:

* You can only create one cloud connection of a particular path and type, for example, you could only create one SQL plus server/database cloud connection. You can create multiple gateway connections.
* You cannot name or rename cloud data sources; you can name or rename gateway connections.


## ADLS limitations

* ADLS isn't available in GCC, GCC High or DOD environments. For more information, see [Power BI for US government customers](../../enterprise/service-govus-overview.md).
* You must be assigned as an owner of the resource, due to changes in the ADLS Gen 2 APIs.
* Azure subscription migration isn't supported, but there are two alternatives to do so:
    * First approach: after migration, the user can detach workspaces and reattach them. If using the tenant level account, you must detach all workspaces then detach at the tenant level, and reattach. This can be undesirable for customers who don't want to delete all of their dataflows, or have many workspaces. 
    * Second approach: if the previous approach isn't feasible, submit a support request to change the subscription ID in the database.
* ADLS doesn't support most elements in the list in the [Directories and file names](/rest/api/storageservices/naming-and-referencing-shares--directories--files--and-metadata) section of the article for workspace naming and dataflow naming, due to the following limitations:
    * Power BI either returns an unhelpful error, or allows the process to happen but the refresh will fail. 
* Cross tenant ADLS subscriptions aren't supported. The ADLS attached to Power BI must be part of the same Azure tenant that Power BI uses for Azure Active Directory (Azure AD).

## Dataflow data types

The data types supported in dataflows are the following:

|Mashup data type	|Dataflow data type |
|---------|---------|
|Time|Time|
|Date|Date|
|DateTime|DateTime|
|DateTimeZone|DateTimeOffset|
|Logical|Boolean|
|Text|String|
|Any|String|
|Currency|Decimal|
|Int8	|Int64|
|Int16	|Int64|
|Int32	|Int64|
|Int64	|Int64|
|Double	|Double|
|Percentage	|Double|
|Single	|Double|
|Decimal	|Double|
|Number	|Double|
|Duration	|Not Supported|
|Binary	|Not Supported|
|Function	|Not Supported|
|Table	|Not Supported|
|List	|Not Supported|
|Record	|Not Supported|
|Type	|Not Supported|
|Action	|Not Supported|
|None	|Not Supported|
|Null	|Not Supported|


## Next steps
The following articles provide more information about dataflows and Power BI:

* [Introduction to dataflows and self-service data prep](dataflows-introduction-self-service.md)
* [Creating a dataflow](dataflows-create.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Configuring Dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [AI with dataflows](dataflows-machine-learning-integration.md)
* [Dataflows best practices](dataflows-best-practices.md)
