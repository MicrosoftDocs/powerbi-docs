---
title: Generate data insights on your dataset automatically
description: Learn how to get insights about your datasets and dashboard tiles.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: video-et_MLSL2sA8
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 09/13/2021
LocalizationGroup: Dashboards
---
# Generate data insights on your dataset automatically with Power BI
Do you have a new dataset and aren't sure where to start?  Need to build a dashboard quickly?  Want to look for insights you may have missed?

Run quick insights to generate interesting visualizations based on your data. This article explains how to run quick insights on an entire dataset (quick insights). You can also run [quick insights on a specific dashboard tile](../consumer/end-user-insights.md) (scoped insights). You can even run insights on an insight!

> [!NOTE]
> Insights doesn't work with DirectQuery, streaming, and PUSH datasets; it only works with data uploaded to Power BI.
> 
> Row-level security (RLS) isn't supported by quick insights, even in import mode.
>

We built the insights feature on a growing [set of advanced analytical algorithms](../consumer/end-user-insight-types.md) that we developed with Microsoft Research. We continue to use these algorithms to help more people to find insights in their data in new and intuitive ways. You might also be interested in learning how to [optimize your data for quick insights](service-insights-optimize.md).

## Run quick insights on a dataset
Watch Amanda run quick insights on a dataset and open an insight in Focus mode. Amanda pins an insight as a tile on the dashboard, then gets insights for a dashboard tile.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

<iframe width="560" height="315" src="https://www.youtube.com/embed/et_MLSL2sA8" frameborder="0" allowfullscreen></iframe>


Now it's your turn. Explore insights by using the [Supplier Quality Analysis sample](sample-supplier-quality.md).

1. From the **Datasets + dataflows** tab, select **More options** (...) next to the dataset, and then choose **Get quick insights**.
   
    ![Screenshot that shows selecting Get quick insights from the More options menu.](media/service-insights/power-bi-tab.png)
2. Power BI uses [various algorithms](../consumer/end-user-insight-types.md) to search for trends in your dataset.
   
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
   
   * Filter the visualizations. If the **Filters** pane isn't already open, expand it by selecting the arrow on the right side of the window.

       ![Insight Filters menu expanded](media/service-insights/power-bi-insights-filter-new.png)
   * Pin the insight card to a dashboard by selecting the pin icon or **Pin visual**.
   * Run insights on the card itself, which is often referred to as *scoped insights*. In the top-right corner, select the lightbulb icon ![Get insights icon](media/service-insights/power-bi-bulb-icon.png) or **Get Insights**.
     
       ![Get Insights icon](media/service-insights/pbi-autoinsights-tile.png)
     
     The insight displays on the left. New cards, based solely on the data in that single insight, display along the right.
     
       ![Insights on insights](media/service-insights/power-bi-insights-on-insights-new.png)
4. To return to the original insights canvas, in the top-left corner, select **Exit Focus mode**.

## Next steps
- If you own a dataset, [optimize it for Quick Insights](service-insights-optimize.md).
- Learn about the [types of Quick Insights available](../consumer/end-user-insight-types.md).

More questions? [Try the Power BI Community](https://community.powerbi.com/).
