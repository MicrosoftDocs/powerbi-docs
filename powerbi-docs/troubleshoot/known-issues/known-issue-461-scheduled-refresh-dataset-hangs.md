---
title: Known issue - A scheduled refresh of a dataset intermittently hangs when connected to a dataflow
description: A known issue is posted where a scheduled refresh of a dataset intermittently hangs when connected to a dataflow.
author: mihart
ms.author: anirmale
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 07/27/2023
ms.custom: known-issue-461
---

# Known issue - A scheduled refresh of a dataset intermittently hangs when connected to a dataflow

Scheduled refreshes of datasets connected to dataflows may hang intermittently and the following scheduled refreshes may be skipped.

**APPLIES TO:** ✔️ Power BI

**Status:** Open

**Problem area:** Create and Author Data

## Symptoms

You may experience a skipped scheduled refresh on datasets connected to a dataflow. The schedule time under the **Scheduled Refresh** option on the dataset settings page displays correctly, however if you refer to the "**Refresh history** you find that the refresh didn't take place.

## Solutions and workarounds

To work around this issue, republish the dataset under a different name to the same workspace.

## Related content

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
