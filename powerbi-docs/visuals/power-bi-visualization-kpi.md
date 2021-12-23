---
title: Key Performance Indicator (KPI) visuals
description: Create Key Performance Indicator (KPI) visuals in Power BI 
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 09/29/2021
LocalizationGroup: Visualizations
#Customer intent: as a report creator, I want to understand when to use a KPI to visualize my data because there are so many different visual types, I want to be sure that a KPI is the best choice for my intent.  
---

# Create key performance indicator (KPI) visualizations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A Key Performance Indicator (KPI) is a visual cue that communicates the amount of progress made toward a measurable goal. For more about KPIs, see [Key Performance Indicators (KPIs) in PowerPivot](https://support.office.com/article/Key-Performance-Indicators-KPIs-in-Power-Pivot-E653EDEF-8A21-40E4-9ECE-83A6C8C306AA).


## When to use a KPI

KPIs are a great choice:

* To measure progress. Answers the question, "What am I ahead or behind on?"

* To measure distance to a goal. Answers the question, "How far ahead or behind am I?"

## KPI requirements

A designer bases a KPI visual on a specific measure. The intention of the KPI is to help you evaluate the current value and status of a metric against a defined target. A KPI visual requires a *base* measure that evaluates to a value, a *target* measure or value, and a *threshold* or *goal*.

A KPI dataset needs to contain goal values for a KPI. If your dataset doesn't contain goal values, you can create them by adding an Excel sheet with goals to your data model or PBIX file.

## Prerequisites

This tutorial uses the [Retail Analysis sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. From the upper left section of the menubar, select **File** > **Open report**

1. Find your copy of the **Retail Analysis Sample PBIX file**

1. Open the **Retail Analysis Sample PBIX file** in report view :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::.

1. Select **+** to add a new page :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png":::.

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## How to create a KPI

In this example, you'll create a KPI that measures the progress you've made toward a sales goal.

1. From the **Fields** pane, select **Sales > Total Units This Year**.  This value will be the indicator.

1. Add **Time > FiscalMonth**.  This value will represent the trend.

1. In the upper-right corner of the visual, select the ellipsis and select **Sort by > FiscalMonth**, then select the ellipsis again and choose **Sort ascending**.

1. Check that Power BI has sorted the columns in ascending order by **FiscalMonth**.

    > [!IMPORTANT]
    > Once you convert the visualization to a KPI, there's **no** option to sort. You must sort it correctly now.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-ascending-by-fiscal-month.png" alt-text="Screenshot of the ellipsis menu expanded with Sort ascending and FiscalMonth selected.":::

    Once sorted correctly, your visual will look like this:

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-chart.png" alt-text="Screenshot of the visual sorted correctly.":::

1. Convert the visual to a KPI by selecting the **KPI** icon from the **Visualization** pane.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-kpi-template.png" alt-text="Screenshot of the Visualizations pane with the KPI icon called out.":::

1. To add a goal, drag **Total Units Last Year** to the **Target goals** field.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-kpi-done.png" alt-text="Screenshot of the finished KPI visual and the Fields pane with the values depicted.":::

1. Optionally, format the KPI by selecting the paint roller icon to open the Formatting pane.

    * **Indicator** - controls the indicator’s display units and decimal places.

    * **Trend axis** - when set to **On**, the visual shows the trend axis as the background of the KPI visual.  

    * **Goals** - when set to **On**, the visual shows the goal and the distance from the goal as a percentage.

    * **Color coding > Direction** - people consider some KPIs better for *higher* values and consider some better for *lower* values. For example, earnings versus wait time. Typically a higher value of earnings is better versus a higher value of wait time. Select **High is good** and, optionally, change the color settings.

KPIs are also available in the Power BI service and on your mobile devices. It gives you the option to be always connected to your business's heartbeat.

## Considerations and troubleshooting

If your KPI doesn't look like the one above, it may be because you didn't sort by **FiscalMonth**. KPIs don't have a sort option. You'll need to start again and sort by **FiscalMonth** *before* you convert your visualization to a KPI.

## Next steps

* [Tips and Tricks for Power BI Map visualizations](power-bi-map-tips-and-tricks.md)

* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
