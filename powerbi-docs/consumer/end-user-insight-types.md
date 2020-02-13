---
title: Types of Insights supported by Power BI
description: Quick Insights and View insights with Power BI.
author: mihart
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 01/15/2020
ms.author: mihart

LocalizationGroup: Dashboards
---
# Types of insights supported by Power BI

You can ask Power BI to look through your data and find interesting trends and patterns. These trends and patterns are presented in the form of visuals that are called *Insights*. 

To learn how to use Insights, see [Power BI Insights](end-user-insights.md)

![a set of Insights](media/end-user-insight-types/power-bi-insight.png)

## How does Insights work?
Power BI quickly searches different subsets of your dataset. As it searches, Power BI applies a set of sophisticated algorithms to discover potentially interesting insights. Power BI *consumers* can run Insights on dashboard tiles.

## Some terminology
Power BI uses statistical algorithms to uncover  Insights. The algorithms are listed and described in the next section of this article. Before we get to the algorithms, here are definitions for some terms that may be unfamiliar. 

* **Measure** - a measure is a quantitative (numeric) field that can be used to do calculations. Common calculations are sum, average, and minimum. For example, if our company makes and sells skateboards, our measures might be number of skateboards sold and average profit per year.  
* **Dimension** - dimensions are categorical (text) data. A dimension describes a person, object, item, products, place, and time. In a a dataset, dimensions are a way to group *measures* into useful categories. For our skateboard company, some dimensions might include looking at sales (a measure) by model, color, country, or marketing campaign.   
* **Correlation** - a correlation tells us how the behavior of things are related.  If their patterns of increase and decrease are similar, then they are positively correlated. And if their patterns are opposite, then they are negatively correlated. For example, if sales of our red skateboard increase each time we run a tv marketing campaign, then sales of the red skateboard and the tv campaign are positively correlated.
* **Time series** - a time series is a way of displaying time as successive data points. Those data points could be increments such as seconds, hours, months, or years.  
* **Continuous variable** - a continuous variable can be any value between its minimum and maximum limits, otherwise it is a discrete variable. Examples are temperature, weight, age, and time. Continuous variables can include fractions or portions of the value. The total number of blue skateboards sold is a discrete variable since we can't sell half a skateboard.  

## What types of insights can you find?
These are the algorithms that Power BI uses. 

### Category outliers (top/bottom)
Highlights cases where one or two categories have much larger values than other categories.  

![Category outliers example](./media/end-user-insight-types/pbi-auto-insight-types-category-outliers.png)

### Change points in a time series
Highlights when there are significant changes in trends in a time series of data.

![Change points in time series example](./media/end-user-insight-types/pbi-auto-insight-types-changepoint.png)

### Correlation
Detects cases where multiple measures show a similar pattern or trend when plotted against a category or value in the dataset.

![Correlation example](./media/end-user-insight-types/pbi-auto-insight-types-correlation.png)

### Low Variance
Detects cases where data points aren't far from the mean.

![Low Variance example](./media/end-user-insight-types/power-bi-low-variance.png)

### Majority (Major factors)
Finds cases where a majority of a total value can be attributed to a single factor when broken down by another dimension.  

![Major factors example](./media/end-user-insight-types/pbi-auto-insight-types-majority.png)

### Overall trends in time series
Detects upward or downward trends in time series data.

![Overall trends in time series example](./media/end-user-insight-types/pbi-auto-insight-types-trend.png)

### Seasonality in time series
Finds periodic patterns in time series data, such as weekly, monthly, or yearly seasonality.

![Seasonality example](./media/end-user-insight-types/pbi-auto-insight-types-seasonality-new.png)

### Steady share
Highlights cases where there is a parent-child correlation between the share of a child value in relation to the overall value of the parent across a continuous variable.

![Steady share example](./media/end-user-insight-types/pbi-auto-insight-types-steadyshare.png)

### Time series outliers
For data across a time series, detects when there are specific dates or times with values significantly different than the other date/time values.

![Time series outliers example](./media/end-user-insight-types/pbi-auto-insight-types-time-series-outliers.png)

## Next steps
[Power BI insights](end-user-insights.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)

