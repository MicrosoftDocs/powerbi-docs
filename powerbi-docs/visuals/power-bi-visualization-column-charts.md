---
title: Create a column chart in Power BI
description: This tutorial explains column charts and how to build them in Power BI Desktop and Power BI Service.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidiseminger
ms.custom: sample-Retail-Analysis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 09/23/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about column charts so that I can effectively and more easily build column chart visuals in Power BI Desktop and Power BI Service.
---
# Create a column chart in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Overview

A column chart, commonly referred to as a vertical bar graph, is a visual tool utilized to display and compare numerical data across different categories. Each column within the chart corresponds to a specific category, with the height of the column proportionally representing the associated value. This design facilitates an intuitive comparison of values across various categories or over distinct time periods. Column charts are frequently employed in the realms of business and finance to illustrate key financial metrics, including revenue, expenses, and profits. Additionally, they serve as a valuable asset in marketing for the depiction of data points such as sales figures, market share, and customer demographics.

The guide illustrated in this article provides a step-by-step walkthrough for constructing a column chart visual, encompassing both the Power BI Desktop and Power BI Service platforms.

Depending on the unique needs of your analysis, you can choose from three distinct types of column charts:

- **Stacked column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/stacked-column-chart-icon.png":::
- **Clustered column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/clustered-column-chart-icon.png":::
- **100% Stacked column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/100-percent-stacked-column-chart-icon.png":::

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

[!INCLUDE [prerequisites-desktop-download-latest-version-pbi-desktop](../includes/core-visuals/prerequisites-desktop-download-latest-version-pbi.md)]
[!INCLUDE [prerequisites-desktop-preview-features-on-object-unselected](../includes/core-visuals/prerequisites-desktop-preview-features-on-object-unselected.md)]
[!INCLUDE [prerequisites-desktop-download-retail-analysis-sample-pbix](../includes/core-visuals/prerequisites-desktop-download-retail-analysis-sample-pbix.md)]

# [Power BI service](#tab/powerbi-service)

[!INCLUDE [prerequisites-service-open-retail-analysis-sample-pbix](../includes/core-visuals/prerequisites-service-open-retail-analysis-sample-pbix.md)]

---

> [!NOTE]
> [!INCLUDE [prerequisites-share-your-report](../includes/core-visuals/prerequisites-share-your-report.md)]

## Create a column chart

# [Power BI Desktop](#tab/powerbi-desktop)

Before we begin, if you haven't already done so, refer to the **[Prerequisites](#prerequisites)** section above, and follow the steps under the tab for **Power BI Desktop**.

For this example, let’s create a column chart starting from the Visualizations pane in Power BI Desktop.

1. From the **Visualizations** pane, select any **Column chart** icon, and a visual placeholder is immediately added to the canvas.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-desktop-step-1.png" alt-text="Screenshot of the Visualizations pane highlighted, along with the Build visual icon and the three Column chart icons also highlighted.":::

2. To add data to your column chart, simply open the **Data pane** and expand the Sales dropdown to select the desired fields or measures.

   NOTE:  Any one of the following combinations are required to create column charts:
   - A minimum of one data field on the **X-axis** and one measure on the **Y-axis**, or
   - At least one data field on the **X-axis**, one measure on the **Y-axis**, and precisely one data field in the **Legend**, or
   - One or more data fields on the **X-axis** and multiple measures on the **Y-axis**, keeping in mind that column charts with multiple measures don’t support a **Legend**.

   The specific combination you choose depends on the data you’re working with, and the insights you want to glean from your chart. As a visual guide, in the example below, we’ve selected one data field on the **X-axis** and one measure on the **Y-axis**.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-desktop-step-2.png" alt-text="Screenshot of the Data pane highlighted, along with selected fields and the axes containing data fields are also highlighted.":::

3. To customize your column chart, select the **Format icon** in the **Visualizations Pane**, to reveal the **Format pane**, granting you access to all available formatting options under the **Visual** tab and the **General** tab. This allows you to tailor the chart's appearance and functionality to your specific requirements.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-desktop-step-3.png" alt-text="Screenshot of the Visualizations pane highlighted, along with Format visual icon, and both the Visual tab and General tab, also highlighted.":::

You've now successfully created a column chart with Power BI Desktop. Take some time to familiarize yourself with all the available **[Format settings for column charts](power-bi-visualization-column-chart-format-settings.md)** in the **[Related content](#related-content)** section below.

# [Power BI service](#tab/powerbi-service)

Before we begin, if you haven't already done so, refer to the **[Prerequisites](#prerequisites)** section above, and follow the steps under the tab for **Power BI service**.

For this example, let’s create a column chart starting from the **Visualizations pane** in **Power BI service**.

1. To create your column chart, we'll start in the **Visualizations pane**. With the **Build visual** icon selected, choose any **Column chart** icon, and a visual placeholder is added to the canvas.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-service-step-1.png" alt-text="Screenshot of the Visualizations pane, with Build visual icon highlighted, and the three Column chart icons also highlighted.":::

2. To add data to your column chart, simply choose fields and measures from the **Data pane**. This is done by selecting data from within the **Data pane** itself, or dragging them to the field wells within the **Visualizations pane**, or dragging directly to the placeholder on the canvas.

   NOTE:  Any one of the following combinations is required to create column charts:
   - A minimum of one data field on the **X-axis** and one measure on the **Y-axis**, or
   - At least one data field on the **X-axis**, one measure on the **Y-axis**, and precisely one data field in the **Legend**, or
   - One or more data fields on the **X-axis** and multiple measures on the **Y-axis**, keeping in mind that column charts with multiple measures don’t support a **Legend**.

   The specific combination you choose depends on the data you’re working with and the insights you want to glean from your chart. As a visual guide, in the example below, we’ve selected one data field on the **X-axis** and one measure on the **Y-axis**.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-service-step-2.png" alt-text="Screenshot of the Data pane highlighted, along with selected fields and the axes containing data fields also highlighted.":::

3. To customize your column chart, select the **Format visual** icon in the **Visualizations pane**, where you can select the Visual tab and the General tab to access an array of formatting options. This allows you to tailor the chart's appearance and functionality to your specific requirements.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/build-column-chart-service-step-3.png" alt-text="Screenshot of the Visualizations pane highlighted, along with Format visual icon, the Visual and General tabs, and both the Legend and Ribbons sections, also highlighted.":::

You've now successfully created a column chart with Power BI Service. Take some time to familiarize yourself with all the available **[Format settings for column charts](power-bi-visualization-column-chart-format-settings.md)** in the **[Related content](#related-content)** section below.
---

## Related content

* [Format settings for column charts](power-bi-visualization-column-chart-format-settings.md)
* [Considerations and limitations for column charts](power-bi-visualization-column-charts-considerations.md)
* [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
* [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
