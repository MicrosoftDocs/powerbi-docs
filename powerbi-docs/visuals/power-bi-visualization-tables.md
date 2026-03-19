---
title: Create and Format Table Visualizations in Power BI
description: Learn how to create, format, and optimize table visualizations in Power BI reports and dashboards, including resizing column widths. Discover best-use scenarios.  
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/01/2025
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
ai-usage: ai-assisted
---

# Create and format table visualizations in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A table is a grid that contains related data in a logical series of rows and columns. A table can also contain headers and a row for totals. Tables work well with quantitative comparisons where you're looking at many values for a single category. In the following example, the table displays five different measures for the **Category** items, including average prices, year over year sales, and sales goals.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-format.png" alt-text="Screenshot of a table that displays five measures for Category items." border="false":::

Power BI helps you create tables in reports and cross-highlight elements within the table with other visuals on the same report page. You can select rows, columns, and even individual cells, then cross-highlight the values. You can also copy and paste individual cells and multiple cell selections into other applications.

## When to use a table

Tables are a great choice for several scenarios:

- Representing numerical data by category with multiple measures.
- Displaying data as a matrix or in a tabular format with rows and columns.
- Reviewing and comparing detailed data and exact values rather than visual representations.

[!INCLUDE[sharing-license-requirements](../includes/share-license-requirements.md)]

## Get the sample

To follow along, download the Retail Analysis sample .pbix file in Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample PBIX file.

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.
1. In Power BI Desktop, select **File** > **Open report**.
1. Browse to and select the **Retail Analysis Sample PBIX** file, then select **Open**.

   The **Retail Analysis Sample PBIX** file opens in report view. 

1. At the bottom, select **+** to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Retail Analysis Sample in the Power BI service.

