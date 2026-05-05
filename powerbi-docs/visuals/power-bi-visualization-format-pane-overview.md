---
title: Format pane General tab overview
description: Learn about the General tab options in the Format visual pane, including Properties, Title, Effects, Data format, Header icons, Tooltips, and Alt text.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: concept-article
ms.date: 04/24/2026
LocalizationGroup: Visualizations
ai-usage: ai-assisted
---
# Format pane General tab overview

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

When you select a visual in a Power BI report and open the **Format visual** pane, you see two tabs: **Visual** and **General**. The **Visual** tab contains options that apply to the specific visual type, such as data colors and axis labels. The **General** tab contains options that apply to almost every visual, such as size, title, background, and header icons.

This article describes the sections you find on the **General** tab and what each one controls. The exact options and default values vary by visual type and by the version of Power BI you're using.

Many of the formatting options on the **General** tab can also be set across the entire report by using a report theme. A theme lets you apply consistent colors, fonts, padding, borders, and other styles to every visual at once, instead of setting them one visual at a time. For more information, see [Use report themes in Power BI](../create-reports/desktop-report-themes.md).

## Open the General tab

1. In Power BI Desktop or the Power BI service, open a report in editing mode.
1. Select a visual on the report canvas.
1. In the **Visualizations** pane, select the **Format visual** icon (the paint roller).
1. Select the **General** tab.

The **General** tab includes the following sections: **Properties**, **Title**, **Effects**, **Data format**, **Header icons**, **Tooltips**, and **Alt text**.

## Properties

Use **Properties** to control the size, position, and spacing of the visual on the report canvas.

- **Size**: Set the **Height** and **Width** of the visual in pixels. Turn on **Lock aspect ratio** to keep the height-to-width ratio fixed when you resize.
- **Position**: Set the **Horizontal** and **Vertical** position of the visual in pixels from the top-left corner of the canvas.
- **Padding**: Set the space between the visual's outer edge and its content for the top, bottom, left, and right sides.
- **Advanced options**:
  - **Responsive**: When supported by the visual, allows the visual to adapt its layout to different sizes.
  - **Maintain layer order**: Keeps the visual's z-order position when you select it, instead of bringing it to the front.

## Title

Use **Title** to add and format a title, subtitle, divider line, and the spacing around them. Turn the whole **Title** card on or off with the toggle.

- **Title**: Enter the title **Text** or use **fx** to set it conditionally. Choose a semantic **Heading** level for accessibility, set the **Font** family, size, and style (bold, italic, underline), and pick a **Text color** and **Background color**. Set **Horizontal alignment** and toggle **Text wrap**.
- **Subtitle**: Add secondary text below the title with its own text, heading level, font, color, alignment, and wrap settings.
- **Divider**: Show a line between the title area and the visual content. Set the **Color**, **Line style**, and **Width**. Turn on **Ignore padding** to extend the divider across the full width of the visual.
- **Spacing**: Adjust the spacing between the title, subtitle, divider, and plot area.

## Effects

Use **Effects** to style the visual's background and surrounding frame.

- **Background**: Set the fill **Color** and **Transparency** for the area behind the visual.
- **Visual border**: Add a border around the visual. Set the **Color**, **Rounded corners** radius, and **Width**.
- **Shadow**: Add a drop shadow. Set the **Color**, **Offset** (inside or outside), and **Position** relative to the visual.

## Data format

Use **Data format** to override the format string for fields used in the visual without changing the underlying model.

- **Apply settings to**: Select the field you want to format.
- **Format options**: Choose the **Format** to apply to that field, such as a number, currency, percentage, or date format. The available options depend on the data type of the selected field.

**Data format** is especially useful for visual calculations, which don't appear in the **Visual** tab the way fields and measures do. Because visual calculations don't have a per-visual mapping in the **Visual** tab, **Data format** is the place to set how their results display in the visual.

## Header icons

Use **Header icons** to control which icons appear in the visual header when consumers view your report. The visual header is the row of icons that appears at the top of a visual in reading mode and lets users interact with the visual. To hide all header icons on the visual, turn the **Header icons** toggle off. To show specific icons, leave the toggle on and set each icon individually.

