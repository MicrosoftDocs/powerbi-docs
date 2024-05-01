---
title: Create a "new" card visualization 
description: The "new" card visual allows you to display individual and group callouts in a single container, with a wide range of formatting settings available to customize its appearance completely.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 04/30/2024
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Create a (new) card visualization in Power BI Desktop (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

The (new) card is a helpful visual that presents important metrics such as total sales, profit growth, count of opportunities, and performance status. You can create cards for the metrics that align with your objectives and key results (OKRs) and display them grouped in a single visual container.

:::image type="content" source="media/power-bi-visualization-new-card/power-bi-opportunities-card.png" alt-text="Screenshot of card visualization.":::

> [!IMPORTANT]
> The (new) card visual is currently in preview and only available for Power BI Desktop. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites

To share your report with a Power BI colleague, you must both have individual Power BI Pro licenses, or you must save the report in Premium capacity. The card visual applies only to Desktop and isn’t available in Power BI service.

### Considerations and limitations (preview)

* The new card visual is currently being developed and updated over several releases. Once it reaches its final stage, it replaces the existing Card, Multi-row card, and KPI card. However, reports that continue to use these older visuals will still be supported.
* Certain settings only take effect if the **Apply settings to** option is set to **All**. Other settings can only be configured by selecting an independent measure series.
* By design, the shadow and glow effect can cause the size of all cards to change unexpectedly.
* **Edit interactions** and **Filters in this visual** influence all cards within the container.
* You can't pin individual cards to a dashboard. Instead, all cards in the new card visual are pinned together.
* There are no limits to the number of cards that you can add to the new card visual. However, adding a large number of cards might cause the report to experience latency and slow data loading.
* The new card visual currently doesn't support scrolling or pagination. As a result, if the container is small and you add multiple cards, they might appear in a reduced size.
* The new card visual is a preview feature turned on by default. If you prefer to disable the preview, or control when you see it:
    1. In the Fabric Admin settings, go to **Options**.
    1. Then select **Preview features**.
    1. Turn off **New card visual**.

    This change doesn’t influence existing card visuals.

## Get the sample

The following procedure uses the Retail Analysis Sample.

1. Download the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. In Power BI Desktop, select **File**, then select **Open report**.

1. Search for and select the **Retail Analysis Sample PBIX** file, then select **Open**.

1. The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: 

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-new-card/add-1.png"::: to add a new page to the report.


## Build a new card visualization

# [On the ribbon](#tab/On-the-ribbon)

The first way to create a new card is to use the ribbon in Power BI Desktop.

1. In the **Insert** ribbon, select **Visual gallery**, then select the **Card (new)** visual icon. When the visual placeholder appears, a dialogue box that says **Suggest a visual** is automatically displayed. You can close this dialogue box before moving to the next step.

   :::image type="content" source="media/power-bi-visualization-new-card/insert-visual-gallery-new-card.png" alt-text="This screen shows the Insert menu with the visual gallery ribbon expanded to show the Card (new) visual selected, and the dialogue box ‘Suggest a visual’ is displayed." lightbox="media/power-bi-visualization-new-card/insert-visual-gallery-new-card.png":::

1. To add fields or measures, select **fields** in the **Data** pane. Add the **StoreCount** and **TotalSalesTY** data fields. Each data field you add is displayed as its own card.
 
   :::image type="content" source="media/power-bi-visualization-new-card/add-data-data-pane.png" alt-text="This screen shows the Data panel open with two data fields selected and afterwards added to the visual, creating two distinct cards." lightbox="media/power-bi-visualization-new-card/add-data-data-pane.png":::

# [On the report canvas](#tab/On-the-report-canvas)

A second way to create a card is directly from the report canvas.

1. In the report canvas, right click to display a menu, then select **Add visual**.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-1.png" alt-text="This screen shows a menu that appears when the user right clicks on the canvas. The menu shows an option to add a new visual." lightbox="media/power-bi-visualization-new-card/canvas-1.png":::

1. In the **Suggest a visual** menu, expand the Visual types dropdown to select the **Card (new)** visual icon.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-2.png" alt-text="This screen shows an empty container with the visual dialog highlighting the card (new) icon selected." lightbox="media/power-bi-visualization-new-card/canvas-2.png":::

1. To add fields or measures, select **Add data**. Add the **StoreCount** and **TotalSalesTY** data fields. Each data field you add is shown as its own card.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas-3.png" alt-text="This screen shows a card with both the Store count and Total Sales fields visible. The Data section, where the fields were added, is also shown in the same view." lightbox="media/power-bi-visualization-new-card/canvas-3.png":::

# [In the data pane](#tab/In-the-data-pane)

Another way to create a new card visual is to start from the Data pane.

1. In the **Data** pane, select the **StoreCount** and **Value** data under **TotalSalesTY**. This automatically creates a container on the canvas that shows the selected data.

   :::image type="content" source="media/power-bi-visualization-new-card/data-pane-new-visual.png" alt-text="This screen shows a container with two data measures that were selected from the Data pane." lightbox="media/power-bi-visualization-new-card/data-pane-new-visual.png":::

1. On the **Home** ribbon, select the **Visual gallery** and then select the **Card (new) visual**.

   :::image type="content" source="media/power-bi-visualization-new-card/visual-gallery-new-card-style.png" alt-text="This screen shows a card with Visual gallery highlighted in the Home ribbon. The Card (new) visual icon is also highlighted in the dropdown menu, in the same view." lightbox="media/power-bi-visualization-new-card/visual-gallery-new-card-style.png":::

---

## Format the new card visual

The new card visual provides a wide range of options for customization. To better understand these options, create a new card visual with multiple values and explore the **Format** pane. This way you can experiment with various formatting options and discover the full range of features available.

1. Select the new card and choose the paint brush icon to open the **Format** pane.

   :::image type="content" source="media/power-bi-visualization-new-card/format-1.png" alt-text="This screen shows a Format pane icon that opens up all available formatting settings for a card (new)." lightbox="media/power-bi-visualization-new-card/format-1.png":::

1. To change all cards at the same time, first, expand the **Callout values** and the **Values** sections.
1. Under **Apply settings** to section, select **Series All**.

1. Then you can select and change **Font family**, then **Font size**, **Color**, **Transparency**, and **Horizontal alignment**. This changes all the cards at the same time. Apply the following settings for this exercise:
    1. Change the **Font** to **Segoe UI Bold**.
    1. Change the **size** to **18**.
    1. Set the **Color** to blue.
    1. Set the **Transparency** to **0%**.
    1. Change the **Horizontal Alignment** to **left**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-2.png" alt-text="This screen shows the formatting settings available to personalize the Callout of a card. These settings include font, color, and transparency, which can be applied to all cards.":::

1. To change a single card, under the **Apply settings to** section, select a single **Series** and then you can change **Font** type and **size**, **Color**, **Transparency**, **Horizontal alignment**, **Display units**, and **Value decimal places**. Apply the following settings for this exercise:
    1. Under **Apply settings to** select **Total Sales**.
    1. Change the **Font** to **Segoe UI Bold**.
    1. Change the **size** to **18**.
    1. Set the **Color** to green.
    1. Set the **Transparency** to **0%**.
    1. If you need a specific value format, under the **Display units**, select **Custom, and enter your desired **format code** in the text field. For example, typing **$#,###M,** as the format code changes the data type to currency format.

   :::image type="content" source="media/power-bi-visualization-new-card/format-3.png" alt-text="The screen shows formatting settings for the Callout values of a single card, including font color, transparency, horizontal alignment, display units, and value decimal places.":::

1. To format labels, in **Apply settings to**, select series **All** You can also select an individual series, but for this exercise set it to **All**.

1. Expand the **Label** section where you can then change **Font** type and size, **Color**, **Transparency**, **Position**, **Space between label and value**, turn on **Text wrap**, and **Match value alignment** After you expand the **Label** section, apply the following settings for this exercise:
    1. Change the **Font** to **Segoe UI Regular**.
    1. Change the **size** to **18**.
    1. Set the **Color** to dark gray color.
    1. Set the **Transparency** to **0%**.
    1. Under **Position**, select **Below Value** from the dropdown menu.
    1. Set the **Space between label and value** to **8**
    1. Turn **off** the **text wrap**.
    1. Turn **Match value alignment** on.
    1. Then, turn on **Align baselines**.
    
   > [!NOTE]
   > The Align baselines toggle is only available when **All series** is selected.

   :::image type="content" source="media/power-bi-visualization-new-card/format-4.png" alt-text="This screen shows the two cards with labels shown in Segoe UI Regular font, dark gray color and 0% transparency. The labels are positioned below the values, with text wrap turned off and both value and baseline alignment turned on.":::

1. Adjust the space between the value and label by using **Vertical spacing**.

    > [!IMPORTANT]
    > This setting only works when applied to **All** series.
    
    1. Make sure the series is set to **All**.
    1. Under **Spacing** got to **Vertical Spacing**
    1. Change the Vertical spacing to **4**.
    
   :::image type="content" source="media/power-bi-visualization-new-card/format-5.png" alt-text="Screenshot showing the two cards with a vertical spacing of four pixels between them." lightbox="media/power-bi-visualization-new-card/format-5.png":::

1. Expand the **Layout** section and apply the following changes to the settings. You can also change **Callout size** if you're using **Reference labels**, otherwise this option is turned off:
    1. Change the **Vertical alignment** to **top**.
    1. **Callout size** is **off** because you didn't use a reference label.

   :::image type="content" source="media/power-bi-visualization-new-card/format-6.png" alt-text="This screen shows the two cards with vertical alignment set to top, and the Callout size is turned off." lightbox="media/power-bi-visualization-new-card/format-6.png":::

### Change all cards

There might be a time when you want to format all of the cards at once. Use the following procedure to learn how to apply changes to all of your cards at one time:

1. Expand the **Cards** section.
1. Under **Apply settings to**, select **All** from the **Series** dropdown.
1. Then, apply the following settings:
    1. Expand **Shape** and select **Rounded Rectangle** for the shape and set to **25 px**.
    1. Set the **Background** to the color blue.
    1. Set the **Transparency** to **90%**.
    1. Turn on the Border toggle.
    1. Turn **Shadow**, **Glow, and **Accent bar** off. 

   :::image type="content" source="media/power-bi-visualization-new-card/format-7.png" alt-text="This screen shows Series All selected, and displays the two cards with a Rounded Rectangle, Rounded Corners set to 25 pixels, a blue Background with 90% Transparency, and the Border toggle is on." lightbox="media/power-bi-visualization-new-card/format-7.png":::

### Change a single Card

There might be a time when you want to format only one of the cards in your visual. Use the following procedure to learn how to apply changes to only a single card:

1. Keep the **Cards** section expanded.

1. Under **Apply settings to** set the series to **Total Sales**.

1. Turn on **Background**:
    1. Expand the **Background** section.
    1. Change the background **Color** to lime green.
    1. Change the **Transparency** to **90%**.

1. Turn on **Border**:
    1. Expand the **Border** section.
    1. Change the border **Color** to green.
    1. Then change the border **Width** to **2 px**
    1. Set the **Transparency** to **0%**.

   :::image type="content" source="media/power-bi-visualization-new-card/format-8.png" alt-text="This screen shows the visual with the Total Sales series selected, but the lower card is now displayed with a green Background color, 90% Transparency, and a 2-pixel darker green Border." lightbox="media/power-bi-visualization-new-card/format-8.png":::

## New card’s reference labels

Reference labels are a new feature that allows you to add custom labels to your new cards. These labels provide additional information and comparisons and helps you to highlight key metrics, benchmarks, and goals. In the following procedure, you learn how to use reference labels:

1. First, make sure you already [created](#build-a-new-card-visualization) and [formatted](#format-the-new-card-visual) a (new) card visual.

1. To add reference labels, select the visual you created and select the **edit icon**.

1. Then, choose the **More options** button, and expand the **Reference labels** section.

    :::image type="content" source="media/power-bi-visualization-new-card/reference-label-expanded.png" alt-text="This screen shows the edit icon selected, and the More options button selected, with the Reference labels section expanded." lightbox="media/power-bi-visualization-new-card/format-7.png":::

1. In the **Select series** dropdown, choose the **Total Sales** card.

1. Then, in the **Add label** field, select a data field or measure to add reference labels to. For this how-to exercise, select **Total Sales LY** and **Total Sales Variance**.

   > [!NOTE]
   > You can include multiple data fields when you add reference labels.

   :::image type="content" source="media/power-bi-visualization-new-card/reference-label-add.png" alt-text="This screen shows the Total Sales series selected and highlights two Callouts just added to the Total Sales card as selected under the Add label field of Reference labels section.":::

   Reference labels are composed of three fully customizable key elements. The Title displays the content Field name. Value showcases the assigned data field value. And Detail adds extra context to showcase extra information from a single data field. Each element is fully customizable including Font, Color, and Transparency.

1. Under **Apply settings to** select **Series all**
1. Turn on the **Title** toggle and expand the **Title** Section:  
    1. Change the **Font** to **Segoe UI Semibold**.
    1. Change the **size** to **12**. 
    1. Change the **Color** to green.
    1. Change the  **Transparency** to **0%**.

   :::image type="content" source="media/power-bi-visualization-new-card/reference-label-font-value.png" alt-text="The screen shows formatting settings for the Title and Value sections of the two recently added Reference labels on a single card, including font, color, and transparency":::

1. Turn on the **Value** toggle and expand the **Value** Section:  
    1. Change the **Font** to **Segoe UI Bold**.
    1. Change the **size** to **12**.
    1. Change the **Color** to green.
    1. Change the **Transparency** to **0%**.

    Reference labels also include multiple options to include an Accent bar, Background color, and even Layout options to specify whether the Reference label is either below or to the right of the callout. Layout options also can include Rows or Columns, and either a Sentence or Tabular style to maximize the ability to customize the visual.

1. Turn on the **Background** toggle and expand the **Background** Section:  
    1. Change the **Color** to light green.
    1. Change the **Transparency** to **0%**.

    :::image type="content" source="media/power-bi-visualization-new-card/reference-label-background-accent.png" alt-text="This screen shows the two cards with reference labels shown background set light green color and 0% transparency. The labels also have an accent bar positioned left of the values, with a green color and 0% transparency.":::

1. Turn on the **Accent bar** toggle and expand the **Accent bar** Section:  
    1. Change the position to **Left** from the **Position** dropdown options.
    1. Change the **Color** to green.
    1. Change the **Transparency** to **0%**.
    1. Change the **Width** to **10 px**.

1. When you're finished formatting your cards, click your mouse anywhere on the canvas to close the visual elements editor.

## Related content

- [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
