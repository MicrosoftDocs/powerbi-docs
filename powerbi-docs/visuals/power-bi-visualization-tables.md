---
title: Table visualizations in Power BI reports and dashboards
description: Learn how to work with table visualizations in Power BI reports and dashboards, including how to resize column widths.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'willt'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 12/22/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Tables in Power BI reports and dashboards

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A table is a grid that contains related data in a logical series of rows and columns. A table can also contain headers and a row for totals. Tables work well with quantitative comparisons where you're looking at many values for a single category. In the following example, the table displays five different measures for the **Category** items, including average prices, year over year sales, and sales goals.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-format.png" alt-text="Screenshot of a table that displays five measures for Category items." border="false":::

Power BI helps you create tables in reports and cross-highlight elements within the table with other visuals on the same report page. You can select rows, columns, and even individual cells, and then cross-highlight the values. You can also copy and paste individual cells and multiple cell selections into other applications.

## When to use a table

Tables are a great choice for several scenarios:

- Represent numerical data by category with multiple measures.

- Display data as a matrix or in a tabular format with rows and columns.

- Review and compare detailed data and exact values rather than visual representations.

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses. If both parties don't have individual Power BI Pro licenses, the report needs to be saved in Premium capacity to enable sharing. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Get the sample

To follow along, download the Retail Analysis sample .pbix file in Power BI Desktop or the Power BI service.

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

You can create a table like the one shown at the beginning of this article and display sales values by item category.

1. On the **Data** pane, expand **Item** and select the **Category** checkbox. Power BI automatically creates a table that lists all the categories in the Retail Analysis Sample semantic model. If you don't see a table visual, use the Visualization section to select the table icon. 

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-icon.png" alt-text="Image of the icon for a table visual." border="false"::: 

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-1.png" alt-text="Screenshot that shows the Category checkbox selected and the default table visual created by Power BI." border="false":::

    This action configures the *Category* data as a field in the **Columns** section on the **Visualizations** pane.
    
    Let's add more categories to the table.

1. Expand **Sales** and select the **Average Unit Price** and **Last Year Sales** checkboxes. Under **Sales**, expand **This Year Sales** and select the checkboxes for all three options: **Value**, **Goal**, and **Status**.

    :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-2.png" alt-text="Screenshot that shows several checkboxes selected in the Data pane and the table visual updated by Power BI." border="false":::

    Power BI adds the selected data as fields to the **Columns** section on the **Visualizations** pane.

1. On the **Visualizations** pane, rearrange the data fields in the **Columns** section to match the order shown in the following image:

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-columns.png" alt-text="Screenshot that shows the reordered table data fields in the Columns section of the Visualizations pane." border="false":::

   To move a column on the **Visualizations** pane, select and hold the field in the **Columns** section. Drag the field to the new location within the order of columns and release the field. The order of the columns in the table updates to match the new order of the fields in the **Columns** section.

## Format the table

There are many ways to format a table. We cover only a few scenarios in this article.

The following steps show how to configure settings and options to adjust the presentation of the table data.

1. On the **Visualizations** pane, select the paintbrush icon to open the **Format** section. Make sure the **Visual** section is selected.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-format-visual.png" alt-text="Screenshot that shows how to access the Format Visual section of the Visualizations pane." border="false":::

1. Try formatting the table grid options.

   1. Expand the **Grid** > **Horizontal gridlines** and **Vertical gridlines** options.

   1. Change the horizontal and vertical gridlines to use a blue **Color**.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-gridlines.png" alt-text="Screenshot that shows table grid options in the Format section of the Visualizations pane." border="false":::

1. Next, try adjusting the column header text.

   1. Expand the **Column headers** > **Text** options.
   
   1. Set the following options:

      - Increase the **Font** size and apply bold (**B**).
      - Change the **Background color**.
      - Adjust the **Header alignment** to _center_ the header text.
      - Turn on **Text wrap** to allow long column headings to display across multiple lines.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-column-headers.png" alt-text="Screenshot that shows table column header options in the Format section of the Visualizations pane." border="false":::

1. You can also format individual columns and headers.

   1. Expand the **Specific column** section.
   
   1. For the **Apply settings to** options, select the specific column to format by using the **Series** drop-down list.

      Let's begin by selecting the column **This Year Sales**.
   
      The data values in the selected column determine the available formatting options. 

   1. Expand the **Values** options, and update some format settings, such as **Text color** and **Background color**.

      :::image type="content" source="media/power-bi-visualization-tables/power-bi-table-specific-column.png" alt-text="Screenshot that shows how to select a specific column to update the formatting options." border="false":::
   
   1. Finally, configure the other **Apply settings to** options to specify how to use the updated settings for the column data.
   
      Let's apply the changes to all **values** in the column and to the row that shows the **total** of value.
      
      :::image type="content" source="media/power-bi-visualization-tables/power-bi-apply-column-format.png" alt-text="Screenshot that shows how to set the Apply settings options to use the formatting changes on the column header, the total row, and all values." border="false":::

