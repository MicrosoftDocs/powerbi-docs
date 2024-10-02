---
title: Create a matrix visual in Power BI
description: This article explains what a matrix visual is, and how to create a matrix visual in Power BI Desktop and Power BI Service.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidiseminger
ms.custom: sample-Retail-Analysis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/01/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about matrix visuals so that I can effectively and more easily build column chart visuals in Power BI Desktop and Power BI Service.
---
# Create a matrix visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The matrix visual in Power BI is a powerful tool used to display and analyze data across multiple dimensions. Similar to a pivot table in Excel, the matrix visual allows you to organize data into rows and columns, making it easier to understand complex datasets. Each cell in the matrix represents a specific data point, with the ability to drill down into more detailed levels of information. This design facilitates a comprehensive view of data, enabling users to identify patterns and trends across various dimensions.

The matrix visual's ability to aggregate data and support hierarchical structures makes it an essential tool for in-depth data analysis and reporting. Matrix visuals are frequently employed in business and finance to analyze performance metrics, such as sales by region or product category. Additionally, they're valuable in marketing for examining customer behavior, campaign effectiveness, and market segmentation.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

[!INCLUDE [prerequisites-desktop-download-latest-version-pbi-desktop](../includes/core-visuals/prerequisites-desktop-download-latest-version-pbi.md)]
[!INCLUDE [prerequisites-desktop-preview-features-on-object-unselected](../includes/core-visuals/prerequisites-desktop-preview-features-on-object-unselected.md)]
[!INCLUDE [prerequisites-desktop-download-retail-analysis-sample-pbix](../includes/core-visuals/prerequisites-desktop-download-retail-analysis-sample-pbix.md)]

# [Power BI service](#tab/powerbi-service)

[!INCLUDE [prerequisites-service-open-retail-analysis-sample-pbix](../includes/core-visuals/prerequisites-service-open-retail-analysis-sample-pbix.md)]

---
> [!NOTE]
> [!INCLUDE [prerequisites-share-your-report](../includes/core-visuals/prerequisites-share-your-report.md)]

## Create a column chart

# [Power BI Desktop](#tab/powerbi-desktop)

Before we begin, review the **[Prerequisites](#prerequisites)** section at the beginning of this article, and follow the steps under the tab for **Power BI Desktop**.

In this quick and easy 3-step guide, let’s create a matrix visual starting from the **Visualizations** pane in **Power BI Desktop**.

1. From the **Visualizations** pane, first select the **Build visual** icon, then select the **Matrix** visual icon, and a visual *placeholder* is immediately added to the report canvas.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-1.png" alt-text="Image of Power BI service with the Visualizations pane highlighted. Both the Build visual icon and Matrix icon are selected and highlighted, and a visual placeholder displayed on canvas." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-1.png":::

2. To add data to the visual in this example, let’s use the **Data** pane. Adding data can be done by selecting fields and measures, or dragging fields and measures to the field wells on the **Visualizations** pane, or dragging fields and measures directly to the visual placeholder in the report canvas. Expand the **Sales** group, to add **TotalSales** and then **TotalSalesLY** to the **Values** field well. Expand the **Item** subgroup, to add **Category** to the **Columns** field well. And finally, expand the **Store** subgroup to add **Territory** and then **City** to the **Rows** field well.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-2.png" alt-text="Image of Power BI Desktop with the Data pane highlighted. TotalSales and TotalSalesLY measures are highlighted and added to the highlighted Values field well. Category is highlighted and added to the highlighted Columns field well. Both Territory and City are also highlighted and added to the highlighted Rows field well." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-2.png":::

3. To customize your matrix visual, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available settings, allowing you to tailor the matrix visual's appearance and functionality to your specific requirements.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-3.png" alt-text="Image of Power BI Desktop with the Visualizations pane highlighted. The Format visual icon is selected and highlighted along with both the Visual tab and the General tab both highlighted. The Visual tab is selected to display the available format settings for y our Matrix visual." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-3.png":::

# [Power BI service](#tab/powerbi-service)

Before we begin, review the **[Prerequisites](#prerequisites)** section at the beginning of this article, and follow the steps under the tab for the **Power BI service**.

In this quick and easy 3-step guide, let’s create a matrix visual starting from the **Visualizations** pane in the **Power BI service**.

1. From the **Visualizations** pane, first select the **Build visual** icon, then select the **Matrix** visual icon, and a visual *placeholder* is immediately added to the report canvas.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-1.png" alt-text="Image of Power BI service with the Visualizations pane highlighted. Both the Build visual icon and Matrix icon are selected and highlighted, and a visual placeholder displayed on canvas." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-1.png":::

2. To add data to the visual in this example, let’s use the **Data** pane. Adding data can be done by selecting fields and measures, or dragging fields and measures to the field wells on the **Visualizations** pane, or dragging fields and measures directly to the visual placeholder in the report canvas. Expand the **Sales** group, to add **TotalSales** and then **TotalSalesLY** to the **Values** field well. Expand the **Item** subgroup, to add **Category** to the **Columns** field well. And finally, expand the **Store** subgroup to add **Territory** and then **City** to the **Rows** field well.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-2.png" alt-text="Image of Power BI Desktop with the Data pane highlighted. TotalSales and TotalSalesLY measures are highlighted and added to the highlighted Values field well. Category is highlighted and added to the highlighted Columns field well. Both Territory and City are also highlighted and added to the highlighted Rows field well." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-2.png":::

3. To customize your matrix visual, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available settings, allowing you to tailor the matrix visual's appearance and functionality to your specific requirements.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-3.png" alt-text="Image of Power BI Desktop with the Visualizations pane highlighted. The Format visual icon is selected and highlighted along with both the Visual tab and the General tab both highlighted. The Visual tab is selected to display the available format settings for y our Matrix visual." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-3.png":::

---
Great job! Congratulations on successfully creating a matrix visual with Power BI. Next, take time to familiarize yourself with the comprehensive list of **[Matrix visual format settings](power-bi-visualization-matrix-visual-format-settings.md)** and other related articles in the **[Related content](#related-content)** section.

## Related content

- [Matrix visual format settings](power-bi-visualization-matrix-visual-format-settings.md)
- [Matrix visual considerations and limitations](power-bi-visualization-matrix-visual-considerations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