- **Colors**: Set the header's **Background**, **Border**, and **Icon** colors, and the overall **Transparency**.
- **Icons**: Specify which icons your report consumers can access. Each icon has its own toggle so you can show only the actions that make sense for your report. Available icons can include:
  - **Visual information**: Shows informational messages about the visual.
  - **Visual warning**: Alerts users to data or configuration warnings.
  - **Visual error**: Indicates an error with the visual.
  - **Drill on dropdown**: Lets users choose the field to drill on.
  - **Drill up**: Moves up one level in a hierarchy.
  - **Drill down**: Turns on drill-down mode.
  - **Show next level**: Replaces the current level with the next level in the hierarchy.
  - **Expand to next level**: Adds the next hierarchy level to the current view.
  - **Pin**: [Pins the visual to a dashboard](../create-reports/service-dashboard-pin-live-tile-from-report.md).
  - **Focus mode**: Opens the visual in focus mode.
  - **See data layout**: Switches between the visual and [the underlying data table](service-reports-show-data.md).
  - **More options**: Opens the **More options (...)** menu.
  - **Filter**: Shows the [filters applied to the visual](../create-reports/power-bi-report-filter.md).
  - **Help tooltip**: Opens a [help tooltip you defined for the visual](../create-reports/desktop-visual-tooltips.md).
  - **Smart narrative**: Generates a [smart narrative summary of the visual](power-bi-visualization-smart-narrative.md).
  - **Copilot summary**: Generates a Copilot summary of the visual.

When you edit a report in the Power BI service, you also see these icons:

- **Comment button**: Lets consumers [add and view comments](../explore-reports/end-user-comment.md) on the visual.
- **Personalize visual**: Lets consumers [change the visual for their own view](../explore-reports/end-user-personalize-visuals.md).
- **Copy icon**: Lets consumers [copy the visual](power-bi-visualization-copy-paste.md) as an image or with data.
- **Set alert button**: Lets consumers [set data alerts](../explore-reports/business-user-set-alerts.md) on supported visuals.

The icons that appear depend on the visual type and the features you've enabled. For example, **Drill up** and **Drill down** only appear on visuals that use a hierarchy.

> [!NOTE]
> Toggle visibility for header icons doesn't change the editing experience. To see the result, publish the report or view it in reading mode.

For more about the visual header and how to enable the modern style, see [Use visual elements in Power BI reports](../create-reports/desktop-visual-elements-for-reports.md).

## Tooltips

Use **Tooltips** to control the tooltip that appears when consumers hover over a data point.

- **Options**: Choose the tooltip **Type**. **Default** uses the built-in tooltip with the visual's fields. **Report page** uses a report page you designed as a tooltip. When you choose **Report page**, select the **Page** to use, or leave it set to **Auto**.
- **Text**: Format the font, color, and labels in the default tooltip.
- **Background**: Set the **Color** and **Transparency** of the tooltip background.
- **Actions**: Turn on actions that consumers can take from the tooltip, such as drill-through.

For more about report page tooltips, see [Create tooltips based on report pages](../create-reports/desktop-tooltips.md).

## Alt text

Use **Alt text** to add a description that screen readers announce when the visual receives focus. Enter a description in the text box, or use **fx** to build a description from a measure or expression so it updates with the data.

For accessibility guidance, see [Design Power BI reports for accessibility](../create-reports/desktop-accessibility-creating-reports.md).

## Considerations and limitations

The **Format visual** pane is available in both Power BI Desktop and the Power BI service, but there can be differences between the two editing experiences. Some options appear only when you edit a report in one environment but not the other, and new options often appear in one experience before the other. If you don't see an option described here, try editing the report in the other environment.

Individual visuals can also have more or fewer options than the ones described in this article. Visual types and custom visuals can each add or remove options on the **General** tab.

## Related content

- [Get started formatting report visualizations](service-getting-started-with-color-formatting-and-axis-properties.md)
- [Customize titles, backgrounds, and legends](power-bi-visualization-customize-title-background-and-legend.md)
- [Use visual elements in Power BI reports](../create-reports/desktop-visual-elements-for-reports.md)
- [Add help tooltips to visuals](../create-reports/desktop-visual-tooltips.md)
- [Design Power BI reports for accessibility](../create-reports/desktop-accessibility-creating-reports.md)
