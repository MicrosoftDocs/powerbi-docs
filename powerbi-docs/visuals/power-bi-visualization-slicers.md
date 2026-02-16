---
title: Slicers in Power BI
description: A Power BI slicer is an alternate way of filtering. It narrows the portion of the semantic model shown in the other visualizations in a report you design.
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 01/28/2026
ai-usage: ai-assisted
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---
# Slicers in Power BI

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

Suppose you want readers to view overall sales metrics and highlight performance by district manager and time frame. You could create separate reports, build comparative charts, or add filters in the Filters pane. Or use *slicers*. Slicers filter data directly on the report page. They narrow the portion of the semantic model shown in the other visuals.

:::image type="content" source="media/power-bi-visualization-slicers/slicer2.gif" alt-text="Screenshot of an animated Power BI slicer filtering related visuals on a report page.":::

Power BI offers several slicer visuals, each designed for different filtering scenarios. This article shows you how to create and format the original slicer visual by using the free [Retail Analysis Sample](../create-reports/sample-retail-analysis.md). It also covers controlling which visuals a slicer affects, syncing slicers across pages, and filtering and formatting slicers.

## Types of slicers

Power BI provides multiple slicer visuals to meet different filtering needs:

| Slicer type | Description | Best for |
|-------------|-------------|----------|
| [Slicer](power-bi-visualization-slicers.md) | The original slicer visual with vertical list, tile, and dropdown styles. | General-purpose filtering with familiar controls. |
| [Button slicer](power-bi-visualization-button-slicer.md) | Interactive buttons with customizable styles, grid layouts, and image support. | Visually appealing filtering with button-based interactions. |
| [List slicer](power-bi-visualization-list-slicer.md) (preview) | Vertical list with hierarchies, search functionality, and conditional formatting. | Filtering large datasets with search and hierarchy support. |
| [Input slicer](power-bi-visualization-input-slicer.md) | Free-form text input with configurable filter operators. | Exact string matching, partial matching, and flexible text-based filtering. |

In addition to slicers, you can use the **Filters pane** to apply filters at the visual, page, or report level. The Filters pane provides a centralized location for managing all filters in your report. For more information, see [Format filters in Power BI reports](../create-reports/power-bi-report-filter.md).

> [!NOTE]
> The examples in this article use the original Slicer visual. For instructions on using other slicer types, see the documentation for each specific slicer.

These other articles explain how to configure specific slicer behaviors:

- [Numeric range slicers](../create-reports/desktop-slicer-numeric-range.md)
- [Relative date slicers](desktop-slicer-filter-date-range.md)
- [Relative time slicers](../create-reports/slicer-filter-relative-time.md)
- [Responsive, resizable slicers](../create-reports/power-bi-slicer-filter-responsive.md)
- [Hierarchy slicers](../create-reports/power-bi-slicer-hierarchy-multiple-fields.md) with multiple fields

## When to use a slicer

Use slicers to:

- Show commonly used filters on the report canvas for quick access
- Show the current filter state without opening a drop-down list
- Filter by columns that are hidden in data tables
- Create focused reports by placing slicers next to key visuals

## Create a slicer

# [Power BI Desktop](#tab/powerbi-desktop)

This slicer filters data by district manager. To follow along, download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.
1. Browse to the **Retail Analysis Sample PBIX.pbix** file and select **Open**.
1. In the navigation pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.
1. On the **Overview** page, with nothing selected on the report canvas, select the **Slicer** icon :::image type="icon" source="media/power-bi-visualization-slicers/slicer-icon.png"::: in the **Visualizations** pane to create a slicer.

# [Power BI service](#tab/powerbi-service)

This slicer filters data by district manager. To follow along, use the built-in Retail Analysis Sample.

1. In the Power BI service (app.powerbi.com), select **Learn** in the left nav.
1. On the Learning center page, under **Sample reports**, scroll until you see **Retail Analysis Sample**.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-service-learning-center-samples.png" alt-text="Screenshot of the Learning center page with the Retail Analysis Sample.":::

1. Select **Retail Analysis Sample**. It opens in reading mode.
1. Select **Edit** on the menu bar to display the **Visualizations** pane, and select the **Slicer** icon :::image type="icon" source="media/power-bi-visualization-slicers/slicer-icon.png"::: to create a slicer.

---
1. With the slicer selected, in the **Fields** pane, expand the **District** table and select **DM** to populate it.
1. Resize or move elements on the canvas to make room for the slicer. If the slicer is too small, items are cut off.

   The new slicer is now populated with a list of district manager names and their selection boxes.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-new-slicer-desktop.png" alt-text="Screenshot of Slicer populated with district manager names.":::

