---
title: Table visualizations in Power BI reports and dashboards
description: Learn how to work with table visualizations in Power BI reports and dashboards, including how to resize column widths.
author: mihart
ms.author: mihart
ms.reviewer: 'willt'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 02/17/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Tables in Power BI reports and dashboards

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A table is a grid that contains related data in a logical series of rows and columns. It may also contain headers and a row for totals. Tables work well with quantitative comparisons where you're looking at many values for a single category. For example, this table displays five different measures for **Category**.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-gridlines.png" alt-text="Screenshot of a table that displays five different measures for Category.":::

Create tables in reports and cross-highlight elements within the table with other visuals on the same report page. You can select rows, columns, and even individual cells and cross-highlight. You can also copy and paste individual cells and multiple cell selections into other applications.

## When to use a table

Tables are a great choice:

* To see and compare detailed data and exact values (instead of visual representations).

* To display data in a tabular format.

* To display numerical data by categories.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

2. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

3. Browse to the **Retail Analysis Sample PBIX.pbix** file, then select **Open**.

4. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the built-in Retail Analysis Sample in the Power BI service.

1. Open the Power BI service, then select **Get data** in the bottom left corner.

2. On the Get Data page that appears, select **Samples**.

   :::image type="content" source="media/power-bi-visualization-slicers/get-data-samples.png" alt-text="Screenshot of Get Data box with link to samples.":::

3. Select the **Retail Analysis Sample**, and choose **Connect**.

4. Select **Edit** on the menu bar to display the **Visualizations** pane.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Create a table

You can create the table pictured at the beginning of the article to display sales values by item category.

1. From the **Fields** pane, select **Item** > **Category**.

    Power BI automatically creates a table that lists all the categories.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-1.png" alt-text="Screenshot of Fields pane with Category selected.":::

1. Select **Sales > Average Unit Price** and **Sales > Last Year Sales**. Then select **Sales > This Year Sales** and select all three options: **Value**, **Goal**, and **Status**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-2.png" alt-text="Screenshot of Fields pane with other fields selected.":::

1. In the **Visualizations** pane, locate the **Columns** well and rearrange the fields until the order of your chart columns matches the first image on this page.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-3.png" alt-text="Screenshot of fields in the Columns well.":::

## Format the table

There are many ways to format a table. Only a few are covered here. A great way to learn about the other formatting options is to select the paint brush icon to open the **Format** pane.

* Try formatting the table grid. Here you'll add blue grid lines.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-gridlines.png" alt-text="Screenshot of Format pane with gridline options.":::

* For the column headers, change the background color, increase the font size, change the alignment, and turn on text wrap.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-column-headers.png" alt-text="Screenshot of Format pane with Column headers card.":::

* You can even apply formatting to individual columns and column headers. Start by expanding **Specific column** and selecting the column to format from the drop-down. Depending on the column values, **Specific column** lets you set things like: display units, font color, number of decimal places, background, alignment, and more. Once you've adjusted the settings, decide whether to apply those settings to the header and totals row as well.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-column-formatting.png" alt-text="Screenshot of Format pane with Column formatting for This year sales.":::

* After some more formatting, here is our final table.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-format.png" alt-text="Screenshot of table with formatting options so far.":::

There are other ways to format tables too. You can apply conditional formatting for subtotals and totals, by selecting the conditional formatting you want then using the **Apply to** drop-down menu in the conditional formatting advanced controls dialog. You'll have to manually set the thresholds or ranges for your conditional formatting rules, and for matrices the **Values** still refer to the lowest visible level of the matrix hierarchy.

The following section describes conditional formatting you can apply to tables. You can also learn more in the article dedicated to [conditional formatting](../create-reports/desktop-conditional-table-formatting.md). 

### Conditional formatting

Power BI can apply conditional formatting to any of the fields that you added to the **Columns** well of the **Visualizations** pane.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-values.png" alt-text="Screenshot of the Columns well in the Visualization pane.":::

