---
title: Known issue - Closing a Dataflow Gen1 takes you to the wrong workspace
description: A known issue is posted where closing a Dataflow Gen1 takes you to the wrong workspace
author: mihart
ms.author: jessicamo
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 12/14/2023
ms.custom: known-issue-546
---

# Known issue - Closing a Dataflow Gen1 takes you to the wrong workspace

When you open and close a Dataflow Gen1, you aren't redirected to the original workspace.  Instead, the page redirects to **My workspace**.  You might also get taken to the wrong workspace if you use the web browser back button.  Going to the wrong workspace only happens some of the time, not all of the time.

**APPLIES TO:** ✔️ Dataflow Gen1

**Status:** Fixed: December 13, 2023

**Problem area:** Create and Author Data

## Symptoms

After you open and close a Dataflow Gen1, the Power BI service doesn't show the expected workspace.  You might also notice that the workspace shown in the Power BI Service user interface is out of sync with the workspace shown in the browser URL.

## Solutions and workarounds

To see the desired workspace, try refreshing the page in the web browser.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
