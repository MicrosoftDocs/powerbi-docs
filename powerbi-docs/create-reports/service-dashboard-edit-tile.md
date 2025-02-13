---
title: Create or edit a dashboard tile
description: Learn how to create, edit, resize, move, rename, pin, delete, and add hyperlinks to a dashboard tile.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.custom: video-removed
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/15/2023
LocalizationGroup: Dashboards
---
# Create or edit a dashboard tile

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

## Dashboard *owners* versus dashboard *consumers*

When you create or own a dashboard, you have many options for changing the look and default behavior of the tiles on that dashboard. Use the following settings and strategies to design the dashboard *consuming* experience for your colleagues. Will selecting a tile open the underlying report, a custom URL, or a different dashboard? Maybe you'll [add a tile that displays a video or streaming data](service-dashboard-add-widget.md)? You might even want to [create a tile that has interactive slicers](service-dashboard-pin-live-tile-from-report.md). As a *creator* you have many options.

This article covers how to:

* [Create a visualization and pin it to a dashboard](#create)
* [Move a tile](#move)
* [Resize a tile](#resize)
* [Rename a tile](#rename)
* [Add a hyperlink to a tile](#hyperlink)
* [Pin a tile to a different dashboard](#different)
* [Delete a tile](#delete)

  > [!TIP]
  > To change the visualization shown on the tile itself, delete the tile and add a new [dashboard tile](../consumer/end-user-tiles.md).

## Prerequisites

You just need a [Fabric free license](../consumer/end-user-features.md) to explore the samples in the Power BI service, and save them to your My workspace.

## Get the sample

To follow along, open the Power BI service (app.powerbi.com). 

1. Select **Learn** in the left nav.

1. On the Learning center page, under **Sample reports**, scroll until you see the **IT Spend Analysis sample**.

1. Select the sample. It opens in Reading mode.

<a name="create"></a>

## Create a visualization and pin it to the dashboard

1. Open the report in Editing view by selecting **Edit** from the top menu bar.

1. Add a new report page by selecting the plus sign (+) at the bottom of the report.

    :::image type="content" source="media/service-dashboard-edit-tile/power-bi-add-page.png" alt-text="Screenshot of the page list, highlighting the plus icon.":::

1. From the **Data** pane, select **Fact** > **Amount** and **Business Area** > **Business Area**.

1. From the **Visualizations** pane, select the Donut chart icon to convert the visualization to a Donut chart.

    :::image type="content" source="media/service-dashboard-edit-tile/power-bi-donut-chart.png" alt-text="Screenshot of the Visualizations pane, highlighting the Donut icon.":::

1. Select the pin icon and pin the Donut chart to the IT Spend Analysis sample dashboard.

    :::image type="content" source="media/service-dashboard-edit-tile/power-bi-pin.png" alt-text="Screenshot of the tile, highlighting the pin icon.":::

1. When the **Pinned to dashboard** message appears, select **Go to dashboard**. You'll be prompted to save your changes. Select **Save**.

- - -
<a name="move"></a>

## Move the tile

On the dashboard, locate the new tile. Select and hold the tile to drag it to a new location on the dashboard canvas.

<a name="resize"></a>

## Resize the tile

You can make tiles many different sizes&mdash;from 1x1 tile units up to 5x5. Select and drag the handle in the bottom right corner to resize the tile.

:::image type="content" source="media/service-dashboard-edit-tile/pbigif_resizetile4.gif" alt-text="Animation of a sample tile being resized.":::

## Edit details

1. Select **More options** (...) in the upper-right corner of the tile.

   :::image type="content" source="media/service-dashboard-edit-tile/power-bi-tile.png" alt-text="Screenshot of a tile, highlighting the ellipses.":::

1. Hover over the "Amount" tile and select the ellipses to display the options. The options available vary by tile type. For example, the options available for a live tile are different from options available for a standard visualization tile. Also, if someone has shared a dashboard with you, you aren't the owner, and you'll have fewer options.

   :::image type="content" source="media/service-dashboard-edit-tile/power-bi-tile-menu-new.png" alt-text="Screenshot of the ellipses options menu.":::

1. Select **Edit details** to open the "Tile details" dialog.

    Change the title and default behavior of the tile. For example, you might decide that a new dashboard displays when a *consumer* selects a tile, instead of opening the report that was used to create that tile.

<a name="rename"></a>

### Rename the tile

At the top of the "Tile details" dialog, change **Title** to **Amount spent**.

:::image type="content" source="media/service-dashboard-edit-tile/power-bi-tile-title.png" alt-text="Screenshot showing the Tile details dialog.":::

<a name="hyperlink"></a>

### Change the default hyperlink

By default, selecting a tile usually takes you to the report where the tile was created or to Q&A if the tile was created in Q&A. Add a custom link to a tile to link to a webpage, another dashboard or report in the same workspace, a SQL Server Reporting Services (SSRS) report, or other online content.

1. In the Functionality section on the "Tile details" dialog, select **Set custom link**.

1. Select **Link to a dashboard or report in the current workspace** and then select from the dropdown. In this example, the Human Resources sample dashboard is selected. If you don't have this sample already in your workspace, you can add it and come back to this step, or you can select a different dashboard.

    :::image type="content" source="media/service-dashboard-edit-tile/power-bi-custom-link.png" alt-text="Screenshot showing the Functionality dialog.":::

1. Select **Apply**.

1. The new title displays on the tile. When you select the tile, Power BI opens the Human Resources dashboard.

    :::image type="content" source="media/service-dashboard-edit-tile/power-bi-title.png" alt-text="Screenshot of a tile, highlighting the title.":::

<a name="different"></a>

### Pin the tile to a different dashboard

1. From **More options**, select **Pin tile** :::image type="icon" source="../media/pin-icon.png":::.
1. Decide whether to pin a duplicate of this tile to an existing dashboard or to a new dashboard.

   :::image type="content" source="media/service-dashboard-edit-tile/pbi_pintoanotherdash.png" alt-text="Screenshot of the Pin to Dashboard dialog.":::
1. Select **Pin**.

<a name="delete"></a>

### Delete the tile

1. To permanently remove a tile from a dashboard, select **More options** > **Delete tile** :::image type="icon" source="media/service-dashboard-edit-tile/power-bi-delete-tile-icon.png"::: from the ellipses dropdown menu.

1. Deleting a tile doesn't delete the underlying visualization. Open the underlying report by selecting the "Amount" tile. Open the last page in your report to see that the original visualization hasn't been deleted from the report.

## Related content

* [Dashboard tiles in Power BI](../consumer/end-user-tiles.md)

* [Dashboards in Power BI](../consumer/end-user-dashboards.md)

* [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
