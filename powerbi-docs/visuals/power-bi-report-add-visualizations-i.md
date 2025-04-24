---
title: Add visualizations to a Power BI report (part 1)
description: Learn how to create a visualization in a report. 
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'kfollis'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/15/2023
ms.custom: sample-Sales-and-Marketing
LocalizationGroup: Visualizations
---

# Add visuals to a Power BI report (part 1)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article provides a quick introduction to creating a visualization in a report. For more advanced information, [see part 2](power-bi-report-add-visualizations-ii.md) of this article.

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
> If you want to share your report with a colleague, you both need to have individual Power BI Pro licenses or the report needs to be saved in Premium capacity. For more information, see [Share a filtered Power BI report](../collaborate-share/service-share-reports.md).

## Add visualizations to the report

In this section, you create a visualization by selecting a field from the **Data** pane.

   - Start with a numeric field like **SalesFact** > **Sales $**. Power BI creates a column chart that has a single column:

      :::image type="content" source="media/power-bi-report-add-visualizations-i/add-visual-1.png" alt-text="Screenshot that shows a column chart with a single column." lightbox="media/power-bi-report-add-visualizations-i/add-visual-1.png":::

   - Or start with a field like **Product** > **Category**. Power BI creates a table and adds that field to the **Columns** section:

     :::image type="content" source="media/power-bi-report-add-visualizations-i/add-visual-2.png" alt-text="Screenshot that shows a table with four categories." lightbox="media/power-bi-report-add-visualizations-i/add-visual-2.png":::

   - Or select the **Filled map** button and then select a geography field, like **Geo** > **City**. Power BI and Bing Maps create a map visualization:

     :::image type="content" source="media/power-bi-report-add-visualizations-i/add-visual-3.png" alt-text="Screenshot that shows a map visualization." lightbox="media/power-bi-report-add-visualizations-i/add-visual-3.png":::

## Change the type of visualization

In this section, you create a visualization and then change its type.

1. On a new page, select **Product** > **Category** and then **Product** > **Count of Product** to add both fields to the **Columns** section:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/change-type-1.png" alt-text="Screenshot that shows the Data pane with the fields selected." lightbox="media/power-bi-report-add-visualizations-i/change-type-1.png":::

1. Change the visualization to a column chart by selecting the **Stacked column chart** button on the **Visualizations** pane:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/change-type-2.png" alt-text="Screenshot that shows the Stacked column chart button."lightbox="media/power-bi-report-add-visualizations-i/change-type-2.png":::

1. To change the way the visual is sorted, select **More options** (...) and then **Sort axis** on the chart. Use the menu options to change the direction of the sort axis (ascending or descending) or to change the column that's being sorted on:

   :::image type="content" source="media/power-bi-report-add-visualizations-i/change-type-3.png" alt-text="Screenshot that shows the More options list." lightbox="media/power-bi-report-add-visualizations-i/change-type-3.png":::
  
## Related content

- [Read part 2 of this article](power-bi-report-add-visualizations-ii.md)
- [Learn about interacting with visualizations](../consumer/end-user-reading-view.md) 
