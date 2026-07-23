---
title: Customize Power BI Visualization Titles
description: "Learn how to customize Power BI visualization titles, backgrounds, and legends. Discover formatting options in the Format pane to style your reports."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.custom: pbibetadocbug, intro-get-started
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 04/12/2026
ai-usage: ai-assisted
LocalizationGroup: Visualizations
---

# Customize Power BI visualization titles

**Applies to:** [!INCLUDE [applies-to-desktop-service](../includes/applies-to-version/desktop-service.md)]

All Power BI visuals have title and subtitle elements you can configure, along with other formatting options like backgrounds, borders, and shadows. You can find these settings in the **General** tab of the Format pane. For a complete overview of all options in the **General** tab, see [Format pane General tab overview](power-bi-visualization-format-pane-overview.md).

To maintain consistency across your visuals and reports, consider adjusting title styles in a report theme. When you define title formatting in a theme, all existing visuals update to match, and new visuals inherit those styles automatically. For more information, see [Visual defaults in Power BI reports](../create-reports/power-bi-reports-visual-defaults.md).

## Customize visualization titles in reports

The **Title** section of the **General** tab includes options for the title, subtitle, divider, and spacing.

To access these settings, select a visual. In the **Visualizations** pane, select the paint brush icon. Expand the **General** > **Title** section.

### Title and subtitle text

By default, Power BI generates the title text based on the fields you include in the visual. You can replace this auto-generated text with your own custom title, or remove the title entirely by toggling the **Title** switch off.

Both the title and subtitle support:

- **Text wrap**: Enable text wrap to allow longer titles to display on multiple lines.
- **Horizontal alignment**: Align the text to the left, center, or right of the visual.
- **Font formatting**: Set the font family, size, color, and style (bold, italic, underline).
- **Background color**: Add a background color behind the title text.

You can also conditionally format the title and subtitle text to make them dynamic and responsive to user selections. For example, you can create a title that updates based on slicer selections or filter context. For detailed instructions, see [Expression-based titles in Power BI Desktop](../create-reports/desktop-conditional-format-visual-titles.md).

### Divider and spacing

Add a divider line between the title and subtitle area and the plot area of the visual:

- **Divider**: Turn on to display a horizontal line that separates the title block from the visual content. You can customize the divider color and width.
- **Space above plot area**: Controls the spacing between the title block and the plot area. This setting works whether you use a subtitle and divider, either one, or neither, keeping the space under the title block consistent across configurations.
- **Space above subtitle**: Adjusts the gap between the title and the subtitle.
- **Space above divider**: When you enable a divider, this option appears and lets you adjust the space above the divider line.

> [!NOTE]
> Before the July 2026 release, **Space between label and value** or **Space below title**, **Space below subtitle**, and **Space below divider** controlled the spacing in the title when the **Customize spacing** toggle was enabled. Reports and themes automatically adjust to the new spacing settings without impacting the appearance of your visuals.

To revert all of the changes, select **Reset to default** at the bottom of the **Title** section.

## Customize visualization backgrounds

Add a background color to the plot area of your visual to help it stand out on the report canvas or to match your organization's branding.

To access background settings, select a visual. In the **Visualizations** pane, select the paint brush icon. Expand **General** > **Effects** > **Background**.

- **Background**: Turn on to enable a background color behind the visual's plot area.
- **Color**: Choose a color from the color picker.
- **Transparency**: Adjust the transparency level to control how much of the report canvas shows through the background.

To revert all of the changes, select **Reset to default** at the bottom of the **Background** section.

## Customize visualization legends

Many visuals include a legend to help readers understand what different colors or shapes represent. You can customize the legend's appearance and position to better fit your report design.

To access legend settings, select a visual that has a legend. In the **Visualizations** pane, select the paint brush icon. Expand **Visual** > **Legend**.

- **Legend**: Turn on to display the legend. When off, the legend is hidden.
- **Title**: Turn on to display a title above the legend items. Enter custom text in the **Title text** field.
- **Position**: Choose where to place the legend relative to the visual (top, bottom, left, right, or variations like top center).
- **Color**: Set the text color for legend labels.
- **Font**: Customize the font family, size, and style.

To revert all of your changes, select **Reset to default** at the bottom of the **Legend** section.

## Related content

- [Format pane General tab overview](power-bi-visualization-format-pane-overview.md)
- [Visual defaults in Power BI reports](../create-reports/power-bi-reports-visual-defaults.md)
- [Expression-based titles in Power BI Desktop](../create-reports/desktop-conditional-format-visual-titles.md)
- [Conditional formatting in Power BI visuals](power-bi-visualization-conditional-formatting.md)
- [Customize X-Axis and Y-Axis properties](power-bi-visualization-customize-x-axis-and-y-axis.md)
- [Tips and tricks for color formatting in reports](service-tips-and-tricks-for-color-formatting.md)
- [Use report themes in Power BI](../create-reports/desktop-report-themes.md)
