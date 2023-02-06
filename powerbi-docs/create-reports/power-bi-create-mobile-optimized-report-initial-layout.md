---
title: Create an initial layout 
description: Learn how to create an initial mobile-optimized layout by using the mobile layout view's Page visuals pane.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/06/2023
LocalizationGroup: Create reports
---

# Create an initial layout

Use the **Page visuals** pane to create an initial layout for your mobile-optimized view.

## The Page visuals pane

The **Page visuals** pane lists all of the visuals, both shown and hidden, that are on the original report page. The following features help you select the visuals you want to use in your mobile-optimized view:

:::image type="content" source="media/power-bi-create-mobile-optimized-report-initial-layout/mobile-layout-page-visuals-pane.png" alt-text="Screenshot of the Page visuals pane in Power BI mobile layout view.":::

* **Visual name**: Helps to identify the visual.
* **Appearance status**: Indicates the appearance status of the visual&mdash;visible or hidden. This indicator changes depending on the appearance status of the visual in the current state of the web report view. The appearance indicator is useful when working with bookmarks.
* **Filter by appearance status**: Filters the visuals according to appearance status, making it easier to find a visual.
* **Remove all visuals from canvas**: Removes all visuals from the canvas. Removing visuals from the canvas doesn't remove them from the Page visuals pane. They remain available for you to use.

## Lay out visuals on the canvas

To place a visual on the canvas, drag and drop the visual you want to use from the page visuals pane onto the mobile layout canvas. When you drag a visual to the canvas, by default, it snaps to the grid. Alternatively, you can double-click the visual on the page visuals pane, and it will be added to the canvas.

Once you've placed a visual on the canvas and you select it, you can resize it by dragging the handles that appear around the edge of the visual. To maintain the visual's aspect ratio while resizing, press the **Shift** key while dragging the resize handles.

Each time you drag a visual onto the canvas, it's added on its own layer on top of any other visuals that are already on the canvas. Visuals can be layered one on top of the other to create interactive reports using bookmarks or to build attractive reports by layering visuals over images. Use the [Selection pane](power-bi-create-mobile-optimized-report-order-layers.md) to change the layering order of the visuals.

The following animation illustrates dragging, dropping, resizing, and overlaying visuals from the page visuals pane onto the canvas.

:::image type="content" source="media/power-bi-create-mobile-optimized-report-initial-layout/desktop-mobile-layout-overlay-resize.gif" alt-text="Animation of visuals being dragged and dropped, resized, and overlaid.":::

>[!NOTE]
> * You can add some or all of the visuals in the Page visuals pane to the mobile-optimized report page.
> * You can drag and drop hidden visuals onto the canvas. They'll be placed, but not shown unless their visibility status changes in the current desktop report view.

### Remove visuals from the mobile layout canvas

* To remove a single visual from the mobile layout, select the **X** in the top-right corner of the visual on the phone canvas, or select the visual and press **Delete**.

* To remove all the visualizations from the canvas, select the eraser on the **Page visuals** pane.

Removing visuals from the mobile layout canvas removes them from the mobile layout canvas only. The visuals remain available for use in the **Page visuals** pane, and the original desktop layout report remains unaffected.

## Next steps

* [Optimize visual formatting](power-bi-create-mobile-optimized-report-format-visuals.md)