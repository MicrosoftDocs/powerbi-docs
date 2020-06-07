---
title: Optimize reports for the Power BI mobile apps
description: Learn how to optimize report pages for the Power BI mobile apps by creating a portrait version of the report specifically for phones and tablets.
author: paulinbar
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/07/2020
ms.author: painbar

LocalizationGroup: Create reports
---
# Optimize Power BI reports for the mobile app
You can improve the experience of viewing reports in the mobile apps by creating a mobile-optimized version of the report.

![Mobile-optimized report](media/desktop-create-phone-report/desktop-mobile-optimized-report.png).

This article describes features Power BI provides to help you create mobile-optimized versions of your reports.

Power BI has powerful capabilities for creating attractive, sophisticated, interactive reports. The Report view where you design and create your reports is geared towards landscape-oriented displays the size of computer screens or larger. On mobile devices such as phones, such reports may be difficult to use, since scaling them down to fit on a mobile screen often makes them too small to read. In addition, controls such as slicers may be rendered very small, making them difficult to tap on accurately. However, as the use of mobile devices increases and people rely more and more on being able to keep up with their data while on the go, it is increasing important to provide versions of your reports that are easy to view and use on mobile devices.

To answer this need, Power BI provides a number of features to help you create mobile-optimized versions of your reports:
* A mobile layout view for authoring mobile-optimized reports. This view supports overlaying visuals one on top of the other.
* Visuals and slicers that can be optimized for use on small, mobile screens.

These capabilities make it possible to use the same design techniques used in the web layout for building interactive reports using bookmarks. You can also create attractive reports by layering visuals over images.

## Mobile layout view

The mobile layout view provides
* A phone emulator with a long canvas with a fine-grained grid. This makes it possible to include many visuals, and to scale and shape them finely.
* A visualization pane that lists all the visuals used in the regular report view. The visualization pane shows the name of each visual and its visibility status. This makes it possible to find your desired visual by name, even when it is hidden on the emulator canvas. The visibility indicator makes it easy to differentiate between hidden and shown visuals at any given state.
* The ability to overlay visuals one on top of another. This lets you use the same design techniques used in the web layout for building interactive reports using bookmarks. You can also create attractive reports by layering visuals over images.

You can create responsive visuals and responsive slicers that resize anywhere. If you add filters to your report, they show up automatically in the optimized report.

## Create a mobile-optimized portrait version of a report page

The first step is to create the report in the regular web view. After you've created the report, you can optimize it for phones and tablets.

To create the mobile-optimized view:

1. Open the mobile layout
   * In Power BI Desktop, select the **View** ribbon and choose **Mobile layout**.
   * In the Power BI service, select **Edit report > Mobile Layout**.

   You see a scrollable, fine-grained canvas shaped like a phone, and a **Visualizations** pane that lists all of the visuals that are on the original report page.

   ![Mobile layout view](media/desktop-create-phone-report/desktop-mobile-layout.png).



### Add visuals to the mobile layout canvas
To add a visual to the mobile layout, drag it from the **Visualizations** pane to the phone canvas. When you drag the visual to the canvas, it snaps to the grid. Alternatively, you can double click the visual in the visualization pane and the visual will be added to the canvas.

   ![Drag and drop a visual](media/desktop-create-phone-report/desktop-mobile-layout-drag-drop.gif)
   
   You can add some or all the master report page visuals to the mobile-optimized report page. You can add each visual only once, and you don't have to include all the visuals.

### Resize visuals
You can resize your visuals on the grid by dragging the handles that appear around the edge of the visual when you select it. 

To maintain the visual's aspect ratio while resizing, press the **Shift** key while dragging the resize handels.

   ![Resize visual](media/desktop-create-phone-report/desktop-mobile-layout-resize-visual.gif)

The phone report grid scales across phones of different sizes, so your report looks good on small- and large-screen phones.
### Removing visuals
To remove a visual from the mobile layout, click the **X** in the top-right corner of the visual on the phone canvas, or select the visual and press **Delete**.

You can remove all the visualizations from the canvas by clicking the eraser on the **Visualization** pane.

Removing visuals from the mobile layout canvas removes them from the canvas only. The visuals still appear in the visualization pane, and the original report remains unaffected.

## Optimize a visual for any size

By default, visuals in your report or dashboard are responsive. That is, they change dynamically to display the maximum amount of data and insight, no matter the screen size.

As a visual changes size, Power BI gives priority to the data. For example, it might remove padding and move the legend to the top of the visual automatically so that the visual remains informative even as it gets smaller.

![Responsive visual resizing](media/desktop-create-phone-report/desktop-mobile-layout-responsive-visual.gif)
 
If for some reason you want to turn responsiveness off, you can do that in the [format settings of the visual](). Read more about [optimizing visuals]().

## Enhance slicers to work well in mobile-optimized reports

Slicers offer on-canvas filtering of report data. When designing slicers in the regular report authoring mode, you can modify some slicer settings to make them more usable in mobile-optimized reports:
* You can decide whether to allow report readers to select only one item or multiple items.
* It is recommended to put a box around the slicer to make the report easier to scan.
* You can make the slicer vertical, horizontal, or responsive (responsive slicers must be horizontal).

If you make the slicer responsive, as you change its size and shape it shows more or fewer options. It can be tall, short, wide, or narrow. If you make it small enough, it becomes just a filter icon on the report page.

Create animated image

![Power BI responsive slicer](media/desktop-create-phone-report/desktop-create-phone-report-8.png)
 
Read more about [creating responsive slicers]().

## Remove visuals from the mobile layout

To remove a visual from the mobile layout, click the **X** in the top-right corner of the visual on the phone canvas, or select the visual and press **Delete**.

You can remove all the visualizations from the canvas by clicking the eraser on the **Visualization** pane.

Removing visuals from the mobile layout canvas removes them from the canvas only. The visuals still appear in the visualization pane, and the original report remains unaffected.

## Considerations when creating mobile-optimized layouts
* For reports with multiple pages, you can optimize all the pages or just a few.
* If you've defined a background color for a report page, the mobile-optimized report will have the same background color.
* You can't modify format settings just for the mobile-optimized report. Formatting is consistent between the master and mobile layouts. For example, the font sizes will be the same.
* To change a visual, such as changing its formatting, dataset, filters, or any other attribute, return to the regular report authoring mode.

## Publish a mobile-optimized report
To publish a mobile-optimized version of a report, [publish the main report from Power BI Desktop to the Power BI service](desktop-upload-desktop-files.md). This publishes the mobile-optimized version at the same time.

## Viewing optimized and unoptimized reports on a phone or tablet

The Power BI mobile apps on phones automatically detect whether the report is mobile-optimized or not.
* If a mobile-optimized report exists, the app automatically opens the report in mobile-optimized mode.
* If a mobile-optimized report doesn’t exist, the report opens in the unoptimized, landscape view.

Holding a phone in landscape orientation opens the report in the unoptimized view with the original report layout, regardless of whether the report is optimized or not. If you optimize only some pages, readers see a message in portrait view, indicating that the report is available in landscape.

![Phone page not optimized](media/desktop-create-phone-report/desktop-create-phone-report-9.png)
 
Report readers can turn their phones or tablets sideways to see the page in landscape mode. Read more about interacting with Power BI reports optimized for portrait mode.

## Next steps
* [Create a phone view of a dashboard in Power BI](service-create-dashboard-mobile-phone-view.md).
* [View Power BI reports optimized for your phone](../consumer/mobile/mobile-apps-view-phone-report.md).
* [Create responsive visuals optimized for any size](../visuals/power-bi-report-visualizations.md).
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/).