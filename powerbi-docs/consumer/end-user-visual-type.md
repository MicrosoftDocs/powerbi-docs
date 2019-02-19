---
title: Visualization types in Power BI for consumers
description: Visualization types in Power BI service
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 02/12/2019
ms.author: mihart

LocalizationGroup: Consumer
---
# Visualization types in Power BI
You'll find visualizations in reports, dashboards, apps, and Q&A. Some of these visualization types are packaged with Power BI, and some are *custom visuals*. Custom visuals are created outside of Power BI and in a way that allows *report designers* to add them to Power BI reports, dashboards, and apps. 

This article is an overview of the visualizations that are packaged with Power BI.  These are the visualizations that you'll encounter most often. 

> [!NOTE]
> To learn about custom visuals, search for them in the **Power BI visuals** section of [Microsoft AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals). For each visual, you'll find a description, creator information, and either screenshots or a video. 

## List of visualizations available in Power BI
All of these visualizations can be found in Power BI apps, dashboards, reports, and [specified in Q&A](#qna). To learn how to interact with visualizations, see [Interact with visualizations in reports, dashboards, and apps](end-user-visualizations.md)

### Area charts: Basic (Layered) and Stacked
![area chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/basicareamapsmall.png)

The basic area chart is based on the line chart with the area between the axis and line filled in. Area charts emphasize the magnitude of change over time, and can be used to draw attention to the total value across a trend. For example, data that represents profit over time can be plotted in an area chart to emphasize the total profit.

### Bar and column charts
![column chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_bar.png)

 ![bar chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_col.png)

Bar charts are the standard for looking at a specific value across different categories.

### Cards: Single number
![single number card](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_card.png)

Single number cards display a single fact, a single data point. Sometimes a single number is the most important thing you want to track in your Power BI dashboard or report, such as total sales, market share year over year, or total opportunities.  

### Cards: Multi row
![multi row card](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/multi-row-card.png)

Multi row cards display one or more data points, one per row.


### Combo charts
![combo chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/combosmall.png)

A combo chart combines a column chart and a line chart. Combining the two charts into one lets you make a quicker comparison of the data. Combo charts can have one or two Y axes, so be sure to look closely. 

Combo charts are a great choice:
- when you have a line chart and a column chart with the same X axis.
- to compare multiple measures with different value ranges
- to illustrate the correlation between two measures in one visualization
- to check whether one measure meet the target which is defined by another measure
- to conserve canvas space

### Doughnut charts
![doughnut chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/donutsmall.png)

Doughnut charts are similar to pie charts.  They show the relationship of parts to a whole. The only difference is that the center is blank and allows space for a label or icon.

### Funnel charts
![funnel chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_funnel.png)

Funnels help visualize a process that has stages, and items flow sequentially from one stage to the next.  One example is a sales process that starts with leads and ends with purchase fulfillment.

For example, a sales funnel that tracks customers through stages: Lead > Qualified Lead > Prospect > Contract > Close. At a glance, the shape of the funnel conveys the health of the process you're tracking.
Each funnel stage represents a percentage of the total. So, in most cases, a funnel chart is shaped like a funnel -- with the first stage being the largest, and each subsequent stage smaller than its predecessor. A pear-shaped funnel is also useful -- it can identify a problem in the process. But typically, the first stage, the "intake" stage, is the largest.

Funnel charts are a great choice:
- when the data is sequential and moves through at least 4 stages.
- when the number of "items" in the first stage is expected to be greater than the number in the final stage.
- to calculate potential (revenue/sales/deals/etc.) by stages.
- to calculate and track conversion and retention rates.
- to reveal bottlenecks in a linear process.
- to track a shopping cart workflow.
- to track the progress and success of click-through advertising/marketing campaigns.

### Gauge charts
![gauge chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/gauge_m.png)

A radial gauge chart has a circular arc and displays a single value that measures progress toward a goal/KPI. The goal, or target value, is represented by the line (needle). Progress toward that goal is represented by the shading. And the value that represents that progress is shown in bold inside the arc. All possible values are spread evenly along the arc, from the minimum (left-most value) to the maximum (right-most value).

In the example above, we are a car retailer, tracking our Sales team's average sales per month. Our goal is 140 and represented by the black needle. The minimum possible average sales is 0 and we've set the maximum as 200. The blue shading shows that we're currently averaging approximately 120 sales this month. Luckily, we still have another week to reach our goal.

Radial gauges are a great choice to:
- show progress toward a goal
- represent a percentile measure, like a KPI
- show the health of a single measure
- display information that can be quickly scanned and understood

 ### Key influencers chart
![key influencer](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-influencer.png)

A key influencer chart displays the major contributors to a selected result or value.

Key influencers are a great choice to help you understand the factors that influence a key metric. For example, *what influences customers to place a second order *or* why were sales so high last June*. 

### KPIs
![kpi](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-kpi.png)

A Key Performance Indicator (KPI) is a visual cue that communicates the amount of progress made toward a measurable goal. 

KPIs are a great choice:
- to measure progress (what am I ahead or behind on?)
- to measure distance to a goal (how far ahead or behind am I?)

### Line charts
![line chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_line.png)

Line charts emphasize the overall shape of an entire series of values, usually over time.

### Maps: Basic maps
![basic map](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi-nancy_viz_map.png)

Use a basic map to associate both categorical and quantitative information with spatial locations.

### Maps: ArcGIS maps
![ArcGis map](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-esri-map-theme2.png)

The combination of ArcGIS maps and Power BI takes mapping beyond the presentation of points on a map to a whole new level. The available options for base maps, location types, themes, symbol styles, and reference layers creates gorgeous informative map visualizations. The combination of authoritative data layers (such as census data) on a map with spatial analysis conveys a deeper understanding of the data in your visualization.

### Maps: Filled maps (Choropleth)
![filled map](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_filledmap.png)

A filled map uses shading or tinting or patterns to display how a value differs in proportion across a geography or region. Quickly display these relative differences with shading that ranges from light (less-frequent/lower) to dark (more-frequent/more).

### Maps: Shape maps
![shape map](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-shape-map2.png)

Shape maps compare regions on a map using color. Unlike the M\map visual, shape maps can't show precise geographical locations of data points on a map. Instead, its main purpose is to show relative comparisons of regions on a map by coloring them differently.

### Matrix
![matrix](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/matrix.png)

The matrix visual is a type of table visual (see "Table" below) that supports a stepped layout. Often, report designers include matrixes in reports and dashboards to allow users to select one or more element (rows, columns, cells) in the matrix to cross-highlight other visuals on a report page.  

### Pie charts
![pie chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_pie.png)

Pie charts show the relationship of parts to a whole. 

### Ribbon chart
![ribbon chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/power-bi-ribbon.png)

Ribbon charts show which data category has the highest rank (largest value). Ribbon charts are effective at showing rank change, with the highest range (value) always displayed on top for each time period.

### Scatter, Bubble, and Dot Plot charts


A scatter chart always has two value axes to show one set of numerical data along a horizontal axis and another set of numerical values along a vertical axis. The chart displays points at the intersection of an x and y numerical value, combining these values into single data points. These data points may be distributed evenly or unevenly across the horizontal axis, depending on the data.

![bubble chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_bubble.png)

A bubble chart replaces data points with bubbles, with the bubble size representing an additional dimension of the data.

A dot plot chart is similar to a bubble chart and scatter chart except that it can plot numerical or categorical data along the X axis.

### Scatter-high density
![high density scatter](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/density-scatter.png)

By definition, high-density data is sampled to create visualizations reasonably quickly that are responsive to interactivity. High-density sampling uses an algorithm that eliminates overlapping points, and ensures that all points in the data set are represented in the visual. It doesn't just plot a representative sample of the data.  

This ensures the best combination of responsiveness, representation, and clear preservation of important points in the overall data set.

### Slicers
![slicer](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_slicer.png)

A slicer is a standalone chart that can be used to filter the other visuals on the page. Slicers come in many different formats (category, range, date, etc.) and can be formatted to allow selection of only one, many, or all of the available values. 

Slicers are a great choice to:
- display commonly-used or important filters on the report canvas for easier access
- make it easier to see the current filtered state without having to open a drop-down list
- filter by columns that are unneeded and hidden in the data tables
- create more focused reports by putting slicers next to important visuals

### Standalone images
![standalone image](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_image.png)

A standalone image is a graphic that has been added to a report or dashboard. 


### Tables
![table chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/tabletype.png)

A table is a grid that contains related data in a logical series of rows and columns. It may also contain headers and a row for totals. Tables work well with quantitative comparisons where you are looking at many values for a single category. For example, this table displays five different measures for Category.

Tables are a great choice:
- to see and compare detailed data and exact values (instead of visual representations)
- to display data in a tabular format
- to display numerical data by categories

### Treemaps
![treemap chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/pbi_nancy_viz_tree.png)

Treemaps are charts of colored rectangles, with size representing value.  They can be hierarchical, with rectangles nested within the main rectangles. The space inside each rectangle is allocated based on the value being measured. And the rectangles are arranged in size from top left (largest) to bottom right (smallest).

Treemaps are a great choice:
- to display large amounts of hierarchical data
- when a bar chart can't effectively handle the large number of values
- to show the proportions between each part and the whole
- to show the pattern of the distribution of the measure across each level of categories in the hierarchy
- to show attributes using size and color coding
- to spot patterns, outliers, most-important contributors, and exceptions

### Waterfall charts
![waterfall chart](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/waterfallsmall.png)

A waterfall chart shows a running total as values are added or subtracted. It's useful for understanding how an initial value (for example, net income) is affected by a series of positive and negative changes.

The columns are color coded so you can quickly tell increases and decreases. The initial and the final value columns often start on the horizontal axis, while the intermediate values are floating columns. Because of this "look", waterfall charts are also called bridge charts.

Waterfall charts are a great choice:
- when you have changes for the measure across time series or different categories
- to audit the major changes contributing to the total value
- to plot your company's annual profit by showing various sources of revenue and arrive at the total profit (or loss).
- to illustrate the beginning and the ending headcount for your company in a year
- to visualize how much money you make and spend each month, and the running balance for your account.

## Tell Q&A which visualization to use
When typing natural language queries with Power BI Q&A, you can specify the visualization type in your query.  For example:

"***sales by state as a treemap***"

![q&a session](../visuals/media/power-bi-visualization-types-for-reports-and-q-and-a/qatreemap.png)

## Next steps
[Interact with visualizations in reports, dashboards, and apps](end-user-visualizations.md)    
[The right visual reference from sqlbi.com](http://www.sqlbi.com/wp-content/uploads/videotrainings/dashboarddesign/visuals-reference-may2017-A3.pdf)