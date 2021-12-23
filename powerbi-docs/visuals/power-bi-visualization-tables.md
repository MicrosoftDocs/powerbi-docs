---
title: Table visualizations in Power BI reports and dashboards
description: Tutorial for working with table visualizations in Power BI reports and dashboards, including how to resize column widths.
author: mihart
ms.author: mihart
ms.reviewer: 'willt'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 09/24/2021
LocalizationGroup: Visualizations
---

# Tables in Power BI reports and dashboards

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A table is a grid that contains related data in a logical series of rows and columns. It may also contain headers and a row for totals. Tables work well with quantitative comparisons where you're looking at many values for a single category. For example, this table displays five different measures for **Category**.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-grid3.png" alt-text="Screenshot of a table that displays five different measures for Category.":::

Create tables in reports and cross-highlight elements within the table with other visuals on the same report page. You can select rows, columns, and even individual cells and cross-highlight. You can also copy and paste individual cells and multiple cell selections into other applications.

## When to use a table

Tables are a great choice:

* To see and compare detailed data and exact values (instead of visual representations).

* To display data in a tabular format.

* To display numerical data by categories.

## Prerequisite

This tutorial uses the [Retail Analysis sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. From the upper left section of the menubar, select **File** > **Open report**
   
1. Find your copy of the **Retail Analysis sample PBIX file**

1. Open the **Retail Analysis sample PBIX file** in report view :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::.

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Create a table

You'll create the table pictured at the beginning of the article to display sales values by item category.


1. From the **Fields** pane, select **Item** > **Category**.

    Power BI automatically creates a table that lists all the categories.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table1.png" alt-text="Result of adding Category.":::

1. Select **Sales > Average Unit Price** and **Sales > Last Year Sales**

1. Then select **Sales > This Year Sales** and select all three options: **Value**, **Goal**, and **Status**.

1. In the **Visualizations** pane, locate the **Values** well and select the values until the order of your chart columns matches the first image on this page. Drag the values in the well if needed. Your **Values** well will look like this:

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table2.png" alt-text="Values well.":::

## Format the table

There are many ways to format a table. Only a few are covered here. A great way to learn about the other formatting options is to open the **Format** pane (paint roller icon :::image type="icon" source="media/power-bi-visualization-tables/power-bi-format.png":::) and explore.

* Try formatting the table grid. Here you'll add a blue vertical grid, add space to the rows, and increase the outline and text size.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-gridnew.png" alt-text="Grid card.":::

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-grid3.png" alt-text="Table showing results":::

* For the column headers, change the background color, add an outline, increase the font size, change the alignment, and turn word wrap on.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-column-headers.png" alt-text="Column headers card.":::

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-column2.png" alt-text="Headers formatting in table.":::

* You can even apply formatting to individual columns and column headers. Start by expanding **Field formatting** and selecting the column to format from the drop-down. Depending on the column values, **Field formatting** lets you set things like: display units, font color, number of decimal places, background, alignment, and more. Once you've adjusted the settings, decide whether to apply those settings to the header and totals row as well.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-field-formatting.png" alt-text="Field formatting for This year sales.":::

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-field-formatting-1.png" alt-text="Field formatting for This year sales in the table.":::

* After some additional formatting, here is our final table.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-format.png" alt-text="Table with all formatting so far.":::

### Conditional formatting

*Conditional formatting* is one type of formatting. Power BI can apply conditional formatting to any of the fields that you added to the **Values** well of the **Visualizations** pane.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-values.png" alt-text="Visualization pane.":::

With conditional formatting for tables, you can specify icons, URLs, cell background colors, and font colors based on cell values, including using gradient colors.

1. In the **Format** pane, open the **Conditional formatting** card.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional.png" alt-text="Conditional formatting card.":::

1. Select a field to format, and turn the slider for **Background color** to On. Power BI applies a gradient based on the values in the column. To change the default colors, select **Advanced controls**.

    If you select the **Diverging** option, you can configure an optional **Center** value as well.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-formatting-background2.png" alt-text="Background color scales screen.":::

    Let's apply some custom formatting to our Average Unit Price values. Select **Diverging**, add some colors, and select **OK**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-formatting-data-background.png" alt-text="Table showing diverging colors.":::

1. Add a new field to the table that has both positive and negative values. Select **Sales > Total Sales Variance**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-formatting2.png" alt-text="Shows a new field far right.":::

1. Add data bar conditional formatting by turning the **Data bars** slider to On.  

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-data-bar-matrix.png" alt-text="Conditional formatting card with data bars set to On.":::

1. To customize the data bars, select **Advanced controls**. In the dialog that appears, set colors for **Positive bar** and **Negative bar**, select the **Show bar only** option, and make any other changes you'd like.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-data-bar.png" alt-text="Checkmark for Show bar only.":::

1. Select **OK**.

    Data bars replace the numerical values in the table, making it easier to scan.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-formatting-data-bars2.png" alt-text="Same table but with bars in last column.":::

1. Add visual cues to your table with *conditional icons*.  In the **Conditional formatting** card, select **This year sales** from the dropdown. Turn the **Icons** slider to **On**.  To customize the icons, select **Advanced controls**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-icons.png" alt-text="Table with Icons added.":::


## Copy values from Power BI tables for use in other applications

Your table or matrix may have content that you'd like to use in other applications, like Dynamics CRM, Excel, and even other Power BI reports. In Power BI, when you right-click inside a cell, you can copy the data in a single cell or a selection of cells onto your clipboard, and paste it into the other applications.

To copy the value of a single cell:

1. Select the cell you want to copy.

1. Right-click inside the cell.

1. Select **Copy** > **Copy value**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-value.png" alt-text="Screenshot shows Copy selected with the Copy value option selected.":::

    With the unformatted cell value on your clipboard, you can paste it into another application.

To copy more than a single cell:

1. Select a range of cells or use **Ctrl** to select one or more cells.

1. Right-click inside one of the cells you selected.

1. Select **Copy** > **Copy selection**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-selection.png" alt-text="Screenshot shows Copy selected with the Copy selection option selected.":::

## Adjust the column width of a table

Sometimes Power BI will truncate a column heading in a report and on a dashboard. To show the entire column name, hover over the space to the right of the heading to reveal the double arrows, select, and drag.

![video closeup of resizing column](media/power-bi-visualization-tables/resizetable.gif)


## Considerations and troubleshooting

* When applying column formatting, you can only choose one alignment option per column: **Auto**, **Left**, **Center**, **Right**. Usually, a column contains all text or all numbers, and not a mix. In cases where a column contains both numbers and text, **Auto** will align left for text and right for numbers. This behavior supports languages where you read left-to-right.

* If the text data in your table's cells or headers contain new line characters, those characters will be ignored unless you toggle on the 'Word Wrap' option in the element's associated formatting pane card. 

* Power BI calculates maximum cell size based on the first twenty columns and the first fifty rows. Cells beyond those points may not be appropriately sized.


## Next steps

* [Tree maps in Power BI](power-bi-visualization-treemaps.md)

* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
