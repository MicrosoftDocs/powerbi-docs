---
title: Matrix visual format settings
description: This document explains all available Format settings for matrix visuals in Power BI Desktop and Power BI Service.
ms.author: juliacawthra
author: JulCsc
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/18/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to understand and learn about all the available Format settings for matrix visuals so that I can effectively and more easily format my matrix visuals in Power BI Desktop and Power BI Service.
---

# Matrix visual format settings

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This detailed guide explores all the format settings available for the matrix visual in Power BI Desktop and the Power BI service. We provide a thorough explanation of the various customization options and features, enabling you to understand all the format settings of the matrix visual. So, if you’re aiming to grasp all the format controls for the matrix visual, this guide supports you in tailoring the visual to meet your specific needs.

Serving as a reference guide, we've listed the multitude of matrix visual customization options at your disposal, enabling you to tailor your data visualization to your specific needs. From layout and style presets, grid settings, and various options for values, to column and row headers, and specific column controls, this document covers every setting for matrix visual formatting, ensuring you can present your data in the most effective and visually appealing way possible.

Whether you’re a seasoned Power BI user or new to data visualization, this document is an invaluable resource for understanding matrix visual formatting in Power BI Desktop and Power BI Service, providing you with a detailed explanation for each setting and control.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

To format and customize your matrix visual in **Power BI Desktop**, select the **Format visual** icon in the **Visualizations Pane** This grants access to the vast array of formatting options under the **Visual** and **General** tabs, enabling you to refine both the appearance and functionality of your matrix visuals.

   :::image type="content" source="../visuals/media/power-bi-visualization-matrix-visual/matrix-visual-format-settings-desktop.png" alt-text="Screenshot of Power BI Desktop showing a formatted matrix visual on the report canvas, with the Visualizations pane, Format visual icon, and Visual and General tabs highlighted." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-format-settings-desktop.png":::

# [Power BI Service](#tab/powerbi-service)

To format and customize your matrix visual in the **Power BI service**, select the **Format visual** icon in the **Visualizations Pane** This grants access to the vast array of formatting options under the **Visual** and **General** tabs, enabling you to refine both the appearance and functionality of your matrix visuals.

   :::image type="content" source="../visuals/media/power-bi-visualization-matrix-visual/matrix-visual-format-settings-service.png" alt-text="Screenshot of Power BI Desktop showing a formatted matrix visual on the report canvas, with the Visualizations pane, Format visual icon, and Visual and General tabs highlighted." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-format-settings-service.png":::

---
> [!NOTE]
> [!INCLUDE [prerequisites-share-your-report](../includes/core-visuals/prerequisites-share-your-report.md)]

## Format settings for matrix visuals

### Layout and style presets

##### Style

The Style setting allows you to choose from a set of predefined styles with unique combinations of colors and formatting that can be applied with a single click to change the overall look of your matrix visual. These styles include:
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
##### Layout

The Layout menu offers three options for customizing the presentation of your data:
- **Compact:** The default space-saving layout where row labels are displayed in a single column, and the hierarchy is represented through indentation, useful for displaying more data in less space.
- **Outline:** Separates each level of the hierarchy into its own column, similar to the way a traditional pivot table displays data, making it easier to read and understand the hierarchy at a glance.
- **Tabular:** Similar to the outline layout but without indentation. Each hierarchy level is still in its own column, but the data is presented in a flat structure.
##### Repeat row headers

This toggle controls whether the row headers are repeated on each page of a paginated report. When enabled, the row headers will appear at the top of each page, which can be particularly useful when you have a matrix that spans multiple pages, ensuring that the context of the data is not lost when moving between pages.

### Grid settings

#### Horizontal gridlines

The **Horizontal gridlines** toggle, when enabled, allows you to add lines horizontally across the chart to improve readability and to visually separate data points, while allowing you to also adjust line color and width.

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-width-1-10](../includes/core-visuals/global-width-1-10.md)]

#### Vertical gridlines

The **Vertical gridlines** toggle, when enabled, allows you to add lines vertically across the chart to improve readability and to visually separate data points, while allowing you to also adjust line color and width.

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-width-1-10](../includes/core-visuals/global-width-1-10.md)]

#### Border

The **Border** settings allow you to customize the appearance of the borders around the matrix and its individual sections, working with the settings as shown here.

##### Selection

