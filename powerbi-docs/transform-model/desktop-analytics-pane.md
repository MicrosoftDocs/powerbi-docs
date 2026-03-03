---
title: Use the Analytics pane in Power BI
description: Learn how to create dynamic reference lines for visuals using the Analytics pane in Power BI Desktop and the Power BI service.
author: kgremban
ms.author: kgremban
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 02/26/2025
LocalizationGroup: Create reports
---
# Use the Analytics pane in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The **Analytics** pane lets you add constant and dynamic reference lines, error bars, forecasts, and anomaly detection to your visuals. Access the **Analytics** pane by selecting a visual and then selecting the **Analytics** icon in the **Visualizations** area.

:::image type="content" source="media/desktop-analytics-pane/analytics-pane_1.png" alt-text="Screenshot of the Analytics pane in the Visualizations section.":::

> [!NOTE]
> The **Analytics** pane only appears when you select a visual on the report canvas.

## Use the Analytics pane

With the **Analytics** pane, you can create the following types of dynamic reference lines and analytics:

| Feature | Description | Supported visuals |
|---------|-------------|-------------------|
| Trend line | Shows the overall direction of data over time | Area chart, Clustered column chart, Line chart, Line and clustered column chart (requires time data) |
| X-Axis constant line | A vertical reference line at a fixed X-axis value | Area chart, Clustered bar chart, Clustered column chart, Line chart, Ribbon chart, Scatter chart, Stacked area chart, Stacked bar chart, Stacked column chart, 100% Stacked area chart, 100% Stacked bar chart, 100% Stacked column chart |
| Y-Axis constant line | A horizontal reference line at a fixed Y-axis value | Area chart, Clustered bar chart, Clustered column chart, Line chart, Ribbon chart, Scatter chart, Stacked area chart, Stacked bar chart, Stacked column chart, Waterfall chart, 100% Stacked area chart, 100% Stacked bar chart, 100% Stacked column chart |
| Min line | A line at the minimum value of a measure | Area chart, Clustered bar chart, Clustered column chart, Line chart, Scatter chart |
| Max line | A line at the maximum value of a measure | Area chart, Clustered bar chart, Clustered column chart, Line chart, Scatter chart |
| Average line | A line at the average value of a measure | Area chart, Clustered bar chart, Clustered column chart, Line chart, Scatter chart |
| Median line | A line at the median value of a measure | Area chart, Clustered bar chart, Clustered column chart, Line chart, Scatter chart |
| Percentile line | A line at a specified percentile of a measure | Area chart, Clustered bar chart, Clustered column chart, Line chart, Scatter chart |
| Symmetry shading | Highlights the area where X and Y values are equal | Scatter chart |
| Error bars | Displays variability or uncertainty in measurements | Clustered bar chart, Clustered column chart, Line chart, Line and clustered column chart |
| Forecast | Predicts future values based on historical trends | Line chart |
| Anomalies | Identifies unexpected spikes or dips in time-series data | Line chart |

> [!NOTE]
> Not all features are available for all visual types.

You can add multiple instances of the same line type to a single visual. For example, you might add several constant lines at different values, multiple percentile lines (such as 25th, 50th, and 75th percentiles), or min and max lines for different measures. Each line can have its own name, color, and formatting options.

The following sections show how you can use the **Analytics** pane and dynamic reference lines in your visualizations.

To view the available dynamic reference lines for a visual, follow these steps:

1. Select or create a visual, then select the **Analytics** icon from the **Visualizations** section.

    :::image type="content" source="media/desktop-analytics-pane/analytics-pane_2.png" alt-text="Screenshot of a visual and the analytics icon highlighted in the Visualizations pane.":::

2. Select the type of line you want to create to expand its options. This example shows **Average line** selected.

    :::image type="content" source="media/desktop-analytics-pane/analytics-pane_3.png" alt-text="Screenshot of the analytics line options.":::

