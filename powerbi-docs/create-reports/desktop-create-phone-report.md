---
title: Optimize reports for the Power BI mobile apps
description: Learn how to optimize report pages for the Power BI mobile apps by creating a portrait version of the report specifically for phones and tablets.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.custom: contperf-fy20q4
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/22/2021
LocalizationGroup: Create reports
---
# Optimize Power BI reports for the mobile app

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Mobile users can view any Power BI report page in landscape orientation. However, report authors can create an additional view that is optimized for mobile devices and displays in portrait orientation. This design option, which is available in both Power BI Desktop and in the Power BI service, enables authors to select and rearrange just those visuals that make sense for mobile users on the go.

![Screenshot of mobile-optimized reports in portrait and landscape orientation.](media/desktop-create-phone-report/desktop-mobile-optimized-report.png)

Power BI provides a number of features to help you create mobile-optimized versions of your reports:
* A mobile layout view where you can create your mobile-optimized report by dragging and dropping visuals onto a phone emulator canvas.
* Visuals and slicers that can be optimized for use on small, mobile screens.

These capabilities make it possible to design and build attractive, interactive mobile-optimized reports.

## Create a mobile-optimized portrait version of a report page

**Prerequisite**: The first step is to design and create the report in the regular web view. After you've created the report, you can optimize it for phones and tablets.

To create the mobile-optimized view, open the report in either Power BI Desktop or in the Power BI service. When the report is open, go the mobile layout view.

# [Power BI Desktop](#tab/powerbi-desktop)

Select the **View** ribbon and choose **Mobile layout**.

# [Power BI service](#tab/powerbi-service)

Choose **Edit report > Mobile Layout**. If the Edit option is not visible, look under **More options (...)**.

---

You see a scrollable canvas shaped like a phone, and a **Page visuals** pane that lists all of the visuals that are on the original report page.

* Each visual in the **Page visuals** pane appears with its name for easy identification.
* Each visual also has a visibility indicator. The visibility indicator of a visual changes depending on the visibility status of the visual in the current state of the web report view. The visibility indicator is useful when working with bookmarks.

   ![Mobile layout view](media/desktop-create-phone-report/desktop-mobile-layout.png)

## Add visuals to the mobile layout canvas
To add a visual to the mobile layout, drag it from the **Page visuals** pane to the phone canvas. When you drag the visual to the canvas, it snaps to the grid. Alternatively, you can double-click the visual in the visualization pane and the visual will be added to the canvas.

You can add some or all of the web report page visuals to the mobile-optimized report page. You can add each visual only once, and you don't have to include all the visuals.

>[!NOTE]
> You can drag and drop hidden visuals onto the canvas. They will be placed, but not shown unless their visibility status changes in the current web report view.

