---
title: Use ribbon charts in Power BI
description: Create and consume ribbon charts in the Power BI service and Power BI Desktop
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/10/2019
ms.author: mihart

LocalizationGroup: Visualizations
---
# Use ribbon charts in Power BI
You can use ribbon charts to visualize data, and quickly discover which data category has the highest rank (largest value). Ribbon charts are effective at showing rank change, with the highest range (value) always displayed on top for each time period. 

![ribbon chart](media/desktop-ribbon-charts/ribbon-charts_01.png)

## Create a ribbon chart
To follow along, open the [Retail analysis sample report](../sample-retail-analysis.md). 

1. To create a ribbon chart, select **Ribbon chart** from the **Visualizations** panel.

    ![visualization templates](media/desktop-ribbon-charts/power-bi-template.png)

    Ribbon charts connect a category of data over the visualized time continuum using ribbons, enabling you to see how a given category ranks throughout the span of the chart's x-axis (usually the timeline).

2. Select fields for **Axis**, **Legend**, and **Value**.  In this example, we've selected: **Date**, **Category**, and **This year sales**.  

    ![selected fields](media/desktop-ribbon-charts/power-bi-ribbon-values.png)

    Since the dataset contains data for only one year, we removed the **Year** field from the **Axis** well. 

3. The ribbon chart shows rank for every-other month. Notice how rank changes across time.  For example, the Home category moves from third to fourth and back to third again. The Juniors category moves from third to fifth in July. 

    ![ribbon chart](media/desktop-ribbon-charts/power-bi-ribbon.png)

## Format a ribbon chart
When you create a ribbon chart, you have formatting options available in the **Format** section of the **Visualizations** pane. The formatting options for ribbon charts are similar to those for a stacked column chart, with additional formatting options that are specific to the ribbons.

![ribbon template on Visualization pane](media/desktop-ribbon-charts/power-bi-format-ribbon.png)

These formatting options for ribbon charts let you make adjustments.

* **Spacing** lets you adjust how much space appears between ribbons. The number is the percentage of the column's maximum height.
* **Match series color** allows you to match the color of the ribbons with the series color. When set to **off**, ribbons are gray.
* **Transparency** specifies how transparent the ribbons are, with the default set to 30.
* **Border** lets you place a dark border on the top and bottom of the ribbons. By default, borders are off.

Since the ribbon chart does not have y-axis labels, you may want to add data labels. From the Formatting pane, select **Data labels**. 

![formatting options for data labels](media/desktop-ribbon-charts/power-bi-labels.png)

Set formatting options for your data labels.  In this example, we've set the text color to white, the decimal places to zero, and display units to thousands. 

![ribbon template on Visualization pane](media/desktop-ribbon-charts/power-bi-data-labels.png)

## Next steps

[Scatter charts and bubble charts in Power BI](power-bi-visualization-scatter.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)