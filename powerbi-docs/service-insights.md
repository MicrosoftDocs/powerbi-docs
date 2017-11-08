---
title: Get Quick Insights in Power BI
description: Documentation for running and working with Quick Insights with Power BI service.
services: powerbi
documentationcenter: ''
author: mihart
manager: erikre
backup: ''
editor: ''
tags: ''
featuredvideoid: et_MLSL2sA8
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/01/2017
ms.author: mihart

---
# Quick Insights with Power BI
Have a new dataset and not quite sure where to start?  Need to build a dashboard fast?  Want to quickly look for insights you may have missed?

Run Quick Insights to generate interesting interactive visualizations based on your data. Quick Insights can be run on an entire dataset (Quick Insights) or on a specific dashboard tile (Scoped Insights). You can even run Quick Insights on an Insight!

> **NOTE**: Quick Insights does not work with DirectQuery - it only works with data uploaded to Power BI.
> 
> 

The Quick Insights feature is built on a growing [set of advanced analytical algorithms](service-insight-types.md) developed in conjunction with Microsoft Research that we’ll continue to use to allow more people to find insights in their data in new and intuitive ways.

## Run Quick Insights on a dataset
Watch Amanda run Quick Insights on a dataset, open an Insight in Focus mode, pin one of these Quick Insights as a tile on her dashboard, and then get Quick Insights for a visual.

<iframe width="560" height="315" src="https://www.youtube.com/embed/et_MLSL2sA8" frameborder="0" allowfullscreen></iframe>


Now it's your turn. Explore Quick Insights using the [Supplier Quality Analysis sample](sample-supplier-quality.md).

1. From the **Datasets** tab, select the ellipses (...) and choose **Get Insights**.
   
    ![](media/service-insights/power-bi-ellipses.png)
   
    ![](media/service-insights/power-bi-tab.png)
2. Power BI uses [various algorithms](service-insight-types.md) to search for trends in your dataset.
   
    ![](media/service-insights/pbi_autoinsightssearching.png)
3. Within seconds, your insights are ready.  Select **View Insights** to display visualizations.
   
    ![](media/service-insights/pbi_autoinsightsuccess.png)
   
   > **NOTE**: Some datasets can't generate Quick Insights because the data isn't statistically significant.  To learn more, see [Optimize your data for Quick Insights](service-insights-optimize.md).
   > 
   > 
4. The visualizations display in a special **Quick Insights** canvas with up to 32 separate insight cards. Each card has a chart or graph plus a short description.
   
    ![](media/service-insights/power-bi-insights.png)

## Interact with the Quick Insight cards
  ![](media/service-insights/pbi_hover.png)

1. Hover over a card and select the pin icon to add the visualization to a dashboard.
2. Hover over a card and select the Focus mode icon to display the card fullscreen.
   
    ![](media/service-insights/power-bi-insight-focus.png)
3. In Focus mode you can:
   
   * [filter](service-interact-with-a-report-in-reading-view.md) the visualizations.  To display the filters, in the top right corner, select the arrow to expand the Filters pane.
     
        ![](media/service-insights/power-bi-insights-filter-new.png)
   * Pin the insight card to a dashboard by selecting the pin ![](media/service-insights/power-bi-pin-icon.png)  icon or **Pin visual**.
   * Run Quick Insights on the card itself. This is referred to as **Scoped Quick Insights**. In the top-right corner, select the lightbulb icon ![](media/service-insights/power-bi-bulb-icon.png)  or **Get Insights**.
     
       ![](media/service-insights/pbi-autoinsights-tile.png)
     
     The Quick Insight displays on the left and new cards, based solely on the data in that single Quick Insight, display along the right.
     
       ![](media/service-insights/power-bi-insights-on-insights-new.png)
4. To return to the original Quick Insights canvas, in the top-left corner, select **Exit Focus mode**.

## Run Quick Insights on a dashboard tile
Instead of searching for insights against an entire dataset, narrow your search to the data used to create a single dashboard tile. This is referred to as **Scoped Quick Insights**.

1. Open a dashboard.
2. Select a tile and [open the tile in Focus mode](service-focus-mode.md).
3. In the top right corner, select **Get Insights**.
   
    ![](media/service-insights/pbi-autoinsights-tile.png)
4. Power BI displays the insight cards along the right side of the tile.
   
    ![](media/service-insights/pbi-insights-tile.png)
5. Does one insight pique your interest? Select that insight card to dig further. The selected Quick Insight appears on the left and new insight cards, based solely on the data in that single Quick Insight, display along the right.
6. Continue digging into your data, and when you find an interesting Quick Insight, pin its visual to your dashboard by selecting **Pin visual** from the top-right corner. Also, you can send feedback to let the dataset owner know if a particular Quick Insight was helpful or not.
   
    ![](media/service-insights/useful.png)

## Next steps
If you own a dataset, [optimize it for Quick Insights](service-insights-optimize.md)

Learn about the [types of Quick Insights available](service-insight-types.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

