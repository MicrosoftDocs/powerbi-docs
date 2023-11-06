---
title: Known issue - Export to CSV file truncated at 300 rows
description: A known issue is posted where the export to CSV file is truncated at 300 rows
author: mihart
ms.author: jessicamo
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 10/18/2023
ms.custom: known-issue-498
---

# Known issue - Export to CSV file truncated at 300 rows

When you select **Export data** on a tabular visual's options menu and choose to export to a **CSV file**, the resulting downloaded file is truncated to 300 rows, rather than showing all the available rows.

**APPLIES TO:** ✔️ Power BI

**Status:** Fixed: October 18, 2023

**Problem area:** Consume and View

## Symptoms

On a tabular visual, open the More options (...) dropdown and select **Export data**.  In **File format**, choose **.csv (30,000-rows max)**. The downloaded CSV file is truncated at 300 rows, although the corresponding data should have more than 300 rows.

## Solutions and workarounds

As a workaround, try choosing the Excel export file format.  You can then open the downloaded Excel file and save it as a CSV file.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
