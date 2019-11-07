---
title: Generate data insights automatically with Power BI
description: Learn how to get insights about your datasets and dashboard tiles.
author: maggiesMSFT
manager: kfollis
ms.reviewer: ''
featuredvideoid: et_MLSL2sA8
ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2019
ms.author: maggies

LocalizationGroup: Dashboards
---
# Generate data insights automatically with Power BI
Do you have a new dataset and aren't quite sure where to start?  Need to build a dashboard quickly?  Want to look for insights you may have missed?

Run quick insights to generate interesting interactive visualizations based on your data. Quick insights can be run on an entire dataset (quick insights) or on a specific dashboard tile (scoped insights). You can even run insights on an insight!

> [!NOTE]
> Insights doesn't work with DirectQuery; it only works with data uploaded to Power BI.
> 

The insights feature is built on a growing [set of advanced analytical algorithms](service-insight-types.md) developed in conjunction with Microsoft Research that we’ll continue to use to allow more people to find insights in their data in new and intuitive ways.

## Run quick insights on a dataset
Watch Amanda run quick insights on a dataset, open an insight in Focus mode, pin one of these insights as a tile on her dashboard, and then get insights for a dashboard tile.

<iframe width="560" height="315" src="https://www.youtube.com/embed/et_MLSL2sA8" frameborder="0" allowfullscreen></iframe>


Now it's your turn. Explore insights by using the [Supplier Quality Analysis sample](sample-supplier-quality.md).

1. From the **Datasets** tab, select **More options** (...), and then choose **Get quick insights**.
   
    ![Datasets tab](media/service-insights/power-bi-ellipses.png)
   
    ![Ellipsis menu](media/service-insights/power-bi-tab.png)
2. Power BI uses [various algorithms](service-insight-types.md) to search for trends in your dataset.
   
    ![Searching for insights dialog](media/service-insights/pbi_autoinsightssearching.png)
3. Within seconds, your insights are ready.  Select **View insights** to display visualizations.
   
    ![Success message](media/service-insights/pbi_autoinsightsuccess.png)
   
    > [!NOTE]
    > Some datasets can't generate insights because the data isn't statistically significant.  To learn more, see [Optimize your data for insights](service-insights-optimize.md).
    > 
    
4. The visualizations display in a special **Quick Insights** canvas with up to 32 separate insight cards. Each card has a chart or graph plus a short description.
   
    ![Quick Insights canvas](media/service-insights/power-bi-insights.png)

## Interact with the insight cards

1. Hover over a card and select the pin icon to add the visualization to a dashboard.

2. Hover over a card, select **More options** (...), and then choose **View insights**. 

    The insight screen opens in Focus mode.
   
    ![Insight Focus mode](media/service-insights/power-bi-insight-focus.png)
3. In Focus mode you can:
   
   * Filter the visualizations. If the **Filters** pane isn't already open, expand it by select the arrow on the right side of the window.

       ![Insight Filters menu expanded](media/service-insights/power-bi-insights-filter-new.png)
   * Pin the insight card to a dashboard by selecting **Pin visual**.
   * Run insights on the card itself, which is often referred to as *scoped insights*. In the top-right corner, select the lightbulb icon ![Get insights icon](media/service-insights/power-bi-bulb-icon.png) or **Get Insights**.
     
       ![Get Insights icon](media/service-insights/pbi-autoinsights-tile.png)
     
     The insight displays on the left and new cards, based solely on the data in that single insight, display along the right.
     
       ![Insights on insights](media/service-insights/power-bi-insights-on-insights-new.png)
4. To return to the original insights canvas, in the top-left corner, select **Exit Focus mode**.

## Run insights on a dashboard tile
Instead of searching for insights against an entire dataset, narrow your search to do a scoped insight on the data that's used to create a single dashboard tile. 

1. Open a dashboard.
2. Hover over a tile. select **More options** (...), and then choose **View insights**. The tile opens in [Focus mode](service-focus-mode.md) with the insights cards displayed along the right.    
   
    ![Focus mode](media/service-insights/pbi-insights-tile.png)    
3. Does one insight pique your interest? Select that insight card to dig further. The selected insight appears on the left and new insight cards, based solely on the data in that single insight, display along the right.    
4. Continue digging into your data, and when you find an interesting insight, pin it to your dashboard by selecting **Pin visual** from the top-right corner.

## Next steps
- If you own a dataset, [optimize it for Quick Insights](service-insights-optimize.md).
- Learn about the [types of Quick Insights available](service-insight-types.md).

More questions? [Try the Power BI Community](https://community.powerbi.com/).

