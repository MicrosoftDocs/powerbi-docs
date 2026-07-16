---
title: Matrix visual considerations and limitations
description: Review known considerations and limitations for matrix visuals in Power BI Desktop and the Power BI service.
ms.author: juliacawthra
author: JulCsc
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 05/01/2026
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to know the considerations and limitations of matrix visuals so I can plan around them when building reports.
ai-usage: ai-assisted
---
# Matrix visual considerations and limitations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article lists known considerations and limitations for matrix visuals in Power BI Desktop and the Power BI service.

## Visible column limit

A matrix visual can display only 100 columns at any time. Any additional columns, including totals and subtotals, aren't shown.

## Dynamic header text

Power BI doesn't support conditional formatting for row or column header text. Header text can't be dynamically adjusted based on measures. To dynamically control which rows or columns appear in any visual, use [field parameters](../create-reports/power-bi-field-parameters.md).

## Hierarchy-level formatting

You can't format each hierarchical level of row or column headers individually. Formatting applies to the lowest hierarchy level under the specific column's **Apply to header** setting, and upper levels inherit settings from the general **Row headers** or **Column headers** formatting options. Format the lowest level to the style you want, and the upper levels match it.

## Related content

- [Create a matrix visual in Power BI](power-bi-visualization-matrix-visual.md)
- [Matrix visual format settings](power-bi-visualization-matrix-visual-format-settings.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
- [Apply data point limits and strategies by visual type](power-bi-data-points.md)

