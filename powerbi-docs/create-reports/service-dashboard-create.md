---
title: Create a Power BI dashboard from a report
description: Learn how to create a quick and easy dashboard that pins visualizations from an existing report in Power BI, and understand their relationship.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.custom: video-removed
ms.date: 04/09/2025
#customer intent: As a Power BI user I want to learn how to create dashboards with visulizations.
---
# Create a Power BI dashboard from a report

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

You've read [Introduction to dashboards in Power BI](service-dashboards.md), and now you want to create your own. There are many ways to create a dashboard. For example, you can create a dashboard from a report, from scratch, from a semantic model, or by duplicating an existing dashboard. In this article, you create a quick and easy dashboard that pins visualizations from an existing report.

After you complete this article, you'll understand:

- The relationship between dashboards and reports.
- How to pin tiles.
- How to navigate between a dashboard and a report.

[![Screenshot shows a Power BI dashboard with several visualizations.](media/service-dashboard-create/power-bi-completed-dashboard-small.png)](media/service-dashboard-create/power-bi-completed-dashboard-small.png#lightbox)

> [!NOTE]
> Dashboards are a feature of the Power BI service, not Power BI Desktop. You can't create dashboards in the Power BI mobile apps, but you can [view and share](../consumer/mobile/mobile-apps-view-dashboard.md) them there.
>
>

## Pin tiles to a dashboard

You can use the following steps and the [Procurement Analysis sample](sample-procurement.md) to try pinning visualizations to a new dashboard for yourself.

1. Open the Procurement Analysis sample report and then select **Edit** to open the report in Editing view.

    ![Screenshot of the report, highlighting more options and edit.](media/service-dashboard-create/power-bi-reading-view-new.png)

1. Hover over a visualization to and then to add a visualization to a dashboard, select the pin icon :::image type="icon" source="media/service-dashboard-create/power-bi-pin-icon.png":::.

    ![Screenshot of a visualization, highlighting the pin icon.](media/service-dashboard-create/power-bi-hover-new.png)
1. Select whether to pin to an existing dashboard or new dashboard.

   - **Existing dashboard**: Select the name of the dashboard from the dropdown. Dashboards that have been shared with you won't appear in the dropdown.
   - **New dashboard**: Enter the name of the new dashboard.

1. In this case, we select the option for **New dashboard** and enter a name.

    ![Screenshot of the Pin to dashboard window.](media/service-dashboard-create/power-bi-pin-tile.png)

1. When you select **Pin**, Power BI creates the new dashboard in the current workspace. After the **Pinned to dashboard** message appears, select **Go to dashboard**. If you're prompted to save the report, select **Save**.

    ![Screenshot of a success message, highlighting Go to dashboard.](media/service-dashboard-create/power-bi-pin-success.png)

    Power BI opens the new dashboard, which has one tile: the visualization you just pinned.

   ![Screenshot of a dashboard with one tile.](media/service-dashboard-create/power-bi-pinned.png)

1. Select the tile to return to the report.

     ![Screenshot of the Select the title element.](media/service-dashboard-create/select_the_title.png)

1. Pin a few more tiles to the new dashboard. When the **Pin to dashboard** window appears, select **Existing dashboard**.  

   ![Screenshot of the Pin to dashboard window, highlighting Existing dashboard.](media/service-dashboard-create/power-bi-existing-dashboard.png)

## Pin an entire report page

Another option is to pin an entire report page to a dashboard, which is an easy way to pin more than one visualization at a time. When you pin an entire page, the tiles are *live*. That is, you can interact with them there on the dashboard. Changes you make to any of the visualizations in the report editor, like adding a filter or changing the fields used in the chart, are reflected in the dashboard tile as well.  

For more information, see [Pin an entire report page](service-dashboard-pin-live-tile-from-report.md).

## Considerations and limitations

Some report formatting options or themes aren't applied to visuals when you pin them to a dashboard.

- Border, shadow, and background settings are ignored in the pinned tile.
- For card visuals, the text used for the value is shown in dashboards using the 'DIN' font family, with black text. You can change the text color for all the tiles on a dashboard by [creating a custom dashboard theme](service-dashboard-themes.md).
- Conditional formatting isn't applied.
- Button visuals that trigger bookmarks or clear or apply filters when you select them have no action in a dashboard tile. These actions only make sense within the context of a report.
- Visuals will adjust their size to fit the size of the tile. This can result in differences in layout as if the visual is resized on the report.
- Because some visualizations use background images, pinning might not work if the background image is too large. Try reducing the image size or using image compression.

## Related content

Congratulations on creating your first dashboard. Now that you have a dashboard, there's more you can do with it. Start exploring on your own, or see one of the following articles:

- [Resize and move tiles](service-dashboard-edit-tile.md)
- [All about dashboard tiles](service-dashboard-tiles.md)
- [Share your dashboard by creating an app](../collaborate-share/service-create-distribute-apps.md)
- [Power BI - Basic Concepts](../fundamentals/service-basic-concepts.md)
 [Tips for designing a great dashboard](service-dashboards-design-tips.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
