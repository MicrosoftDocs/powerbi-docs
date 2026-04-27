---
title: Create Report Tooltips in Power BI 
description: Report tooltips in Power BI let you create rich hover-based tooltips for visuals in your reports, enhancing the interactivity and user experience of your reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ZoeDouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/03/2026
ai-usage: ai-assisted
LocalizationGroup: Create reports
#customer intent: As a Power BI user I want to learn how to create hover-based tooltips for visual reports.
---

# Create report tooltips in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

> [!NOTE]
> The location and availability of tooltip options might change between Power BI Desktop versions. If you don't see the options described in this article, make sure you're using the latest version and check the official documentation for UI changes.

You can create visually rich **report tooltips** in Power BI that appear when you hover over visuals. These custom tooltips are based on report pages you create in **Power BI Desktop** and the **Power BI service**, allowing you to include visuals, images, and other elements that provide detailed insights to users. By creating a report page that serves as your tooltip, you enhance the interactivity and user experience of your reports. For an introduction to all tooltip types, see [Tooltips overview](../visuals/power-bi-visualization-tooltips-overview.md).

You can create multiple tooltip pages. Each tooltip page can be associated with one or more fields in your report. When you hover over a visual that includes the selected field, the tooltip appears and filters by the data point where your mouse is hovering.

:::image type="content" source="media/desktop-tooltips/desktop-tooltips-00a.png" alt-text="Screenshot of report tooltips for Power BI.":::

## Create a report tooltip page

1. Create a new report page by selecting the **+** button along the bottom of the canvas in the page tabs area, beside the last page in the report.
1. In the **Format** pane, select the **Canvas Settings** card, and set the page size template to *Tooltip*. This template provides a canvas size optimized for tooltips. Your tooltip can be any size, but keep in mind that tooltips hover over the report canvas.

   :::image type="content" source="media/desktop-tooltips/desktop-tooltips-03.png" alt-text="Screenshot of report page size canvas for a ready-made tooltip.":::

1. Change the **Page View** to actual size to see how your tooltip appears. By default, Power BI Desktop fits your report canvas to the available space on the page, which isn't ideal for tooltips.

   **In Power BI Desktop**: Select the **View** tab from the ribbon, and then select **Page View** > **Actual Size**.

   :::image type="content" source="media/desktop-tooltips/desktop-tooltips-04.png" alt-text="Screenshot of page view dropdown to show actual size for easier tooltip creation.":::

   **In Power BI service**: Select the **View** tab from the ribbon, and then select **Actual Size**.

   :::image type="content" source="media/desktop-tooltips/service-tooltips-04.png" alt-text="Screenshot of page view dropdown to show the actual size for easier tooltip creation.":::

1. Name the report page to clarify its purpose. Select the **Page Information** card in the **Format** pane, and type the name into the **Name** field.
1. Add the visuals you want to appear in your tooltip. In the following image, there are two cards and one clustered bar chart on the tooltip page, a page background color, and backgrounds for each of the visuals.

   :::image type="content" source="media/desktop-tooltips/desktop-tooltips-06.png" alt-text="Screenshot of a customized report tooltip.":::

Before your tooltip report page can function as a tooltip, configure it as described in the next section.

## Configure your tooltip report page

After you create the tooltip report page, configure it to register as a tooltip and ensure it appears over the right visuals.

> [!TIP]
> If your tooltip page appears blank or doesn't populate, make sure you add fields to **Tooltip fields** and that your visuals reference those fields. The tooltip page must contain visuals and be set as a tooltip in **Page Information**.

1. Turn the **Tooltip** slider to **On** in the **Page Information** card to make the page a tooltip.
1. Specify the fields for which you want the report tooltip to appear. Drag the fields into **Tooltip fields** in the **Fields** section of the **Visualizations** pane. For visuals in the report that include the specified fields, the tooltip appears. In the following image, the *Total Defect Qty* field is dragged into **Tooltip fields**.

   :::image type="content" source="media/desktop-tooltips/desktop-tooltips-08.png" alt-text="Screenshot of fields to determine where the tooltip appears.":::

   You can include both categorical and numerical fields in **Tooltip fields**, including measures.

