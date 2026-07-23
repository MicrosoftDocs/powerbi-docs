---
title: Matrix visual format settings in Power BI
description: Explore all matrix visual format settings in Power BI Desktop and Power BI Service. Learn how to customize layouts, grids, headers, subtotals, and more to present your data effectively.
ms.author: juliacawthra
author: JulCsc
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/22/2026
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to understand and learn about all the available Format settings for matrix visuals so that I can effectively and more easily format my matrix visuals in Power BI Desktop and Power BI Service.
ai-usage: ai-assisted
---

# Matrix visual format settings

**Applies to:** [!INCLUDE [applies-to-desktop-service](../includes/applies-to-version/desktop-service.md)]

This guide covers all matrix visual format settings in Power BI Desktop and the Power BI service. Use it to customize layouts, grid settings, column and row headers, subtotals, and more to present your data in the most effective way possible.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

To format and customize your matrix visual in **Power BI Desktop**, select the **Format visual** icon in the **Visualizations Pane**. This selection grants access to the vast array of formatting options under the **Visual** and **General** tabs, enabling you to refine both the appearance and functionality of your matrix visuals.

   :::image type="content" source="../visuals/media/power-bi-visualization-matrix-visual/matrix-visual-format-settings-desktop.png" alt-text="Screenshot of Power BI Desktop showing a formatted matrix visual on the report canvas, with the Visualizations pane, Format visual icon, and Visual and General tabs highlighted." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-format-settings-desktop.png":::

# [Power BI Service](#tab/powerbi-service)

To format and customize your matrix visual in the **Power BI service**, select the **Format visual** icon in the **Visualizations Pane**. This selection grants access to the vast array of formatting options under the **Visual** and **General** tabs, enabling you to refine both the appearance and functionality of your matrix visuals.

   :::image type="content" source="../visuals/media/power-bi-visualization-matrix-visual/matrix-visual-format-settings-service.png" alt-text="Screenshot of Power BI service showing a formatted matrix visual on the report canvas, with the Visualizations pane, Format visual icon, and Visual and General tabs highlighted." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-format-settings-service.png":::

---

> [!NOTE]
> [!INCLUDE [prerequisites-share-your-report](../includes/core-visuals/prerequisites-share-your-report.md)]

## Format settings for matrix visuals

### Layout and style presets

#### Style

Use the Style setting to choose from a set of predefined styles with unique combinations of colors and formatting. To change the overall look of your matrix visual, apply one of these styles with a single click. These styles include:

- **Default**
- **None**
- **Minimal**
- **Bold header**
- **Alternating rows**
- **Contrast alternating rows**
- **Flashy rows**
- **Bold header flashy rows**
- **Sparse**
- **Condensed**

#### Layout

The Layout menu offers three options for customizing the presentation of your data:

- **Compact:** The default space-saving layout where row labels display in a single column. The hierarchy shows through indentation. Use this layout to display more data in less space.
- **Outline:** Each level of the hierarchy appears in its own column. This layout works like a traditional pivot table, so it's easy to read and understand the hierarchy at a glance.
- **Tabular:** Similar to the outline layout but without indentation. Each hierarchy level is still in its own column, but the data is presented in a flat structure.

#### Repeat row headers

This toggle controls whether the row headers repeat on each page of a paginated report. When enabled, the row headers appear at the top of each page. This setting helps maintain context when a matrix spans multiple pages.

### Grid settings

#### Horizontal gridlines

Turn on the **Horizontal gridlines** toggle to add lines horizontally across the chart. These lines improve readability and visually separate data points. You can also adjust the line color and width.

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-width-1-10](../includes/core-visuals/global-width-1-10.md)]

#### Vertical gridlines

Turn on the **Vertical gridlines** toggle to add lines vertically across the chart. These lines improve readability and visually separate data points. You can also adjust the line color and width.

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-width-1-10](../includes/core-visuals/global-width-1-10.md)]

#### Grid border

Use the **Border** settings to customize the appearance of the borders around the matrix and its individual sections.

##### Selection

Use this menu to define the borders for different sections of the matrix. Here's what each option in the Section menu means:

- **All:** Applies the border settings to the entire matrix, including column headers, row headers, and the values section.
- **Column header:** Applies the border settings only to the column headers of the matrix.
- **Row header:** Applies the border settings exclusively to the row headers of the matrix.
- **Values section:** Applies the border settings only to the area of the matrix where the data values are displayed.

##### Grid border position

Choose from four options to specify the position of the border:

