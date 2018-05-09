---
title: Part 2, Add visualizations to a Power BI report
description: 'Part 2, Add visualizations to a Power BI report'
services: powerbi
documentationcenter: ''
author: mihart
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
ms.date: 01/23/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Part 2, Add visualizations to a Power BI report
In [Part 1](power-bi-report-add-visualizations-ii.md), you created a basic visualization by selecting checkboxes next to field names.  In Part 2 you'll learn how to use drag-and-drop and make full use of the **Fields** and **Visualizations** panes to create and modify visualizations.

### Prerequisites
- [Part 1](power-bi-report-add-visualizations-ii.md)
- Power BI service - visualizations can be added to reports using Power BI service or Power BI Desktop. This tutorial uses Power BI service. 
- Retail Analysis sample

## Create a new visualization
In this tutorial we'll dig into our Retail Analysis dataset and create a few key visualizations.

### Open a report and add a new blank page.
1. Open the workspace where you saved the Retail Analysis sample. Select **Retail Analysis Sample** to open the report in Reading View.
   
   ![](media/power-bi-report-add-visualizations-ii/power-bi-open-report.png)
2. Select **Edit Report** to open the report in Editing View.
   
   ![](media/power-bi-report-add-visualizations-ii/editreport1.png)
3. [Add a new page](power-bi-report-add-page.md) by selecting the yellow plus icon at the bottom of the canvas.
   
   ![](media/power-bi-report-add-visualizations-ii/pbi_addreportpage.png)

### Add a visualization that looks at this year's sales compared to last year.
1. From the **Sales** table, select **This Year Sales** > **Value** and **Last Year Sales**. Power BI creates a column chart.  This is somewhat interesting, and you want to dig deeper. What do the sales look like by month?  
   
   ![](media/power-bi-report-add-visualizations-ii/pbi_part2_4bnew.png)
2. From the Time table, drag **Month** into the **Axis** area.  
   ![](media/power-bi-report-add-visualizations-ii/pbi_part2_5newnew.png)
3. [Change the visualization](power-bi-report-change-visualization-type.md) to an Area chart.  There are many visualization types to choose from - see [descriptions of each, tips for best practices, and tutorials](power-bi-visualization-types-for-reports-and-q-and-a.md) for help deciding which type to use. From the Visualizations pane, select the Area chart icon.
4. Sort the visualization by selecting the ellipses and choosing **Sort by Month**.
5. [Resize the visualization](power-bi-visualization-move-and-resize.md) by selecting the visualization, grabbing one of the outline circles and dragging. Make it wide enough to eliminate the scrollbar and small enough to give us enough room to add another visualization.
   
   ![](media/power-bi-report-add-visualizations-ii/pbi_part2_7b.png)
6. [Save the report](service-report-save.md).

### Add a map visualization that looks at sales by location
1. From the **Store** table, select **Territory**. Power BI recognizes that Territory is a location, and creates a map visualization.  
   ![](media/power-bi-report-add-visualizations-ii/pbi_part2_8newnew.png)
2. Drag **Total Stores** into the Size area.  
   ![](media/power-bi-report-add-visualizations-ii/power-bi-add-visual-to-a-reportnew.png)
3. Add a legend.  To see the data by store name, drag **Chain** into the Legend area.  
   ![](media/power-bi-report-add-visualizations-ii/power-bi-add-visual-to-a-report-3new.png)

## Next steps
* For more information about the Fields pane, see [The report editor... take a tour](service-the-report-editor-take-a-tour.md).   
* To learn how to filter and highlight your visualizations, see [Filters and highlighting in Power BI reports](power-bi-reports-filters-and-highlighting.md).  
* More about [Visualizations in Power BI reports](power-bi-report-visualizations.md).  
* More questions? [Try the Power BI Community](http://community.powerbi.com/)

