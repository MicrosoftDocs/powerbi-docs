---
title: Slicers in Power BI
description: A Power BI slicer is an alternate way of filtering. It narrows the portion of the semantic model shown in the other visualizations in a report you design.
author: miguelmyersMS
ms.author: miguel.myers
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 01/12/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---
# Slicers in Power BI

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

Suppose you want your report readers to be able to look at overall sales metrics, but also highlight performance for individual district managers and different time frames. You could create separate reports or comparative charts. You could add filters in the Filters pane. Or you could use *slicers*. Slicers are another way of filtering. They're displayed on the report page, and narrow the portion of the semantic model that's shown in the other report visualizations.

![Animation of Slicer in action.](media/power-bi-visualization-slicers/slicer2.gif)

This article walks through creating and formatting a basic slicer, using the free [Retail Analysis Sample](../create-reports/sample-retail-analysis.md). It also covers controlling which visuals are affected by a slicer, syncing with slicers on other pages, and filtering and formatting slicers.

These other articles explain how to make specific types of slicers:

- [Numeric range slicers](../create-reports/desktop-slicer-numeric-range.md).
- [Relative date slicers](desktop-slicer-filter-date-range.md).
- [Relative time slicers](../create-reports/slicer-filter-relative-time.md).
- Responsive, [resizable slicers](../create-reports/power-bi-slicer-filter-responsive.md).
- [Hierarchy slicers](../create-reports/power-bi-slicer-hierarchy-multiple-fields.md) with multiple fields.

## When to use a slicer
Slicers are a great choice when you want to:

- Display commonly used or important filters on the report canvas for easier access.
- Make it easier to see the current filtered state without having to open a drop-down list. 
- Filter by columns that are unneeded and hidden in the data tables.
- Create more focused reports by putting slicers next to important visuals.

Power BI slicers don't support:

- Input fields
- Drill-down options

## Create a slicer

# [Power BI Desktop](#tab/powerbi-desktop)

This slicer filters data by district manager. If you want to follow along with this procedure, download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

2. Browse to the **Retail Analysis Sample PBIX.pbix** file, then select **Open**.

3. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.

4. On the **Overview** page, with nothing selected on the report canvas, select the **Slicer** icon :::image type="icon" source="media/power-bi-visualization-slicers/slicer-icon.png"::: in the **Visualizations** pane to create a new slicer.

# [Power BI service](#tab/powerbi-service)

This slicer filters data by district manager. If you want to follow along with this procedure, use the built-in Retail Analysis Sample.

1. In the Power BI service (app.powerbi.com), select **Learn** in the left nav.

2. On the Learning center page, under **Sample reports**, scroll until you see the **Retail Analysis Sample**.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-service-learning-center-samples.png" alt-text="Screenshot of the Learning center page with the Retail Analysis Sample.":::

3. Select the **Retail Analysis Sample**. It opens in Reading mode.

4. Select **Edit** on the menu bar to display the **Visualizations** pane, then select the **Slicer** icon :::image type="icon" source="media/power-bi-visualization-slicers/slicer-icon.png"::: to create a new slicer.

---
5. With the new slicer selected, from the **Fields** pane, expand the **District** table and select **DM** to populate the slicer.

6. Resize and drag the elements on the canvas to make room for the slicer. If you resize the slicer too small, its items are cut off. 

   The new slicer is now populated with a list of district manager names and their selection boxes.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-new-slicer-desktop.png" alt-text="Screenshot of Slicer populated with district manager names.":::

7. Select names on the slicer and notice the effects on the other visualizations on the page. Select names again to deselect them, or hold down the **Ctrl** key to select more than one name. Selecting all names has the same effect as selecting none.

    :::image type="content" source="media/power-bi-visualization-slicers/slicer-vertical-multi-select.png" alt-text="Screenshot showing vertical slicer with three names selected and report filtered.":::

## Control which page visuals are affected by slicers

By default, slicers on report pages affect all the other visualizations on that page, including each other. As you choose values in the list and date slicers that you just created, notice the effects on the other visualizations. The filtered data is an intersection of the values selected in both slicers. 

Use visual interactions to exclude some page visualizations from being affected by others. For example, in the Retail Analysis sample on the **Overview** page, the **Total Sales Variance by FiscalMonth and District Manager** chart shows overall comparative data for district managers by month, which is information that you may want to keep visible. Use visual interactions to keep slicer selections from filtering this chart.

# [Power BI Desktop](#tab/powerbi-desktop)

1. Select a slicer that you previously created. In this case, on the **Overview** page of the Retail Analysis sample report, select the **District Manager** slicer.

2. Select the **Format** ribbon, then select **Edit interactions**.

   :::image type="content" source="media/power-bi-visualization-slicers/edit-interactions-desktop.png" alt-text="Screenshot of the Edit Interactions button on desktop version.":::

    Filter controls, :::image type="icon" source="media/power-bi-visualization-slicers/filter-controls.png"::: each with a **Filter** and a **None** option, appear above all the other visuals on the page. Initially, the **Filter** option is preselected on all the controls.

# [Power BI service](#tab/powerbi-service)

