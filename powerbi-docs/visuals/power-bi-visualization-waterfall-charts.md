---
title: Waterfall charts in Power BI
description: Learn how to create and configure waterfall charts in the Power BI service and Power BI Desktop.
author: miguelmyersMS
ms.author: miguel.myers
ms.reviewer: 'mihart'
featuredvideoid: removed
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 03/19/2024
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Waterfall charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Waterfall charts show a running total as Power BI adds and subtracts values. These charts are useful for understanding how an initial value (like net income) is affected by a series of positive and negative changes.

Each measure of change is a column on the chart. The columns are color coded so you can quickly notice increases and decreases across the data. 

The initial and final value columns are often configured to [always start from the horizontal axis](https://support.microsoft.com/office/create-a-waterfall-chart-8de1ece4-ff21-4d37-acd7-546f5527f185#bkmk_float). The intermediate values are floating columns. A starting point for an intermediate column can be on the horizontal axis or on another axis parallel to the main axis. 

The position of the intermediate columns can fluctuate between the initial and final values. The resulting view creates a picture similar to a concave or convex wave or a random waterfall cascade. Waterfall charts are also called _bridge charts_.

:::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-chart.png" alt-text="Screenshot that shows an example of a waterfall chart in Power BI." border="false":::

## When to use waterfall charts

Waterfall charts are a great choice for many scenarios:

- Represent changes for a measure across time, a series, or different categories.

- Audit major changes that contribute to a total value.

- Plot your company's annual profit by showing various sources of revenue and arrive at the total profit (or loss).

- Illustrate the beginning and ending headcount for your company in a year.

- Visualize how much money you earn and spend each month, and the running balance for your account.

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses. If both parties don't have individual Power BI Pro licenses, the report needs to be saved in Premium capacity to enable sharing. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

* When you want to visualize the steps and relationships of business processes.

* When you want to monitor and control data quality.

* When you want to visualize and track the progress of project steps.

* To analyze data defects and identify their causes.

* To understand the workings of the organization and the connections between departments.

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

1. Select **Learn** in the navigation pane.

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

   This action exposes the **Category** and **Breakdown** sections on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-convert-to-waterfall.png" alt-text="Screenshot that shows how to select the waterfall chart visualization in Power BI." border="false":::

1. On the **Data** pane, expand **Time** and select the **FiscalMonth** checkbox.

   Power BI updates the waterfall chart with the data in the FiscalMonth category. The initial view of the category data shows the values in ascending order.
   
   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-add-fiscal-month.png" alt-text="Screenshot that shows the total Sales Variance by FiscalMonth waterfall chart." border="false":::

## Sort the waterfall chart

When Power BI creates the waterfall chart, the data is displayed in ascending or chronological order for the category. In our example, the data is sorted by month in ascending order, January to August, for the FiscalMonth category.

You can change the sort order to view different perspectives of the data.

1. On the *Total Sales Variance* chart, select **More options (...)** > **Sort axis** > **FiscalMonth**.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-sort-by-fiscal-month.png" alt-text="Screenshot that shows how to configure sort axis settings for the waterfall chart." border="false":::
   
   This action changes the sort order of the FiscalMonth category to *descending* by month. Notice that August has the largest variance and January has the smallest variance.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-sort-fiscal-month-options.png" alt-text="Illustration that compares the waterfall charts for FiscalMonth data in descending and ascending sort order." lightbox="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-sort-fiscal-month-options.png"  border="false":::

1. Open the **More options (...)** > **Sort axis** menu.

   Notice the checkmark next to **FiscalMonth** and **Sort descending**. A checkmark appears next to options represented in the chart visualization.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-selected-sort-axis.png" alt-text="Screenshot that shows check marks next to the selected sort items for the waterfall chart." border="false":::

1. On the **More options (...)** > **Sort axis** menu, select **Total Sales Variance**.

   This action changes the sort from the FiscalMonth category to the Total Sales Variance. The chart updates to show the Total Sales Variance data in descending order. In this view, the month of March has the largest positive variance and July has the largest negative variance.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-sort-total-variance.png" alt-text="Illustration that shows the waterfall chart for the Total Sales Variance data over time in descending order." border="false":::

1. On the **More options (...)** > **Sort axis** menu, change the sort back to **FiscalMonth** and **Sort ascending**.

## Explore the waterfall chart

Let's take a closer look at the data to see what's contributing most to the changes from month to month.

1. On the **Data** pane, expand **Store** and select the **Territory** checkbox.

   This action adds a corresponding **Breakdown** field on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-add-territory.png" alt-text="Screenshot that shows the effect of adding the Territory data to the waterfall chart." border="false":::

1. Expand the width of the waterfall chart to see more of the data.

   Power BI uses the **Territory** value in the **Breakdown** section to add more data to the visualization. The chart now includes the top five contributors to increases or decreases for each fiscal month. Notice the month of February now has six data points instead of only one.  

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-expanded.png" alt-text="Screenshot that shows an expanded view of the waterfall chart with the extra Territory data." border="false":::

   Let's say you're only interested in the top two contributors. You can configure the chart to highlight that information.

1. On the **Visualizations > Format visual** pane, select **Breakdown**, and set the **Maximum breakdowns** value to **2**.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-breakdown-two.png" alt-text="Screenshot that shows the effect of changing the maximum breakdowns to two in the waterfall chart." border="false":::

   The updated chart reveals Ohio (OH) and Pennsylvania (PA) as the top two territories that are the largest contributors to increases and decreases.

   :::image type="content" source="media/power-bi-visualization-waterfall-charts/power-bi-waterfall-two-contributors.png" alt-text="Screenshot of the waterfall chart that reveals Ohio and Pennsylvania as the territories that are the largest contributors.":::

## Related content

- [Change how visuals interact](../create-reports/service-reports-visual-interactions.md) in a Power BI report.
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
