---
title: Add visualizations to a Power BI report (part 1)
description: Learn how to create a visualization in a report. 
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/14/2023
ms.custom: sample-Sales-and-Marketing
LocalizationGroup: Visualizations
---

# Add visuals to a Power BI report (part 1)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article provides a quick introduction to creating a visualization in a report. For more-advanced content, [see part 2](power-bi-report-add-visualizations-ii.md) of this article.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Sales and Marketing Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix) to your desktop.

2. In Power BI Desktop, select **File** > **Open report**.

3. Browse to and select the **Sales and Marketing Sample PBIX** file, and then select **Open**.

   The **Sales and Marketing Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-report-add-visualizations-i/power-bi-report-view.png":::

5. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-report-add-visualizations-i/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the built-in Sales and Marketing Sample in the Power BI service.

1. Open the Power BI service, then select on **Get data** in the bottom left corner.

2. On the Get Data page that appears, select **Samples**.

   :::image type="content" source="media/power-bi-visualization-slicers/get-data-samples.png" alt-text="Screenshot of Get Data box with link to samples.":::

3. Select the **Sales and Marketing Sample**, and choose **Connect**.

4. Select **Edit** on the menu bar to display the **Visualizations** pane.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity. See [sharing reports](../collaborate-share/service-share-reports.md)

## Add visualizations to the report

1. Create a visualization by selecting a field from the **Fields** pane.

   Start with a numeric field like **SalesFact** > **Sales $**. Power BI creates a column chart with a single column.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-column-chart.png" alt-text="Screenshot of a column chart with a single column.":::

   Or, start with a field, such as **Product** > **Category**. Power BI creates a table and adds that field to the **Columns** well.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-product.png" alt-text="Screenshot of a table with four categories.":::

   Or, select the **Filled map** icon and drag a geography field, such as **Geo** > **City**, to the **Location** well. Power BI and Bing Maps create a map visualization.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-maps.png" alt-text="Screenshot of a map visualization.":::

## Change the type of visualization

Create a visualization and then change its type.

1. Select **Product** > **Category** and then **Product** > **Count of Product** to add them both to the **Columns** well.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-create-visual.png" alt-text="Screenshot of the Fields pane with the Values well called out.":::

1. Change the visualization to a column chart by selecting the **Stacked column chart** icon.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-convert.png" alt-text="Screenshot of the Visualizations pane with the Stacked column chart icon called out.":::

1. To change the way the visual is sorted, select **More options** (...) and then **Sort axis**. Use the menu options to change the direction of the Sort axis (ascending or descending) or change the column that is being sorted on.

   :::image type="content" source="media/power-bi-report-add-visualizations-i/power-bi-sort.png" alt-text="Screenshot of the More actions dropdown showing the sort axis options.":::
  
## Next steps

 Continue on to:

* [Part 2: Add visualizations to a Power BI report](power-bi-report-add-visualizations-ii.md)

* [Interact with the visualizations](../consumer/end-user-reading-view.md) in the report.
