---
title: Overview of visualizations in Power BI
description: Learn about the different types of visualizations available in Power BI and how to choose the right visual for your data.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: overview
ms.date: 01/28/2026
LocalizationGroup: Visualizations
---

# Visualizations overview in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Visualizations, also called visuals, are the building blocks of Power BI reports. They transform the curated data and DAX calculations from your [Power BI semantic model](../connect-data/service-datasets-understand.md) into meaningful insights that help you understand patterns, trends, and relationships in your data. Power BI offers a wide variety of built-in visuals, each designed for specific scenarios and data types.

Visuals in a report interact with each other through cross-filtering and cross-highlighting, creating a fully interactive and dynamic experience. You can also drill through to other pages or even other reports to explore related data in more detail. For advanced scenarios like write-back, you can use [translytical task flows](../create-reports/translytical-task-flow-overview.md) to trigger actions and update data directly from your reports.

This article provides an overview of the visualization categories available in Power BI to help you choose the right visual for your needs.

## Preview visuals

Some Power BI visuals are available in preview, which means they're still being developed and might change before general availability. Preview visuals let you try new features early and provide feedback to help shape the final product.

To use preview visuals in Power BI Desktop, you typically need to enable them in **File** > **Options and settings** > **Options** > **Preview features**. Preview visuals might have limited functionality or known issues that are resolved before general release.

## Charts for comparison and trends

These visuals help you compare values across categories or track changes over time.

### Bar and column charts

Bar and column charts are the standard for comparing specific values across different categories. Use column charts for time-based comparisons and bar charts when category names are long.

For more information, see [Column charts in Power BI](power-bi-visualization-column-charts.md).

### Line charts

Line charts emphasize the overall shape of values over time, making them ideal for showing trends and patterns. They work best with continuous data along the X axis.

For more information, see [Line charts in Power BI](power-bi-line-chart.md).

### Area charts

Area charts are based on line charts with the area between the axis and line filled in. They emphasize the magnitude of change over time and can show cumulative totals when stacked.

For more information, see [Basic area charts in Power BI](power-bi-visualization-basic-area-chart.md).

### Combo charts

Combo charts combine a column chart and a line chart into one visual, allowing you to compare multiple measures with different value ranges. They can have one or two Y axes.

For more information, see [Combo charts in Power BI](power-bi-visualization-combo-chart.md).

### Ribbon charts

Ribbon charts show which category has the highest rank over time, with the highest value always displayed on top for each period. They're effective for visualizing rank changes.

For more information, see [Ribbon charts in Power BI](desktop-ribbon-charts.md).

### Waterfall charts

Waterfall charts show a running total as values are added or subtracted. They're useful for understanding how positive and negative changes affect an initial value, such as tracking contributions to net income.

For more information, see [Waterfall charts in Power BI](power-bi-visualization-waterfall-charts.md).

## Charts for part-to-whole relationships

These visuals help you understand how individual parts contribute to a total.

### Pie and donut charts

Pie and donut charts show the relationship of parts to a whole. Donut charts have a blank center that allows space for a label or icon. Use these charts when you have a small number of categories.

For more information, see [Pie and donut charts in Power BI](power-bi-visualization-pie-donut-chart.md).

### Treemaps

Treemaps display hierarchical data as nested rectangles, with size representing value. They're excellent for showing large amounts of hierarchical data and the proportions between parts and the whole.

For more information, see [Treemaps in Power BI](power-bi-visualization-treemaps.md).

### Funnel charts

Funnel charts visualize sequential processes with stages, where items flow from one stage to the next. They're commonly used for sales pipelines and conversion tracking.

For more information, see [Funnel charts in Power BI](power-bi-visualization-funnel-charts.md).

## Charts for distribution and relationships

These visuals help you understand how data is distributed and identify relationships between variables.

### Scatter, bubble, and dot plot charts

Scatter charts display data points at the intersection of two numerical values, revealing correlations and clusters. Bubble charts add a third dimension through bubble size, while dot plots can use categorical data on the X axis.

For more information, see [Scatter charts in Power BI](power-bi-visualization-scatter.md).

## Tables and matrices

These visuals display detailed data in rows and columns.

### Tables

Tables present related data in a grid of rows and columns. They're ideal when you need to see exact values and make quantitative comparisons across many values for a single category.

For more information, see [Tables in Power BI](power-bi-visualization-tables.md).

### Matrix visuals

Matrix visuals support stepped layouts and make it easier to display data across multiple dimensions. They automatically aggregate data and enable drilling down into hierarchies.

