---
title: 'Pin an entire report page to a Power BI dashboard'
description: Learn how to pin an entire live report page to a Power BI dashboard from a report and then interact with the tiles on that dashboard.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/25/2024
ms.custom: video-removed
LocalizationGroup: Dashboards
---

# Pin an entire report page to a Power BI dashboard as a live tile

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Another way to add a new [dashboard tile](../consumer/end-user-tiles.md) is by pinning an entire report page. This method allows you to pin more than one visualization at a time. Also, when you pin an entire page, the tiles are *live*; you can interact with them right there on the dashboard. Changes you make to any of the visualizations back in the report editor, like adding a filter or changing the fields used in the chart, are reflected in the dashboard tile as well.

:::image type="content" source="media/service-dashboard-pin-live-tile-from-report/power-bi-pin-entire-page.png" alt-text="Screenshot of live tile page pinned from the report." lightbox="media/service-dashboard-pin-live-tile-from-report/power-bi-pin-entire-page.png":::

Pinning live tiles from reports to dashboards is only available in the Power BI service (app.powerbi.com).

> [!NOTE]
> You can't pin tiles from reports that are shared with you.
>

## Pin a report page

Follow these step-by-step instructions to try pinning a live report to a dashboard for yourself.

1. Open a report in [Editing view](service-interact-with-a-report-in-editing-view.md).

1. With no visualizations selected, from the menu bar, select the **Pin** icon.

   :::image type="content" source="media/service-dashboard-pin-live-tile-from-report/power-bi-pin.png" alt-text="Screenshot highlighting the Pin icon on the menu bar.":::

1. Pin the tile to an existing dashboard or to a new dashboard. Notice the highlighted text: *Pin live page enables changes to reports to appear in the dashboard tile when the page is refreshed.*

   - **Existing dashboard**: Select the name of the dashboard from the dropdown. Dashboards that were shared with you don't appear in the dropdown.
   - **New dashboard**: Enter the name of the new dashboard.

      :::image type="content" source="media/service-dashboard-pin-live-tile-from-report/pbi-pin-live-page-dialog.png" alt-text="Screenshot showing the Pin to dashboard screen." lightbox="media/service-dashboard-pin-live-tile-from-report/pbi-pin-live-page-dialog.png":::

1. Select **Pin live**. A Success message (near the top right corner) lets you know the page was added as a tile to your dashboard.

## Pinned live tile on the dashboard

Open the dashboard to see the pinned live tile:

1. From the nav pane, select the dashboard with the new live tile. There you can do things like [rename, resize, link, and move](service-dashboard-edit-tile.md) the pinned report page.

1. Interact with the live tile. In the following screenshot, you can see how selecting a bar on the column chart cross-filters and cross-highlights the other visualizations on the tile.

    :::image type="content" source="media/service-dashboard-pin-live-tile-from-report/pbi-live-tile.png" alt-text="Screenshot showing dashboards with a live tile." lightbox="media/service-dashboard-pin-live-tile-from-report/pbi-live-tile.png":::

    > [!NOTE]
    > Report tiles aren't interactive when viewed in the Power BI mobile apps.

## Related content

- [Dashboards for business users of the Power BI service](../consumer/end-user-dashboards.md)

More questions? Ask the [Power BI Community](https://community.powerbi.com/).
