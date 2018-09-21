---
title: Use storage mode in Power BI Desktop (preview)
description: Use storage mode to control whether data is cached in-memory for reports in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 09/17/2018
ms.author: davidi

LocalizationGroup: Transform and shape data
---

# Storage mode in Power BI Desktop (preview)

In Microsoft Power BI Desktop, you can specify the *storage mode* of tables, which gives you control over whether table data is cached in-memory for reports. 

![Storage mode in Power BI Desktop](media/desktop-storage-mode/storage-mode_01.png)

Setting the storage mode provides many advantages. You can set storage mode for each table individually in your model. This action enables a single dataset, providing the following benefits:

* **Query performance**: As users interact with visuals in Power BI reports, Data Analysis Expressions (DAX) queries are submitted to the dataset. Caching data into memory by properly setting storage mode can boost the query performance and interactivity of your reports.
* **Large datasets**: Tables that are not cached do not consume memory for caching purposes. You can enable interactive analysis over large datasets that are too big or expensive to completely cache into memory. You can choose which tables are worth caching, and which are not.
* **Data refresh optimization**: Tables that are not cached don't need to be refreshed. You can reduce refresh times by caching only the necessary data to meet your service level agreements and your business requirements.

* **Near-real time requirements**: Tables with near-real time requirements might benefit from not being cached, to reduce data latency.

* **Writeback**: Writeback enables business users to explore what-if scenarios by changing cell values. Custom applications can apply changes to the data source. Tables that aren't cached can reflect changes immediately, allowing instant analysis of the effects.

The storage mode setting in Power BI Desktop is one of three related features:

* **Composite models**: Allows a report to have multiple data connections, including DirectQuery connections or import, in any combination. For more information, see [Composite models in Power BI Desktop (preview)](desktop-composite-models.md).

* **Many-to-many relationships**: With *composite models*, you can establish *many-to-many relationships* between tables, which removes requirements for unique values in tables and removes prior workarounds, such as introducing new tables just to establish relationships. For more information, see [Many-to-many relationships in Power BI Desktop (preview)](desktop-many-to-many-relationships.md).

* **Storage mode**: You can now specify which visuals require a query to back-end data sources, and visuals that don't require a query are imported even if they're based on DirectQuery. This feature helps improve performance and reduce back-end load. Previously, even simple visuals such as slicers initiated queries that were sent to back-end sources. Storage mode is described further in this article.

## Enable the storage mode preview feature

The storage mode feature is in preview, and it must be enabled in Power BI Desktop. To enable storage mode, select **File** > **Options and Settings** > **Options** > **Preview Features**, and then select the **Composite Models** checkbox. 

![The "Preview features" pane](media/desktop-composite-models/composite-models_02.png)

To enable the feature, you need to restart Power BI Desktop.

![The "Feature requires a restart" window](media/desktop-composite-models/composite-models_03.png)


## Use the storage mode property

Storage mode is a property that you can set on each table in your model. To set the storage mode, in the **Fields** pane, right-click the table whose properties you want to set, and then select **Properties**.

![The Properties command in the contextual menu](media/desktop-storage-mode/storage-mode_02.png)

The current property is displayed in the **Storage mode** drop-down list in the table's **Field properties** pane. You can view the current storage mode or modify it there.

![Set storage mode for a table](media/desktop-storage-mode/storage-mode_03.png)

There are three values for storage mode:

* **Import**: When the value is set to **Import**, imported tables are cached. Queries submitted to the Power BI dataset that return data from Import tables can be fulfilled only from cached data.
* **DirectQuery**: With this setting, DirectQuery tables are not cached. Queries submitted to the Power BI dataset (for example, DAX queries) that return data from DirectQuery tables can be fulfilled only by executing on-demand queries to the data source. Queries submitted to the data source use the query language for that data source (for example, SQL).
* **Dual**: Dual tables can act as either cached or not cached, depending on the context of the query submitted to the Power BI dataset. In some cases, queries are fulfilled from cached data; in other cases, queries are fulfilled by executing an on-demand query to the data source.

Changing a table to **Import** is an *irreversible* operation; it cannot be changed back to DirectQuery or back to Dual.

## Constraints on DirectQuery and Dual tables

