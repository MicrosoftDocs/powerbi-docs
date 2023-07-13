---
title: Add visualizations to a Power BI report (part 2)
description: Learn how to create a visualization in a report. Part 2 in a series.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/17/2023
ms.custom: sample-retailanalysissample
LocalizationGroup: Visualizations
---

# Add visuals to a Power BI report (part 2)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In [part 1](power-bi-report-add-visualizations-i.md) of this series of two articles, you created a basic visualization by selecting checkboxes next to field names. In this article, you learn how to use drag-and-drop and make full use of the **Fields** and **Visualizations** panes to create and modify visualizations.

## Create a new visualization

In this tutorial, you use the Retail Analysis Sample dataset to create a few visualizations.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Retail Analysis Sample PBIX file** file, and then select **Open**.

1. The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-report-add-visualizations-ii/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-report-add-visualizations-ii/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Retail Analysis Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Retail Analysis Sample** to download it.

1. The **Retail Analysis Sample** opens in report view:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/power-bi-retail-analysis-sample.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="media/power-bi-report-add-visualizations-ii/power-bi-retail-analysis-sample.png" border="false":::

1. At the top, select **Edit** to display the **Visualizations** pane.

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-report-add-visualizations-i/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

## Add visualizations to the report

Create a visualization by selecting a field in the **Data** pane. The type of visualization created depends on the type of field selected. Power BI uses the data type to determine which visualization to use to display the results. You can change the visualization type by selecting a different icon in the **Visualizations** pane. Keep in mind that not all visualizations can display all data types. For example, geographic data won't display well in a funnel chart or line chart.

### Add an area chart that compares this year's sales to last year's

1. In the **Data** pane, expand **Sales** and select the **Last Year Sales** checkbox. Then expand **This Year Sales** and select the **Value** checkbox. Power BI creates a column chart. This chart is interesting, and you want to look closer. What do the sales look like by month?  

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/compare-1.png" alt-text="Screenshot that shows a column chart.":::

1. In the Data pane, expand **Time** and drag **FiscalMonth** into the **X-axis** area:  

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/compare-2.png" alt-text="Screenshot that shows a column chart with FiscalMonth as the axis.":::

1. In this step, you [change the visualization type](power-bi-report-change-visualization-type.md). There are many visualization types to choose from. To decide which type to use, see [descriptions of each, tips for best practices, and tutorials](power-bi-visualization-types-for-reports-and-q-and-a.md). We'll use an area chart. In the **Visualizations** pane, select the area chart button:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/compare-3.png" alt-text="Screenshot that shows the Area chart button.":::

1. Sort the visualization by selecting **More options** (...) at the top of the chart and then selecting **Sort axis** > **FiscalMonth**:

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/compare-4.png" alt-text="Screenshot that shows the More options menu.":::

1. [Resize the visualization](power-bi-visualization-move-and-resize.md) by selecting the visualization, grabbing one of the dark frame handles and dragging. Make it wide enough to eliminate the scrollbar and small enough to give us enough room to add another visualization.

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/pbi_part2_7b.png" alt-text="Screenshot showing the area chart visualization.":::

1. Save the report.

### Add a map visualization that looks at sales by location

1. From the **Store** table, select **Territory**. Power BI recognizes that **Territory** is a location, and creates a map visualization. Drag **Total Stores** into the **Bubble size** area.

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/power-bi-map1.png" alt-text="Screenshot showing an area chart.":::

1. Add a legend. To see the data by store name, drag **Store** > **Chain** into the **Legend** area.

   :::image type="content" source="media/power-bi-report-add-visualizations-ii/power-bi-chain.png" alt-text="Screenshot showing the report canvas with Chain in fields list and Chain in Legend bucket highlighted.":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity. See [sharing reports](../collaborate-share/service-share-reports.md).

## Next steps

* More about [Visualizations in Power BI reports](power-bi-report-visualizations.md).  
* More questions? [Try the Power BI Community](https://community.powerbi.com/)

