---
title: Optimize reports for the Power BI mobile apps
description: Learn how to optimize report pages for the Power BI mobile apps by creating a portrait version of the report specifically for phones.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.custom: contperf-fy20q4
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/08/2022
LocalizationGroup: Create reports
---

# Create a mobile-optimized report

## Prerequisite

* A completed report in the regular desktop layout view that contains all the visuals you will need in the mobile-optimized view.

## Considerations when creating mobile-optimized layouts
* For reports with multiple pages, you can optimize all the pages or just a few.
* If you've defined a background color for a report page, the mobile-optimized report will have the same background color.

## Open mobile layout view

To create the mobile-optimized view, open the report in either Power BI Desktop or in the Power BI service. When the report is open, go the mobile layout view.

# [Power BI Desktop](#tab/powerbi-desktop)

Select the **View** ribbon and choose **Mobile layout**.

![Screenshot of the mobile layout button on the View ribbon in Power B I Desktop.](media/power-bi-create-phone-report/power-bi-mobile-layout-button-desktop.png)

# [Power BI service](#tab/powerbi-service)

Choose **Edit report > Mobile Layout**. If the Edit option is not visible, look under **More options (...)**.

   ![Screenshot of the mobile layout button on the View ribbon in the Power B I service.](media/power-bi-create-phone-report/power-bi-mobile-layout-button-service.png)

---