Dual tables are subject to the same constraints as DirectQuery tables. These constraints include limited M transformations and restricted DAX functions in calculated columns. For more information, see [Implications of using DirectQuery](desktop-directquery-about.md#implications-of-using-directquery).

## Relationship rules on tables with different storage modes

Relationships must comply with rules that are based on the storage mode of the related tables. This section provides examples of valid combinations. For complete information, see [Many-to-many relationships in Power BI Desktop (preview)](desktop-many-to-many-relationships.md).

On a dataset with a single data source, the following *1-to-many* relationship combinations are valid:

| Table on the *many* side | Table on the *1* side |
| ------------- |----------------------| 
| Dual          | Dual                 | 
| Import        | Import or Dual       | 
| DirectQuery   | DirectQuery or Dual  | 

## Propagation of Dual
Consider the following simple model, where all the tables are from a single source that supports Import and DirectQuery.

![Example Relationship view for storage mode](media/desktop-storage-mode/storage-mode_04.png)

Let’s say all tables in this model are DirectQuery to begin with. If we then change the **storage mode** of the *SurveyResponse* table to Import, the following warning window is displayed:

![Storage mode warning window](media/desktop-storage-mode/storage-mode_05.png)

The dimension tables (*Customer*, *Date*, and *Geography*) must be set to **Dual** to comply with the previously described relationship rules. Instead of having to set these tables to **Dual** ahead of time, you can set them in a single operation.

The propagation logic is designed to help with models that contain many tables. Let’s say you have a model with 50 tables and only certain fact (transactional) tables need to be cached. The logic in Power BI Desktop figures out the minimum set of dimension tables that need to be set to **Dual**, so you don’t have to do so.

The propagation logic traverses only to the one side of **1-to-many** relationships.

* Changing the *Customer* table to **Import** (instead of changing *SurveyResponse*) is not allowed because of its relationships to the DirectQuery tables *Sales* and *SurveyResponse*.
* Changing the *Customer* table to **Dual** (instead of changing *SurveyResponse*) is allowed. The propagation logic sets the *Geography* table also to **Dual**.

## Storage mode usage example
Let's continue with the example from the previous section, and imagine applying the following storage mode property settings:

| Table                   | Storage mode         |
| ----------------------- |----------------------| 
| *Sales*                 | DirectQuery          | 
| *SurveyResponse*        | Import               | 
| *Date*                  | Dual                 | 
| *Customer*              | Dual                 | 
| *Geography*             | Dual                 | 


Setting those storage mode properties results in the following behaviors, assuming that the *Sales* table has significant data volume.
* Dimension tables (*Date*, *Customer*, and *Geography*) are cached, so initial report load times should be fast when they retrieve slicer values to display.
* By not caching the *Sales* table, you'll get the following results:
    * Data-refresh times are improved, and memory consumption is reduced.
    * Report queries that are based on the *Sales* table run in DirectQuery mode, which might take longer but are closer to real-time because no caching latency is introduced.

* Report queries that are based on the *SurveyResponse* table are returned from the in-memory cache, and thus should be relatively fast.

## Queries that hit or miss the cache

By connecting **SQL Profiler** to the diagnostics port for Power BI Desktop, you can see which queries hit or miss the in-memory cache by performing a trace that's based on the following events:

* Queries Events\Query Begin
* Query Processing\Vertipaq SE Query Begin
* Query Processing\DirectQuery Begin

For each *Query Begin* event, check other events with the same *ActivityID*. For example, if there is no *DirectQuery Begin* event, but there is a *Vertipaq SE Query Begin* event, the query was answered from the cache.

Queries that refer to **Dual** mode tables return data from the cache, if possible; otherwise, they revert to DirectQuery.

Continuing the previous example, the following query refers only to a column from the *Date* table, which is in **Dual** mode. Therefore, it should hit the cache.

![Script for storage mode diagnostics](media/desktop-storage-mode/storage-mode_06.png)

The following query refers only to a column from the *Sales* table, which is in **DirectQuery** mode. Therefore, it should *not* hit the cache.

![Script for storage mode diagnostics](media/desktop-storage-mode/storage-mode_07.png)

The following query is interesting because it combines both columns. This query will not hit the cache. You might initially expect it to retrieve *CalendarYear* values from the cache and *SalesAmount* values from the source and then combine the results, but this approach would be less efficient than submitting the SUM/GROUP BY operation to the source system. If the operation is pushed down to the source, the number of rows returned will likely be far less. 

![Script for storage mode diagnostics](media/desktop-storage-mode/storage-mode_08.png)

> [!NOTE]
> This behavior is different from [many-to-many relationships in Power BI Desktop (preview)](desktop-many-to-many-relationships.md) when cached and non-cached tables are combined.

## Caches should be kept in sync

The queries displayed in the previous section show that **Dual** tables sometimes hit the cache and sometimes do not hit the cache. Because of this, if the cache is out of date, different values can be returned. Query execution will not attempt to mask data issues by, for example, filtering DirectQuery results to match cached values. It is your responsibility to know your data flows, and you should design accordingly. There are established techniques to handle such cases at the source, if necessary.

The *Dual* storage mode is a performance optimization. It should be used only in ways that do not compromise the ability to meet business requirements. For alternative behavior, consider using the techniques described in the [Many-to-many relationships in Power BI Desktop (preview)](desktop-many-to-many-relationships.md) article.

## Data view
If at least one table in the dataset has its storage mode set to either *Import* or *Dual*, the **Data view** tab is displayed.

![Data view in Power BI Desktop](media/desktop-storage-mode/storage-mode_09.png)

When they are selected in **Data view**, **Dual** and **Import** tables show cached data. DirectQuery tables do not show data, and a message is displayed that states that DirectQuery tables cannot be shown.


## Limitations and considerations

There are a few limitations for this release of *storage mode*, and its correlation with *composite models*.

The following Live Connect (multi-dimensional) sources cannot be used with *composite models*:

* SAP HANA
* SAP Business Warehouse
* SQL Server Analysis Services
* Power BI datasets
* Azure Analysis Services

When you connect to those multi-dimensional sources by using DirectQuery, you also can neither connect to another DirectQuery source nor combine it with imported data.

The existing limitations of using DirectQuery still apply when you use **composite models**. Many of those limitations are now per table, depending upon the storage mode of the table. For example, a calculated column on an imported table can refer to other tables, but a calculated column on a DirectQuery table is still restricted to refer only to columns on the same table. Other limitations apply to the model as a whole, if any of the tables within the model are DirectQuery. For example, the *QuickInsights* and *Q&A* features are not available on a model if any of the tables within it has a storage mode of DirectQuery. 

## Next steps

For more information about composite models and DirectQuery, see the following articles:
* [Composite models in Power BI Desktop (preview)](desktop-composite-models.md)
* [Many-to-many relationships in Power BI Desktop (preview)](desktop-many-to-many-relationships.md)
* [Using DirectQuery in Power BI](desktop-directquery-about.md)
* [Data sources supported by DirectQuery in Power BI](desktop-directquery-data-sources.md)

