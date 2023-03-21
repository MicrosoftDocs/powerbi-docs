---
title: Waterfall charts in Power BI
description: Learn how to use Waterfall charts in Power BI.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: removed
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/14/2022
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Waterfall charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Waterfall charts show a running total as Power BI adds and subtracts values. These charts are useful for understanding how an initial value (like net income) is affected by a series of positive and negative changes.

The columns are color coded so you can quickly notice increases and decreases. The initial and the final value columns often [start on the horizontal axis](https://support.microsoft.com/office/create-a-waterfall-chart-8de1ece4-ff21-4d37-acd7-546f5527f185#bkmk_float), while the intermediate values are floating columns. Because of this style, waterfall charts are also called bridge charts.

:::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-chart.png" alt-text="Screenshot of a waterfall chart example.":::

## When to use a waterfall chart

Waterfall charts are a great choice:

* When you have changes for the measure across time, a series, or different categories.

* To audit the major changes contributing to the total value.

* To plot your company's annual profit by showing various sources of revenue and arrive at the total profit (or loss).

* To illustrate the beginning and the ending headcount for your company in a year.

* To visualize how much money you make and spend each month, and the running balance for your account.

* When you want to visualize the steps and relationships of business processes

* When you want to monitor and control data quality

* When you want to visualize and track the progress of project steps

* To analyze data defects and identify their causes

* To understand the workings of the organization and the connections between departments

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

2. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

3. Browse to the **Retail Analysis Sample PBIX.pbix** file, then select **Open**.

4. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the built-in Retail Analysis Sample in the Power BI service.

1. Open the Power BI service, then select **Get data** in the bottom left corner.

2. On the Get Data page that appears, select **Samples**.

   :::image type="content" source="media/power-bi-visualization-slicers/get-data-samples.png" alt-text="Screenshot of Get Data box with link to samples.":::

3. Select the **Retail Analysis Sample**, and choose **Connect**.

4. Select **Edit** on the menu bar to display the **Visualizations** pane.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Create a waterfall chart

You'll create a waterfall chart that displays sales variance (estimated sales versus actual sales) by month.

1. From the **Fields** pane, select **Sales** > **Total Sales Variance**.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-bar.png" alt-text="Screenshot of Total Sales Variance field selected and the visual that results.":::

1. Select the Waterfall chart icon.

    :::image type="content" source="media/power-bi-visualization-waterfall-charts/convert-waterfall.png" alt-text="Screenshot of Visualizations pane with Waterfall icon selected.":::

1. Select **Time** > **FiscalMonth** to add it to the **Category** well.

    :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-month.png" alt-text="Screenshot of the total Sales Variance by FiscalMonth waterfall chart.":::

## Sort the waterfall chart

1. Make sure Power BI sorts the waterfall chart chronologically by month. From the top-right corner of the chart, select **More options** (...).

    For this example, select **Sort by** and choose **FiscalMonth**. A check mark next to your selection indicates when your selection option has been applied.

    :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-sort-by-fiscal-month.png" alt-text="Screenshot of options box with Sort by FiscalMonth selected.":::

    To display the months in chronological order, select **Sort ascending**.

    :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-ascending.png" alt-text="Screenshot of options box with Select sort by Ascending order.":::

    Notice that your chart is sorted from January to August for FiscalMonth.  

## Explore the waterfall chart

Dig in a little more to see what's contributing most to the changes month to month.

1. Select **Store** > **Territory**, which will add **Territory** to the **Breakdown** bucket.

    :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown.png" alt-text="Screenshot that shows adding Territory to the Breakdown area.":::

    Power BI uses the value in **Breakdown** to add more data to the visualization. It adds the top five contributors to increases or decreases for each fiscal month. February, for example, now has six data points instead of just one.  

    :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown-default.png" alt-text="Screenshot of Territory field added to the Breakdown bucket.":::

    Let's say that you're only interested in the top two contributors.

1. In the **Format** pane, select **Breakdown** and set **Max breakdowns** to **2**.

    :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown-two.png" alt-text="Screenshot of Max Breakdowns set to two breakdowns.":::

    A quick review reveals that the territories of Ohio and Pennsylvania are the biggest contributors to movement, both negative and positive, in your waterfall chart.

    :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-axis-waterfall.png" alt-text="Screenshot of waterfall chart with territories that are the biggest contributors highlighted.":::

## Next steps

* [Change how visuals interact in a Power BI report](../create-reports/service-reports-visual-interactions.md)

* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)

