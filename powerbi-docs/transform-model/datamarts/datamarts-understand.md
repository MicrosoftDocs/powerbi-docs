---
title: Understand datamarts (preview)
description: Understand important concepts about datamarts
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 05/24/2022
LocalizationGroup: Data from files
---
# Understand datamarts

This article describes and explains important concepts to understand about datamarts. 

Datamarts provide a semantic layer that is automatically generated and synchronized with the contents of the datamart tables, their structure, and underlying data, all provided in an automatically generated dataset. This automatic generation and synchronization enables you to further describe the domain of data with things like hierarchies, friendly names and descriptions, as well as setting formatting specific to your locale or business requirements. With datamarts you can also create measures and standardized metrics for reporting. Power BI (and other client tools) can create visuals and provide results for such calculations based on the data in context.

The **auto-generated** Power BI dataset created from a datamart eliminates the need for connecting to a separate dataset, setting up refresh schedules, and managing multiple data elements. Instead, you can build your business logic in a datamart and its data will be immediately available in Power BI, enabling the following provides:

* Datamart data access through the Dataset Hub
* Capability to analyze in Excel
* Capability to quickly create reports in the Power BI service
* No need to refresh, synchronize data or understand connection details
* Build solutions on the web without needing Power BI Desktop

During preview, auto-generated dataset connectivity is available using [DirectQuery](../../connect-data/desktop-directquery-about.md) only. The following image shows how datamarts fit into the process continuum starting with connecting to data, all the way through creating reports.

:::image type="content" source="media/datamarts-overview/datamarts-overview-02.png" alt-text="Diagram that shows how datamarts fit into the data connection and analysis continuum.":::

Auto-generated datasets are different from traditional Power BI datasets in the following ways.  

The XMLA endpoint supports read-only operations and users can't edit the dataset directly. 
The auto-generated datasets don't have data source settings and users don't need to enter credentials. Rather, they use automatic Single Sign-On (SSO) for queries. For refresh operations, datasets use the dataset author credentials to connect to the managed datamart’s SQL endpoint.

With Power BI Desktop users can build composite models, enabling you to connect to the datamart’s dataset and do the following:

* Select specific tables to analyze
* Add more data sources

Finally, if you don't want to use the auto-generated dataset directly, you can connect to the datamart’s SQL endpoint. See [create reports using datamarts](datamarts-create-reports.md) for more information.


## Understand incremental refresh and datamarts

You can create and modify incremental data refresh, similar to dataflows and dataset incremental refresh, using the datamart editor. Incremental refresh extends scheduled refresh operations by providing automated partition creation and management for datamart tables that frequently load new and updated data. 

For most datamarts, incremental refresh will involve one or more tables that contain transaction data that changes often and can grow exponentially, such as a fact table in a relational or star database schema. Using an incremental refresh policy to partition the table, and refreshing only the most recent import partitions can significantly reduce the amount of data that must be refreshed.

Incremental refresh and real-time data for datamarts offers the following advantages:
* Fewer refresh cycles for fast-changing data
* Refreshes are faster
* Refreshes are more reliable
* Resource consumption is reduced
* Enables you to create large datamarts
* Easy to configure


## Next steps
This article provided an overview of important datamart concepts to understand. 

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Create reports with datamarts](datamarts-create-reports.md)
* [Access control in datamarts](datamarts-access-control.md)
* [Datamart administration](datamarts-administration.md)

For more information about dataflows and transforming data, see the following articles:
* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)

