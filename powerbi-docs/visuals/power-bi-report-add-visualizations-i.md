---
title: Part 1, Add visualizations to a Power BI report
description: 'Part 1, Add visualizations to a Power BI report'
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/20/2021
LocalizationGroup: Visualizations
---

# Add visuals to a Power BI report (part 1)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article gives a quick introduction to creating a visualization in a report. It applies to both the Power BI service and Power BI Desktop. For more-advanced content, [see Part 2](power-bi-report-add-visualizations-ii.md) of this series.

## Prerequisites

This tutorial uses the [Sales and Marketing Sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix).

1. From the upper left section of the Power BI Desktop menu bar, select **File** > **Open report**

1. Find your copy of the **Sales and Marketing Sample PBIX file**

1. Open the **Sales and Marketing Sample PBIX file** in report view :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::.

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity. See [sharing reports](../collaborate-share/service-share-reports.md)

## Add visualizations to the report

1. Create a visualization by selecting a field from the **Fields** pane.

   Start with a numeric field like **SalesFact** > **Sales $**. Power BI creates a column chart with a single column.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-column-chart.png" alt-text="Screenshot of a column chart with a single column.":::

   Or, start with a field, such as **Product** > **Category**. Power BI creates a table and adds that field to the **Values** well.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-product.png" alt-text="Screenshot of a table with four categories.":::

   Or, start with a geography field, such as **Geo** > **City**. Power BI and Bing Maps create a map visualization.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-maps.png" alt-text="Screenshot of a map visualization.":::

## Change the type of visualization

Create a visualization and then change its type.

1. Select **Product** > **Category** and then **Product** > **Count of Product** to add them both to the **Values** well.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-create-visual.png" alt-text="Screenshot of the Fields pane with the Values well called out.":::

1. Change the visualization to a column chart by selecting the **Stacked column chart** icon.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-convert.png" alt-text="Screenshot of the Visualizations pane with the Stacked column chart icon called out.":::

1. To change the way the visual is sorted, select **More options** (...). Use the sort options to change the direction of the sort (ascending or descending) and select **Sort by** to change the column being used to sort.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-sort.png" alt-text="Screenshot of the More actions dropdown.":::
  
## Next steps

 Continue on to:

* [Part 2: Add visualizations to a Power BI report](power-bi-report-add-visualizations-ii.md)

* [Interact with the visualizations](../consumer/end-user-reading-view.md) in the report.
