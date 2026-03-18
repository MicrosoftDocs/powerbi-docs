---
title: Line Charts in Power BI
description: Learn how to create and customize line charts in Power BI to visualize trends and patterns over time.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 3/17/2026
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn how to create and customize line charts so I can effectively visualize trends and time-series data in my reports.
---

# Line charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Line charts display continuous data as points connected by lines, making them ideal for visualizing trends over time. Use line charts to track metrics like monthly revenue, website traffic, or performance across periods. They excel at revealing patterns, seasonal effects, and long-term changes in your data.

Power BI offers four line chart variants:

- **Line chart** :::image type="icon" source="media/power-bi-line-chart/icon-line-chart.png":::
- **Area chart** :::image type="icon" source="media/power-bi-line-chart/icon-area-chart.png":::
- **Stacked area chart** :::image type="icon" source="media/power-bi-line-chart/icon-stacked-area-chart.png":::
- **100% stacked area chart** :::image type="icon" source="media/power-bi-line-chart/icon-100-stacked-area-chart.png":::

Lines are also available on combo charts, which combine lines with columns or areas. For more information, see [Combo charts in Power BI](power-bi-visualization-combo-chart.md).

## Sample data

To follow along with the examples in this article, create a calculated table with sample data in a blank Power BI Desktop report.

1. Open Power BI Desktop and create a new blank report.
1. Select **Modeling** > **New table**.
1. Paste the following DAX expression:

   ```dax
   Units sold =
   DATATABLE(
       "Day", INTEGER,
       "Product", STRING,
       "Online", INTEGER,
       "Store", INTEGER,
       {
           {1, "Product A", 55, 45}, {2, "Product A", 58, 48},
           {3, "Product A", 52, 51}, {4, "Product A", 60, 47},
           {5, "Product A", 63, 44}, {6, "Product A", 57, 50},
           {7, "Product A", 54, 53}, {8, "Product A", 61, 49},
           {9, "Product A", 65, 52}, {10, "Product A", 59, 56},
           {11, "Product A", 62, 54}, {12, "Product A", 68, 51},
           {13, "Product A", 64, 57}, {14, "Product A", 70, 54},

           {1, "Product B", 42, 60}, {2, "Product B", 47, 57},
           {3, "Product B", 50, 53}, {4, "Product B", 45, 58},
           {5, "Product B", 48, 62}, {6, "Product B", 53, 56},
           {7, "Product B", 49, 59}, {8, "Product B", 55, 55},
           {9, "Product B", 52, 52}, {10, "Product B", 58, 48},
           {11, "Product B", 54, 51}, {12, "Product B", 50, 54},

           {1, "Product C", 70, 35}, {2, "Product C", 65, 40},
           {3, "Product C", 68, 38}, {4, "Product C", 72, 42},
           {5, "Product C", 67, 45}, {6, "Product C", 63, 49},
           {7, "Product C", 66, 46}, {8, "Product C", 60, 50},
           {9, "Product C", 57, 53}, {10, "Product C", 62, 57},
           {11, "Product C", 58, 54}, {12, "Product C", 55, 58},
           {13, "Product C", 52, 61}, {14, "Product C", 48, 65},

           {1, "Product D", 48, 52}, {2, "Product D", 52, 49},
           {3, "Product D", 55, 46}, {4, "Product D", 51, 50},
           {5, "Product D", 56, 47}, {6, "Product D", 60, 44},
           {7, "Product D", 64, 48}, {8, "Product D", 58, 51},
           {9, "Product D", 62, 48}, {10, "Product D", 66, 45},
           {11, "Product D", 63, 49}, {12, "Product D", 60, 52},
           {13, "Product D", 65, 48}, {14, "Product D", 68, 45},

           {1, "Product E", 63, 38}, {2, "Product E", 60, 42},
           {3, "Product E", 56, 45}, {4, "Product E", 59, 41},
           {5, "Product E", 62, 47}, {6, "Product E", 58, 50},
           {7, "Product E", 55, 54}, {8, "Product E", 51, 51},
           {9, "Product E", 54, 48}, {10, "Product E", 57, 52},
           {11, "Product E", 60, 55}, {12, "Product E", 64, 50},
           {13, "Product E", 61, 53}, {14, "Product E", 58, 57},

           {1, "Product F", 35, 65}, {2, "Product F", 39, 62},
           {3, "Product F", 43, 58}, {4, "Product F", 47, 55},
           {5, "Product F", 44, 58}, {6, "Product F", 48, 54},
           {7, "Product F", 52, 51}, {8, "Product F", 56, 48},
           {9, "Product F", 53, 52}, {10, "Product F", 57, 49},
           {11, "Product F", 61, 46}, {12, "Product F", 58, 50},
           {13, "Product F", 63, 47}, {14, "Product F", 67, 43},

           {1, "Product G", 58, 42}, {2, "Product G", 54, 46},
           {3, "Product G", 57, 49}, {4, "Product G", 53, 52},
           {5, "Product G", 50, 48}, {6, "Product G", 55, 45},
           {7, "Product G", 58, 42}, {8, "Product G", 62, 46},
           {9, "Product G", 59, 50}, {10, "Product G", 56, 53},
           {11, "Product G", 60, 56}, {12, "Product G", 63, 52},
           {13, "Product G", 59, 55}, {14, "Product G", 55, 59},

           {1, "Product H", 50, 50}, {2, "Product H", 53, 47},
           {3, "Product H", 48, 52}, {4, "Product H", 55, 48},
           {5, "Product H", 52, 51}, {6, "Product H", 49, 55},
           {7, "Product H", 53, 52}, {8, "Product H", 57, 49},
           {9, "Product H", 60, 46}, {10, "Product H", 56, 50},
           {11, "Product H", 53, 53}, {12, "Product H", 50, 57},
           {13, "Product H", 54, 54}, {14, "Product H", 58, 51},

           {1, "Product I", 44, 56}, {2, "Product I", 48, 53},
           {3, "Product I", 52, 50}, {4, "Product I", 56, 47},
           {5, "Product I", 53, 51}, {6, "Product I", 50, 54},
           {7, "Product I", 47, 57}, {8, "Product I", 51, 53},
           {9, "Product I", 55, 50}, {10, "Product I", 59, 46},
           {11, "Product I", 63, 43}, {12, "Product I", 60, 47},
           {13, "Product I", 57, 50}, {14, "Product I", 62, 46},

           {1, "Product J", 67, 33}, {2, "Product J", 63, 37},
           {3, "Product J", 60, 41}, {4, "Product J", 56, 44},
           {5, "Product J", 59, 40}, {6, "Product J", 62, 43},
           {7, "Product J", 58, 47}, {8, "Product J", 55, 51},
           {9, "Product J", 52, 54}, {10, "Product J", 48, 58},
           {11, "Product J", 51, 55}, {12, "Product J", 47, 59},
           {13, "Product J", 50, 56}, {14, "Product J", 45, 60}
       }
   )
   ```

