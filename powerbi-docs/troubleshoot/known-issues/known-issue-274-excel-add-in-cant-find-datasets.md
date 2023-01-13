---
title: Known issue - Excel add-in can't find Power BI datasets
description: A known issue is posted where you may not find your expected datasets hen using the Power BI datasets add-in for Excel Desktop or Excel Online
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 11/14/2022
ms.custom: known-issue-274
---

# Known issue - Excel add-in can't find Power BI datasets

When using the Power BI datasets add-in for Excel Desktop or Excel Online, you may not find your expected datasets. You either don't see any results when searching for an existing dataset or you see the dataset but can’t successfully create a PivotTable.

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Excel Integration

**Status:** Open

**Problem area:** Consume and View

## Symptoms

Using the Power BI datasets add-in in Excel Desktop and Excel Online behaves oddly. You either might not get any results when you search for an existing dataset that you have access to or you may find the dataset in the add-in but can’t successfully create PivotTables.

## Solutions and workarounds

Rather than connect to your data through Excel, you can use Power BI Service's data hub.  In the data hub, search and select your desired dataset.  Then you can use the **Analyze in Excel** option to see your data in Excel.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
- [Data discovery using the data hub](/power-bi/connect-data/service-data-hub?tabs=datasets)