For more information, see [Matrix visuals in Power BI](power-bi-visualization-matrix-visual.md).

## Map visualizations

Map visuals help you display geographic and spatial data. Power BI offers several map types for different scenarios.

For a complete overview of map options, see [Map visualizations in Power BI](power-bi-map-visualizations-overview.md).

## Cards or callouts, KPIs, and gauges

These visuals help you highlight key values and track progress toward goals and key metrics.

### Card visuals

Card visuals display a single fact or data point prominently. The card visual supports both single-card and multi-card layouts, and can include images and detailed reference values within the visual. Use cards when a single number, such as total sales or market share, is the most important thing to track.

For more information, see [Card visuals in Power BI](power-bi-visualization-card.md).

### KPI visuals

Key performance indicator (KPI) visuals communicate progress made toward a measurable goal. They're ideal for measuring progress and distance to a metric.

For more information, see [KPIs in Power BI](power-bi-visualization-kpi.md).

### Gauge charts

Radial gauge charts display a single value measuring progress toward a goal. The needle represents the target value, and shading shows progress. They're great for showing the health of a single measure.

For more information, see [Gauge charts in Power BI](power-bi-visualization-radial-gauge-charts.md).

### Goals visual

The goals visual displays metrics and scorecards that help teams track progress toward business objectives. You can set targets, track current values, and visualize status with color-coded indicators.

For more information, see [Get started with metrics in Power BI](../create-reports/service-goals-create.md).

## AI-powered visuals

These visuals use artificial intelligence to help you explore and understand your data.

### Decomposition tree

Decomposition tree visuals let you visualize data across multiple dimensions. They automatically aggregate data and enable drilling down in any order, with AI helping identify the next dimension to explore.

For more information, see [Decomposition tree visuals in Power BI](power-bi-visualization-decomposition-tree.md).

### Key influencers

Key influencer charts display the major contributors to a selected result or value. They help you understand which factors influence a key metric.

For more information, see [Key influencers in Power BI](power-bi-visualization-influencers.md).

### Smart narrative

Smart narrative visuals add text to reports that point out trends, key takeaways, and context. The text helps users understand the data and identify important findings quickly.

For more information, see [Smart narrative in Power BI](power-bi-visualization-smart-narrative.md).

### Anomaly detection

Anomaly detection automatically finds anomalies in line chart data. It highlights unexpected spikes and dips, helping you identify outliers that need investigation.

For more information, see [Anomaly detection in Power BI](power-bi-visualization-anomaly-detection.md).

## Filtering visuals

Power BI provides multiple ways to filter data in your reports. All visuals can be filtered using the **Filters** pane, which lets you apply filters at the visual, page, or report level. For more direct interaction, slicers provide on-canvas filtering controls.

For more information about the Filters pane, see [Filters pane in Power BI reports](../create-reports/power-bi-report-filter.md).

### Slicers

Slicers come in multiple formats including button, list, dropdown, and date range. They display commonly used filters on the report canvas for easier access.

For more information, see [Slicers in Power BI](power-bi-visualization-slicers.md).

## Other visuals

### Image visual

Image visuals display static or dynamic images in your reports. Dynamic images can change based on data values.

For more information, see [Image visual in Power BI](power-bi-visualization-image-visual.md).

### Text box and shapes

Text boxes let you add titles, descriptions, and other text to your reports. You can also bind text to data fields for dynamic content. Shapes such as rectangles, ovals, lines, and arrows help you highlight areas or create visual structure in your reports.

For more information, see [Add text boxes and shapes to Power BI reports](../create-reports/power-bi-reports-add-text-and-shapes.md).

### Buttons and navigators

Buttons enable interactivity in your reports, allowing users to trigger actions like navigating to other pages, applying bookmarks, or opening URLs. Page navigators and bookmark navigators provide built-in navigation controls for multi-page reports.

For more information, see [Create buttons in Power BI](../create-reports/desktop-buttons.md).

### Paginated report visual

The paginated report visual lets you embed a paginated report within a Power BI report. This visual is useful when you need pixel-perfect formatting, print-ready layouts, or detailed tabular data that spans multiple pages.

For more information, see [Paginated report visual in Power BI](paginated-report-visual.md).

### Q&A visual

> [!IMPORTANT]
> The Q&A visual is scheduled for deprecation in December 2026.

The Q&A visual provides a text box where users can ask questions about data using natural language. Power BI interprets the query and creates an appropriate visualization.

For more information, see [Q&A visual in Power BI](power-bi-visualization-q-and-a.md).

### R and Python visuals

R and Python visuals enable advanced analytics and custom visualizations using these programming languages. They're ideal for forecasting and statistical analysis.

