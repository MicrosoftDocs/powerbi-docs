---
title: Create modern visual tooltips (preview)
description: Learn how modern visual tooltips in Power BI Desktop let you create rich hover-based tooltips for visuals in your reports.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/01/2023
LocalizationGroup: Create reports
---

# Create modern visual tooltips (preview)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The public preview of modern visual tooltips includes data point drill actions and updated styling to match your report theme.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example.png" alt-text="Screenshot of an example of a modern visual tooltip.":::

## Video

Sujata demonstrates how the modern visual tooltips work in this video.

[!INCLUDE [video-note-earlier-versions](../includes/video-note-earlier-versions.md)]

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWDRUW]

## Turn on the new tooltips

When you enable this preview, new reports have modern tooltips enabled by default. However, to have the new tooltips in existing reports, you need to enable them for each report.

## [For new reports in Power BI Desktop](#tab/desktop-new)

1. In Power BI Desktop, go to **File** > **Options and settings** > **Options** > **Preview features**.
1. Select the **Modern visual tooltips** checkbox.

    :::image type="content" source="media/desktop-visual-tooltips/power-bi-desktop-preview-visual-tooltip.png" alt-text="Screenshot of the Options dialog, highlighting Modern visual tooltips.":::

1. Restart Power BI Desktop.

## [For existing reports in Power BI Desktop](#tab/desktop-existing)

1. Go to **File** > **Options and settings** > **Options** > **Current file** > **Report settings**.
1. Select the checkbox under **Modern visual tooltips**.

    :::image type="content" source="media/desktop-visual-tooltips/power-bi-desktop-preview-visual-tooltip-existing.png" alt-text="Screenshot of the Options dialog, highlighting the Modern visual tooltips checkbox.":::

## [For reports in the Power BI service](#tab/web)

1. Go to **File** > **Settings**.

    :::image type="content" source="media/desktop-visual-tooltips/power-bi-service-preview-visual-tooltip-first-step.png" alt-text="Screenshot of the File dropdown menu, highlighting Settings.":::

1. Switch the **Modern visual tooltips** toggle on.

    :::image type="content" source="media/desktop-visual-tooltips/power-bi-service-preview-visual-tooltip-second-step.png" alt-text="Screenshot of the Settings dialog, highlighting the Modern visual tooltip toggle." lightbox="media/desktop-visual-tooltips/power-bi-service-preview-visual-tooltip-second-step.png":::

---

## Drill actions

When you enable these new tooltips, you can drill down and up, and drill through on a data point without having to use the right-click menu or the header for the visual.

For example, when you hover over the *Word* data point in a bar chart, you can **Drill down** on the data point or **Drill through**. If you select **Drill down**, the visual updates to display the next level in the hierarchy and filter to *Word*.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-drill-down.png" alt-text="Screenshot of a tooltip, highlighting Drill down.":::

If you select **Drill through**, you see which pages you can drill through to. In this example, choose either the Market Basket Analysis or the Category Details page.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-drill-through.png" alt-text="Screenshot of a tooltip, highlighting Drill through options.":::

If you select **Market Basket Analysis** in the tooltip, you drill through to the Market Basket Analysis page, filtered to *Word* and any other filters on the source data point.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-drill-through-market-basket.png" alt-text="Screenshot of the drill through to the Market Basket Analysis page." lightbox="media/desktop-visual-tooltips/power-bi-visual-tooltip-drill-through-market-basket.png":::

## Updated styling

Once you upgrade to the new tooltips, you might notice an updated styling that's based on the report’s [theme colors](desktop-report-themes.md#set-structural-colors):

- The background of the tooltips default to the **Background elements**.
- The text and icon color of the tooltips default to the **First-level elements**.
- The separator line and hover color on the tooltip default to the **Secondary background elements**.

For example, this tooltip has the **Default** theme style:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example.png" alt-text="Screenshot of a modern visual tooltip with the default theme.":::

Here’s an example with the **Innovate** theme:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-innovate.png" alt-text="Screenshot a modern visual tooltip with the Innovate theme.":::

Here’s an example with the **Frontier** theme:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-frontier.png" alt-text="Screenshot of a modern visual tooltip with the Frontier theme.":::

To customize the styling further in Power BI Desktop, you can update the **Tooltip** theme in the **Customize theme** dialog:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-customize-theme.png" alt-text="Screenshot of the Customize theme dialog, showing Tool tip customizations.":::

Additionally, you can format tooltips per visual by customizing the settings in the **Format** pane:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-desktop-visual-tooltip-format.png" alt-text="Screenshot of the Visualizations Pane's Tooltips dropdown menu.":::

## Considerations and limitations

Drill actions aren't available in the tooltip for the following scenarios:

- Report page tooltips
- AppSource visuals (custom visuals)
- Decomposition trees

We don't have visual-level control to turn on or off the drill actions for the tooltips. You can enable or disable this capability for a whole report.

## Related content

* [Create tooltips based on report pages](desktop-tooltips.md)
* [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
