---
title: Understand how visuals interact in a report
description: Documentation for Power BI end users that explains how visuals interact on a report page. 
author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 10/03/2019
ms.author: mihart

LocalizationGroup: Reports
---

# How visuals cross-filter each other in a Power BI report
One of the great features of Power BI is the way all visuals on a report page are interconnected. If you select a data point on one of the visuals, all the other visuals on the page that contain that data change, based on that selection. 

![video of visuals interacting](media/end-user-interactions/interactions.gif)

## How visuals interact with each other

By default, selecting a data point in one visual on a report page will cross-filter or cross-highlight the other visuals on the page. Exactly how the visuals on a page interact is set by the report *designer*. *Designers* have options to turn visual interactions on and off, and to change the default cross-filtering,  cross-highlighting, and [drilling](end-user-drill.md) behavior. 

If you haven't encountered hierarchies or drilling yet, you can learn all about them by reading [drill down in Power BI](end-user-drill.md). 

Cross-filtering and cross-highlighting can be useful to identify how one value in your data contributes to another. For example, selecting the Moderation segment in the doughnut chart, highlights the contribution from that segment to each column in the "Total units by Month" chart, and filters the line chart.

![image of visuals interacting](media/end-user-interactions/power-bi-interactions.png)

See [About filtering and highlighting](end-user-report-filter.md). 


  
> [!NOTE]
> The terms *cross-filter* and *cross-highlight* are used to distinguish the behavior described here from what happens when you use the **Filters** pane to filter and highlight visuals.  

## Considerations and troubleshooting
- If your report has a visual that supports [drilling](end-user-drill.md), by default, drilling one visual has no impact on the other visuals on the report page.     
- If you use visualA to interact with visualB, visual-level filters from visualA will be applied to visualB.

## Next steps
[How to use report filters](../power-bi-how-to-report-filter.md)
