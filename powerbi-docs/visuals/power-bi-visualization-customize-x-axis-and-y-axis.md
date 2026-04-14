---
title: Customize X-Axis and Y-Axis Properties
description: Learn how to customize X-axis and Y-axis properties in Power BI visuals, including labels, titles, gridlines, colors, ranges, intervals, and dual-axis configurations for enhanced data visualization.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 04/13/2026
ai-usage: ai-assisted
LocalizationGroup: Visualizations
---

# Customize x-axis and y-axis properties

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you learn many different ways to customize the X-axis and Y-axis of your visuals. Not all visuals have axes. Pie charts, for example, don't have axes. And customization options vary from visual to visual. There are too many options to cover in a single article, so let's take a look at some of the most-used customizations and get comfortable using the visual **Format** pane in the Power BI report canvas.

## Value axis vs. category axis

Most chart types have two axes: one for values (numeric data) and one for categories (text labels or dates). The axis that displays values vs. categories depends on the chart type:

| Chart type | X-axis | Y-axis |
|------------|--------|--------|
| Column, line, area, combo, ribbon, waterfall | Categories | Values |
| Bar | Values | Categories |
| Scatter (with numeric X) | Values | Values |
| Scatter (with categorical X) | Categories | Values |

Some formatting options, like **Range** settings, apply only to value axes. When this article refers to "the value axis," use the table above to identify whether that's the X-axis or Y-axis for your chart type.

## Sample data

To follow along with the examples in this article, create a calculated table with sample data in a blank Power BI Desktop report.

1. Open Power BI Desktop and create a new blank report.
1. Select **Modeling** > **New table**.
1. Paste the following DAX expression:

   ```dax
   Monthly Sales =
   VAR _Year = YEAR(TODAY())
   VAR _Data =
   {
       (DATE(_Year, 1, 1), 52000, 48000),
       (DATE(_Year, 2, 1), 47000, 51000),
       (DATE(_Year, 3, 1), 63000, 58000),
       (DATE(_Year, 4, 1), 55000, 52000),
       (DATE(_Year, 5, 1), 71000, 65000),
       (DATE(_Year, 6, 1), 68000, 62000),
       (DATE(_Year, 7, 1), 74000, 70000),
       (DATE(_Year, 8, 1), 69000, 73000),
       (DATE(_Year, 9, 1), 61000, 59000),
       (DATE(_Year, 10, 1), 78000, 72000)
   }
   RETURN
   SELECTCOLUMNS(
       _Data,
       "Month", [Value1],
       "This Year", [Value2],
       "Last Year", [Value3]
   )
   ```

1. Press **Enter** to create the table.

## Create a visualization

1. From the **Visualizations** pane, select the stacked column chart icon.
1. From the **Data** pane, drag **Month** to the **X-axis** field well.
1. Drag **This Year** and **Last Year** to the **Y-axis** field well.

:::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/clustered-column-chart-axis-examples.png" alt-text="Screenshot of a clustered column chart showing Month on the X-axis and This Year and Last Year values on the Y-axis.":::

Now you can customize your axes. Power BI provides many options for formatting your visualization.

## Customize axis labels

Axis labels display the values or categories along each axis. You can customize their appearance in the **Format visual** pane.

1. Select **Format** (the paint brush icon) in the **Visualizations** pane.
1. Expand the axis section (**X-axis** or **Y-axis**).
1. Adjust the label formatting:

   - **Font family**: Change the typeface
   - **Color**: Set the label color
   - **Text size**: Adjust the font size
   - **Display units**: For value axes, choose units like Thousands, Millions, or Auto

To hide axis labels entirely, toggle **Values** to **Off**. This is useful when the visualization is self-explanatory or when you need more space for data.

## Multiple fields and hierarchies on an axis

You can add multiple fields or a hierarchy to a category axis to create more detailed groupings in your chart.

### Add multiple fields

Drag additional fields to the axis field well to create a hierarchy on that axis. For example, add both **Year** and **Month** to the X-axis to show months grouped within each year.

### Auto date/time hierarchy

When you add a date field to an axis, Power BI automatically creates a date/time hierarchy with levels like Year, Quarter, Month, and Day. This enables drill-down through the date hierarchy.

To use the actual date values instead of the auto hierarchy:

1. Right-click the date field in the axis field well.
1. Select the field name (for example, **Month**) instead of **Date Hierarchy**.

This switches from the hierarchical view to a continuous or categorical date axis, depending on your axis type setting.

### Concatenate labels

When you have multiple fields on an axis, you can control how labels display:

- **Concatenate labels off** (default): Labels display in a hierarchical structure with separate rows for each level. This creates visual groupings and lets users drill down through the hierarchy.
- **Concatenate labels on**: Labels combine into a single line, such as "2026 January" instead of showing Year and Month on separate rows. This creates a flatter display that takes less vertical space.

To change the concatenation setting:

1. In the **Format visual** pane, expand the category axis section.
1. Toggle **Concatenate labels** to **On** or **Off**.

Concatenation is useful when you want a compact axis display. Keep it off when you want to emphasize the hierarchical relationship between fields or enable drill-down behavior.

## Continuous vs. categorical axis

Axes can be either continuous or categorical, which affects how data is displayed and whether scrolling is enabled.

- **Continuous axis**: Displays data on a smooth scale without gaps. All data points fit within the visible area without scrolling. This is the default for numeric and date fields.
- **Categorical axis**: Displays each distinct value as a separate category. If the content doesn't fit within the plot area, a scrollbar appears. This is always used for text fields.

