---
title: Filter Data in Power BI Reports
description: Learn how to use filters in the Power BI service to view and analyze specific data in your reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.custom:  
ms.service: powerbi
ms.subservice: pbi-explore
ms.search.form: Use filters in a report
ms.topic: how-to
ms.date: 01/12/2026
ai-usage: ai-assisted
LocalizationGroup: Reports
---

# Filter data in Power BI reports

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

Use the **Filters** pane in the Power BI service to control what data appears in your reports. You can modify existing filters to focus on specific data, reset filters to their defaults, or clear filters to view all available data.

Power BI offers multiple filtering methods. This article focuses on the **Filters** pane. For information about cross-filtering and cross-highlighting through visual interactions, see [How visuals cross-filter each other in a Power BI report](end-user-interactions.md).

## Open the Filters pane

The **Filters** pane appears on the right side of your report. If the pane is collapsed, select **Filters** on the right edge to expand it.

:::image type="content" source="media/end-user-report-filter/power-bi-expand-filters-pane.png" alt-text="Screenshot of a report open in the Power BI service with the Filters pane expanded.":::

## Understand filter types

The **Filters** pane displays filters that the report designer adds to the report. You can modify existing filters and save your changes, but you can't add new filters.

The **Filters** pane organizes filters into three types:

- **Filters on all pages** - Apply to every page in the report
- **Filters on this page** - Apply only to the current page
- **Filters on this visual** - Apply only to a selected visual

Shaded filter cards indicate active filters that exclude some data. For example, a Region filter set to **Central** displays only Central region data and excludes West and East regions.

:::image type="content" source="media/end-user-report-filter/power-bi-filter-pane.png" alt-text="Screenshot of a report with a visualization and its filters displayed.":::

Filters showing **(All)** include all available values. Anyone with view permissions can modify these filters.

## View filters for a visual

To see all filters affecting a specific visual, hover over the visual and select the filter icon :::image type="icon" source="media/end-user-report-filter/power-bi-filter-icon.png":::. This opens a pop-up showing all active filters, including basic filters, slicers, cross-filters, advanced filters, Top N filters, relative date filters, and URL-based filters.

## Modify filters

### Expand a filter

Select the arrow next to the filter name to view available values and counts.

### Change filter values

1. Select the drop-down arrow next to the field name.
1. Choose one or more values from the list. Hold **CTRL** to select multiple values.
1. For numeric or date filters, specify ranges or conditions as needed.

### Search for filter values

For filters with many values, use the search box to find specific items.

### Clear a single filter

Select the eraser icon next to the filter name to reset it to **(All)**.

:::image type="content" source="media/end-user-report-filter/power-bi-erase.png" alt-text="Screenshot of a report with the Filters pane expanded and the eraser icon selected.":::

### Reset all filters

Select **Reset to default** from the top menu bar to revert all filters to their original settings.

:::image type="content" source="media/end-user-report-filter/power-bi-reset-icon.png" alt-text="Screenshot of the top menu bar with the Reset to default icon selected.":::

> [!NOTE]
> If you don't see **Reset to default**, the report designer disabled this option. Designers can also lock specific filters to prevent changes.

## Save filter changes

The Power BI service automatically saves your filter changes, including in the mobile version of the report. To save specific filter combinations, create a personal bookmark. For more information, see [Bookmarks in the Power BI service](end-user-bookmarks.md).
  
## Related content

- [How visuals cross-filter each other in a Power BI report](end-user-interactions.md)
