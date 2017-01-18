<properties
   pageTitle="KPI visuals"
   description="create KPI in power bi"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   featuredVideoId="xmja6EpqaO0"
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/12/2016"
   ms.author="mihart"/>

# KPIs in Power BI

A Key Performance Indicator (KPI) is a visual cue that communicates the amount of progress made toward a measurable goal. For more information about KPIs, see [Microsoft Developer Network](https://msdn.microsoft.com/library/hh272050).

##  When to use a KPI
KPIs are a great choice:

-   to measure progress (what am I ahead or behind on?)

-   to measure distance to a goal (how far ahead or behind am I?)   

##  KPI visual requirements
A Key Performance Indicator (KPI) is based on a specific measure and is designed to help you evaluate the current value and status of a metric against a defined target. Therefore, a KPI visual requires a *base* measure that evaluates to a value and a *target* measure or value, and a threshold or goal.

>[AZURE.NOTE] Currently, a KPI dataset needs to contain goal values for a KPI. This can be done by adding an excel sheet with goals to your data model or PBIX file.

##  How to create a KPI  

To follow along, sign in to Power BI and select **Get Data > Samples > Retail Analysis Sample**. We'll create a KPI that measures the progress we've made toward a sales goal.

Or watch Will show you how to create single metric visuals: gauges, cards, and KPIs.
<iframe width="560" height="315" src="https://www.youtube.com/embed/xmja6EpqaO0?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>

1.  Select **Sales > Total Units This Year**.  This will be the indicator.

2.  Add **Time > Month**.  This will be represent the trend.

2. Convert the visual to a KPI by selecting the KPI icon from the Visualization pane.

    ![](media/powerbi-service-tutorial-kpi/kpi-icon.png)

3. Add a goal. Add last years sales as the goal. Drag **Total Units Last Year** to the **Target goals** field.

    ![](media/powerbi-service-tutorial-kpi/kpi-new.png)

4.  Optionally, format the KPI by selecting the paintbrush icon to open the Formatting pane.

    -   **Indicator** - controls the indicator’s display units and decimal places.

    -   **Trend axis** - when set to **On**, the trend axis is displayed as the background of the KPI visual.  

    -   **Goals** - when set to **On**, the visual displays the goal and the distance from the goal as a percentage.

    -   **Status** - some KPIs are considered *better* for higher values and some are considered *better* for lower values. For example, earnings VS. wait time. Typically a higher value of earnings is better versus a higher value of wait time – that is usually considered as worse. This toggle allows the selection of a KPI behavior. The status selection defaults to **high is better**.

6.  When you have the KPI as you want it, [pin it to a dashboard](powerbi-service-pin-a-tile-to-a-dashboard-from-a-report.md).


KPIs are also available on your mobile devices – keeping you always connected to your businesses heartbeat



##  See also

[Reports in Power BI](powerbi-service-reports.md)

[Visualizations in Power BI reports](powerbi-service-visualizations-for-reports.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
