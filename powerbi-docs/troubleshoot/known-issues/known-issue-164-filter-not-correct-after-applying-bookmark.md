---
title: Known issue - Filter not correct after applying bookmark
description: In your Power BI Desktop or Power BI Service report, you may see filters not showing correctly after applying a bookmark.
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 08/03/2022
ms.custom: known-issue-164
---

# Description of known issue #164

In your Power BI Desktop or Power BI Service report, you may see filters not showing correctly after applying a bookmark.  This scenario occurs when your report uses basic filtering and a bookmark.  If you change the selected values in the filter and then apply a bookmark, the visuals on the page update but the filter in the filter pane will retain the existing selecting values and not show the correct selected values from the bookmark.  You will see the same experience for report-level, page-level, and visual-level filters.

**APPLIES TO:** ✔️ Power BI Desktop ✔️ Power BI Service

**Status:** Fixed: May 23, 2022

**Problem area:** Create and Author Data


## Symptoms

If your report falls under this issue, you will see that while the visuals update correctly, the basic filter selection does not.

## Solutions and workarounds

To see the correct selected values in the filter, clear the filter before applying the bookmark.

## Next steps

- [About known issues](power-bi-known-issues.md)
