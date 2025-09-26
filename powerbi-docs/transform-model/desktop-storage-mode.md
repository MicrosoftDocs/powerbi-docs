---
title: Table storage mode in Power BI semantic models
description: Learn about table storage mode to control whether or not data is cached in-memory for reports in Power BI semantic models.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 01/08/2024
LocalizationGroup: Transform and shape data
---

# Table storage mode in Power BI semantic models

Tables in Power BI semantic models have different storage modes depending on the data source. The storage mode lets you control whether or not Power BI stores the table data in-memory for reports or retrieves the data from the data source when visuals load. 

| **Table storage mode**     | **When available**     | **Benefits** |
| ---------------------------|------------------------|--------------|
| Import    | Available in Power BI Desktop and Power BI web modeling using **Get data** (using Power Query) from almost all data sources.    | Stores a snapshot of the data in a native storage for quick loading visuals in reports. Refresh the semantic model or table to get the latest data from the data source.    | 
| Direct Lake on OneLake     | Available in Power BI Desktop and Power BI web modeling using **OneLake catalog** for Fabric data sources.    | Data is scanned from OneLake delta tables for quick loading visuals in reports. By default, latest data is loaded. Turn off auto-sync in the scheduled refresh settings page to access the latest data on refresh instead. Refresh is also called reframing for Direct Lake. Learn more about Direct Lake at [aka.ms/DirectLake](https://aka.ms/DirectLake).     |
| Direct Lake on SQL    | Available from **new semantic model** button in the SQL analytic endpoints of Fabric items.     | Data is scanned from OneLake delta tables for quick loading in reports. If a view is used, SQL granular access enabled, or a Direct Lake guardrail reached, then data is accessed using DirectQuery storage mode. |
| DirectQuery    | Available in Power BI Desktop using the **Get data** (using Power Query) for some data sources, such as SQL databases.     | Data is queried from the data source when visuals load and not stored in the semantic model. The query is a translation from the Power BI DAX query used in visuals to the native query language of the data source, such as a SQL query. |
| DirectQuery on Power BI semantic models    | Available in Power BI Desktop when connecting to a Power BI semantic model then selecting **make changes to this model** or when an import or DirectQuery table is already added.     | DAX queries from the new model run on the source model and can use measures from both. Some column properties on the remote model can be overridden in the new model. This customization includes format strings and display names. Use this storage mode when you need to make a small change to an existing semantic model for a specific report task.    |
| Dual    | Available in Power BI Desktop when converting a DirectQuery table to import. A dialog shows with options to then convert the remaining DirectQuery tables to dual.     | The relationships between DirectQuery and import tables are limited and dual can help keep them as regular relationships. |
| Hybrid    | Available for incremental refresh scenarios on an import table. The latest partition of the table can be in DirectQuery to ensure the latest data is available between import refreshes.     | Learn more about incremental refresh in the [incremental refresh overview](/power-bi/connect-data/incremental-refresh-overview).

> [!Note]
> **Live connect** is when you connect to a Power BI semantic model in Power BI Desktop to create a report or create a report from Power BI semantic model in the web. There is no local semantic model for this report. This is sometimes called a **thin report**. The remote Power BI semantic model may be using any of the table storage modes. The report author can see the model in model view but only limited information is available. Measures created are stored in the report.

**Composite semantic model** is a semantic model with table in more than one storage mode. For more information, see [Use composite models in Power BI Desktop](desktop-composite-models.md).


## Seeing the storage mode of a table

The **Storage mode** property is a property on each table. 

1. In **Model** view, select the table.
2. In the **Properties** pane, expand the **Advanced** section, and expand the **Storage mode** drop-down.

    :::image type="content" source="media/desktop-storage-mode/storage-mode-02.png" alt-text="Screenshot of Relationship view highlight the option drop-down to change the storage mode.":::

For most tables, storage mode is set when you add the table only. The storage mode can only be changed if the table is in DirectQuery storage mode when created. You can change a DirectQuery table to import or dual. After this property is set, it can't be put back to DirectQuery. Power BI web modeling and live editing in Power BI Desktop do have version control, which can be used to reverse a changed storage mode.

> [!NOTE]
> Direct Lake on OneLake tables can be converted to import using semantic link labs in Fabric notebooks.

## Constraints on DirectQuery and Dual tables

Dual tables have the same functional constraints as DirectQuery tables. These constraints include limited M transformations and restricted DAX functions in calculated columns. For more information, see [DirectQuery limitations](../connect-data/desktop-directquery-about.md#implications-of-using-directquery).

## Propagation of the Dual setting

Consider the following model, where all the tables are from a single source that supports Import and DirectQuery.

:::image type="content" source="media/desktop-storage-mode/storage-mode-04.png" alt-text="Screenshot of the example Relationship view for storage mode.":::

Let’s say all tables in this model are initially set to **DirectQuery**. If you then change the **Storage mode** of the **SurveyResponse** table to **Import**, the following warning window is displayed:

:::image type="content" source="media/desktop-storage-mode/storage-mode-05.png" alt-text="Screenshot showing a warning window that describes the results of changing the storage mode to Import.":::

You can set the dimension tables (**Customer**, **Geography**, and **Date**) to **Dual** to reduce the number of limited relationships in the semantic model, and improve performance. Limited relationships normally involve at least one DirectQuery table where join logic can't be pushed to the source systems. Because Dual tables can act as either DirectQuery or Import tables, this situation is avoided.

The propagation logic is designed to help with models that contain many tables. Suppose you have a model with 50 tables and only certain fact (transactional) tables need to be cached. The logic in Power BI Desktop calculates the minimum set of dimension tables that must be set to **Dual**, so you don’t have to.

The propagation logic traverses only to the one side of one-to-many relationships.

## Storage mode usage example

Imagine applying the following storage mode property settings:

| Table                   | Storage mode         |
| ----------------------- |----------------------|
| Sales                 | DirectQuery          |
| SurveyResponse        | Import               |
| Date                  | Dual                 |
| Customer              | Dual                 |
| Geography             | Dual                 |

Setting these storage mode properties results in the following behaviors, assuming that the **Sales** table has significant data volume:

* Power BI Desktop caches dimension tables, **Date**, **Customer**, and **Geography**, so load times of initial reports are fast when they retrieve slicer values to display.
* Power BI Desktop doesn't cache the **Sales** table. Power BI Desktop provides the following results by not caching this table:
  * Data-refresh times are improved, and memory consumption is reduced.
  * Report queries that are based on the **Sales** table run in **DirectQuery** mode. These queries might take longer but are closer to real time, because no caching latency is introduced.

* Report queries that are based on the **SurveyResponse** table are returned from the in-memory cache, and are therefore relatively fast.

## Queries that hit or miss the cache

If you connect SQL Profiler to the diagnostics port for Power BI Desktop, you can see which queries hit or miss the in-memory cache by performing a trace that's based on the following events:

* Queries Events\Query Begin
* Query Processing\Vertipaq SE Query Begin
* Query Processing\DirectQuery Begin

For each *Query Begin* event, check other events with the same *ActivityID*. For example, if there isn't a *DirectQuery Begin* event, but there's a *Vertipaq SE Query Begin* event, the query is answered from the cache.

Queries that refer to Dual tables return data from the cache, if possible; otherwise, they revert to DirectQuery.

The following query continues from the previous table. It refers only to a column from the **Date** table, which is in **Dual** mode. Therefore, the query should hit the cache:

:::image type="content" source="media/desktop-storage-mode/storage-mode-06.png" alt-text="Screenshot showing the text of query that refers to the Date table.":::

The following query refers only to a column from the **Sales** table, which is in **DirectQuery** mode. Therefore, it *shouldn't* hit the cache:

:::image type="content" source="media/desktop-storage-mode/storage-mode-07.png" alt-text="Screenshot showing the text of query that refers the Sales table.":::

The following query is interesting because it combines both columns. This query doesn't hit the cache. You might initially expect it to retrieve **CalendarYear** values from the cache and **SalesAmount** values from the source and then combine the results, but this approach is less efficient than submitting the SUM/GROUP BY operation to the source system. If the operation is pushed down to the source, the number of rows returned will likely be far less:

:::image type="content" source="media/desktop-storage-mode/storage-mode-08.png" alt-text="Screenshot showing the text of query that refers to both the Date table and the Sales table.":::

> [!NOTE]
> This behavior is different from [many-to-many relationships](desktop-many-to-many-relationships.md) in Power BI Desktop when cached and non-cached tables are combined.

## Caches should be kept in sync

The queries displayed in the previous section show that Dual tables sometimes hit the cache and sometimes don't. As a result, if the cache is out of date, different values can be returned. Query execution won't attempt to mask data issues by, for example, filtering DirectQuery results to match cached values. It's your responsibility to know your data flows, and you should design accordingly. There are established techniques to handle such cases at the source, if necessary.

The **Dual** storage mode is a performance optimization. It should be used only in ways that don't compromise the ability to meet business requirements. For alternative behavior, consider using the techniques described in the [Many-to-many relationships in Power BI Desktop](desktop-many-to-many-relationships.md).

## Table view

If at least one table in the semantic model has its storage mode set to either **Import** or **Dual**, the **Table** view tab is displayable.

:::image type="content" source="media/desktop-storage-mode/storage-mode-03.png" alt-text="Screenshot highlighting the Table view icon.":::

When you select Dual and Import tables in **Table** view, they show cached data. DirectQuery tables don't show data, and a message is displayed that states that DirectQuery tables can't be shown.

## Considerations and limitations

There are a few limitations for the current release of storage mode and its correlation with composite models.

The following live connection (multi-dimensional) sources can't be used with composite models:

* SAP HANA
* SAP Business Warehouse

When you connect to those multi-dimensional sources using DirectQuery, you can't connect to another DirectQuery source or combine it with imported data.

The existing limitations of using DirectQuery still apply when you use composite models. Many of those limitations are now per table, depending upon the storage mode of the table. For example, a calculated column on an imported table can refer to other tables, but a calculated column on a DirectQuery table is still restricted to refer only to columns on the same table. Other limitations apply to the model as a whole, if any of the tables within the model are DirectQuery.

## Related content

For more information about composite models and DirectQuery, see the following articles:

* [Use composite models in Power BI Desktop](desktop-composite-models.md)
* [Apply many-to-many relationships in Power BI Desktop](desktop-many-to-many-relationships.md)
* [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)
* [Power BI data sources](../connect-data/power-bi-data-sources.md)
