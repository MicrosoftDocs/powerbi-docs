---
title: Known issue - the dataflow scheduled refresh of the dataset intermittently hangs and the following scheduled refresh is skipped
description: A known issue is posted where dataflow scheduled refresh of dataset intermittently hangs and the following scheduled refresh is skipped.
author: mihart
ms.author: anirmale
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 07/27/2023
ms.custom: known-issue-461
---

# Known issue - dataflow scheduled refresh of dataset, intermittently hangs and immediate scheduled refresh is skipped

 Dataflow scheduled dataset refresh hangs intermittently and the immediate scheduled refresh may be skipped.

**APPLIES TO:** ✔️ Power BI

**Status:** Open

**Problem area:** Create and Author Data

## Symptoms

The customer experiences skipped scheduled refresh on datasets that use a dataflow as the data source. The schedule time under the **cheduled refresh** option on the Dataset settings page displays correctly, however if you refer to the **Refresh history** you find that the refresh didn't take place.

## Solutions and workarounds

Ohe oly available workaround at the moment is to republish the dataset under a different name to the same workspace.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
