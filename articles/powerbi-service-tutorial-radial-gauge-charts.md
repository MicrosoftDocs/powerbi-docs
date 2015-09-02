<properties pageTitle="Tutorial: Radial Gauge charts in Power BI" description="Tutorial: Radial Gauge charts in Power BI" services="powerbi" documentationCenter="" authors="v-anpasi" manager="mblythe" editor=""/>
<tags ms.service="powerbi" ms.devlang="NA" ms.topic="article" ms.tgt_pltfrm="NA" ms.workload="powerbi" ms.date="06/26/2015" ms.author="v-anpasi"/>
# Tutorial: Radial Gauge charts in Power BI
[← Visualizations in reports](https://support.powerbi.com/knowledgebase/topics/65160-visualizations-in-reports)

A Radial Gauge chart has a circular arc and displays a single value that measures progress toward a goal/KPI.  The goal, or target value, is represented by the line (needle). Progress toward that goal is represented by the shading.  And the value that represents that progress is shown in bold inside the arc. All possible values are spread evenly along the arc, from the minimum (left-most value) to the maximum (right-most value).

In the example below, we are a car retailer, tracking our Sales team's average sales per month. Our goal is 140 and represented by the black needle.  The minimum possible average sales is 0 and we've set the maximum as 200.  The blue shading shows that we're currently averaging approximately 120 sales this month. Luckily, we still have another week to reach our goal.

**NOTE**: This tutorial applies to the Power BI service and not to Power BI Designer. 

![](media/powerbi-service-tutorial-radial-gauge-charts/gauge_m.png)  
## When to use a Radial Gauge

Radial Gauges are a great choice to:

-   show progress toward a goal.
-   represent a percentile measure, like a KPI.
-   show the health of a single measure.
-   display information that can be quickly scanned and understood.

## Create a basic Radial Gauge

These instructions use the Retail Analysis Sample. To follow along, [download the sample](http://support.powerbi.com/knowledgebase/articles/514904-download-samples), sign in to powerBI.com and select **Get Data \> Excel Workbook \>  Connect \> Retail Analysis Sample**.**xlsx**.

1.  Start in [Editing View](http://support.powerbi.com/knowledgebase/articles/443094-edit-a-report) and select the **New Stores** measure.  Measures are identified by the calculator icon ![](media/powerbi-service-tutorial-radial-gauge-charts/measureIcon.png).
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/gauge_selectMeasure.png)
    
2.  Convert the chart to a Gauge.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/selectGauge.png)

    By default,  Power BI creates a Gauge chart where the current value is assumed to be halfway between 0 and the target value.  Since I currently have 10 stores, Power BI creates a Gauge chart where the minimum value is 0, the current value is the halfway point, and the maximum value is set to double the current value (20).
    
    ![](media/powerbi-service-tutorial-radial-gauge-charts/gauge_Default.png)
3.  Select the target value. Drag **New Stores Target** to the **Target Value** well. Power BI adds a needle to represent our target value of 14.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/gaugeSetTargetValue.png)
4.  [Add the Gauge chart as a dashboard tile](http://support.powerbi.com/knowledgebase/articles/425669-tiles-in-power-bi). 
5.  [Save the report](http://support.powerbi.com/knowledgebase/articles/444112-save-a-report).

## Add a Maximum Value to a Radial Gauge

In the task above, Power BI used the Value field to automatically set minimum (start) and maximum (end or target).  But you can also manually set the minimum and maximum values.

These instructions use the Financial Sample. 

### Step 1: Open the Financial Sample Excel file.

1.  In the navigation pane, select **Get Data**.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/getdata.png)  
2.  With Excel Workbook highlighted, select the link near the bottom **Download this one**.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/financialSampleDownloadLink.png)
    
3.  Save the "Financial Sample.xlsx" file.

4.  Open the file in Power BI by selecting **Connect** and browsing to the location where you saved the file, and selecting **Connect** again. Financial Sample is added to your workspace navigation pane under **Datasets**.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/Financial-Sample-Dataset.png)  
5.  Select **Financial Sample** to open it in Explore mode.

### Step 2: Create a Gauge to track Gross Sales and Cost of Goods Sold (COGS)  
1.  In the **Fields** pane, select **Gross Sales**.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/GrossSalesValue.png)  
2.  Change the aggregation to **Average**.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/changeToAverage.png)  
3.  Select the Gauge icon ![](media/powerbi-service-tutorial-radial-gauge-charts/gaugeIcon.png) to convert the Column Chart to a Gauge.

4.  Drag **COGS** to the **Target Value** well.

5.  Change the aggregation to **Average**.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/GaugeInProgress.png)

    By default, Power BI creates a Gauge chart where the current value (in this case, Average of Gross Sales) is assumed to be at the halfway point on the gauge. Since the Average Gross Sales is $180,000, the start value (Minimum) is set to 0 and the end value (Maximum) is set to double the current value.
    
	Notice that we've exceeded our target.

### Step 3: Add a maximum value

But what if you want to set your own maximum value?  Let's say that instead of using double the current value as the maximum possible value, you want to set it to the highest Gross Sales number in your dataset?

1.  Drag **Gross Sales** from the **Fields** list to the **Maximum Value** well.
2.  Change the aggregation to **Maximum**.
    
	![](media/powerbi-service-tutorial-radial-gauge-charts/SetMaximum.png)

    The Gauge is redrawn with a new end value, 1.21 million in gross sales.

## See also:

[Add a visualization to a report](https://powerbi.uservoice.com/knowledgebase/articles/441777)  
[Pin a visualization to a dashboard](http://support.powerbi.com/knowledgebase/articles/430323-pin-a-tile-to-a-dashboard-from-a-report)  
[Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029-power-bi-preview-basic-concepts)  
[Try it out -- it's free!](https://powerbi.com/)