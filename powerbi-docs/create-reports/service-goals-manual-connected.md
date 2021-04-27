---
title: Create manual or connected goals in Power BI
description: Goals can be either manual or connected.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/22/2021
---
# Create manual or connected goals in Power BI

Goals in Power BI let customers curate their metrics and track them against key business objectives. When choosing values for your goals, you have a choice of: 

- Manually entering the current and target values.
- Connecting either the current or target value to data in an existing Power BI report.
- Connecting both values to data in an existing Power BI report.

The difference between the manual and connected values is straightforward. For manual values, each time the current or target value changes, you have to update it or check in the latest value. For connected values, the current or target values change whenever the underlying data is updated.

## Set values manually 

1. Create a goal or edit an existing goal in a scorecard.

1. In the **Current** and/or **Target** fields, enter a value.

    You can the format manually entered values using the floating toolbox.

    image

1. Select **Save**. Power BI uses this value as the starting point for the goal. 

    image

    Power BI automatically represents values in numeric notation. For example, *2044* is represented as *2 K*. 

## Connect current or target values to data

1. Create a goal or edit an existing goal in a scorecard.

1. In the **Current** and/or **Target** fields, select **Connect to data**.

1. In the dialog, select the report with the data that you want to track.

    image

    This list contains all the reports that you have access to, across all workspaces, in Power BI.  

1. In the report that you selected, navigate to the visual that contains the data you want to track. 
1. Select the data point or visual. Power BI displays the measure card, summarizing all the filters applied to the selection.

    image

1. Select **Connect**.  

### Choose measures for connected goals 

The **Connect to data** experience makes it easy for scorecard authors to automate goals. You can select and calculate measures at the following levels: 

- Visual
- Legend
- Data point
- Axis value

To break this down further, there are two main types of cases for connecting to data in goals and subgoals: 

- Categorical data
- Time-series data 

#### Categorical data 

Categorical data refers to cases where you are connecting a goal or subgoal to data other than time-series data. For example, connecting to the total sales of the **Outdoor** product category:

image: Chart, pie chart

Or connecting to the total number of results in the **Family** customer segment: 

image: Chart, bar chart

In these cases, depending on what you select, Power BI calculates the measures as follows: 

- **Visual** – measure is calculated at the aggregate level.
- **Legend** – measure is filtered to the selected legend.
- **Data point** – measure is filtered to the selected data point.  
- **Axis value** – measure is filtered to the category selected in the axis.

#### Time-series data

The time series refers to cases where you have a Date/Time field in the axis. In these cases, Power BI calculates the measures as follows: 

- **Visual** – measure is calculated at the last data point in time series and history is pulled in.
- **Legend** – measure is calculated at the last data point in time series and history is pulled in.
- **Data point** – measure is calculated at the last data point in time series and history is pulled in.
- **Axis value** – measure is calculated at the last data point in time series and history is pulled in.

## Next steps

- [Get started with goals in Power BI](service-goals-intro.md)
- [Create scorecards and goals in Power BI](service-goals-create.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