1. Select a slicer that you previously created. In this case, on the **Overview** page of the Retail Analysis sample report, select the **District Manager** slicer.

2. Select **Visual interactions** from the menu, and then turn on **Edit interactions**.

   :::image type="content" source="media/power-bi-visualization-slicers/edit-interactions-service.png" alt-text="Screenshot of the Edit Interactions button in the service version.":::

    Filter controls, :::image type="icon" source="media/power-bi-visualization-slicers/filter-controls.png"::: each with a **Filter** and a **None** option, appear above all the other visuals on the page. Initially, the **Filter** option is preselected on all the controls.

---
3. Select the **None** option in the filter control above the **Total Sales Variance by FiscalMonth and District Manager** chart to stop the **District Manager** slicer from filtering it. 

For more information about editing interactions, see [Change how visuals interact in a Power BI report](../create-reports/service-reports-visual-interactions.md).

## Sync and use slicers on other pages

You can sync a slicer and use it on any or all pages in a report.

In the current report, the **District Monthly Sales** page has a **District Manager (or DM)** slicer, but what if we also wanted that slicer on the **New Stores** page? The **New Stores** page has a slicer, but it provides only **Store Name** information. With the **Sync slicers** pane, you can sync the **District Manager** slicer to these pages, so that slicer selections on any page affect visualizations on all three pages.

# [Power BI Desktop](#tab/powerbi-desktop)

1. In Power BI Desktop on the **View** ribbon, select **Sync slicers**.

    :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-view-sync.png" alt-text="Screenshot of Sync slicers selection in Power BI Desktop.":::

    The **Sync slicers** pane appears between the **Filters** and **Visualizations** panes.

    :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-sync-pane.png" alt-text="Screenshot of Sync slicers pane.":::

# [Power BI service](#tab/powerbi-service)

1. In the Power BI service, on the **View** menu, set the **Sync slicers pane** to **On**.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-service-slicer-view-sync.png" alt-text="Screenshot of Sync slicers selection in the Power BI service.":::

    The **Sync slicers** pane appears between the **Filters** and **Visualizations** panes.

    :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-sync-pane.png" alt-text="Screenshot of Sync slicers pane.":::

---

2. On the **District Monthly Sales** page of the report, select the **District Manager** slicer. 

   Because you've already created a **District Manager** slicer on the **Overview** page, the **Sync slicers** pane appears as follows:

   :::image type="content" source="media/power-bi-visualization-slicers/9-sync-slicers.png" alt-text="Screenshot of Sync District Monthly Sales slicer.":::

3. In the **Sync** column of the **Sync slicers** pane, select the **Overview**, **District Monthly Sales**, and **New Stores** pages. 

   This selection causes the **District Monthly Sales** slicer to sync across these three pages. 

4. In the **Visible** column of the **Sync slicers** pane, select the **New Stores** page. 

   This selection causes the **District Monthly Sales** slicer to be visible in these three pages. The **Sync slicers** pane now appears as follows:

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-sync-slicer-finished.png" alt-text="Screenshot of Select pages in Sync slicers.":::

5. Observe the effects of syncing the slicer and making it visible on the other pages. On the **District Monthly Sales** page, notice that the **District Manager** slicer now shows the same selections as on the **Overview** page. On the **New Stores** page, the **District Manager** slicer is now visible and it selections affect the selections that are visible in the **Store Name** slicer.

    >[!TIP]
    >Although the slicer initially appears on the synced pages at the same size and position as on the original page, you can move, resize, and format synced slicers on the various pages independently.

    >[!NOTE]
    >If you sync a slicer to a page but don't make it visible on that page, slicer selections made on the other pages still filter the data on the page.

### Sync separate slicers

You can also sync two or more separate slicers. Syncing slicers is useful when working with composite models, as you might want to make the same selection across sources without relying on cross-source group relationships. To sync two or more separate slicers, you mark them as being part of a group.

1. Make sure the **Sync slicers** pane is visible by selecting it from the **View** menu.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-sync-pane.png" alt-text="Screenshot of Sync slicers pane.":::

1. Select one of the slicers that you want in the group. In the **Sync slicers** pane, expand **Advanced options**, and enter a name for the group. You can name it anything you want.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-slicer-advanced-group.png" alt-text="Screenshot of entering a group name in the Advanced section of the Sync slicers pane.":::

1. Then select another slicer you want to sync with the first, and enter the same name in the **group name** box. Be sure to enter it exactly the same.

1. Make sure to select either **Sync field changes to other slicers**, **Sync filter changes to other slicers** or both depending on your scenario. 

   - If you just want to keep the slicers in sync so filters set by the slicers are kept in sync, select **Sync filter changes to other slicers**. 
   - If you also want to make sure that any changes you make to the field on which the slicers are based get synced across the group, select **Sync field changes to other slicers**.

1. Test that the sync works the way you want by changing the selection in one of the slicers. Observe that it gets updated in the other slicer in the group.

## Filtering slicers

