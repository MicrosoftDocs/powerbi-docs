---
title: Pin a tile from one dashboard to another dashboard
description: Learn how to pin a tile from one dashboard to another dashboard in the Power BI service using the IT Spend Analysis sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/28/2023
LocalizationGroup: Dashboards
---
# Pin a tile from one dashboard to another dashboard

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

One way to add a new [dashboard tile](../consumer/end-user-tiles.md) to a dashboard is to copy it from another dashboard. When you select either of these tiles, it links back to where it was created&mdash;either in Q&A or a report.

> [!NOTE]
> You can't pin tiles from shared dashboards.

## Prerequisites

- You just need a [Fabric free license](../consumer/end-user-features.md) to edit dashboards in My Workspace in the Power BI service.
- You need a Power BI Pro license to edit dashboards in other workspaces in the Power BI service. Read more about [Power BI Pro licenses](../fundamentals/service-self-service-signup-purchase-for-power-bi.md).
- You also need at least a Contributor role in that workspace. Read more about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).
- If you want to follow along, get the [IT Spend Analysis sample](sample-it-spend.md#get-the-built-in-sample) in the Power BI service.

## Pin a tile to another dashboard

1. Open the IT Spend Analysis sample dashboard.
1. Hover over the tile you want to pin, select **More options (...)**, then select **Pin tile**.
    :::image type="content" source="media/service-pin-tile-to-another-dashboard/power-bi-pushpin-2.png" alt-text="Screenshot of a tile highlighting more options and Pin tile.":::
1. Pin the tile to an existing dashboard or to a new dashboard.

   * **Existing dashboard**: select the name of the dashboard from the dropdown.
   * **New dashboard**: enter the name of the new dashboard.

    :::image type="content" source="media/service-pin-tile-to-another-dashboard/power-bi-pin-to-dashboard-2.png" alt-text="Screenshot of the Pin to dashboard dialog.":::

1. Select **Pin**.

1. If this dashboard doesn't yet have a sensitivity label, Power BI prompts you to specify one.

    :::image type="content" source="media/service-pin-tile-to-another-dashboard/power-bi-add-sensitivity-label.png" alt-text="Screenshot of the Add sensitivity label dialog.":::

1. A Success message near the top right corner lets you know the visualization was pinned to the selected dashboard.

    :::image type="content" source="media/service-pin-tile-to-another-dashboard/power-bi-pinned-to-dashboard-2.png" alt-text="Screenshot of the Pinned to dashboard dialog.":::

1. Select **Go to dashboard** to see the pinned tile. There, you can [rename, resize, link, and move](service-dashboard-edit-tile.md) the pinned visualization.

## Related content

* [Dashboard tiles in Power BI](../consumer/end-user-tiles.md)  
* [Dashboards for business users of the Power BI service](../consumer/end-user-dashboards.md)  
* More questions? [Ask the Power BI Community](https://community.powerbi.com/)
