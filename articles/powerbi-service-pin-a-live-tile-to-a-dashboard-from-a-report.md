<properties
   pageTitle="Pin an entire report page to a Power BI dashboard "
   description="Pin an entire live report page to a Power BI dashboard from a report."
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/28/2016"
   ms.author="mihart"/>

# Pin an entire report page, as a live tile, to a Power BI dashboard

Another way to add a new [dashboard tile](powerbi-service-dashboard-tiles.md) is by pinning an entire report page.  This is an easy way to pin more than one visualization at a time.  Also, when you pin an entire page, the tiles are *live*; you can interact with them right there on the dashboard. And changes you make to any of the visualizations back in the report editor, like adding a filter or changing the fields used in the chart, are reflected in the dashboard tile as well.  

**NOTE**:  You can't pin tiles from reports that are shared with you.

## Pin a report page

1. From  the menubar, select **Pin Live Page**. ![](media/powerbi-service-pin-a-live-tile-to-a-dashboard-from-a-report/pbi-pin-live-page.png) 

2.  Pin the tile to an existing dashboard or to a new dashboard. Notice the highlighted text: *Pin live page enables changes to reports to appear in the dashboard tile when the page is refreshed.*

  -   Existing dashboard: select the name of the dashboard from the dropdown. Dashboards that have been shared with you will not appear in the dropdown.

  -   New dashboard: type the name of the new dashboard.

     ![](media/powerbi-service-pin-a-live-tile-to-a-dashboard-from-a-report/pbi-pin-live-page-dialog.png)

3.  Select **Pin live**. A Success message (near the top right corner) lets you know the page was added, as a tile, to your dashboard.

4.  From the navigation pane, select the dashboard with the new live tile. There, you can do things like [rename, resize, link, and move](powerbi-service-edit-a-tile-in-a-dashboard.md) the pinned report page.  

5. Interact with the live tile.  In the screenshot below, selecting a bar on the column chart has cross-filtered and cross-highlighted the other visualizations on the tile.

    ![](media/powerbi-service-pin-a-live-tile-to-a-dashboard-from-a-report/pbi-live-tile.png)

## See also

[Reports in Power BI](powerbi-service-reports.md)

[Q&A in Power BI](powerbi-service-q-and-a.md)

[Power BI Preview - Basic Concepts](powerbi-service-basic-concepts.md)

[Dashboards in Power BI](powerbi-service-dashboards.md)
