<properties
   pageTitle="Change how visuals interact in a report"
   description="Visual interactions in a report"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/15/2016"
   ms.author="mihart"/>

# Visualization interactions in a Power BI report

By default, visualizations on a report page can be used to filter and highlight the other visualizations on the page. 
For example, selecting a state on a map visualization highlights the column chart and fitlers the line chart to display only data that applies to that one state. 
See [About filtering and highlighting](powerbi-service-about-filters-and-highlighting-in-reports.md).

To change this default behavior, use the Visuals Interaction control.

1.  Select a visualization to make it active.  

2. Turn on **Visual Interactions** by selecting it from the top menu bar. Notice the filter and highlight icons that appear above the other visualizations on the report page. 

    ![](media/powerbi-service-visual-interactions/pbi-visual-interaction-icon.png)

2.  Determine what impact the selected visualization should have on the others.  

    -   If it should filter the other visualization, select the **filter** icon ![](media/powerbi-service-visual-interactions/pbi-filter-icon-outlined.png). 
    
    -   If it should highlight that visualization, select the **highlight** icon ![](media/powerbi-service-visual-interactions/pbi-highlight-icon-outlined.png).
    
    -   If it should have no impact, select the **no impact** icon ![](media/powerbi-service-visual-interactions/pbi-noimpact-icon-outlined.png).
    
3.  Repeat for all other visualizations on the report page. 
    
<iframe width="560" height="315" src="https://www.youtube.com/embed/GQrV--EzBTY" frameborder="0" allowfullscreen></iframe>


## See also

 [How to use report filters](powerbi-service-how-to-use-a-report-filter.md)

[Filters and highlighting in reports](powerbi-service-about-filters-and-highlighting-in-reports.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)*﻿*
