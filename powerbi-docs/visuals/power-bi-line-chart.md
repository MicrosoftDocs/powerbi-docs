---
title: Line Charts in Power BI
description: Learn how to create and customize line charts in Power BI to visualize trends and patterns over time.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/10/2025
ms.custom: sample-Sales-and-Marketing
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

## Prerequisites

In the following guide, you use the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

# [Power BI Desktop](#tab/powerbi-desktop)

> [!IMPORTANT]
> Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494) installed before proceeding.

1. Launch **Power BI Desktop**.
1. From the left-side navigation pane, select **Open**, or select **File > Open** from the menu.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view.

# [Power BI service](#tab/powerbi-service)

1. Sign in to the Power BI service (`app.powerbi.com`).
1. From the left-side navigation pane, select **Learn**.
1. On the **Learning center** page, under **Sample reports**, locate and select **Retail Analysis Sample**. It opens in Reading mode and adds the dashboard, report, and semantic model to your workspace.
1. At the top of the report, select **Edit** to switch to the Report editor (Edit mode).

---

[!INCLUDE[sharing-license-requirements](../includes/share-license-requirements.md)]

## Create a line chart

1. From the **Visualizations** pane, select the **Line chart** icon to add a visual placeholder to the canvas. (In the Power BI service, select **Build visual** first, then choose the icon.)

   :::image type="content" source="media/power-bi-line-chart/create-line-chart.png" alt-text="Screenshot of Power BI canvas with a line chart placeholder added, showing the Visualizations pane and Line chart icon selected." lightbox="media/power-bi-line-chart/create-line-chart.png":::

1. Add data to your chart by using one of these combinations:
   - One field on **X-axis** and one measure on **Y-axis**.
   - One field on **X-axis**, one measure on **Y-axis**, and one field in **Legend**.
   - One or more fields on **X-axis** and multiple measures on **Y-axis** (charts with multiple measures don't support legends).

   For this example:

   - Drag **This Year Sales > Value** to the **Y-axis** field well.
   - Drag **Time > Month** to the **X-axis** field well.

1. To customize your chart, select **Format visual** in the Visualizations pane to access formatting options under the **Visual** and **General** tabs.

## Drill into line chart data

Line charts support drill actions that let you explore data hierarchies. To enable drilling through different time levels, configure your chart with a date hierarchy (Year > Quarter > Month > Day).

To set up drill functionality:

1. Select your line chart on the canvas.
1. In the **Visualizations** pane, locate the **X-axis** field well.
1. From the **Data** pane, drag **Time > Date Hierarchy** to the **X-axis** field well (remove any existing fields first).

:::image type="content" source="media/power-bi-line-chart/line-chart-drill.png" alt-text="Screenshot of a line chart with four drill icons: Drill up, Drill down, Go to next level, and Expand all. Icons are positioned near the chart." lightbox="media/power-bi-line-chart/line-chart-drill.png":::

Four drill icons appear near the visual:

- **Drill up** - Move to a higher level in the hierarchy.
- **Drill down** - Enable drill mode to select individual data points.
- **Go to next level** - Expand all points to the next hierarchy level.
- **Expand all** - Show next level grouped under each category.

### Use drill down mode

1. Select the **Drill down** icon (downward arrow) to activate drill mode.
1. Select any data point or axis value to drill into that specific period.
1. Select the **Drill up** icon to return to the previous level.

### Navigate hierarchy levels

- **Go to next level**: Expands all data points simultaneously to show the next level (for example, all months across all quarters).
- **Expand all**: Maintains grouping while showing the next level of detail beneath each category.

## Use zoom sliders

Zoom sliders let you focus on specific data ranges along the X or Y axes, making it easier to examine trends in detail.

:::image type="content" source="media/power-bi-line-chart/line-chart-zoom.png" alt-text="Screenshot of the Visualizations pane with the Zoom slider card expanded and the toggle set to On." lightbox="media/power-bi-line-chart/line-chart-zoom.png":::

To enable zoom sliders:

1. Select your line chart and open **Format visual** in the Visualizations pane.
1. Change the X-axis **Type** from **Categorical** to **Continuous** (required for zoom functionality).
1. Expand the **Zoom slider** card and toggle it to **On**.
1. Enable **X-axis** and **Y-axis** options to show sliders on both axes.
1. Optionally enable:
   - **Slider tooltips** - Shows values as you drag slider handles.
   - **Slider labels** - Displays the full range of values available on each axis.

Drag the slider handles to adjust the visible data range dynamically. The chart updates to show only data within the selected range.

## Customize line segments

To highlight trends or emphasize key data points, apply targeted formatting to specific portions of your line.

:::image type="content" source="media/power-bi-line-chart/line-chart-line-segment.png" alt-text="Screenshot of the Format visual pane with the Lines card expanded and the Apply settings to dropdown set to 'Aug'." lightbox="media/power-bi-line-chart/line-chart-line-segment.png":::

To format line segments:

1. Select your line chart and open **Format visual**.
1. Under the **Visual** tab, expand the **Lines** card.
1. In the **Apply settings to** dropdown, select a specific category (such as "Aug") or choose **All**.
1. Change the **Color** to highlight the selected segment.
1. Set the **Segment type** to:
   - **Both** - Colors both sides of data points (default).
   - **Left** - Colors only the left side of each point.
   - **Right** - Colors only the right side of each point.
1. Toggle **Shade area** to **On** to fill the area beneath the line.

> [!NOTE]
> Line segment formatting is only available for single-series charts. Multiple series (via legend or multiple Y-axis measures) don't support segment customization.

## Add a secondary Y-axis

When you compare measures with different scales, use a secondary Y-axis to plot each measure on its own vertical axis.

:::image type="content" source="media/power-bi-line-chart/line-chart-secondary-axis.png" alt-text="Screenshot of a line chart with one measure in the Y-axis field and Last Year Sales added to the Secondary Y-axis field well." lightbox="media/power-bi-line-chart/line-chart-secondary-axis.png":::

To add a secondary Y-axis:

1. Select your line chart.
1. Verify that one measure is already in the **Y-axis** field well.
1. From the **Data** pane, drag a second measure (for example, **Last Year Sales**) to the **Secondary Y-axis** field well.

The chart adds a second line with its own axis scale. This feature makes it easier to compare trends between metrics even when values differ significantly.

## Considerations and limitations

- **Maximum number of lines**:
  - While Power BI doesn't impose a strict line limit, too many lines (typically beyond 10-15) can reduce readability and performance. For complex comparisons, consider:
    - Using small multiples.
    - Adding slicers for dynamic filtering.
    - Choosing alternative chart types better suited for high-volume data.
- **Conditional formatting**:
  - Line charts don't natively support conditional formatting for lines, shaded areas, or markers. While some users find workarounds by applying conditional formatting to a column chart first and then switching to a line chart, this method isn't officially supported. Results can vary.
- **Line segment behavior**:
  - **Single series only**: Segment formatting (color, shade area) works with only one series. Multiple series disable this feature.
  - **Gaps in data**: How gaps appear depends on axis type:
    - **Categorical axis**: Shows gaps as discrete breaks when "Show items with no data" is enabled.
    - **Continuous axis**: Connects points with a line even when values are missing.
- **Analytics features**:
  - Advanced features like **Anomaly detection** and **Forecasting** require:
    - A single-series chart.
    - A continuous X-axis.
  - Area chart variants (Area, Stacked Area, 100% Stacked Area) have varying support for analytics features. Test your configuration before relying on these tools in production reports.

## Related content

- [Visualizations overview in Power BI](power-bi-visualizations-overview.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