This menu allows you to define the borders for different sections of the matrix. Here’s what each option in the Section menu means:
- **All:** This option applies the border settings to the entire matrix, including column headers, row headers, and the values section
- **Column header:** Selecting this option will apply the border settings only to the column headers of the matrix.
- **Row header:** This option will apply the border settings exclusively to the row headers of the matrix.
- **Values section:** This option will apply the border settings only to the area of the matrix where the data values are displayed.
##### Border position

This setting offers four options to specify the position of the Border:
- **Top**
- **Bottom**
- **Left**
- **Right**
[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-width-1-10](../includes/core-visuals/global-width-1-10.md)]

#### Options

The Options menu includes options for row padding and global font size, to adjust the spacing and text size within the matrix visual.

##### Row padding

This setting controls the amount of space between rows, often making the matrix easier to read by adding more white space, while decreasing it can make the matrix more compact.
##### Global font size

This setting changes the font size for all text within the matrix visual. Increasing the font size can improve readability, especially when presenting to an audience or for users with visual impairments, while decreasing it can allow more data to be displayed on the screen.

### Blank rows settings

The **Blank rows** toggle is a feature that allows you to insert blank rows within the matrix to separate higher-level row header categories, potentially enhancing the readability and organization of the report. When enabled, you can further customize the appearance of these rows with the settings as shown here.

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Border

The **Border** settings allow you to customize the appearance of the borders around the matrix and its individual sections, working with the settings as shown here.

##### Border position

This setting offers four options to specify the position of the Border:

- **Top**
- **Bottom**
- **Top and bottom**
[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-width-1-10](../includes/core-visuals/global-width-1-10.md)]

### Values settings

#### Values

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
##### Alternate text color

This setting allows you to customize the color for alternating rows by selecting colors from the color palette.
##### Alternate background color

This setting allows you to customize the color for alternating rows by selecting colors from the color palette.
##### Text wrap

This toggle, when enabled, allows longer text to be displayed on multiple lines within a cell, preventing it from being cut off.

#### Options

##### Switch values to rows

Enabling this toggle will switch the display of your values from columns to rows within the matrix.

### Column headers settings

#### Text

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
##### Header alignment

This setting controls the header alignment, allowing you to choose between left, center, or right.
##### Title alignment

This setting controls the title alignment, allowing you to choose between left, center, or right.
[!INCLUDE [global-text-wrap](../includes/core-visuals/global-text-wrap.md)]

#### Options

[!INCLUDE [column-headers-options-auto-size-width](../includes/core-visuals/column-headers-options-auto-size-width.md)]

### Row headers settings

#### Text

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
##### Banded row color

This toggle, when enabled, extends the color settings from the Values section, and applies the same color format settings to the row headers in your matrix.
[!INCLUDE [global-alignment-text-&-values](../includes/core-visuals/global-alignment-text-&-values.md)]
[!INCLUDE [global-text-wrap](../includes/core-visuals/global-text-wrap.md)]

#### +/- icons

[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
##### Size

With this setting, you can customize the size, offering a range of 8 to 60 pixels.

### Column subtotals settings

The **Column subtotals** toggle allows you to control whether subtotals are displayed for columns in your matrix. When turned on, Power BI calculates and displays subtotals for each column based on the underlying data. Turn off this toggle if you want to hide column subtotals.

#### Apply settings to

##### Per column level

This toggle, when enabled, lets you customize subtotals for individual columns.
##### Column level

Use this menu to set subtotal options for the entire column.

#### Columns

[!INCLUDE [column-&-row-subtotals-show-subtotal](../includes/core-visuals/column-&-row-subtotals-show-subtotal.md)]
[!INCLUDE [column-&-row-subtotals-subtotal-label](../includes/core-visuals/column-&-row-subtotals-subtotal-label.md)]

#### Values

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-apply-to-labels](../includes/core-visuals/global-apply-to-labels.md)]

### Row subtotals settings

The **Row subtotals** toggle allows you to control whether subtotals are displayed for rows in your matrix. When turned on, Power BI calculates and displays subtotals for each row based on the underlying data. Turn off this toggle if you want to hide row subtotals.

#### Apply settings to

##### Per row level

This toggle, when enabled, lets you customize subtotals for individual rows.
##### Row level

Use this menu to set subtotal options for the entire row hierarchy.

#### Rows

[!INCLUDE [column-&-row-subtotals-show-subtotal](../includes/core-visuals/column-&-row-subtotals-show-subtotal.md)]
[!INCLUDE [column-&-row-subtotals-subtotal-label](../includes/core-visuals/column-&-row-subtotals-subtotal-label.md)]
##### Position

