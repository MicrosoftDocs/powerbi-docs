---
title: Understand datamarts (preview)
description:  Learn about best practices and concepts for datamarts, like incremental refresh and proactive caching.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: concept-article
ms.date: 10/07/2024
LocalizationGroup: Data from files
#customer intent: As a Power BI user I want to learn about best practices and concepts for datamarts in Power BI.
---

# Understand datamarts

This article describes and explains important concepts about datamarts.

## Understand semantic model (default)

Datamarts provide a semantic layer that is automatically generated and synchronized with the contents of the datamart tables, their structure, and underlying data. This layer is provided in an automatically generated semantic model. This automatic generation and synchronization enables you to further describe the domain of data with things like hierarchies, friendly names, and descriptions. You can also set formatting specific to your locale or business requirements. With datamarts, you can create measures and standardized metrics for reporting. Power BI (and other client tools) can create visuals and provide results for such calculations based on the data in context.

The **default** Power BI semantic model created from a datamart eliminates the need to connect to a separate semantic model, set up refresh schedules, and manage multiple data elements. Instead, you can build your business logic in a datamart and its data is immediately available in Power BI, enabling the following:

* Datamart data access through the Semantic model Hub.
* Capability to analyze in Excel.
* Capability to quickly create reports in the Power BI service.
* No need to refresh, synchronize data, or understand connection details.
* Build solutions on the web without needing Power BI Desktop.

During preview, default semantic model connectivity is available using [DirectQuery](../../connect-data/desktop-directquery-about.md) only. The following image shows how datamarts fit into the process continuum starting with connecting to data, all the way through creating reports.

:::image type="content" source="media/datamarts-overview/datamarts-overview-02.png" alt-text="Diagram that shows how datamarts fit into the data connection and analysis continuum.":::

Default semantic models are different from traditional Power BI semantic models in the following ways:

* The XMLA endpoint supports read-only operations and users can't edit the semantic model directly. With XMLA read-only permission you can query the data in a query window.
* The default semantic models don't have data source settings and users don't need to enter credentials. Rather, they use automatic single sign-on (SSO) for queries.
* For refresh operations, semantic models use the semantic model author credentials to connect to the managed datamart’s SQL endpoint.

With Power BI Desktop users can build composite models, enabling you to connect to the datamart’s semantic model and do the following:

* Select specific tables to analyze.
* Add more data sources.

Finally, if you don't want to use the default semantic model directly, you can connect to the datamart’s SQL endpoint. For more information, see [Create reports using datamarts](datamarts-create-reports.md).

### Understand what's in the default semantic model

Currently, tables in the datamart are automatically added to the default semantic model. Users can also manually select tables
or views from the datamart they want included in the model for more flexibility. Objects that are in the default semantic model
are created as a layout in the model view.

The background sync that includes objects (tables and views) waits for the downstream semantic model to not be in use to
update the semantic model, honoring bounded staleness. Users can always go and manually pick tables they want or not want in
the semantic model.

## Understand incremental refresh and datamarts

You can create and modify incremental data refresh, similar to dataflows and semantic model incremental refresh, using the datamart editor. Incremental refresh extends scheduled refresh operations by providing automated partition creation and management for datamart tables that frequently load new and updated data.

For most datamarts, incremental refresh involves one or more tables that contain transaction data that changes often and can grow exponentially, such as a fact table in a relational or star database schema. If you use an incremental refresh policy to partition the table, and refresh only the most recent import partitions, you can significantly reduce the amount of data that must be refreshed.

Incremental refresh and real-time data for datamarts offers the following advantages:

* Fewer refresh cycles for fast-changing data
* Refreshes are faster
* Refreshes are more reliable
* Resource consumption is reduced
* Enables you to create large datamarts
* Easy to configure

## Understand proactive caching

Proactive caching enables automatic import of the underlying data for the default semantic model so you don't need to manage or orchestrate the storage mode. Import mode for the default semantic model provides performance acceleration for the datamart's semantic model by using the fast Vertipaq engine. When you use proactive caching, Power BI changes the storage mode of your model to import, which uses the in-memory engine in Power BI and Analysis Services.

Proactive caching works in the following way: after each refresh, the storage mode for the default semantic model is changed to DirectQuery. Proactive caching builds a side-by-side import model asynchronously and is managed by the datamart, and doesn't affect availability or performance of the datamart. Queries coming in after the default semantic model is complete will use the import model.

Auto-generation of the import model occurs within approximately 10 minutes after no changes are detected in the datamart. The import semantic model changes in the following ways:

* Refreshes
* New data sources
* Schema changes:
  * New data sources
  * Updates to data preparation steps in Power Query Online
* Any modeling updates, such as:
  * Measures
  * Hierarchies
  * Descriptions

### Best practices for proactive caching

Use *Deployment Pipelines* for changes to ensure the best performance, and to ensure users are using the import model. Using *Deployment Pipelines* is already a best practice for building datamarts, but doing so ensures you take advantage of the proactive caching more often.

### Considerations and limitations for proactive caching

* Power BI currently caps the duration of caching operations to 10 minutes.
* Constraints of uniqueness/non-null for particular columns will be enforced in the Import model and cache building fails if the data doesn't conform.

## Related content

This article provided an overview of important datamart concepts to understand.

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Create reports using datamarts](datamarts-create-reports.md)
* [Control access to datamarts](datamarts-access-control.md)
* [Administration of datamarts](datamarts-administration.md)

For more information about dataflows and transforming data, see the following articles:

* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)
