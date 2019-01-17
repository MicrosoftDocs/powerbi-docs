---
title: Understand how visuals interact in a report
description: Documentation for Power BI end users that explains how visuals interact on a report page. 
author: mihart
manager: kvivek
ms.custom: seodec18
ms.reviewer: ''
ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: mihart

LocalizationGroup: Reports
---

# How visuals cross-filter each other in a Power BI report
One of the great features of Power BI is the way all visuals on a report page are interconnected. If you select a data point on one of the visuals, all the other visuals on the page that contain that data change, based on that selection. 

![video of visuals interacting](media/end-user-interactions/interactions.gif)

By default, visualizations on a report page can be used to cross-filter, cross-highlight, and drill the other visualizations on the page. For example, selecting a state on a map visualization may highlight the column chart and filter the line chart to display only data that applies to that one state.

See [About filtering and highlighting](../power-bi-reports-filters-and-highlighting.md). And if you have a visualization that supports [drilling](../power-bi-visualization-drill-down.md), by default, drilling one visualization has no impact on the other visualizations on the report page. 

Exactly how the visuals on a page interact is set by the report *designer*. Designers have options to turn visual interactions on and off, and to change the default cross-filtering,  cross-highlighting, and drilling behavior.
  
> [!NOTE]
> The terms *cross-filter* and *cross-highlight* are used to distinguish the behavior described here from what happens when you use the **Filters** pane to filter and highlight visualizations.  

### Next steps
[How to use report filters](../power-bi-how-to-report-filter.md)
