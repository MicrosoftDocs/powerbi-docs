---
title: Customize Tooltips in Power BI Desktop and Service
description: Learn how to create and customize tooltips for visuals in Power BI Desktop and the Power BI service using drag-and-drop fields and aggregations.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
LocalizationGroup: Create reports
ai-usage: ai-assisted
---

# Customize tooltips in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Tooltips provide an elegant way to give contextual information and detail to data points on a visual. The following image shows a tooltip applied to a chart in Power BI Desktop. You can customize tooltips in Power BI Desktop and in the Power BI service.

> [!TIP]
> **Quick customization:** Drag any field from your data into the **Tooltips** bucket in the Visualizations pane to add it to your tooltip. For more advanced tooltips, see [Create tooltips based on report pages](desktop-tooltips.md).

:::image type="content" source="media/desktop-custom-tooltips/custom-tooltips-1.png" alt-text="Screenshot of the default tooltip showing data point value and category on a chart in Power BI.":::

When you create a visualization, the default tooltip displays the data point's value and category. Many situations call for customizing the tooltip information. Customizing tooltips provides context and information for users viewing the visual. By using custom tooltips, you can specify more data points that display as part of the tooltip.

## How to customize tooltips

To create a customized tooltip, drag a field into the **Tooltips** bucket in the **Fields** well of the **Visualizations** pane, as shown in the following image. In the following image, three fields are placed into the **Tooltips** bucket.

:::image type="content" source="media/desktop-custom-tooltips/custom-tooltips-2.png" alt-text="Screenshot of the Visualizations pane showing three fields added to the Tooltips bucket.":::

After you add fields to **Tooltips**, hovering over a data point on the visualization shows the values for those fields.

:::image type="content" source="media/desktop-custom-tooltips/custom-tooltips-3.png" alt-text="Screenshot of a custom tooltip displaying multiple field values when hovering over a data point.":::

## Customize tooltips with aggregation or quick measures

You can further customize a tooltip by selecting an aggregation function. Select the arrow beside the field in the **Tooltips** bucket. Then select from the available options.

:::image type="content" source="media/desktop-custom-tooltips/custom-tooltips-4.png" alt-text="Screenshot of the Tooltips bucket showing the dropdown menu for selecting aggregation functions.":::

In Power BI Desktop, you can also select a *quick measure*. Read about [creating quick measures](../transform-model/desktop-quick-measures.md) in Power BI Desktop.

There are many ways to customize tooltips, using any field available in your semantic model, to convey quick information and insights to users viewing your dashboards or reports.

## Allow tooltips to auto-scale (preview)

You can change a report setting so that tooltips adjust their size automatically based on the canvas size.

### [Power BI Desktop](#tab/powerbi-desktop)

In Power BI Desktop, select **File** > **Options and settings** > **Options**.

Under **Current file**, select **Report settings**, and select **Tooltip size is affected by canvas size**.

:::image type="content" source="media/desktop-custom-tooltips/desktop-tooltip-auto-scale-setting.png" alt-text="Screenshot showing Tooltip size is affected by canvas size checkbox in Power BI Desktop.":::

### [Power BI service](#tab/powerbi-service)

In the Power BI service, select More options (...) next to a report > **Settings**.

In the **Settings** pane, select **Tooltip size is affected by canvas size**.

:::image type="content" source="media/desktop-custom-tooltips/service-tooltip-auto-scale-setting.png" alt-text="Screenshot showing Tooltip size is affected by canvas size checkbox in the Power BI service.":::

---

## Considerations and limitations

- Default tooltips aren't designed to contain large amounts of content. Their look and feel might change with Power BI updates. For more control over the look and feel of the content in a tooltip, [create tooltips based on custom report pages](desktop-tooltips.md).

## Related content

- [Create tooltips based on report pages](desktop-tooltips.md)
