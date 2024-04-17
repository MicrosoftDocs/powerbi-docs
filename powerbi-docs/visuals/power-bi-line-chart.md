---
title: Create line charts in Power BI
description: Learn how to use line charts in Power BI.
author: miguelmyersMS
ms.author: miguel.myers
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 07/14/2023
ms.custom: sample-Sales-and-Marketing
LocalizationGroup: Visualizations
---

# Create line charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A line chart is a series of data points that are represented by dots and connected by straight lines. A line chart can have one or many lines. Line charts have an x and a y axis. Here's an example: 

:::image type="content" source="media/power-bi-line-charts/power-bi-line.png" alt-text="Screenshot that shows a simple line chart.":::

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Sales and Marketing Sample to create a line chart that displays sales by category.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix) to your desktop.

2. In Power BI Desktop, select **File** > **Open report**.

3. Browse to and select the **Sales and Marketing Sample PBIX** file, and then select **Open**.

4. The **Sales and Marketing Sample PBIX** file opens in report view.
 
5. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-line-charts/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Sales and Marketing Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

2. Select **Learn** in the navigation pane.

3. On the **Learning center** page, under **Sample reports**, locate and select the **Sales and Marketing Sample** to download it.

   The **Sales and Marketing Sample** opens in report view:

   :::image type="content" source="media/power-bi-line-charts/sales-marketing-sample.png" alt-text="Screenshot that shows the Sales and Marketing Sample open in report view in the Power BI service." lightbox="media/power-bi-line-charts/sales-marketing-sample.png" border="false":::

4. At the top, select **Edit** to display the **Visualizations** pane.

5. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-line-charts/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses or the report needs to be saved in Premium capacity.

## Create a line chart

1. In the **Data** pane, expand **SalesFact** and select the checkbox next to **Total units**. Then expand **Date** and select the checkbox next to **Month**. Power BI creates a column chart on your report canvas:

    :::image type="content" source="media/power-bi-line-charts/line-chart-1.png" alt-text="Screenshot that shows the Data pane with data fields selected.":::

2. Convert the chart to a line chart by selecting the **Line chart** icon in the **Visualizations** pane:

    :::image type="content" source="media/power-bi-line-charts/line-chart-2.png" alt-text="Screenshot that shows the converted chart.":::

3. Filter your line chart to show data for the years 2012-2014. If the **Filters** pane is collapsed, expand it. Drag the **Year** field from the **Data** pane to the **Filters** pane. Drop it under the heading **Filters on this visual**:

    :::image type="content" source="media/power-bi-line-charts/line-chart-3.png" alt-text="Screenshot that shows the Filters pane with filters added.":::

    Change **Advanced filtering** to **Basic filtering** and then select **2012**, **2013**, and **2014**.

    :::image type="content" source="media/power-bi-line-charts/power-bi-filter-year.png" alt-text="Screenshot that shows the Basic filtering list.":::

4. Optionally, [adjust the size and color of the chart's title](power-bi-visualization-customize-title-background-and-legend.md). 

    :::image type="content" source="media/power-bi-line-charts/line-chart-5.png" alt-text="Screenshot that shows an adjusted title.":::

## Add lines to the chart

Line charts can display multiple lines. In some cases, the values on the lines are so different that the lines don't display well together. In this section, you add lines to the chart and learn how to format the chart when the values represented by the lines are different enough to cause display problems.

### Add lines

Instead of looking at total units for all regions as a single line on the chart, you can split out total units by region. Add lines by dragging **Geo** > **Region** to the chart. Here's what it looks like after you add lines:

   :::image type="content" source="media/power-bi-line-charts/line-chart-6.png" alt-text="Screenshot that shows the chart with added lines.":::

### Use two y axes

What if you want to look at total sales and total units on the same chart? Sales numbers are much higher than unit numbers, so the chart becomes unusable. In fact, the red line for total units appears to be at zero:

:::image type="content" source="media/power-bi-line-charts/power-bi-diverging.png" alt-text="Screenshot that shows how using a single y axis displays the total units as flat.":::

To display highly diverging values on one chart, you can use a combo chart. For more information, see [Combo charts in Power BI](power-bi-visualization-combo-chart.md). In the following example, a second y axis is added so we can show sales and total units together on one chart. The new axis is on the right side of the chart.  

:::image type="content" source="media/power-bi-line-charts/power-bi-dual-axes.png" alt-text="Screenshot that shows the sales values as a bar chart with the y axis on the left and the total units as a line chart with the y axis on the right.":::

## Highlighting and cross-filtering

For information about using the **Filters** pane, see [Add a filter to a report](../create-reports/power-bi-report-add-filter.md).

Selecting a data point on a line chart cross-highlights and cross-filters the other visualizations on the report page, and vice versa. To see an example, start by selecting the **Market Share** tab.  

On a line chart, a single data point is the intersection of a point on the x axis and the y axis. When you select a data point, Power BI adds markers that indicate which point (for a single line) or points (if there are two or more lines) are the source for the cross-highlighting and cross-filtering of the other visuals on the report page. If your visual is complex, Power BI selects the closest point to the location you select on the visual.

In the following example, we selected a data point that corresponds to: 
- July 2014
- % Units Market Share of 34.74 
- % Units Market Share R12M of 33.16 

:::image type="content" source="media/power-bi-line-charts/line-chart-7.png" alt-text="Screenshot that shows the results of selecting a data point on a line chart.":::

Notice how the column charts at the top and bottom are cross-highlighted, and the chart in the middle is cross-filtered.

For more information, see [Filters and highlighting in Power BI reports](../create-reports/power-bi-reports-filters-and-highlighting.md).

## Considerations and troubleshooting

* One line chart can't have dual y axes. You need to use a combo chart if you want two y axes.
* In the preceding examples, you can see charts that are formatted with increased font sizes, changed font colors, added axis titles, centered chart titles and legends, axes that start at zero, and more. The **Visualizations** > **Format** pane, which you get to by selecting the image that shows a paint brush (:::image type="icon" source="media/power-bi-line-charts/format-icon.png":::), provides many options for making your charts look the way you want them to. The best way to learn about them is to open the **Format** pane and explore.

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)