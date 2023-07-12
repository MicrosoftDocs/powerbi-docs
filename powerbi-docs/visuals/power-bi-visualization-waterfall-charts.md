---
title: Waterfall charts in Power BI
description: Learn how to create and configure waterfall charts in the Power BI service and Power BI Desktop.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: removed
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/12/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Waterfall charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Waterfall charts show a running total as Power BI adds and subtracts values. These charts are useful for understanding how an initial value (like net income) is affected by a series of positive and negative changes.

The columns are color coded so you can quickly notice increases and decreases. The initial and final value columns often [start on the horizontal axis](https://support.microsoft.com/office/create-a-waterfall-chart-8de1ece4-ff21-4d37-acd7-546f5527f185#bkmk_float), while the intermediate values are floating columns. Because of this style, waterfall charts are also called _bridge charts_.

:::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-chart.png" alt-text="Screenshot that shows an example of a waterfall chart in Power BI." border="false":::

## When to use waterfall charts

Waterfall charts are a great choice for many scenarios:

- Represent changes for a measure across time, a series, or different categories.

- Audit major changes that contribute to a total value.

- Plot your company's annual profit by showing various sources of revenue and arrive at the total profit (or loss).

- Illustrate the beginning and ending headcount for your company in a year.

- Visualize how much money you earn and spend each month, and the running balance for your account.

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses or the report needs to be saved in Premium capacity. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Prerequisites

Review the following prerequisites for using waterfall charts in Power BI Desktop or the Power BI service.

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

1. Select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Retail Analysis Sample** to download it. The sample opens in report view.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-retail-analysis-sample.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="media/power-bi-visualization-waterfall-charts/power-bi-retail-analysis-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

## Create a waterfall chart

The following steps create a waterfall chart to display sales variance (estimated sales versus actual sales) by month.

1. On the **Data** pane, expand **Sales** and select the **Total Sales Variance** checkbox. By default, Power BI presents the data as a clustered column chart.

   This action configures the *Total Sales Variance* data as the **Y-axis** for the chart on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-select-total-sales-variance.png" alt-text="Screenshot that shows the Total Sales Variance checkbox selected and the default chart visual created by Power BI." border="false":::

1. To convert the visualization into a waterfall chart, select **Waterfall chart** on the **Visualizations** pane. 

   This action exposes the **Category** and **Breakdown** options on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-convert-to-waterfall.png" alt-text="Screenshot that shows how to select the waterfall chart visualization in Power BI." border="false":::

1. On the **Data** pane, expand **Time** and select the **FiscalMonth** checkbox.

   This action adds a corresponding **Category** on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-add-fiscal-month.png" alt-text="Screenshot that shows the total Sales Variance by FiscalMonth waterfall chart." border="false":::

## Sort the waterfall chart

You can configure the waterfall chart to ensure Power BI sorts the data chronologically by month.

1. On the *Total Sales Variance* chart, select **More options (...)** > **Sort axis** > **FiscalMonth**.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-sort-by-fiscal-month.png" alt-text="Screenshot that shows how to configure sort axis settings for the waterfall chart." border="false":::
   
   This option sorts the **FiscalMonth** category values on the chart in *descending* order alphabetically.

1. Open the **More options (...)** > **Sort axis** menu again.

   Notice the checkmark next to **FiscalMonth** and **Sort descending**. When a checkmark appears next to a menu option, the chart presentation includes the selected option.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-selected-sort-axis.png" alt-text="Screenshot that shows check marks next to the selected sort items for the waterfall chart." border="false":::

1. On the **More options (...)** > **Sort axis** menu, select **Sort ascending**.

   The chart presentation updates to show the months in ascending or chronological order, January to August.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-ascending.png" alt-text="Screenshot that shows how to change the waterfall chart sort axis to ascending order." border="false":::


## Explore the waterfall chart

Dig in a little more to see what's contributing most to the changes month to month.

1. On the **Data** pane, expand **Store** and the select the **Territory** checkbox.

   This action adds a corresponding **Breakdown** field on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown.png" alt-text="Screenshot that shows adding Territory to the Breakdown area.":::

   Power BI uses the **Territory** value in **Breakdown** to add more data to the visualization. It adds the top five contributors to increases or decreases for each fiscal month. The month of February now has six data points instead of only one.  

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown-default.png" alt-text="Screenshot of Territory field added to the Breakdown bucket.":::

   Let's say you're only interested in the top two contributors. You can configure the chart to highlight that information.

1. In the **Visualizations > Format** pane, select **Breakdown**, and set the **Maximum breakdowns** value to **2**.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown-two.png" alt-text="Screenshot of Max Breakdowns set to two breakdowns.":::

   A quick review reveals that the territories of Ohio and Pennsylvania are the biggest contributors to increases and decreases in your waterfall chart.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-axis-waterfall.png" alt-text="Screenshot of waterfall chart with territories that are the biggest contributors highlighted.":::

## Next steps

- [Change how visuals interact](../create-reports/service-reports-visual-interactions.md) in a Power BI report.
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
