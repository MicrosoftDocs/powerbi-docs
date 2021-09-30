---
title: How to pin a tile to a dashboard from Q&A
description: Documentation on how to pin a tile to a Power BI dashboard from the Q&A question box
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 09/10/2021
LocalizationGroup: Dashboards
---
# Pin a tile to a dashboard from Q&A

Q&A is a Power BI tool for exploring your data using natural language. Need to find a particular insight? Ask a question about your data, and receive an answer in the form of a visualization.

In this how-to article, we open a [dashboard](../consumer/end-user-dashboards.md) in the Power BI service (app.powerbi.com), ask a question using natural language to create a visualization, and pin that visualization to the dashboard. Dashboards aren't available in Power BI Desktop. For information on using Q&A with other Power BI tools and content, see the [Power BI Q&A overview](../consumer/end-user-q-and-a.md). 

To follow along, open the [Retail Analysis sample dashboard](sample-retail-analysis.md).

## How to pin a tile from Q&A

1. Open a dashboard that has at least one tile pinned from a report. When you ask a question, Power BI looks for the answer in any dataset that has a tile pinned to that dashboard.
2. In the question box at the top of your dashboard, start typing what you want to know about your data.  
   ![Q&A question box](media/service-dashboard-pin-tile-from-q-and-a/power-bi-question-box.png)
3. For example, as you type "year over year revenue"...  
   ![type a question](media/service-dashboard-pin-tile-from-q-and-a/power-bi-type-q-and-a.png)

   the question box gives you suggestions.
4. To add the chart to your dashboard as a tile, select the pin ![Pin icon](../media/pin-icon.png) on the top-right side of the canvas. If the dashboard has been shared with you, you won't be able to pin any visualizations.

5. Pin the tile to an existing dashboard or to a new dashboard.

   ![Pin to dashboard dialog](media/service-dashboard-pin-tile-from-q-and-a/power-bi-pin-to-dashboard.png)

   * Existing dashboard: select the name of the dashboard from the dropdown. Your choices will be limited to only those dashboards within the current workspace.
   * New dashboard: type the name of the new dashboard and it will be added to your current workspace.

6. Select **Pin**.

   A success message (near the top-right corner) lets you know the visualization was added, as a tile, to your dashboard.  

   ![Pinned to dashboard](../media/power-bi-pin.png)
7. Select **Go to dashboard** to see the new tile. There, you can [rename, resize, add a hyperlink, reposition the tile, and more](service-dashboard-edit-tile.md) on your dashboard.

   ![dashboard with tiles](media/service-dashboard-pin-tile-from-q-and-a/power-bi-pinned.png)

## Considerations and troubleshooting
* When you start typing a question, Q&A immediately begins searching for the best answer from all datasets associated with the current dashboard.  The "current dashboard" is the dashboard listed in the top nav pane. For example, this question is being asked in the **Retail Analysis Sample** dashboard.

  ![breadcrumbs](media/service-dashboard-pin-tile-from-q-and-a/power-bi-navbar.png)
* **How does Q&A know which datasets to use**?  Q&A has access to all datasets that have at least one visualization pinned to that dashboard.

* **Don't see the question box**? Check with your Power BI administrator. The administrator has the ability to disable Q&A.


## Next steps
[Rename, resize, add a hyperlink, reposition the tile, and more](service-dashboard-edit-tile.md)    
[Display your dashboard tile in Focus mode](../consumer/end-user-focus.md)     
[Overview of Q&A in Power BI](../consumer/end-user-q-and-a.md)  
More questions? [Try the Power BI Community](https://community.powerbi.com/)