For more information, see [R visuals in Power BI](service-r-visuals.md).

### Power Apps visual

Power Apps visuals let you embed Power Apps into Power BI reports, enabling users to interact with apps within the report context.

For more information, see [Power Apps visual in Power BI](power-bi-visualization-powerapp.md).

## Custom visuals

Beyond built-in visuals, you can download additional visuals from [Microsoft AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) or create your own custom visuals.

For more information, see [Power BI custom visuals](../developer/visuals/power-bi-custom-visuals.md).

## Choosing the right visual

When selecting a visual, consider:

- **Your data type**: Categorical, numerical, time-based, or geographic
- **Your goal**: Compare values, show trends, display relationships, or track progress
- **Your audience**: What level of detail do they need?
- **Available space**: Some visuals work better in smaller or larger areas

For a complete reference of all visualization types, see [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).

## Customize visuals with report themes

Power BI report themes let you apply consistent formatting to all visuals in a report at once. Themes control colors, fonts, backgrounds, and other visual properties, giving your reports a unified look and feel.

You can use built-in themes, customize them to match your organization's branding, or create your own themes from scratch. Custom themes can be exported as JSON files and shared across reports and teams, ensuring consistent styling across your organization's Power BI content.

For more information, see [Use report themes in Power BI Desktop](../create-reports/desktop-report-themes.md).

You can also format individual visuals using the **Format** pane, which provides extensive options for customizing colors, labels, titles, backgrounds, borders, and more. Formatting applied directly to a visual takes precedence over report theme settings, allowing you to override the theme for specific visuals when needed.

For more information, see [Get started formatting visuals](service-getting-started-with-color-formatting-and-axis-properties.md).

## Data-driven colors with conditional formatting

Many visual properties, including colors, can be driven by your data using conditional formatting. You can set colors to change based on field values, rules you define, or color scales that map values to a gradient. This capability lets you highlight important data points, show status indicators, or create heat map effects within your visuals.

Conditional formatting is available for backgrounds, font colors, data bars, icons, and web URLs in tables and matrices, as well as bar colors in charts and many other visual elements.

For more information, see [Apply conditional formatting in tables and matrices](../create-reports/desktop-conditional-table-formatting.md).

## Tooltips

Tooltips provide additional context when users hover over data points in a visual. By default, tooltips display the values for that data point, but you can customize them to show additional fields and measures.

For even richer detail, you can create report page tooltips that display an entire report page when hovering over a data point. Report page tooltips offer a detailed and up-to-date deeper view of each data point, allowing you to show related charts, KPIs, or any other visuals that provide context without leaving the current view.

For more information, see [Create tooltips based on report pages in Power BI](../create-reports/desktop-tooltips.md).

## Visual calculations

Visual calculations let you create DAX calculations directly on a visual, building on top of the semantic model calculations. Unlike model-level measures, visual calculations are stored on the visual itself and operate within the specific context of that visual's rows and columns.

This approach makes it easier to create calculations like running totals, moving averages, percent of total, and ranking without needing to understand complex filter context. Visual calculations automatically take into account the row-specific context of each data point in the visual, making them ideal for fine-grained, visual-specific calculations.

For more information, see [Visual calculations overview](../transform-model/desktop-visual-calculations-overview.md).

## Analytics pane

Many visuals support adding analytics elements through the **Analytics** pane, which helps you highlight important trends and insights. You can add reference lines such as constant lines for X or Y axes, average lines, minimum and maximum lines, median lines, and percentile lines.

For time-series data, you can also add forecasting to predict future values based on historical trends, and enable anomaly detection to automatically identify unexpected spikes or dips in your data. Some visuals also support error bars to show the variability or uncertainty in your measurements.

For more information, see [Use the Analytics pane in Power BI](../transform-model/desktop-analytics-pane.md).

## Small multiples

Small multiples let you split a visual into multiple smaller versions, each showing a subset of the data based on a field you choose. This technique, also known as trellis or lattice charts, makes it easy to compare patterns across categories side by side.

For example, you can take a single sales chart and split it by region, creating a grid of charts where each one shows sales for a different region. This approach helps you spot trends and outliers across categories that might be difficult to see when all the data is combined in one visual.

For more information, see [Create small multiples in Power BI](power-bi-visualization-small-multiples.md).

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Add visuals to a report](power-bi-report-add-visualizations.md)
- [Map visualizations in Power BI](power-bi-map-visualizations-overview.md)
- [Get started formatting visuals](service-getting-started-with-color-formatting-and-axis-properties.md)
