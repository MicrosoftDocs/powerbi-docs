---
title: See data and records in Power BI Desktop visuals
description: Use the See Data and See Records features of Power BI Desktop to drill into details
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 10/09/2017
ms.author: davidi

---
# Use See Data and See Records in Power BI Desktop
In **Power BI Desktop** you can drill into the details of any visual, and see a textual representation of the data or individual data elements for a selected visual. These features are sometimes referred to as *click-through*, or *drill-through* or *drill-through to details*.

You can use **See Records** to view the underlying rows for one selected data element from a visual, or use **See Data** to view a textual version of the values used in the visual. There are some limitations to using **See Data** and **See Records**, which are discussed at the end of this article.

![](media/desktop-see-data-see-records/see-data-see-records_1.png)

## Using See Data in Power BI Desktop
The **See Data** button is located in the **Data / Drill** tab in the **Visual Tools** section of the ribbon.

![](media/desktop-see-data-see-records/see-data-see-records_2.png)

You can also **See Data** by right-clicking on a visual, then selecting **See Data** from the menu that appears.

![](media/desktop-see-data-see-records/see-data-see-records_3.png)

> [!NOTE]
> You must be hovering over a data point in the visual in order for the right-click menu to be available.
> 
> 

When you select **See Data**, **Power BI Desktop** focuses on the visual and data you selected and dedicates the canvas space to displaying the visual and the textual representation of the data. The visual is displayed on the top half of the canvas, and the data is shown on the bottom half, as shown in the following image. This is the *horizontal* view.

![](media/desktop-see-data-see-records/see-data-see-records_4.png)

You can also switch to a *vertical view* (or back to *horizontal view*), by selecting the icon in the upper right corner.

![](media/desktop-see-data-see-records/see-data-see-records_5.png)

To get back to the report, select **< Back to Report** in the upper left corner of the canvas.

![](media/desktop-see-data-see-records/see-data-see-records_6.png)

## Using See Records in Power BI Desktop
You can also focus on one data element in a visual, and drill into the data behind it. Once a visual is selected there are two ways to use **See Records**; you can enable the **See Records** toggle button in the **Data / Drill** ribbon and then click on a data element, or you can right-click on a data element and select **See Records** from the menu that appears.

![](media/desktop-see-data-see-records/see-data-see-records_7.png)

> [!NOTE]
> If the selected visual does not support **See Records** then the button on the ribbon is grayed out.
> 
> 

Once **See Records** is selected, **Power BI Desktop** focuses on that individual data element and dedicates the canvas area to displaying the data for that element, as shown in the following image.

![](media/desktop-see-data-see-records/see-data-see-records_8.png)

To get back to the report, select the **Back to Report** button in the upper left corner of the canvas.

## Limitations
There are a few limitations to consider when using **See Data** or **See Records**:

* Only the following visual types are supported:
  * **Bar**
  * **Column**
  * **Map**
  * **Tree Map**
  * **Filled Map**
  * **Pie**
  * **Donut**
  * **Funnel**
* You can't use **See Records** when your visual uses a calculated measure
* You can't use **See Records** when connected to a live multidimensional (MD) model

## More Information
﻿There are all sorts of report formatting and data management features in **Power BI Desktop**. Check out the following resources for a few examples:

* [Use grouping and binning in Power BI Desktop](desktop-grouping-and-binning.md)
* [Use gridlines, snap-to-grid, z-order, alignment and distribution in Power BI Desktop reports](desktop-gridlines-snap-to-grid.md)

