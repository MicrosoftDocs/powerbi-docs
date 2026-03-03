---
title: Customize Tooltips in Power BI
description: Learn how to customize tooltips for Power BI visuals using drag-and-drop fields and aggregations. Add context and detail to your reports with custom tooltips.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ZoeDouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/03/2026
LocalizationGroup: Create reports
ai-usage: ai-assisted
---

# Customize tooltips in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Tooltips provide contextual information and detail for data points on a visual. You can customize tooltips in Power BI Desktop and the Power BI service.

:::image type="content" source="media/desktop-custom-tooltips/custom-tooltips-1.png" alt-text="Screenshot of the default tooltip showing data point value and category on a chart in Power BI.":::

When you create a visualization, the default tooltip displays the data point's value and category. Custom tooltips let you specify additional data points to display.

> [!TIP]
> For more advanced tooltips based on custom report pages, see [Create tooltips based on report pages](desktop-tooltips.md).

## Customize tooltips

1. Select the visual you want to customize.
1. In the **Build visual** pane, drag a field into the **Tooltip** field well. You can add multiple fields. In the following image, three fields are added to the **Tooltip** field well.

   :::image type="content" source="media/desktop-custom-tooltips/custom-tooltips-2.png" alt-text="Screenshot of the Build visual pane showing three fields added to the Tooltip field well.":::

1. Hover over a data point on the visualization to see the values for the fields you added.

   :::image type="content" source="media/desktop-custom-tooltips/custom-tooltips-3.png" alt-text="Screenshot of a custom tooltip displaying multiple field values when hovering over a data point.":::

## Customize tooltips with aggregation or quick measures

You can further customize a tooltip by applying aggregation functions to fields.

1. In the **Tooltip** field well, select the arrow beside the field you want to aggregate.
1. Select from the available aggregation options.

   :::image type="content" source="media/desktop-custom-tooltips/custom-tooltips-4.png" alt-text="Screenshot of the Tooltip field well showing the dropdown menu for selecting aggregation functions.":::

In Power BI Desktop, you can also use quick measures in tooltips. For more information, see [Create quick measures](../transform-model/desktop-quick-measures.md).

## Allow tooltips to autoscale (preview)

You can configure tooltips to adjust their size automatically based on the canvas size.

### [Power BI Desktop](#tab/powerbi-desktop)

1. Select **File** > **Options and settings** > **Options**.
1. Under **Current file**, select **Report settings**.
1. Select **Tooltip size is affected by canvas size**.

   :::image type="content" source="media/desktop-custom-tooltips/desktop-tooltip-auto-scale-setting.png" alt-text="Screenshot showing Tooltip size is affected by canvas size checkbox in Power BI Desktop.":::

### [Power BI service](#tab/powerbi-service)

1. Select **More options** (...) next to a report, and then select **Settings**.
1. In the **Settings** pane, select **Tooltip size is affected by canvas size**.

   :::image type="content" source="media/desktop-custom-tooltips/service-tooltip-auto-scale-setting.png" alt-text="Screenshot showing Tooltip size is affected by canvas size checkbox in the Power BI service.":::

---

## Considerations and limitations

- Default tooltips aren't designed to contain large amounts of content. Their look and feel might change with Power BI updates. For more control over the look and feel of the content in a tooltip, [create tooltips based on custom report pages](desktop-tooltips.md).

## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
- [Create visual tooltips](desktop-visual-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
- [Custom visuals (AppSource Visuals)](../developer/visuals/develop-power-bi-visuals.md)
- [Decomposition trees](../visuals/power-bi-visualization-decomposition-tree.md)