1. Practice what you learned by updating another specific column field. 

   1. Update the **This Year Sales Status** column.
   
   1. For the **Values** options, specify _center_ **Alignment**.
   
   1. Configure the **Apply settings to** options to use the updated settings for the cell **values** only.

1. Select **File** > **Save** to save your changes for the table report page.

Here's an example of an updated table:

:::image type="content" source="media/power-bi-visualization-tables/power-bi-table-new-format.png" alt-text="Screenshot that shows the table with updated format settings for text size, color, and wrapping, gridline color, and background shading." border="false":::

Format tables in other ways to complement your configuration options and settings. In the next section, we explore how to apply conditional formatting.

## Use conditional formats

You can add conditional formatting for subtotals and totals in tables. Power BI can apply conditional formatting for totals values to any field in the **Columns** section of the **Visualizations** pane. Use the **Apply settings to** options to specify which table values should use the conditional formatting.

You specify the thresholds or ranges for the conditional formatting rules. For matrices, any **Values** options refer to the lowest visible level of the matrix hierarchy.

With conditional formatting for tables, you can specify icons, URLs, cell background colors, and font colors based on cell values. You can also apply gradient coloring to show value distribution across a numerical range.

### Set background color shading

A common use for conditional table formatting is to change the cell background color based on the corresponding numerical data value. You can set static colors for specific custom values, or instruct Power BI to determine the cell color based on the data value.

The **Background color** option offers a gradient that can range in color from the lowest to highest value for the category. You can configure the color gradient, and specify how to choose the cell background color based on the gradient.

By default, Power BI uses a gradient that spans across two primary colors, from red to green. The **Minimum** value color applies to the lowest value in the range. This value is the darkest shade of red. The **Maximum** value color applies to the highest value in the range. This value is the darkest shade of green. Mid-range values for the category are colored with shades of red or green depending on the specific data value.

Let's modify the background color for a column that has numerical data values.

1. Select the table visual. 

1. On the **Visualizations** pane, expand the drop-down menu for a field under **Columns**. Choose the **Average Unit Price** column.

1. On the menu, select **Conditional formatting** > **Background color**.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-format-background-color.png" alt-text="Screenshot that shows how to open the Conditional formatting menu for a selected column in the Visualizations pane." border="false":::

   The **Background color** dialog opens. 

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-format-background-dialog.png" alt-text="Screenshot that shows the Background color dialog with the color gradient spanning two primary colors, from red to green." border="false":::

1. On the dialog, select the **Add a middle color** option to expose the optional **Center** color value.

   The gradient updates to include the default **Center** color value (yellow). The category values for the column can now be represented with a gradient that spans three primary colors.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-configure-background-color.png" alt-text="Screenshot that shows the Background color dialog with the center or middle value option available for configuration.":::

1. Choose colors for the **Minimum** (lowest) and **Maximum** (highest) values.

1. Choose a color for the **Center** (middle) option for values within the range. 

1. Select **OK** to apply your changes to the specified column.

The following illustration shows how Power BI applies a color gradient to the cells in the **Average Unit Price Last Year** column. In this example, the column data is sorted in descending order, from highest to lowest value.

:::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-format-background-column-updates.png" alt-text="Screenshot that shows how Power BI applies the color gradient to the values in the specified column." border="false":::

### Replace numbers with data bars

You can replace numerical values in the table presentation with **Data bars**. Bars of color that represent data can be easier to scan and analyze than many numerical values.

Power BI shows negative and positive data values in the table by using different bar colors. By default, **Negative** values are shaded red and **Positive** values are shaded green. This approach is similar to the default settings for the **Minimum** and **Maximum** values in the background color gradient.

Each bar is the same height, which is based on the table row cell height. The length of each bar represents the numerical amount of the data. A higher number value is shown with a longer bar compared to other bars in the same column. 

Let's add another column to the table with a field that has both positive and negative data values. We can configure the column data to display as color bars rather than numbers.

1. On the **Data** pane, expand **Sales** and select the **Total Sales Variance** checkbox.
   
   Power BI adds the new field to the **Columns** section of the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-format-add-column.png" alt-text="Screenshot that shows how to add the Total Sales Variance column to the table." border="false":::

1. On the **Visualizations** pane, expand the drop-down menu for the **Total Sales Variance** field under **Columns**, and select **Conditional formatting** > **Data bars**.

