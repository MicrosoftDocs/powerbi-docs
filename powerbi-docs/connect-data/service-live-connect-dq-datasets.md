---
title: What's the difference between live connections and DirectQuery?
description: See a comparison between live connections and DirectQuery
author: davidiseminger
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 12/12/2022
---

# Live connection and DirectQuery comparison

[Live connection](desktop-report-lifecycle-datasets.md#using-a-power-bi-service-live-connection-for-report-lifecycle-management) is a way of connecting a Power BI report to a published Power BI dataset. [DirectQuery](refresh-data.md#datasets-in-directquery-mode) is a method you can use to connect your dataset to data. This article describes the main differences between these concepts.

## Live connection

*Live connection* is a method that lets you build a report in Power BI Desktop without having to build a dataset for it. When you create your report in Power BI Desktop, you can connect it to a dataset that already exists. A *live connection* allows you to rely on existing data, which can be updated without accessing the report. 

Using *live connection* you can connect your report to one of the following data sources:

* A dataset that already exists in Power BI service

* An Azure Analysis Services (AAS) database  

* An on-premises instance of SQL Server Analysis Services (SSAS)

## DirectQuery

A Power BI dataset can have data copied into it during a refresh operation, in what's called [import mode](service-dataset-modes-understand.md#import-mode). Or, the dataset can dynamically request data from a data source it's connected to using a method called [DirectQuery](service-dataset-modes-understand.md#directquery-mode).

When using *DirectQuery*, your report uses Data Analysis Expression (DAX) queries to get data. After the dataset receives the report's DAX query, it generates another set of queries that are run on your data source, to get the required data. If for example your data source is an SQL Server database, Power BI will generate SQL queries to get the data it needs. Other data sources may generate queries in other query languages.

*DirectQuery* is useful when:

* You're working against data sources with a large volume of data

* You want to use 'near real-time' data

You can also use *DirectQuery* with Analysis Services, as described in [Using DirectQuery for Power BI datasets and Analysis Services](desktop-directquery-datasets-azure-analysis-services.md).

## Next steps

>[!div class="nextstepaction"]
>[Dataset modes in the Power BI service](service-dataset-modes-understand.md)

>[!div class="nextstepaction"]
>[Connect to datasets in the Power BI service from Power BI Desktop](desktop-report-lifecycle-datasets.md)
