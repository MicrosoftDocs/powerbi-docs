---
title: Create a responsive slicer you can resize in Power BI
description: Learn how to create a responsive slicer you can resize to fit your report.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/17/2023
LocalizationGroup: Create reports
---
# Create a responsive slicer you can resize in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Responsive slicers resize to fit any space on your report. With responsive slicers, you can resize them to different sizes and shapes, from horizontal tile to square to vertical, and the values in the slicer rearrange themselves as you do. In Power BI Desktop and in the Power BI service, you can make tile slicers and date/range slicers responsive. Date/range slicers also have improved touch areas, so it's easier to change them with a fingertip. You can make responsive slicers as small or as large as you want. They also resize automatically to fit well on reports in the Power BI service and also in the Power BI mobile apps.

![Animation of slicers being moved and resized.](media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-0-slicer.gif)

## Create a slicer

The first step to creating a dynamic slicer is to create a basic slicer.

1. Select the **Slicer** icon :::image type="icon" source="media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-0-slicer-icon.png"::: in the **Visualizations** pane.
2. Drag the field you want to filter on to **Field**.

    ![Screenshot shows a field that has been added to the slicer in Power BI Desktop.](media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-1-create.png)

## Convert to a tile slicer

1. With the slicer selected, in the **Visualizations** pane, select the **Format** tab.

2. Expand the **Slicer settings** section, then for **Style**, select **Tile**.

    ![Screenshot shows setting the slicer style to Tile in Power BI Desktop.](media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-tile.png)

You'll probably want to make it wider, to show more values.

![Screenshot shows the slicer with its width increased.](media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-3-wider.png)

## Make it responsive and experiment with it

This step is easy.

1. With the slicer selected, in the **Visualizations** pane, select the **Format** tab.

1. Under **Properties**, expand **Advanced options**, and then slide **Responsive** to **On**.

    ![Screenshot shows the slicer is now responsive in Power BI service.](media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-4-responsive-on.png)

1. Now you can play with it. Drag the corners to make it short, tall, wide, and narrow. If you make it small enough, it becomes just a filter icon.

    ![Screenshot shows the responsive slicer is so small that it's a filter icon.](media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-5-mini-icon.png)

## Add it to a phone report layout

In Power BI Desktop, you can create a phone layout for each page of a report. If a page has a phone layout, it displays on a mobile phone in portrait view. Otherwise, you need to view it in landscape view.

1. On the **View** menu, select **Mobile layout**.

     ![Screenshot of the Mobile layout button in the View menu.](media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-6-phone-layout-button.png)

1. Drag all the visuals you want in the phone report to the grid. When you drag the responsive slicer, make it the size you want--in this case, just a filter icon.

    ![Screenshot of the slicer in the phone report layout.](media/power-bi-slicer-filter-responsive/power-bi-slicer-filter-responsive-7-phone-slicer-icon.png)

Read more about creating [reports optimized for the Power BI mobile apps](power-bi-create-mobile-optimized-report-about.md).

## Make a time or range slicer responsive

You can follow the same steps to make a time or range slicer responsive. After you set **Responsive** to **On**, you notice a few things:

- Visuals optimize the order of input boxes depending on the size allowed on the canvas.
- Data-element display is optimized to make the slicer as usable as possible, based on the size it's allowed on the canvas.
- New round handlebars on the sliders optimize touch interactions.
- When a visual becomes too small to be useful, it becomes an icon representing the visual type in its place. To interact with it, just double-tap to open it in focus mode. This saves valuable space on the report page without losing the functionality.

## Related content

- [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md)
- More questions? [Ask the Power BI Community](https://community.powerbi.com/)
