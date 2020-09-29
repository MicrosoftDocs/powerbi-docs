---
title: Multi-select data elements in visuals using Power BI Desktop
description: You can select multiple data points in Power BI Desktop visuals with simple CTRL+Click
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/08/2019
ms.author: davidi

LocalizationGroup: Create reports
---
# Multi-select data elements in visuals using Power BI Desktop

In Power BI Desktop, you can highlight a data point in a given visual by simply clicking on the data point in the visual. For example, if you have an important bar or chart element, and you want other visuals on the report page to highlight data based on your selection, you can click the data element in one visual and see results reflected in other visuals on the page. This is basic, or single-select highlighting. The following image shows a basic highlight. 

![Single data point selected](media/desktop-multi-select/multi-select_01.png)

With multi-select, you can now select more than one data point in your **Power BI Desktop** report page, and highlight the results across the visuals on the page. This is equivalent to an **and** statement, or functionality, such as "highlight results for Idaho **and** Virginia". To multi-select data points in visuals, simply use **CTRL+Click** to select multiple data points. Clicking them a second time will de-select them. The following image shows **multiple data points** selected (multi-select).

![Multiple data points selected](media/desktop-multi-select/multi-select_02.png)

# Create a selection rectangle to select multiple data elements in visuals 

You can also click and drag across a visual's plot area while holding down the **CTRL** key to create a selection rectangle. When you let go of the mouse, all points overlapping the selection rectangle will be selected. Your previous selections will be preserved, and already-selected data points will be unselected — it will be as though you held down the Ctrl key and individually clicked every single point that overlaps the selection rectangle.

If you click and drag while holding down the Shift key instead, your previous selections will be preserved, but this time your already-selected data points will remain selected — this key is strictly for adding data points to your selection, not removing.

As always, you can clear your current selection by clicking an empty space on the plot area (without holding down any key).

When viewing a report, in addition to the above controls, you will be able to create a selection rectangle with a simple click and drag within a visual. This action will count as starting a new selection and will not preserve your currently selected points. 

The following visuals support rectangle select:
- Line charts
- Area charts
- Scatter charts
- Bar and column charts
- Line and column combo charts

> [!NOTE]
> This feature is in preview. Turn it on in the Preview features section of the Options menu. When viewing a report in the Service, rectangle select will be enabled only if the preview feature was enabled when the report was saved and published on Desktop. While this feature is in preview, the number of data points you can select at once is limited to 300. 

Multi-selection sounds like a simple capability, but it opens up all sorts of opportunities when creating, sharing, and interacting with reports. 

## Next steps

You might also be interested in the following articles:

* [Use gridlines and snap-to-grid in Power BI Desktop reports](desktop-gridlines-snap-to-grid.md)
* [About filters and highlighting in Power BI reports](power-bi-reports-filters-and-highlighting.md)

