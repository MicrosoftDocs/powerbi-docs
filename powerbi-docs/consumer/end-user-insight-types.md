---
title: Types of Insights supported by Power BI
description: Quick Insights and View insights with Power BI.
author: mihart
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 10/31/2019
ms.author: mihart

LocalizationGroup: Dashboards
---
# Types of insights supported by Power BI

The Power BI service can automatically look for insights in your dashboards or reports.

## How does Insights work?
Power BI quickly searches different subsets of your dataset. As it searches, Power BI applies a set of sophisticated algorithms to discover potentially interesting insights. Power BI scans as much of a dataset as possible in an allotted amount of time.

You can run insights against a dataset or dashboard tile.   

## What types of insights can we find?
These are some of the algorithms we use:

## Category outliers (top/bottom)
Highlights cases where, for a measure in the model, one or two members of a dimension have much larger values than other members of the dimension.  

![Category outliers example](./media/end-user-insight-types/pbi-auto-insight-types-category-outliers.png)

## Change points in a time series
Highlights when there are significant changes in trends in a time series of data.

![Change points in time series example](./media/end-user-insight-types/pbi-auto-insight-types-changepoint.png)

## Correlation
Detects cases where multiple measures show a correlation between each other when plotted against a dimension in the dataset.

![Correlation example](./media/end-user-insight-types/pbi-auto-insight-types-correlation.png)

## Low Variance
Detects cases where data points aren't far from the mean.

![Low Variance example](./media/end-user-insight-types/power-bi-low-variance.png)

## Majority (Major factors)
Finds cases where a majority of a total value can be attributed to a single factor when broken down by another dimension.  

![Major factors example](./media/end-user-insight-types/pbi-auto-insight-types-majority.png)

## Overall trends in time series
Detects upward or downward trends in time series data.

![Overall trends in time series example](./media/end-user-insight-types/pbi-auto-insight-types-trend.png)

## Seasonality in time series
Finds periodic patterns in time series data, such as weekly, monthly, or yearly seasonality.

![Seasonality example](./media/end-user-insight-types/pbi-auto-insight-types-seasonality-new.png)

## Steady share
Highlights cases where there is a parent-child correlation between the share of a child value in relation to the overall value of the parent across a continuous variable.

![Steady share example](./media/end-user-insight-types/pbi-auto-insight-types-steadyshare.png)

## Time series outliers
For data across a time series, detects when there are specific dates or times with values significantly different than the other date/time values.

![Time series outliers example](./media/end-user-insight-types/pbi-auto-insight-types-time-series-outliers.png)

## Next steps
[Power BI insights](end-user-insights.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)