1. Sign in to the [Power BI service](https://app.powerbi.com).
1. Select **Learn** in the navigation pane.
1. On the **Learning center** page, under **Sample reports**, locate and select the **Retail Analysis Sample** to download it. The sample opens in report view.
1. At the top, select **Edit** to open the Report editor.
1. At the bottom, select **+** to add a new page to the report.

---

## Create a table

You can create a table like the one shown at the beginning of this article and display sales values by item category.

1. On the **Data** pane, expand **Item** and select the **Category** checkbox. Power BI automatically creates a table that lists all the categories in the Retail Analysis Sample semantic model. If you don't see a table visual, use the **Visualizations** pane to select the table icon.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-icon.png" alt-text="Image of the icon for a table visual." border="false":::

    :::image type="content" source="media/power-bi-visualization-tables/table-category.png" alt-text="Screenshot of the Category checkbox selected and the default table visual created by Power BI." border="false":::

    This action configures the *Category* data as a field in the **Columns** section on the **Visualizations** pane.

    Let's add more categories to the table.

1. Expand **Sales** and select the **Average Unit Price** and **Last Year Sales** checkboxes. Under **Sales**, expand **This Year Sales** and select the checkboxes for all three options: **Value**, **Goal**, and **Status**.

    :::image type="content" source="media/power-bi-visualization-tables/table-value-goal-status.png" alt-text="Screenshot of several checkboxes selected in the Data pane and the table visual updated by Power BI." border="false":::

    Power BI adds the selected data as fields to the **Columns** section on the **Visualizations** pane.

1. On the **Visualizations** pane, rearrange the data fields in the **Columns** section to match the order shown in the following image:

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-columns.png" alt-text="Screenshot of the reordered table data fields in the Columns section of the Visualizations pane." border="false":::

   To move a column on the **Visualizations** pane, select and hold the field in the **Columns** section. Drag the field to the new location within the order of columns and release the field. The column order in the table updates to match the new order of the fields in the **Columns** section.

## Format the table

There are many ways to format a table. We cover only a few scenarios in this article.

The following steps show how to configure settings and options to adjust the presentation of the table data.

1. On the **Visualizations** pane, select the **Format your visual** (**paintbrush**) icon to open the **Format** section. Make sure the **Visual** tab is selected.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-format-visual.png" alt-text="Screenshot of how to access the Format Visual section of the Visualizations pane." border="false":::

1. Try formatting the table grid options.
   1. Expand the **Grid** > **Horizontal gridlines** and **Vertical gridlines** options.
   1. Change the horizontal and vertical gridlines to use a blue **Color**.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-gridlines.png" alt-text="Screenshot of table grid options in the Format section of the Visualizations pane." border="false":::

1. Next, try adjusting the column header text.
   1. Expand the **Column headers** > **Text** options.
   1. Set the following options:

      - Increase the **Font** size and apply bold (**B**).
      - Change the **Background color**.
      - Adjust the **Header alignment** to center the header text.
      - Turn on **Text wrap** to allow long column headings to display across multiple lines.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-column-headers.png" alt-text="Screenshot of table column header options in the Format section of the Visualizations pane." border="false":::

1. You can also format individual columns and headers.
   1. Expand the **Specific column** section.
   1. For the **Apply settings to** options, select the specific column to format by using the **Series** drop-down list.

      Let's begin by selecting the column **This Year Sales**.

      The data values in the selected column determine the available formatting options.

   1. Expand the **Values** options and update some settings, such as **Text color** and **Background color**.

      :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-specific-column.png" alt-text="Screenshot of how to select a specific column to update the formatting options." border="false":::

   1. Finally, configure the other **Apply settings to** options to specify how to use the updated settings for the column data.

      Let's apply the changes to all **values** in the column and to the row that shows the **total** of value.

      :::image type="content" source="media/power-bi-visualization-tables/power-bi-apply-column-format.png" alt-text="Screenshot of how to set the Apply settings options to use the formatting changes on the column header, the total row, and all values." border="false":::

1. Practice what you learned by updating another specific column field.
   1. Update the **This Year Sales Status** column.
   1. For the **Values** options, specify *center* **Alignment**.
   1. Configure the **Apply settings to** options to use the updated settings for the cell **values** only.
1. Select **File** > **Save** to save your changes for the table report page.

Here's an example of an updated table:

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-new-format.png" alt-text="Screenshot of the table with updated format settings for text size, color, and wrapping, gridline color, and background shading." border="false":::

Format tables in other ways to complement your configuration options and settings. In the next section, we explore how to apply conditional formatting.

## Use conditional formatting

You can add conditional formatting for subtotals and totals in tables. Power BI can apply conditional formatting for total values to any field in the **Columns** section of the **Visualizations** pane. Use the **Apply settings to** options to specify which table values should use the conditional formatting.

You specify the thresholds or ranges for the conditional formatting rules. For matrices, any **Values** options refer to the lowest visible level of the matrix hierarchy.

With conditional formatting for tables, you can specify icons, URLs, cell background colors, and font colors based on cell values. You can also apply gradient coloring to show value distribution across a numerical range.

For detailed step-by-step instructions on all conditional formatting options for tables, see [Apply conditional formatting in tables and matrices](../create-reports/desktop-conditional-table-formatting.md). The following is a brief overview of the most common options:

- **Background color shading**: Apply a color gradient to cell backgrounds based on numerical values. Configure minimum, maximum, and optional center colors to represent value ranges visually.
- **Data bars**: Replace numerical values with color bars that represent data magnitude, making columns easier to scan at a glance.
- **Icons**: Add visual cues such as arrows or KPI icons next to values to represent data ranges or categories.

## Copy table values into other applications

Your table or matrix might include content that you'd like to use in other applications, such as Dynamics CRM, Excel, and even other Power BI reports. When you right-click inside a cell in Power BI, you can copy the data in a single cell or a selection of cells onto your clipboard. You can then paste the clipboard contents into other applications.

### Copy single cell

To copy the value of a single cell:

1. Select the cell to copy.
1. Right-click inside the cell.
1. Select **Copy** > **Copy value** to copy the cell value to your clipboard.

   > [!NOTE]
   > Power BI copies only the data value in the cell. Any formatting applied to the cell value isn't copied.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-value.png" alt-text="Screenshot of how to copy a cell value to use in other applications." border="false":::

### Copy multiple cells

To copy the values for more than one cell:

1. Select a contiguous range of cells or use CTRL (+ select) to choose multiple cells that aren't contiguous.
1. Right-click inside a selected cell.
1. Select **Copy** > **Copy selection** to copy the cell values to your clipboard.

   > [!NOTE]
   > Power BI copies the data values in the cells along with any applied formatting.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-selection.png" alt-text="Screenshot of how to copy multiple cell values at the same time to use in other applications." border="false":::

## Adjust column width

[!INCLUDE [tablix-columns-resize](../includes/core-visuals/tablix-columns-resize.md)]

## Custom totals (preview)

[!INCLUDE [tablix-custom-totals](../includes/core-visuals/custom-totals.md)]


## Considerations and troubleshooting

Review the following considerations for working with tables in Power BI.

- When you apply column formatting, you can choose only one alignment method per column: **Auto**, **Left**, **Center**, or **Right**. Usually, a column contains all text or all numbers, and not a mix of values. In cases where a column contains both numbers and text, the **Auto** option aligns left for text and right for numbers. This behavior supports languages where you read left-to-right.
- If text data in table cells or headers contain new line characters, the characters are ignored by default. If you want Power BI to recognize these formatting characters, enable the **Values** > **Values** > **Text wrap** option for the specific element on the **Format** section of the **Visualizations** pane.
- Power BI calculates the maximum cell size for a table based on the contents of the first 20 columns and the first 50 rows. Content in cells beyond those table dimensions might not be appropriately sized.

## Related content

- [Treemaps in Power BI](power-bi-visualization-treemaps.md).
- [Matrix visual](power-bi-visualization-matrix-visual.md)
- [Visualizations overview in Power BI](power-bi-visualizations-overview.md).
- [Apply conditional formatting in tables and matrices](../create-reports/desktop-conditional-table-formatting.md).
- [Apply data point limits and strategies by visual type](power-bi-data-points.md).