1. Press **Enter** to create the table.

### Add measures

Add measures to aggregate the sample data. Open the TMDL view (**View** > **TMDL view**), navigate to the **Units sold** table definition, and add the following measures:

```tmdl
measure 'Total units sold' = SUM('Units sold'[Online]) + SUM('Units sold'[Store])
    formatString: #,##0

measure 'Units sold online' = SUM('Units sold'[Online])
    formatString: #,##0

measure 'Units sold in store' = SUM('Units sold'[Store])
    formatString: #,##0
```

Alternatively, create the measures by selecting **Modeling** > **New measure** and entering each expression.

## Create a line chart

1. From the **Visualizations** pane, select the **Line chart** icon to add a visual placeholder to the canvas.

1. Drag **Day** to the **X-axis** field well.

1. Drag **Total units sold** to the **Y-axis** field well.

The chart displays total units sold across the 14-day period, showing the combined online and store sales trend.

:::image type="content" source="media/power-bi-line-charts/line-chart-single-series-with-markers.png" alt-text="Screenshot of a line chart with markers enabled, showing data points highlighted along the line.":::

### Use hierarchies on the X-axis

You can add multiple fields to the X-axis to create a hierarchy. When you add more than one field, the chart displays drill icons that let you navigate between hierarchy levels:

- **Drill up**: Move to a higher level in the hierarchy.
- **Drill down**: Select a data point and drill into the next level for that specific point.
- **Go to the next level**: Expand all data points to the next level in the hierarchy.
- **Expand all down one level**: Show the next level of detail while maintaining the grouping from the current level.

These drill actions let you explore your data from summary views down to detailed breakdowns. 

