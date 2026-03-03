---
title: View Data Insights on Dashboard Tiles with Power BI
description: Learn how to run, view, interact, and troubleshoot data insights on a dashboard tile with Power BI.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: concept-article
ms.date: 10/01/2025
ai-usage: ai-assisted
ms.custom: sample-
# As a Power BI end user, I want to learn how to get insights about my dashboard tiles.
LocalizationGroup: Dashboards
---
# View data insights on dashboard tiles with Power BI

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

Each visual tile on your dashboard is a doorway into data exploration. For more information, see [Dashboard tiles in Power BI](end-user-tiles.md). When you select a tile, it opens a report or Q&A [(Q&A for Power BI Business users)](end-user-q-and-a.md), where you can filter and dig into the semantic model behind the report. And when you run insights, Power BI does the data exploration for you.

:::image type="content" source="./media/end-user-insights/power-bi-insight.png" alt-text="Screenshot of the insights of a dashboard tile on  Power BI.":::

When you run insights on tiles, Power BI looks at the data used to render that tile. If Power BI finds interesting facts or trends in that data, you see those facts or trends in the form of interactive visuals. Insights can run on a specific dashboard tile and you can even run insights on an insight.

The insights feature is built on a growing set of advanced analytical algorithms developed with Microsoft Research. These algorithms allow people to find insights in their data in new and intuitive ways. For more information, see [Types of insights supported by Power BI](end-user-insight-types.md). The dashboard insights feature is similar to the semantic model **quick insights** feature. To see how to run quick insights on an entire semantic model, see [Generate data insights on your semantic model automatically with Power BI](../create-reports/service-insights.md).

## Run insights on a dashboard tile

When you run insights on a dashboard tile, Power BI searches just the data used to create that single dashboard tile.

1. Open a dashboard. For more information, see [Dashboards for business users of the Power BI service](end-user-dashboards.md).
1. Hover over a tile, select the **More options** (...) feature on the tile, then choose **View insights** from the dropdown menu.

   :::image type="content" source="./media/end-user-insights/power-bi-hover.png" alt-text=" Screenshot of a tile showing selection of ellipsis highlighted and displaying a dropdown menu with View insights highlighted.":::

1. The tile opens in Focus mode with the insights cards displayed along the right. Select the pin icon to save any of these insight tiles to your dashboard. For more information, see [Display content in more detail: focus mode and full screen mode](end-user-report-view.md).

   :::image type="content" source="./media/end-user-insights/power-bi-insights-tiles.png" alt-text=" Screenshot of a tile and the insights cards.":::

1. After you decide which insight card to explore, select it. The selected insight appears on the canvas, and new insight cards, based solely on the data in that single insight, display along the right.

## Interact with the insight cards

Now that you have an insight open, continue exploring.

- Filter the visual on the canvas. To see the filters, go to the Filter's pane and select the arrow in the upper right corner.

   :::image type="content" source="./media/end-user-insights/power-bi-filter.png" alt-text=" Screenshot of a tile and the insights cards with the filter menu expanded and highlighted.":::

- You can run insights on the insight card itself. Insights on insights is often referred to as **related insights**. To generate related insights, select an insight card to make it active. It moves to the left side of the report canvas, and new cards, based solely on the data in that single insight, display along the right. Filters are available for the new insight card as well.

   :::image type="content" source="./media/end-user-insights/power-bi-insights-card.png" alt-text="Screenshot of a related insight (highlighted) with the filter menu expanded.":::

To return to your report, select **Exit Focus mode**, located in the upper left corner of the screen.

## Considerations and troubleshooting

**View insights** doesn't work with all dashboard tile types. For example, it isn't available for Power BI custom visuals, streaming data, DirectQuery tiles, or data protected with RLS (row-level security).<!--[Power BI visuals](end-user-custom-visuals.md)-->

## Related content

- [Use the Analyze feature to explain fluctuations in report visuals](end-user-analyze-visuals.md)
- [Types of insights supported by Power BI](end-user-insight-types.md)