To change the axis type for numeric or date fields:

1. In the **Format visual** pane, expand the axis section.
1. Change the **Type** setting from **Continuous** to **Categorical**, or vice versa.

Text fields are always categorical and don't have the option to switch to continuous.

### Logarithmic scale

For continuous axes, you can use a logarithmic scale instead of a linear scale. Logarithmic scales are useful when your data spans several orders of magnitude.

1. In the **Format visual** pane, expand the axis section.
1. Expand the **Range** section.
1. Toggle **Logarithmic** to **On**.

> [!NOTE]
> Logarithmic scale requires all values to be either positive or negative—you cannot mix positive and negative values. Zero values are not supported on a logarithmic scale.

## Customize axis range

For value axes, you can control the minimum and maximum values to adjust the scale of your chart.

1. In the **Format visual** pane, expand the value axis section.
1. Expand the **Range** section.
1. Set custom values:

   - **Minimum**: Define where the axis starts
   - **Maximum**: Define where the axis ends

Power BI automatically calculates optimal intervals based on the range you specify. To reset to automatic values, clear the fields or select **Revert to default**.

> [!NOTE]
> Power BI automatically determines the best interval spacing for axis labels based on your data range. You cannot directly set a specific interval value, but you can influence label density by adjusting the minimum and maximum range values.

## Customize gridlines

Gridlines help readers trace values across the chart. You can customize their appearance or turn them off.

1. In the **Format visual** pane, expand the axis section.
1. Expand **Gridlines**.
1. Adjust the settings:

   - **Color**: Change the gridline color
   - **Width**: Adjust the line thickness
   - Toggle gridlines **On** or **Off**

## Customize bar and column layout

For clustered bar and clustered column charts, you can customize the spacing and overlap of bars or columns in the **Columns** or **Bars** section of the **Format visual** pane.

### Spacing options

- **Category spacing**: Adjust the space between each cluster (category). Increase spacing to separate clusters more distinctly, or decrease it to fit more data in the chart area.
- **Series spacing**: Adjust the space between individual bars or columns within each cluster. This controls how close the series appear to each other.

### Overlap for direct comparison

Enable **Overlap series** to position bars or columns on top of each other rather than side by side. This layout is useful when you want to compare values directly, such as showing this year's sales overlapping last year's sales.

When using overlap:

- **Transparency**: Adjust the transparency of bars or columns so overlapping values remain visible. A semi-transparent front series lets readers see the series behind it.
- **Border**: Add borders to help distinguish between overlapping series. Borders create visual separation when colors are similar or transparency is high.

These layout options help you create compact visualizations that emphasize comparison between series values.

## Dual Y-axes

Some visualizations benefit from having two Y-axes with different scales. Combo charts (line and stacked column) support dual Y-axes, allowing you to compare measures with different value ranges.

When you add a line value to a combo chart, Power BI creates a secondary Y-axis automatically. You can format each axis independently in the **Format visual** pane under **Y-axis (Column)** and **Y-axis (Line)**.

## Axis titles

Axis titles help readers understand what each axis represents. You can add titles to both X and Y axes.

1. In the **Format visual** pane, expand the axis section (**X-axis** or **Y-axis**).
1. Expand **Title** and toggle it to **On**.
1. Customize the title:

   - **Title text**: Enter a custom title (the default uses the field name)
   - **Title color**: Set the text color
   - **Title size**: Adjust the font size
   - **Style**: Choose to show the title only, units only, or both

For simple charts, axis titles might be unnecessary if the data is self-explanatory. For complex visualizations like dual-axis combo charts, titles help clarify what each axis measures.

## Invert the y-axis

For line, bar, column, area, and combo charts, you can invert the y-axis, putting positive values going down and negative values going up.

- In the **Format visual** pane, select **Visual**. Expand the **Y-axis** section, expand the **Range** section, and move the **Invert range** slider to **On**.

## Round range

By default, Power BI rounds axis values to the nearest multiple for cleaner axis labels. You can turn off this behavior to make the axis range fit more tightly to your actual data range.

To change the round range setting:

1. In the **Format visual** pane, select **Visual**.
1. Expand the value axis section (see [Value axis vs. category axis](#value-axis-vs-category-axis) to identify which axis).
1. Expand the **Range** section and move the **Round range** slider to **Off**.

When **Round range** is on (the default), axis labels display at rounded intervals such as 0, 50, 100. When off, the axis minimum and maximum values align more closely with your data's actual minimum and maximum values.

## Data labels vs. value axis

Data labels display values directly on or near each data point in your chart. You can use data labels instead of a value axis for a cleaner report design, or use them together for maximum clarity.

To enable data labels:

1. In the **Format visual** pane, select **Visual**.
1. Expand **Data labels** and move the slider to **On**.

When you add data labels to a chart, the axis range may shift to make space for the labels. This can affect the visual proportions of your chart.

## Considerations and limitations

- For continuous axes, Power BI automatically chooses the best tick interval based on your data range to ensure optimal readability. While you cannot set a specific interval value, you can influence the number of labels by adjusting the axis range (minimum and maximum values) in the Range section. Power BI creates a minimal format string for the tick interval to preserve space. Date values will be localized based on your system or browser locale.

## Related content

- [Visualizations in Power BI reports](power-bi-report-visualizations.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