You can apply visual-level filters to slicers to reduce the list of values that are displayed in the slicer. For example you might filter out blank values from a list slicer, or filter out certain dates from a range slicer. When you filter the slicer, it only affects *the values that are shown in the slicer*, not *the filter that the slicer applies to other visuals* when you make a selection. For example, let's say you apply a filter to a range slicer to only show certain dates. The selection on the slicer will only show the first and last dates from that range, but you would still see other dates in your other visuals. Once you change the selected range in the slicer, you'll see the other visuals update. Clearing the slicer would show all the dates again.

For more information on visual-level filters, see [Filter types](../create-reports/power-bi-report-filter-types.md).

## Format slicers

Different formatting options are available, depending on the slicer type. For **Style**, **Vertical list** is the default. Select **Tile** to produce a slicer with tiles or buttons arranged horizontally, and scroll arrows to access items that don't fit in the slicer. By using the **Tile** style with **Responsive** layout, and **Background** coloring, you can produce buttons or tiles rather than standard list items, and make slicer items resize to fit different screen sizes and layouts.  

### Visual options

1. Select the "District Manager" slicer, and select the **Format** icon ![Screenshot of Format icon.](media/power-bi-visualization-slicers/power-bi-format-brush.png) in the **Visualizations** pane.

1. Resize the slicer to be wide but not tall.

1. In the **Format** pane, under **Visual**, expand **Slicer settings** > **Options**, and select **Tile**.

   :::image type="content" source="media/power-bi-visualization-slicers/power-bi-tile-slicer.png" alt-text="Screenshot of Tile slicer.":::

   >[!TIP]
   >Slicer list items are sorted in ascending order, by default. To reverse the sort order to descending, select the ellipsis (**...**) in the top right corner of the slicer > **Sort axis** > **Sort descending**.

1. Expand **Slicer header** and change the **Title text** to "District Manager".

1. Expand **Values** and select a **Background Color**. This color is one of the theme colors, `#abdae5`.

    :::image type="content" source="media/power-bi-visualization-slicers/slicer-tile-color.png" alt-text="Screenshot showing tile slicer with background color.":::

   >[!TIP]
   >  - With the **Tile** style, deselected items show the chosen text and background colors. Selected items use the system default, usually a black background with white text.
   >  - With the **Vertical list** style, items always show the selected colors, and selected check boxes are always black.

### Responsive layout

After you select the Tile style, you can turn **On** the **Responsive** layout to change the size and arrangement of slicer items according to the view screen and slicer size.

:::image type="content" source="media/power-bi-visualization-slicers/responsive-slicer.png" alt-text="Screenshot of selecting responsive layout.":::

Responsive layout is only available for tile slicers and numeric range slicers, not for vertical list slicers. For more information about responsive layouts, see [Create a responsive slicer you can resize](../create-reports/power-bi-slicer-filter-responsive.md).

For range slicers, responsive formatting changes the style of the slider and provides more flexible resizing. Read more about [numeric range slicers](../create-reports/desktop-slicer-numeric-range.md).

### Selection controls

- The **Show "Select all" option** is **Off** by default. Under **Selection**, turn **Show "Select all" option** to **On** to add a **Select all** item to the slicer. With it, you can select or deselect all items as once. When all items are selected, selecting one item deselects it, allowing an *is-not* type of filter.

    :::image type="content" source="media/power-bi-visualization-slicers/slicer-select-all.png" alt-text="Screenshot of adding a Select all option to a slicer.":::

- **Single select** is **Off** by default. Selecting an item selects it. When you hold down the **Ctrl** key, you can select multiple items. Selecting an item again deselects it.

    When you turn **Single select** to **On**, you can't select more than one item at a time. In vertical list slicers, the check boxes become radio buttons.

### Title options

The **Title text** in **Slicer header** is **On** by default. This selection shows the data field name at the top of the slicer. You can edit the title text, which is especially useful for hierarchy slicers. See [Change the title text](../create-reports/power-bi-slicer-hierarchy-multiple-fields.md#change-the-title) in the article "Add multiple fields to a hierarchy slicer" for details.

**Title** on the **General** tab is another option. It's **Off** by default.

### Other formatting options

Other formatting options are **Off** by default. Turn **On** these options to control them:

- **Lock aspect**: Keep the relative height and width of the slicer if it's resized. Under **General** > **Properties** > **Size**.
- **Background**: Add a background color to the slicer and set its transparency. Under **General** > **Effects**.
- **Border**: Add a border around the slicer and set its color. Under **General** > **Effects**.

    There's also a **Border** option on the **Visual** tab. It adds a border either over, under, or next to each option in the slicer. It's separate from and unaffected by the **General** settings.

- **Shadow**: Add a drop shadow to the slider. Under **General** > **Effects**.

## Related content

For more about slicers, see the following articles:

- [Numeric range slicers](../create-reports/desktop-slicer-numeric-range.md)
- [Relative date slicers](desktop-slicer-filter-date-range.md)
- [Relative time slicers](../create-reports/slicer-filter-relative-time.md)
- Responsive, [resizable slicers](../create-reports/power-bi-slicer-filter-responsive.md)
- [Hierarchy slicers](../create-reports/power-bi-slicer-hierarchy-multiple-fields.md) with multiple fields
