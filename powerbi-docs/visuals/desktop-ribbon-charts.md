---
title: Use ribbon charts in Power BI
description: Learn how to create and consume ribbon charts in the Power BI Desktop.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'kfollis'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/25/2023
ms.custom: sample-retailanalysissample
LocalizationGroup: Visualizations
---
# Create ribbon charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

You can create ribbon charts to visualize data and quickly discover which data category has the highest rank (largest value). A ribbon illustrates how the value of a data category changes over a visualized time period. The ribbon connects the category values across the time continuum so you can easily see when there's an increase or decrease. When the ribbon is large, it means the category value is larger at that time than at other periods within the continuum.

A ribbon chart combines ribbons for multiple categories into a single view. This visualization lets you see how a given category ranks throughout the span of the chart's X-axis (usually the timeline) compared to other categories.

Ribbon charts are effective at showing how rank can change. The ribbon for the highest rank (value) is always displayed on top of the other ribbons for each time period. The following image illustrates this visualization:

:::image type="content" source="media/desktop-ribbon-charts/ribbon-charts-01.png" alt-text="Screenshot that shows a ribbon chart with data for Audio, Cell phones, and other categories displayed by year and quarter. The category with the highest rank is ":::

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses. If both parties don't have individual Power BI Pro licenses, the report needs to be saved in Premium capacity to enable sharing. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Prerequisites

Review the following prerequisites for using ribbon charts in Power BI Desktop or the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample PBIX file.

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Retail Analysis Sample PBIX** file, and then select **Open**.

   The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Retail Analysis Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Retail Analysis Sample** to download it. The sample opens in report view.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-retail-analysis-sample.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="media/desktop-ribbon-charts/power-bi-retail-analysis-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

## Create a ribbon chart

The following steps create a ribbon chart to illustrate the rank for categories in _This Year Sales_ data for every month.

1. To create a ribbon chart, select **Ribbon chart** on the **Visualizations** pane.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-visualizations-select-ribbon-chart.png" alt-text="Screenshot that shows how to select the ribbon chart visualization in Power BI.":::

1. Select the sample data to use for the **X-axis**, **Legend**, and **Y-axis** in the chart.

   1. On the **Data** pane, expand **Store** and select **OpenDate**. Under **OpenDate**, make sure the **Data Hierarchy** checkbox is selected.

   1. On the **Visualizations** pane, for the chart **X-axis**, make sure only the **Month** and **Day** fields are listed under **OpenDate**.
   
      The sample semantic model contains data for one year only, so we can remove the **Year** and **Quarter** data from the **X-axis**.

   1. On the **Data** pane, expand **Sales**, expand **This Year Sales**, and then select the **Value** checkbox.

   1. On the **Data** pane, expand **Item** and select the **Category** checkbox.

   The following image shows the selected fields in the **Data** pane and the modified fields in the **Visualizations** pane for the ribbon chart.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-ribbon-values.png" alt-text="Screenshot that shows the selected Data fields and modified fields in the Visualization for the ribbon chart.":::

1. The new ribbon chart shows the rank for This Year Sales for every month:

    :::image type="content" source="media/desktop-ribbon-charts/power-bi-ribbon.png" alt-text="Screenshot that shows the newly created ribbon chart with monthly data about the Home category." border="false":::

Notice how the ribbons reveal how rank changes over time. For example, the rank of the Home category moves from second to fifth place from February to March during the year.

## Format a ribbon chart

You can modify the presentation of a ribbon chart with the configuration options in the **Format** section of the **Visualizations** pane. The formatting options for ribbon charts are similar to the options for a stacked column chart. There are a few formatting options that are specific to ribbons.

:::image type="content" source="media/desktop-ribbon-charts/power-bi-format-ribbon.png" alt-text="Screenshot that shows the formatting options for the ribbon chart visualization." border="false":::

Here are some of the formatting options you can adjust for the ribbon chart:

- **Spacing** lets you adjust how much space appears between ribbons. The number is the percentage of the column's maximum height.
- **Match series color** allows you to match the color of the ribbons with the series color. When the value is set to **off**, ribbons are gray.
- **Transparency** specifies how transparent the ribbons are. The default level is 30.
- **Border** lets you place a dark border on the top and bottom of the ribbons. By default, borders are off.

Because the ribbon chart doesn't have Y-axis labels, you might want to add data labels. In the **Format** section, select **Data labels**. 

:::image type="content" source="media/desktop-ribbon-charts/power-bi-labels.png" alt-text="Screenshot that shows formatting options for data labels in Power BI." border="false":::

Set formatting options for your data labels. In this example, we set the text color to white and display units to thousands.

:::image type="content" source="media/desktop-ribbon-charts/power-bi-data-labels.png" alt-text="Screenshot that shows the final formatted ribbon chart." border="false":::

## Related content

- Create [scatter charts and bubble charts in Power BI](power-bi-visualization-scatter.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
