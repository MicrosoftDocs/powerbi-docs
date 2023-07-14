---
title: Treemaps in Power BI
description: Learn how to create and configure treemaps in the Power BI service and Power BI Desktop.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/14/2023
ms.custom: sample-retailanalysissample
LocalizationGroup: Visualizations
---

# Treemaps in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Treemaps display hierarchical data as a set of nested rectangles. Each level of the hierarchy is represented by a colored rectangle called a _branch_ node. Each branch contains smaller rectangles called _leaf_ nodes. Power BI uses the measure value to determine the rectangle size for branches and leaves.

The rectangles are arranged by size with the largest branch node at the top left and the smallest branch at the bottom right. The arrangement of the leaf nodes within each branch follows the same order.

Consider a scenario where you need to analyze clothing sales data. You want to track product sales by clothing type and manufacturer. The branch nodes can represent the clothing categories: **Urban**, **Rural**, **Youth**, and **Mix**. The leaves can represent the clothing manufacturer data for products sold in each clothing category. The leaf nodes are sized and shaded based on the number of products sold.

The treemap represents the product sales hierarchy by clothing type and then by manufacturer. 

:::image type="content" source="media/power-bi-visualization-treemaps/power-bi-treemap-overview.png" alt-text="Screenshot of a treemap that shows the hierarchy of product sales values by clothing type and manufacturer." border="false":::

The largest branch node is for **Urban** clothing and the smallest branch is for **Youth**. Within each branch, the leaf nodes reveal the popularity of each manufacturer.

Let's look at some of the visualization details:

- **Urban** clothing has the highest sales and **Youth** has the lowest.

- The most popular manufacturer of **Urban** clothing is **VanArsdel**. **Natura** and **Fama** are slightly less popular.

- There are similar product sales for **Mix** and **Youth** clothing.

- Across the four clothing types, clothes manufactured by **Natura** and **Aliqui** produce the best sales.

- **Salvus** yields fairly strong sales for **Youth** clothing, but the manufacturer isn't producing noticeable sales in other categories. 

You can compare the number of products sold across the clothing categories by comparing the size and shading of each leaf node. Larger and darker-shaded rectangles (nodes) indicate higher value.

## When to use a treemap

Treemaps are a great choice for many scenarios:

- Display large amounts of hierarchical data.

- Present a large number of values that can't be effectively shown with a bar chart.

- Illustrate the proportions between each part and the whole.

- Reveal the measure distribution pattern across each level of categories in the hierarchy.

- Show attributes by using size and color coding.

- Identify patterns, outliers, most-important contributors, and exceptions.

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses or the report needs to be saved in Premium capacity. For more information, see [sharing reports](../collaborate-share/service-share-reports.md).

## Prerequisites

Review the following prerequisites for using treemaps in Power BI Desktop or the Power BI service.

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

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-retail-analysis-sample.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="media/power-bi-visualization-treemaps/power-bi-retail-analysis-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

## Create a basic treemap

The following steps create a report and treemap to display sales over time for different products.

1. On the **Data** pane, expand **Sales** and select the **Last Year Sales** checkbox. By default, Power BI presents the data as a clustered column chart.

   This action configures the *Last Year Sales* data as the **Y-axis** for the chart on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-select-total-sales-last-year.png" alt-text="Screenshot that shows the Last Year Sales checkbox selected and the default chart visual created by Power BI." border="false":::

1. To convert the visualization into a treemap, select **Treemap** on the **Visualizations** pane.

   This action exposes the **Category** and **Details** sections on the **Visualizations** pane. The *Last Year Sales* data becomes the **Values** for the chart on the **Visualizations** pane.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-convert-to-treemap.png" alt-text="Screenshot that shows how to convert the visual to a treemap." border="false":::  

1. On the **Data** pane, expand **Item** and select **Category**. 

   Power BI updates the treemap to show the size of the rectangles based on total sales by product. The rectangle color represents the product category. The hierarchy visually describes the relative size of total sales by product category. The **Men's** category has the highest sales and the **Hosiery** category has the lowest.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-treemap-add-item-category.png" alt-text="Screenshot that shows the updated treemap for total sales by product." border="false":::

1. On the **Data** pane, expand **Store** and select **Chain**. You can now compare last year's sales by category and store chain.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-treemap-add-store-chain.png" alt-text="Screenshot that shows the updated treemap for total sales by product and by store chain." border="false":::

   > [!NOTE]
   > The **Color Saturation** and **Details** features can't be used at the same time.

1. On the treemap, hover over **Fashions Direct** in the **090-Home** rectangle to see the tooltip for Fashion Direct's portion of the Home category.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-treemap-category-tooltip.png" alt-text="Screenshot that shows how to reveal tooltips for categories in a treemap." border="false":::

## Use highlighting and cross-filtering

When you highlight a **Category** or **Details** item in a treemap, Power BI cross-highlights and cross-filters the other visualizations on the report page.

For this exercise, you need at least one other visual on the report page with the treemap.

1. Select **File** > **Save** to save the report page with the treemap.

1. At the bottom, right-click the page tab and rename the page **Treemap**.

1. Switch to the **Overview** report page.

1. Right-click the top menu of the pie chart visual and select **Copy** > **Copy visual**.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-copy-visual.png" alt-text="Screenshot that shows how to copy a visual." border="false":::

1. Switch back to your **Treemap** report page.

1. Enter CTRL + V and paste the copy of the pie chart visual onto the page.

1. Select the top of the pie chart and move the visual so all visualizations on the page are fully visible.

Now you're ready to work with the visuals to try highlighting and cross-filtering.

1. Select the treemap to expose the contributing values on the **Visualizations** and **Data** panes.

1. In the treemap, select either a **Category** or a **Chain** within a **Category**.

   That action cross-highlights the other visualizations on the page. When you select **050-Shoes**, the visualization shows that last year's sales for shoes was **$15,658,108** with **Fashions Direct** accounting for **$2,193,016** of those sales.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-treemap-highlights.png" alt-text="Screenshot that demonstrates category and chain cross-highlighting for multiple visuals." border="false":::

1. In the pie chart, select the **Fashions Direct** slice to cross-filter the treemap.

   :::image type="content" source="media/power-bi-visualization-treemaps/power-bi-treemap-cross-filter.png" alt-text="Screenshot that demonstrates category and chain cross-filtering for multiple visuals." border="false":::

To manage how charts cross-highlight and cross-filter each other, see [Change how visuals interact in a Power BI report](../create-reports/service-reports-visual-interactions.md).


## Next steps

- Create [waterfall charts in Power BI](power-bi-visualization-waterfall-charts.md).
- Review [visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md).
