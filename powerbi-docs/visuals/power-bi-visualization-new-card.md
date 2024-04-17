---
title: Create a "new" card visualization 
description: The "new" card visual allows you to display individual and group callouts in a single container, with a wide range of formatting settings available to customize its appearance completely.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/27/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Create a "new" card visualization in Power BI Desktop (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

The "new" card is a helpful visual that presents important metrics such as total sales, profit growth, count of opportunities, and performance status. You can create cards for the metrics that align with your objectives and key results (OKRs) and display them grouped in a single visual container.

:::image type="content" source="media/power-bi-visualization-new-card/power-bi-opportunities-card.png" alt-text="Screenshot of card visualization.":::

> [!IMPORTANT]
> The "new" card visual is currently in preview and only available for Power BI Desktop. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites 

Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity. This visual applies only to Desktop and isn’t available in Power BI service.

## Get the sample 

If you want to follow along, this article uses the Retail Analysis Sample.

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Retail Analysis Sample PBIX** file, and then select **Open**.

1. The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: 

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-new-card/add-1.png"::: to add a new page to the report.


## Build a new card visualization

# [On the ribbon](#tab/On-the-ribbon)

The first method to create a new card is to use the ribbon in Power BI Desktop.

1. In the **Insert** ribbon, select **Visual gallery**, select the **Card (new)** visual icon.

   :::image type="content" source="media/power-bi-visualization-new-card/insert-visual-gallery-new-card.png" alt-text="Screenshot showing the Insert menu with the visual gallery ribbon expanded to show a variety of visual options." lightbox="media/power-bi-visualization-new-card/insert-visual-gallery-new-card.png":::

1. To add fields or measures, select fields in the Data pane. Each data field that you add is displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-new-card/add-data-data-pane.png" alt-text="Screenshot showing a card with both the Store count and Total Sales fields. The Data pane, where the fields were added, is shown in the same view." lightbox="media/power-bi-visualization-new-card/add-data-data-pane.png":::

# [On the report canvas](#tab/On-the-report-canvas)

Create a card directly from the report canvas.

1. In the report canvas, right select to display a menu, then select **Add visual**.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-1.png" alt-text="Screenshot showing a menu that appears when the user performs a right click on the canvas. The menu shows an option to add a new visual." lightbox="media/power-bi-visualization-new-card/canvas-1.png":::

1. In the On-object menu, expand the Visual types dropdown to select the **Card (new)** visual icon.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-2.png" alt-text="This image shows an empty container with the on-object visual dialog highlighting the card  (new) icon selected." lightbox="media/power-bi-visualization-new-card/canvas-2.png":::

1. To add fields or measures, select **Add data**. Each data field that you add is displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-3.png" alt-text="Screenshot showing a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/canvas-3.png":::

# [In the data pane](#tab/In-the-data-pane)

Another way to create a new card visual is to start from the Data pane.

1. On the report canvas, right-click to display a menu, then select **Add visual**.

   :::image type="content" source="media/power-bi-visualization-new-card/report-canvas-add-visual.png" alt-text="Screenshot showing a menu that appears when the user performs a right click on the canvas. The menu shows an option to add a new visual." lightbox="media/power-bi-visualization-new-card/report-canvas-add-visual.png":::

1. In the Data pane, select some measures or fields.

   :::image type="content" source="media/power-bi-visualization-new-card/data-pane-new-visual.png" alt-text="Screenshot showing a card (new) created by selecting two fields from the data pane." lightbox="media/power-bi-visualization-new-card/data-pane-new-visual.png":::

1. On the **Home** ribbon, select the **Visual gallery** and select the **Card (new) visual**.

   :::image type="content" source="media/power-bi-visualization-new-card/visual-gallery-new-card-style.png" alt-text="Screenshot showing a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/visual-gallery-new-card-style.png":::

---

## Format the new card visual

The new card visual provides a wide range of options for customization. To better understand these options, create a new card visual with multiple values and explore the **Format** pane. This way you can experiment with various formatting options and discover the full range of features available.

1. Select the new card and choose the paint brush icon to open the Format pane.

   :::image type="content" source="media/power-bi-visualization-new-card/format-1.png" alt-text="Screenshot showing a Format pane icon that opens up all available formatting settings for a new card." lightbox="media/power-bi-visualization-new-card/format-1.png":::

1. Expand the **Callout** section and **Apply settings** to **All** series to change the **Font family**, **Font size**, **Color**, and **Transparency**. By doing so, you're able to modify all cards at the same time.

      :::image type="content" source="media/power-bi-visualization-new-card/format-2.png" alt-text="Screenshot showing the formatting settings available to personalize the callout of a card. These settings include font, color, and transparency, which can be applied to all cards." lightbox="media/power-bi-visualization-new-card/format-2.png":::

1. In **Apply settings to**, select a single series and then change the **Color** and **Horizontal alignment**. If you need to format a value in a specific way, you can use the **Custom** display units option and enter a format code in the text field. For example, typing **$#,###M,** as the format code changes the data type to currency format.

   :::image type="content" source="media/power-bi-visualization-new-card/format-3.png" alt-text="The image shows formatting settings for a single card, including color, horizontal alignment, and display units.":::

1. In **Apply settings to**, select **All** series and then change **Font size**, **Position** and turn on **Text wrap**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-4.png" alt-text="Screenshot showing the two cards with labels shown in Segoe UI Regular font on size 10, dark gray color and 0% transparency. The labels are positioned below the values, with text wrap and baseline alignment enabled.":::

1. Adjust the space between the value and label by using **Vertical spacing**. 

    > [!IMPORTANT]
    > This setting only works when applied to **All** series.

   :::image type="content" source="media/power-bi-visualization-new-card/format-5.png" alt-text="Screenshot showing the two cards with a vertical spacing of four pixels between them." lightbox="media/power-bi-visualization-new-card/format-5.png":::

1. Expand the **Layout** section and change the **Vertical alignment**, **Orientation**, and **Space between cards**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-6.png" alt-text="Screenshot showing the two cards with vertical alignment set to top, vertical orientation and a spacing of two pixels between cards." lightbox="media/power-bi-visualization-new-card/format-6.png":::

1. To modify all cards at once, expand the **Cards** section, under **Apply settings to** select **All** series, and adjust **Padding**, **Fill Color**, **Fill Transparency**, and **Border Color**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-7.png" alt-text="Screenshot showing the two cards with a blue fill at 90% transparency and a blue border." lightbox="media/power-bi-visualization-new-card/format-7.png":::

1. To modify a single card, under **Apply settings to** select a series and adjust **Fill Color** and **Border Color**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-8.png" alt-text="Screenshot showing a card with the Total Sales series selected and filled with a green color that is 90% transparent." lightbox="media/power-bi-visualization-new-card/format-8.png":::

## Considerations and limitations (preview)

* The new card visual is currently being developed and is being updated over several releases. Once it reaches its final stage, it replaces the existing Card, Multi-row card, and KPI card. However, reports that continue to use these older visuals are still supported.
* The new card visual is a preview feature turned on by default. If you prefer to disable the preview, or control when you see it, go to **Options** > **Preview features**, and turn off **New card visual**. This change doesn’t influence existing card visuals.
* Certain settings only take effect if the **Apply settings to** option is set to **All**. Other settings can only be configured by selecting an independent measure series.
* By design, the shadow and glow effect can cause the size of all cards to change unexpectedly.
* **Edit interactions** and **Filters in this visual** influence all cards within the container.
* You can't pin individual cards to a dashboard. Instead, all cards in the new card visual are pinned together.
* There are no limits to the number of cards that you can add to the new card visual. However, adding a large number of cards may cause the report to experience latency and slow data loading.
* The new card visual currently doesn't support scrolling or pagination. As a result, if the container is small and you add multiple cards, they may appear in a reduced size.

## Related content

- [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
