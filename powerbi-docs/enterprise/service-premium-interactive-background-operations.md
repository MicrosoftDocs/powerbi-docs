---
title: Interactive and background operations in Power BI
description: Learn about interactive and background operations in Power BI 
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 03/30/2022
LocalizationGroup: Premium
---
# Interactive and background operations

Power BI divides operations into two types, *interactive* and *background*. This article lists these operations and explains the difference between them

## Interactive operations

Shorter running operations such as dataset queries are classified as *interactive* operations. They’re usually triggered by user interactions with the UI. For example, an interactive operation is triggered when a user opens a report or clicks on a slicer in a Power BI report. Interactive operations can also be triggered without interacting with the UI, for example when using SQL Server Management Studio (SSMS) or a custom application to run a DAX query.

## Background operations

Longer running operations such as dataset or dataflow refreshes are classified as *background* operations. They can be triggered manually by a user, or automatically without user interaction. Background operations include scheduled refreshes, interactive refreshes, REST-based refreshes and XMLA-based refresh operations. Users are not expected to wait for these operations to finish. Instead, they might come back later to check the status of the operations.

## Operation list

The table below lists the Power BI operations. It provides a short description for each operation and identifies the operation's type.

| Operation            | Description  | Workload  | Type |
|----------------------|--------------|-----------|------|
| Background query     | Queries for refreshing tiles and creating report snapshots             | Datasets | Background  |
| [Dataflow DirectQuery](../transform-model/dataflows/dataflows-directquery.md) | Connect directly to a dataflow without the need to import the data into a dataset | Dataflows | Interactive |
| [Dataflow refresh](../transform-model/dataflows/dataflows-understand-optimize-refresh.md) | An on demand or scheduled background dataflow refresh, performed by the service or with REST APIs | Dataflows | Background |
| Dataset on-demand refresh | A background dataset refresh initiated by the user, using the service, REST APIs or public XMLA endpoints | Datasets | Background |
| Dataset Scheduled Refresh | A scheduled background dataset refresh, performed by the service, REST APIs or public XMLA endpoints | Datasets | Background |
| Interactive query    | User queries for loading models, opening, and interacting with reports | Datasets | Interactive |
| Paginated report | A Power BI paginated report exported with the [Export report to file](../developer/embedded/export-paginated-report) REST API | Paginated report | Background |
| Report | A Power BI report exported with the [Export paginated report to file](../developer/embedded/export-to) REST API |         | Background |
| XMLA read | XMLA read operations initiated by the user, for queries and discoveries  | Datasets | Interactive |
| XMLA write | A background XMLA write operation that changes the model | Datasets | Background    |
|Row4     |         |         |    |

## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [Power BI Premium Gen2 architecture](service-premium-architecture.md)

> [!div class="nextstepaction"]
> [Managing Premium Gen2 capacities](service-premium-capacity-manage-gen2.md)

> [!div class="nextstepaction"]
> [Use the gen2 metrics app](service-premium-gen2-metrics-app.md)
