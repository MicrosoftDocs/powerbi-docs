---
title: Known issue - Combo chart custom labels don't display
description: A known issue is posted where the combo chart custom labels don't display
author: mihart
ms.author: jessicamo
ms.topic: troubleshooting
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.date: 10/10/2023
ms.custom: known-issue-523
---

# Known issue - Combo charts custom labels not displaying

Combo charts don't show a custom label unless multiple series are present in either the line or the column data field wells. Default value labels still display properly.

**APPLIES TO:** ✔️ Power BI

**Status:** Open

**Problem area:** Consume and View

## Symptoms

When custom labels are toggled on, the combo chart's labels don't display in either combo chart type, even if a type is selected in the field picker.

## Solutions and workarounds

The user can overlay a line chart on top of a column/bar chart and set the transparency to 100% to simulate a combo chart.

## Next steps

- [About known issues](/power-bi/troubleshoot/known-issues/power-bi-known-issues)
