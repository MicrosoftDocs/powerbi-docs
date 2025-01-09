---
title: Types of Insights supported by Power BI
description: Learn about Insights in Power BI how they work, what they can do, and why they help interpret your data.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: conceptual
ms.date: 01/09/2025
LocalizationGroup: Dashboards
---
# Types of insights supported by Power BI

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

Ask Power BI to look through your data and find interesting trends and patterns. These trends and patterns are presented as visuals called *Insights*. Insights are available for visuals on dashboards, visuals in reports, and entire report pages.

To learn how to use dashboard Insights, see [View data insights on dashboard tiles with Power BI](end-user-insights.md).

:::image type="content" source="media/end-user-insight-types/power-bi-insight-lines.png" alt-text="Screenshot of a set of Insights with the Insights panel highlighted.":::

## How does Insights work?

Power BI searches different subsets of your semantic model and applies a set of sophisticated algorithms to discover potentially interesting insights. You can run Insights on dashboard tiles, report visuals, and report pages.

## Some terminology

Power BI uses statistical algorithms to uncover Insights. The algorithms are listed and described in the next section of this article. Before we get to the algorithms, here are definitions for some terms that might be unfamiliar.

* *Measure* - A measure is a quantitative (numeric) field that can be used to do calculations. Common calculations are sum, average, and minimum. For example, if our company makes and sells skateboards, our measures might be number of skateboards sold and average profit per year.
  
* *Dimension* - Dimensions are categorical (text) data. A dimension describes a person, object, item, products, place, and time. In a semantic model, dimensions are a way to group *measures* into useful categories. For our skateboard company, some dimensions might include looking at sales (a measure) by model, color, country/region, or marketing campaign.

* *Correlation* - A correlation tells us how the behavior of things relates. If their patterns of increase and decrease are similar, they're positively correlated. If their patterns are opposite, they're negatively correlated. For example, sales of red skateboards increase each time we run a tv marketing campaign.  Sales of the red skateboards and the tv marketing campaign are positively correlated.

* *Time series* - A time series is a way of displaying time as successive data points. Those data points could be increments such as seconds, hours, months, or years.
  
* *Continuous variable* - A continuous variable can be any value between its minimum and maximum limits, otherwise it's a discrete variable. Examples are temperature, weight, age, and time. Continuous variables can include fractions or portions of the value. The total number of blue skateboards sold is a discrete variable since we can't sell half a skateboard.  

## What types of insights can you find?

For reports, Power BI proactively performs analyses for anomalies, trends, and KPIs. For dashboard tiles, Power BI can find 10 types of Insights.

### Category outliers (top/bottom)

Highlights cases where one or two categories have larger values than other categories.  

![Screenshot of a category outlier Insight report window.](./media/end-user-insight-types/pbi-auto-insight-type-category-outliers.png)

### Change points in a time series

Highlights when there are significant changes in trends in a time series of data.

![Screenshot of an change points in time series Insight visual.](./media/end-user-insight-types/pbi-auto-insight-type-changepoint.png)

### Correlation

Detects cases where multiple measures show a similar pattern or trend when plotted against a category or value in the semantic model.

:::image type="content" source="./media/end-user-insight-types/power-bi-auto-insight-type-correlation.png" alt-text="Screenshot of a correlation Insight visual.":::

### Low Variance

Detects cases where data points for a dimension aren't far from the mean, so the *variance* is low. Let's say you have the measure "sales" and a dimension "region." And looking across the region you see that there's little difference between the data points and the mean (of the data points). The insight triggers when the variance of sales across all regions is below a threshold. In other words, when sales are similar across all regions.

![Screenshot of a low variance Insight visual.](./media/end-user-insight-types/power-bi-insights-low-variance.png)

### Majority (Major factors)

Finds cases where most of a total value can be attributed to a single factor when broken down by another dimension.  

![Screenshot of a majority Insight visual.](./media/end-user-insight-types/pbi-auto-insight-type-majority.png)

### Outliers

This insight type uses a clustering model to find outliers not related to time in series data. Outliers detect when there are specific categories with values significantly different than the other categories.

![Screenshot of an outlier Insight Visual.](./media/end-user-insight-types/power-bi-outliers.png)

### Overall trends in time series

Detects upward or downward trends in time series data.

![Screenshot of an overall trend Insight visual.](./media/end-user-insight-types/pbi-auto-insight-type-trend.png)

### Seasonality in time series

Finds periodic patterns in time series data, such as weekly, monthly, or yearly seasonality.

![Screenshot of a seasonality in time Insight visual.](./media/end-user-insight-types/pbi-auto-insight-type-seasonality-new.png)

### Steady share

Highlights cases where there's a parent-child correlation between the share of a child value in relation to the overall value of the parent across a continuous variable. The steady share insight applies to the context of a measure, a dimension, and another date/time dimension. This insight triggers when a particular dimension value, for example "the east region," has a steady percentage of overall sales across that date/time dimension.

The steady share insight is similar to the low variance insight, because they both relate to the lack of variance of a value across time. However, the steady share insight measures the lack of variance of the **percentage of overall** across time, while the low variance insight measures the lack of variance of the absolute measure values across a dimension.

![Screenshot of a steady share Insight visual.](./media/end-user-insight-types/pbi-auto-insight-type-steadyshare.png)

### Time series outliers

For data across a time series, detects when there are specific dates or times with values significantly different than the other date/time values.

![Screenshot of a time series Insight visual.](./media/end-user-insight-types/pbi-auto-insight-type-time-series-outliers-purple.png)

## Related content

* [View data insights on dashboard tiles with Power BI.](end-user-insights.md)

More questions? Ask the [Power BI Community.](https://community.powerbi.com/)