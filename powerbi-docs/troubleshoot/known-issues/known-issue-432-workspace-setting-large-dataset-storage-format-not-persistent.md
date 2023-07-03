---
title: Known issue - Workspace setting 'large dataset storage format' isn't persistent
description: A known issue is posted where the workspace setting 'large dataset storage format' isn't persistent
author: mihart
ms.author: akangsha1
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: troubleshooting  
ms.date: 06/30/2023
ms.custom: known-issue-432
---

# Known issue - Workspace setting 'large dataset storage format' isn't persistent 

The workspace setting 'Large dataset storage format' isn't consistent. You may experience issues while making changes to dataset storage format in the workspace settings in Power BI. The default storage format is shown as a 'Large dataset storage format' but if you refresh the entire page (F5) the storage format changes to 'small dataset storage format'

**APPLIES TO:** ✔️ Power BI

**Status:** Open

**Problem area:** Administration

## Symptoms

The steps to reproduce the issue are:

1. Access the workspace setting, change the storage format to "Large dataset storage format" and select 'Apply'
2. Refresh the page
3. See the change is reverted or changed back to 'Small dataset storage format'

## Solutions and workarounds

Try making the change again.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
