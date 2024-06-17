---
title: Examples of Power BI visuals
description: This article gives examples of Power BI visuals that can be found in GitHub, including slicers, more than 20 types of charts, WebGL, and R visuals and scripts.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 10/13/2023
#customer intent: As a developer, I want to learn about various Power BI visuals available on GitHub so that I can use them in my projects.
---

# Examples of Power BI visuals

This article describes some of the Power BI visuals you can download, use, and modify from GitHub. These sample visuals illustrate how to handle common situations when developing with Power BI.

## Slicers

A slicer narrows the portion of data shown in other visualizations in a report. Slicers are one of several ways to filter data in Power BI.

| <img src="media/samples/chiclet-slicer.png" alt="Screenshot shows Chiclet Slicer." width="200">  | <img src="media/samples/timeline-slicer.png" alt="Screenshot shows Timeline slicer." width="200"> |
| ------------- | ------------- |
| [Chiclet Slicer](https://github.com/Microsoft/powerbi-visuals-chicletslicer/)  </br>Display image or text buttons that act as an in-canvas filter on other visuals | [Timeline slicer](https://github.com/Microsoft/powerbi-visuals-timeline/) </br>Graphical date range selector that filters by date |
|<img src="media/samples/sample-slicer.png" alt="Screenshot shows Slicer sample." width="200">|
|[Slicer sample](https://github.com/Microsoft/powerbi-visuals-sampleslicer/) </br>Demonstrates the use of the Advanced Filtering API|

## Charts

Get inspired with our gallery of Power BI visuals, including bar charts, pie charts, Word Cloud, and others.

| <img src="media/samples/aster-plot.png" alt="Screenshot shows Aster Plot." width="200">  | <img src="media/samples/bullet-chart.png" alt="Screenshot shows Bullet chart." width="200"> | 
| ------------- | ------------- |
| [Aster Plot](https://github.com/Microsoft/powerbi-visuals-asterplot/)  </br>A twist on a standard donut chart that uses a second value to drive sweep angle | [Bullet chart ](https://github.com/Microsoft/powerbi-visuals-bulletchart/) </br>A bar chart with extra visual elements that provide context useful for tracking metrics | 
|<img src="media/samples/Chord.png" alt="Screenshot shows Chord." width="200">| <img src="media/samples/dot-plot.png" alt="Screenshot shows Dot plot." width="200">|
|[Chord](https://github.com/Microsoft/powerbi-visuals-chord/) </br>A graphical method that displays the relationships between data in a matrix | [Dot plot](https://github.com/Microsoft/powerbi-visuals-dotplot/) </br>Shows the distribution of frequencies in a great looking way| 
| <img src="media/samples/dual-kpi.png" alt="Screenshot shows Dual K P I." width="200">| <img src="media/samples/enhanced-scatter.png" alt="Screenshot shows Enhanced Scatter." width="200"> |
| [Dual KPI](https://github.com/Microsoft/powerbi-visuals-dualkpi/) </br>Efficiently visualizes two measures over time, showing their trend on a joint timeline | [Enhanced Scatter](https://github.com/Microsoft/powerbi-visuals-enhancedscatter/) </br>Improvements on the existing scatter chart|
| <img src="media/samples/forcegraph.png" alt="Screenshot shows Force Graph." width="200">| <img src="media/samples/gantt.png" alt="Screenshot shows Gantt." width="200">|
| [Force Graph](https://github.com/Microsoft/powerbi-visuals-forcegraph/) </br>Force layout diagram with curved path, which is useful to show connections between entities | [Gantt](https://github.com/Microsoft/powerbi-visuals-gantt/) </br>A bar chart that illustrates a project timeline or schedule with resources |
|<img src="media/samples/table-heatmap.png" alt="Screenshot shows Table Heatmap." width="200">| <img src="media/samples/histogram-chart.png" alt="Screenshot shows Histogram chart." width="200"> |
| [Table Heatmap](https://github.com/Microsoft/powerbi-visuals-heatmap/) </br>Compare data easily and intuitively using colors in a table | [Histogram chart](https://github.com/Microsoft/powerbi-visuals-histogram/) </br>Visualizes the distribution of data over a continuous interval or certain time period |
| <img src="media/samples/linedot-chart.png" alt="Screenshot shows LineDot chart." width="200"> | <img src="media/samples/mekko-chart.png" alt="Screenshot shows Mekko chart." width="200">|
| [LineDot chart](https://github.com/Microsoft/powerbi-visuals-linedotchart/) </br>An animated line chart with animated dots that engage an audience with data | [Mekko chart](https://github.com/Microsoft/powerbi-visuals-mekkochart/) </br>A mix of 100% stacked column chart and 100% stacked bar chart combined into one view|
| <img src="media/samples/multikpi.png" alt="Screenshot shows Multi K P I." width="200"> | <img src="media/samples/powerkpi.png" alt="Screenshot shows Power K P I." width="200"> |
| [Multi KPI](https://github.com/microsoft/PowerBI-visuals-MultiKPI/) </br> A powerful Multi KPI visualization with a key KPI along with multiple sparklines of supporting data | [Power KPI](https://github.com/microsoft/PowerBI-visuals-PowerKPI/) </br>A powerful KPI Indicator with multi-line chart and labels for current date, value, and variances |
| <img src="media/samples/powerkpi-matrix.png" alt="Screenshot shows Power K P I Matrix." width="200"> | <img src="media/samples/pulse-chart.png" alt="Screenshot shows Pulse chart." width="200">|
| [Power KPI Matrix](https://github.com/microsoft/PowerBI-visuals-PowerKPIMatrix/) </br>Monitor balanced scorecards and unlimited number of metrics and KPIs in a compact, easy to read list| [Pulse chart](https://github.com/Microsoft/powerbi-visuals-pulsechart/) </br>This line chart annotated with key events is perfect for telling stories with data|
| <img src="media/samples/radar-chart.png" alt="Screenshot shows Radar chart." width="200"> | <img src="media/samples/sankey-chart.png" alt="Screenshot shows Sankey chart." width="200"> |
 [Radar chart](https://github.com/Microsoft/powerbi-visuals-radarchart/) </br>Presents multiple measures plotted over a categorical axis, which is useful to compare attributes | [Sankey chart](https://github.com/Microsoft/powerbi-visuals-sankey/) </br>Flow diagram where the width of the series is proportional to the quantity of the flow |
| <img src="media/samples/stream-graph.png" alt="Screenshot shows Stream graph." width="200"> | <img src="media/samples/sunburst.png" alt="Screenshot shows Sunburst chart." width="200">
| [Stream graph](https://github.com/Microsoft/powerbi-visuals-streamgraph/) </br>A stacked area chart with smooth interpolation, which is often used to display values over time | [Sunburst chart](https://github.com/Microsoft/powerbi-visuals-sunburst/) </br>Multilevel donut chart for visualizing hierarchical data|
| <img src="media/samples/tornado.png" alt="Screenshot shows Tornado chart." width="200">| <img src="media/samples/word-cloud.png" alt="Screenshot shows Word Cloud." width="200">
| [Tornado chart](https://github.com/Microsoft/powerbi-visuals-tornado/) </br>Compare the relative importance of variables between two groups | [Word Cloud](https://github.com/Microsoft/powerbi-visuals-wordcloud/) </br>Create a fun visual from frequent text in your data|

## WebGL

WebGL lets web content use an API based on OpenGL ES 2.0 to do 2D and 3D rendering in an HTML canvas.

| <img src="media/samples/globe-map.png" alt="Screenshot shows Globe Map." width="250">|
| ------------- |
| [Globe Map](https://github.com/Microsoft/powerbi-visuals-globemap/) </br>Plot locations on an interactive 3D map

## R visuals

These examples demonstrate how to harness the analytic and visual power of R visuals and R scripts.

| <img src="media/samples/association-rules.png" alt="Screenshot shows Association rules." width="200">| <img src="media/samples/clustering.png" alt="Screenshot shows Clustering." width="200">|
|------------- |------------- | 
| [Association rules](https://github.com/Microsoft/powerbi-visuals-assorules/) </br>Uncover relationships between seemingly unrelated data using if-then statements | [Clustering](https://github.com/Microsoft/powerbi-visuals-clustering-kmeans/) </br>Find similarity groups in your data using k-means algorithm |
|<img src="media/samples/clustering-with-outliers.png" alt="Screenshot shows Clustering with outliers." width="200"> | <img src="media/samples/correlation-plot.png" alt="Screenshot shows Correlation plot." width="200"> |
| [Clustering with outliers](https://github.com/microsoft/PowerBI-visuals-dbscan/) </br>Find similarity groups and outliers in your data| [Correlation plot](https://github.com/Microsoft/powerbi-visuals-corrplot/) </br>Highlight the most correlated variables in a data table|
| <img src="media/samples/decision-tree-chart.png" alt="Screenshot shows Decision tree chart." width="200"> | <img src="media/samples/forecasting-tbats.png" alt="Screenshot shows Forecasting T B A T S." width="200"> |
| [Decision tree chart](https://github.com/Microsoft/powerbi-visuals-decision-tree/) </br>Schematic tree-shaped diagram for determining statistical probability using recursive partitioning | [Forecasting TBATS](https://github.com/Microsoft/powerbi-visuals-forcasting-tbats/) </br>Time-series forecasting for series that have multiple seasonalities using the TBATS model |
| <img src="media/samples/forecasting-with-ARIMA.png" alt="Screenshot shows Forecasting with ARIMA." width="200"> | <img src="media/samples/funnel-plot.png" alt="Screenshot shows Funnel plot." width="200"> |
| [Forecasting with ARIMA](https://github.com/Microsoft/powerbi-visuals-forcastingarima/) </br>Predict future values based on historical data using Autoregressive Integrated Moving Avg (ARIMA) | [Funnel plot](https://github.com/Microsoft/powerbi-visuals-funnel/) </br>Find outliers in your data using a funnel plot |
| <img src="media/samples/outliers-detection.png" alt="Screenshot shows Outliers detection." width="200"> | <img src="media/samples/spline-chart.png" alt="Screenshot shows Spline chart." width="200"> |
| [Outliers detection](https://github.com/Microsoft/powerbi-visuals-outliers-det/) </br>Find outliers in your data using the most appropriate method and plot | [Spline chart](https://github.com/Microsoft/powerbi-visuals-spline/) </br>Visualize and understand noisy data |
| <img src="media/samples/time-series-decomposition-chart.png" alt="Screenshot shows Time Series decomposition chart." width="200"> | <img src="media/samples/time-series-forecasting-chart.png" alt="Screenshot shows Time series forecasting chart." width="200">|
|[Time series decomposition chart](https://github.com/Microsoft/powerbi-visuals-timeseriesdecomposition/) </br>Understand the time series components using "Seasonal and Trend decomposition using Loess" | [Time series forecasting chart](https://github.com/Microsoft/powerbi-visuals-forcasting-exp/) </br>Using exponential smoothing model to predict future values based on previously observed values |

## Related content

* [Import a Power BI visual](./import-visual.md)
* [Develop your own Power BI custom visual](./develop-circle-card.md)
