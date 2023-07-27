---
title: Known issue - dataflow scheduled refresh of dataset, intermittently hangs and following scheduled refresh is skipped
description: A known issue is posted where dataflow scheduled refresh of dataset, intermittently hangs and following scheduled refresh is skipped
author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 07/27/2023
ms.custom: known-issue-461
---

# Known issue - dataflow scheduled refresh of dataset, intermittently hangs and immediate scheduled refresh is skipped

scheduled refreshes of datasets connected to dataflows intermittently may hang and the following scheduled refreshes may be skipped.

**APPLIES TO:** ✔️ Power BI

**Status:** Open

**Problem area:** Create and Author Data

## Symptoms

you may experience skipped scheduled refreshes on datasets that use dataflows as data source. You see the correct schedules times under the "scheduled refresh" option on the dataset settings page, however if you refer to the "Refresh history" you may verify those didn't take place.

## Solutions and workarounds

only available workaround at the moment is to republish the dataset under a different name to the same workspace.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)