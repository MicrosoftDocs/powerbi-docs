---
title: Mobile layout view
description: Learn about mobile layout view which is used to create mobile optimized views of Power BI report pages.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 02/13/2022
LocalizationGroup: Create reports
---
# Mobile layout view

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI's mobile layout view is used to create views of report pages that are optimized for viewing on mobile devices. Mobile layout view is available in both Power BI Desktop and in the Power BI service. This article explains how to open the mobile layout view and describes the features it provides.

![Screenshot of mobile layout view in Power B I.](media/power-bi-mobile-layout-view/power-bi-mobile-layout-view.png)

* **Mobile layout canvas**: Create your mobile optimized view on the mobile layout canvas. The canvas has a fined-grained grid to help you place your visuals.
* **Page visuals pane**: The page visuals pane lists all of the visuals that are included on the original report page. From the visuals listed in the page visuals pane you choose which visuals you want to include in your mobile-optimized view.
* **Visualizations pane**: The visualizations pane enables you to format visuals by changing their format settings. The visualizations pane is empty until you select a visual on the canvas.
* **Selection pane**: The selection pane enables you to change the layering order of visuals on the canvas.

Each of these features is explained in the sections below.

## How to open mobile layout view

You can open mobile layout view in both Power BI Desktop and the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

Select the **View** ribbon and choose **Mobile layout**.

![Screenshot of the mobile layout button on the View ribbon in Power B I Desktop.](media/power-bi-mobile-layout-view/power-bi-mobile-layout-button-desktop.png)

# [Power BI service](#tab/powerbi-service)

Choose **Edit report > Mobile Layout**. If the Edit option is not visible, look under **More options (...)**.

   ![Screenshot of the mobile layout button on the View ribbon in the Power B I service.](media/power-bi-mobile-layout-view/power-bi-mobile-layout-button-service.png)

---

## Mobile layout canvas

The scrollable phone emulator canvas is where you create your mobile-optimized layout. The canvas features a fine-grained grid to help you layout your visuals. Canvas controls enable you to turn off the grid, enable/disable snap-to-grid, and lock visuals in place to prevent them from accidentally being moved around. The grid scales across phones of different sizes, so your report looks good on small- and large-screen phones.

![Screenshot of mobile layout view phone emulator canvas.](media/power-bi-mobile-layout-view/power-bi-mobile-layout-view-phone-emulator-canvas.png)





## Selection pane

The selection pane enables you to change the layering order of visuals on the canvas..

To open the selection pane, click the **Selection** button in the **Show panes** section of the mobile layout view.

The selection pane lists all the visuals that are on the canvas. The order of the list reflects the layer ordering on the canvas - the first listed visual is on the top-most layer, the last listed visual is on the bottom-most layer. To change the order, you can either drag and drop a visual to another place on the list, or select a visual and use the arrow buttons to move it up or down.

The selection pane also has an appearance indication for each visual in the list, but it is not possible to change the appearance in the mobile layout view - this must be done in the regular desktop layout view.

![Screenshot showing selection pane and how to open it.](media/power-bi-mobile-layout-view/mobile-layout-selection-pane.png)

## Next steps
* [Create a mobile-optimized report](power-bi-create-phone-report-how-to.md)
* [About mobile optimized reports](power-bi-create-phone-report.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
