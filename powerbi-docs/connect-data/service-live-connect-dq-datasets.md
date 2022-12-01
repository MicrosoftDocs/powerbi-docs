---
title: What's the difference between live connections and DirectQuery?
description: See a comparison between live connections and DirectQuery
author: davidiseminger
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 06/10/2021
---

# Live connection and DirectQuery comparison

[Live connection](desktop-report-lifecycle-datasets.md#using-a-power-bi-service-live-connection-for-report-lifecycle-management) and [DirectQuery](refresh-data.md#datasets-in-directquery-mode) are methods of connecting your Power BI report to a dataset.

## Live connection

When you create a report in Power BI Desktop, a .pbix file is created. Usually, the .pbix contains both the report and its dataset. When you publish or upload the .pbix to Power BI service, it's split into a report and a dataset.

Another way of creating a report in Power BI desktop, is to connect it to a dataset that already exists. This method is called *live connection*, and it allows you to rely on existing data, which can be updated without accessing the report. Using *live connection* you can connect your report to one of the following data sources:

* A dataset that already exists in Power BI service

* An Azure Analysis Services (AAS) database  

* An on-premises instance of SQL Server Analysis Services (SSAS)

## DirectQuery mode



## Next steps

>[!div class="nextstepaction"]
>[What is Power BI Premium?](service-premium-what-is.md)
