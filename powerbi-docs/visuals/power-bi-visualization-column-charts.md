---
title: Column charts in Power BI
description: This tutorial about column charts explains and how to build them in the Power BI service and Desktop.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer:
ms.custom: sample-Retail-Analysis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/01/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about column charts so that I can effectively and more easily build column chart visuals in Power BI Desktop and Power BI Service.
---
# Build a column chart

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Overview

A column chart , also known as a vertical bar graph, is a type of chart used to display and compare data over categories. Each column represents a category, and the height of the column represents the value. This makes it easy to compare values across multiple categories or time periods. Column charts are commonly used in business and finance to display financial data such as revenue, expenses, and profits. They are also used in marketing to display data such as sales figures, market share, and customer demographics.

In the illustrated guide below, we demonstrate the process of building a column chart visual both in Power BI Desktop and the Power BI Service.

After following the guide to build your visual, we've also provided a comprehensive list of all available format settings and controls for you to use as reference in a subsequent document, Format settings for column charts.

Depending on the unique needs of your analysis, you can choose from three distinct types of column charts:

```- **Stacked column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/stacked-column-chart-icon.png":::```
```- **Clustered column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/clustered-column-chart-icon.png":::```
```- **100% Stacked column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/100-percent-stacked-column-chart-icon.png":::```

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

[!INCLUDE [prerequisites-desktop-download-latest-version-pbi-desktop](../includes/core-visuals/prerequisites-desktop-download-latest-version-pbi.md)]
[!INCLUDE [prerequisites-desktop-preview-features-on-object-unselected](../includes/core-visuals/prerequisites-desktop-preview-features-on-object-unselected.md)]
[!INCLUDE [prerequisites-desktop-download-retail-analysis-sample-pbix](../includes/core-visuals/prerequisites-desktop-download-retail-analysis-sample-pbix.md)]

# [Power BI Service](#tab/powerbi-service)

> [!NOTE]
> [!INCLUDE [prerequisites-share-your-report](../includes/core-visuals/prerequisites-share-your-report.md)]

## Build a column chart

# [Power BI Desktop](#tab/powerbi-desktop)

Before we begin, if you haven't already done so, refer to the **Prerequisites** section above, and follow the steps under the tab for **Power BI Desktop**.

For this example, let’s create a column chart starting from the Visualizations pane in Power BI Desktop.

1. From the **Visualizations** pane, select any **Column chart** icon, and a visual placeholder is immediately added to the canvas.

:::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-desktop-step-1.png" alt-text="Screenshot of the Visualizations pane, with Build visual icon highlighted, and the three Column chart icons also highlighted.":::

1. To add data to your column chart, simply open the **Data pane** and expand the Sales dropdown to select the desired fields or measures.
```NOTE:  Any one of the following combinations are required to create column charts:```
```- A minimum of one data field on the **X-axis** and one measure on the **Y-axis**, or```
```- At least one data field on the **X-axis**, one measure on the **Y-axis**, and precisely one data field in the **Legend**, or```
```- One or more data fields on the **X-axis** and multiple measures on the **Y-axis**, keeping in mind that column charts with multiple measures don’t support a **Legend**.```

```The specific combination you choose depends on the data you’re working with and the insights you want to glean from your chart. As a visual guide, in the example below, we’ve selected one data field on the **X-axis** and one measure on the **Y-axis**.```

:::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-desktop-step-2.png" alt-text="Screenshot of the Data pane highlighted, along with selected fields and the axes containing data fields also highlighted.":::

1. To customize your column chart, select the Format icon in the Visualizations Pane, to reveal the Format pane, granting you access to all available formatting options under the Visual tab and the General tab. This allows you to tailor the chart's appearance and functionality to your specific requirements.

:::image type="content" source="media/power-bi-visualization-column-charts/build-column-chart-desktop-step-3.png" alt-text="Screenshot of the Visualizations pane highlighted, along with Format visual icon, and both the Visual tab and General tab, also highlighted.":::

You've now successfully created a column chart with Power BI Desktop. Take some time to familiarize yourself with all the available **Format settings for column charts** in the **Related content** section below.

# [Power BI service](#tab/powerbi-service)

Before we begin, if you haven't already done so, refer to the **Prerequisites** section above, and follow the steps under the tab for **Power BI Service**.

For this example, let’s create a column chart starting from the **Visualizations pane** in **Power BI Service**.

1. To create your column chart, we'll start in the **Visualizations pane**. With the **Build visual** icon selected, choose any **Column chart** icon, and a visual placeholder is added to the canvas.

:::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-service-step-1.png" alt-text="Screenshot of the Visualizations pane, with Build visual icon highlighted, and the three Column chart icons also highlighted.":::

1. To add data to your column chart, simply choose fields and measures from the **Data pane**. This is done by selecting data from within the **Data pane** itself, or dragging them to the field wells within the **Visualizations pane**, or dragging directly to the placeholder on the canvas.
```NOTE:  Any one of the following combinations are required to create column charts:```
```- A minimum of one data field on the **X-axis** and one measure on the **Y-axis**, or```
```- At least one data field on the **X-axis**, one measure on the **Y-axis**, and precisely one data field in the **Legend**, or```
```- One or more data fields on the **X-axis** and multiple measures on the **Y-axis**, keeping in mind that column charts with multiple measures don’t support a **Legend**.```

```The specific combination you choose depends on the data you’re working with and the insights you want to glean from your chart. As a visual guide, in the example below, we’ve selected one data field on the **X-axis** and one measure on the **Y-axis**.```

:::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-service-step-2.png" alt-text="Screenshot of the Data pane highlighted, along with selected fields and the axes containing data fields also highlighted.":::

1. To customize your column chart, select the **Format visual** icon in the **Visualizations pane**, where you can select the Visual tab and the General tab to access an array of formatting options. This allows you to tailor the chart's appearance and functionality to your specific requirements.

:::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-service-step-3.png" alt-text="Screenshot of the Visualizations pane highlighted, along with Format visual icon, the Visual and General tabs, and both the Legend and Ribbons sections, also highlighted.":::

You've now successfully created a column chart with Power BI Service. Take some time to familiarize yourself with all the available **Format settings for column charts** in the **Related content** section below.

## Considerations and technical aspects

### Considerations

- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod in pellentesque massa placerat duis ultricies lacus.
- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod in pellentesque massa placerat duis ultricies lacus.

### Technical aspects

- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod in pellentesque massa placerat duis ultricies lacus.
- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod in pellentesque massa placerat duis ultricies lacus.

## Related content

* [Format settings for column charts](power-bi-visualization-column-charts-format-settings.md)
* [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
