---
title: Managing query refresh
description: This article describes the use of the 'include in report refresh' option in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 05/07/2021
LocalizationGroup: Data refresh
---

# Managing query refresh in Power BI

With Power BI, you can connect to [many different types of data sources and shape the data to meet your needs](desktop-shape-and-combine-data.md).
The connections and transformations are stored in queries, which are by default refreshed either by manual or automatic refresh of the report.

## Excluding queries from refresh
For queries for which the source data is not updated often or at all, it makes sense to not have the queries included in the refresh of the report. In this scenario, you can exclude queries from being refreshed when the report is refreshed by un-checking 'Include in report refresh' in the context menu of the query in Desktop or in the Properties screen:

![Screenshot of the query context menu, highlighting the 'Include in report refresh' option.](media/refresh-include-in-report-refresh/include-in-report-refresh-context-menu.png)

![Screenshot of the Query Properties dialog, highlighting the 'Include in report refresh' option.](media/refresh-include-in-report-refresh/include-in-report-refresh-properties-menu.png)



## Next steps

[Shape and combine data](desktop-shape-and-combine-data.md)
[Configuring scheduled refresh](refresh-scheduled-refresh.md)  
[Tools for troubleshooting refresh issues](service-gateway-onprem-tshoot.md)  
[Troubleshooting refresh scenarios](refresh-troubleshooting-refresh-scenarios.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
