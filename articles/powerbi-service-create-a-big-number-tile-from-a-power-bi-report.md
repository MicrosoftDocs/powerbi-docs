<properties
   pageTitle="Create a big number tile from a Power BI report"
   description="Create a big number tile from a Power BI report"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
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
   ms.date="02/22/2016"
   ms.author="mihart"/>
# Create a big number tile from a Power BI report

Sometimes a single number is the most important thing you want to track in your Power BI dashboard, such as total sales, market share year over year, or total opportunities. You can create a big number tile by [asking a question in the Q&A box](powerbi-service-create-a-big-number-tile-for-a-dashboard.md), or in a Power BI report. This article explains how to create one in a report.

1.  Create a [dashboard](powerbi-service-dashboards.md) and [get data](powerbi-service-get-data.md).

    If you want data to practice on, try [downloading the Retail Analysis sample](powerbi-sample-retail-analysis-take-a-tour.md). 

2.  In the left navigation bar, select the report that the dashboard is based on - in this example, the Retail Analysis Sample report.

3.  Select **Edit Report**.

4.  In the report, find a page with some blank space, or [add a new page to the report](powerbi-service-add-a-page-to-a-report.md).

5.  In the Fields list, select the number field you want to display.

    In this example, **Open Store count** in the **Store** table. Power BI creates a column chart with the one number.

    ![](media/powerbi-service-create-a-big-number-tile-from-a-power-bi-report/PBI_RptNumberTileChart.png)

6.  In the Visualizations pane, select the Card icon.

    ![](media/powerbi-service-create-a-big-number-tile-from-a-power-bi-report/PBI_ChangeChartCard.png)

7.  Select the pin icon ![](media/powerbi-service-create-a-big-number-tile-from-a-power-bi-report/PBI_PinTile.png) in the upper-right corner to add the tile to the dashboard. 

    ![](media/powerbi-service-create-a-big-number-tile-from-a-power-bi-report/PBI_DashNumberTileReport.png)

8.  Pin the tile to an existing dashboard or to a new dashboard. 

    -   Existing dashboard: select the name of the dashboard from the dropdown.

    -   New dashboard: type the name of the new dashboard.

9.  Select **Pin**.

    A Success message (near the top right corner) lets you know the visualization was added, as a tile, to your dashboard.

    ![](media/powerbi-service-create-a-big-number-tile-from-a-power-bi-report/pinSuccess.png)

10. From the navigation pane, select the dashboard with the new tile. There, you can [edit and move](powerbi-service-edit-a-tile-in-a-dashboard.md) the pinned visualization.



## See also

[Dashboard tiles in Power BI](powerbi-service-dashboard-tiles.md)

[Dashboards in Power BI](powerbi-service-dashboards.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

[](powerbi-service-dashboards.md)
