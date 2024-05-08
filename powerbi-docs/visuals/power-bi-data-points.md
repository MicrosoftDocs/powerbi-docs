---
title: Apply data point limits and strategies by visual type
description: Power BI strategies used to render visualizations include data reduction, dynamic limits, and data limits for visuals.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'rien'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 03/26/2024
LocalizationGroup: Visualizations
---

# Apply data point limits and strategies by visual type

[!INCLUDE[consumer-appliesto-yyyn](../includes/consumer-appliesto-yyyn.md)]

Visualization rendering in Power BI must be quick and accurate, which requires configuration of underlying algorithms for each visual type. Visuals in Power BI must be flexible enough to handle different sizes of semantic models. Some semantic models have only a handful of data points, while other semantic models have petabytes of data points. This article explains the strategies used by Power BI to render visualizations.

## Data reduction strategies

Each visual employs one or more *data reduction strategies* to handle the potentially large volumes of data being analyzed. Even a simple table employs a strategy to avoid loading the entire semantic model to the client. The reduction strategy varies by visual type. Each visual selects from the supported data reduction strategies as part of generating the data request sent to the server.

Each visual controls the parameters on those strategies to influence the overall amount of data.

## Strategies

For each strategy, there are defaults based on the shape and type of visualized data. To provide the right user experience, you can override defaults in the Power BI Formatting pane.

* **Data Windowing** (Segmentation): Allow users to scroll through the data in a visual by progressively loading fragments of the overall semantic model.
* **TopN**: Show only the first N items.
* **Simple Sample**: Show the first, last, and N evenly distributed items in between.
* **BottomN**: Show only the last N items. Useful for monitoring frequently updated data.
* **High-density sampling**: An improved sampling algorithm that better respects outliers and/or the shape of a curve.
  * **Binned line sampling**: Sample data points based on outliers in bins across an axis.
  * **Overlapping points sampling**: Sample data points based on overlapping values to preserve outliers.

## Statistics

Certain models can provide statistics about the number of values for certain columns. When such information is present, we use that information to provide better balancing across multiple hierarchies if a visual doesn't explicitly override the count of values for a strategy.

