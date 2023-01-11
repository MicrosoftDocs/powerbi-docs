---
title: Run and view insights on dashboard tiles
description: Learn how to run, view, interact, and troubleshoot data insights on a dashboard title with Power BI.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: conceptual
ms.date: 01/10/2023
# As a Power BI end user, I want to learn how to get insights about my dashboard tiles.
LocalizationGroup: Dashboards
---
# View data insights on dashboard tiles with Power BI

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

Each visual tile on your dashboard is a doorway into data exploration. For more information, see [Dashboard tiles in Power BI](end-user-tiles.md). When you select a tile, it opens a report or Q&A [(Q&A for Power BI Business users)](end-user-q-and-a.md), where you can filter and dig into the dataset behind the report. And when you run insights, Power BI does the data exploration for you.

:::image type="content" source="./media/end-user-insights/power-bi-insight.png" alt-text="Screenshot of the insights of a dashboard tile on  Power BI.":::

When you run insights on tiles, Power BI looks at the data used to render that tile. If Power BI finds interesting facts or trends in that data, you'll see those facts or trends in the form of interactive visuals. Insights can run on a specific dashboard tile and you can even run insights on an insight!

The insights feature is built on a growing [set of advanced analytical algorithms](end-user-insight-types.md) developed in conjunction with Microsoft Research that we'll continue to use to allow more people to find insights in their data in new and intuitive ways. The dashboard insights feature is similar to the [dataset **quick insights** feature](../create-reports/service-insights.md).

## Run insights on a dashboard tile
When you run insights on a dashboard tile, Power BI searches just the data used to create that single dashboard tile. 

1. [Open a dashboard](end-user-dashboards.md).
2. Hover over a tile. select **More options** (...), and choose **View insights**.
        :::image type="content" source="./media/end-user-insights/power-bi-hover.png" alt-text=" Screenshot of a tile showing selection of ellipsis highlighted and displaying a dropdown menu with View insights highlighted.":::

3. The tile opens in [Focus mode](end-user-focus.md) with the insights cards displayed along the right.
        :::image type="content" source="./media/end-user-insights/power-bi-insights-tiles.png" alt-text=" Screenshot of a tile and the insights cards.":::
4. Does one insight pique your interest? Select that insight card to dig further. The selected insight appears on the left and new insight cards, based solely on the data in that single insight, display along the right.

## Interact with the insight cards

Once you have an insight open, continue exploring.

   * Filter the visual on the canvas.  To display the filters, in the upper right corner, select the arrow to expand the Filters pane.
         :::image type="content" source="./media/end-user-insights/power-bi-filter.png" alt-text=" Screenshot of a tile and the insights cards with the filter menu expanded and highlighted.":::
   
   * Run insights on the insight card itself. This is often referred to as **related insights**. Select an insight card to make it active. It will move to the left side of the report canvas, and new cards, based solely on the data in that single insight,will  display along the right.
             :::image type="content" source="./media/end-user-insights/power-bi-insights-card.png" alt-text="Screenshot of a related insight (highlighted) with the filter menu expanded":::
     
To return to your report, from the upper left corner, select **Exit Focus mode**.

## Considerations and troubleshooting
- **View insights** doesn't work with all dashboard tile types. For example, it is not available for Power BI custom visuals, streaming data, DirectQuery tiles, or data that is protected with RLS (row-level security).<!--[Power BI visuals](end-user-custom-visuals.md)-->


## Next steps

- [Use the Analyze feature to explain fluctuations in report visuals](end-user-analyze-visuals.md)
- [Types of insights supported by Power BI](end-user-insight-types.md)
