---
title: Known issue - Dremio connector is missing
description: A known issue is posted where the Dremio connector isn't currently available in the Power BI Service
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-204
---
# Known issue #204 - Dremio connector is missing

We recently enabled Cloud based refresh for Dremio, removing its gateway requirement.  However, there has been a recent update that has put the Dremio connector back into the "gateway only" category.

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Service

**Status:** Fixed: July 25, 2022

**Problem area:** Create and Author Data


## Symptoms

Any Power BI items that use the Dremio connector will no longer refresh directly from the Power BI Service.

## Solutions and workarounds

As a workaround, use a gateway to use the Dremio connector.

## Next steps

- [About known issues](power-bi-known-issues.md)
