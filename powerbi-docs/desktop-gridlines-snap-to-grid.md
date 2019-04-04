---
title: Use gridlines and snap-to-grid in Power BI Desktop reports
description: Use gridlines, snap-to-grid, z-order, alignment and distribution in Power BI Desktop reports
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: davidi

LocalizationGroup: Create reports
---
# Use gridlines and snap-to-grid in Power BI Desktop reports
The **Power BI Desktop** report canvas provides gridlines that let you neatly align visuals on a report page and use snap-to-grid functionality so the visuals in your report look clean, aligned, and evenly spaced.

In **Power BI Desktop**, you can also adjust the z-order (bring forward, send backward) of objects on a report and align or evenly distribute selected visuals on the canvas.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_0.png)

## Enabling gridlines and snap-to-grid
To enable gridlines and snap-to-grid, select the **View** ribbon, then enable the checkboxes for **Show gridlines** and **Snap objects to grid.** You can select one or both options; they operate independently.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_1.png)

> [!NOTE]
> If **Show gridlines** and **Snap objects to grid** are disabled, connect to any data source and they become enabled.

## Using gridlines
Gridlines are visible guides that help you align your visuals. When you're trying to determine whether two (or more) visuals are aligned horizontally or vertically, use the gridlines to determine whether their borders align.

Use Ctrl+Click to select more than one visual at a time, which displays all selected visuals' borders and shows whether the visuals are properly aligned.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_2.png)

### Using gridlines inside visuals
In Power BI there are also gridlines inside visuals that provide visible guides for comparing data points and values. Beginning with the September 2017 release of **Power BI Desktop**, you can now manage the gridlines within visuals using the **X-Axis** or **Y-Axis** card (as appropriate based on visual type), found in the **Format** section of the **Visualizations** pane. You can manage the following elements of gridlines within a visual:

* Turn gridlines on or off
* Change the color of gridlines
* Adjust the stroke (the width) of gridlines
* Select the line style of the gridlines in the visual, such as solid, dashed, or dotted

Modifying certain elements of gridlines can be especially useful in reports where dark backgrounds are used for visuals. The following image shows the **Gridlines** section in the **Y-Axis** card.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_9.png)

## Using snap-to-grid
When you enable **Snap objects to grid**, all visuals on the **Power BI Desktop** canvas that you move (or resize) are automatically aligned to the nearest grid axis, making it much easier to ensure two or more visuals align to the same horizontal or vertical location or size.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_3.png)

And, that's all there is to using **gridlines** and **snap-to-grid** to ensure the visuals in your reports are neatly aligned.

## Using z-order, align, and distribute
You can manage the front-to-back order of visuals in a report, often referred to as the *z-order* of elements. This feature lets you overlap visuals in any way you want, then adjust the front-to-back order of each. You set the order of your visuals using the **Bring Forward** and **Send Backward** buttons, found in the **Arrange** section of **Format** ribbon. The **Format** ribbon appears as soon as you select one or more visuals on the page.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_4.png)

The **Format** ribbon lets you align your visuals in many different ways, which ensures your visuals appear on the page in the alignment that looks and works best.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_5.png)

The **Align** button aligns a selected visual to the edge (or center) of the report canvas, as shown in the following image.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_6.png)

When two or more visuals are selected, they are aligned together and use the existing aligned boundary of the visuals for their alignment. For example, if you select two visuals and choose the **Align Left** option, the visuals then align to the left-most boundary of all selected visuals.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_7.png)

You can also distribute your visuals evenly across the report canvas, either vertically or horizontally. Just use the **Distribute** button from the **Format** ribbon.

![](media/desktop-gridlines-snap-to-grid/snap-to-grid_8.png)

With a few selections from these gridlines, alignment, and distribution tools, your reports will look just how you want them to.