1. Select names on the slicer to filter other visuals. Select a name again to clear it, or hold <kbd>Ctrl</kbd> to select multiple names. Selecting all names has the same effect as selecting none.

    :::image type="content" source="media/power-bi-visualization-slicers/slicer-vertical-multi-select.png" alt-text="Screenshot of vertical slicer with three names selected and report filtered.":::

## Control which page visuals slicers affect

By default, slicers on a report page filter all other visuals on that page, including other slicers. When you choose values in the list and date slicers, the other visuals update. Power BI filters data to the intersection of the selected slicer values. 

Use visual interactions to exclude some page visualizations from being affected by others. For example, in the Retail Analysis sample on the **Overview** page, the **Total Sales Variance by FiscalMonth and District Manager** chart shows comparative data for district managers by month that you might want to keep visible. Use visual interactions to keep slicer selections from filtering this chart.

# [Power BI Desktop](#tab/powerbi-desktop)

1. Select the **District Manager** slicer on the **Overview** page of the Retail Analysis sample report.
1. On the ribbon, go to **Format**, and then select **Edit interactions**.

   :::image type="content" source="media/power-bi-visualization-slicers/edit-interactions-desktop.png" alt-text="Screenshot of the Edit interactions button in Power BI Desktop.":::

Filter controls :::image type="icon" source="media/power-bi-visualization-slicers/filter-controls.png"::: with **Filter** and **None** options appear above the other visuals on the page. The **Filter** option is selected by default.

# [Power BI service](#tab/powerbi-service)

1. Select a slicer that you previously created. In this case, on the **Overview** page of the Retail Analysis sample report, select the **District Manager** slicer.
1. Select **Visual interactions**, and then turn on **Edit interactions**.

   :::image type="content" source="media/power-bi-visualization-slicers/edit-interactions-service.png" alt-text="Screenshot of the Edit interactions button in the Power BI service.":::

    Filter controls, :::image type="icon" source="media/power-bi-visualization-slicers/filter-controls.png"::: each with a **Filter** and a **None** option, appear above all the other visuals on the page. Initially, the **Filter** option is preselected on all the controls.

---
1. Select **None** in the filter control above the **Total Sales Variance by FiscalMonth and District Manager** chart to stop the **District Manager** slicer from filtering it.

Learn more in [Change how visuals interact in a Power BI report](../create-reports/service-reports-visual-interactions.md).

## Sync and use slicers on other pages

You can sync a slicer and use it on any or all pages in a report.

The **District Monthly Sales** page has a **District Manager (or DM)** slicer. You might also want that slicer on the **New Stores** page. The **New Stores** page has a slicer, but it provides only **Store Name** information. With the **Sync slicers** pane, you can sync the **District Manager** slicer to these pages, so that slicer selections on any page affect visualizations on all three pages.

# [Power BI Desktop](#tab/powerbi-desktop)

1. In Power BI Desktop on the **View** ribbon, select **Sync slicers**.

    :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-view-sync.png" alt-text="Screenshot of Sync slicers selection in Power BI Desktop.":::

    The **Sync slicers** pane appears between the **Filters** and **Visualizations** panes.

    :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-sync-pane.png" alt-text="Screenshot of Sync slicers pane.":::

# [Power BI service](#tab/powerbi-service)

1. In the Power BI service, on the **View** menu, select the **Sync slicers pane**.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-service-slicer-view-sync.png" alt-text="Screenshot of Sync slicers selection in the Power BI service.":::

    The **Sync slicers** pane appears between the **Filters** and **Visualizations** panes.

    :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-sync-pane.png" alt-text="Screenshot of Sync slicers pane.":::

---

1. On the **District Monthly Sales** page of the report, select the **District Manager** slicer. 

   Because you already created a **District Manager** slicer on the **Overview** page, the **Sync slicers** pane appears like this:

   :::image type="content" source="media/power-bi-visualization-slicers/9-sync-slicers.png" alt-text="Screenshot of Sync District Monthly Sales slicer.":::

1. In the **Sync** column of the **Sync slicers** pane, select the **Overview**, **District Monthly Sales**, and **New Stores** pages. 

   This selection causes the **District Monthly Sales** slicer to sync across these three pages.

1. In the **Visible** column of the **Sync slicers** pane, select the **New Stores** page. 

   This selection makes the **District Monthly Sales** slicer visible on these three pages. The **Sync slicers** pane now appears like this:

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-sync-slicer-finished.png" alt-text="Screenshot of Select pages in Sync slicers.":::

