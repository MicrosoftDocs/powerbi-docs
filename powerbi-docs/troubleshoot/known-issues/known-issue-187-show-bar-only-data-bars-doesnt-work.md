---
title: Known issue - Applying **Show bar only** for data bars doesn't work in Power BI Service or Power BI Desktop
description: A known issue is posted where applying Show bar only for a visual that uses data bars conditional formatting doesn't work.
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-187
---
# Known issue #187 - Applying **Show bar only** for data bars doesn't work in Power BI Service or Power BI Desktop

Applying **Show bar only** for a visual (such as a table or matrix) that uses data bars conditional formatting doesn't work.  The failure occurs in both Power BI Service and Power BI Desktop.  Once the report has been uploaded to Power BI Service, you won't be able to modify the data bar settings to restore its working nature.


**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Service :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Desktop

**Status:** Fixed: July 25, 2022

**Problem area:** Create and Author Data


## Symptoms

If **Show bar only** is applied, you'll see one of two errors:

* In the Service, the visual won't refresh and show an endless spinning wheel.
* In the Desktop, an error is thrown.

## Solutions and workarounds

To workaround this issue, you'll need to remove the option. To find the **Show bar only** setting, traverse to the formatting pane of the visual.  Under the Conditional formatting area, select the **Advanced controls** link.  Then you can check or uncheck **Show bar only**. <p>

You won't be able to modify the settings on Power BI Service; instead, remove the option in Power BI Desktop and then republish the report to Power BI Service.

## Next steps

- [About known issues](power-bi-known-issues.md)
