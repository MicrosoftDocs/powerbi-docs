---
title: Aggregations 
description: This article describes using aggregations to optimize query performance over big data.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 04/30/2021
LocalizationGroup: Transform and shape data
---
# Aggregations


*Aggregations* in Power BI let you reduce table sizes so you can focus on important data and improve query performance. Aggregations enable interactive analysis over big data in ways that aren't possible otherwise, and can dramatically reduce the cost of unlocking large datasets for decision making.

Automatic aggregations is supported for Power BI Premium and Premium per user DirectQuery datasets.

Building aggregations in Power BI require a data engineer to analyze telemetry and design an optimized set of tables that enable the most common queries to be handled by Power BI’s blazingly fast in-memory Vertipaq engine and have the less frequent, detailed queries delegated to the big data store.

Automatic aggregations uses a machine learning model to analyze the query patterns from Power BI to the big data store and automatically design and build the aggregations in Power BI that deliver optimal performance. The machine learning model runs in the background, continuously tuning the aggregations as usage grows and usage patterns change. Automatic aggregations in Power BI will enable all Power BI Premium customers to benefit from the performance acceleration that Power BI provides, without having to invest in expensive and time-consuming data engineering resources.

Learn more by watching the on-demand Microsoft Build session, Power BI for BI Pros and Data Engineers.



Some advantages of using aggregations include:

- **Better query performance over big data**. Every interaction with Power BI visuals submits DAX queries to the dataset. Cached aggregated data uses a fraction of the resources required for detail data, so you can unlock big data that would otherwise be inaccessible.
- **Optimized data refresh**. Smaller cache sizes reduce refresh times, so data gets to users faster.
- **Balanced architectures**. The Power BI in-memory cache can handle aggregated queries, limiting queries sent in DirectQuery mode and helping you meet concurrency limits. The remaining detail-level queries tend to be filtered, transactional-level queries, which data warehouses and big-data systems normally handle well.




[Performance analyzer](../create-reports/desktop-performance-analyzer.md) in Power BI Desktop







## Advanced aggregations