1. Observe the effects of syncing. On the **District Monthly Sales** page, the **District Manager** slicer shows the same selections as on the **Overview** page. On the **New Stores** page, the **District Manager** slicer is visible, and its selections affect what's shown in the **Store Name** slicer.

    >[!TIP]
    >Although the slicer initially appears on the synced pages at the same size and position as on the original page, you can move, resize, and format synced slicers on the various pages independently.
    >[!NOTE]
    >If you sync a slicer to a page but don't make it visible on that page, slicer selections made on the other pages still filter the data on the page.

## Sync separate slicers

You can also sync two or more separate slicers. Syncing slicers is useful when working with composite models, as you might want to make the same selection across sources without relying on cross-source group relationships. To sync two or more separate slicers, you mark them as being part of a group.

1. Make sure the **Sync slicers** pane is visible by selecting it from the **View** menu.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-sync-pane.png" alt-text="Screenshot of Sync slicers pane.":::

1. Select one of the slicers that you want in the group. In the **Sync slicers** pane, expand **Advanced options**, and enter a name for the group. You can name it anything you want.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-advanced-group.png" alt-text="Screenshot of entering a group name in the Advanced section of the Sync slicers pane.":::

1. Then select another slicer you want to sync with the first, and enter the same name in the **group name** box. Be sure to enter it exactly the same.

1. Make sure to select either **Sync field changes to other slicers**, **Sync filter changes to other slicers**, or both depending on your scenario.

   - If you just want to keep the slicers in sync so filters set by the slicers are kept in sync, select **Sync filter changes to other slicers**.
   - If you also want to make sure that any changes you make to the field on which the slicers are based get synced across the group, select **Sync field changes to other slicers**.

1. Test that the sync works the way you want by changing the selection in one of the slicers. Observe that it gets updated in the other slicer in the group.

## Filter slicers

Apply visual-level filters to a slicer to reduce the list of values it shows. For example, filter out blank values from a list slicer or certain dates from a range slicer. Filtering a slicer only changes the values shown in the slicer, not the filter it applies to other visuals when you make a selection. For example, apply a filter to a range slicer to show only certain dates. The selection in the slicer only shows the first and last dates from that range, but you still see other dates in your other visuals. When you change the selected range in the slicer, you see the other visuals update. Clear the slicer to show all dates again.

Learn more about visual-level filters in [Filter types](../create-reports/power-bi-report-filter-types.md).

## Format slicers

Different formatting options are available, depending on the slicer type. For **Style**, **Vertical list** is the default. Select **Tile** to produce a slicer with tiles or buttons arranged horizontally, and scroll arrows to access items that don't fit in the slicer. By using the **Tile** style with **Responsive** layout and **Background** coloring, you can produce buttons or tiles rather than standard list items, and make slicer items resize to fit different screen sizes and layouts.  

### Visual options

1. Select the **District Manager** slicer, and select the **Format** icon ![Screenshot of the Format icon (paint roller) in the Visualizations pane.](media/power-bi-visualization-slicers/power-bi-format-brush.png) in the **Visualizations** pane.

1. Resize the slicer so it's wide, not tall.
1. In the **Format** pane, under **Visual**, expand **Slicer settings** > **Options**, and select **Tile**.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-tile-slicer.png" alt-text="Screenshot of a tile slicer after selecting the Tile option in Slicer settings.":::

   >[!TIP]
   >By default, slicer list items sort in ascending order. To switch to descending order, select the ellipsis (**...**) in the top right corner of the slicer > **Sort axis** > **Sort descending**.

1. Expand **Slicer header** and change the **Title text** to "District Manager".
1. Expand **Values** and select a **Background Color**. This color is one of the theme colors, `#abdae5`.

    :::image type="content" source="media/power-bi-visualization-slicers/slicer-tile-color.png" alt-text="Screenshot showing tile slicer with background color.":::

   >[!TIP]
   >- With the **Tile** style, deselected items show the chosen text and background colors. Selected items use the system default, usually a black background with white text.
   >- With the **Vertical list** style, items always show the selected colors, and selected check boxes are always black.

### Responsive layout

After you select the **Tile** style, turn **On** **Responsive** layout to change the size and arrangement of slicer items based on the view screen and slicer size.

:::image type="content" source="media/power-bi-visualization-slicers/responsive-slicer.png" alt-text="Screenshot of selecting responsive layout.":::

Responsive layout works only for tile and numeric range slicers, not for vertical list slicers. For more information about responsive layouts, see [Create a responsive slicer you can resize](../create-reports/power-bi-slicer-filter-responsive.md).

For range slicers, responsive formatting changes the slider style and lets you resize more flexibly. Read more about [numeric range slicers](../create-reports/desktop-slicer-numeric-range.md).

### Selection controls

