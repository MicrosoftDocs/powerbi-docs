---
title: Part 1, Add visualizations to a Power BI report
description: 'Part 1, Add visualizations to a Power BI report'
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: IkJda4O7oGs
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/11/2019
ms.author: mihart
LocalizationGroup: Visualizations
---

# Part 1, Add visualizations to a Power BI report

This article gives a quick introduction to creating a visualization in a report. It applies to both the Power BI service and Power BI Desktop. For more-advanced content, [see Part 2](power-bi-report-add-visualizations-ii.md) of this series. Watch Amanda demonstrate a few different ways to create, edit, and format visuals on the report canvas. Then try it out yourself using the [Sales and Marketing sample](../sample-datasets.md) to create your own report.

<iframe width="560" height="315" src="https://www.youtube.com/embed/IkJda4O7oGs" frameborder="0" allowfullscreen></iframe>

## Open a report and add a new page

1. Open a [report in Editing View](../service-interact-with-a-report-in-editing-view.md).

    This tutorial uses the [Sales and Marketing sample](../sample-datasets.md).

1. If the **Fields** pane isn't visible, select the arrow icon to open it.

   ![](media/power-bi-report-add-visualizations-i/pbi_nancy_fieldsfiltersarrow.png)

1. Add a blank page to the report.

## Add visualizations to the report

1. Create a visualization by selecting a field from the **Fields** pane.

    Start with a numeric field like **SalesFact** > **Sales $**. Power BI creates a column chart with a single column.

    ![Screenshot of a column chart with a single column.](media/power-bi-report-add-visualizations-i/pbi_onecolchart.png)

    Or, start with a category field, such as **Name** or **Product**. Power BI creates a table and adds that field to the **Values** well.

    ![GIF of a person selecting Product and then category to create a table.](media/power-bi-report-add-visualizations-i/pbi_agif_createchart3.gif)

    Or, start with a geography field, such as **Geo** > **City**. Power BI and Bing Maps create a map visualization.

    ![Screenshot of a map visualization.](media/power-bi-report-add-visualizations-i/power-bi-map.png)

1. Create a visualization and then change its type. Select **Product** > **Category** and then **Product** > **Count of Product** to add them both to the **Values** well.

   ![Screenshot of the Fields pane with the Values well called out.](media/power-bi-report-add-visualizations-i/part1table1.png)

1. Change the visualization to a column chart by selecting the **Stacked column chart** icon.

   ![Screenshot of the Visualizations pane with the Stacked column chart icon called out.](media/power-bi-report-add-visualizations-i/part1converttocolumn.png)

1. When you create visualizations in your report, you can [pin them to your dashboard](../service-dashboard-pin-tile-from-report.md). To pin the visualization, select the pin icon ![Screenshot of the pin icon.](media/power-bi-report-add-visualizations-i/pinnooutline.png).

   ![Screenshot of a column chart visualization with the pin icon called out.](media/power-bi-report-add-visualizations-i/part1pin1.png)
  
## Next steps

 Continue on to:

* [Part 2: Add visualizations to a Power BI report](power-bi-report-add-visualizations-ii.md)

* [Interact with the visualizations](../consumer/end-user-reading-view.md) in the report.

* [Do even more with visualizations](power-bi-report-visualizations.md).

* [Save your report](../service-report-save.md).
