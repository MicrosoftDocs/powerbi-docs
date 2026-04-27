---
title: Visual tooltips in Power BI
description: Learn how to create, customize, and format visual tooltips in Power BI reports, including the Tooltip field well, aggregations, drill actions, theming, and autoscale.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 04/24/2026
LocalizationGroup: Visualizations
ai-usage: ai-assisted
---
# Visual tooltips in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Visual tooltips display contextual information when consumers hover over data points in a visual. They help consumers understand the data without leaving the report. This article describes how to add fields to a tooltip, format the tooltip in Power BI Desktop and the Power BI service, and use drill actions from the tooltip.

For an introduction to all tooltip types, see [Tooltips overview](power-bi-visualization-tooltips-overview.md). For richer hover content, see [Create report page tooltips in Power BI](../create-reports/desktop-tooltips.md).

:::image type="content" source="../create-reports/media/desktop-visual-tooltips/power-bi-visual-tooltips-example.png" alt-text="Screenshot of a visual tooltip displaying field name and value, additional fields, and drill actions.":::

By default, the tooltip shows:

- The **field name and value** for each field used in the visual.
- **Additional fields** that you add in the **Tooltip** field well.
- Optional **actions**, such as **Drill down**, **Drill up**, and **Drill through**, when the visual supports them.

## Add fields to the Tooltip field well

Use the **Tooltip** field well to show extra data points in the tooltip without changing the visual itself.

1. Select the visual you want to customize.
1. In the **Build visual** pane, drag a field into the **Tooltip** field well. You can add multiple fields.

   :::image type="content" source="../create-reports/media/desktop-custom-tooltips/custom-tooltips-2.png" alt-text="Screenshot of the Build visual pane showing three fields added to the Tooltip field well.":::

1. Hover over a data point on the visual to see the values for the fields you added.

   :::image type="content" source="../create-reports/media/desktop-custom-tooltips/custom-tooltips-3.png" alt-text="Screenshot of a custom tooltip displaying multiple field values when hovering over a data point.":::

### Apply aggregation functions

Apply aggregation functions to the fields in the **Tooltip** field well to show summarized values.

1. In the **Tooltip** field well, select the arrow beside the field you want to aggregate.
1. Select an aggregation, such as **Sum**, **Average**, or **Count**.

   :::image type="content" source="../create-reports/media/desktop-custom-tooltips/custom-tooltips-4.png" alt-text="Screenshot of the Tooltip field well showing the dropdown menu for selecting aggregation functions.":::

You can also use [quick measures](../transform-model/desktop-quick-measures.md) to create common calculations to add to your tooltip.

## Configure tooltip settings

Tooltip formatting lives in the **Format visual** pane under **General** > **Tooltips**. Select a visual on the report canvas, and then select the **Format visual** icon in the **Visualizations** pane.

Available settings include:

- **Tooltip visibility**: Toggle the **Tooltips** card on or off to show or hide tooltips for the visual.
- **Tooltip type**: Choose **Default** to use the standard tooltip, or **Report page** to use a [report page tooltip](../create-reports/desktop-tooltips.md).
- **Text**: Set the **Font**, **Label color**, **Value color**, and **Drill text and icon color**.
- **Background**: Set the **Color** and **Transparency**.
- **Actions**: Turn on or off the actions footer, which exposes drill behavior in supported visuals.

## Use drill actions in the tooltip

When you turn on the **Actions** footer, supported visuals show drill controls in the tooltip:

- **Drill down**: Goes to the next level in a hierarchy.
- **Drill up**: Returns to the previous hierarchy level.
- **Drill through**: Opens a [drillthrough page](../create-reports/desktop-drillthrough.md) filtered to that data point.

Using drill actions from the tooltip means consumers don't need to use right-click menus or header icons.

## Style tooltips by using a report theme

Tooltips inherit colors from the report theme so the experience stays consistent across visuals.

To adjust tooltip styling for the entire report:

1. In Power BI Desktop, select the **View** tab.
1. Select **Customize current theme** > **Visuals**.
1. Select **Tooltip** to set the **Label text color**, **Value text color**, **Drill text and icon color**, and **Background color**.

   :::image type="content" source="../create-reports/media/desktop-visual-tooltips/power-bi-visual-tooltips-customize-report-theme.png" alt-text="Screenshot of Tooltip styling options in the Customize current theme dialog.":::

Theme elements map to tooltip elements as follows:

- **Background color** maps to the tooltip background.
- **Text and icon color** maps to first-level text and icons.
- **Separator and hover color** maps to secondary background elements.

To override the theme for a single visual, use **General** > **Tooltips** in the **Format visual** pane.

## Enable tooltip autoscale

Tooltip autoscale resizes tooltips based on the canvas size so they look right on different screen sizes.

### [Power BI Desktop](#tab/powerbi-desktop)

1. Select **File** > **Options and settings** > **Options**.
1. Under **Current file**, select **Report settings**.
1. Select **Tooltip size is affected by canvas size**.

   :::image type="content" source="../create-reports/media/desktop-custom-tooltips/desktop-tooltip-auto-scale-setting.png" alt-text="Screenshot showing Tooltip size is affected by canvas size checkbox in Power BI Desktop.":::

### [Power BI service](#tab/powerbi-service)

1. Select **More options** (...) next to a report, and then select **Settings**.
1. In the **Settings** pane, select **Tooltip size is affected by canvas size**.

   :::image type="content" source="../create-reports/media/desktop-custom-tooltips/service-tooltip-auto-scale-setting.png" alt-text="Screenshot showing Tooltip size is affected by canvas size checkbox in the Power BI service.":::

---

## Troubleshoot tooltip problems

- **Tooltip doesn't appear**: The visual might not support standard tooltips, or the **Tooltips** toggle might be off. Visuals that support the full tooltip experience, including a **Tooltip** field well, include bar and column charts, line and area charts, treemaps, scatter and bubble charts, pie and donut charts, and ribbon, funnel, and waterfall charts.
- **Report page tooltip doesn't appear**: Confirm the page has **Allow use as tooltip** turned on, and that the visual's **Tooltip** type is set to **Report page**. For more information, see [Create report page tooltips](../create-reports/desktop-tooltips.md).
- **Actions footer is missing**: Only visuals with drillable hierarchies or a drillthrough mapping show the actions footer.
- **Can't add fields to the Tooltip well**: Tables, matrices, and some other visuals don't expose a **Tooltip** field in the **Build visual** pane.
- **Tooltip text is too small**: Too many fields force the font to shrink. Reduce the number of fields for better readability.

## Considerations and limitations

- Default tooltips aren't designed to hold large amounts of content. For more control, use a [report page tooltip](../create-reports/desktop-tooltips.md).
- Tooltip styling and the actions footer might differ for some visual types:
  - **Key influencers** show their own explanation panels instead of standard tooltips.
  - **Tables and matrices** show the cell value on hover. Tooltip formatting options are available, but these visuals don't expose a **Tooltip** field well.
  - **Decomposition trees**, **report page tooltips**, and **AppSource custom visuals** show standard tooltips where supported but don't expose the actions footer.
- **Existing reports** keep their original tooltip appearance and actions footer state. Power BI might prompt you to upgrade older reports to modern tooltip defaults.
- You can turn off tooltips for a visual in a Power BI report. However, when you pin that visual to a dashboard, the basic tooltip still appears.

## Related content

- [Tooltips overview](power-bi-visualization-tooltips-overview.md)
- [Create report page tooltips in Power BI](../create-reports/desktop-tooltips.md)
- [Add Help tooltips to visuals in Power BI](power-bi-visualization-help-tooltips.md)
- [Set up drillthrough in Power BI reports](../create-reports/desktop-drillthrough.md)
