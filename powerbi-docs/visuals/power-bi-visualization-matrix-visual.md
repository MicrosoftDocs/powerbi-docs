---
title: Create a Matrix Visual in Power BI
description: Learn how to create and customize matrix visuals in Power BI Desktop and Power BI service to display and analyze data across multiple dimensions with hierarchical structures and aggregations.
author: JulCsc
ms.author: miguelmyers
ms.reviewer: juliacawthra
ms.custom: sample-Retail-Analysis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/18/2025
ai-usage: ai-assisted
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about matrix visuals so that I can effectively and more easily build column chart visuals in Power BI Desktop and Power BI Service.
---
# Create a matrix visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The matrix visual in Power BI is a powerful tool used to display and analyze data across multiple dimensions. Similar to a pivot table in Excel, the matrix visual allows you to organize data into rows and columns, making it easier to understand complex datasets. Each cell in the matrix represents a specific data point, with the ability to drill down into more detailed levels of information. This design facilitates a comprehensive view of data, enabling users to identify patterns and trends across various dimensions.

The matrix visual's ability to aggregate data and support hierarchical structures makes it an essential tool for in-depth data analysis and reporting. Matrix visuals are frequently employed in business and finance to analyze performance metrics, such as sales by region or product category. Additionally, they're valuable in marketing for examining customer behavior, campaign effectiveness, and market segmentation.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

