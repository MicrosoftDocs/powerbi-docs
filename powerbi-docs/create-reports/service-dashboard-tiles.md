---
title: Introduction to Dashboard Tiles for Power BI Designers
description: Learn about dashboard tiles in Power BI, including tiles created from reports, dashboards, the Q&A box, Excel, and SQL Server Reporting Services (SSRS) reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
LocalizationGroup: Dashboards
ai-usage: ai-assisted
---
# Introduction to dashboard tiles for Power BI designers

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

A tile is a snapshot of your data that you pin to the dashboard. You can create tiles from a report, dashboard, the Q&A box, Excel, SQL Server Reporting Services (SSRS) reports, and more. This screenshot shows many different tiles pinned to a dashboard.

> [!TIP]
> **Tiles at a glance:** You can pin dashboard tiles from reports, Q&A, Excel, or SSRS. You can also create standalone tiles directly on dashboards for images, videos, text boxes, streaming data, and web content by using the **Add tile** control.

:::image type="content" source="media/service-dashboard-tiles/power-bi-dashboard.png" alt-text="Screenshot of a Power BI dashboard with multiple tiles.":::

Dashboards and dashboard tiles are features of Power BI service, and aren't available in Power BI Desktop. You can't create dashboards on mobile devices, but you can [view and share](../explore-reports/mobile/mobile-apps-view-dashboard.md) them.

Besides pinning tiles, you can create standalone tiles directly on the dashboard by using the [Add tile](service-dashboard-add-widget.md) control. Standalone tiles include text boxes, images, videos, streaming data, and web content.

Need help understanding the building blocks that make up Power BI? See [Basics of the Power BI service](../fundamentals/service-basic-concepts.md).

> [!NOTE]
> If the original visualization used to create the tile changes, the tile doesn't change. For example, if you pinned a line chart from a report and you changed the line chart to a bar chart, the dashboard tile continues to show a line chart. The data refreshes, but the visualization type doesn't.

## Pin a tile

You can pin a tile to a dashboard in many different ways. Pin tiles from:

- [Power BI Q&A](service-dashboard-pin-tile-from-q-and-a.md)
- [A report](service-dashboard-create.md)
- [Another dashboard](service-pin-tile-to-another-dashboard.md)
- [Excel workbook on OneDrive for work or school](service-dashboard-pin-tile-from-excel.md)
- [Quick Insights](service-insights.md)
- [An on-premises paginated report in Power BI Report Server or SQL Server Reporting Services](/sql/reporting-services/pin-reporting-services-items-to-power-bi-dashboards)

You create standalone tiles for images, text boxes, videos, streaming data, and web content directly on the dashboard by using the [Add tile](service-dashboard-add-widget.md) control.

  :::image type="content" source="media/service-dashboard-tiles/add_widgetnew.png" alt-text="Screenshot of the Add tile icon.":::

## Interact with tiles on a dashboard

After you add a tile to a dashboard, you can move and resize it, or change its appearance and behavior.

### Move and resize a tile

Grab a tile and [move it around on the dashboard](service-dashboard-edit-tile.md). Hover and select the handle :::image type="icon" source="media/service-dashboard-tiles/resize-handle.jpg"::: to resize the tile.

### Hover over a tile to change the appearance and behavior

1. Hover over the tile to display the ellipsis.

    :::image type="content" source="media/service-dashboard-tiles/ellipses_new.png" alt-text="Screenshot of the Tile ellipsis.":::

1. Select the ellipsis to open the tile action menu.

    :::image type="content" source="media/service-dashboard-tiles/power-bi-tile-menu.png" alt-text="Screenshot of the Ellipsis icon.":::

    From here, you can:

     - [Add comments to the dashboard](../explore-reports/end-user-comment.md).
     - [Open the report that was used to create this tile](../explore-reports/end-user-reports.md).
     - [View in focus mode](../explore-reports/end-user-report-view.md).
     - [Export the data used in the tile](../visuals/power-bi-visualization-export-data.md).
     - [Edit the title and subtitle and add a hyperlink](service-dashboard-edit-tile.md).
     - [Run insights](service-insights.md).
     - [Pin the tile to another dashboard](service-pin-tile-to-another-dashboard.md).
     - [Delete the tile](service-dashboard-edit-tile.md).

1. To close the action menu, select a blank area in the dashboard.

### Select a tile

When you select a tile, what happens next depends on how you created the tile. Selecting the tile takes you to the report, Excel Online workbook, on-premises Reporting Services report, or Q&A question that you used to create the tile. If the tile has a [custom link](service-dashboard-edit-tile.md), selecting the tile takes you to that link.

> [!NOTE]
> An exception is video tiles created directly on the dashboard by using **Add tile**. Selecting a video tile that you created this way causes the video to play directly on the dashboard.

## Considerations and troubleshooting

- If you don't save the report you used to create the visualization, selecting the tile does nothing.
- If you create the tile from a workbook in Excel Online, you need at least Read permissions for that workbook. Otherwise, selecting the tile doesn't open the workbook in Excel Online.
- If you create a tile directly on the dashboard by using **Add tile** and set a custom hyperlink for it, selecting the title, subtitle, or tile opens that URL. Otherwise, when you select a tile created directly on the dashboard for an image, web code, or text box, nothing happens by default.
- You can create tiles from on-premises paginated reports in Power BI Report Server or SQL Server Reporting Services. If you don't have permission to access the on-premises report, selecting the tile takes you to a page indicating you don't have access (*rsAccessDenied*).
- If you select a tile created from an on-premises paginated report in Power BI Report Server or SQL Server Reporting Services but don't have access to the network where the report server is located, selecting that tile takes you to a page that indicates it can't locate the server (*HTTP 404*). Your device needs network access to the report server to view the report.
- If the original visualization you use to create the tile changes, the tile doesn't change. For example, if you pin a line chart from a report and then you change the line chart to a bar chart, the dashboard tile continues to show a line chart. The data refreshes, but the visualization type doesn't.
- Some changes you make to a visual in a report aren't reflected in the tile you pin to a dashboard. For example, background color, width and height, and tooltips. Even if you turn tooltips off completely for a visual in a Power BI report, when you pin that visual to a dashboard in the Power BI service, the basic tooltip is still displayed.

## Related content

- [Create a (new) Card visual in Power BI](../visuals/power-bi-visualization-card.md)
- [Introduction to dashboards for Power BI designers](service-dashboards.md)  
- [Data refresh in Power BI](../connect-data/refresh-data.md)
- [Basics of the Power BI service](../fundamentals/service-basic-concepts.md)
- [Integrating Power BI tiles into Office documents](https://powerbi.microsoft.com/blog/integrating-power-bi-tiles-into-office-documents/)
- [Pin Reporting Services paginated report items to dashboards in Power BI](/sql/reporting-services/pin-reporting-services-items-to-power-bi-dashboards)

More questions? [Try the Power BI Community](https://community.fabric.microsoft.com/t5/Power-BI-forums/ct-p/powerbi).
