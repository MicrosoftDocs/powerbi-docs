---
title: Visualization types in Power BI
description: Visualization types in Power BI
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.search.form: Visualization types in Power BI
ms.topic: conceptual
ms.date: 10/27/2023
ms.custom: retail-analysis-sample-PBIX
LocalizationGroup: Visualizations
---

# Visualization types in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article lists visualizations available in Power BI. We'll be adding new visualizations, stay tuned!

And check out the [Microsoft AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals), where you'll find a growing list of [Power BI visuals](../developer/visuals/power-bi-custom-visuals.md) you can download and use in your own dashboards and reports. Feeling creative? [Learn how to create and add your own visuals to this community site](../developer/visuals/office-store.md).  

## Visualizations in Power BI

All of these visualizations can be added to Power BI reports, specified in Q&A, and pinned to dashboards.

## Area charts: Basic (Layered) and Stacked

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/basic-area-map-small.png" alt-text="Screenshot of an Area chart.":::

The basic area chart is based on the line chart with the area between the axis and line filled in. Area charts emphasize the magnitude of change over time, and can be used to draw attention to the total value across a trend. For example, data that represents profit over time can be plotted in an area chart to emphasize the total profit.
On the other hand, stacked area charts display the cumulative total of multiple data series stacked on top of each other, showing how each series contributes to the total.

For more information, see [Basic Area chart](power-bi-visualization-basic-area-chart.md).

## Bar and column charts

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-bar-chart.png" alt-text="Screenshot of a Bar chart.":::

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-column-chart.png" alt-text="Screenshot of a Column chart.":::

Bar charts are the standard for looking at a specific value across different categories.

## Cards

### Multi row

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/multi-row-card.png" alt-text="Screenshot of a Multi row card.":::

Multi row cards display one or more data points, one per row.

### Single number

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-card-chart.png" alt-text="Screenshot of a Single number card.":::

Single number cards display a single fact, a single data point. Sometimes a single number is the most important thing you want to track in your Power BI dashboard or report, such as total sales, market share year over year, or total opportunities.  

For more information, see [Create a Card (big number tile)](power-bi-visualization-card.md).

## Combo charts

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/combo-small.png" alt-text="Screenshot of a Combo chart.":::

A combo chart combines a column chart and a line chart. Combining the two charts into one lets you make a quicker comparison of the data. Combo charts can have one or two Y axes, so be sure to look closely. 

Combo charts are a great choice:

- When you have a line chart and a column chart with the same X axis.
- To compare multiple measures with different value ranges.
- To illustrate the correlation between two measures in one visual.
- To check whether one measure meets the target which is defined by another measure.
- To conserve canvas space.

For more information, see [Combo charts in Power BI](power-bi-visualization-combo-chart.md).

## Decomposition tree

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-decomposition.png" alt-text="Screenshot of a Decomposition tree." lightbox="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-decomposition-expanded.png":::

The decomposition tree visual lets you visualize data across multiple dimensions. It automatically aggregates data and enables drilling down into your dimensions in any order. It is also an artificial intelligence (AI) visualization, so you can ask it to find the next dimension to drill down into based on certain criteria. This makes it a valuable tool for ad hoc exploration and conducting root cause analysis.

## Doughnut charts

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/donut-small.png" alt-text="Screenshot of a Doughnut chart.":::

Doughnut charts are similar to pie charts.  They show the relationship of parts to a whole. The only difference is that the center is blank and allows space for a label or icon.

For more information, see [Doughnut charts in Power BI](power-bi-visualization-doughnut-charts.md).

## Funnel charts

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-funnel-chart.png" alt-text="Screenshot of a Funnel chart.":::

Funnels help visualize a process that has stages, and items flow sequentially from one stage to the next.  One example is a sales process that starts with leads and ends with purchase fulfillment.

For example, a sales funnel that tracks customers through stages: Lead > Qualified Lead > Prospect > Contract > Close. At a glance, the shape of the funnel conveys the health of the process you're tracking.
Each funnel stage represents a percentage of the total. So, in most cases, a funnel chart is shaped like a funnel -- with the first stage being the largest, and each subsequent stage smaller than its predecessor. A pear-shaped funnel is also useful -- it can identify a problem in the process. But typically, the first stage, the "intake" stage, is the largest.

