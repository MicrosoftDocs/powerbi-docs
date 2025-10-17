---
title: Table Storage Mode in Power BI Semantic Models
description: Become familiar with Power BI table storage modes. Find out how to control whether data is cached in memory for reports in Power BI semantic models.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 10/17/2025
LocalizationGroup: Transform and shape data
# customer intent: As a Power BI user, I want to become familiar with table storage modes so that I can control whether data is cached in memory for reports.
---

# Table storage mode in Power BI semantic models

In Power BI semantic models, the storage mode of a table depends on its data source. You can use the storage mode to control whether Power BI stores the table data in memory for reports or retrieves the data from the data source when visuals load.

This article introduces you to the various table storage modes and describes how they affect report behavior.

## Storage modes

| Table storage mode     | When available     | Benefits | Note |
| ---------------------------|------------------------|--------------|---|
| Import    | In Power BI Desktop and Power BI web modeling, for almost all data sources, when you select **Get data** and use Power Query. | A snapshot of the data is stored in native storage for the quick loading of visuals in reports. | To get the latest data from the data source, refresh the semantic model or table. |
| Direct Lake on OneLake     | In Power BI Desktop and Power BI web modeling, for Microsoft Fabric data sources, when you select **OneLake catalog**. | Data is scanned from Microsoft OneLake delta tables for the quick loading of visuals in reports. | By default, the latest data is loaded. To access the latest data by refreshing it manually, turn off automatic sync in the scheduled refresh settings page. A refresh is also called a *reframing* for Direct Lake. For more information about Direct Lake, see [Direct Lake overview](https://aka.ms/DirectLake).|
| Direct Lake on SQL    | In the SQL analytic endpoints of Fabric items, when you select **New semantic model**. | Data is scanned from OneLake delta tables for quick loading in reports. | In this mode, Power BI uses DirectQuery storage mode to access data in the following cases:<br>- A view is used.<br>- SQL granular access is enabled.<br>- A Direct Lake guardrail is reached. |
| DirectQuery    | In Power BI Desktop, for some data sources such as SQL databases, when you select **Get data** and use Power Query. | Data is queried from the data source when visuals load and isn't stored in the semantic model. | The query is a translation from the Power BI Data Analysis Expressions (DAX) query, which visuals use, into the native query language of the data source, such as a SQL query. |
| DirectQuery on Power BI semantic models    | In Power BI Desktop, when you connect to a Power BI semantic model and then select **Make changes to this model**, or when an Import or DirectQuery table is already added. | DAX queries from the new model run on the source model and can use measures from both. Some column properties on the remote model can be overridden in the new model. This customization includes format strings and display names. | Use this storage mode when you need to make a small change to an existing semantic model for a specific report. |
| Dual    | In Power BI Desktop, when you convert a DirectQuery table to Import mode. A dialog appears with options for converting the remaining DirectQuery tables to Dual mode. | The relationships between DirectQuery and Import tables are limited. Switching from DirectQuery to Dual mode can help keep those relationships regular. | |
| Hybrid    | In incremental refresh scenarios on an Import table. The latest partition of the table can be in DirectQuery mode to help ensure the latest data is available between Import refreshes. | Partition creation and management are automated to reduce the amount of data that needs to be refreshed. | For more information, see [Configure incremental refresh and real-time data for Power BI semantic models](../connect-data/incremental-refresh-overview.md). |

> [!Note]
> *Live connect* mode is used in the following cases:
>
> * To connect to a Power BI semantic model in Power BI Desktop to create a report
> * To create a report from a Power BI semantic model in the web
>
> A Live connect report has no local semantic model and is sometimes called a *thin report*. The remote Power BI semantic model can use any table storage mode. As the report author, you can see the model in **Model** view, but only limited information is available. Measures that you create are stored in the report.

A *composite semantic model* is a semantic model with tables in more than one storage mode. For more information, see [Use composite models in Power BI Desktop](desktop-composite-models.md).

## See the storage mode of a table

Each table has a `Storage mode` property. To see the storage mode of a table, take the following steps:

1. In **Model** view, select the table.
1. In the **Properties** pane, expand the **Advanced** section, and then expand the **Storage mode** list.

   :::image type="content" source="media/desktop-storage-mode/see-storage-mode.png" alt-text="Screenshot of the Model view in Power BI Desktop. One table is highlighted. Under Properties, the Storage mode list is expanded and highlighted." lightbox="media/desktop-storage-mode/see-storage-mode.png":::

For most tables, you can set the storage mode only when you add the table. You can change the storage mode only if the table is in DirectQuery mode or Direct Lake on OneLake mode when created:

* You can change a DirectQuery table to an Import or Dual table. After you set this property, you can't set the mode back to DirectQuery. Exceptions are Power BI web modeling and live editing in Power BI Desktop. These environments both have version control, which you can use to reverse a changed storage mode.
* You can convert Direct Lake on OneLake tables to Import tables by using semantic link labs in Fabric notebooks.

## Constraints on DirectQuery and Dual tables

Dual tables have the same functional constraints as DirectQuery tables. These constraints include limited M transformations and restricted DAX functions in calculated columns. For more information, see [DirectQuery limitations](../connect-data/desktop-directquery-about.md#implications-of-using-directquery).

## Propagation of the Dual setting

Consider the following model. All the tables are from a single source that supports Import and DirectQuery modes.

:::image type="content" source="media/desktop-storage-mode/model-view-table-relationships.png" alt-text="Screenshot of a Power BI Desktop Model view that shows the relationships between five tables: Date, Sales, SurveyResponse, Customer, and Geography.":::

Suppose all tables in this model are initially set to **DirectQuery**. If you change the storage mode of the **SurveyResponse** table to **Import**, the following warning window is displayed:

:::image type="content" source="media/desktop-storage-mode/limited-relationship-warning.png" alt-text="Screenshot of a window that describes the effect of changing the storage mode to Import, with an option for setting dimension tables to Dual mode.":::

You can set the dimension tables, **Customer**, **Geography**, and **Date**, to Dual mode to reduce the number of limited relationships in the semantic model, and help improve performance. Limited relationships normally involve at least one DirectQuery table where `JOIN` logic can't be pushed to the source systems. Because Dual tables can act as either DirectQuery or Import tables, this situation is avoided.

The propagation logic is designed to help with models that contain many tables. Suppose you have a model with 50 tables and only certain fact (transactional) tables need to be cached. The logic in Power BI Desktop calculates the minimum set of dimension tables that must be set to Dual mode, so you don't have to.

The propagation logic traverses only to the *one* side of one-to-many relationships.

## Storage mode usage example

Consider an example that involves the following tables and storage modes:

| Table                   | Storage mode         |
| ----------------------- |----------------------|
| Sales                 | DirectQuery          |
| SurveyResponse        | Import               |
| Date                  | Dual                 |
| Customer              | Dual                 |
| Geography             | Dual                 |

The use of these storage modes results in the following behavior, assuming that the **Sales** table has significant data volume:

* Power BI Desktop caches the dimension tables, **Date**, **Customer**, and **Geography**, to help reduce the load times of initial reports when they retrieve slicer values to display.

* Power BI Desktop doesn't cache the **Sales** table.
  * Not caching this table helps to improve data-refresh times and to reduce memory consumption.
  * Report queries that are based on the **Sales** table run in DirectQuery mode. These queries can take longer than Import queries. But the results of DirectQuery queries are closer to real-time results, because no caching latency is introduced.

* Report queries that are based on the **SurveyResponse** table are relatively fast, because they're returned from the in-memory cache.

## Queries that hit or miss the cache

You can use SQL Server Profiler to see which queries hit or miss the in-memory cache. If you connect this tool to the diagnostics port for Power BI Desktop, you can perform a trace that's based on the following events:

* *Queries Events\Query Begin*
* *Query Processing\Vertipaq SE Query Begin*
* *Query Processing\DirectQuery Begin*

For each *Query Begin* event, check other events with the same `ActivityID` value. For example, if there isn't a *DirectQuery Begin* event, but there's a *Vertipaq SE Query Begin* event, the query is answered from the cache.

Queries that refer to Dual tables return data from the cache, if possible. Otherwise, they revert to DirectQuery mode.

Consider a few DAX queries that refer to the tables in the previous section. For instance, the following query refers only to a column from the **Date** table, which is in Dual mode. Therefore, the query should hit the cache:

:::image type="content" source="media/desktop-storage-mode/dual-table-query.png" alt-text="Screenshot that shows the text of a query that refers to the Date table.":::

The following query refers only to a column from the **Sales** table, which is in DirectQuery mode. Therefore, it *shouldn't* hit the cache:

:::image type="content" source="media/desktop-storage-mode/directquery-table-query.png" alt-text="Screenshot that shows the text of a query that refers to the Sales table.":::

The following query is interesting because it combines both columns. This query doesn't hit the cache. You might initially expect it to retrieve **CalendarYear** values from the cache and **SalesAmount** values from the source and then combine the results. But this approach is less efficient than submitting a `SUM` or `GROUP BY` operation to the source system. If the source performs the operation, only the sum of the sales for each year is returned. That result likely contains far fewer rows than if all **SalesAmount** values are returned.

:::image type="content" source="media/desktop-storage-mode/combination-query.png" alt-text="Screenshot that shows the text of a query that refers to both the Date table and the Sales table.":::

> [!NOTE]
> This behavior is different from [many-to-many relationships](desktop-many-to-many-relationships.md) in Power BI Desktop when cached tables are combined with tables that aren't cached.

## Keep caches in sync

The queries in the previous section show that Dual tables sometimes hit the cache and sometimes don't. As a result, the values that are returned from an out-of-date cache can differ from values returned from the source. Query execution doesn't attempt to mask data issues by, for example, filtering DirectQuery results to match cached values. It's your responsibility to know your data flows, and you should design accordingly. There are established techniques to handle such cases at the source, if necessary.

The Dual storage mode is a performance optimization. You should use it only in ways that don't compromise the ability to meet business requirements. For alternative behavior, consider using the techniques described in [Understand many-to-many relationships in Power BI Desktop](desktop-many-to-many-relationships.md).

## Table view

If at least one table in the semantic model has a storage mode of either Import or Dual, the Power BI **Table** view tab is available.

:::image type="content" source="media/desktop-storage-mode/table-view-table-data.png" alt-text="Screenshot of Table view in Power BI Desktop. The Table view icon is highlighted, and multiple rows of data are visible in a table.":::

When you select a Dual or Import table in **Table** view, its cached data is displayed. No data is displayed for DirectQuery tables. Instead, a message appears that states that DirectQuery tables can't be shown.

## Considerations and limitations

A few limitations currently exist for table storage modes and the use of certain modes in composite models:

The following live connection (multi-dimensional) sources can't be used with composite models:

* SAP HANA
* SAP Business Warehouse

When you connect to those multi-dimensional sources by using DirectQuery mode, you can't connect to another DirectQuery source or combine it with imported data.

The limitations of using DirectQuery mode still apply when you use composite models. Many of those limitations apply at the table level and depend on the storage mode of the table. For example, a calculated column on an imported table can refer to other tables, but a calculated column on a DirectQuery table can refer only to columns on the same table. Other limitations apply to the model as a whole, if any of the tables within the model are in DirectQuery mode.

## Related content

For more information about composite models and DirectQuery mode, see the following articles:

* [Use composite models in Power BI Desktop](desktop-composite-models.md)
* [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)
* [Power BI data sources](../connect-data/power-bi-data-sources.md)
