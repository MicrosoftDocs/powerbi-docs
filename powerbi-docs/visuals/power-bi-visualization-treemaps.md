---
title: Treemaps in Power BI
description: 'Treemaps in Power BI'
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: IkJda4O7oGs
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/24/2019
ms.author: mihart
LocalizationGroup: Visualizations
---

# Treemaps in Power BI

Treemaps display hierarchical data as a set of nested rectangles. Each level of the hierarchy is represented by a colored rectangle (branch) containing smaller rectangles (leaves). Power BI bases the size of the space inside each rectangle on the measured value. The rectangles are arranged in size from top left (largest) to bottom right (smallest).

![Screenshot of a Count of Product by Category, and Manufacturer treemap.](media/power-bi-visualization-treemaps/pbi-nancy_viz_treemap.png)

For example, if you're analyzing your sales, you might have top-level branches, for the clothing categories: **Urban**, **Rural**, **Youth**, and **Mix**. Power BI would split your category rectangles into leaves, for the clothing manufacturers within that category. These leaves would be sized and shaded based on the number sold.

In the **Urban** branch above, lots of **Maximus** clothing was sold. Less **Natura** and **Fama** was sold. Only a few **Leo** were sold. So, the **Urban** branch of your Treemap has:

* The largest rectangle for **Maximus** in the top-left corner.

* Slightly smaller rectangles for **Natura** and **Fama**.

* Lots of other rectangles for all the other clothing sold.

* A tiny rectangle for **Leo**.

You could compare the number of items sold across the other clothing categories by comparing the size and shading of each leaf node; larger and darker rectangles mean higher value.

Want to watch someone else create a treemap first? Skip to 2:10 in this video to watch Amanda create a treemap.

<iframe width="560" height="315" src="https://www.youtube.com/embed/IkJda4O7oGs" frameborder="0" allowfullscreen></iframe>

## When to use a treemap

Treemaps are a great choice:

* To display large amounts of hierarchical data.

* When a bar chart can't effectively handle the large number of values.

* To show the proportions between each part and the whole.

* To show the pattern of the distribution of the measure across each level of categories in the hierarchy.

* To show attributes using size and color coding.

* To spot patterns, outliers, most-important contributors, and exceptions.

## Prerequisites

* The Power BI service or Power BI Desktop

* Retail Analysis Sample report

## Get the Retail Analysis Sample report

These instructions use the Retail Analysis Sample. Creating a visualization requires edit permissions to the dataset and report. Luckily, the Power BI samples are all editable. If someone shares a report with you, you can't create visualizations in reports. To follow along, get the **Retail Analysis Sample** report:

1. Sign in to the Power BI service.

1. In the lower-left corner, select **Get Data**.

1. On the **Get Data** page, select **Samples**.

1. Select **Retail Analysis Sample** > **Connect**.

1. When the sample is available, in the left navigation pane, expand **My Workspace**.

1. Under **Dashboards**, select **Retail Analysis Sample**.

Now that you have the **Retail Analysis Sample** dashboard is in front of you, you can get started.

## Create a basic treemap

You'll edit a report to add a basic treemap.

1. Select the **Total stores** tile to open the **Store Sales Overview** report.

1. Select  [Edit report](../service-interact-with-a-report-in-editing-view.md).

1. Select ![Screenshot of the yellow plus icon](media/power-bi-visualization-treemaps/treemap-yellow-plus-icon.png) to open a new page in the report.

1. From the **Fields** pane, select the **Sales** > **Last Year Sales** measure.

   ![Screenshot of Sales > Last Tear Sales selected and the resulting visual.](media/power-bi-visualization-treemaps/treemapfirstvalue_new.png)

1. Select the treemap icon ![Screenshot of the treemap icon](media/power-bi-visualization-treemaps/power-bi-treemap-icon.png) to convert the chart to a treemap.

   ![Screenshot of the treemap without configuration.](media/power-bi-visualization-treemaps/treemapconvertto_new.png)

1. Drag **Item** > **Category** to the **Group** well.

    Power BI creates a treemap where the size of the rectangles is based on total sales and the color represents the category. In essence you've created a hierarchy that visually describes the relative size of total sales by category. The **Men's** category has the highest sales and the **Hosiery** category has the lowest.

    ![Screenshot of the configured treemap.](media/power-bi-visualization-treemaps/power-bi-complete.png)

1. Drag **Store** > **Chain** to the **Details** well to complete your treemap. You can now compare last year's sales by category and chain.

   ![Screenshot of the treemap with Store > Chain added to the Details.](media/power-bi-visualization-treemaps/power-bi-details.png)

   > [!NOTE]
   > Color Saturation and Details cannot be used at the same time.

1. Hover over a **Chain** area to reveal the tooltip for that portion of the **Category**.

    For example, hovering over **Fashions Direct** in the **090-Home** rectangle reveals the tooltip for Fashion Direct's portion of the Home category.

   ![Screenshot of the Home tooltip that appears.](media/power-bi-visualization-treemaps/treemaphoverdetail_new.png)

1. Add the treemap as a [dashboard tile (pin the visual)](../service-dashboard-tiles.md).

1. Save [the report](../service-report-save.md).

## Highlighting and cross-filtering

For information about using the **Filters** pane, see [Add a filter to a report](../power-bi-report-add-filter.md).

Highlighting a **Category** or **Detail** in a treemap cross-highlights and cross-filters the other visualizations on the report page and the other way around. To follow along, either add some visuals to this report page or copy the treemap to one of the other pages in this report.

1. On the treemap, select either a **Category** or a **Chain** within a **Category**. That will cross-highlight the other visualizations on the page. Selecting **050-Shoes**, for example, shows me that last year's sales for shoes was **$3,640,471** with **Fashions Direct** accounting for **$2,174,185** of those sales.

   ![Screenshot of the Store Sales Overview report showing cross-highlighting.](media/power-bi-visualization-treemaps/treemaphiliting.png)

1. In the **Last Year Sales by Chain** pie chart, selecting the **Fashions Direct** slice, cross-filters the treemap.
   ![GIF demonstration of the cross-filtering feature.](media/power-bi-visualization-treemaps/treemapnoowl.gif)

1. To manage how charts cross-highlight and cross-filter each other, see [Change how visuals interact in a Power BI report](../service-reports-visual-interactions.md).

## Next steps

* [Waterfall charts in Power BI](power-bi-visualization-waterfall-charts.md)

* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