With conditional formatting for tables, you can specify icons, URLs, cell background colors, and font colors based on cell values, including using gradient colors.

1. Select the dropdown next to a field under **Columns**. Then open the **Conditional formatting** card and choose **Background color**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional.png" alt-text="Screenshot of the Conditional formatting card.":::

    If you select the **Add a middle color** option, you can configure an optional **Center** value as well.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-formatting-background.png" alt-text="Screenshot of Background color scales screen.":::

    Let's apply some custom formatting to our Average Unit Price values. Select **Add a middle color**, add some colors, and select **OK**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-formatting-data-background.png" alt-text="Screenshot of the dialog box with background color options.":::

1. Add a new field to the table that has both positive and negative values. Select **Sales > Total Sales Variance** and drag it to the **Columns** well.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-formatting-2.png" alt-text="Screenshot of a new field added to the Columns well.":::

1. Select **Data bars** under **Conditional formatting**.  

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-data-bar-matrix.png" alt-text="Screenshot of the Conditional formatting card with data bars selected.":::

1. In the dialog that appears, set colors for **Positive bar** and **Negative bar**, select the **Show bar only** option, and make any other changes you'd like.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-data-bar.png" alt-text="Screenshot of Data bars options with checkmark for Show bar only.":::

1. Select **OK**.

    Data bars replace the numerical values in the table, making it easier to scan.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-formatting-data-bars.png" alt-text="Screenshot of table data bars displayed in column.":::

1. Add visual cues to your table with conditional icons. Open the **Conditional formatting** card next to **This year sales**, then select **Icons**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-icons.png" alt-text="Screenshot of table with icons added to column.":::

For additional information about conditional formatting, including [totals and subtotals](../create-reports/desktop-conditional-table-formatting.md#totals-and-subtotals), see the article on [conditional formatting](../create-reports/desktop-conditional-table-formatting.md). 


## Copy values from Power BI tables for use in other applications

Your table or matrix may include content that you'd like to use in other applications, like Dynamics CRM, Excel, and even other Power BI reports. In Power BI, when you right-click inside a cell, you can copy the data in a single cell or a selection of cells onto your clipboard, and paste it into the other applications.

To copy the value of a single cell:

1. Select the cell you want to copy.

1. Right-click inside the cell.

1. Select **Copy** > **Copy value** to copy the _unformatted_ cell value to your clipboard.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-value.png" alt-text="Screenshot shows Copy selected with the Copy value option selected.":::

To copy more than a single cell:

1. Select a range of cells or use **Ctrl** to select one or more cells.

1. Right-click inside one of the cells you selected.

1. Select **Copy** > **Copy selection** to copy the _formatted_ cell values to your clipboard.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-selection.png" alt-text="Screenshot shows Copy selected with the Copy selection option selected.":::

## Adjust the column width of a table

Sometimes Power BI will truncate a column heading in a report and on a dashboard. To show the entire column name, hover over the space to the right of the heading to reveal the double arrows, select, and drag.

![video closeup of resizing column](media/power-bi-visualization-tables/resize-table.gif)


## Considerations and troubleshooting

* When applying column formatting, you can only choose one alignment option per column: **Auto**, **Left**, **Center**, **Right**. Usually, a column contains all text or all numbers, and not a mix. In cases where a column contains both numbers and text, **Auto** will align left for text and right for numbers. This behavior supports languages where you read left-to-right.

* If the text data in your table's cells or headers contain new line characters, those characters will be ignored unless you toggle on the 'Word Wrap' option in the element's associated formatting pane card. 

* Power BI calculates maximum cell size based on the first 20 columns and the first 50 rows. Cells beyond those points may not be appropriately sized.


## Next steps

* [Tree maps in Power BI](power-bi-visualization-treemaps.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
* [Apply conditional formatting in tables and matrixes](../create-reports/desktop-conditional-table-formatting.md)