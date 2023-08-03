---
title: Create a card (new) visualization 
description: The card (new) is a helpful visual that presents important metrics such as total sales, profit growth, count of opportunities, or performance status.
author: PeterAbundio
ms.author: v-peabundio
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 08/02/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Create a Card (new) visualization in Power BI Desktop (preview)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The card (new) is a helpful visual that presents important metrics such as total sales, profit growth, count of opportunities, or performance status. The card (new) visual is designed for display in a visual container with multiple cards. You can create cards for the metrics that align with your objectives and key results (OKRs) and display them grouped in a single visual container.

:::image type="content" source="media/power-bi-visualization-new-card/power-bi-opportunities-card.png" alt-text="Screenshot of card visualization.":::

## Prerequisites 

Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Get the sample 

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample.

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File** > **Open report**.

1. Browse to and select the **Retail Analysis Sample PBIX** file, and then select **Open**.

1. The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: 

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-new-card/add-1.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the Retail Analysis Sample in the Power BI service.

1. Sign in to the Power BI service (app.powerbi.com).

1. Select **Learn** in the navigation pane.

1. On the **Learning center** page, under **Sample reports**, locate and select the **Retail Analysis Sample** to download it. The sample opens in report view.

   :::image type="content" source="media/power-bi-visualization-new-card/power-bi-retail-analysis-sample-expanded.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service.":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/power-bi-visualization-new-card/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-new-card/add-1.png"::: to add a new page to the report.

---

## Build a card (new) visual

# [On the ribbon](#tab/On-the-ribbon)

The first method to create a card is to use the report editor in Power BI Desktop.

1. In the ribbon, select **Visual gallery** under **Insert**.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon-1.png" alt-text="This image displays the Insert menu with the visual gallery ribbon expanded to show a variety of visual options." lightbox="media/power-bi-visualization-new-card/ribbon-1.png":::

1. In the Visual gallery menu, select the **Card (new) visual** icon.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon-2.png" alt-text="This image displays the Ribbon with the Card (New) visual selected and the menu expanded." lightbox="media/power-bi-visualization-new-card/ribbon-2.png":::

1. To add fields or measures, select the **+Add data** button. Each added data is displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon-3.png" alt-text="This image displays a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/ribbon-3.png":::



# [On the report canvas](#tab/On-the-report-canvas)

You can create a card directly from the report canvas.

1. In the report canvas, right select to display a menu, then select the **+Add visual** button.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-1.png" alt-text="This image displays a menu that appears when the user performs a secondary click-action-button on the canvas. The menu shows an option to add a new visual." lightbox="media/power-bi-visualization-new-card/canvas-1.png":::

1. In the On-object menu, expand the Visual types dropdown to select the **Card (new) visual** icon.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-2.png" alt-text="This image shows an empty container with the on-object visual dialog highlighting the card  (new) icon selected." lightbox="media/power-bi-visualization-new-card/canvas-2.png":::

1. To add fields or measures, select the **+Add data** button. Each added data is displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-3.png" alt-text="This image displays a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/canvas-3.png":::



# [In the data pane](#tab/In-the-data-pane)

Another commonly employed approach for creating a new card visual is to start the process from the data pane.

1. In the report canvas, right select to display a menu, then select the **+Add visual** button.

   :::image type="content" source="media/power-bi-visualization-new-card/pane-1.png" alt-text="This image displays a menu that appears when the user performs a secondary click-action-button on the canvas. The menu shows an option to add a new visual." lightbox="media/power-bi-visualization-new-card/pane-1.png":::

1. In the Data pane, select some measures or fields.

   :::image type="content" source="media/power-bi-visualization-new-card/pane-2.png" alt-text="This image shows a card (new) created by selecting two fields from the data pane." lightbox="media/power-bi-visualization-new-card/pane-2.png":::

1. In the On-object menu, expand the Visual types dropdown to select the **card (new) visual** icon. In the On-object menu, we can see the **data fields** applied on the visual.

   :::image type="content" source="media/power-bi-visualization-new-card/pane-3.png" alt-text="This image displays a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/pane-3.png":::

---

## Formatting the card (new) visual

The card (new) visual provides a wide range of options for customization. To gain a better understanding of these options, we recommend creating a new card visual with multiple values and exploring the Format pane. This method lets you experiment with various formatting options and discovers the full range of features available.