For more information, see [Funnel Charts in Power BI](power-bi-visualization-funnel-charts.md).

## Gauge charts

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/gauge-m.png" alt-text="Screenshot of a Radial gauge chart.":::

A radial gauge chart has a circular arc and displays a single value that measures progress toward a goal. The goal, or target value, is represented by the line (needle). Progress toward that goal is represented by the shading. And the value that represents that progress is shown in bold inside the arc. All possible values are spread evenly along the arc, from the minimum (left-most value) to the maximum (right-most value).

In the example above, we are a car retailer, tracking our Sales team's average sales per month. Our goal is 200,000 and represented by the location of the needle. The minimum possible average sales is 100,000 and we've set the maximum as 250,000. The blue shading shows that we're currently averaging approximately $180,000 this month. Luckily, we still have another week to reach our goal.

Radial gauges are a great choice to:

- Show progress toward a goal.
- Represent a percentile measure, like a KPI.
- Show the health of a single measure.
- Display information that can be quickly scanned and understood.

For more information, see [Gauge Charts in Power BI](power-bi-visualization-radial-gauge-charts.md).

## Key influencers chart

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-influencer.png" alt-text="Screenshot of a Key influencer chart." lightbox="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-influencer-expanded.png":::

A key influencer chart displays the major contributors to a selected result or value.

Key influencers are a great choice to help you understand the factors that influence a key metric. For example, *what influences customers to place a second order* or *why were sales so high last June*.

For more information, see [Key influencer charts in Power BI](power-bi-visualization-influencers.md)

## KPIs

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-kpi.png" alt-text="Screenshot of a KPI chart.":::

A Key Performance Indicator (KPI) is a visual cue that communicates the amount of progress made toward a measurable goal. 

KPIs are a great choice:

- To measure progress (what am I ahead or behind on?).
- To measure distance to a metric (how far ahead or behind am I?).

For more information, see [KPIs in Power BI](power-bi-visualization-kpi.md).

## Line charts

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-line-chart.png" alt-text="Screenshot of a Line chart.":::

Line charts emphasize the overall shape of an entire series of values, usually over time.

## Maps

### Basic map

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-map.png" alt-text="Screenshot of a Basic map.":::

Use a basic map to associate both categorical and quantitative information with spatial locations.

For more information, see [Tips and tricks for map visuals](power-bi-map-tips-and-tricks.md).

### ArcGIS map

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-esri-map-theme2.png" alt-text="Screenshot of a ArcGIS map.":::

The combination of ArcGIS maps and Power BI takes mapping beyond the presentation of points on a map to a whole new level. The available options for base maps, location types, themes, symbol styles, and reference layers creates gorgeous informative map visuals. The combination of authoritative data layers (such as census data) on a map with spatial analysis conveys a deeper understanding of the data in your visual.

For more information, see [ArcGIS maps in Power BI](power-bi-visualizations-arcgis.md).

### Azure map

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/azure-maps-visual-hero.png" alt-text="Screenshot of Azure Maps visual for Power BI.":::

>[!TIP]
>Used to associate both categorical and quantitative information with spatial locations.

For more information, see [Azure Maps visual for Power BI](/azure/azure-maps/power-bi-visual-getting-started?context=/power-bi/create-reports/context/context).

### Filled map (Choropleth)

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-filled-map.png" alt-text="Screenshot of a Filled map.":::

A filled map uses shading or tinting or patterns to display how a value differs in proportion across a geography or region. Quickly display these relative differences with shading that ranges from light (less-frequent/lower) to dark (more-frequent/more).

>[!TIP]
>The more intense the color, the larger the value.

For more information, see [Filled Maps in Power BI](power-bi-visualization-filled-maps-choropleths.md).

### Shape map

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-shape-map2.png" alt-text="Screenshot of a Shape map of Texas.":::

Shape maps compare regions on a map using color. A shape map can't show precise geographical locations of data points on a map. Instead, its main purpose is to show relative comparisons of regions on a map by coloring them differently.