The mobile layout view will open. You'll see the scrollable [mobile layout canvas](power-bi-mobile-layout-view.md#mobile-layout-canvas) where you'll create your layout, the [page visuals pane](power-bi-mobile-layout-view.md#page-visuals-pane) that lists all of the visuals that are on the original report page, and the [visualizations pane](power-bi-mobile-layout-view.md#visualizations-pane), where you will format visuals by changing their setings. The visualization pane is empty until you select a visual on the canvas. See [Mobile layout view](power-bi-mobile-layout-view.md) for further details about these design elements.  

![Screenshot of mobile layout view.](media/power-bi-create-mobile-optimized-report/power-bi-mobile-layout-view.png)

## Create an initial layout

From the page visuals pane, drag and drop the visuals you want to use onto the mobile-layout canvas. When you drag a visual to the canvas, by default it snaps to the grid. Alternatively, you can double-click the visual in the page visuals pane and it will be added to the canvas.

Once you've placed a visual on the canvas, resize it if necessary by dragging the handles that appear around the edge of the visual when you select it. To maintain the visual's aspect ratio while resizing, press the **Shift** key while dragging the resize handles.

Each time you drag a visual onto the canvas, it is added on its own layer on top of any other visuals that are already on the canvas. Visuals can be layered one on top of the other to create interactive reports using bookmarks, or to build attractive reports by layering visuals over images. Use the [Selection pane](power-bi-mobile-layout-view.md#selection-pane) to change the layering order of the visuals.

The image below illustrates dragging and dropping visuals from the page visuals pane onto the canvas, as well as resizing and overlaying some of them.

   ![Animated image of drag and drop, resize, and overlay of visuals.](media/power-bi-create-phone-report/desktop-mobile-layout-overlay-resize.gif)

>[!NOTE]
> * You can add some or all of the visuals in the Page visuals pane to the mobile-optimized report page.
> * You can drag and drop hidden visuals onto the canvas. They will be placed, but not shown unless their visibility status changes in the current desktop report view.

### Removing visuals from the mobile layout canvas

* To remove a single visual from the mobile layout, click the **X** in the top-right corner of the visual on the phone canvas, or select the visual and press **Delete**.

* To remove all the visualizations from the canvas, click the eraser on the **Page visuals** pane.

Removing visuals from the mobile layout canvas removes them from the mobile layout canvas only. The visuals remain available for use in the **Page visuals** pane, and the original desktop layout report remains unaffected.

## Fine tune visual formatting

Use the [visualizations pane](power-bi-mobile-layout-view.md#visualizations-pane) to optimize a visual's format for mobile layout.

On the mobile layout canvas, select the visual you want to format, and modify the relevant settings in the visualization pane.

When you first place a visual on the canvas, most of its format settings are connected to the desktop layout and take their values from there. See [Mobile formatting considerations and limitations](power-bi-mobile-layout-view.md#mobile-formatting-considerations-and-limitations) for exceptions. When you change a setting, that setting disconnects from desktop layout and becomes independent. Any changes you make to the setting won't affect the desktop layout, and vice versa; any changes you make to the setting in desktop layout won't affect mobile layout. When you change a visual's setting, an icon indicates that it has been changed.

![Screenshot of Visualizations pane showing a visual's changed property values.](media/power-bi-create-phone-report/visualizations-pane-mobile-layout-with-changes.png)

### Discarding mobile formatting changes

You can discard mobile formatting changes to a single category by selecting **Clear mobile changes** at the bottom of the category card. You can discard all mobile formatting changes for the visual by selecting **More options (…)** and choosing **Clear mobile formatting** from the context menu.

When you discard mobile formatting changes, the property (or properties) will take on the current desktop value and resume inheriting from the desktop layout.

With the exception of the mobile change indications and the clear mobile changes options, the Visualizations pane is similar to the Visualizations pane in desktop layout. For more information about using the Visualizations pane, see [The new Format pane in Power BI Desktop](../fundamentals/desktop-format-pane.md).

>[!NOTE]
> Formatting changes that you make to visuals in the mobile layout will not affect the desktop layout of your report.

### Alternate formatting option: Responsive visuals


**Visuals**

By default, many visuals, particularly chart-type visuals, are responsive.  That means they change dynamically to display the maximum amount of data and insight, no matter the screen size.

As a visual changes size, Power BI gives priority to the data. For example, it might remove padding and move the legend to the top of the visual automatically so that the visual remains informative even as it gets smaller.

![Responsive visual resizing](media/desktop-create-phone-report/desktop-mobile-layout-responsive-visual.gif)
 
Responsiveness can interfere with formatting using visual settings. To turn responsiveness off, select the visual on the canvas and then in the visualizations pane go to **General > Properties > Advanced options**.

### Slicers

Slicers offer on-canvas filtering of report data. When designing slicers in the regular report authoring mode, you can modify some slicer settings to make them more usable in mobile-optimized reports:
* You can decide whether to allow report readers to select only one item or multiple items.
* You can make the slicer vertical, horizontal, or responsive (responsive slicers must be horizontal).

If you make the slicer responsive, as you change its size and shape it shows more or fewer options. It can be tall, short, wide, or narrow. If you make it small enough, it becomes just a filter icon on the report page.

![Power BI responsive slicer](media/desktop-create-phone-report/desktop-create-phone-report-8.gif)
 
Read more about [creating responsive slicers](power-bi-slicer-filter-responsive.md).

## Mobile formatting examples

This section shows some examples of how Power BI's mobile formatting capabilities can be used to modify visuals so that they are more useful and suitable for mobile layout.

The examples show:
* How the grid orientation and style settings of a visual can be changed to better suit phone layout.
* How different shapes can be used to better fit the mobile design.
* How a visual's font size can be adjusted to fit in with other report visuals.
* How you can create precise, pixel perfect design with size and position settings.
* How chart settings can be adjusted to maximize real estate.

In the animated images below, the starting points show the mobile layout after some visuals have been placed on the canvas. The images then show how those visuals are changed using the Visualizations formatting pane. 

### Changing grid orientation to better suit mobile layout

The grid orientation of some visuals might work well in desktop layout but not so well in the smaller size and more limited space of a mobile screen. In this sample report page, the page navigator was stacked vertically. While this orientation worked well for desktop layout, it is not optimal for mobile layout. The image shows how the page navigator becomes horizontal by changing the Grid layout orientation setting in the Visualizations pane.

![Screenshot of changing the grid orientation in mobile layout view.](media/power-bi-create-phone-report/grid-orientation.gif)

### Changing a shape to use as a design element

You can take any shape created in desktop layout and change it into any other shape in mobile layout using the Shape setting. This makes it possible to repurpose shapes. The image below demonstrates how a rectangle shape in the desktop layout, which was used as a background for the page navigator, gets changed to a line shape in the mobile layout and is used to underline the page navigator. 

![Screenshot of changing the shape used in by the mobile layout.](media/power-bi-create-phone-report/shape-to-line.gif)

### Changing a visual's font size to better suit other visuals

The font sizes used in desktop layout are usually too large for mobile layout, taking up too much space and resulting in text that is hard to read. Therefore one of the most common things you need to do when you create a mobile layout is change the font sizes. In the image below, you can see how changing the font size on the card visual makes the text fit better into the other visual. Note how changing the display unit from thousands to millions also helps get the visual sized better for the mobile layout.

![Screenshot of changing a visual's font size.](media/power-bi-create-phone-report/change-font-size.gif)

### Using properties to precisely determine visual size and position

While mobile layout canvas already has a fine-grained grid and smart guides to help you size and align visuals, there are cases where you need to control the exact size and position of the visual. You can do this using the position and size setting.

>[!NOTE]
> Size and position settings are never inherited from the desktop layout. Therefore, when you make changes to size and position settings, no change indicator will appear. 

The images below shows how size and position settings can be used to size and align visuals. Note how multi-selecting the visuals makes it possible to apply the changes to several visuals at once. 

![Screenshot of using properties to precisely determine visual size and position.](media/power-bi-create-phone-report/picture-perfect-arrangement.gif)

### Using properties for optimize the a visual to save valuable screen real estate

Sometimes you can use a visual's settings to make it more compact and to save space. In the following example, we see a bar chart visual. To reduce the size that the visual takes up on the canvas, the legend and X axis get toggled off. However, removing the legend and X axis makes the bars unclear, as there are no values to go along with them. To remedy this, data labels are toggled on and centered on the bars. Saving space in such ways makes it possible to see more visuals at once, without having to scroll. 

Tip: Most charts have the responsive setting on by default. If you don't want the elements on your chart to be affected by the visual's size, toggle the responsive setting off in the visual's settings (General > Properties > Advanced options > Responsive)  

![Screenshot of using properties to save screen real estate.](media/power-bi-create-phone-report/save-real-estate.gif)

## Publish the mobile-optimized report

## Next steps
* Fine tune visual formatting
* [Create a phone view of a dashboard in Power BI](service-create-dashboard-mobile-phone-view.md).
* [View Power BI reports optimized for your phone](../consumer/mobile/mobile-apps-view-phone-report.md).
* [Power BI documentation on creating reports and dashboards](./index.yml).
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
