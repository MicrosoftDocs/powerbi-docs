---
title: Change how visuals interact in a report
description: Documentation for how to set Visual interactions in a Microsoft Power BI service report and a Power BI Desktop report.
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: N_xYsCbyHPw
ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: mihart

LocalizationGroup: Reports
---
# Change how visuals interact in a Power BI report
If you have edit permissions for a report, you can use **Visual interactions** to change how visualizations on a report page impact each other. 

By default, visualizations on a report page can be used to cross-filter and cross-highlight the other visualizations on the page.
For example, selecting a state on a map visualization highlights the column chart and filters the line chart to display only data that applies to that one state.
See [About filtering and highlighting](power-bi-reports-filters-and-highlighting.md). And if you have a visualization that supports [drilling](consumer/end-user-drill.md), by default, drilling one visualization has no impact on the other visualizations on the report page. But both of these default behaviors can be overridden, and interactions set, on a per-visualization basis.

This article shows you how to use **Visual interactions** in Power BI service [Editing view](service-interact-with-a-report-in-editing-view.md) and in Power BI Desktop. If a report has been shared with you, you will not be able to change the Visual interactions settings.

> [!NOTE]
> The terms *cross-filter* and *cross-highlight* are used to distinguish the behavior described here from what happens when you use the **Filters** pane to filter and highlight visualizations.  
> 
> 

<iframe width="560" height="315" src="https://www.youtube.com/embed/N_xYsCbyHPw?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>

1. Select a visualization to make it active.  
2. Display the **Visual Interactions** options.
    - In Power BI service, select the dropdown from the report menubar.

       ![Visual interactions dropdown](media/service-reports-visual-interactions/power-bi-visual-interaction.png)

    - In Desktop, select **Format > Interactions**.

        ![select Format then Interactions](media/service-reports-visual-interactions/pbi-visual-interaction-desktop.png)

3. To turn on the visualization interaction controls, select **Edit interactions**. Power BI adds cross-filter and cross-highlight icons to all of the other visualizations on the report page.
   
    ![report with Visual interactions turned on](media/service-reports-visual-interactions/power-bi-icons-on.png)
3. Determine what impact the selected visualization should have on the others.  And, optionally, repeat for all other visualizations on the report page.
   
   * If it should cross-filter the visualization, select the **filter** icon ![filter icon](media/service-reports-visual-interactions/pbi-filter-icon-outlined.png).
   * If it should cross-highlight the visualization, select the **highlight** icon ![highlight icon](media/service-reports-visual-interactions/pbi-highlight-icon-outlined.png).
   * If it should have no impact, select the **no impact** icon ![no impact icon](media/service-reports-visual-interactions/pbi-noimpact-icon-outlined.png).

4. To turn on drilling controls, select **Drilling filters other visuals**.  Now when you drill down (and up) in a visualization, the other visualizations on the report page change to reflect your current drilling selection. 

   ![video of turning on drilling controls](media/service-reports-visual-interactions/drill2.gif)

