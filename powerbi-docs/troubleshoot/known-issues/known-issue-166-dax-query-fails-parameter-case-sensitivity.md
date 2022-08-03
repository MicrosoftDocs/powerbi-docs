---
title: Known issue - DAX query fails due to parameter case sensitivity
description: Your Power BI Report Builder report's dataset may fail if it uses DAX to connect to Analysis Services and a query parameter does not use the same case sensitivity as the report parameter
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 04/23/2022
ms.custom: known-issue-166
---
# Description of known issue #166

Your Power BI Report Builder report's dataset may fail if it uses DAX to connect to Analysis Services and a query parameter does not use the same case sensitivity as the report parameter.

**APPLIES TO:** ✔️ Power BI Report Builder

**Status:** Fixed: May 19, 2022

**Problem area:** Create and Author Data


## Symptoms

The DAX query will fail with an error similar to:
> Could not connect to the data source. </br>
> There was an error communicating with Analysis Services.

## Solutions and workarounds

You can change the query parameter case to match the report parameter case.

## Next steps

- [About known issues](power-bi-known-issues.md)
