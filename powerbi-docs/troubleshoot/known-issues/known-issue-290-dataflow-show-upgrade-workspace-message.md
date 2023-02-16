---
title: Known issue - Working in a dataflow shows irrelevant upgrade workspace message
description: A known issue is posted where an upgrade workspace message appears when you're already in a Premium workspace
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 11/14/2022
ms.custom: known-issue-290
---

# Known issue - Working in a dataflow shows irrelevant upgrade workspace message

You may see a warning message telling you to upgrade to a Premium workspace even though you already have a Premium workspace. You can ignore the message when editing, saving, or refreshing a dataflow.

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Service :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Dataflow

**Status:** Fixed: February 9, 2023

**Problem area:** Create and Author Data

## Symptoms

When creating or editing a dataflow in a Premium workspace, you see a message bar that says *"Compute tables require Premium to refresh. To enable refresh, upgrade this workspace to Premium capacity, or remove this table."*

## Solutions and workarounds

If you are in a Premium workspace, you can ignore the message. The message doesn't prevent you from performing any dataflow operations.  The irrelevant message will be removed in November 2022.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
