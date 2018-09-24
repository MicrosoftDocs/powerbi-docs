---
title: Treemaps in Power BI
description: 'Treemaps in Power BI'
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: IkJda4O7oGs

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 01/23/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Treemaps in Power BI
Treemaps display hierarchical data as a set of nested rectangles.  Each level of the hierarchy is represented by a colored rectangle (often called a "branch") containing other rectangles ("leaves").  The space inside each rectangle is allocated based on the quantitative value being measured, with the rectangles arranged in size from top left (largest) to bottom right (smallest).

![](media/power-bi-visualization-treemaps/pbi-nancy_viz_treemap.png)

For example, if I'm analyzing my sales, I might have top-level rectangles (branches) for the clothing categories: **Urban**, **Rural**, **Youth**, and **Mix**.  My category rectangles would contain smaller rectangles (leaves) for the clothing manufacturers within that category, and these smaller rectangles would be sized and shaded based on the number sold.  In the **Urban** branch above, lots of Maximus clothing was sold, less Natura and Fama, and very little Leo.  So, the **Urban** branch of my Treemap would have the largest rectangle for Maximus (in the top left corner), slightly-smaller rectangles for Natura and Fama, lots of other rectangles representing all the other clothing sold, and a tiny rectangle for Leo.  And I could compare the number of items sold across the other clothing categories by comparing the size and shading of each leaf node; the larger the rectangle and the darker the shading, the higher the value.

## When to use a treemap
Treemaps are a great choice:

* to display large amounts of hierarchical data.
* when a bar chart can't effectively handle the large number of values.
* to show the proportions between each part and the whole.
* to show the pattern of the distribution of the measure across each level of categories in the hierarchy.
* to show attributes using size and color coding.
* to spot patterns, outliers, most-important contributors, and exceptions.

### Prerequisites
 - Power BI service or Power BI Desktop
 - Retail Analysis sample

## Create a basic treemap
Want to watch someone else create a treemap first?  Skip to 2:10 in this video to watch Amanda create a treemap.

<iframe width="560" height="315" src="https://www.youtube.com/embed/IkJda4O7oGs" frameborder="0" allowfullscreen></iframe>

Or, create your own treemap. These instructions use the Retail Analysis Sample. To follow along, sign in to Power BI service (not Desktkop) and select **Get Data \> Samples \>  Retail Analysis Sample \> Connect \> Go to dashboard**. Creating visualizations in a report requires edit permissions to the dataset and report. Luckily, the Power BI samples are editable. But if someone shares a report with you, you won't be able to add new visualizations.

1. Select the "Total stores" tile to open the Retail Analysis sample report.    
2. Open [Editing View](../service-interact-with-a-report-in-editing-view.md) and select the **Sales** > **Last Years Sales** measure.   
   ![](media/power-bi-visualization-treemaps/treemapfirstvalue_new.png)   
3. Convert the chart to a treemap.  
   ![](media/power-bi-visualization-treemaps/treemapconvertto_new.png)   
4. Drag **Item** > **Category** to the **Group** well. Power BI creates a treemap where the size of the rectangles reflects total sales and the color represents the category.  In essence you've created a hierarchy that visually describes the relative size of total sales by category.  The **Mens** category has the highest sales and the **Hosiery** category has the lowest.   
   ![](media/power-bi-visualization-treemaps/treemapcomplete_new.png)   
5. Drag **Store** > **Chain** to the **Details** well to complete your treemap. You can now compare last year's sales by category and chain.   
   ![](media/power-bi-visualization-treemaps/treemap_addgroup_new.png)
   
   > [!NOTE]
   > Color Saturation and Details cannot be used at the same time.
   > 
   > 
5. Hover over a **Chain** area to reveal the tooltip for that portion of the **Category**.  For example, hovering over **Lindseys** in the **040-Juniors** rectangle reveals the tooltip for Lindsey's portion of the Juniors category.  
   ![](media/power-bi-visualization-treemaps/treemaphoverdetail_new.png)
6. [Add the treemap as a dashboard tile (pin the visual)](../consumer/end-user-tiles.md). 
7. [Save the report](../service-report-save.md).

## Highlighting and cross-filtering
For information about using the Filters pane, see [Add a filter to a report](../power-bi-report-add-filter.md).

Highlighting a Category or Details in a treemap cross-highlights and cross-filters the other visualizations on the report page... and vice versa. To follow along, either add some visuals to the same page or copy/paste the treemap to a report page that already has other visuals.

1. On the treemap, select either a Category or a Chain within a Category.  This cross-highlights the other visualizations on the page. Selecting **050-Shoes**, for example, shows me that last year's sales for shoes was $3,640,471 with $2,174,185 of that coming from Fashions Direct.  
   ![](media/power-bi-visualization-treemaps/treemaphiliting.png)

2. In the **Last Year Sales by Chain** pie chart, selecting the **Fashions Direct** slice, cross-filters the treemap.  
   ![](media/power-bi-visualization-treemaps/treemapnoowl.gif)    

3. To manage how charts cross-highlight and cross-filter each other, see [Visualization interactions in a Power BI report](../consumer/end-user-interactions.md)

## Next steps
[ Pin a visualization to a dashboard](../service-dashboard-pin-tile-from-report.md)  
[Power BI - Basic Concepts](../consumer/end-user-basic-concepts.md)  

More questions? [Try the Power BI Community](http://community.powerbi.com/)  

