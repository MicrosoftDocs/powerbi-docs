---
title: Known issue - Unable to load Power BI dataset list in Excel
description: A known issue is posted where you can't retrieve the list of datasets in Excel when you try to get data from Power BI.
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-175
---
# Known issue #175 - Unable to load Power BI dataset list in Excel

You can't retrieve the list of datasets in Excel when you try to get data from Power BI.  When you select **Data** > **Get Data** > **From Power BI** or **Insert** > **PivotTable** > **From Power BI**, the **Power BI Datasets** pane opens, but the datasets list doesn't load.

**APPLIES TO:** ✔️ Excel integration with Power BI

**Status:** Fixed: May 19, 2022

**Problem area:** Consume and View


## Symptoms

The error message you'll see in the **Power BI Datasets** pane is similar to:
> "Unable to connect to Power BI to load your datasets. Please try again or contact Power BI support."

## Solutions and workarounds

To work around this error, you can navigate to the Power BI datasets hub, search for the desired dataset, and select **Analyze in Excel** to generate an Excel workbook connected to the Power BI dataset.

## Next steps

- [About known issues](power-bi-known-issues.md)