Visuals can be layered one on top of the other to create interactive reports using bookmarks, or to build attractive reports by layering visuals over images. You can change the layering order of the visuals in the [Selection pane](#set-the-layering-order-of-visuals-on-the-mobile-layout-canvas).

Once you've placed a visual on the canvas, you can resize it by dragging the handles that appear around the edge of the visual when you select it. To maintain the visual's aspect ratio while resizing, press the **Shift** key while dragging the resize handles.

The image below illustrates dragging and dropping visuals from the **Page visuals** pane onto the canvas, as well as resizing and overlaying some of them.

   ![Drag and drop, resize, and overlay visuals](media/desktop-create-phone-report/desktop-mobile-layout-overlay-resize.gif)

The phone report grid scales across phones of different sizes, so your report looks good on small- and large-screen phones.

## Set the layering order of visuals on the mobile layout canvas

Each time you drag a visual onto the canvas, it is added on its own layer on top of any other visuals that are already on the canvas. The **Selection** pane enables you to change the layering order.

To open the **Selection** pane, click the **Selection** button in the **Show panes** section on the **View** tab. 

The **Selection** pane lists all the visuals that are on the canvas. The order of the list reflects the layer ordering on the canvas - the first listed visual is on the top-most layer, the last listed visual is on the bottom-most layer. To change the order, you can either drag and drop a visual to another place on the list, or select a visual and use the arrow buttons to move it up or down.

The **Selection** pane also has a visibility indication for each visual in the list, but it is not possible to change the visibility in the mobile layout view - this must be done in the regular web layout view.

![Screenshot showing selection pane and how to open it.](media/desktop-create-phone-report/selection-pane-mobile-layout.png)

## Remove visuals from the mobile layout canvas
To remove a visual from the mobile layout, click the **X** in the top-right corner of the visual on the phone canvas, or select the visual and press **Delete**.

You can remove all the visualizations from the canvas by clicking the eraser on the **Page visuals** pane.

Removing visuals from the mobile layout canvas removes them from the canvas only. The visuals still appear in the **Page visuals** pane, and the original report remains unaffected.

## Configure visuals and slicers for use in mobile-optimized reports

### Visuals

By default, many visuals, particularly chart-type visuals, are responsive.  That means they change dynamically to display the maximum amount of data and insight, no matter the screen size.

As a visual changes size, Power BI gives priority to the data. For example, it might remove padding and move the legend to the top of the visual automatically so that the visual remains informative even as it gets smaller.

![Responsive visual resizing](media/desktop-create-phone-report/desktop-mobile-layout-responsive-visual.gif)
 
If for some reason you want to turn responsiveness off, you can do that in the **General** section of the visual's format settings.

### Slicers

Slicers offer on-canvas filtering of report data. When designing slicers in the regular report authoring mode, you can modify some slicer settings to make them more usable in mobile-optimized reports:
* You can decide whether to allow report readers to select only one item or multiple items.
* You can make the slicer vertical, horizontal, or responsive (responsive slicers must be horizontal).

If you make the slicer responsive, as you change its size and shape it shows more or fewer options. It can be tall, short, wide, or narrow. If you make it small enough, it becomes just a filter icon on the report page.

![Power BI responsive slicer](media/desktop-create-phone-report/desktop-create-phone-report-8.gif)
 
Read more about [creating responsive slicers](power-bi-slicer-filter-responsive.md).

## Publish a mobile-optimized report
To publish a mobile-optimized version of a report, [publish the main report from Power BI Desktop to the Power BI service](desktop-upload-desktop-files.md). This publishes the mobile-optimized version at the same time.

## Viewing optimized and unoptimized reports on a phone or tablet

In the Power BI mobile apps, mobile-optimized reports are indicated by a special icon.

![Mobile optimized report icon](media/desktop-create-phone-report/desktop-create-phone-report-optimized-icon.png)

On phones, the app automatically detects whether the report is mobile-optimized or not.
* If a mobile-optimized report exists, the app automatically opens the report in mobile-optimized mode.
* If a mobile-optimized report doesn’t exist, the report opens in the unoptimized, landscape view.

Holding a phone in landscape orientation opens the report in the unoptimized view with the original report layout, regardless of whether the report is optimized or not.

If you optimize only some pages, when readers come to an unoptimized page they will be prompted to switch to landscape view. Turning the phone or tablet sideways will enable them to see the page in landscape mode. [Read more about interacting with Power BI reports optimized for portrait mode](../consumer/mobile/mobile-apps-view-phone-report.md).

![Phone page not optimized](media/desktop-create-phone-report/desktop-create-phone-report-9.png)

## Considerations when creating mobile-optimized layouts
* For reports with multiple pages, you can optimize all the pages or just a few.
* If you've defined a background color for a report page, the mobile-optimized report will have the same background color.
* You can't modify format settings just for the mobile-optimized report. Formatting is consistent between the master and mobile layouts. For example, the font sizes will be the same.
* To change a visual, such as changing its formatting, dataset, filters, or any other attribute, return to the web report authoring mode.

## Next steps
* [Create a phone view of a dashboard in Power BI](service-create-dashboard-mobile-phone-view.md).
* [View Power BI reports optimized for your phone](../consumer/mobile/mobile-apps-view-phone-report.md).
* [Power BI documentation on creating reports and dashboards](./index.yml).
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