- **Top**
- **Bottom**
- **Left**
- **Right**

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-width-1-10](../includes/core-visuals/global-width-1-10.md)]

#### Grid options

The **Options** menu includes options for row padding and global font size. Adjust the spacing and text size within the matrix visual.

##### Row padding

This setting controls the amount of space between rows. It often makes the matrix easier to read by adding more white space. Decreasing it can make the matrix more compact.

##### Global font size

This setting changes the font size for all text within the matrix visual. Increasing the font size can improve readability, especially when presenting to an audience or for users with visual impairments. Decreasing it can allow more data to be displayed on the screen.

### Blank rows settings

Use the **Blank rows** toggle to add blank rows within the matrix. These blank rows separate higher-level row header categories, which can make the report easier to read and better organized. When you turn on this feature, you can customize the appearance of these rows by using the available settings.

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Blank rows border

Use the **Border** settings to customize the appearance of the borders around the matrix and its individual sections.

##### Blank rows border position

Choose from four options to specify the position of the border:

- **Top**
- **Bottom**
- **Top and bottom**

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-width-1-10](../includes/core-visuals/global-width-1-10.md)]

### Values settings

#### Values text and color

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]

##### Alternate text color

Select a color from the palette to customize the color for alternating rows.

##### Alternate background color

Select a color from the palette to customize the color for alternating rows.

##### Text wrap

Turn on this toggle to display longer text on multiple lines within a cell, so the text doesn't get cut off.

#### Values options

##### Switch values to rows

Turn on this toggle to switch the display of your values from columns to rows within the matrix.

### Column headers settings

#### Column headers text

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]

##### Header alignment

This setting controls the header alignment. Choose left, center, or right.

##### Title alignment

This setting controls the title alignment. Choose left, center, or right.
[!INCLUDE [global-text-wrap](../includes/core-visuals/global-text-wrap.md)]

#### Column width

[!INCLUDE [tablix-columns-resize](../includes/core-visuals/tablix-columns-resize.md)]

#### Column headers options

##### Auto expand

Turn on this toggle to automatically expand all column header levels when the visual loads. When disabled, column headers start collapsed and users can expand them manually. For more information, see [Expand and collapse row headers](power-bi-visualization-matrix-visual.md#expand-and-collapse-row-headers).

### Row headers settings

#### Row headers text

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]

##### Banded row color

When you turn on this toggle, it extends the color settings from the Values section, and applies the same color format settings to the row headers in your matrix.
[!INCLUDE [global-alignment-text-values](../includes/core-visuals/global-alignment-text-values.md)]
[!INCLUDE [global-text-wrap](../includes/core-visuals/global-text-wrap.md)]

#### Row headers options

##### Auto expand

Turn on this toggle to automatically expand all row header levels when the visual loads. When disabled, row headers start collapsed and users can expand them manually. For more information, see [Expand and collapse row headers](power-bi-visualization-matrix-visual.md#expand-and-collapse-row-headers).

#### +/- icons

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]

##### Expand/collapse icon size

Use this setting to customize the size, offering a range of 8 to 60 pixels.

### Column subtotals settings

The **Column subtotals** toggle controls whether subtotals appear for columns in your matrix. When you turn it on, Power BI calculates and displays subtotals for each column based on the underlying data. Turn off this toggle if you want to hide column subtotals. To find this setting, select the **Format visual** icon in the **Visualizations** pane, then expand **Column subtotals**.

#### Column subtotals: Apply settings to

##### Per column level

Enable this toggle to customize subtotals for individual columns.

##### Column level

Use this menu to set subtotal options for the entire column.

#### Columns

[!INCLUDE [column-row-subtotals-show-subtotal](../includes/core-visuals/column-row-subtotals-show-subtotal.md)]
[!INCLUDE [column-row-subtotals-subtotal-label](../includes/core-visuals/column-row-subtotals-subtotal-label.md)]

#### Column subtotals text and color

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-apply-to-labels](../includes/core-visuals/global-apply-to-labels.md)]

### Row subtotals settings

The **Row subtotals** toggle controls whether subtotals appear for rows in your matrix. When you turn it on, Power BI calculates and displays subtotals for each row based on the underlying data. Turn off this toggle if you want to hide row subtotals. To find this setting, select the **Format visual** icon in the **Visualizations** pane, then expand **Row subtotals**. Row and column subtotals apply to the matrix visual, which groups data into nested rows and columns. The table visual displays a single grand total row rather than subtotals.

#### Row subtotals: Apply settings to

##### Per row level

When enabled, this toggle lets you customize subtotals for individual rows.

##### Row level

