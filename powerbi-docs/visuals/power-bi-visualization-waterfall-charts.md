---
title: Waterfall charts in Power BI
description: 'Waterfall charts in Power BI'
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: maTzOJSRB3g
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/24/2019
ms.author: mihart
LocalizationGroup: Visualizations
---

# Waterfall charts in Power BI

[!INCLUDE [power-bi-visuals-desktop-banner](../includes/power-bi-visuals-desktop-banner.md)]

Waterfall charts show a running total as Power BI adds and subtracts values. They're useful for understanding how an initial value (like net income) is affected by a series of positive and negative changes.

The columns are color coded so you can quickly notice increases and decreases. The initial and the final value columns often [start on the horizontal axis](https://support.office.com/article/Create-a-waterfall-chart-in-Office-2016-for-Windows-8de1ece4-ff21-4d37-acd7-546f5527f185#BKMK_Float "start on the horizontal axis"), while the intermediate values are floating columns. Because of this style, waterfall charts are also called bridge charts.

   > [!NOTE]
   > This video uses an older version of Power BI Desktop.
   > 
   > 

<iframe width="560" height="315" src="https://www.youtube.com/embed/qKRZPBnaUXM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## When to use a waterfall chart

Waterfall charts are a great choice:

* When you have changes for the measure across time, a series, or different categories.

* To audit the major changes contributing to the total value.

* To plot your company's annual profit by showing various sources of revenue and arrive at the total profit (or loss).

* To illustrate the beginning and the ending headcount for your company in a year.

* To visualize how much money you make and spend each month, and the running balance for your account.

## Prerequisite

This tutorial uses the [Retail Analysis sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. From the upper left section of the menubar, select **File** > **Open**
   
2. Find your copy of the **Retail Analysis sample PBIX file**

1. Open the **Retail Analysis sample PBIX file** in report view ![Screenshot of the report view icon.](media/power-bi-visualization-kpi/power-bi-report-view.png).

1. Select ![Screenshot of the yellow tab.](media/power-bi-visualization-kpi/power-bi-yellow-tab.png) to add a new page.


## Create a waterfall chart

You'll create a waterfall chart that displays sales variance (estimated sales versus actual sales) by month.

1. From the **Fields** pane, select **Sales** > **Total Sales Variance**.

   ![Screenshot of Sales > Total Sales Variance selected and the visual that results.](media/power-bi-visualization-waterfall-charts/power-bi-first-value.png)

1. Select the waterfall icon ![Screenshot of the waterfall icon](media/power-bi-visualization-waterfall-charts/power-bi-waterfall-icon.png)

    ![Visualization templates](media/power-bi-visualization-waterfall-charts/convert-waterfall.png)

1. Select **Time** > **FiscalMonth** to add it to the **Category** well.

    ![waterfall](media/power-bi-visualization-waterfall-charts/power-bi-waterfall.png)

1. Make sure Power BI sorted the waterfall chart chronologically. From the top-right corner of the chart, select **More options** (...).

    For this example we will select **Sort ascending**

    Check that there is a yellow indicator next to the left of the **Sort ascending.** This indicates that your selected option is being applied.

    ![Select sort by > Ascending order](media/power-bi-visualization-waterfall-charts/power-bi-sort-by.png)

    Next, we are going to click **Sort by** and select **FiscalMonth** As with the previous step, a yellow indicator next to your selection indicates when your selection option is being applied.

    ![Select sort by > FiscalMonth](media/power-bi-visualization-waterfall-charts/power-bi-sort-by-fiscal-month.png)

    You can also look at the X-Axis values and see that they are in order from **Jan** to **Aug**.

    Dig in a little more to see what's contributing most to the changes month to month.

1.  Select **Store** > **Territory** which will add **Territory** to the **Breakdown** bucket.

    ![Shows Store in Breakdown bucket](media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown.png)

    By default, Power BI adds the top five contributors to increases or decreases by month. The below image has expanded our visualization pane to include more data. 

    ![Shows Store in Breakdown bucket](media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown-initial.png)

    You're only interested in the top two contributors.

1. In the **Format** pane, select **Breakdown** and set **Max breakdowns** to **2**.

    ![Format > Breakdown](media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown-maximum.png)

    A quick review reveals that the territories of Ohio and Pennsylvania are the biggest contributors to movement, both negative and positive, in your waterfall chart.

    ![waterfall chart](media/power-bi-visualization-waterfall-charts/power-bi-waterfall-axis.png)

## Next steps

* [Change how visuals interact in a Power BI report](../service-reports-visual-interactions.md)

* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
