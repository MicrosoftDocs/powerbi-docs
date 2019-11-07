---
title: Run and view insights on dashboard tiles
description: As a Power BI end user, learn how to get insights about your dashboard tiles.
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: et_MLSL2sA8

ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 9/22/2019
ms.author: mihart
# As a Power BI end user, I want to learn how to get insights about my dashboard tiles.
LocalizationGroup: Dashboards
---
# View data insights on dashboard tiles with Power BI
Each visual [tile](end-user-tiles.md) on your dashboard is a doorway into data exploration. When you select a tile, it opens a report or [opens Q&A](end-user-q-and-a.md) where you can filter and sort and dig into the dataset behind the report. And when you run insights, Power BI does the data exploration for you.

![ellipsis menu mode](./media/end-user-insights/power-bi-insight.png)

Run insights to generate interesting interactive visuals based on your data. Insights can be run on a specific dashboard tile and you can even run insights on an insight!

The insights feature is built on a growing [set of advanced analytical algorithms](end-user-insight-types.md) developed in conjunction with Microsoft Research that we’ll continue to use to allow more people to find insights in their data in new and intuitive ways.

## Run insights on a dashboard tile
When you run insights on a dashboard tile, Power BI searches just the data used to create that single dashboard tile. 

1. [Open a dashboard](end-user-dashboards.md).
2. Hover over a tile. select **More options** (...), and choose **View insights**. 

    ![ellipsis menu mode](./media/end-user-insights/power-bi-hovers.png)


3. The tile opens in [Focus mode](end-user-focus.md) with the insights cards displayed along the right.    
   
    ![Focus mode](./media/end-user-insights/power-bi-insights-tile.png)    
4. Does one insight pique your interest? Select that insight card to dig further. The selected insight appears on the left and new insight cards, based solely on the data in that single insight, display along the right.    

 ## Interact with the insight cards
Once you have an insight open, continue exploring.

   * Filter the visual on the canvas.  To display the filters, in the upper right corner, select the arrow to expand the Filters pane.

      ![insight an Filters menu expanded](./media/end-user-insights/power-bi-filters.png)
   
   * Run insights on the insight card itself. This is often referred to as **related insights**. Select an insight card to make it active. It will appear on your report canvas.
   
      ![insight an Filters menu expanded](./media/end-user-insights/power-bi-insight-card.png)
   
   * In the upper-right corner, select the lightbulb icon ![Get insights icon](./media/end-user-insights/power-bi-bulb-icon.png)  or **Get insights**. The insight displays on the left and new cards, based solely on the data in that single insight, display along the right.
     
     ![menubar showing Get Insights icon](./media/end-user-insights/power-bi-related.png)
     
To return to your report, from the upper left corner, select **Exit Focus mode**.

## Considerations and troubleshooting
- **View insights** doesn't work with all dashboard tile types. For example, it is not available for custom visuals.<!--[custom visuals](end-user-custom-visuals.md)-->


## Next steps
Learn about the [types of Quick Insights available](end-user-insight-types.md)

