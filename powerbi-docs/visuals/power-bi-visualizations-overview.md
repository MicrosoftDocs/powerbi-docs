---
title: Overview of visualizations in Power BI
description: Learn how Power BI visualizations transform data into interactive charts and graphs. Discover how to add, customize, and use visuals to create insightful reports.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: overview
ms.date: 03/16/2026
LocalizationGroup: Visualizations
---

# Visualizations overview in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI visualizations transform your data into interactive charts, graphs, and maps that reveal patterns and trends at a glance. They are the primary way to communicate data insights, converting curated data and DAX calculations from your semantic model into meaningful visual representations that make relationships immediately clear.

Unlike static charts, Power BI visuals are interactive and dynamic. Users can select, filter, drill down, and explore data across multiple visuals on a page. Each interaction automatically updates related visuals. This dynamic behavior enables self-service exploration and deeper understanding without requiring technical expertise. For advanced scenarios like write-back, you can use [translytical task flows](../create-reports/translytical-task-flow-overview.md) to trigger actions and update data directly from your reports.

This article explains how visualizations work in Power BI and how to use them effectively in your reports.

> [!TIP]
> For a comprehensive catalog of all available visuals with guidance on when to use each one, example scenarios, and best practices, see [Choose the best visual for your data](power-bi-visualization-decision-guide.md).

## How visualizations work

Every visual in Power BI connects to your semantic model through field mappings. When you create a visual, you drag fields from your data model onto specific areas like axes, values, legends, or tooltips. Power BI then aggregates and renders the data according to the visual type you select. For detailed instructions on adding visuals to reports, see [Add visuals to a Power BI report](power-bi-report-add-visualizations.md).

Visuals automatically update when:

- The underlying data refreshes
- You apply filters
- You interact with other visuals on the page
- Slicers or filter pane selections change

This live connection between visuals and data ensures reports always reflect current information and user context.

## Visual selection

Power BI offers a comprehensive set of built-in visual types organized by purpose:

