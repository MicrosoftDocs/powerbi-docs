---
title: Known issue - Long running, failed or stuck dataflow in Power BI Premium
description: A known issue is posted where you may encounter a long running, failed or stuck dataflow on Power BI Premium.
author: mihart
ms.author: mihart
ms. reviewer: jeluitwi
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 11/03/2022
ms.custom: known-issue-165
---

# Known issue #165 - Long running, failed or stuck dataflow in Power BI Premium

You will encounter either a long running dataflow refresh or a dataflow refresh that is stuck in canceling. In some rare cases,- your dataflow fails and you'll receive an error message: “Your(…) dataflow couldn’t be refreshed because there was a problem with one or more entities, or because dataflow capabilities were unavailable.”

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Premium Service :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Dataflow

**Status:** Fixed: November 1, 2022

**Problem area:** Refresh Data

## Symptoms

Refreshing a dataflow will have either one of the following symptoms:

- Dataflow refresh stuck in canceling
- Long running dataflow refresh
- Failed dataflow refresh

## Solutions and workarounds

The Power BI team is working to continually improve dataflow reliability. As part of that, the team is working on several efforts that will be available in the months ahead.  For detailed updates, please visit [Power BI Support](https://support.powerbi.com).

It's also recommended to follow the suggestions within  [Best practices for designing and developing complex dataflows](/power-query/dataflows/best-practices-developing-complex-dataflows). You can also review refresh schedules and potentially move refresh times around to help avoid contention that leads to these issues.

## Next steps

- [About known issues](power-bi-known-issues.md)
