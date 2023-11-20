---
title: Create a card (new) visualization 
description: The card (new) visual allows you to display individual and group callouts in a single container, with a wide range of formatting settings available for complete customization of its appearance.
author: PeterAbundio
ms.author: v-peabundio
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 09/11/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Create a Card (new) visualization in Power BI Desktop (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

The card (new) is a helpful visual that presents important metrics such as total sales, profit growth, count of opportunities, or performance status. You can create cards for the metrics that align with your objectives and key results (OKRs) and display them grouped in a single visual container.

:::image type="content" source="media/power-bi-visualization-new-card/power-bi-opportunities-card.png" alt-text="Screenshot of card visualization.":::

> [!IMPORTANT]
> The card (new) visual is currently in PREVIEW and only available for Power BI Desktop. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites 

Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity. This visual applies only to Desktop and isn’t available in Power BI service.

## Get the sample 

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample.

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Retail Analysis Sample PBIX** file, and then select **Open**.

1. The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: 

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-new-card/add-1.png"::: to add a new page to the report.

---

## Build a new card visualization

# [On the ribbon](#tab/On-the-ribbon)

The first method to create a card (new) is to use the ribbon in Power BI Desktop.

1. In the ribbon, select **Visual gallery** under **Insert**.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon-1.png" alt-text="This image displays the Insert menu with the visual gallery ribbon expanded to show a variety of visual options." lightbox="media/power-bi-visualization-new-card/ribbon-1.png":::

1. In the Visual gallery menu, select the **Card (new) visual** icon.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon-2.png" alt-text="This image displays the Ribbon with the Card (New) visual selected and the menu expanded." lightbox="media/power-bi-visualization-new-card/ribbon-2.png":::

1. To add fields or measures, select **Add data**. Each added data is displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon-3.png" alt-text="This image displays a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/ribbon-3.png":::



# [On the report canvas](#tab/On-the-report-canvas)

Create a card directly from the report canvas.

1. In the report canvas, right select to display a menu, then select **Add visual**.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-1.png" alt-text="This image displays a menu that appears when the user performs a right click on the canvas. The menu shows an option to add a new visual." lightbox="media/power-bi-visualization-new-card/canvas-1.png":::

1. In the On-object menu, expand the Visual types dropdown to select the **Card (new) visual** icon.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-2.png" alt-text="This image shows an empty container with the on-object visual dialog highlighting the card  (new) icon selected." lightbox="media/power-bi-visualization-new-card/canvas-2.png":::

1. To add fields or measures, select **Add data**. Each added data is displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-3.png" alt-text="This image displays a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/canvas-3.png":::



# [In the data pane](#tab/In-the-data-pane)

Another commonly employed approach for creating a new card visual is to start the process from the Data pane.

1. In the report canvas, right click to display a menu, then select **Add visual**.

   :::image type="content" source="media/power-bi-visualization-new-card/pane-1.png" alt-text="This image displays a menu that appears when the user performs a right click on the canvas. The menu shows an option to add a new visual." lightbox="media/power-bi-visualization-new-card/pane-1.png":::

1. In the Data pane, select some measures or fields.

   :::image type="content" source="media/power-bi-visualization-new-card/pane-2.png" alt-text="This image shows a card (new) created by selecting two fields from the data pane." lightbox="media/power-bi-visualization-new-card/pane-2.png":::

1. In the On-object menu, expand the Visual types dropdown to select the **Card (new) visual** icon. In the On-object menu, we can see the **Data fields** applied on the visual.

   :::image type="content" source="media/power-bi-visualization-new-card/pane-3.png" alt-text="This image displays a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/pane-3.png":::

---

## Formatting the card (new) visual

The card (new) visual provides a wide range of options for customization. To gain a better understanding of these options, we recommend creating a new card visual with multiple values and exploring the Format pane. This method lets you experiment with various formatting options and discover the full range of features available.

To access the Format panel, it's necessary to select a visual object. In this case, we select the card (new) within the report.

1. Select the card (new) and choose the paint brush icon to open the Format pane.

   :::image type="content" source="media/power-bi-visualization-new-card/format-1.png" alt-text="This image displays a Format pane icon that opens up all available formatting settings for a card (new)." lightbox="media/power-bi-visualization-new-card/format-1.png":::

1. Expand the **Callout** section and **Apply settings** to all series to change the **Font family**, **Font size**, **Color**, and **Transparency**. By doing so, you're able to modify all cards simultaneously.

      :::image type="content" source="media/power-bi-visualization-new-card/format-2.png" alt-text="This image displays the formatting settings available to personalize the callout of a card. These settings include font, color, and transparency, which can be applied to all cards." lightbox="media/power-bi-visualization-new-card/format-2.png":::

1. In **Apply settings to**, select a single series and then change the **Color** and **Horizontal alignment**. If you need to format a value in a specific way, you can use the **Custom** display units option and enter a format code in the text field. For example, typing **$#,###M,** as the format code changes the data type to currency format.

   :::image type="content" source="media/power-bi-visualization-new-card/format-3.png" alt-text="The image shows formatting settings for a single card, including color, horizontal alignment, and display units." lightbox="media/power-bi-visualization-new-card/format-3.png":::

1. In **Apply settings to**, select all series and then change **Font size**, **Position** and turn on **Text wrap**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-4.png" alt-text="This image displays the two cards with labels shown in Segoe UI Regular font on size 10, dark gray color and 0% transparency. The labels are positioned below the values, with text wrap and baseline alignment enabled." lightbox="media/power-bi-visualization-new-card/format-4.png":::

1. Adjust the space between the value and label by using **Vertical spacing**. However, it's important to note that this feature only works when applied to all series.

   :::image type="content" source="media/power-bi-visualization-new-card/format-5.png" alt-text="This image displays the two cards with a vertical spacing of four pixels between them." lightbox="media/power-bi-visualization-new-card/format-5.png":::

1. Expand the **Layout** section and change the **Vertical alignment**, **Orientation**, and **Space between cards**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-6.png" alt-text="This image displays the two cards with vertical alignment set to top, vertical orientation and a spacing of two pixels between cards." lightbox="media/power-bi-visualization-new-card/format-6.png":::

1. To modify all cards at once, expand the **Cards** section, select All series under **Apply settings to** and adjust **Padding**, **Fill Color**, **Fill Transparency**, and **Border Color**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-7.png" alt-text="This image displays the two cards with a blue fill at 90% transparency and a blue border." lightbox="media/power-bi-visualization-new-card/format-7.png":::

1. To modify a single card, select a series under **Apply settings to** and adjust **Fill Color** and **Border Color**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-8.png" alt-text="This image shows a card with the Total Sales series selected and filled with a green color that is 90% transparent." lightbox="media/power-bi-visualization-new-card/format-8.png":::



## Considerations and limitations (preview)

* The card (new) visual is currently being developed and is being updated over several releases. Once it reaches its final stage, it replaces the existing Card, Multi-row card, and KPI card. However, reports that continue to use these older visuals are still supported.
* The card (new) visual is a preview feature turned on by default. However, if you prefer to disable the preview, or control when you see it, go to **Options** > **Preview features** > **New card visual**. This addition doesn’t influence existing card visuals.
* Certain settings only take effect if the **Apply settings to** option is set to **All**. Other settings can only be configured by selecting an independent measure series.
* We plan to replace the current percentage-based **shape corner** system with one that uses pixels instead to improve precision.
* By design, the shadow and glow effect can cause the size of all cards to change unexpectedly. Our team is actively working on a solution to improve precision.
* **Edit interactions** and **Filters in this visual** influence all cards within the container.
* It isn't possible to pin individual cards to a dashboard. Instead, all cards within the card (new) visual are pinned together.
* There are no limits to the number of cards that can be added to the card (new) visual. However, it's important to note that adding a large number of cards may cause the report to experience latency and slow data loading.
* The card (new) visual currently doesn't support scrolling or pagination. As a result, if the container is small and multiple cards are added, they may appear in a reduced size. Our team is actively working on a solution to this issue.


## Next steps
[Combo charts in Power BI](power-bi-visualization-combo-chart.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