1. On the **Data bars** dialog, configure how to apply conditional formatting for the data in the selected column.

   - Choose colors for the **Positive bar** and **Negative bar** options.
   - Select the **Show bar only** option.
   - Make any other changes you'd like.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-configure-data-bars.png" alt-text="Screenshot that shows how to configure data bars for a selected table column." border="false":::

1. Select **OK**.

   Power BI updates the presentation style of the table data. Data bars replace the numerical values for the selected column.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-format-data-bars.png" alt-text="Diagram that shows how Power BI updates the table column to replace numerical values with data bars." border="false":::

### Use visual cues

Another formatting option is to add visual cues to the table with conditional **Icons**. Icons are like data bars. They present information about the data in a more visual manner that's easier to scan and analyze than numbers.

1. On the **Visualizations** pane, expand the drop-down menu for the **This Year Sales** field under **Columns**, and select **Conditional formatting** > **Icons**.

1. On the **Icons** dialog, configure how to use conditional icons to represent the data in the selected column.

   The default presentation uses three different icons based on the numerical value. Each icon represents values for one third of all the values (lowest, middle, and highest) for a range of 33 percentage points. The default position for an icon is to the left of the number within the column.

   - Choose your preferences for **Icon layout**, **Icon alignment**, and **Style**.
   - Configure your desired presentation settings according to the numerical values for the column data. 
   - Make any other changes you'd like.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-configure-icons.png" alt-text="Screenshot that shows how to configure icons to represent data for a selected table column." border="false":::

1. Select **OK**.

   Power BI updates the presentation style of the table data. Icons are added to the left of the numerical values for the selected column.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-conditional-format-icons.png" alt-text="Diagram that shows how Power BI updates the table column to show icons to the left of the numbers in the selected column." border="false":::

For more information about conditional formatting, see [Apply conditional formatting in tables and matrixes](../create-reports/desktop-conditional-table-formatting.md). The article includes ideas for how to format [totals and subtotals](../create-reports/desktop-conditional-table-formatting.md#totals-and-subtotals).

## Copy table values into other applications

Your table or matrix might include content that you'd like to use in other applications, such as Dynamics CRM, Excel, and even other Power BI reports. In Power BI, when you right-click inside a cell, you can copy the data in a single cell or a selection of cells onto your clipboard. You can then paste the clipboard contents into other applications.

### Copy single cell

To copy the value of a single cell:

1. Select the cell to copy.

1. Right-click inside the cell.

1. Select **Copy** > **Copy value** to copy the cell value to your clipboard.

   > [!NOTE]
   > Power BI copies only the data value in the cell. Any formatting applied to the cell value isn't copied.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-value.png" alt-text="Screenshot that shows how to copy a cell value to use in other applications." border="false":::

### Copy multiple cells

To copy the values for more than one cell:

1. Select a contiguous range of cells or use CTRL (+ select) to choose multiple cells that aren't contiguous.

1. Right-click inside a selected cell.

1. Select **Copy** > **Copy selection** to copy the cell values to your clipboard.

   > [!NOTE]
   > Power BI copies the data values in the cells along with any applied formatting.

   :::image type="content" source="media/power-bi-visualization-tables/power-bi-copy-selection.png" alt-text="Screenshot that shows how to copy multiple cell values at the same time to use in other applications." border="false":::

## Adjust column width

Sometimes Power BI truncates a column heading in a report and on a dashboard. To show the entire column name, hover over the space to the right of the heading to reveal the double arrows icon. Select and move the double arrows icon to resize the column.

![Video that shows how to resize a column.](media/power-bi-visualization-tables/resize-table.gif)

## Considerations and troubleshooting

Review the following considerations for working with tables in Power BI.

- When you apply column formatting, you can choose only one alignment method per column: **Auto**, **Left**, **Center**, or **Right**. Usually, a column contains all text or all numbers, and not a mix of values. In cases where a column contains both numbers and text, the **Auto** option aligns left for text and right for numbers. This behavior supports languages where you read left-to-right.

- If text data in table cells or headers contain new line characters, the characters are ignored by default. If you want Power BI to recognize these formatting characters, enable the **Values** > **Values** > **Text wrap** option for the specific element on the **Format** section of the **Visualizations** pane. 

- Power BI calculates the maximum cell size for a table based on the contents of the first 20 columns and the first 50 rows. Content in cells beyond those table dimensions might not be appropriately sized.

## Related content

- Create [tree maps in Power BI](power-bi-visualization-treemaps.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
- Apply [conditional formatting in tables and matrixes](../create-reports/desktop-conditional-table-formatting.md).
