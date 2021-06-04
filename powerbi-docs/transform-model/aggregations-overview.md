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


## Making big datasets seem small

DirectQuery enables reporting over big data that may not otherwise be possible with import datasets. However, DirectQuery has an inherent effect, that is for each user interaction with a report, queries must be passed all the way to the data source. The data source must then calculate and return a result. That round trip can be slow.  Data stored in Power BI's powerful in-memory cache, however, provides blazing fast query response performance - enter composite models *and* aggregations.

In 2018, Power BI introduced the composite model. With composite models, a dataset can have both import data and DirectQuery connections. Also introduced with composite models are *aggregations*. With aggregations, data modelers can create tables containing pre-aggregated data that are stored in-memory, just like import tables. Because almost all queries are for an aggregated result of transaction data, those results can instead be returned from aggregations stored in-memory. Aggregations enable interactive analysis over big data in ways that aren't possible otherwise because most report queries require an aggregated result in return.

## Automatic aggregations

Now in Preview, automatic aggregations is supported for Power BI Premium and Premium per user DirectQuery datasets. Automatic aggregations uses a machine learning model to analyze the query patterns from Power BI reporting clients to the big data store and automatically design and build the aggregations in Power BI that deliver optimal performance. The machine learning model runs in the background, continuously tuning the aggregations as usage grows and usage patterns change. Automatic aggregations in Power BI will enable all Power BI Premium customers to benefit from the performance acceleration that Power BI provides, without having to invest in expensive and time-consuming data engineering resources.

To learn more, see [Automatic aggregations](aggregations-auto.md).

## User defined aggregations

Building aggregations in Power BI require a data engineer to analyze telemetry and design an optimized set of tables that enable the most common queries to be handled by Power BI’s blazingly fast in-memory Vertipaq engine and have the less frequent, detailed queries delegated to the big data store.

User defined aggregations you can optimize certain calculations.


To learn more, see [User defined aggregations](aggregations-advanced.md).