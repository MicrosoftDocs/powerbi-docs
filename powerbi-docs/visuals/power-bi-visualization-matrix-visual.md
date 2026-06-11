---
title: Create a Matrix Visual in Power BI
description: Learn how to create and customize matrix visuals in Power BI Desktop and Power BI service to display and analyze data across multiple dimensions with hierarchical structures and aggregations.
ms.author: juliacawthra
author: JulCsc
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 06/01/2026
ai-usage: ai-assisted
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about matrix visuals so that I can effectively and more easily build column chart visuals in Power BI Desktop and Power BI Service.
---
# Create a matrix visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The matrix visual in Power BI is a powerful tool used to display and analyze data across multiple dimensions. Similar to a pivot table in Excel, the matrix visual allows you to organize data into rows and columns, making it easier to understand complex datasets. Each cell in the matrix represents a specific data point, with the ability to drill down into more detailed levels of information. This design facilitates a comprehensive view of data, enabling users to identify patterns and trends across various dimensions.

The matrix visual's ability to aggregate data and support hierarchical structures makes it an essential tool for in-depth data analysis and reporting. Matrix visuals are frequently employed in business and finance to analyze performance metrics, such as sales by region or product category. Additionally, they're valuable in marketing for examining customer behavior, campaign effectiveness, and market segmentation.

## Sample data

To follow along with the examples in this article, create a calculated table with sample data in a blank Power BI Desktop report.

1. Open Power BI Desktop and create a new blank report.
1. Select **Modeling** > **New table**.
1. Paste the following DAX expression:

   ```dax
   Units sold =
   DATATABLE(
       "Year", STRING,
       "Quarter", STRING,
       "Subcategory", STRING,
       "Product", STRING,
       "Units Sold", INTEGER,
       {
           {"Year 1", "Q1", "Widgets", "Product A", 120},
           {"Year 1", "Q1", "Widgets", "Product B", 95},
           {"Year 1", "Q1", "Gadgets", "Product C", 80},
           {"Year 1", "Q1", "Gadgets", "Product D", 110},
           {"Year 1", "Q2", "Widgets", "Product A", 135},
           {"Year 1", "Q2", "Widgets", "Product B", 88},
           {"Year 1", "Q2", "Gadgets", "Product C", 92},
           {"Year 1", "Q2", "Gadgets", "Product D", 105},
           {"Year 1", "Q3", "Widgets", "Product A", 148},
           {"Year 1", "Q3", "Widgets", "Product B", 102},
           {"Year 1", "Q3", "Gadgets", "Product C", 75},
           {"Year 1", "Q3", "Gadgets", "Product D", 98},
           {"Year 1", "Q4", "Widgets", "Product A", 160},
           {"Year 1", "Q4", "Widgets", "Product B", 115},
           {"Year 1", "Q4", "Gadgets", "Product C", 88},
           {"Year 1", "Q4", "Gadgets", "Product D", 125},
           {"Year 2", "Q1", "Widgets", "Product A", 142},
           {"Year 2", "Q1", "Widgets", "Product B", 108},
           {"Year 2", "Q1", "Gadgets", "Product C", 95},
           {"Year 2", "Q1", "Gadgets", "Product D", 130},
           {"Year 2", "Q2", "Widgets", "Product A", 155},
           {"Year 2", "Q2", "Widgets", "Product B", 120},
           {"Year 2", "Q2", "Gadgets", "Product C", 100},
           {"Year 2", "Q2", "Gadgets", "Product D", 140}
       }
   )
   ```

> [!NOTE]
> [!INCLUDE [prerequisites-share-your-report](../includes/core-visuals/prerequisites-share-your-report.md)]

## Create a matrix visual

1. From the **Visualizations** pane, select the **Matrix** visual icon. A visual placeholder is added to the report canvas.

1. From the **Data** pane, expand the **Units sold** table and add fields to the following field wells:
   - **Rows**: **Year**, then **Quarter**
   - **Columns**: **Subcategory**, then **Product**
   - **Values**: **Units Sold**

1. To see all levels of the hierarchy, expand the row and column headers by selecting the **+** icons on the headers, or use the expand icons in the header toolbar. You can also turn on the **Auto expand** setting under **Column headers** > **Options** and **Row headers** > **Options** before adding fields, so the matrix automatically shows all levels when the visual loads.

1. To customize the matrix visual, select the **Format visual** icon in the **Visualizations** pane to access all available settings.

:::image type="content" source="media/power-bi-visualization-matrix-visual/power-bi-matrix-create.png" alt-text="Screenshot showing a matrix visual with Year and Quarter on rows, Subcategory and Product on columns, and Units Sold as values." lightbox="media/power-bi-visualization-matrix-visual/power-bi-matrix-create.png":::

## Expand and collapse row headers

Use expand and collapse icons provided to combine groups or to show more detail.

:::image type="content" source="media/power-bi-visualization-matrix-visual/matrix-visual-expand-and-collapse-row-headers.png" alt-text="Screenshot showing the expand and collapse icons in the row headers of a matrix." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-expand-and-collapse-row-headers.png":::

When report consumers open a matrix visual in [Explore](../consumer/explore-data-service.md), the columns and rows added to the visual are auto-expanded by default so consumers can see all the levels at once.

Report authors also control auto-expand behavior directly in the format pane. Under **Column headers** > **Options** and **Row headers** > **Options**, toggle the **Auto expand** setting on or off. This setting is useful when the columns or rows on the matrix change dynamically, for example when you use [personalize visuals](../create-reports/power-bi-personalize-visuals.md?tabs=powerbi-desktop) or [field parameters](../create-reports/power-bi-field-parameters.md).

In [embedded scenarios](../developer/embedded/embedded-analytics-power-bi.md), you can use the Authoring SDK to set the `autoExpand` property on the `rowHeaders` and `columnHeaders` objects so a matrix opens with its rows and columns auto-expanded by default.

## Freeze row headers

By default row headers are frozen, which ensures they stay visible when you scroll horizontally.

:::image type="content" source="media/power-bi-visualization-matrix-visual/matrix-visual-frozen-row-headers.png" alt-text="Screenshot showing a matrix visual with frozen row headers." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-frozen-row-headers.png":::

To unfreeze row headers, and therefore hide them as you scroll horizontally, right-click on the row headers and select **Unfreeze row headers**. 

:::image type="content" source="media/power-bi-visualization-matrix-visual/matrix-visual-unfrozen-row-headers.png" alt-text="Screenshot showing a matrix visual with unfrozen row headers." lightbox="media/power-bi-visualization-matrix-visual/matrix-visual-unfrozen-row-headers.png":::

To refreeze the row headers, right-click on the row headers again and select **Freeze row headers**.

> [!NOTE]
> The freeze and unfreeze options in the right-click menu are transient and apply only to your current viewing session. If you change this setting in an editing scenario, such as Power BI Desktop or web editing, the change isn't saved for report consumers.

## Adjust column width

[!INCLUDE [tablix-columns-resize](../includes/core-visuals/tablix-columns-resize.md)]

## Custom totals

[!INCLUDE [tablix-custom-totals](../includes/core-visuals/custom-totals.md)]

## Related content

- [Matrix visual format settings](power-bi-visualization-matrix-visual-format-settings.md)
- [Matrix visual considerations and limitations](power-bi-visualization-matrix-visual-considerations.md)
- [Table visual](power-bi-visualization-tables.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
