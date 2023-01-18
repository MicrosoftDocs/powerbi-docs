---
title: Known issue - Excel Desktop crashes when opening data model that was refreshed by Power BI Service
description: A known issue is posted where 
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-214
---
# Known issue # 214 - Excel Desktop crashes when opening data model that was refreshed by Power BI Service

You can create an Excel workbook that contains a PowerPivot data model and store it in either OneDrive Business or SharePoint.  You can then schedule and run a successful refresh through the Power BI Service.  If you then try to open the Excel workbook in Excel Desktop, the workbook won't open, resulting in either a crash or error message.

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Service :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Excel Integration

**Status:** Fixed: July 25, 2022

**Problem area:** Consume and View


## Symptoms

When opening an Excel workbook that contains a data model that was refreshed by the Power BI Service, the Excel workbook will either:

- Crash and close Excel Desktop without an error message
- Show an error message similar to "Either the component that raises this event is not installed on your local computer or the installation is corrupted."

## Solutions and workarounds

As a workaround, use Excel Online or Excel for the web to view the workbook.

## Next steps

- [About known issues](power-bi-known-issues.md)