For more information, see [What's new in SQL Server Analysis Services](/analysis-services/what-s-new-in-sql-server-analysis-services).

## Dynamic limits

In addition to the previously mentioned strategies, visuals with two hierarchies of grouping columns (axis and legend, or category and series) use one other strategy called *dynamic limits*. Dynamic limits are designed to better balance data points.

Dynamic limits provide a better selection of points for sparse data than static limits. For example, you can configure a visual to select 100 categories and 10 series with a total of 1,000 points. But the actual data has 50 categories and 20 series. At query runtime, dynamic limits select all 20 series to fill up the 1,000 points requested.

Dynamic limits are automatically applied when the server is capable:

* In Power BI Desktop, with On-premises SSAS version 2016 or higher, [using the SuperDax capabilities of the server](/archive/blogs/analysisservices/whats-new-in-microsoft-sql-server-analysis-services-tabular-models-in-sql-server-2016-ctp-2-3).
* In Desktop and Power BI service, when using an imported model, Direct Query, live connect to the service or live connect to AS PaaS.
* In the Power BI service, when connecting through an on-premises gateway to on-premises SSAS version 2016 or higher, [using the SuperDax capabilities of the server](/archive/blogs/analysisservices/whats-new-in-microsoft-sql-server-analysis-services-tabular-models-in-sql-server-2016-ctp-2-3).

## Strategies and data point limits by visual type

Find details for each visual type in the following sections.

### Area chart

For more information about area chart visuals, see [How the new line sampling algorithm works](../create-reports/desktop-high-density-sampling.md#how-the-new-line-sampling-algorithm-works).

### Bar or column chart

* In categorical mode:
  * Categories: Virtualization by using Window of 500 rows at a time
  * Series: Top 60
* In scalar mode (could use dynamic limits):
  * Max points: 10,000
  * Categories: Sample of 500 values
  * Series: Top 20 values

### Card (multirow)

* Values: Virtualization by using Window of 200 rows at a time.

### Combo chart

 A combo chart uses the same strategies as a column chart. Notice that the line in the combo chart doesn't use the high-density algorithm that the line chart uses.

### Power BI visuals

Power BI visuals can get up to 30,000 data points, but it's up to the visual authors to indicate which strategies to use. The default limit is 1,000, but the visual creator can change that up to a maximum of 30,000.

### Doughnut

* Max points: 3,500
* Group: Top 500
* Details: Top 20

### Filled map choropleth

The filled map can use statistics or dynamic limits. Power BI tries to use reduction in the following order: dynamic limits, statistics, and configuration.

* Max points: 3,500
* Categories: Top 500
* Series (when both X and Y are present): Top 20

### Funnel

* Max points: 3,500
* Categories: Top 3,500

### KPI

Trend axis limits:

* Bottom 3,500

### Line chart

For more information about line chart visuals, see [How the new line sampling algorithm works](../create-reports/desktop-high-density-sampling.md#how-the-new-line-sampling-algorithm-works).

### Line chart, high density

For more information, see [High-density line sampling in Power BI](../create-reports/desktop-high-density-sampling.md).

### Map

* Max points: 3,500

Depending on the configuration, a map can have:

* Location: Top 3,500
* Location, Size: Top 3,500
* Location, latitude, and longitude aggregates (+/-Size): Top 3,500
* Latitude, longitude: For more information, see [High-density sampling in Power BI scatter charts](../create-reports/desktop-high-density-scatter-charts.md)
* Latitude, longitude, Size: Top 3,500
* Legend, latitude, longitude: For more information, see [High-density sampling in Power BI scatter charts](../create-reports/desktop-high-density-scatter-charts.md)
* Legend, latitude, longitude, Size: Top 233 legends, Top 15 latitude, and longitude (could use statistics or dynamic limits)
* Location, legend, latitude, and longitude as aggregates (+/-Size): Top 233 locations, Top 15 legends (could use statistics or dynamic limits)

### Maps: Azure Maps

* Latitude, longitude: 30,000
* Location: 30,000

For more information, see [High-density sampling in Power BI scatter charts](../create-reports/desktop-high-density-scatter-charts.md).

### Matrix

* Rows: Virtualization by using Window of 500 rows at a time
* Columns: Top 100 grouping columns
* Values: Multiple values don't count against the data reduction

### PowerApps visuals

PowerApps visuals can get up to 30,000 data points, but it's up to the visual authors to indicate which strategies to use. The default limit is 1,000, but the visual creator can change that up to a maximum of 30,000.

### Radial gauge

No reduction strategy.

### Slicer

* Values: Virtualization by using Window of 200 rows at a time.

### Scatter chart (high density)

For more information, see [High-density sampling in Power BI scatter charts](../create-reports/desktop-high-density-scatter-charts.md).

### Pie

* Max points: 3,500
* Group: Top 500
* Details: Top 20

### R & Python visuals

R & Python visuals are limited to 150,000 rows. If you select more than 150,000 rows, the visual only uses the top 150,000 rows.

### Ribbon chart

* In categorical mode:
  * Categories: Virtualization (data windowing) by using Window of 500 rows at a time
  * Series: Top 60
* In scalar mode (could use dynamic limits):
  * Max points: 10,000
  * Categories: Sample of 500 values
  * Series: Top 20 values

### Shape map (Preview)

The shape map can use statistics or dynamic limits.

* Max points: 1,500
* Categories: Top 500

### Table

* Values: Virtualization (data windowing) by using Window of 500 rows at a time.

### Tree map (could use statistics or dynamic limits)

* Max points: 3,500
* Group: Top 500
* Details: Top 20

### Waterfall chart

* Category bucket (only):
  * Max points: 3,500
  * Category only - top 3,500
* Both category and breakdown are present:
  * Category: Virtualization (data windowing) by using Window of 30 rows at a time
  * Breakdown - Top 200 values

## Related content

* [Visualization types in Power BI](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md)