Use this menu to set subtotal options for the entire row hierarchy.

#### Rows

[!INCLUDE [column-row-subtotals-show-subtotal](../includes/core-visuals/column-row-subtotals-show-subtotal.md)]
[!INCLUDE [column-row-subtotals-subtotal-label](../includes/core-visuals/column-row-subtotals-subtotal-label.md)]

##### Subtotal label position

Specify the position of the Subtotal labels:

- **Top**
- **Bottom**

#### Row subtotals text and color

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-apply-to-labels](../includes/core-visuals/global-apply-to-labels.md)]

### Column grand total settings

#### Column grand total text and color

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-apply-to-labels](../includes/core-visuals/global-apply-to-labels.md)]

### Row grand total settings

#### Row grand total text and color

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-apply-to-labels](../includes/core-visuals/global-apply-to-labels.md)]

### Grand total color behavior

#### Grand total color settings

If you don't explicitly define a grand total text color, the grand total automatically inherits the subtotal text color.

- The grand total text color doesn't support an undefined state.

If you don't explicitly set the grand total background color, the grand total inherits the background color from the subtotal.

- Unlike text color, the grand total background color supports an undefined option.

> [!NOTE]
> These color inheritance behaviors are currently under review and might change in future versions. To avoid unintended styling, always **explicitly define** any grand total colors.

### Specific column settings

#### Specific column: Apply settings to

##### Specific column series

Select individual columns (series) within your matrix, and apply specific formatting. Customize colors, font sizes, or conditional formatting rules for each column separately.

##### Apply to header

When you enable this toggle, any formatting settings you apply affect the column headers (the labels at the top of each column). You can adjust font styles, alignment, and other visual properties for the headers.

##### Apply to subtotals

When you enable this toggle, it applies formatting settings to the subtotal rows within your matrix. Customize how subtotals are displayed, including font colors, background colors, and font sizes.

##### Apply to total

Similar to subtotals, this option lets you format the total row (if you have one) in your matrix. You can control font styles, colors, and other visual aspects for the total row.

##### Apply to values

When turned on, this toggle applies formatting rules to the actual data values within the matrix cells. You can set up conditional formatting, color scales, or other visual cues based on the data values.

#### Specific column text and color

[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-alignment-text-values](../includes/core-visuals/global-alignment-text-values.md)]

##### Display units

The menu offers several options for defining the display units:

- **None**: Displays the value as is, without any unit.
- **Thousands**: Divides the value by 1,000 and appends a "K" suffix.
- **Millions**: Divides the value by 1,000,000 and appends an "M" suffix.
- **Billions**: Divides the value by 1,000,000,000 and appends a "B" suffix.
- **Trillions**: Divides the value by 1,000,000,000,000 and appends a "T" suffix.

##### Value decimal places

Specify the number of decimal places for values, with a selectable range from 0 to 15.

### Cell elements settings

#### Cell elements: Apply settings to

##### Cell elements series

Select the data series that you want to apply formatting options to.

##### Background color

When you turn on this toggle, you can customize the background color by using conditional formatting.

##### Font color

When you turn on this toggle, you can customize the font color by using conditional formatting.

##### Data bars

When you turn on this toggle, you can use conditional formatting to create horizontal bars that reflect the magnitude of data points. For example, longer bars for higher values.

##### Icons

When you turn on this toggle, you can use conditional formatting to add visual indicators from a predefined set of icons or custom icons. For example, an up arrow for positive growth and a down arrow for negative growth.

##### Web URL

When you turn on this toggle, you can use conditional formatting to embed web URLs, creating clickable links that lead to external websites or internal resources. For instance, link a product name to its detailed page on an internal or external website.

### URL icon settings

#### URL icon values

When you turn on this toggle, you can create hyperlinks within individual cells. You can associate a URL field with specific data points for users to navigate to external web pages or resources.

#### URL icon: Column headers

When you turn on this toggle, you can replace the column header text with a clickable hyperlink icon. This replacement is useful when you want to link to additional information related to the column or provide context-specific URLs.

#### URL icon: Row headers

When you turn on this toggle, you can replace the row header text with a clickable hyperlink icon. Users can click on the icon to access relevant URLs associated with each row.

### Image size settings

#### Height

Use this setting to define the height of the image, offering a range of 8 to 512 pixels.

#### Width

Use this setting to define the width of the image, offering a range of 8 to 512 pixels.

## Related content

- [Create a matrix visual in Power BI](power-bi-visualization-matrix-visual.md)
- [Matrix visual considerations and limitations](power-bi-visualization-matrix-visual-considerations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
