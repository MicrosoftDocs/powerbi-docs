---
title: Dataflows Limitations, restrictions and supported connectors and features
description: Overview of all the capabilities of dataflows
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 10/01/2020
LocalizationGroup: Data from files
---
# Dataflows limitations and considerations

There are a few dataflow limitations across authoring, refreshes, and capacity management that users should keep in mind, as described in the following sections.

## Dataflow Authoring

When authoring dataflows, users should be mindful of the following considerations:

* Authoring in Dataflows is done in the Power Query Online (PQO) environment; see the limitations described in [Power Query limits](/power-query/power-query-online-limits).
Because dataflows authoring is done in the  Power Query Online (PQO) environment, updates performed on the Dataflows workload configurations  only impact refreshes, and will not have an impact on the authoring experience

* Dataflows can only be modified by their owners

* Dataflows are not available in *My Workspace*

* Dataflows using gateway data sources do not support multiple credentials for the same data source

* Using the Web.Page connector requires a gateway

## API Considerations

More about supported Dataflows REST APIs can be found in the [REST API reference](/rest/api/power-bi/dataflows). Here are some considerations to keep in mind:

* Exporting and Importing a dataflow gives that dataflow a new ID

* Importing dataflows that contain linked entities will not fix the existing references within the dataflow (these queries should be fixed manually before importing the dataflow)

* Dataflows can be overwritten with the *CreateOrOverwrite* parameter, if they have initially been created using the import API

## Dataflows in Shared

There are  limitations for Dataflows in shared capacities:

* When refreshing Dataflows, timeouts in Shared are 2 hours per entity, and 3 hours per Dataflow
* Linked entities cannot be created in shared Dataflows, although they can exist within the Dataflow as long as the *Load Enabled* property on the query is disabled
* Computed entities cannot be created in shared Dataflows
* AutoML and Cognitive services are not available in shared Dataflows
* Incremental refresh does not work in shared Dataflows

## Dataflows in Premium

Dataflows that exist in Premium have the following limitations and considerations.

**Refreshes and data considerations:**

* When refreshing Dataflows, timeouts are 24 hours (no distinction for entities and/or dataflows)

* Changing a dataflow from an incremental refresh policy to a normal refresh, or vice versa, will drop all data

* Modifying a dataflow's schema will drop all data

**Linked and Computed Entities:**

* Linked entities can go down to a depth of 32 references

* Cyclic dependencies of linked entities are not allowed

* A linked entity can't be joined with a regular entity that gets its data from an on-premises data source

* When a query (query *A*, for example) is used in the calculation of another query (query *B*) in dataflows, query *B* becomes a calculated entity. Calculated entities cannot refer to on-premises sources.


**Compute Engine:**

* While using the Compute engine, there is an approximate 10% to 20% initial increase in time for data ingestion.

  1. This only applied to the first dataflow that is on the compute engine, and reads data from the data source
  2. Subsequent dataflows, that use the source one will not incur the same penalty

* Only certain operations make use of the compute engine, and only when used through a linked entity or as a computed entity. A full list of operations is available in [this blog post](http://petcu40.blogspot.com/2019/06/m-folding-in-enhanced-engine-of-power.html).


**Capacity Management:**

* By design, the Premium Power BI Capacities have an internal resource manager which throttles the workloads in different ways when the capacity is running on low memory.

  1. For Dataflows, this throttling pressure reduces the number of available M Containers
  2. The memory for Dataflows can be set to 100%, with an appropriately sized container for your data sizes, and the workload will manage the number of containers appropriately

* The approximate number of containers can be found out by dividing the total memory allocated to the workload by the amount of memory allocated to a container

## Dataflow usage in datasets

* When creating a dataset in Power BI Desktop, and then publishing it to the Power BI service, ensure the credentials used in Power BI Desktop for the Dataflows data source are the same credentials used when the dataset is published to the service.
  1. Failing to ensure those credentials are the same results in a *Key not found* error upon dataset refresh

## Next steps
The following articles provide more information about dataflows and Power BI:

* [Introduction to dataflows and self-service data prep](dataflows-introduction-self-service.md)
* [Creating a dataflow](dataflows-create.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Configuring Dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [AI with dataflows](dataflows-machine-learning-integration.md)
* [Dataflows best practices](dataflows-best-practices.md)