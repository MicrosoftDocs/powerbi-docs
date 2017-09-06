<properties
   pageTitle="Change how visuals interact in a report"
   description="Documentation for how to set Visual interactions in a Microsoft Power BI report."
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   featuredVideoId="N_xYsCbyHPw"
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/15/2017"
   ms.author="mihart"/>

# Visualization interactions in a Power BI report

By default, visualizations on a report page can be used to cross-filter and cross-highlight the other visualizations on the page.
For example, selecting a state on a map visualization highlights the column chart and filters the line chart to display only data that applies to that one state.
See [About filtering and highlighting](powerbi-service-about-filters-and-highlighting-in-reports.md).

To change this default behavior, use the **Visuals Interaction** control.

>[AZURE.NOTE] The terms *cross-filter* and *cross-highlight* are used to distinguish the behavior described here from what happens when you use the **Filters** pane to filter and highlight visualizations.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/N_xYsCbyHPw?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>

1.  Select a visualization to make it active.  

2. Turn on **Visual Interactions** by selecting it from the top menu bar. Notice the filter and highlight icons that appear above the other visualizations on the report page.

    ![](media/powerbi-service-visual-interactions/pbi-visual-interaction-icon.png)

2.  Determine what impact the selected visualization should have on the others.  

    -   If it should cross-filter the other visualization, select the **filter** icon ![](media/powerbi-service-visual-interactions/pbi-filter-icon-outlined.png).

    -   If it should cross-highlight that visualization, select the **highlight** icon ![](media/powerbi-service-visual-interactions/pbi-highlight-icon-outlined.png).

    -   If it should have no impact, select the **no impact** icon ![](media/powerbi-service-visual-interactions/pbi-noimpact-icon-outlined.png).

3.  Repeat for all other visualizations on the report page.

### See also

 [How to use report filters](powerbi-service-how-to-use-a-report-filter.md)

[Filters and highlighting in reports](powerbi-service-about-filters-and-highlighting-in-reports.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