- The **Show "Select all" option** is **Off** by default. Under **Selection**, turn **Show "Select all" option** to **On** to add a **Select all** item to the slicer. Use it to select or deselect all items at once. When all items are selected, selecting one item deselects it, which allows an *is-not* filter.

    :::image type="content" source="media/power-bi-visualization-slicers/slicer-select-all.png" alt-text="Screenshot of adding a Select all option to a slicer.":::

- **Single select** is **Off** by default. Select an item to select it. Hold <kbd>Ctrl</kbd> to select multiple items. Select an item again to deselect it.

    When **Single select** is **On**, you can select only one item. In vertical list slicers, the check boxes become radio buttons.

### Title options

The **Title text** in **Slicer header** is **On** by default. This selection shows the data field name at the top of the slicer. You can edit the title text, which is especially useful for hierarchy slicers. See [Change the title text](../create-reports/power-bi-slicer-hierarchy-multiple-fields.md#change-the-title) in the article "Add multiple fields to a hierarchy slicer" for details.

**Title** on the **General** tab is another option. It's **Off** by default.

### Other formatting options

Other formatting options are **Off** by default. Turn **On** these options to control them:

- **Lock aspect**: Keep the relative height and width of the slicer if it's resized. Under **General** > **Properties** > **Size**.
- **Background**: Add a background color to the slicer and set its transparency. Under **General** > **Effects**.
- **Border**: Add a border around the slicer and set its color. Under **General** > **Effects**.

    There's also a **Border** option on the **Visual** tab. It adds a border either over, under, or next to each option in the slicer. It's separate from and unaffected by the **General** settings.

- **Shadow**: Add a drop shadow to the slicer. Under **General** > **Effects**.

## Search in slicers

When working with slicers that contain many values, searching helps you quickly locate specific items without scrolling through the entire list.

To enable and use search in a slicer:

1. Select the ellipsis (**...**) in the top-right corner of the slicer, and then select **Search** from the dropdown menu. Alternatively, select the slicer and press **Ctrl+F**.
1. A search bar appears at the top of the slicer. Type a name or keyword in the search bar. The slicer instantly filters to show only matching entries.

For example, entering the letter "C" filters the slicer to show only items that begin with or contain that letter.

For more information about List slicer search capabilities, see [Search and filter list slicer](power-bi-visualization-list-slicer.md#search-and-filter-list-slicer).

## Paste values in slicers

The paste feature lets you apply multiple selections to a slicer by pasting a list of values from external sources like Excel, Notepad, or emails. Instead of selecting items one by one, you can paste values directly into the slicer, and it automatically recognizes and applies all matching selections.

To paste values into a slicer:

1. In an external application (such as Excel), create a list of values you want to filter by. Each value must be on its own line (for example, in separate rows in Excel or on separate lines in a text file).
1. Copy the values to your clipboard.
1. In Power BI, select the slicer on your report canvas.
1. Press **Ctrl+V** to paste the values, or select the ellipsis (**...**) menu and choose the paste option.

The slicer selects all items that match your pasted values.

## Considerations and limitations

The following considerations and limitations apply to slicers:

- By default, slicers filter all other visuals on the page, including other slicers. Use [visual interactions](../create-reports/service-reports-visual-interactions.md) to change this behavior.

### Search

- The search feature is available in the original Slicer visual and the [List slicer](power-bi-visualization-list-slicer.md) (preview).

### Paste values

- The paste feature is available in the [Button slicer](power-bi-visualization-button-slicer.md) and [List slicer](power-bi-visualization-list-slicer.md) (preview).
- Each value you want to select must be on its own line for the paste feature to work correctly.
- You can paste up to 2,000 values into a slicer; any extras are ignored.
- Pasting new values removes all previous selections.
- When you paste values, the slicer applies exact-match ("IS") filtering by only selecting items with values that precisely correspond. If pasted values don't match any available entries, those values still act as filters, so visuals might display as blank due to the absence of matching data.

## Related content

Learn more about slicers in these articles:

- [Button slicer](power-bi-visualization-button-slicer.md)
- [List slicer](power-bi-visualization-list-slicer.md) (preview)
- [Input slicer](power-bi-visualization-input-slicer.md)
- [Numeric range slicers](../create-reports/desktop-slicer-numeric-range.md)
- [Relative date slicers](desktop-slicer-filter-date-range.md)
- [Relative time slicers](../create-reports/slicer-filter-relative-time.md)
- [Responsive, resizable slicers](../create-reports/power-bi-slicer-filter-responsive.md)
- [Hierarchy slicers](../create-reports/power-bi-slicer-hierarchy-multiple-fields.md) with multiple fields
- [Format filters in Power BI reports](../create-reports/power-bi-report-filter.md)
