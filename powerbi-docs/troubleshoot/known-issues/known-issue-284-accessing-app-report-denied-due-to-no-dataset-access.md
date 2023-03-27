---
title: Known issue - Accessing Power BI app report is denied due to no dataset access
description: A known issue is posted where you may encounter access issues due to the underlying dataset when trying to open an app report
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 11/14/2022
ms.custom: known-issue-284
---

# Known issue - Accessing Power BI app report is denied due to no dataset access

As a Power BI app consumer, you may encounter access issues due to the underlying dataset when trying to open an app report.  If you don't have rights to the underlying dataset, you won't be able to access the report in the app, after deploying the app with multiple audiences.

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false"::: Power BI Service

**Status:** Fixed: February 9, 2023

**Problem area:** Share and Collaborate

## Symptoms

When trying to open a report in a Power BI app, you receive the message: *"**Permission required**. You cannot see the content of the report because you do not have permission to the underlying dataset. Please contact the dataset owner to request access."*

## Solutions and workarounds

To receive access to the report, you should ask the app author to go the dataset permission management page for the dataset, and explicitly grant access to the affected users or groups.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
