---
title: Generate data insights on your semantic model automatically
description: Learn how to get insights about your semantic models and dashboard tiles.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.custom: video-et_MLSL2sA8
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 11/01/2025
ai-usage: ai-assisted
LocalizationGroup: Dashboards
---
# Generate data insights on your semantic model automatically with Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Do you have a new semantic model and aren't sure where to start? Need to build a dashboard quickly? Want to look for insights you might have missed?

Run quick insights to generate interesting visualizations based on your data. This article explains how to run quick insights on an entire semantic model (quick insights). You can also run [quick insights on a specific dashboard tile](../explore-reports/end-user-insights.md) (scoped insights). You can even run insights on an insight!

> [!NOTE]
> The insights feature doesn't work with DirectQuery, streaming, and PUSH datasets; it only works with data uploaded to Power BI.
>
> Row-level security (RLS) isn't supported by quick insights, even in import mode.
>

We built the insights feature on a growing [set of advanced analytical algorithms](../explore-reports/end-user-insight-types.md) that we developed with Microsoft Research. We continue to use these algorithms to help more people to find insights in their data in new and intuitive ways. You might also be interested in learning how to [optimize your data for quick insights](service-insights-optimize.md).

## Run quick insights on a semantic model

Watch Amanda run quick insights on a semantic model and open an insight in Focus mode. Amanda pins an insight as a tile on the dashboard, then gets insights for a dashboard tile.

> [!NOTE]
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.youtube.com/embed/et_MLSL2sA8]

Now it's your turn. Explore insights by using the [Supplier Quality Analysis sample](sample-supplier-quality.md).

1. Choose the workspace where the semantic model is located. From the **Semantic models + dataflows** tab, select **More options** (...) next to the semantic model, and then choose **Get quick insights**.

    :::image type="content" source="media/service-insights/power-bi-tab.png" alt-text="Screenshot highlighting Get quick insights from the More options menu.":::

1. Power BI uses [various algorithms](../explore-reports/end-user-insight-types.md) to search for trends in your semantic model.

    :::image type="content" source="media/service-insights/pbi_autoinsightssearching.png" alt-text="Screenshot of the Searching for insights dialog.":::

1. Within seconds, your insights are ready. Select **View insights** to display visualizations.

    :::image type="content" source="media/service-insights/pbi_autoinsightsuccess.png" alt-text="Screenshot of the Insights are ready dialog.":::

    > [!NOTE]
    > Some semantic models can't generate insights because the data isn't statistically significant. For more information, see [Optimize your data for Power BI quick insights](service-insights-optimize.md).
    >

1. The visualizations display in a special **Quick Insights** canvas with up to 32 separate insight cards. Each card has a chart or graph plus a short description.

    :::image type="content" source="media/service-insights/power-bi-insights.png" alt-text="Screenshot of the Quick Insights canvas." lightbox="media/service-insights/power-bi-insights.png":::

## Interact with the insight cards

1. Hover over a card and select the pin icon to add the visualization to a dashboard.

    :::image type="content" source="media/service-insights/power-bi-insights-pin-icon.png" alt-text="Screenshot of a card, highlighting the pin icon.":::
    * Pin the visualization to the dashboard of your choice.
    :::image type="content" source="media/service-insights/power-bi-pin-menu.png" alt-text="Screenshot of the Pin to dashboard dialog.":::

1. Go to the dashboard where you added the visualization.

    :::image type="content" source="media/service-insights/power-bi-insights-go-to-dashboard.png" alt-text="Screenshot of the Pinned to dashboard dialog, highlighting Go to dashboard.":::

1. Hover over the pinned card, select **More options** (...), and then choose **View insights**.

    The insight screen opens in Focus mode.

    :::image type="content" source="media/service-insights/power-bi-insight-focus.png" alt-text="Screenshot of an insight in Focus mode.":::

1. In Focus mode you can:

   * Filter the visualizations. If the **Filters** pane isn't already open, expand it by selecting the arrow on the right side of the window.

       :::image type="content" source="media/service-insights/power-bi-insights-filter-new.png" alt-text="Screenshot of the expanded insight Filters menu.":::

   * Pin the insight card to a dashboard by selecting the pin icon or **Pin visual**.
   * Run insights on the card itself, which is often referred to as *scoped insights*. In the top-right corner, select the light bulb icon :::image type="icon" source="media/service-insights/power-bi-bulb-icon.png"::: or **Get Insights**.

       :::image type="content" source="media/service-insights/pbi-autoinsights-tile.png" alt-text="Screenshot highlighting the Get Insights button.":::

     The insight displays on the left. New cards, based solely on the data in that single insight, display along the right.

       :::image type="content" source="media/service-insights/power-bi-insights-on-insights-new.png" alt-text="Screenshot of an insight and cards displaying data on that insight.":::

1. To return to the original insights canvas, in the top-left corner, select **Exit Focus mode**.

## Related content

* [Optimize your data for Power BI quick insights](service-insights-optimize.md).
* [Types of Insights supported by Power BI](../explore-reports/end-user-insight-types.md).

More questions? [Ask the Power BI Community](https://community.powerbi.com/).
