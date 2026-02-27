---
title: Create Visual Tooltips
description: Learn how modern visual tooltips in Power BI Desktop and Power BI service let you create rich hover-based tooltips with drill actions and theme-based styling for visuals in your reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/13/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
---

# Create visual tooltips

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Visual tooltips in Power BI improve usability, accessibility, and interactivity across visuals. Starting in January 2026, modern visual tooltips are the default for new reports, with theme-based styling and the **Actions** footer enabled. Existing reports keep their current tooltip settings.

When you hover over a visual data point, a tooltip shows the field name and value. By default, the tooltip displays the fields used in the visual. You can show more fields in the tooltip by adding them to the visual's **Tooltip** field well. If a visual has these actions available, the tooltip also provides actions like [drill down and drill through](../paginated-reports/report-design/drillthrough-drilldown-subreports-nested-data-regions.md).

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example.png" alt-text="Screenshot of an example of a modern visual tooltip.":::

You can turn off the tooltip for any visual in the visual formatting options. If you want full control of a visual tooltip, you can create a [visual tooltip report page](desktop-tooltips.md) to use instead of the default tooltip.

## Actions footer

The optional tooltip **Actions** footer shows drill down and up, along with drill through on a data point, without needing to use the right-click menu or the header icons for the visual.

:::image type="content" source="media/desktop-visual-tooltips/drill-down-and-through-tooltips.png" alt-text="Screenshot of the Actions footer with the Drill down and Drill through options outlined.":::

For example, when you hover over the **word** data point in a bar chart, you can **Drill down** on the data point or **Drill through**. If you select **Drill down**, the visual updates to display the next level in the hierarchy and filter to **Word**. If you select **Drill through**, you see which pages you can drill through to. In this example, choose either the **Market Basket Analysis** or the **Category details** page.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-drill-through.png" alt-text="Screenshot of a tooltip with Drill through options highlighted.":::

If you select **Market Basket Analysis** in the tooltip, you drill through to the Market Basket Analysis page, filtered to *Word* and any other filters on the source data point.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-drill-through-market-basket.png" alt-text="Screenshot of the drill through to the Market Basket Analysis page." lightbox="media/desktop-visual-tooltips/power-bi-visual-tooltip-drill-through-market-basket.png":::

### Upgrade tooltips in existing reports

If an existing report doesn't use modern visual tooltips, a dialog appears when you open the report asking if you want to upgrade.

- Select **Upgrade to modern defaults** to update all visuals in your report with the **Actions** footer enabled.
- Select **Use old tooltips** to keep the tooltips unchanged.

You can also enable or disable the **Actions** footer at any time by using the **Format** pane.

:::image type="content" source="media/desktop-visual-tooltips/actions-format-pane.png" alt-text="Screenshot of the format pane options for the tooltip with Actions outlined." lightbox="media/desktop-visual-tooltips/actions-format-pane.png":::

## Styling and color

For visual tooltips, the report's [theme colors](report-themes-create-custom.md#set-structural-colors) determine the styling and color:

- The **Background elements** color sets the tooltip background.
- The **First-level elements** color sets the text and icon color.
- The **Secondary background elements** color sets the separator line and the hover color on the tooltip.

For example, this tooltip uses the **Default** theme style:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example.png" alt-text="Screenshot of a modern visual tooltip with the default theme.":::

Here's an example with the **Innovate** theme:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-innovate.png" alt-text="Screenshot of a modern visual tooltip with the Innovate theme.":::

Here's an example with the **Frontier** theme:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-frontier.png" alt-text="Screenshot of a modern visual tooltip with the Frontier theme.":::

To customize the styling further in Power BI Desktop, update the **Tooltip** theme in the **Customize theme** dialog:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-customize-theme.png" alt-text="Screenshot of the Customize theme dialog showing Tooltip customizations.":::

You can also format tooltips for each visual by customizing the settings in the **Format** pane:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-desktop-visual-tooltip-format.png" alt-text="Screenshot of the Visualizations pane Tooltips dropdown menu.":::

## Considerations and limitations

The tooltip actions footer isn't available in the following scenarios:

- [Report page tooltips](desktop-tooltips.md)
- [Custom visuals](../developer/visuals/develop-power-bi-visuals.md) (AppSource visuals)
- [Decomposition trees](../visuals/power-bi-visualization-decomposition-tree.md)

## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