- Always make sure you have the latest version of [**Power BI Desktop**](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.
- For the purposes of this guide, in Power BI Desktop's **Global options**, under the **Preview features** section, the **On-object interaction** feature is *not enabled*.
In the following guide, we're using the [**Retail Analysis Sample PBIX**](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) file. After downloading the file, let's get started:

1. Launch **Power BI Desktop**.
1. On the left-side navigation pane, select **Open**, otherwise on the top-left of the window, select **File** > **Open**.
1. Locate and select your copy of the **Retail Analysis Sample PBIX** file. The file will open in report view, ready for you to begin.

   :::image type="content" source="../media/power-bi-visualization-column-charts/desktop-retail-analysis-sample-report-view.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="../media/power-bi-visualization-column-charts/desktop-retail-analysis-sample-report-view-expanded.png" border="false":::

1. Select the + icon at the bottom of the window to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

In the following guide we’re using the Retail Analysis Sample PBIX in the Power BI service. Let’s get started:

1. Sign in to the [**Power BI service**](https://app.powerbi.com).
1. Select **Learn** in the left navigation.
1. On the **Learning center** page, under **Sample reports**, scroll to the right to locate and select the **Retail Analysis Sample**. The file will open in report view.

   :::image type="content" source="../media/power-bi-visualization-column-charts/service-retail-analysis-sample-report-view.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="../media/power-bi-visualization-column-charts/service-retail-analysis-sample-report-view-expanded.png" border="false":::

1. At the top of the window, select **Edit** to open the report editor.
1. Select the **+** icon at the bottom of the window to add a new page to the report.

---
> [!NOTE]
> [!INCLUDE [prerequisites-share-your-report](../includes/core-visuals/prerequisites-share-your-report.md)]

## Let's create a matrix visual

# [Power BI Desktop](#tab/powerbi-desktop)

Before we begin, review the **[Prerequisites](#prerequisites)** section at the beginning of this article, and follow the steps under the tab for **Power BI Desktop**.

In this quick and easy three-step guide, let's create a matrix visual starting from the **Visualizations** pane in **Power BI Desktop**.

1. From the **Visualizations** pane, first select the **Build visual** icon. Then select the **Matrix** visual icon, and a visual *placeholder* is immediately added to the report canvas.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-1.png" alt-text="Screenshot of Power BI desktop with Visualizations pane highlighted, showing selected Build visual and Matrix icons, and a visual placeholder on the canvas." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-1.png":::

2. To add data to the visual in this example, let's use the **Data** pane. Adding data can be done by selecting fields and measures, or dragging fields and measures to the field wells on the **Visualizations** pane, or dragging fields and measures directly to the visual placeholder in the report canvas. Expand the **Sales** group, to add **TotalSales** and then **TotalSalesLY** to the **Values** field well. Expand the **Item** subgroup, to add **Category** to the **Columns** field well. And finally, expand the **Store** subgroup to add **Territory** and then **City** to the **Rows** field well.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-2.png" alt-text="Screenshot of Power BI Desktop with Data pane highlighted. TotalSales, TotalSalesLY in Values, Category in Columns, and Territory, City in Rows are highlighted." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-2.png":::

3. To customize your matrix visual, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available settings, allowing you to tailor the matrix visual's appearance and functionality to your specific requirements.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-3.png" alt-text="Screenshot of Power BI Desktop with Visualizations pane highlighted. Format visual icon, Visual tab, and General tab are selected and highlighted, showing Matrix visual format settings." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-desktop-step-3.png":::

# [Power BI service](#tab/powerbi-service)

Before we begin, review the **[Prerequisites](#prerequisites)** section at the beginning of this article, and follow the steps under the tab for the **Power BI service**.

In this quick and easy three-step guide, let's create a matrix visual starting from the **Visualizations** pane in the **Power BI service**.

1. From the **Visualizations** pane, first select the **Build visual** icon. Then select the **Matrix** visual icon, and a visual *placeholder* is immediately added to the report canvas.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-1.png" alt-text="Screenshot of Power BI service with Visualizations pane highlighted, showing selected Build visual and Matrix icons, and a visual placeholder on the canvas." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-1.png":::

2. To add data to the visual in this example, let's use the **Data** pane. Adding data can be done by selecting fields and measures, or dragging fields and measures to the field wells on the **Visualizations** pane, or dragging fields and measures directly to the visual placeholder in the report canvas. Expand the **Sales** group, to add **TotalSales** and then **TotalSalesLY** to the **Values** field well. Expand the **Item** subgroup, to add **Category** to the **Columns** field well. And finally, expand the **Store** subgroup to add **Territory** and then **City** to the **Rows** field well.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-2.png" alt-text="Screenshot of Power BI service with Data pane highlighted. TotalSales, TotalSalesLY in Values, Category in Columns, and Territory, City in Rows are highlighted." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-2.png":::

3. To customize your matrix visual, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available settings, allowing you to tailor the matrix visual's appearance and functionality to your specific requirements.

    :::image type="content" source="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-3.png" alt-text="Screenshot of Power BI service with Visualizations pane highlighted. Format visual icon, Visual tab, and General tab are selected and highlighted, showing Matrix visual format settings." lightbox="media/power-bi-visualization-matrix-visual/build-matrix-visual-service-step-3.png":::

---
Great job! Congratulations on successfully creating a matrix visual with Power BI. Next, take time to familiarize yourself with the comprehensive list of **[Matrix visual format settings](power-bi-visualization-matrix-visual-format-settings.md)** and other related articles in the **[Related content](#related-content)** section.

## Work with the matrix

### Expand and collapse row headers

Use expand and collapse icons provided to combine groups or to show more detail.

:::image type="content" source="media/power-bi-visualization-matrix-visual/matrix-visual-expand-and-collapse-row-headers.png" alt-text="Screenshot showing the expand and collapse icons in the row headers of a matrix." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-expand-and-collapse-row-headers.png":::

### Freeze row headers

By default row headers are frozen, which ensures they stay visible when you scroll horizontally.

:::image type="content" source="media/power-bi-visualization-matrix-visual/matrix-visual-frozen-row-headers.png" alt-text="Screenshot showing a matrix visual with frozen row headers." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-frozen-row-headers.png":::

To unfreeze row headers, and therefore hide them as you scroll horizontally, right-click on the row headers and select **Unfreeze row headers**. 

:::image type="content" source="media/power-bi-visualization-matrix-visual/matrix-visual-unfrozen-row-headers.png" alt-text="Screenshot showing a matrix visual with unfrozen row headers." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-unfrozen-row-headers.png":::

To refreeze the row headers, right-click on the row headers again and select **Freeze row headers**.

## Related content

- [Matrix visual format settings](power-bi-visualization-matrix-visual-format-settings.md)
- [Matrix visual considerations and limitations](power-bi-visualization-matrix-visual-considerations.md)
- [Table visual](power-bi-visualization-tables.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