For more information, see [Shape Maps in Power BI](desktop-shape-map.md).

## Matrix

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/matrix.png" alt-text="Screenshot of matrix visual." lightbox="media/power-bi-visualization-types-for-reports-and-q-and-a/matrix-expanded.png":::

The matrix visual is a type of table visual (see [Tables](#tables) in this article) that supports a stepped layout. A table supports two dimensions, but a matrix makes it easier to display data meaningfully across multiple dimensions. Often, report designers include matrixes in reports and dashboards to allow users to select one or more element (rows, columns, cells) in the matrix to cross-highlight other visuals on a report page.

>[!TIP]
> The matrix automatically aggregates the data and enables drilling down into the data.

For more information, see [Matrix visuals in Power BI](desktop-matrix-visual.md).

## Pie charts

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-pie-chart.png" alt-text="Screenshot of a Pie chart.":::

Pie charts show the relationship of parts to a whole.

## Power Apps visual

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-powerapps-visual.png" alt-text="Screenshot of a Power Apps visual.":::

Report designers can create a Power App and embed it into a Power BI report as a visual. Consumers can interact with that visual within the Power BI report.

For more information, see [Add a Power Apps visual to your report](power-bi-visualization-powerapp.md).

## Q&A visual

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-q-and-a.png" alt-text="Screenshot of a Q&A visual.":::

The Q&A visual provides users with a text box to query data in Power BI reports. Users can use natural language to query data, and the Q&A visual interprets the query and provides an appropriate visualization.

For example, if a user asks a question like "What were the product sales in 2019?" the Q&A visual will query the relevant data and create an appropriate visualization to display the results. This visualization can be in many different formats, such as a chart or a table.

>[!TIP]
>Similar to the [Q&A experience on dashboards](../create-reports/power-bi-tutorial-q-and-a.md), the Q&A visual lets you ask questions about your data using natural language.

For more information, see [Q&A visuals in Power BI](power-bi-visualization-q-and-a.md).

## R script visuals

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-r-visual.png" alt-text="Screenshot of an R visual." lightbox="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-r-visual-expanded.png":::

>[!TIP]
>Visuals created with R scripts, commonly called *R visuals*, can present advanced data shaping and analytics such as forecasting, using the rich analytics and visualization power of R. R visuals can be created in Power BI Desktop and published to the Power BI service.

For more information, see [R visuals in Power BI](service-r-visuals.md).

## Ribbon chart

:::image type="content" source="../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-ribbon.png" alt-text="Screenshot of a Ribbon chart.":::

Ribbon charts show which data category has the highest rank (largest value). Ribbon charts are effective at showing rank change, with the highest range (value) always displayed on top for each time period.

For more information, see [Ribbon charts in Power BI](desktop-ribbon-charts.md).

## Scatter

### Scatter, bubble, and dot plot chart

A scatter chart always has two value axes to show one set of numerical data along a horizontal axis and another set of numerical values along a vertical axis. The chart displays points at the intersection of an x and y numerical value, combining these values into single data points. These data points might be distributed evenly or unevenly across the horizontal axis, depending on the data.

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-scatter-chart.png" alt-text="Screenshot of a scatter chart, with points at the intersection of the x and y axis.":::

A bubble chart replaces data points with bubbles, with the bubble size representing an additional dimension of the data.

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-bubble-chart.png" alt-text="Screenshot of a bubble chart, with bubble size representing an additional dimension of data.":::

Both scatter and bubble charts can also have a play axis, which can show changes over time.

A dot plot chart is similar to a bubble chart and scatter chart except that it can plot numerical or categorical data along the X axis. This example happens to use squares instead of circles and plots sales along the X axis.

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-dot-plot-squares.png" alt-text="Screenshot of a Dot Plot chart.":::

For more information, see [Scatter charts in Power BI](power-bi-visualization-scatter.md).

### Scatter-high density

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/density-scatter.png" alt-text="Screenshot of a high density Scatter chart." lightbox="media/power-bi-visualization-types-for-reports-and-q-and-a/density-scatter-expanded.png":::

By definition, high-density data is sampled to create visuals reasonably quickly that are responsive to interactivity. High-density sampling uses an algorithm that eliminates overlapping points, and ensures that all points in the data set are represented in the visual. It doesn't just plot a representative sample of the data.  

This ensures the best combination of responsiveness, representation, and clear preservation of important points in the overall data set.

For more information, see [High Density Scatter charts in Power BI](../create-reports/desktop-high-density-scatter-charts.md).

## Slicers

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-slicer.png" alt-text="Screenshot of a slicer.":::

A slicer is a standalone chart that can be used to filter the other visuals on the page. Slicers come in many different formats (category, range, date, etc.) and can be formatted to allow selection of only one, many, or all of the available values. 

Slicers are a great choice to:

- Display commonly used or important filters on the report canvas for easier access.
- Make it easier to see the current filtered state without having to open a drop-down list.
- Filter by columns that are unneeded and hidden in the data tables.
- Create more focused reports by putting slicers next to important visuals.

For more information, see [Slicers in Power BI](power-bi-visualization-slicers.md).

## Smart narrative

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-smart-narrative.png" alt-text="Screenshot of a smart narrative.":::

The Smart narrative adds text to reports to point out trends, key takeaways, and add explanations and context. The text helps users to understand the data and identify the important findings quickly.

For more information, see [Create smart narrative summaries](power-bi-visualization-smart-narrative.md).

## Standalone images

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-image.png" alt-text="Screenshot of a Standalone image visual.":::

A standalone image is a graphic that has been added to a report or dashboard.

For more information, see [Add an image widget to a dashboard](../create-reports/service-dashboard-add-widget.md).

## Tables

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/table-type.png" alt-text="Screenshot of a Table visual.":::

A table is a grid that contains related data in a logical series of rows and columns. It might also contain headers and a row for totals. Tables work well with quantitative comparisons where you are looking at many values for a single category. For example, this table displays five different measures for Category.

Tables are a great choice:

- To see and compare detailed data and exact values (instead of visual representations).
- To display data in a tabular format.
- To display numerical data by categories.

For more information, see [Working with tables in Power BI](power-bi-visualization-tables.md).

## Treemaps

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/visual-treemap.png" alt-text="Screenshot of a Treemap.":::

Treemaps are charts of colored rectangles, with size representing value.  They can be hierarchical, with rectangles nested within the main rectangles. The space inside each rectangle is allocated based on the value being measured. And the rectangles are arranged in size from top left (largest) to bottom right (smallest).

Treemaps are a great choice:

- To display large amounts of hierarchical data.
- When a bar chart can't effectively handle the large number of values.
- To show the proportions between each part and the whole.
- To show the pattern of the distribution of the measure across each level of categories in the hierarchy.
- To show attributes using size and color coding.
- To spot patterns, outliers, most-important contributors, and exceptions.

For more information, see [Treemaps in Power BI](power-bi-visualization-treemaps.md).

## Waterfall charts

:::image type="content" source="media/power-bi-visualization-types-for-reports-and-q-and-a/waterfall-small.png" alt-text="Screenshot of a Waterfall chart.":::

A waterfall chart shows a running total as values are added or subtracted. It's useful for understanding how an initial value (for example, net income) is affected by a series of positive and negative changes.

The columns are color coded so you can quickly tell increases and decreases. The initial and the final value columns often start on the horizontal axis, while the intermediate values are floating columns. Because of this "look", waterfall charts are also called bridge charts.

Waterfall charts are a great choice:

- When you have changes for the measure across time or across different categories.
- To audit the major changes contributing to the total value.
- To plot your company's annual profit by showing various sources of revenue and arrive at the total profit (or loss).
- To illustrate the beginning and the ending headcount for your company in a year.
- To visualize how much money you make and spend each month, and the running balance for your account.

For more information, see [Waterfall charts in Power BI](power-bi-visualization-waterfall-charts.md).

## Related content

- [Visualizations in Power BI reports](power-bi-report-visualizations.md)
- [Power BI Visuals Reference from sqlbi.com](https://www.sqlbi.com/ref/power-bi-visuals-reference/), guidance for picking the right visual for your data