This setting allows you to specify the position of the Subtotal labels:
- **Top**
- **Bottom**

#### Values

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-apply-to-labels](../includes/core-visuals/global-apply-to-labels.md)]

### Column grand total settings

#### Values

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-apply-to-labels](../includes/core-visuals/global-apply-to-labels.md)]

### Row grand total settings

#### Values

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-apply-to-labels](../includes/core-visuals/global-apply-to-labels.md)]

### Grand Total Color Behavior

#### Values

If no grand total text color is explicitly defined, the subtotal text color is automatically inherited by the grand total.  
* The grand total text color does **not** support an 'undefined' state.

Similarly, if the grand total background color is not explicitly set, it will **inherit** the background color from the subtotal. 
* Unlike text color, the grand total background color **does** support an 'undefined' option.

> [!NOTE]
> These color inheritance behaviors are currently under review and may change in future versions. Developers are strongly encouraged to **explicitly define** any grand total colors to avoid unintended styling

### Specific column settings

#### Apply settings to

##### Series

This menu allows you to select individual columns (series) within your matrix, and apply specific formatting, allowing you to customize colors, font sizes, or conditional formatting rules for each column separately.
##### Apply to header

When this toggle is enabled, any formatting settings you apply will affect the column headers (the labels at the top of each column). You can adjust font styles, alignment, and other visual properties for the headers.
##### Apply to subtotals

Enabling this toggle will apply formatting settings to the subtotal rows within your matrix. Customize how subtotals are displayed, including font colors, background colors, and font sizes.
##### Apply to total

Similar to subtotals, this option lets you format the total row (if you have one) in your matrix. You can control font styles, colors, and other visual aspects for the total row.
##### Apply to values

When turned on, this toggle applies formatting rules to the actual data values within the matrix cells. You can set up conditional formatting, color scales, or other visual cues based on the data values.

#### Values

[!INCLUDE [global-text-color](../includes/core-visuals/global-text-color.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-alignment-text-&-values](../includes/core-visuals/global-alignment-text-&-values.md)]
###### Display units
##### Display units

The menu offers several options for defining the Display units:

- **None**: Displays the value as is, without any unit.
- **Thousands**: Divides the value by 1,000 and appends a "K" suffix.
- **Millions**: Divides the value by 1,000,000 and appends an "M" suffix.
- **Billions**: Divides the value by 1,000,000,000 and appends a "B" suffix.
- **Trillions**: Divides the value by 1,000,000,000,000 and appends a "T" suffix.
##### Value decimal places

Allows you to specify the number of decimal places for values, with a selectable range from 0 to 15.

### Cell elements settings

#### Apply settings to

##### Series

Allows you to select which data series that you want to apply formatting options to.
##### Background color

This toggle, when enabled, allows you to customize the background color using conditional formatting.
##### Font color

This toggle, when enabled, allows you to customize the font color using conditional formatting.
##### Data bars

This toggle, when enabled, lets you use conditional formatting to create horizontal bars that reflect the magnitude of data points. For example, longer bars for higher values.
##### Icons

This toggle, when enabled, lets you use conditional formatting to add visual indicators from a predefined set of icons or custom icons. For example, an up arrow for positive growth and a down arrow for negative growth.
##### Web URL

This toggle, when enabled, lets you use conditional formatting to embed web URLs, creating clickable links that lead to external websites or internal resources. For instance, link a product name to its detailed page on an internal or external website.

### URL icon settings

##### Values

This toggle, when enabled, lets you to create hyperlinks within individual cells. You can associate a URL field with specific data points for users to navigate to external web pages or resources.
##### Column headers

This toggle, when enabled, lets you replace the column header text with a clickable hyperlink icon. This is useful when you want to link to additional information related to the column or provide context-specific URLs.
##### Row headers

This toggle, when enabled, lets you replace the row header text with a clickable hyperlink icon. Users can click on the icon to access relevant URLs associated with each row.

### Image size settings

##### Height

This setting allows you to define the height of the image, offering a range of 8 to 512 pixels.
##### Width

This setting allows you to define the width of the image, offering a range of 8 to 512 pixels.

## Related content

- [Create a matrix visual in Power BI](power-bi-visualization-matrix-visual.md)
- [Matrix visual considerations and limitations](power-bi-visualization-matrix-visual-considerations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
