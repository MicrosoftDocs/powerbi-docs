---
title: Create a Power BI dashboard from a report
description: Learn how to pin visualizations from existing reports to a dashboard in Power BI to help users understand data relationships.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/21/2026
#customer intent: As a Power BI user I want to learn how to create dashboards with visualizations.
---
# Create a Power BI dashboard from a report

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

You read [Introduction to dashboards in Power BI](service-dashboards.md), and now you want to create your own. There are many ways to create a dashboard. For example, you can create a dashboard from a report, from scratch, from a semantic model, or by duplicating an existing dashboard. In this article, you create a quick and easy dashboard that pins visualizations from an existing report.

After you complete this article, you understand:

- The relationship between dashboards and reports.
- How to pin tiles.
- How to navigate between a dashboard and a report.

:::image type="content" source="media/service-dashboard-create/power-bi-completed-dashboard-small.png" alt-text="Screenshot of a Power BI dashboard with several visualizations." lightbox="media/service-dashboard-create/power-bi-completed-dashboard-small.png":::

> [!NOTE]
> Dashboards are a feature of the Power BI service, not Power BI Desktop. You can't create dashboards in the Power BI mobile apps, but you can [view and share](../explore-reports/mobile/mobile-apps-view-dashboard.md) them there.

## Pin tiles to a dashboard

To try pinning visualizations to a new dashboard, use the following steps and the [Procurement Analysis sample](sample-procurement.md).

1. Open the Procurement Analysis sample report and then select **Edit** to open the report in Editing view.

    :::image type="content" source="media/service-dashboard-create/power-bi-reading-view-new.png" alt-text="Screenshot of the report, highlighting more options and edit.":::

1. Hover over a visualization. To add a visualization to a dashboard, select the pin icon. :::image type="icon" source="media/service-dashboard-create/power-bi-pin-icon.png":::

    :::image type="content" source="media/service-dashboard-create/power-bi-hover-new.png" alt-text="Screenshot of a visualization, highlighting the pin icon.":::
1. Select whether to pin to an existing dashboard or new dashboard.

   - **Existing dashboard**: Select the name of the dashboard from the dropdown. The dropdown doesn't show dashboards that are shared with you.
   - **New dashboard**: Enter the name of the new dashboard.

1. Select the option for **New dashboard** and enter a name. For this example, use the default "Total Invoice by Country/Region" name.

    :::image type="content" source="media/service-dashboard-create/power-bi-pin-title.png" alt-text="Screenshot of the Pin to dashboard window.":::

1. When you select **Pin**, Power BI creates the new dashboard in the current workspace. After the **Pinned to dashboard** message appears, select **Go to dashboard**. If you're prompted to save the report, select **Save**.

    :::image type="content" source="media/service-dashboard-create/power-bi-pin-success.png" alt-text="Screenshot of a success message, highlighting Go to dashboard.":::

    Power BI opens the new dashboard, which has one tile: the visualization you pinned.

   :::image type="content" source="media/service-dashboard-create/power-bi-pinned.png" alt-text="Screenshot of a dashboard with one tile.":::

1. Select the tile to return to the report.

     :::image type="content" source="media/service-dashboard-create/select-the-title.png" alt-text="Screenshot of the Select the title element.":::

1. Pin a few more tiles to the new dashboard. When the **Pin to dashboard** window appears, select **Existing dashboard**.  

   :::image type="content" source="media/service-dashboard-create/power-bi-existing-dashboard.png" alt-text="Screenshot of the Pin to dashboard window, highlighting Existing dashboard.":::

## Pin an entire report page

You can pin an entire report page to a dashboard. This option makes it easy to pin more than one visualization at a time. When you pin an entire page, the tiles are *live*. You can interact with them right on the dashboard. Any changes you make to the visualizations in the report editor, like adding a filter or changing the fields used in the chart, appear in the dashboard tile.  

For more information, see [Pin an entire report page](service-dashboard-pin-live-tile-from-report.md).

## Considerations and limitations

Some report formatting options or themes don't apply to visuals when you pin them to a dashboard:

- The pinned tile ignores border, shadow, and background settings, as well as all title and subtitle formatting (aside from the text itself).
- For card visuals, dashboards show the text used for the value by using the 'DIN' font family with black text. You can change the text color for all the tiles on a dashboard by [creating a custom dashboard theme](service-dashboard-themes.md).
- Conditional formatting isn't applied.

Certain interactivity and features are lost or limited:

- If you pin just a visual (rather than an entire report page), filters and slicers in the report might not persist or apply the same way on the tile.
- Button visuals that trigger bookmarks or clear or apply filters when you select them have no action in a dashboard tile. These actions only make sense within the context of a report. The tile is a snapshot and hyperlink, not full report functionality.
- If you're a viewer (not creator) of a dashboard, you often can't move or resize tiles. Dashboard tile refresh and behavior might depend on dataset refresh and cache.

Live changes in the report might not update the tile's visual type:

- If you pin a line chart, then later change the visual in the report to a bar chart, the dashboard tile still shows the original line-chart visual type (though data might refresh).
- Similarly, geometry or layout changes might not propagate.

Limitations with visual types, data size, and image sizes:

- You might not be able to pin some custom visuals, certain slicer visuals, or unsupported visuals.
- Visuals adjust their size to fit the size of the tile, which can result in differences in layout as if the visual were resized in the report.
- Because some visualizations use background images, pinning might not work if the background image is too large. Try reducing the image size or using image compression.
- While you can pin visuals from different reports or datasets to one dashboard, you can't create new visuals on the dashboard itself that combine data from different underlying datasets in the way you can in a report.
- Custom fonts that aren't part of Power BI's supported font list aren't applied on dashboards.

Dashboard theme and visual theme mismatches:

- When you pin a tile, you can choose to keep the report's theme (so the visual looks as it did) or use the dashboard theme (so all tiles match). However, some tiles might lose formatting when the dashboard theme is applied.
- Some theme-level formatting (tile background color, tile border) might not apply in all cases (for example, pinned live report pages or certain tile types).
  
Dashboard limitations (beyond pinning) that impact pinned visuals:

- Dashboards are limited to one page (one canvas), whereas reports can have many pages.
- You can't create dashboards in Power BI Desktop - only in the Power BI service.
- On a dashboard, filtering or slicing the canvas isn't available in the same way as in a report: you can't drop a slicer across tiles and have them all respond (unless each tile was pinned from a live page).

## Related content

You created your first dashboard. Now that you have a dashboard, you can do more with it. Start exploring on your own, or see one of the following articles:

- [Resize and move tiles](service-dashboard-edit-tile.md)
- [All about dashboard tiles](service-dashboard-tiles.md)
- [Share your dashboard by creating an app](../collaborate-share/service-create-distribute-apps.md)
- [Power BI - Basic Concepts](../fundamentals/service-basic-concepts.md)
- [Tips for designing a great dashboard](service-dashboards-design-tips.md)
