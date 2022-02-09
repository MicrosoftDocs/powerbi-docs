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
# Format visuals for mobile-optimized reports

Use the visualizations pane to format a visual for mobile layout.

>[!NOTE]
> Formatting changes that you make to visuals in the mobile layout will not affect the desktop layout of your report.

On the mobile layout canvas, select the visual you want to format. The visual's properties will display on the visualizations pane. The visual's properties are split out on to two tabs. The **Visual** tab contains settings that pertain only to the visual, while the **General** tab contains settings that are consistent across all visual types. Expand the categories to start editing properties.

When you first place a visual on the canvas, most of its property values are inherited from the desktop layout. When you change a property, however, the property stops inheriting from the desktop layout and becomes independent. Any changes you make to the property won't affect the desktop layout, and vice versa; any changes you make to the property in desktop layout won’t affect mobile layout. 
When you change a visual's property, an icon indicates that the property has changed.

![Screenshot of Visualizations pane showing a visual's changed property values.](media/power-bi-create-phone-report/visualizations-pane-mobile-layout-with-changes.png)

You can discard mobile formatting changes to a single category by selecting **Clear mobile changes** at the bottom of the category card. You can discard all mobile formatting changes for the visual by selecting **More options (…)** and choosing **Clear mobile formatting** from the context menu.

When you discard mobile formatting changes, the property (or properties) will take onthe current desktop value and resume inheriting from the desktop layout.

With the exception of the mobile change indications and the clear mobile changes options, the Visualizations pane is similar to the Visualizations pane in desktop layout. For more information about using the Visualizations pane, see [The new Format pane in Power BI Desktop](../fundamentals/desktop-format-pane.md).

## Examples

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

## Next steps
* [Create a phone view of a dashboard in Power BI](service-create-dashboard-mobile-phone-view.md).
* [View Power BI reports optimized for your phone](../consumer/mobile/mobile-apps-view-phone-report.md).
* [Power BI documentation on creating reports and dashboards](./index.yml).
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