## Customize the lines

Enhance your line chart with data labels and markers to make data points more visible.

### Line options

Customize how lines appear in your chart by expanding the **Lines** card in **Format visual**:

- **Color**: Set the line color for each series.
- **Stroke width**: Adjust the line thickness.
- **Line style**: Choose Solid, Dashed, Dotted, or Custom. When you select Custom, additional options appear:
  - **Dash array**: Define a custom dash pattern using space-separated values (for example, "5 5 0 5" creates a dash-dot pattern).
  - **Scale by width**: When enabled, the dash pattern scales proportionally with line width.
  - **Dash cap**: Choose the shape of dash endpoints: Flat, Round, or Square.
- **Shade area**: Fill the area below the line with color.
- **Interpolation**: Control how points connect. **Straight** draws direct lines between points, **Smooth** creates curved connections (with **Monotone** or **Cardinal** curve options), and **Stepped** creates right-angle transitions.

:::image type="content" source="media/power-bi-line-charts/line-chart-line-interpolation-type.png" alt-text="Screenshot of a line chart showing different interpolation types including straight, smooth, and stepped line styles.":::

### Add data labels

1. Select your line chart and open **Format visual** in the Visualizations pane.
1. Expand the **Data labels** card and toggle it to **On**.
1. Adjust the font size, color, and position as needed.

### Add markers

1. In **Format visual**, expand the **Markers** card.
1. Toggle **Show for all series** to **On**.
1. Expand **Shape** to select a marker style (circle, square, diamond, triangle, or others).
1. Use **Color** to match or contrast with your line color.

### Other formatting options

The Format visual pane provides additional customization options:

- **Style presets**: Apply predefined visual styles.
- **X-axis** and **Y-axis**: Control axis type, titles, labels, ranges, and gridlines. See [Configure axis options](#configure-axis-options) for details.
- **Legend**: Position and format the legend.
- **Gridlines**: Show or hide horizontal and vertical gridlines.
- **Zoom slider**: Enable interactive range selection on either axis.
- **Plot area background**: Add a background image to the chart area.

### Configure axis options

The X-axis and Y-axis cards provide many options to control how axes display your data. Some of these include:

- **Type** (X-axis only): Choose between **Categorical** and **Continuous**. Categorical axes treat each value as a distinct category with equal spacing. Continuous axes plot values proportionally along a numeric or date scale. For numeric and date fields, you can explicitly set the axis type to either option. When using a categorical axis, scroll bars appear automatically if the visual is too small to display all categories.
- **Range**: Set minimum and maximum values for continuous axes.
- **Logarithmic scale**: Toggle on to use a logarithmic scale instead of linear. Log scale is useful when data spans several orders of magnitude.
- **Invert range**: Reverse the axis direction so values increase in the opposite direction.
- **Title**: Add a descriptive title to any axis. Expand the **Title** section and toggle it to **On**, then customize the text, font, and color.

## Display multiple line series

Line charts can show multiple data series (also called multiple series) simultaneously, allowing you to compare trends across categories or measures. There are two ways to create multiple series:

- **Static series**: Add multiple measures to the **Y-axis** well. Each measure becomes a separate line with a fixed name.
- **Dynamic series**: Add a field to the **Legend** well. The chart creates one line for each unique value in that field. The number of lines adjusts automatically as data changes.

### Combine multiple measures on the same axis (static series)

To compare measures with similar scales on the same axis:

1. Drag **Units sold online** to the **Y-axis** field well.
1. Drag **Units sold in store** to the **Y-axis** field well (below the first measure).

Both measures now appear on the same axis, making direct comparison straightforward.

:::image type="content" source="media/power-bi-line-charts/line-chart-static-series.png" alt-text="Screenshot of a line chart with static series, showing multiple measures plotted on the same Y-axis.":::

### Use the secondary Y-axis

When comparing measures with different scales, use a secondary Y-axis to plot each measure on its own vertical axis:

1. Verify that one measure is already in the **Y-axis** field well.
1. Drag a second measure (for example, **Units sold online**) to the **Secondary Y-axis** field well.

The chart adds a second line with its own axis scale on the right side. This approach makes it easier to compare trends between metrics even when values differ significantly.

### Add a category to the legend (dynamic series)

To display separate lines for each product:

- Drag **Product** to the **Legend** field well.

The chart now shows one line per product, each with a distinct color. The legend identifies which line represents each product.

When you have multiple lines, you can format each series individually. In the **Lines** card under **Format visual**, expand **Colors** or other formatting options and select a specific series from the **Apply settings to** dropdown to customize its color, stroke width, line style, or markers independently from other series.

:::image type="content" source="media/power-bi-line-charts/line-chart-dynamic-series.png" alt-text="Screenshot of a line chart with multiple lines created using the Legend field, showing each product as a separate colored line.":::

> [!NOTE]
> Charts with multiple measures in the Y-axis don't support adding a field to the Legend.

## Use series labels

When you have many overlapping lines or categories, the legend alone might not be enough to identify each line. Series labels place the category name directly on the chart at the end of each line.

To enable series labels:

1. Select your line chart and open **Format visual** in the Visualizations pane.
1. Expand the **Series labels** card and toggle it to **On**.

Series labels include leader lines that connect the label to its line. The leader line automatically points to the closest marker, even when the endpoint is further along the chart or when you use zoom sliders to change the visible X-axis range.

:::image type="content" source="media/power-bi-line-charts/line-chart-dynamic-series-leader-lines.png" alt-text="Screenshot of a line chart with series labels and leader lines connecting labels to their corresponding data lines.":::

### Customize series label appearance

To make labels easier to identify when lines are close together:

1. In the **Series labels** card, expand **Background**.
1. Toggle **Match series color** to **On** to give each label a background color that matches its line.
1. Adjust the **Transparency** slider to control the background opacity.
1. Expand **Values** and toggle **Match series color** to **On** to color the label text to match the line.

By default, series labels appear on the right side of the chart. To position them on the left:

1. In the **Series labels** card, expand **Options**.
1. Set **Position** to **Left**.

These options help readers quickly associate labels with their corresponding lines, even when multiple labels appear near each other.

### Customize leader lines

Leader lines connect series labels to their data points. To customize their appearance, expand **Leader lines** in the **Series labels** card:

- **Maximum offset**: Control how far labels can be positioned from their data points.
- **Color**: Set the line color.
- **Transparency**: Adjust the line opacity.
- **Line style**: Choose Solid, Dashed, Dotted, or Custom. For Custom options, see [Line options](#line-options).
- **Width**: Change the line thickness.

## Use small multiples

Small multiples create a grid of small line charts, one for each category. This approach separates overlapping data into individual panels for clearer comparison.

To create small multiples:

1. Drag **Product** to the **Small multiples** field well.

The chart splits into a grid where each cell shows the trend for a single product.

:::image type="content" source="media/power-bi-line-charts/line-charts-small-multiples.png" alt-text="Screenshot of a line chart using small multiples, showing a grid of individual charts for each product category.":::

### Configure small multiples axes

By default, all small multiple charts share the same axis scale. To customize:

1. In **Format visual**, expand the **Y-axis** card.
1. Expand **Range** and configure the following options:
   - **Shared y-axis**: When on (default), all charts use the same scale, making it easier to compare absolute values across products. When off, each chart scales to its own data range.
   - **Scale to fit**: Available when **Shared y-axis** is off. When enabled, each chart scales independently to fit its data, which is better for comparing relative trends when products have very different volumes.

## Considerations and limitations

- **Conditional formatting**: Line charts don't natively support conditional formatting for lines, shaded areas, or markers.
- **Line segment behavior**:
  - **Single series only**: Segment formatting (color, shade area) works with only one series. Multiple series disable this feature.
  - **Gaps in data**: How gaps appear depends on axis type. Categorical axes show gaps as discrete breaks when "Show items with no data" is enabled. Continuous axes connect points with a line even when values are missing.
- **Analytics features**: Advanced features like **Anomaly detection** and **Forecasting** require a single-series chart and a continuous X-axis. Area chart variants (Area, Stacked Area, 100% Stacked Area) have varying support for analytics features.

## Related content

- [Area charts in Power BI](power-bi-visualization-basic-area-chart.md)
- [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
- [Customize X-axis and Y-axis properties](power-bi-visualization-customize-x-axis-and-y-axis.md)
- [Create small multiples in Power BI](power-bi-visualization-small-multiples.md)
- [Interact with small multiples in Power BI](power-bi-visualization-small-multiples-interact.md)
- [Visualizations overview in Power BI](power-bi-visualizations-overview.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
