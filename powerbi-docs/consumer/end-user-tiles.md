---
title: Dashboard Tiles in Power BI Service for Business Users
description: Learn how to view, interact with, and troubleshoot Power BI dashboard tiles for business users, including tiles from SQL Server Reporting Services (SSRS).
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-explore
ms.search.form: Dashboard tiles in Power BI
ms.topic: how-to
ms.date: 12/01/2025
ai-usage: ai-assisted
LocalizationGroup: Dashboards
---

# Dashboard tiles in Power BI

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-ynny.md)]

Dashboard tiles are snapshots of your data that designers pin to dashboards in the Power BI service. This article helps business users understand how to open, interact with, and troubleshoot different types of tiles, including those from SQL Server Reporting Services (SSRS).

:::image type="content" source="./media/end-user-tiles/power-bi-dashboards.png" alt-text="Screenshot of a Power BI dashboard with several tiles.":::

In addition to tiles pinned from reports, designers can add standalone tiles directly to the dashboard using **Add tile**. Standalone tiles include text boxes, images, videos, streaming data, and web content.

> [!NOTE]
> The **Add tile** option is available only to users who have edit permissions for the dashboard. To add a tile: open the dashboard in edit mode, select **Edit** from the top menu, then select **Add a tile**. If you don't see this option, you might not have edit permissions for the dashboard, or you may need to switch to edit mode.

Need help understanding the Power BI building blocks? See [Basics of the Power BI service](../fundamentals/service-basic-concepts.md).

## Interact with tiles on a dashboard

1. Hover over the tile to show the ellipsis.

   :::image type="content" source="./media/end-user-tiles/power-bi-ellipsis.png" alt-text="Screenshot of a Power BI tile ellipsis used to open the tile action menu.":::

1. Select the ellipsis to open the tile action menu. Available options vary based on your permissions, visual type, and how the tile was created.

   :::image type="content" source="./media/end-user-tiles/power-bi-tile-menu.png" alt-text="Screenshot of the Power BI tile action menu options.":::

   Available actions include:

   - [Open the report used to create the tile](end-user-reports.md) :::image type="icon" source="./media/end-user-tiles/power-bi-chart-icon-new.png":::
   - [View the tile in focus mode](end-user-focus.md) :::image type="icon" source="./media/end-user-tiles/power-bi-fullscreen-icon.png":::
   - [View insights](end-user-insights.md) :::image type="icon" source="./media/end-user-tiles/power-bi-insights-icon.png":::
   - [Add a comment to start a discussion](end-user-comment.md) :::image type="icon" source="./media/end-user-tiles/power-bi-comment-icon.png":::
   - [Export data to Excel](/power-bi/visuals/power-bi-visualization-export-data) :::image type="icon" source="./media/end-user-tiles/power-bi-export-icon-new.png":::

1. Select a blank area on the canvas to close the action menu.

### Select a tile

When you select a tile, what happens depends on how it was created and whether it has a [custom link](../create-reports/service-dashboard-edit-tile.md). If it has a custom link, you're taken to that link. Otherwise, you're taken to the report, Excel Online workbook, on-premises SSRS report, or Q&A question used to create the tile.

> [!NOTE]
> Video tiles added by *designers* play inline on the dashboard when you select them.
>

## Considerations and troubleshooting

- If selecting a tile does nothing or shows an error, possible reasons include:
  - The report used to create the visualization isn't saved or is deleted.
  - The tile comes from an Excel Online workbook and you don't have at least Read permission to that workbook.
  - The tile comes from SSRS and you lack permission to the SSRS report or to the network that hosts the SSRS server.
- If you created the dashboard, rearrange tiles. Viewers can't rearrange tiles. To change tile order, contact the dashboard creator. 
- For tiles created directly on the dashboard with **Add tile**, if a custom hyperlink is set, selecting the title, subtitle, or tile opens that URL. Otherwise, selecting an image, web code, or text box tile does nothing.
- If the original visualization changes, the tile doesn't. For example, if the *designer* pins a line chart from a report then changes it to a bar chart, the dashboard tile still shows the line chart. The data refreshes, but the visualization type doesn't.
- If a workspace moves to Premium capacity, its existing dashboard refresh cache doesn't move. The service creates a new cache the first time a user opens the dashboard in Premium. Each data refresh then refreshes the cache and updates the data.
- If a tile is pinned from a workbook, you can't turn off its title and subtitle. The **Edit details** > **Display title and subtitle** option is grayed out.

## Mobile

In the mobile apps:

- Tap a tile to open its source, like a report, Q&A result, or workbook, under the same rules as the service.
- Use focus mode to enlarge and interact. Then annotate with mobile sharing features.
- Tile data freshness and live behavior match the service. You don't need extra mobile settings.

## Related content

- [Data refresh in Power BI](../connect-data/refresh-data.md)
- [Basics of the Power BI service](../fundamentals/service-basic-concepts.md)
