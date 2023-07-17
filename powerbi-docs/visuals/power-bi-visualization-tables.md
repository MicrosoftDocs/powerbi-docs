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
ms.date: 07/18/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Tables in Power BI reports and dashboards

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A table is a grid that contains related data in a logical series of rows and columns. A table can also contain headers and a row for totals. Tables work well with quantitative comparisons where you're looking at many values for a single category. In the following example, the table displays five different measures for **Category**.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-gridlines.png" alt-text="Screenshot of a table that displays five different measures for Category.":::

Create tables in reports and cross-highlight elements within the table with other visuals on the same report page. You can select rows, columns, and even individual cells, and cross-highlight the values. You can also copy and paste individual cells and multiple cell selections into other applications.

## When to use a table

Tables are a great choice for several scenarios:

- Review and compare detailed data and exact values (instead of visual representations).

- Display data in a tabular format.

- Represent numerical data by categories.

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses or the report needs to be saved in Premium capacity. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Prerequisites

Review the following prerequisites for using tables in Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample PBIX file.

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Retail Analysis Sample PBIX** file, and then select **Open**.

   The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Retail Analysis Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Retail Analysis Sample** to download it. The sample opens in report view.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-retail-analysis-sample.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="media/power-bi-visualization-tables/power-bi-retail-analysis-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

## Create a table

You can create the table shown at the beginning of this article and display sales values by item category.

1. On the **Data** pane, expand **Item** and select the **Category** checkbox. Power BI automatically creates a table that lists all the categories.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-1.png" alt-text="Screenshot that shows the Category checkbox selected and the default table visual created by Power BI." border="false":::

    This action configures the *Category* data as a **Column** for the table on the **Visualizations** pane.
    
    Let's add more categories to the table.

1. Expand **Sales** and select the **Average Unit Price** and **Last Year Sales** checkboxes. Under **Sales**, expand **This Year Sales** and select the checkboxes for all three options: **Value**, **Goal**, and **Status**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-2.png" alt-text="Screenshot that shows several checkboxes selected in the Data pane and the table visual updated by Power BI." border="false":::

    Power BI adds the selected data items to the **Column** sections for the table on the **Visualizations** pane.

1. On the **Visualizations** pane, rearrange the data fields in the **Columns** section to match the order shown in the following image:

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-3.png" alt-text="Screenshot that shows the ordered table data fields in the Columns section of the Visualizations pane." border="false":::

   To move a column on the **Visualizations** pane, select and hold the field in the **Column** section. Drag the field to the new location within the order of columns and then release the field. The order of the columns in the table visual updates to match the new order of the fields in the **Column** section.

## Format the table

There are many ways to format a table. We cover only a few scenarios in this article. A great way to learn about other formatting options is to select the paint brush icon at the top of the **Visualizations** pane to open the **Format** section.

1. Try formatting the table **Grid** options.

   - Change the **Horizontal gridlines** and **Vertical gridlines** to use a blue **Color**.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-gridlines.png" alt-text="Screenshot that shows table grid options in the Format section of the Visualizations pane." border="false":::

1. Next, try adjusting the **Column headers** > **Text** options.

   - Increase the **Font** size and apply bold (**B**).
   - Change the **Background color**.
   - Adjust the **Header alignment** to center the header text.
   - Turn on **Text wrap** to allow long headings to display across multiple lines.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-column-headers.png" alt-text="Screenshot that shows table column header options in the Format section of the Visualizations pane." border="false":::

1. You can also format individual columns and headers by configuring options in the **Specific column** section.

   1. To start, expand **Specific column** and select the column to format from the drop-down list.
   
      The data values in the selected column determine the available formatting options. In this example, we update formatting for the _This Year Sales_ column.

      :::image type="content" source="media/power-bi-visualization-tables/power-bi-column-formatting.png" alt-text="Screenshot that shows how to select the This year sales column to update the formatting options." border="false":::

   1. Update some format settings, such as font color, background, alignment, and so on.
   
   1. After you adjust the settings, toggle the options in the **Apply settings to** section to specify how to apply the updated settings.
   
      You can update all values in the column, the column header, and also the total row.
      
      :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-apply-format-options.png" alt-text="Screenshot that shows how to set the Apply settings options to use the formatting changes on the column header, the total row, and all values." border="false":::