After you complete these steps, the tooltip report page replaces the default Power BI tooltip in visuals that use any fields you placed into **Tooltip fields**.

## Manually set a report tooltip

In addition to creating a tooltip that automatically appears when hovering over a visual that contains the specified field, you can manually set a tooltip. Any visual that supports report tooltips has a **Tooltip** card in its **Formatting** pane.

1. Select the visual for which you want to specify the manual tooltip.
1. In the **Visualizations** pane, select the **Format** section and expand the **Tooltips** card. In the **Page** dropdown, select the tooltip page you want to use for the selected visual. Only report pages that are specified as **Tooltip** pages appear in the dialog.

   :::image type="content" source="media/desktop-tooltips/desktop-tooltips-10.png" alt-text="Screenshot of tooltip page selection for manual tooltip.":::

Manually setting a tooltip is useful when you want to override the default Power BI tooltip selection or set a blank page for a tooltip. For example, if you have a visual that includes two fields, and both fields have an associated tooltip, Power BI selects only one to show. You can manually select which tooltip displays instead.

## Revert to default tooltips

If you create a manual tooltip for a visual but decide you want the default tooltip instead, you can return to the default tooltip.

1. Select the visual with the manual tooltip.
1. In the **Visualizations** pane, select the **Format** section and expand the **Tooltips** card. Select *Auto* from the **Page** dropdown to revert to the default.

## Custom report tooltips and line charts

Keep a few considerations in mind when your report tooltips interact with line chart visuals, and with visuals when cross-highlighting.

### Report tooltips and line charts

When a report tooltip appears for a line chart, it shows just one tooltip for all lines in the chart. This behavior is similar to the default tooltip behavior for line charts, which also shows only one tooltip.

The field in the legend doesn't act as a filter for the tooltip. In the following image, the tooltip shows all units sold on that day across all three classes displayed in the report tooltip (in this example, Deluxe, Economy, and Regular).

:::image type="content" source="media/desktop-tooltips/desktop-tooltips-12.png" alt-text="Screenshot of line charts that show aggregated tooltip data.":::

### Report tooltips and cross-highlighting

When you cross-highlight a visual in a report, report tooltips always show the cross-highlighted data, even if you're hovering over the faded section of the data point. In the following image, the mouse pointer is over the faded section of the bar graph (the section that isn't highlighted), but the report tooltip still shows data for the highlighted portion of that data point (the highlighted data).

:::image type="content" source="media/desktop-tooltips/desktop-tooltips-13.png" alt-text="Screenshot of report tooltips showing highlighted data when cross-highlighting occurs.":::

## Considerations and limitations

Keep a few considerations and limitations in mind for **tooltips**.

> [!NOTE]
> The Power BI mobile app for iPad supports tooltip pages, but some features or formatting might differ from Power BI Desktop.

- Button visuals also support tooltips.
- Dashboards don't support page tooltips.
- Python and R visuals don't currently appear in report tooltips.
- Clusters aren't currently supported as fields that report tooltips can show.
- When you choose a field to show report tooltips, visuals that contain that field only show the specified tooltip when field summarization matches that field.
- When you use a field versus a category, visuals that contain that field only show the specified tooltip when field summarization matches that field.
- You can turn off tooltips completely for a visual in Power BI reports. However, when you pin that visual to a dashboard in the Power BI service, the basic tooltip still appears.

## Related content

- [Tooltips overview](../visuals/power-bi-visualization-tooltips-overview.md)
- [Visual tooltips in Power BI](../visuals/power-bi-visualization-visual-tooltips.md)
- [Add Help tooltips to visuals in Power BI](../visuals/power-bi-visualization-help-tooltips.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
- [Extend visuals with report page tooltips (guidance)](../guidance/report-page-tooltips.md)
