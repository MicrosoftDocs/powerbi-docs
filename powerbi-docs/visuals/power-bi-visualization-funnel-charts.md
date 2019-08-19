---
title: Funnel charts
description: 'Funnel charts in Power BI'
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: maTzOJSRB3g

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/12/2019
ms.author: mihart

LocalizationGroup: Visualizations
---
[!INCLUDE [power-bi-visuals-desktop-banner](../includes/power-bi-visuals-desktop-banner.md)]

# Funnel charts
A funnel chart helps you visualize a linear process that has sequential connected stages. For example, a sales funnel that tracks customers through stages: Lead \> Qualified Lead \> Prospect \> Contract \> Close.  At a glance, the shape of the funnel conveys the health of the process you're tracking.

Each funnel stage represents a percentage of the total. So, in most cases, a funnel chart is shaped like a funnel -- with the first stage being the largest, and each subsequent stage smaller than its predecessor.  A pear-shaped funnel is also useful -- it can identify a problem in the process.  But typically, the first stage, the "intake" stage, is the largest.

![sample blue funnel](media/power-bi-visualization-funnel-charts/funnelplain.png)

## When to use a funnel chart
Funnel charts are a great choice:

* when the data is sequential and moves through at least 4 stages.
* when the number of "items" in the first stage is expected to be greater than the number in the final stage.
* to calculate potential (revenue/sales/deals/etc.) by stages.
* to calculate and track conversion and retention rates.
* to reveal bottlenecks in a linear process.
* to track a shopping cart workflow.
* to track the progress and success of click-through advertising/marketing campaigns.

## Working with funnel charts
Funnel charts:

* Can be pinned from reports and from Q&A.
* Can be sorted.
* Support multiples.
* Can be highlighted and cross-filtered by other visualizations on the same report page.
* Can be used to highlight and cross-filter other visualizations on the same report page.

## Create a basic funnel chart
Watch this video to see Will create a Funnel chart using the Sales and Marketing sample.
   > [!NOTE]
   > This video is of an older version of Power BI Desktop and may not be up-to-date with the current written guide.
   > 
   > 
<iframe width="560" height="315" src="https://www.youtube.com/embed/qKRZPBnaUXM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


Now create your own funnel chart that shows the number of opportunities we have in each of our sales stages.

These instructions use the Opportunity Analysis Sample. To follow along, [download the PBIX sample](../sample-datasets.md) for the Power BI Desktop.   

1. Start on a blank report page and select the **SalesStage** \> **Sales Stage** field.
   
    ![select Sales Stage](media/power-bi-visualization-funnel-charts/funnelselectfield_new.png)
2. [Convert the chart](power-bi-report-change-visualization-type.md) to a funnel. Notice that **Sales Stage** is in the **Group** well. 
3. From the **Fields** pane, select **Fact** \> **Opportunity Count**.
   
    ![build the funnel chart](media/power-bi-visualization-funnel-charts/power-bi-funnel-2.png)
4. Hovering over a bar displays a wealth of information.
   
   * The name of the stage
   * Number of opportunities currently in this stage
   * Overall conversion rate (% of Lead) 
   * Stage-to-stage (aka Drop Rate) which is the % of the previous stage (in this case, Proposal Stage/Solution Stage)
     
     ![details for Proposal bar](media/power-bi-visualization-funnel-charts/funnelhover_new.png)
5. [Add the Funnel as a dashboard tile](../service-dashboard-tiles.md). 
6. [Save the report](../service-report-save.md).

## Highlighting and cross-filtering
For information about using the Filters pane, see [Add a filter to a report](../power-bi-report-add-filter.md).

Highlighting a bar in a funnel cross-filters the other visualizations on the report page... and vice versa. To follow along, add a few more visuals to the report page that contains the funnel chart.

1. On the funnel, select the **Proposal** bar. This cross-highlights the other visualizations on the page. Use CTRL to multi-select.
   
   ![short video showing visual interactions](media/power-bi-visualization-funnel-charts/funnelchartnoowl.gif)
2. To set preferences for how visuals cross-highlight and cross-filter each other, see [Visual interactions in Power BI](../service-reports-visual-interactions.md)

## Next steps

[Gauges in Power BI](power-bi-visualization-radial-gauge-charts.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
