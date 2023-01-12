---
title: Known issue - GetVisuals() API for custom visuals may return a blank title
description: A known issue is posted where the GetVisuals() API for custom visuals may return a blank title
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-211
---
# Known issue #211 - GetVisuals() API for custom visuals may return a blank title

The GetVisuals() client side API doesn't return the visual title correctly when called before the report renders.


**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Service

**Status:** Fixed: July 25, 2022

**Problem area:** Embedded, REST API or PowerShell


## Symptoms

The response from the GetVisuals() API call returns a blank title.

## Solutions and workarounds

As a workaround, you can call GetVisuals() API only after the “rendered” event got fired, ensuring GetVisuals() API returns the title of custom visuals correctly.

## Next steps

- [Rendered Event API](/javascript/api/overview/powerbi/handle-events#rendered)
- [About known issues](power-bi-known-issues.md)
