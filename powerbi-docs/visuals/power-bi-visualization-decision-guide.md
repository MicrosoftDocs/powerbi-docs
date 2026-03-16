---
title: Choose the best visual for your data in Power BI
description: Learn how to select the most effective Power BI visualization for your data type, analysis goal, and audience needs with practical guidance and examples.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 03/16/2026
LocalizationGroup: Visualizations
ai-usage: ai-assisted
---

# Choose the best visual for your data in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Selecting the right visualization is essential for communicating insights effectively. The wrong visual can obscure patterns, confuse your audience, or misrepresent your data. The right visual makes complex information immediately clear and actionable.

This article is your comprehensive guide to Power BI visualizations. It catalogs all built-in visual types, explains when to use each one, provides example scenarios, and shares best practices for creating effective reports. For an overview of how visualizations work in Power BI, see [Visualizations overview](power-bi-visualizations-overview.md).

## Plan your visual

### Start with your goal

Before selecting a visual, clarify what you want to communicate. Different visuals work best for different tasks:

| Category | When to use |
|----------|-------------|
| [Compare trends with charts](#compare-trends-with-charts) | Show how values differ across categories or segments, and reveal patterns and changes over time. |
| [Show part-to-whole relationships](#show-part-to-whole-relationships) | Show how components contribute to a total. |
| [Explore distributions and relationships](#explore-distributions-and-relationships) | Understand how data is distributed or identify relationships between variables. |
| [Display data in tables and matrices](#display-data-in-tables-and-matrices) | Show exact numbers, multiple measures, or enable detailed record drill-down. |
| [Use cards, KPIs, and gauges](#use-cards-kpis-and-gauges) | Highlight a single important value or track progress toward a goal. |
| [Map your data](#map-your-data) | Present location-based data with geographic or spatial patterns. |
| [Use AI-powered visuals](#use-ai-powered-visuals) | Identify patterns, anomalies, or influencers with AI assistance. |
| [Filter with slicers](#filter-with-slicers) | Provide on-canvas filtering controls for interactive data exploration. |
| [Use other visuals](#use-other-visuals) | Use specialized functionality beyond standard data visualization. |

### Consider your audience

Different audiences have different needs and levels of familiarity with data:

- **Executives**: Prefer high-level summaries with key metrics. Use cards, KPIs, and simple charts.
- **Analysts**: Need detailed data and the ability to explore. Use tables, matrices, and interactive visuals with drill-through.
- **Operational teams**: Focus on current status and trends. Use line charts, bar charts, and gauges.
- **External stakeholders**: Might need more explanation. Use clear labels, titles, and consider adding smart narratives.

## Choose your visual type

### Compare trends with charts

**When to use**: You need to compare values across different categories, products, regions, or segments, or show changes, patterns, and trends over time.

**Best visuals**:

- **[Bar and column charts](power-bi-visualization-column-charts.md)**: Use horizontal bars when category names are long or when you have many categories. Use vertical columns for time periods or shorter names. Column charts work well for both categorical comparisons and time-based data when you want to emphasize individual period values.
- **[Line charts](power-bi-line-chart.md)**: Emphasize the overall shape and pattern of change over time. Ideal for continuous time series data.
- **[Area charts](power-bi-visualization-basic-area-chart.md)**: Show magnitude of change over time. Stacked area charts display multiple series contributing to a total.
- **[Combo charts](power-bi-visualization-combo-chart.md)**: Combine column and line charts to compare multiple measures with different scales, like revenue (millions) and units sold (thousands). Useful for both categorical comparisons and time trends.
- **[Ribbon charts](desktop-ribbon-charts.md)**: Display rank changes over time, showing which categories lead in each period.
- **[Waterfall charts](power-bi-visualization-waterfall-charts.md)**: Show how positive and negative values contribute to a running total over time or across categories.

**Example scenarios**:

- Sales by product category
- Customer count by region
- Budget vs. actual spending by department
- Monthly revenue growth
- Daily website traffic
- Quarterly sales performance
- Year-over-year comparisons
- Profit and loss statement showing contributions

### Show part-to-whole relationships

**When to use**: You need to show how individual parts make up a total.

**Best visuals**:

- **[Pie and donut charts](power-bi-visualization-pie-donut-chart.md)**: Best with fewer than eight categories. Use when the precise comparison between slices isn't critical, but the part-to-whole relationship is important.
- **[Treemaps](power-bi-visualization-treemaps.md)**: Display hierarchical data as nested rectangles. Excellent for showing proportions when you have many categories or need to show hierarchy.
- **[Funnel charts](power-bi-visualization-funnel-charts.md)**: Visualize sequential stages with progressively decreasing values. Commonly used for conversion tracking and pipeline analysis.
- **[100% stacked column or bar charts](power-bi-visualization-column-charts.md)**: Compare proportions across multiple groups. Each bar represents 100% divided among components.

**Avoid**: Pie and donut charts when you need precise comparison. People find it difficult to compare angles and areas accurately.

**Example scenarios**:

- Market share by competitor
- Budget allocation across departments
- Sales composition by product line
- Storage space by file type
- Sales pipeline stages
- Website conversion funnel

### Explore distributions and relationships

**When to use**: You need to understand how data is distributed or identify relationships between variables.

**Best visuals**:

- **[Scatter, bubble, and dot plot charts](power-bi-visualization-scatter.md)**: Show relationships between two numerical variables. Look for correlations, clusters, and outliers. Bubble charts add a third dimension through size.
- **[High-density scatter charts](../create-reports/desktop-high-density-scatter-charts.md)**: Handle large datasets efficiently by aggregating overlapping data points.

**Example scenarios**:

- Price vs. sales volume
- Customer satisfaction vs. purchase frequency
- Product cost vs. profit margin
- Distribution of customer ages
- Analyzing large datasets with thousands of data points

### Display data in tables and matrices

**When to use**: Your audience needs to see exact numbers, multiple measures, or drill into detailed records.

**Best visuals**:

- **[Tables](power-bi-visualization-tables.md)**: Display detailed data in rows and columns. Use when exact values are more important than visual patterns.
- **[Matrix visuals](power-bi-visualization-matrix-visual.md)**: Show data across multiple dimensions with hierarchies. Automatically aggregates and supports drill-down.

**Example scenarios**:

- Product catalog with multiple attributes
- Financial statements with subtotals
- Employee roster with demographics
- Transaction details

### Use cards, KPIs, and gauges

**When to use**: You need to highlight a single important value or track progress toward a goal. For team-based goal tracking and scorecards, see [Goals in Power BI](../create-reports/service-goals-introduction.md).

**Best visuals**:

- **[Card visuals](power-bi-visualization-card.md)**: Display a single important number prominently. Use for key metrics that don't need context.
- **[KPI visuals](power-bi-visualization-kpi.md)**: Show current value, target, and status. Ideal for tracking performance against goals.
- **[Gauge charts](power-bi-visualization-radial-gauge-charts.md)**: Display a single value's progress toward a goal using a radial gauge.

**Example scenarios**:

- Total revenue or profit
- Customer satisfaction score
- Sales quota attainment
- Project completion percentage

### Map your data

**When to use**: You have location-based data like countries/regions, states, cities, or coordinates.

**Best visuals**:

- **[Filled maps](power-bi-visualization-filled-maps-choropleths.md)**: Show data values across geographic regions using color intensity.
- **[Azure Maps](power-bi-map-visualizations-overview.md)**: Modern mapping with bubble, heat map, bar chart, and pie chart layers for rich geographic visualizations.
- **[Shape maps](desktop-shape-map.md)**: Use custom geographic boundaries like sales territories or custom regions.
- **[ArcGIS maps](power-bi-visualizations-arcgis.md)**: Advanced mapping with geocoding, demographics, and spatial analysis capabilities.

**Example scenarios**:

- Sales by country/region or state
- Store locations with performance metrics
- Population density by region
- Delivery routes and territories
- Custom sales territories

### Use AI-powered visuals

**When to use**: You're exploring data and need help identifying patterns, anomalies, or influencers.

**Best visuals**:

- **[Decomposition tree](power-bi-visualization-decomposition-tree.md)**: Explore data across multiple dimensions. AI suggests the next best dimension to drill into.
- **[Key influencers](power-bi-visualization-influencers.md)**: Understand which factors most influence a selected metric.
- **[Anomaly detection](power-bi-visualization-anomaly-detection.md)**: Automatically identify unusual spikes or dips in time series data.
- **[Smart narrative](power-bi-visualization-smart-narrative.md)**: Generate text summaries that explain trends and key takeaways.

**Example scenarios**:

- Understanding what drives customer churn
- Identifying factors that influence sales performance
- Detecting unusual patterns in website traffic
- Exploring multi-dimensional data without predefined paths

### Filter with slicers

**When to use**: You need to provide on-canvas filtering controls for report viewers to explore data interactively.

**Best visuals**:

- **[Button slicer](power-bi-visualization-button-slicer.md)**: Presents filter options as clickable buttons. Ideal for a small number of options.
- **[List slicer](power-bi-visualization-list-slicer.md)**: Traditional dropdown or list format. Works well for many filter options.
- **[Input slicer](power-bi-visualization-input-slicer.md)**: Allows users to type values or ranges directly. Best for numeric or date filtering.
- **[Date range slicer](desktop-slicer-filter-date-range.md)**: Specialized for filtering by date periods with calendar picker or slider.

**Example scenarios**:

- Filter by product category or region
- Select date ranges for time-based analysis
- Filter by price ranges or numeric thresholds
- Enable users to explore data by different dimensions

For an overview of all slicer options, see [Slicers in Power BI](power-bi-visualization-slicers.md).

### Use other visuals

**When to use**: You need specialized functionality beyond standard data visualization.

**Best visuals**:

- **[Image visual](power-bi-visualization-image-visual.md)**: Display static or dynamic images in reports. Images can change based on data values.
- **[Text boxes and shapes](../create-reports/power-bi-reports-add-text-and-shapes.md)**: Add titles, descriptions, annotations, or visual structure to reports.
- **[Buttons and navigators](../create-reports/desktop-buttons.md)**: Create interactive navigation between report pages or trigger actions like bookmarks.
- **[Paginated report visual](paginated-report-visual.md)**: Embed pixel-perfect paginated reports within Power BI reports for print-ready layouts.
- **[Q&A visual](power-bi-visualization-q-and-a.md)**: Provides a text box where users can ask questions about data using natural language. Power BI interprets the query and creates an appropriate visualization.

  > [!IMPORTANT]
  > The Q&A visual is scheduled for deprecation in December 2026.

- **[R visuals](service-r-visuals.md)**: Create custom visualizations using R programming for advanced statistical analysis.
- **[Python visuals](../create-reports/desktop-r-visuals.md)**: Use Python libraries for specialized visualizations and machine learning outputs.
- **[Power Apps visual](power-bi-visualization-powerapp.md)**: Embed interactive Power Apps directly in reports for data entry or complex workflows.

**Example scenarios**:

- Display company logos or product images
- Add explanatory text or report instructions
- Create navigation menus for multi-page reports
- Include detailed tabular reports with page breaks
- Ask natural language questions about your data
- Show statistical models or forecasts using R or Python
- Enable data write-back or approval workflows with Power Apps

## Avoid these common visualization mistakes

- **Using 3D charts**: 3D effects distort perception and make accurate comparison difficult. Stick to 2D visuals for data accuracy.
- **Too many pie slices**: Pie charts with more than eight slices become difficult to interpret. Use bar charts or treemaps instead.
- **Inconsistent scales**: When you display multiple charts for comparison, use the same scale and axis ranges. Inconsistent scales mislead viewers.
- **Overusing multiple colors**: Too many colors create visual clutter. Use color purposefully to highlight important data or group related items.
- **Mixing large and small values**: If you combine measures with vastly different scales (millions versus thousands) on the same axis, the smaller values become invisible. Use combo charts with dual axes or separate visuals.
- **Unclear time periods**: Be consistent with time periods across visuals. Don't mix last month data on one chart with year-to-date data on another chart without clear labels.

## Follow these best practices for effective visuals

- **Use appropriate chart types**:
  - **Bar charts** work better than pie charts for comparing values. People compare length more accurately than they compare angles or areas.
  - **Line charts** are ideal for continuous data over time. Use column charts when you want to emphasize individual period values.
  - **Scatter charts** reveal correlations and outliers that tables can't show.
- **Simplify and focus**:
  - Remove unnecessary elements like excessive gridlines, borders, or labels.
  - Keep titles clear and descriptive.
  - Use tooltips for additional detail instead of cluttering the visual.
  - Limit the number of visuals per page to avoid overwhelming viewers.
- **Leverage formatting and themes**:
  - **[Report themes](../create-reports/desktop-report-themes.md)**: Apply consistent colors, fonts, and backgrounds across all visuals in a report at once. Use built-in themes or create custom themes that match your organization's branding. Export themes as JSON files to share across reports and teams. Override theme settings for individual visuals when needed by using the Format pane.
  - **[Conditional formatting](power-bi-visualization-conditional-formatting.md)**: Use data-driven colors to highlight important values automatically. Apply color scales that map values to gradients for heat map effects. Add data bars and icons to tables and matrices for quick visual comparison. Set rules to change colors based on thresholds (for example, red for below target, green for above). Apply conditional formatting to backgrounds, fonts, bars, and web URLs.
  - **[Number formatting](../create-reports/desktop-custom-format-strings.md)**: Format numbers appropriately (for example, "3.4M" instead of "3,400,000"). Use consistent decimal places across related visuals. Consider your audience's locale and currency preferences.
- **[Create tooltips](../create-reports/desktop-tooltips.md)**:
  - **Basic tooltips**: Customize tooltips to show extra fields beyond what's displayed in the visual. Include context like percentages, comparisons, or related measures. Keep tooltip content concise and relevant.
  - **Report page tooltips**: Report page tooltips are powerful for providing rich context. For example, hovering over a sales figure could show a mini dashboard with trend lines, top products, and regional breakdown. Create entire report pages that appear when you hover over data points. Show detailed breakdowns, trends, or KPIs without leaving the current view. Use consistent sizing and design for a professional appearance. Filter the tooltip page to the hovered context automatically.
- **Enable interaction**:
  - Configure cross-filtering and cross-highlighting to let visuals interact.
  - Add drill-through pages for detailed analysis.
  - Use slicers for user-controlled filtering.
  - Create bookmarks to guide viewers through key insights.

## Enhance your reports with advanced features

Once you master basic visuals, consider the following advanced features to enhance your reports.

- **[Visual calculations](../transform-model/desktop-visual-calculations-overview.md)**: Visual calculations are simpler than model measures for visual-specific logic because they automatically work within the visual's row and column context. Visual calculations create DAX calculations directly on a visual without modifying the semantic model:
  - **Running totals**: Show cumulative values across rows in your visual.
  - **Moving averages**: Smooth out fluctuations to reveal trends.
  - **Percent of total**: Display each value as a percentage of the whole.
  - **Ranking**: Show position relative to other values.
  - **Period comparisons**: Calculate differences from previous periods.
- **[Analytics pane](../transform-model/desktop-analytics-pane.md)**: The Analytics pane is ideal for presentations where you need to emphasize specific benchmarks or projections. Add analytics elements to highlight trends and insights:
  - **Reference lines**: Show averages, medians, min/max, or custom constant values.
  - **Forecasting**: Predict future values based on historical trends in time-series data.
  - **Trend lines**: Add linear, polynomial, or other regression lines to scatter charts.
  - **Error bars**: Display variability or uncertainty in measurements.
- **[Small multiples](power-bi-visualization-small-multiples.md)**: Small multiples work well in presentations and dashboards where you need to show "the same story" across different segments. Split a single visual into multiple smaller versions to compare patterns:
  - **Use case**: Compare the same metric across categories (for example, sales trends for each region).
  - **Benefit**: Spot outliers and patterns that are hidden when all data is combined.
  - **Layout**: Arrange in grids with consistent sizing for easy comparison.
- **Test with real users**: The best visual is the one that makes your insight immediately clear to your intended audience. After creating your visuals:
  - Show them to a colleague unfamiliar with the data.
  - Ask what they see first and what conclusions they draw.
  - Verify their interpretation matches your intent.
  - Refine based on feedback.

## Related content

- [Visualizations overview](power-bi-visualizations-overview.md) - Learn how visualizations work, interact, and can be customized in Power BI.
- [Add visuals to a report](power-bi-report-add-visualizations.md)
- [Tips for designing a great dashboard](../create-reports/service-dashboards-design-tips.md)
- [Get started with formatting visuals](service-getting-started-with-color-formatting-and-axis-properties.md)
- [Visual calculations overview](../transform-model/desktop-visual-calculations-overview.md)
- [Use report themes](../create-reports/desktop-report-themes.md)
- [Conditional formatting](power-bi-visualization-conditional-formatting.md)
