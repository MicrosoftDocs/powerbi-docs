---
title: Create Visual Tooltips
description: Learn how modern visual tooltips in Power BI Desktop and Power BI service let you create rich hover-based tooltips with drill actions and theme-based styling for visuals in your reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/01/2025
ai-usage: ai-assisted
LocalizationGroup: Create reports
---

# Create visual tooltips

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Visual tooltips in Power BI are designed to improve usability, accessibility, and interactivity across visuals.  

When hovering over a visual data point, a tooltip shows the field name and value. By default, the fields used in the visual show in the tooltip. Additional fields can be shown in the tooltip by adding them to the visual's **Tooltip** field well. Actions, such as [drill down and drill through](https://learn.microsoft.com/en-us/power-bi/paginated-reports/report-design/drillthrough-drilldown-subreports-nested-data-regions) are also available on the tooltip when a visual has these actions available. 

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example.png" alt-text="Screenshot of an example of a modern visual tooltip.":::

The tooltip for any visual can be turned off in the visual formatting options. And if you want full control of a visual tooltip, you can create a [visual tooltip report page](https://learn.microsoft.com/en-us/power-bi/create-reports/desktop-tooltips) to use instead of the default tooltip. 

## Actions footer

The optional tooltip **Actions** footer shows drill down and up, along with drill through on a data point without having to use the right-click menu or the header icons for the visual. 

:::image type="content" source="media/desktop-visual-tooltips/drill-down-and-through-tooltips.png" alt-text="Screenshot of the Actions footer with the Drill down and Drill through options outlined.":::

For example, when you hover over the Word data point in a bar chart, you can **Drill down** on the data point or **Drill through**. If you select **Drill down**, the visual updates display the next level in the hierarchy and filter to *Word*. If you select **Drill through**, you see which pages you can drill through to. In this example, choose either the Market Basket Analysis or the Category Details page.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-drill-through.png" alt-text="Screenshot of a tooltip with Drill through options highlighted.":::

If you select **Market Basket Analysis** in the tooltip, you drill through to the Market Basket Analysis page, filtered to *Word* and any other filters on the source data point.

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-drill-through-market-basket.png" alt-text="Screenshot of the drill through to the Market Basket Analysis page." lightbox="media/desktop-visual-tooltips/power-bi-visual-tooltip-drill-through-market-basket.png":::

If a report author would like to enable or disable the **Actions** footer at any time for a new or existing report, they can do so using the **Format** pane.  

:::image type="content" source="media/desktop-visual-tooltips/actions-format-pane.png" alt-text="Screenshot of the format pane options for the tooltip with Actions outlined." lightbox="media/desktop-visual-tooltips/actions-format-pane.png":::

## Styling and color

With visual tooltips, the styling and color is based on the report's [theme colors](desktop-report-themes.md#set-structural-colors):

- The background of the tooltips default to the **Background elements**.
- The text and icon color of the tooltips default to the **First-level elements**.
- The separator line and hover color on the tooltip default to the **Secondary background elements**.

For example, this tooltip has the **Default** theme style:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example.png" alt-text="Screenshot of a modern visual tooltip with the default theme.":::

Here's an example with the **Innovate** theme:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-innovate.png" alt-text="Screenshot of a modern visual tooltip with the Innovate theme.":::

Here's an example with the **Frontier** theme:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-example-frontier.png" alt-text="Screenshot of a modern visual tooltip with the Frontier theme.":::

To customize the styling further in Power BI Desktop, you can update the **Tooltip** theme in the **Customize theme** dialog:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-visual-tooltip-customize-theme.png" alt-text="Screenshot of the Customize theme dialog showing Tooltip customizations.":::

Additionally, you can format tooltips per visual by customizing the settings in the **Format** pane:

:::image type="content" source="media/desktop-visual-tooltips/power-bi-desktop-visual-tooltip-format.png" alt-text="Screenshot of the Visualizations pane Tooltips dropdown menu.":::

## Visual tooltip update in January 2026 impact to new and existing reports 

The visual tooltips were updated in January 2026 with the modern tooltips feature general availability. All tooltips now use the updated visual tooltip experience.  

- For new reports, tooltips will include the theme colors and style with the **Actions** footer enabled by default. 

- For existing reports, the display of the tooltip will remain unchanged. The **Actions** footer, if not previously enabled, will remain disabled. 

- If you wish to **reset the default** of an existing report not using the updated visual tooltips, a dialog will appear asking if you would like to upgrade the tooltip. 
    - Choosing **Upgrade to modern defaults** updates all visuals in your report with the **Actions** footer enabled.
    - Choosing **Use old tooltips** keeps the tooltips unchanged.  


## Considerations and limitations

The tooltip actions footer isn't available in the following scenarios: 

- [Report page tooltips](https://learn.microsoft.com/en-us/power-bi/create-reports/desktop-tooltips)
- [Custom visuals](https://learn.microsoft.com/en-us/power-bi/developer/visuals/develop-power-bi-visuals) (AppSource visuals)
- [Decomposition trees](https://learn.microsoft.com/en-us/power-bi/visuals/power-bi-visualization-decomposition-tree)


## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
