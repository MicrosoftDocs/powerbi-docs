---
title: Add Visualizations to a Power BI Report
description: Learn how to create and modify visualizations in a Power BI report.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 12/01/2025
ms.custom: sample-Sales-and-Marketing, sample-retailanalysissample
LocalizationGroup: Visualizations
ai-usage: ai-assisted
---

# Add Visualizations to a Power BI Report

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article explains how to create and modify visualizations in a Power BI report. You learn how to add visuals by selecting fields, change visualization types, and use drag-and-drop to customize your reports.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Sales and Marketing Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Sales and Marketing Sample PBIX** file, and then select **Open**.

   The **Sales and Marketing Sample PBIX** file opens in report view.

   :::image type="icon" source="media/power-bi-report-add-visualizations-i/power-bi-report-view.png" alt-text="Screenshot that shows a report view.":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-report-add-visualizations-i/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Sales and Marketing Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Sales and Marketing Sample** to download it.

1. The **Sales and Marketing Sample** opens in report view:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/sales-marketing-sample.png" alt-text="Screenshot that shows the Sales and Marketing Sample open in report view in the Power BI service." lightbox="media/power-bi-report-add-visualizations-i/sales-marketing-sample.png" border="false":::

1. At the top, select **Edit** to display the **Visualizations** pane.

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-report-add-visualizations-i/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

> [!NOTE]
> If you want to share your report with a colleague, you both need to have individual Power BI Pro or Premium Per User (PPU) licenses, or the report needs to be saved in Premium capacity or Fabric F64 or greater capacity. For more information, see [Share a filtered Power BI report](../collaborate-share/service-share-reports.md).

## Add visualizations by selecting fields

You can create a visualization by selecting a field from the **Data** pane. Power BI uses the type of field you select to determine which visualization type to use.

- Start with a numeric field like **SalesFact** > **Sales $**. Power BI creates a column chart that has a single column:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/add-visual-1.png" alt-text="Screenshot that shows a column chart with a single column." lightbox="media/power-bi-report-add-visualizations-i/add-visual-1.png":::

- Or start with a field like **Product** > **Category**. Power BI creates a table and adds that field to the **Columns** section:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/add-visual-2.png" alt-text="Screenshot that shows a table with four categories." lightbox="media/power-bi-report-add-visualizations-i/add-visual-2.png":::

- Or select the **Filled map** button and then select a geography field, like **Geo** > **City**. Power BI and Bing Maps create a map visualization:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/add-visual-3.png" alt-text="Screenshot that shows a map visualization." lightbox="media/power-bi-report-add-visualizations-i/add-visual-3.png":::

## Change the visualization type

You can create a visualization and then change its type using the **Visualizations** pane.

1. On a new page, select **Product** > **Category** and then **Product** > **Count of Product** to add both fields to the **Columns** section:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/change-type-1.png" alt-text="Screenshot that shows the Data pane with the fields selected." lightbox="media/power-bi-report-add-visualizations-i/change-type-1.png":::

1. Change the visualization to a column chart by selecting the **Stacked column chart** button on the **Visualizations** pane:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/change-type-2.png" alt-text="Screenshot that shows the Stacked column chart button." lightbox="media/power-bi-report-add-visualizations-i/change-type-2.png":::

1. To change the way the visual is sorted, select **More options** (...) and then **Sort axis** on the chart. Use the menu options to change the direction of the sort axis (ascending or descending) or to change the column that's being sorted on:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/change-type-3.png" alt-text="Screenshot that shows the More options list." lightbox="media/power-bi-report-add-visualizations-i/change-type-3.png":::

## Use drag-and-drop to create visualizations

You can also use drag-and-drop with the **Data** and **Visualizations** panes to create and modify visualizations. Keep in mind that not all visualizations can display all data types. For example, geographic data doesn't display well in a funnel chart or line chart.

### Create an area chart comparing sales data

1. In the **Data** pane, expand **Sales** and select the **Last Year Sales** checkbox. Then expand **This Year Sales** and select the **Value** checkbox. Power BI creates a column chart:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/compare-1.png" alt-text="Screenshot that shows a column chart.":::

1. In the **Data** pane, expand **Time** and drag **FiscalMonth** to the **X-axis** area of the **Visualizations** pane. You can now see comparisons by month:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/compare-2.png" alt-text="Screenshot that shows a column chart with FiscalMonth as the axis.":::

1. To change the visualization type, in the **Visualizations** pane, select the **Area chart** button. To decide which type to use, see [descriptions of each, tips for best practices, and tutorials](power-bi-visualizations-overview.md):

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/compare-3.png" alt-text="Screenshot that shows the Area chart button.":::

1. Sort the visualization by selecting **More options** (...) at the top of the chart and then selecting **Sort axis** > **FiscalMonth**:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/compare-4.png" alt-text="Screenshot that shows the More options menu.":::

1. [Resize the visualization](power-bi-visualization-move-and-resize.md) by selecting it and dragging one of the frame handles:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/pbi_part2_7b.png" alt-text="Screenshot that shows the area chart visualization.":::

### Create a map visualization

1. In the **Data** pane, expand **Store** and select **Territory**. Power BI recognizes that **Territory** is a location and creates a map visualization. Drag **Total Stores** to the **Bubble size** area on the **Visualizations** pane:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/map-1.png" alt-text="Screenshot that shows a map chart.":::

1. To add a legend, drag **Store** > **Chain** to the **Legend** area. You now see the data sorted by store name, and there's a legend above the map:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/map-2.png" alt-text="Screenshot that shows Chain in the fields list and in the Legend area.":::

## Related content

- [Visualizations overview in Power BI](power-bi-visualizations-overview.md)
- [Learn about interacting with visualizations](../explore-reports/end-user-reading-view.md)
- [Move and resize a visualization](power-bi-visualization-move-and-resize.md)
- [Power BI Community](https://community.powerbi.com/) 