3. To create a new line, select **+&nbsp;Add**. Then you can name the line. Double-click the text box and enter your name.

    Now you have all sorts of options for your line. You can specify its **Color**, **Transparency** percentage, **Line style**, and **Position** (compared to the visual's data elements). You might also choose whether to include the **Data label**. To specify the visual measure to base your line upon, select the **Measure** dropdown list, which is automatically populated with data elements from the visual. This example selects **Total sales** as the measure, and labels it *Average sales*. You'll see how to customize a few of the other options in the later steps.

    :::image type="content" source="media/desktop-analytics-pane/analytics-pane_4.png" alt-text="Screenshot of an Average line on a visual.":::

4. If you want to have a data label appear, change **Data label** from **Off** to **On**. When you do so, you get many more options for your data label.

    :::image type="content" source="media/desktop-analytics-pane/analytics-pane_5.png" alt-text="Screenshot of the data label options in the analytics pane.":::

5. Notice the number that appears next to the **Average line** item in the **Analytics** pane. That tells you how many dynamic lines you currently have on your visual, and of which type. If we add more reference lines, the **Analytics** pane shows a number next to each line section.

    :::image type="content" source="media/desktop-analytics-pane/analytics-pane_6.png" alt-text="Screenshot of a Max line on a visual in Power BI Desktop.":::

If the visual you've selected can't have dynamic reference lines applied to it (in this case, a **Map** visual), you'll see the following message when you select the **Analytics** pane.

:::image type="content" source="media/desktop-analytics-pane/analytics-pane_7.png" alt-text="Screenshot of a visual with a message in the Analytics pane informing that analytics aren't available for this visual.":::

You can highlight many interesting insights by creating dynamic reference lines with the **Analytics** pane.

## Add error bars

Error bars display the variability or uncertainty in your measurements. You can add error bars to supported visuals from the **Analytics** pane.

### Error bar types

Error bars can be configured using one of two methods:

* **By field**: Add upper bound and lower bound fields from your semantic model. Specify whether the relation to the measure is **Absolute** (the field values represent the actual upper and lower bounds) or **Relative** (the field values represent the distance from the measure). You can also choose to make the error bars symmetrical.
* **By percentage**: Enter the lower and upper bounds as percentage values. The error bars are calculated as a percentage of the measure value.

### Style options

Customize the appearance of your error bars with these options:

* **Color**: Match the series color or set a custom color for the error bars.
* **Width**: Adjust the thickness of the error bar lines.
* **Border**: Set a border color and size for the error bars.

### Markers

Markers define how the caps (ends) of the error bars appear:

* **Shape**: Select the cap style for the error bar endpoints.
* **Size**: Adjust the size of the cap markers.

### Error band (line charts only)

For line charts, you can display an error band in addition to individual error bars. The error band shows the error range as an area around the line. The error band can be styled as:

* **Fill**: A shaded area representing the error range.
* **Line**: Only the upper and lower boundary lines of the error range.
* **Both**: A combination of filled area with visible boundary lines.

### Error labels

You can add data labels to display the error bar values directly on the visual.

### Tooltip options

Configure how error bar information appears in tooltips when users hover over data points:

* **Range**: Display the error bar as a range value.
* **Absolute**: Show explicit upper and lower bound values as separate rows in the tooltip.
* **Relative (numeric)**: Display the upper and lower bounds as their own rows showing the distance from the measure value.
* **Relative (percentage)**: Show the upper and lower bounds as percentage values.
* **Off**: Hide error bar information from the tooltip entirely.

## Forecast

If you have time data in your data source, you can use the *forecasting* feature. Select a visual, then expand the **Forecast** section of the **Analytics** pane. You might specify many inputs to modify the forecast, such as the **Forecast length** or the **Confidence interval**. The following image shows a basic line visual with forecasting applied.

:::image type="content" source="media/desktop-analytics-pane/analytics-pane_8.png" alt-text="Screenshot showing a basic line visual with forecasting applied and the forecasting options highlighted in the Analytics pane.":::

> [!NOTE]
> The forecasting feature is only available for line chart visuals.

For an example of how forecasting can be applied, see the (dated, but still relevant) article about [forecasting capabilities](https://powerbi.microsoft.com/blog/introducing-new-forecasting-capabilities-in-power-view-for-office-365/).

## Anomalies

The Anomalies feature automatically identifies unexpected spikes or dips in your time-series data. This feature is only available for line chart visuals.

### Detection settings

* **Sensitivity**: Adjust how sensitive the detection algorithm is. Higher sensitivity detects more anomalies, while lower sensitivity only flags the most significant deviations.
* **Explain by**: Select fields from your semantic model that might help explain why an anomaly occurred. When users select an anomaly on the visual, Power BI analyzes these fields to provide potential explanations.

### Shape options

The shape marks data points identified as anomalies on the visual:

* **Shape type**: Select the marker shape used to indicate anomalies.
* **Size**: Adjust the size of the anomaly markers.
* **Rotation**: Set the rotation angle for the anomaly markers.
* **Show markers**: Turn the anomaly markers on or off.

### Color and border

Customize the appearance of anomaly markers:

* **Color**: Set the fill color for anomaly markers.
* **Border**: Configure the border color and width for the markers.

### Expected range

The expected range shows the normal value range that the algorithm uses to identify anomalies:

* **Style**: Display the expected range as **Fill** (a shaded area) or **Line** (showing only the upper and lower boundaries).
* **Color**: Set the color for the expected range visualization.
* **Transparency**: Adjust the transparency level of the expected range.

## Considerations and limitations

The *percentile line* is only available when using imported data in Power BI Desktop or when connected live to a model on a server that's running Analysis Service 2016 or later, Azure Analysis Services, or a semantic model on the Power BI service.

## Related content

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, see the following resources:

* [What's new in Power BI?](../fundamentals/whats-new.md)
* [Get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md)
* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query overview with Power BI Desktop](desktop-query-overview.md)
* [Data types in Power BI Desktop](../connect-data/desktop-data-types.md)
* [Shape and combine data in Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
* [Perform common query tasks in Power BI Desktop](desktop-common-query-tasks.md)