To access the Format panel, it's necessary to select a visual object. In this case, we select the card (new) within the report.

1. Select the card (new) and choose the paint brush icon to open the format pane.

   :::image type="content" source="media/power-bi-visualization-new-card/format-1.png" alt-text="This image displays a Format pane icon that opens up all available formatting settings for a card (new)." lightbox="media/power-bi-visualization-new-card/format-1.png":::

1. Expand the **Callout** section and **Apply settings** to all series to change the **font family**, **font size**, **color**, and **transparency**. By doing so, you're able to modify all cards simultaneously.

      :::image type="content" source="media/power-bi-visualization-new-card/format-2.png" alt-text="This image displays the formatting settings available to personalize the callout of a card. These settings include font, color, and transparency, which can be applied to all cards." lightbox="media/power-bi-visualization-new-card/format-2.png":::

1. In **Apply settings to**, select a single series and then change the **color** and **horizontal alignment**. If you need to format a value in a specific way, you can use the **Custom** display units option and enter a format code in the text field. For example, typing **$#,#** as the format code changes the data type to currency format.

   :::image type="content" source="media/power-bi-visualization-new-card/format-3.png" alt-text="The image shows formatting settings for a single card, including color, horizontal alignment, and display units." lightbox="media/power-bi-visualization-new-card/format-3.png":::

1. In **Apply settings to**, select all series and then change **font size**, **position** and turn on **text wrap**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-4.png" alt-text="This image displays the two cards with labels shown in Segoe UI Regular font on size 10, dark gray color and 0% transparency. The labels are positioned below the values, with text wrap and baseline alignment enabled." lightbox="media/power-bi-visualization-new-card/format-4.png":::

1. Adjust the space between the value and label by using **vertical spacing**. However, it's important to note that this feature only works when applied to all series.

   :::image type="content" source="media/power-bi-visualization-new-card/format-5.png" alt-text="This image displays the two cards with a vertical spacing of four pixels between them." lightbox="media/power-bi-visualization-new-card/format-5.png":::

1. Expand the **Layout** section and change the **vertical alignment**, **orientation**, and **space between cards**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-6.png" alt-text="This image displays the two cards with vertical alignment set to top, vertical orientation and a spacing of two pixels between cards." lightbox="media/power-bi-visualization-new-card/format-6.png":::

1. To modify all cards at once, expand the **Cards** section, select All series under **Apply settings to** and adjust **padding**, **fill color**, **fill transparency**, and **border color**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-7.png" alt-text="This image displays the two cards with a blue fill at 90% transparency and a blue border." lightbox="media/power-bi-visualization-new-card/format-7.png":::

1. To modify a single card, select a series under **Apply settings to** and adjust **fill color** and **border color**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-8.png" alt-text="This image shows a card with the Total Sales series selected and filled with a green color that is 90% transparent." lightbox="media/power-bi-visualization-new-card/format-8.png":::



## Considerations and limitations

* The card (new) visual is a preview feature turned on by default. However, if you prefer to disable the preview, or control when you see it, you can still find toggle under **Options** > **Preview features** > **New card visual**. This addition doesn't affect existing card visuals, so we believe it doesn't cause any disruption to the user experience.
* Certain settings only take effect if the **Apply settings to** option is set to **All**. Other settings can only be configured by selecting an independent measure series.
* We take into account that the corner setup function of the shape is currently based on a percentage, which can make it difficult the appearance control. To improve precision, we're planning to replace the percentage-based system with one that uses pixels instead.
* Currently, the shadow and glow effect can cause the size of all cards to change unexpectedly. Our team is actively working on a solution to this issue.
* When we use the **Edit interactions** and **Filters in this visual** features and making a change, this change affects all cards within the container.
* It isn't possible to pin individual cards to a dashboard. Instead, all cards within the dashboard are pinned together.
* There are no limits to the number of cards that can be added to the new visual card. However, it's important to note that adding a large number of cards may cause the report to experience latency and slow data loading.
* We must consider that the new card visual currently doesn't support scrolling or pagination. As a result, if the container is small and multiple cards are added, they may appear in a reduced size. Our team is actively working on a solution to this issue.


## Next steps
[Combo charts in Power BI](power-bi-visualization-combo-chart.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