- **[Compare trends with charts](power-bi-visualization-decision-guide.md#compare-trends-with-charts)**: Bar, column, line, area, combo, ribbon, and waterfall charts
- **[Show part-to-whole relationships](power-bi-visualization-decision-guide.md#show-part-to-whole-relationships)**: Pie, donut, treemap, and funnel charts  
- **[Explore distributions and relationships](power-bi-visualization-decision-guide.md#explore-distributions-and-relationships)**: Scatter, bubble, and high-density scatter charts
- **[Display data in tables and matrices](power-bi-visualization-decision-guide.md#display-data-in-tables-and-matrices)**: Tables and matrix visuals for detailed data with drill-down capabilities
- **[Use cards, KPIs, and gauges](power-bi-visualization-decision-guide.md#use-cards-kpis-and-gauges)**: Highlight key metrics and track progress toward goals
- **[Map your data](power-bi-visualization-decision-guide.md#map-your-data)**: Filled maps, Azure Maps, shape maps, and ArcGIS maps
- **[Use AI-powered visuals](power-bi-visualization-decision-guide.md#use-ai-powered-visuals)**: Decomposition tree, key influencers, smart narrative, and anomaly detection
- **[Filter with slicers](power-bi-visualization-decision-guide.md#filter-with-slicers)**: Button, list, input, and date range slicers for on-canvas filtering
- **[Use other visuals](power-bi-visualization-decision-guide.md#use-other-visuals)**: Images, text boxes, buttons, paginated reports, R/Python visuals, and Power Apps

Figuring out what kind of visual best suits your needs depends on:

- **Your data type**: Categorical, numerical, time-based, or geographic
- **Your analysis goal**: Compare values, show trends, reveal relationships, or track progress
- **Your audience**: Executives need high-level summaries, while analysts need detailed data

For detailed guidance on when to use each visual type with example scenarios and best practices, see [Choose the best visual for your data](power-bi-visualization-decision-guide.md).

## Visual interactions

One of the most powerful features of Power BI is how visuals interact with each other on a report page. By default, visuals use **cross-filtering** and **cross-highlighting**:

- **Cross-filtering**: Selecting a data point in one visual filters the data shown in other visuals. For example, clicking a region in a bar chart filters a line chart to show only that region's data.
- **Cross-highlighting**: Instead of filtering completely, this feature dims unrelated data while it highlights the selected data, preserving context.

You can customize these interactions or disable them entirely for specific visuals. For example, you might want a card visual that shows total sales to remain static regardless of what users select elsewhere on the page.

For more information, see [Change how visuals interact in a report](../create-reports/service-reports-visual-interactions.md).

## Drill-down and drill-through

Power BI supports multiple levels of data exploration:

- **Drill down**: Move from higher-level aggregations to more detailed levels within the same visual. For example, drill from year to quarter to month in a column chart.
- **Drill up**: Move back to higher aggregation levels.
- **Drill through**: Right-click a data point and navigate to a different report page with detailed information filtered to that specific context.

These capabilities let report consumers explore data at their own pace without overwhelming the main report view.

For more information, see [Drill mode in a visual](../consumer/end-user-drill.md) and [Set up drill-through in reports](../create-reports/desktop-drillthrough.md).

## Visual filters

You can filter visuals in many ways:

- **Filters pane**: Use the **Filters** pane to apply filters at the visual, page, or report level.
- **Slicers**: Add on-canvas filter controls that users can interact with. Slicers support buttons, lists, dropdowns, and date ranges.
- **Cross-filtering**: Select data in one visual to filter others automatically.

Filters cascade from report level to page level to visual level, with more specific filters overriding broader ones.

For more information, see [Filters pane in Power BI reports](../create-reports/power-bi-report-filter.md) and [Slicers in Power BI](power-bi-visualization-slicers.md).

## Visual customization with themes and formatting

Power BI provides extensive customization options to ensure visuals match your organization's branding and communicate insights clearly:

- **[Report themes](../create-reports/desktop-report-themes.md)**: Apply consistent colors, fonts, and visual styles across all visuals in a report. Use built-in themes or create custom themes with JSON files.
- **[Conditional formatting](power-bi-visualization-conditional-formatting.md)**: Automatically change colors, add icons, or apply data bars based on values. Highlight performance above or below targets dynamically.
- **[Tooltips](../create-reports/desktop-tooltips.md)**: Customize the information shown when users hover over data points. You can even create entire report pages as rich tooltips.
- **Format pane**: Customize titles, labels, backgrounds, borders, gridlines, and hundreds of other visual properties.

Effective formatting enhances clarity without cluttering visuals. Use color purposefully to highlight important insights rather than for decoration.

For detailed guidance, see [Get started formatting visuals](service-getting-started-with-color-formatting-and-axis-properties.md).

## Advanced visual features

Beyond basic charting, Power BI offers advanced capabilities to enhance analysis:

- **[Visual calculations](../transform-model/desktop-visual-calculations-overview.md)**: Create running totals, moving averages, percent of total, and rankings directly within visuals without modifying the semantic model.
- **[Analytics pane](../transform-model/desktop-analytics-pane.md)**: Add reference lines (average, median, min/max), trend lines, forecasting, and error bars to highlight patterns and benchmarks.
- **[Small multiples](power-bi-visualization-small-multiples.md)**: Split a single visual into a grid of smaller versions, one for each category, making it easy to spot patterns and outliers across segments.

These features help you tell richer data stories without creating dozens of separate visuals.

## Custom and preview visuals

Beyond built-in visuals, you can:

- **Download custom visuals** from [Microsoft AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals), including specialized charts, calendars, KPI indicators, and visuals from third-party developers.
- **Create your own custom visuals** by using the Power BI visuals SDK and TypeScript.
- **Use preview visuals** that are still in development. Enable preview features in **File** > **Options and settings** > **Options** > **Preview features**.

Preview visuals might have limited functionality or change before general release. By using preview visuals, you can try new capabilities early and provide feedback.

For more information, see [Power BI custom visuals](../developer/visuals/power-bi-custom-visuals.md).

## Related content

- [Choose the best visual for your data](power-bi-visualization-decision-guide.md) - Comprehensive catalog of all Power BI visuals with guidance on when to use each type
- [Add visuals to a Power BI report](power-bi-report-add-visualizations.md)
- [Change how visuals interact in a report](../create-reports/service-reports-visual-interactions.md)
- [Get started formatting visuals](service-getting-started-with-color-formatting-and-axis-properties.md)
- [Report themes in Power BI Desktop](../create-reports/desktop-report-themes.md)
