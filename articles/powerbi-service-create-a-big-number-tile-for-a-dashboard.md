<properties
   pageTitle="Create a big number tile for a Power BI dashboard by asking a question"
   description="Create a big number tile for a Power BI dashboard by asking a question"
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
   ms.date="01/20/2017"
   ms.author="mihart"/>

# Create a big number tile for a Power BI dashboard by asking a question  

Sometimes a single number is the most important thing you want to track in your Power BI dashboard, such as total sales, market share year over year, or total opportunities. You can [create a big number tile in a Power BI report](powerbi-service-create-a-big-number-tile-from-a-power-bi-report.md) or by asking a question in the Q&A box. This article explains how to create one in Q&A.

![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/PBI_OpptuntiesCard.png)

The question box is the easiest way to make a number tile like this.

1.    Create a [dashboard](powerbi-service-dashboards.md) and [get data](powerbi-service-get-data.md). This example uses the [Opportunity Analysis sample](powerbi-sample-opportunity-analysis-take-a-tour.md).

2.    At the top of your dashboard, start typing what you want to know about your data in the question box. This example uses the Opportunity Analysis sample.

    ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/power-bi-q-and-a-box.png)

3.    For example, type "number of opportunities" in the question box.
    ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/power-bi-ask.png)

    The question box suggests, restates as **Showing opportunity count**, and displays the total number.  

4.  Select the pin icon ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/PBI_PinTile.png) in the upper-right corner to add the number tile to the dashboard. 

    ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/power-bi-pin.png)

5.  Pin the tile to an existing dashboard or to a new dashboard. 

    -   Existing dashboard: select the name of the dashboard from the dropdown.

    -   New dashboard: type the name of the new dashboard.

6.  Select **Pin**.

    A Success message (near the top right corner) lets you know the visualization was added, as a tile, to your dashboard.  

    ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/pinSuccess.png)

7.  From the navigation pane, select the dashboard with the new tile. There, you can [rename, resize, link, and move](powerbi-service-edit-a-tile-in-a-dashboard.md) the pinned visualization.  
    ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/PBI_DashTileTitle.png)

## Troubleshooting
If you do not see a question box at all, it may be that you have not enabled Q&A for this dataset.  

##  Enable Q&A

1.  In the upper-right corner of Power BI, select the cog icon ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/power-bi-cog.png) and choose **Settings**.

    ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/powerbi-settings.png)

2.  Select **datasets** and choose the dataset to enable for Q&A.

    ![](media/powerbi-service-create-a-big-number-tile-for-a-dashboard/power-bi-q-and-a-settings-new.png)

3. Expand **Q&A and Cortana**, select the checkbox for **Turn on Q&A for this dataset** and choose **Apply**.

    ![](media/powerbi-service-q-and-a-direct-query/power-bi-q-and-a-directquery.png)

## See also  
[Dashboard tiles in Power BI](powerbi-service-dashboard-tiles.md)  
[Dashboards in Power BI](powerbi-service-dashboards.md)  
[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
