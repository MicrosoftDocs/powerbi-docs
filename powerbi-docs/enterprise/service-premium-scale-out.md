---
title: Power BI Premium Scale-out
description: Learn how Power BI Premium Scale-out improves your Power BI performance by reducing dataset query and refresh times
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 09/15/2022
LocalizationGroup: Premium
---


# Power BI Premium Scale-out

Power BI Premium Scale-out helps Power BI deliver fast performances while your reports and dashboards are consumed by a large audience. Scale-out uses your Premium capacity to host dataset copies. The copies make query response times shorter, and boost the performance of your reports and dashboards.

When Power BI creates the dataset copies, it separates read only datasets from read/write datasets. The read datasets serve the Power BI report and dashboard consumption, and the read/write dataset is used when write operations and refreshes are required. During write operations and refreshes, the read datasets continue to serve your reports and dashboards without being disturbed. When needed, the read and read/write datasets are synced so that the read datasets are kept up-to-date. Using this method, Power BI Premium Scale-out reduces the impact of write operations and dataset refreshes on your capacity.

## Supported capacities

Power BI Premium Scale-out supports the following capacities:

* P SKUs
* PPU
* A SKUs for Power BI Embedded - Enable using Power scripts or APIs

## Disable Power BI Premium Scale-Out

Power BI Premium Scale-Out is enabled by default. To disable this feature...

## Connecting to a specific dataset

Power BI Desktop and Power BI service connect to different dataset types by default. When you're connecting to a dataset with Power BI Desktop, you'll be connected to the *read* dataset. However, if you're viewing a dataset in Power BI Premium, you'll see the *read/write* dataset. The table below lists the default dataset types used by Power BI Desktop and Power BI service.

|Dataset type  |Power BI Desktop                                |Power BI service                                |
|--------------|------------------------------------------------|------------------------------------------------|
|**Read**      |![Applies to.](../includes/media/yes.png)       |![Does not apply to.](../includes/media/no.png) |
|**Red/write** |![Does not apply to.](../includes/media/no.png) |![Applies to.](../includes/media/yes.png)       |

To connect to a different type of dataset, you can append one of the following strings to the dataset's URL.

* **Read** - `?readonly`
* **Read/write** - `?readwrite`

## REST APIs

???

## Next steps

> [!div class="nextstepaction"]
> [Using Autoscale with Power BI Premium](service-premium-auto-scale.md)
