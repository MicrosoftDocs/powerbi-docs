<properties
   pageTitle="Dashboard tiles in Power BI"
   description="All about dashboard tiles in Power BI"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/02/2016"  
   ms.author="mihart"/>

# Dashboard tiles in Power BI  

A tile is a snapshot of your data, pinned to the dashboard. A tile can be created from a report, dataset, dashboard, from the Q&A box, Excel, and from SQL Server Reporting Services (SSRS), and more.  
![](media/powerbi-service-dashboard-tiles/PBI_DashFull.png)

Besides pinning, some types of tiles can be created directly on the dashboard using the [widget control](powerbi-service-add-a-widget-to-a-dashboard.md).

Need help understanding the building blocks that make up Power BI?  See [Power BI - Basic Concepts](powerbi-service-basic-concepts.md).


## How do I create a tile?
### You can pin a tile

Tiles can be pinned to dashboards from reports, Q&A, SSRS, Excel, and more.

1. When you select an item to pin, Power BI opens the **Pin to dashboard** screen.

    ![](media/powerbi-service-dashboard-tiles/PBI_themes2.png)

2. Decide whether to pin to an existing dashboard or new dashboard. If existing, select the dashboard name from the dropdown.  If new, enter the name for the new dashboard.

3. In some cases, the item you are pinning may have a *theme* already applied.  For example, visuals pinned from an Excel workbook. If so, select which theme to apply to the tile.


  -   [Pin a tile to a dashboard from the Q&A question box](powerbi-service-pin-a-tile-to-a-dashboard-from-the-question-box.md)

  -   [Pin a tile to a dashboard from a report](powerbi-service-pin-a-tile-to-a-dashboard-from-a-report.md)

  -   [Pin a tile to a dashboard from another dashboard](powerbi-pin-a-tile-from-one-dashboard-to-another.md)

  - [Pin a tile to a dashboard from an Excel workbook on OneDrive for Business](powerbi-service-pin-a-tile-to-a-dashboard-from-excel.md)

  - [Pin an entire report page to a dashboard](powerbi-service-pin-a-tile-to-a-dashboard-from-a-report.md)

  - [Run Quick Insights to discover insights and generate visualizations for your dashboard](powerbi-service-auto-insights.md).

  -   [Pin a tile to a dashboard from SSRS](https://msdn.microsoft.com/library/mt604784.aspx)

  -   [Add an image to a dashboard](powerbi-service-add-an-image-to-a-dashboard.md)

  -   Add a big number tile [from Q&A](powerbi-service-create-a-big-number-tile-for-a-dashboard.md) and [from a report](powerbi-service-create-a-big-number-tile-from-a-power-bi-report.md)

### You can create the tile directly on the dashboards
The dashboard **Add widget** control lets you [add an image, text box, video, or web code to your dashboard](powerbi-service-add-a-widget-to-a-dashboard.md).

## How do I edit and move a tile?
-   [Add a hyperlink to a tile](powerbi-service-edit-a-tile-in-a-dashboard.md).

-   [Rename a tile](powerbi-service-edit-a-tile-in-a-dashboard.md). 

-   [Resize a tile](powerbi-service-edit-a-tile-in-a-dashboard.md). 

-   [Move a tile](powerbi-service-edit-a-tile-in-a-dashboard.md). 

-   [Add a hyperlink to a tile](powerbi-service-edit-a-tile-in-a-dashboard.md).

-   [View a tile in full screen mode](powerbi-service-edit-a-tile-in-a-dashboard.md). 

-   [Export a tile to Power Point](http://blogs.msdn.com/b/powerbidev/archive/2015/09/28/integrating-power-bi-tiles-into-office-documents.aspx)

## What happens when I hover over a dashboard tile?  

Hovering over a tile reveals the ellipses (...) and resize handle. Hovering also allows you to move the tile.

- [Resize the tile with the resize handle](powerbi-service-edit-a-tile-in-a-dashboard) ![](media/powerbi-service-dashboard-tiles/resize-handle.jpg)

- Move the tile by selecting and dragging the tile to a new location on the dashboard.

- Select the ellipses (...) to open the action menu. Depending on how the tile was created (see above), you'll be able to do most, or all, of the following:

  ![](media/powerbi-service-dashboard-tiles/tile-menu.png)

  - Open the tile in [Focus mode](powerbi-service-display-dash-in-focus-mode.md) ![](media/powerbi-service-dashboard-tiles/fullscreen-icon.jpg)

  - [Pin the tile to another dashboard with the pin icon](powerbi-service-pin-a-tile-from-one-dashboard-to-another.md)
 ![](media/powerbi-service-dashboard-tiles/pin-icon.jpg)

  - [Export the data used in the tile](powerbi-service-export-data.md)
  ![](media/powerbi-service-dashboard-tiles/export-icon.png)

  - [Edit the title with the pencil icon](powerbi-service-edit-a-tile-in-a-dashboard.md)
 ![](media/powerbi-service-dashboard-tiles/pencil-icon.jpg)

  - [Remove the tile from the dashboard with the delete icon](powerbi-service-edit-a-tile-in-a-dashboard.md)
 ![](media/powerbi-service-dashboard-tiles/trash-icon.png)

  - Select the arrow icon ![](media/powerbi-service-dashboard-tiles/goto-report.png) or the column chart **Go To Report** icon ![](media/powerbi-service-dashboard-tiles/chart-icon.jpg) to open the report or Q&A query that was used to create the tile.

  - If a custom hyperlink has been set, selecting the tile title, takes you to that location.

  - Close the action menu by selecting the X icon ![](media/powerbi-service-dashboard-tiles/delete-icon.jpg).

## What happens when I select a dashboard tile?  
When you select a tile, what happens next depends on how the tile was created and if it has a [custom link](powerbi-service-edit-a-tile-in-a-dashboard.md). If it has a custom link, selecting the tile takes you to that link. If there is no custom link, and you created the tile from:

### A tile created in a report

Selecting the tile takes you go to a page in the report (in [Reading View](powerbi-service-interact-with-a-report-in-reading-view.md)).

### A tile created in Q&A

Selecting the tile takes you go to Q&A. Q&A opens with the question that was used to create the visualization, displaying the visualization.

### A tile created in a dataset

If you saved the report in which you created the visualization, you go to a page in the report. If not, then selecting the tile produces no action.

### An Excel workbook on OneDrive for Business
If you have at least Read permissions for that workbook, it will open in Excel Online.

### A dashboard widget

If a custom hyperlink has been set, selecting the title, subtitle, and or tile will open that URL.  Otherwise, by default, selecting the widget tile does the following:

  - video: plays the video
  - web code or image: nothing
  - text box: nothing but if the text contains hyperlinks, specifically-selecting the hyperlink opens that URL.

### SSRS
If you have permissions, the [SSRS report manager page opens](https://msdn.microsoft.com/library/mt604784.aspx).

 >**Note:**  
 >If the original visualization used to create the tile changes, the tile doesn't change.  For example, if you pinned a line chart from a report and then you change the line chart to a bar chart, the dashboard tile continues to show a line chart.

## See also  
[Dashboards in Power BI](powerbi-service-dashboards.md)  
[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)  
