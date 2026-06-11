---
title: Overview of slicers in Power BI
description: Learn about the different types of slicer visuals available in Power BI for filtering reports.
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: overview
ms.date: 06/16/2026
ai-usage: ai-assisted
LocalizationGroup: Visualizations
---

# Slicers overview in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Slicers are interactive filtering controls that appear directly on the report canvas. They narrow the portion of the semantic model shown in other visuals, allowing report readers to quickly filter data without opening the Filters pane. Slicers make commonly used filters visible and accessible, showing the current filter state at a glance.

:::image type="content" source="media/power-bi-visualization-slicers/slicers.gif" alt-text="Screenshot of an animated Power BI slicer filtering related visuals on a report page.":::

Power BI offers multiple slicer visuals, each designed for different filtering scenarios and data types. This article provides an overview of the slicer options available in Power BI to help you choose the right slicer for your needs.

## Slicer visual

The **Slicer** visual is a versatile filtering control that supports multiple settings including vertical list, tile, dropdown, and date picker. It works with text, numeric, and date data types and provides familiar filtering interactions.

The **Date picker** setting (preview) enables relative date selections that automatically roll forward as time passes. When you set a selection like "last full month," the slicer recalculates the date range each time the report loads.

For detailed guidance, see [Slicer visual in Power BI](power-bi-visualization-slicer-visual.md).

## Button slicer

The **Button slicer** displays filter options as interactive buttons with customizable styles and grid layouts. It supports images, icons, and flexible visual formatting to create visually appealing filtering experiences that integrate seamlessly with your report design.

For detailed guidance, see [Button slicer in Power BI](power-bi-visualization-button-slicer.md).

## List slicer (preview)

The **List slicer** provides a vertical list with hierarchies, search functionality, and conditional formatting. Use it to filter large datasets where you need to search for specific values or navigate through hierarchical data structures.

For detailed guidance, see [List slicer in Power BI](power-bi-visualization-list-slicer.md).

## Input slicer

The **Input slicer** accepts free-form text or numeric input with configurable filter operators. Use it for exact string matching, partial matching (contains, starts with), numeric filtering, and flexible text-based filtering scenarios where users need to type specific values. The Input slicer can also be used in [translytical task flows](../create-reports/translytical-task-flow-overview.md) without a data column to capture user input for write-back scenarios.

For detailed guidance, see [Input slicer in Power BI](power-bi-visualization-input-slicer.md).

## When to use a slicer

Use slicers to:

- Show commonly used filters on the report canvas for quick access
- Make the current filter state visible at a glance, without opening a dropdown or the Filters pane
- Filter by columns that are hidden in data tables
- Create focused reports by placing slicers next to relevant visuals

## Slicers vs. Filters pane

In addition to slicers, you can use the **Filters pane** to apply filters at the visual, page, or report level. The Filters pane provides a centralized location for managing all filters in your report, while slicers make specific filters visible and interactive on the canvas.

| Feature | Slicers | Filters pane |
|---------|---------|--------------|
| **Visibility** | Always visible on the canvas | Hidden until opened |
| **Interactivity** | Direct interaction with filter values | Requires opening the pane |
| **Best for** | Frequently used filters, user-facing reports | Complex filtering, report author use |
| **Sync across pages** | Yes, with Sync slicers | Report-level filters apply to all pages |

For more information about the Filters pane, see [Format filters in Power BI reports](../create-reports/power-bi-report-filter.md).

## Common features across slicer types

All Power BI slicers share common capabilities:

- **Visual interactions**: Configure whether a slicer filters or highlights other visuals on the page. Learn more in [Change how visuals interact in a Power BI report](../create-reports/service-reports-visual-interactions.md).
- **Sync across pages**: Sync slicer selections across multiple report pages.
- **Formatting options**: Customize colors, borders, titles, and backgrounds.
- **Filter other slicers**: By default, slicers filter other slicers on the page.

## Sync and use slicers on other pages

You can sync a slicer to use it on multiple pages in a report. When you sync a slicer, selections made on any synced page affect visualizations across all pages where the slicer is synced.

# [Power BI Desktop](#tab/powerbi-desktop)

1. On the **View** ribbon, select **Sync slicers**. The **Sync slicers** pane appears between the **Filters** and **Visualizations** panes.

# [Power BI service](#tab/powerbi-service)

1. On the **View** menu, select the **Sync slicers pane**. The **Sync slicers** pane appears between the **Filters** and **Visualizations** panes.

---

2. Select a slicer on a report page to view its sync settings in the **Sync slicers** pane.
3. In the **Sync** column, select the pages where you want the slicer selections to apply.
4. In the **Visible** column, select the pages where you want the slicer to appear.

Although the slicer initially appears on synced pages at the same size and position as on the original page, you can move, resize, and format synced slicers on different pages independently.

> [!NOTE]
> If you sync a slicer to a page but don't make it visible on that page, slicer selections made on other pages still filter the data on that page.

## Sync separate slicers

You can also sync two or more separate slicers by marking them as part of a group. Syncing slicers is useful when working with composite models, as you might want to make the same selection across sources without relying on cross-source group relationships.