There are other ways to format tables in addition to modifying settings. In the next section, we'll take a look at how to apply *conditional formatting*. For more information, see [Apply conditional formatting in tables and matrixes](../create-reports/desktop-conditional-table-formatting.md). 

### Conditional formatting

You can add conditional formatting for subtotals and totals in tables. Power BI can apply conditional formatting to any field in the **Columns** section of the **Visualizations** pane.

You configure and apply conditional formatting with the **Apply settings to** drop-down list in the Conditional Formatting Advanced Controls dialog. You specify the thresholds or ranges for the conditional formatting rules. For matrices, the **Values** continue to refer to the lowest visible level of the matrix hierarchy.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-values.png" alt-text="Screenshot of the Columns well in the Visualization pane.":::

With conditional formatting for tables, you can specify icons, URLs, cell background colors, and font colors based on cell values, including using gradient colors.

1. On the **Visualizations** pane, expand the drop-down list for a field under **Columns**. In this example, we update conditional formatting for the _Average Unit Price_ column.

1. Select **Conditional formatting** > **Background color**.

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

For more information about conditional formatting, including [totals and subtotals](../create-reports/desktop-conditional-table-formatting.md#totals-and-subtotals), see the article on [conditional formatting](../create-reports/desktop-conditional-table-formatting.md). 


## Copy table values into other applications

Your table or matrix might include content that you'd like to use in other applications, such as Dynamics CRM, Excel, and even other Power BI reports. In Power BI, when you right-click inside a cell, you can copy the data in a single cell or a selection of cells onto your clipboard. You can then paste the clipboard contents into the other applications.

### Copy single cell

To copy the value of a single cell:

1. Select the cell to copy.

1. Right-click inside the cell.

1. Select **Copy** > **Copy value** to copy the _unformatted_ cell value to your clipboard.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-value.png" alt-text="Screenshot shows Copy selected with the Copy value option selected.":::

### Copy multiple cells

To copy the values in more than one cell:

1. Select a contiguous range of cells, or use CTRL (+ select) to select multiple cells that aren't contiguous.

1. Right-click inside a selected cell.

1. Select **Copy** > **Copy selection** to copy the _formatted_ cell values to your clipboard.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-selection.png" alt-text="Screenshot shows Copy selected with the Copy selection option selected.":::

## Adjust table column width

Sometimes Power BI truncates a column heading in a report and on a dashboard. To show the entire column name, hover over the space to the right of the heading to reveal the double arrows icon. Select and move the double arrows icon to resize the column.

![Video that shows how to resize a column.](media/power-bi-visualization-tables/resize-table.gif)

## Considerations and troubleshooting

Review the following considerations for working with tables in Power BI.

- When you apply column formatting, you can choose only one alignment method per column: **Auto**, **Left**, **Center**, and **Right**. Usually, a column contains all text or all numbers, and not a mix of values. In cases where a column contains both numbers and text, the **Auto** option aligns left for text and right for numbers. This behavior supports languages where you read left-to-right.

- If text data in table cells or headers contain new line characters, the characters are ignored by default. If you want Power BI to recognize these formatting characters, enable the **Values** > **Values** > **Text wrap** option for the specific element on the **Format** section of the **Visualizations** pane. 

- Power BI calculates the maximum cell size for a table based on the contents of the first 20 columns and the first 50 rows. Content in cells beyond those table dimensions might not be appropriately sized.

## Next steps

- Create [tree maps in Power BI](power-bi-visualization-treemaps.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
- Apply [conditional formatting in tables and matrixes](../create-reports/desktop-conditional-table-formatting.md).