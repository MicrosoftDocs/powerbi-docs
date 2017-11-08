---
title: Change how visuals interact in a report
description: Documentation for how to set Visual interactions in a Microsoft Power BI report.
services: powerbi
documentationcenter: ''
author: mihart
manager: kfile
backup: ''
editor: ''
tags: ''
featuredvideoid: N_xYsCbyHPw
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/25/2017
ms.author: mihart

---
# Visualization interactions in a Power BI report
By default, visualizations on a report page can be used to cross-filter and cross-highlight the other visualizations on the page.
For example, selecting a state on a map visualization highlights the column chart and filters the line chart to display only data that applies to that one state.
See [About filtering and highlighting](power-bi-reports-filters-and-highlighting.md).

To change this default behavior, use the **Visual Interaction** control. Visual interactions is only available in [Editing view](service-interact-with-a-report-in-editing-view.md). If a report has been shared with you, you will not have access to Visual interactions.

> [!NOTE]
> The terms *cross-filter* and *cross-highlight* are used to distinguish the behavior described here from what happens when you use the **Filters** pane to filter and highlight visualizations.  
> 
> 

<iframe width="560" height="315" src="https://www.youtube.com/embed/N_xYsCbyHPw?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>

1. Select a visualization to make it active.  
2. Turn on **Visual Interactions** by selecting it from the top menu bar. Notice the filter and highlight icons that appear when you hover over the other visualizations on the report page.
   
    ![](media/service-reports-visual-interactions/pbi-visual-interaction-icon.png)
3. Determine what impact the selected visualization should have on the others.  
   
   * If it should cross-filter the other visualization, select the **filter** icon ![](media/service-reports-visual-interactions/pbi-filter-icon-outlined.png).
   * If it should cross-highlight that visualization, select the **highlight** icon ![](media/service-reports-visual-interactions/pbi-highlight-icon-outlined.png).
   * If it should have no impact, select the **no impact** icon ![](media/service-reports-visual-interactions/pbi-noimpact-icon-outlined.png).
4. Optionally, repeat for all other visualizations on the report page.

### Next steps
[How to use report filters](power-bi-how-to-report-filter.md)

[Filters and highlighting in reports](power-bi-reports-filters-and-highlighting.md)

[Power BI - Basic Concepts](service-basic-concepts.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