1. Make sure the **Sync slicers** pane is visible by selecting it from the **View** menu.
1. Select one of the slicers that you want in the group. In the **Sync slicers** pane, expand **Advanced options**, and enter a name for the group.
1. Select another slicer you want to sync with the first, and enter the same group name exactly.
1. Select either **Sync field changes to other slicers**, **Sync filter changes to other slicers**, or both depending on your scenario:
   - To keep slicer filter selections in sync, select **Sync filter changes to other slicers**.
   - To sync changes to the field the slicers are based on, select **Sync field changes to other slicers**.

## Apply all and Clear all slicer buttons

When a report page has multiple slicers, you can add **Apply all slicers** and **Clear all slicers** buttons to improve performance and usability. These buttons let users make multiple slicer selections before applying them all at once, reducing unnecessary visual queries. The **Clear all slicers** button resets all slicers on the page with a single click.

To add these buttons, go to **Insert** > **Buttons** and select **Apply all slicers** or **Clear all slicers**.

For detailed guidance, see [Create Apply all and Clear all slicers buttons in Power BI reports](../create-reports/buttons-apply-all-clear-all-slicers.md).

## Control which visuals a slicer affects

By default, slicers filter all other visuals on the report page, including other slicers. To prevent a slicer from affecting a specific visual, use edit interactions to change the filtering behavior.

1. Select the slicer you want to configure.
1. On the **Format** menu, select **Edit interactions**.
1. Filter controls appear above each visual on the page. Select **None** for any visual you don't want the slicer to filter.

For detailed guidance, see [Change how visuals interact in a Power BI report](../create-reports/service-reports-visual-interactions.md).

## Use slicers with field parameters

Field parameters let report readers dynamically change which measures or dimensions appear in visuals. When you create a field parameter, Power BI automatically generates a slicer that controls the parameter. Users select options in the slicer to change which fields the connected visuals display.

For example, you can create a field parameter containing **Sales**, **Profit**, and **Quantity** measures. When a user selects **Profit** in the slicer, all visuals using that parameter update to show profit data instead of sales.

You can also create a two-slicer setup for dimension field parameters. The first slicer lets users pick which dimension to analyze: right-click the field parameter in the **Value** well and select **Show selected field** to display the dimension options. The second slicer lets users pick values within that dimension: right-click the field parameter in the **Value** well and select **Show values of selected field** to display the values for the selected dimension.

To make a chart fully dynamic, add a field parameter for measures to the **Values** well and a field parameter for dimensions to the **Axis** well. Users can then change both what the chart measures and how it's grouped using slicers.

:::image type="content" source="media/power-bi-visualization-slicers/slicer-and-field-parameters.gif" alt-text="Animation showing slicers controlling field parameters to dynamically change a chart's measures and dimensions.":::

For detailed guidance on creating and using field parameters, see [Let report readers use field parameters to change visuals](../create-reports/power-bi-field-parameters.md).

## Paste values in slicers

The paste feature lets you apply multiple selections to a slicer by pasting a list of values from external sources like Excel, Notepad, or emails. Instead of selecting items one by one, you can paste values directly into the slicer, and it automatically recognizes and applies all matching selections.

To paste values into a slicer:

1. In an external application (such as Excel), create a list of values you want to filter by. Each value must be on its own line (for example, in separate rows in Excel or on separate lines in a text file).
1. Copy the values to your clipboard.
1. In Power BI, select the slicer on your report canvas.
1. Press **Ctrl+V** to paste the values, or select the ellipsis (**...**) menu and choose the paste option.

The slicer selects all items that match your pasted values.

> [!NOTE]
> The paste feature is available in the [Button slicer](power-bi-visualization-button-slicer.md) and [List slicer](power-bi-visualization-list-slicer.md) (preview). Paste applies exact-match selection.

## Search in slicers

The search feature helps you quickly locate specific items without scrolling through the entire list. Type a name or keyword in the search bar, and the slicer instantly filters to show only matching entries.

> [!NOTE]
> The search feature is available in the [Slicer visual](power-bi-visualization-slicer-visual.md) and the [List slicer](power-bi-visualization-list-slicer.md) (preview).

## Specialized slicer configurations

These articles explain how to configure specific slicer behaviors that work across slicer types:

- [Numeric range slicers](../create-reports/desktop-slicer-numeric-range.md)
- [Relative date slicers](desktop-slicer-filter-date-range.md)
- [Relative time slicers](../create-reports/slicer-filter-relative-time.md)
- [Responsive, resizable slicers](../create-reports/power-bi-slicer-filter-responsive.md)
- [Hierarchy slicers](../create-reports/power-bi-slicer-hierarchy-multiple-fields.md) with multiple fields

## Related content

- [Slicer visual in Power BI](power-bi-visualization-slicer-visual.md)
- [Button slicer in Power BI](power-bi-visualization-button-slicer.md)
- [List slicer in Power BI](power-bi-visualization-list-slicer.md) (preview)
- [Input slicer in Power BI](power-bi-visualization-input-slicer.md)
- [Change how visuals interact in a Power BI report](../create-reports/service-reports-visual-interactions.md)
- [Format filters in Power BI reports](../create-reports/power-bi-report-filter.md)
