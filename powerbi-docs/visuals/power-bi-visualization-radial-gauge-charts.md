---
title: Radial gauge charts in Power BI  
description: 'Radial Gauge charts in Power BI'
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: xmja6Epqa

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 09/21/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Radial gauge charts in Power BI
A radial gauge chart has a circular arc and displays a single value that measures progress toward a goal/KPI.  The goal, or target value, is represented by the line (needle). Progress toward that goal is represented by the shading.  And the value that represents that progress is shown in bold inside the arc. All possible values are spread evenly along the arc, from the minimum (left-most value) to the maximum (right-most value).

In the example below, we are a car retailer, tracking our Sales team's average sales per month. Our goal is 140 and represented by the black needle.  The minimum possible average sales is 0 and we've set the maximum as 200.  The blue shading shows that we're currently averaging approximately 120 sales this month. Luckily, we still have another week to reach our goal.

![](media/power-bi-visualization-radial-gauge-charts/gauge_m.png)

## When to use a radial gauge
Radial gauges are a great choice to:

* show progress toward a goal.
* represent a percentile measure, like a KPI.
* show the health of a single measure.
* display information that can be quickly scanned and understood.

### Prerequisites
 - Power BI service or Power BI Desktop
 - Financial sample Excel workbook: [download the sample directly](http://go.microsoft.com/fwlink/?LinkID=521962).

## Create a basic radial gauge
These instructions use Power BI service. To follow along, sign in to Power BI and open the Excel Financial Sample file.  

Or watch Will show you how to create single metric visuals: gauges, cards, and KPIs.

<iframe width="560" height="315" src="https://www.youtube.com/embed/xmja6EpqaO0?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>

### Step 1: Open the Financial Sample Excel file
1. [Download the sample Financial Excel file](../sample-financial-download.md) if you haven't already. Remember where you saved it.

2. Open the file in ***Power BI service*** by selecting **Get Data \> Files** and browsing to the location where you saved the file. Select **Import**. The Financial Sample is added to your workspace as a dataset.

3. From the **Dataset** content list, select **Financial Sample** to open it in Explore mode.

    ![](media/power-bi-visualization-radial-gauge-charts/power-bi-dataset.png)

### Step 2: Create a gauge to track Gross Sales
1. In the **Fields** pane, select **Gross Sales**.
   
   ![](media/power-bi-visualization-radial-gauge-charts/grosssalesvalue_new.png)
2. Change the aggregation to **Average**.
   
   ![](media/power-bi-visualization-radial-gauge-charts/changetoaverage_new.png)
3. Select the gauge icon ![](media/power-bi-visualization-radial-gauge-charts/gaugeicon_new.png) to convert the Column Chart to a gauge.
   
   By default, Power BI creates a Gauge chart where the current value (in this case, Average of Gross Sales) is assumed to be at the halfway point on the gauge. Since the Average Gross Sales is $182.76K, the start value (Minimum) is set to 0 and the end value (Maximum) is set to double the current value.
   
   ![](media/power-bi-visualization-radial-gauge-charts/gauge_no_target.png)

### Step 3: Set a target value
1. Drag **COGS** to the **Target value** well.
2. Change the aggregation to **Average**.
   Power BI adds a needle to represent our target value of **$145.48K**. Notice that we've exceeded our target.
   
   ![](media/power-bi-visualization-radial-gauge-charts/gaugeinprogress_new.png)
   
   > [!NOTE]
   > You can also manually enter a target value.  See "Use formatting options to manually set Minimum, Maximum, and Target values" below.
   > 
   > 

### Step 4: Set a maximum value
In Step 2, Power BI used the Value field to automatically set minimum (start) and maximum (end).  But what if you want to set your own maximum value?  Let's say that instead of using double the current value as the maximum possible value, you want to set it to the highest Gross Sales number in your dataset? 

1. Drag **Gross Sales** from the **Fields** list to the **Maximum Value** well.
2. Change the aggregation to **Maximum**.
   
   ![](media/power-bi-visualization-radial-gauge-charts/setmaximum_new.png)
   
   The gauge is redrawn with a new end value, 1.21 million in gross sales.
   
   ![](media/power-bi-visualization-radial-gauge-charts/power-bi-final-gauge.png)

### Step 5: Save your report
1. [Save the report](../service-report-save.md).
2. [Add the gauge chart as a dashboard tile](../service-dashboard-pin-tile-from-report.md). 

## Use formatting options to manually set Minimum, Maximum, and Target values
1. Remove **Max of Gross Sales** from the **Maximum value** well.
2. Open the formatting pane by selecting the paint roller icon.
   
   ![](media/power-bi-visualization-radial-gauge-charts/power-bi-roller.png)
3. Expand the **Gauge axis** and enter values for **Min** and **Max**.
   
    ![](media/power-bi-visualization-radial-gauge-charts/power-bi-gauge-axis.png)
4. Remove the current target value by removing the checkmark next to **COGS**.
   
    ![](media/power-bi-visualization-radial-gauge-charts/pbi_remove_target.png)
5. When the **Target** field appears under **Gauge axis**, enter a value.
   
    ![](media/power-bi-visualization-radial-gauge-charts/power-bi-gauge-target.png)
6. Optionally, continue formatting your gauge chart.

## Next step

[Gauges in Power BI](power-bi-visualization-kpi.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
