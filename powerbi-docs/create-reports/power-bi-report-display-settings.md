---
title: Apply page size and settings in a Power BI report
description: Learn how to configure page display and view settings in Power BI reports to control layout, aspect ratios, and object positioning for optimal viewing across different screens.
author: julcsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/13/2026
ms.custom: video-removed
ai-usage: ai-assisted
LocalizationGroup: Reports
---
# Apply page size and settings in a Power BI report

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI reports display on screens with different sizes and aspect ratios. You can configure your report's page size and display settings to control how content appears across devices.

Use **Page view** settings to control how the report fits in the browser window. Use **Canvas settings** to set the page dimensions and aspect ratio.

> [!NOTE]
> This article covers desktop layout view settings. For reports viewed on mobile devices, you can create a separate mobile-optimized layout. See [Create mobile-optimized Power BI reports](power-bi-create-mobile-optimized-report-about.md).

## Where to find page view settings

Page view settings are available in both the Power BI service and Power BI Desktop, but the interface is a little different. The following sections explain where you can find View settings in each Power BI tool.

# [Power BI Desktop](#tab/powerbi-desktop)

In Report view, select the **View** tab to open Page view settings as well as phone layout settings.

:::image type="content" source="media/power-bi-report-display-settings/power-bi-desktop-view-settings.png" alt-text="Screenshot of Desktop page view settings.":::

# [Power BI service](#tab/powerbi-service)

In the Power BI service (app.powerbi.com), open a report, select **Edit**, and then select **View** from the upper left menu bar.

:::image type="content" source="media/power-bi-report-display-settings/power-bi-change-page-view.png" alt-text="Screenshot of service page view settings.":::

---

## Page view settings

The first set of Page view settings controls the display of your report page relative to the browser window. Choose between:

- **Fit to page** (default): Contents are scaled to best fit the page
- **Fit to width**: Contents are scaled to fit within the width of the page
- **Actual size**: Contents are displayed at full size

The second set of Page view settings controls the positioning of objects on the report canvas. Choose between:

- **Show gridlines**: Turn on gridlines to help you position objects on the report canvas.
- **Snap to grid**: Use with **Show gridlines** to precisely position and align objects on the report canvas.
- **Lock objects**: Lock all objects on the canvas so that they can't be moved or resized.
- **Selection pane**: The **Selection** pane lists all objects on the canvas. You can decide which to show and which to hide.

:::image type="content" source="media/power-bi-report-display-settings/power-bi-selection-pane.png" alt-text="Screenshot of the Selection pane.":::

## Canvas settings

:::image type="content" source="media/power-bi-report-display-settings/power-bi-canvas-settings.png" alt-text="Screenshot of canvas settings options.":::

When you don't have anything selected on the page canvas, the **Visualizations** pane shows **Format page** options. Expand **Canvas settings** to control the aspect ratio, dimensions, and vertical alignment of the report canvas.

### Type

The **Type** dropdown sets the aspect ratio:

- **16:9** (default): Widescreen aspect ratio
- **4:3**: Standard aspect ratio
- **Letter**: Letter page dimensions
- **Tooltip**: Sized for tooltip pages
- **Custom**: Specify custom height and width in pixels

### Size

When you select a standard aspect ratio like 16:9, the **Size** dropdown offers common screen dimensions:

| Size | Description |
|------|-------------|
| 1280 x 720 (HD) | Standard HD resolution |
| 1920 x 1080 (Full HD) | Full HD, common for presentations |
| 2560 x 1440 (QHD) | Quad HD resolution |
| 3840 x 2160 (4K UHD) | Ultra HD resolution |

### Vertical alignment

The **Vertical alignment** dropdown controls how content aligns vertically on the canvas:

- **Top**: Aligns content to the top of the canvas
- **Middle**: Centers content vertically

### Set default page size in a theme

You can specify the default page size for new pages in a [custom report theme](desktop-report-themes.md) JSON file. This setting applies to new pages added to the report, not existing pages.

## Related content

- [Report view in Power BI Desktop](desktop-report-view.md)
- [Change Page view and Page size settings in your own Power BI reports](../explore-reports/end-user-report-view.md)
- Read more about [reports in Power BI](../explore-reports/end-user-reports.md)
- [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
