---
title: Key Performance Indicator (KPI) visuals
description: Create Key Performance Indicator (KPI) visuals in Power BI. 
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/15/2023
ms.custom: sample-Retail-Analysis
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

A KPI semantic model needs to contain goal values for a KPI. If your semantic model doesn't contain goal values, you can create them by adding an Excel sheet with goals to your data model or PBIX file.

# [Power BI Desktop](#tab/powerbi-desktop)

To follow along, use the [Retail Analysis sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. From the upper left section of the menubar, select **File** \> **Open report**.

1. Find your copy of the **Retail Analysis Sample PBIX file**.

1. Open the **Retail Analysis Sample PBIX file** in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::.

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

# [Power BI service](#tab/powerbi-service)

To follow along, use the [Retail Analysis sample](../create-reports/sample-retail-analysis.md).

1. On the Home page of the Power BI service, scroll down to **Getting started with Power BI** and select **Sample reports**.

    :::image type="content" source="media/power-bi-visualization-kpi/get-data-samples.png" alt-text="Screenshot of Discover content link to Samples.":::

1. Choose **Retail Analysis Sample**. Power BI loads the sample semantic model.

1. From the menubar, select **Edit** :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-edit-icon.png":::.

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## How to create a KPI

In this example, you create a KPI that measures the progress you made toward a sales goal.

1. From the **Fields** pane, select **Sales** \> **Total Units This Year**. This value is the indicator.

1. Add **Time** \> **FiscalMonth**. This value represents the trend.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-initial-visualization-values.png" alt-text="Screenshot of the X and Y axis wells.":::

1. In the upper-right corner of the visual, select the **More options** ellipsis (...) and select **Sort axis** \> **FiscalMonth**.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-sort-by-fiscal-month.png" alt-text="Screenshot of the ellipsis menu expanded with Sort axis and FiscalMonth.":::

1. Select the ellipsis again and choose **Sort axis** \> **Sort ascending**.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-sort-by-ascending.png" alt-text="Screenshot of the ellipsis menu expanded with Sort by ascending.":::

1. Check that Power BI sorts the columns in ascending order by **FiscalMonth**.

    > [!IMPORTANT]
    > Once you convert the visualization to a KPI, there's **no** option to sort. You must sort the visualization now, if desired.

    Once you sort the KPI correctly, your visual looks like this:

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-chart.png" alt-text="Screenshot of the visualization sorted correctly.":::

1. Convert the visual to a KPI by selecting the **KPI** icon from the **Visualization** pane.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-kpi-template.png" alt-text="Screenshot of the Visualizations pane with the KPI icon called out.":::

1. To add a goal, drag **Total Units Last Year** to the **Target** field.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-desktop-value-trend-axis-trend.png" alt-text="Screenshot of the Visualizations pane with the Value, Trend axis, and Trend fields filled in.":::

1. Optionally, format the KPI by selecting the paint brush icon to open the **Format visual** pane.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-format-visual.png" alt-text="Screenshot of the Format visual pane.":::

    * **Callout value** - controls the indicator's display units, decimal places, and text formatting.

    * **Icons** - when set to **On**, the visual shows small icons next to the value, a green checkmark for an increasing value, and a red exclamation point for a decreasing value. The value's direction is set by **Trend axis**.

    * **Trend axis** - when set to **On**, the visual shows the trend axis as the background of the KPI visual. People consider some KPIs better for *higher* values and consider some better for *lower* values. For example, earnings versus wait time. Typically a higher value of earnings is better versus a higher value of wait time. For this report, select **Direction** \> **High is good**. Optionally, change the color settings.

        :::image type="content" source="media/power-bi-visualization-kpi/power-bi-format-trend-axis.png" alt-text="Screenshot of the Trend axis formatting options.":::

    * **Target label** - when set to **On**, the visual shows the value's label. **Distance to goal** sets the style and direction of the distance from the goal.

        :::image type="content" source="media/power-bi-visualization-kpi/power-bi-format-distance-to-goal.png" alt-text="Screenshot of the Format distance to go pane.":::

    * **Date** - when set to **On**, the visual shows the date. Optionally, change the font, and its style and color.

KPIs are also available on your mobile devices. It gives you the option to be always connected to your business's heartbeat.

## Considerations and troubleshooting

- If your KPI doesn't look like the example, it may be because you didn't sort by **FiscalMonth**. KPIs don't have a sort option. Start again and sort by **FiscalMonth** *before* you convert your visualization to a KPI.   
- In general, if your KPI doesn't display a trend axis, make sure that the column in the **Value** well is continuous and doesn't include a null value.

## Related content

* [Tips and tricks for Power BI Map visualizations](power-bi-map-tips-and-tricks.md)

* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)

More questions? [Try the Power BI Community.](https://community.powerbi.com/)
