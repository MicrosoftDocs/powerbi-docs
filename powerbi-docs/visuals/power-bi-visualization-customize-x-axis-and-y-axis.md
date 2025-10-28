---
title: Customize X-axis and Y-axis Properties
description: Learn how to customize X-axis and Y-axis properties.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: juliacawthra
ms.custom: 
   - video-removed
   - sample-retail-analysis-sample-PBIX
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to 
ms.date: 10/27/2025
LocalizationGroup: Visualizations
---

# Customize x-axis and y-axis properties

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you learn many different ways to customize the X-axis and Y-axis of your visuals. Not all visuals have axes. Pie charts, for example, don't have axes. And customization options vary from visual to visual. There are too many options to cover in a single article, so let's take a look at some of the most-used customizations and get comfortable using the visual **Format** pane in the Power BI report canvas. 

## Prerequisites

- Power BI Desktop
- [Retail Analysis Sample ](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix)

## Add a new visualization

Before you can customize your visualization, you have to build it.

1. In Power BI Desktop, open the Retail Analysis sample.

1. At the bottom, select the plus icon to add a new page.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-new-page-icon.png" alt-text="Screenshot showing the new page icon, a plus sign.":::

1. From the **Visualizations** pane, select the stacked column chart icon to add an empty template to your report canvas.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-column-chart.png" alt-text="Screenshot of the Visualizations pane with the tooltip text showing for the stacked column chart.":::

1. To set the X-axis values, from the **Fields** pane, select **Time** > **FiscalMonth**.

1. To set the Y-axis values, from the **Fields** pane, select **Sales** > **Last Year Sales** and **Sales** > **This Year Sales** > **Value**.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-build-visual.png" alt-text="Screenshot of the populated stacked column chart.":::

Now you can customize your X-axis. Power BI provides almost limitless options for formatting your visualization.

## Customize the X-axis

There are many features that are customizable for the X-axis. You can add and modify the data labels and X-axis title. For categories, you can modify the width, size, and padding of bars, columns, lines, and areas. And for values, you can modify the display units, decimal places, and grid lines. If the primary axis data type is scalar, you can choose between continuous axis (the default for scalar types like numeric and datetime) or categorical. Continuous axes can be linear or log scale, and show all the data without scrolling. Categorical axes show the category label for each data point, and will scroll if content doesn't fit within the plot area.

The following example shows customization for a column chart. Let's add a few customizations to get you familiar with the options and then you can explore the rest on your own.

### Customize the X-axis labels

The X-axis labels display below the columns in the chart. Right now, they're light grey, small, and difficult to read. Let's change that.

1. In the **Visualizations** pane, select **Format** :::image type="icon" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-paintroller-icon.png"::: to reveal the customization options.

1. Expand the X-axis options and move the **Values** slider to **On**.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-axis-x.png" alt-text="Screenshot of the X-axis options.":::

   There are cases where you might want to set the X-axis **Values** to **Off**. For example, if the visualization is self-explanatory without labels or if you have a crowded report page and need to make space to display more data.

1. Format the x-axis text by adjusting these values:

   - **Font family**: Select **Arial Black**

   - **Font size**: Enter *14*

   - **Color**: Select black

   - **Maximum height**: Enter *40%*

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-formatting-x.png" alt-text="Screenshot of the adjusted X-axis options. The chart on the canvas has X-axis labels displayed at an angle.":::

1. Maybe you don't like the way the X-axis text is displayed on a diagonal. You have several options.

   - Change the font size to something smaller than 14.
   - Make the visualization larger. 
   - Display fewer columns and add a scrollbar by increasing **Minimum category width**.

   Here, we selected the second option and grabbed one of the resize bars to make the visualization wider. It now accommodates the 14-point text without needing to display the text on an angle or with a scrollbar.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-stretch.png" alt-text="Screenshot of the formatting pane and the chart with horizontal X-axis labels. The resize bar on the left side of the chart is highlighted.":::

### Customize the X-axis title

When the X-axis title is **On**, the X-axis title displays below the X-axis labels.

1. Start by turning the X-axis title to **On**.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-title-on.png" alt-text="Screenshot showing the X-axis Title On/Off toggle.":::

   The first thing you might notice is that your visualization now has a default X-axis title. In this case, it's *FiscalMonth*.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-x-title.png" alt-text="Screenshot of the chart with title 'FiscalMonth' displayed along the bottom.":::

1. Format the x-axis title text, font size, and font color:

   - **Title text**: Type *Fiscal Month* (with a space)

   - **Font size**: Enter *18*

   - **Color**: Select orange

   After you finish the customizations, your stacked column chart looks something like this:

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-x-title-formatted.png" alt-text="Screenshot of the customized stacked column chart.":::

1. Save your changes and move to the next section. If you ever need to revert all of the changes, select **Revert to default** at the bottom of the **X-Axis** customization pane. Next, let's customize the Y-Axis.

## Customize the Y-axis

