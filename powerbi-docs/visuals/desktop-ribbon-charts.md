---
title: Use ribbon charts in Power BI
description: Learn how to create and consume ribbon charts in the Power BI Desktop.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/11/2023
ms.custom: sample-retailanalysissample
LocalizationGroup: Visualizations
---
# Create ribbon charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

You can create ribbon charts to visualize data, and quickly discover which data category has the highest rank (largest value). Ribbon charts are effective at showing rank change, with the highest range (value) always displayed on top for each time period. 

:::image type="content" source="media/desktop-ribbon-charts/ribbon-charts-01.png" alt-text="Screenshot that shows a ribbon chart with data for Audio, Cell phones, and other categories displayed by year and quarter.":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Prerequisites

Review the following prerequisites for using ribbon charts in Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. At the top left, select **File** > **Open report**.

1. Find your copy of the **Retail Analysis Sample PBIX** file, and select **Open**.

   The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Retail Analysis Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, locate the **Retail Analysis Sample**. Select the sample to download.

   The **Retail Analysis Sample** opens in report view.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-retail-analysis-sample.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="media/desktop-ribbon-charts/power-bi-retail-analysis-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

## Create a ribbon chart

1. To create a ribbon chart, select **Ribbon chart** from the **Visualizations** panel.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-visualizations-select-ribbon-chart.png" alt-text="Screenshot that shows how to select the ribbon chart visualization in Power BI." border="false":::

   Ribbon charts connect a category of data over the visualized time continuum by using ribbons. This visualization lets you see how a given category ranks throughout the span of the chart's x-axis (usually the timeline).

1. On the **Data** panel, select the sample data to use for the **X-axis**, **Legend**, and **Y-axis** in the chart.

   1. Expand **Store** and select **OpenDate**. Under **OpenDate**, make sure **Data Hierarchy** is selected.

      The sample dataset contains data for one year only, so we can remove the **Year** and **Quarter** data from the **X-axis**.

      - On the **Visualizations** panel, for the chart **X-axis**, under **OpenDate**, make sure only **Month** and **Day** are selected. 

   1. Expand **Sales**, expand **This Year Sales**, and then select **Value**.

   1. Expand **Item** and select **Category**.

   The following image shows the selected items in the **Data** panel and the modified **Visualizations** panel fields for the ribbon chart.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-ribbon-values.png" alt-text="Screenshot that shows the selected Data items and modified Visualization fields for the ribbon chart." border="false":::

1. The ribbon chart shows rank for every month.

    :::image type="content" source="media/desktop-ribbon-charts/power-bi-ribbon.png" alt-text="Screenshot that shows the newly created ribbon chart with monthly data about the Home category." border="false":::

In the chart, notice how rank changes across time. For example, the rank of the Home category moves from second to fifth from February to March during the year.

## Format a ribbon chart

When you create a ribbon chart, you have formatting options available in the **Format** section of the **Visualizations** pane. The formatting options for ribbon charts are similar to the options for a stacked column chart, but there are a few options that are specific to the ribbons.

:::image type="content" source="media/desktop-ribbon-charts/power-bi-format-ribbon.png" alt-text="Screenshot that shows the formatting options for the ribbon chart visualization." border="false":::

Here are some of the formatting options you can adjust for the ribbon chart:

- **Spacing** lets you adjust how much space appears between ribbons. The number is the percentage of the column's maximum height.
- **Match series color** allows you to match the color of the ribbons with the series color. When the value is set to **off**, ribbons are gray.
- **Transparency** specifies how transparent the ribbons are, with the default set to 30.
- **Border** lets you place a dark border on the top and bottom of the ribbons. By default, borders are off.

Because the ribbon chart doesn't have y-axis labels, you might want to add data labels. In the Format section, select **Data labels**. 

:::image type="content" source="media/desktop-ribbon-charts/power-bi-labels.png" alt-text="Screenshot that shows formatting options for data labels in Power BI." border="false":::

Set formatting options for your data labels. In this example, we set the text color to white and display units to thousands.

:::image type="content" source="media/desktop-ribbon-charts/power-bi-data-labels.png" alt-text="Screenshot that shows the final formatted ribbon chart." border="false":::

## Next steps

- Learn how to [scatter charts and bubble charts in Power BI](power-bi-visualization-scatter.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
