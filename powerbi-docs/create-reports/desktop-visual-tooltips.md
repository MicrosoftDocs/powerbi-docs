---
title: Create modern visual tooltips (preview)
description: Modern visual tooltips in Power BI Desktop let you create rich hover-based tooltips for visuals in your reports.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 09/23/2021
LocalizationGroup: Create reports
---

# Create modern visual tooltips (preview)

The public preview of modern visual tooltips includes data point drill actions and updated styling to match your report theme.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example.png" alt-text="Example of a modern visual tooltip.":::

## Video

Sujata demonstrates how the modern visual tooltips work in this video.

[!INCLUDE [video-note-earlier-versions](../includes/video-note-earlier-versions.md)]

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWDRUW]

## Turn on the new tooltips

When you enable this preview, new reports have modern tooltips enabled by default. However, to have the new tooltips in existing reports, you need to enable them for each report.

## [For new reports in Power BI Desktop](#tab/desktop-new)

1. In Power BI Desktop, go to **File** > **Options and settings** > **Options** > **Preview features**.
1. Select the **Modern visual tooltips** checkbox.

    :::image type="content" source="media/desktop-visual-tooltips/power-bi-desktop-preview-visual-tooltip.png" alt-text="Turn on the preview feature for new reports.":::

1. Restart Power BI Desktop.

## [For existing reports in Power BI Desktop](#tab/desktop-existing)

1. Go to **File** > **Options and settings** > **Options** > **Current file** > **Report settings**.
1. Select the checkbox under **Modern visual tooltips**.  

    :::image type="content" source="media/desktop-visual-tooltips/power-bi-desktop-preview-visual-tooltip-existing.png" alt-text="Turn on the preview feature for existing reports":::

## [For reports in the Power BI service](#tab/web)

1. Go to **File** > **Settings**.

    :::image type="content" source="media/desktop-visual-tooltips/power-bi-service-preview-visual-tooltip-first-step.png" alt-text="Turn on the preview feature for reports in web service first step":::

1. Switch the **Modern visual tooltips** toggle on.  

    :::image type="content" source="media/desktop-visual-tooltips/power-bi-service-preview-visual-tooltip-second-step.png" alt-text="Turn on the preview feature for reports in web service second step":::

---

## Drill actions

When you enable these new tooltips, you can drill down and up, and drill through on a data point without having to use the right-click menu or the header for the visual.  

For example, when you hover over the *Word* data point in a bar chart, you have the option to **Drill down** on the data point or **Drill through**. If you select **Drill down**, the visual updates to display the next level in the hierarchy and filter to *Word*.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-drill-down.png" alt-text="Drill down to the next level in the hierarchy.":::

If you select **Drill through**, you see which pages you can drill through to. In this example, choose either the Market Basket Analysis or the Category Details page.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-drill-through.png" alt-text="Drill through to another page in the report.":::

If you select **Market Basket Analysis** in the tooltip, you drill through to the Market Basket Analysis page, filtered to *Word* and any other filters on the source data point.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-drill-through-market-basket.png" alt-text="Drill through to the Market Basket Analysis page.":::

## Updated styling

Once you upgrade to the new tooltips, you may notice an updated styling that is based on the report’s [theme colors](desktop-report-themes.md#setting-structural-colors):

- The background of the tooltips default to the **Background elements**.
- The text and icon color of the tooltips default to the **First-level elements**.
- The separator line and hover color on the tooltip default to the **Secondary background elements**.

For example, this tooltip has the **Default** theme style:  

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example.png" alt-text="Example of a modern visual tooltip with the default theme.":::

Here’s an example with the **Innovate** theme:  

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-innovate.png" alt-text="Example of a modern visual tooltip with the Innovate theme.":::

Here’s an example with the **Frontier** theme:  

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-frontier.png" alt-text="Example of a modern visual tooltip with the Frontier theme.":::

To customize the styling further, you can update the **Tooltip** theme in the **Customize theme** dialog:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-customize-theme.png" alt-text="Customize the tooltip theme in the Customize theme dialog.":::

Additionally, you can format tooltips per visual by customizing the settings in the **Format** pane:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-format-pane.png" alt-text="Customize the tooltip in the Format pane.":::

## Limitations and considerations

Currently, drill actions aren't available in the tooltip for the following scenarios:

- Report page tooltips
- AppSource visuals (custom visuals)
- Matrix visuals
- Line charts
- Area charts
- Stacked area charts
- Decomposition trees

We currently don't have visual-level control to turn on or off the drill actions for the tooltips. You can enable or disable this capability for a whole report.

## Next steps

For more information about features that are similar or interact with report tooltips, take a look at the following articles:

* [Create tooltips based on report pages in Power BI Desktop](desktop-tooltips.md)
* [Use drillthrough in Power BI Desktop](desktop-drillthrough.md)