There are many features that can be customized for the Y-axis. You can add and modify the data labels, Y-axis title, and gridlines. For values, you can modify the display units, decimal places, starting point, and end point. And, for categories, you can modify the width, size, and padding of bars, columns, lines, and areas. 

The following example continues our customization of a column chart. Let's make a few changes to get you familiar with the options, and then you can explore the rest on your own.

### Customize the Y-axis labels

The Y-axis labels are displayed on the left side by default. Right now, they're light grey, small, and difficult to read. Let's change that.

1. Expand the Y-axis options and move the **Values** slider to **On**.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-axis-y.png" alt-text="Screenshot of the Y-axis options.":::

   One reason you might want to turn off the Y-axis, is to save space for more data.

1. Format the y-axis text by adjusting these values:

   - **Font family**: Select **Arial Black**

   - **Font size**: Enter *10*

   - **Color**: Select black

   - **Display units**: Select **Millions**

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-formatting-y.png" alt-text="Screenshot showing the chart after Y-axis formatting.":::

### Customize the Y-axis title

When the Y-axis title is **On**, the Y-axis title displays next to the Y-axis labels. For this visualization, having a Y-axis title doesn't improve the visual, so leave **Title** turned **Off**. Later in this tutorial, we add Y-axis titles to a dual-axis visual.

### Customize the gridlines

Let's make the gridlines stand out by changing the color and increasing the stroke:

- Expand the **Gridlines** tab and ensure the **Horizontal** slider is **On**.

- **Color**: Select orange

- **Width**: Enter or select *2*

After all these customizations, your column chart should look something like this:

:::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-gridline.png" alt-text="Screenshot of the chart with the customized Y-axis.":::

## Customizing visualizations with dual Y axes

Some visualizations can benefit from having two Y axes. Combo charts are a good example. Before we can format dual Y axes, we need to create a combo chart that compares trends for sales and gross margin. 

### Create a chart with two Y-Axes

1. Select the column chart, and change it to a *Line and stacked column* chart. This type of visual supports a single line chart value and multiple stackable column values. 

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-combo.png" alt-text="Screenshot of the Visualizations pane with the line and stacked column chart icon called out.":::

1. Drag **Sales** > **Gross Margin Last Year %** from your Fields pane into the **Line y-axis** bucket.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-add-line.png" alt-text="Screenshot of the line and stacked column chart with all three values clearly represented.":::

1. Reformat the visualization to remove the angled X-axis labels.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-font-size.png" alt-text="Screenshot of the Format pane and Combo chart with the font size reduced to 12.":::

   Power BI creates two Y axes, allowing the values to be scaled differently. The left axis measures sales dollars. The right axis measures gross margin percentage.

### Format the second Y-Axis

Because we started with a visualization with one formatted Y-axis, Power BI created the second Y-axis using the same settings. But we can change that.

1. In the **Visualizations** pane, select the paint roller icon to display the format options.

1. Expand the **Secondary y-axis** options. Our secondary Y-axis represents the line chart.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-show-secondary.png" alt-text="Screenshot of the Secondary y-axis options.":::

1. (Optional) Customize the font color, size, and display units for the two axes. If you switch **Position** for either the column axis or the line axis, then the two axes switch sides.

### Add titles to both axes

With a visualization that's complex, it helps to add axes titles. Titles help your colleagues understand the story your visualization is telling.

1. Ensure that **Title** is toggled to **On** for the **Y-axis (Column)** and the **Secondary y-axis (Line)**.

1. Set **Style** to **Show title only** for both.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-show-title.png" alt-text="Screenshot of the Title and Style options.":::

1. Your combo chart now shows dual axes, both with titles.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-titles-on.png" alt-text="Screenshot of the customized chart with dual Y-Axes.":::

1. Format the titles. In this example, we shortened one of the titles and reduced the font size for both.

   - Font size: **9**
   - Shortened the **Axis title** for the first Y-axis (the column chart) to *Sales last year & This year*.

   :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-dual.png" alt-text="Screenshot of the combo chart displaying both y-axis titles.":::

   For more information, see [Tips and tricks for color formatting in Power BI](service-tips-and-tricks-for-color-formatting.md) and [Customize visualization titles, legends, and backgrounds](power-bi-visualization-customize-title-background-and-legend.md). 

## Invert the y-axis

For line, bar, column, area, and combo charts, you can invert the y-axis, putting positive values going down and negative values going up.

- In the **Format visual** pane, select **Visual**. Expand the **Y-axis** section, expand the **Range** section, and slide **Invert range** to **On**.

  :::image type="content" source="media/power-bi-visualization-customize-x-axis-and-y-axis/power-bi-y-axis-invert.png" alt-text="Screenshot of the column chart with values on the y axis inverted.":::

## Considerations and limitations

- For continuous axis tick marks, you can't control the format string. Power BI chooses the best tick interval based on your data range, and creates a minimal format string for this unit interval, to preserve space. Date values are localized based on your system or browser locale.

## Related content

- [Visualizations in Power BI reports](power-bi-report-visualizations.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
