---
title: New Card visualizations (large number tiles)
description: Create a New Card visualization in Power BI.
author: PeterAbundio
ms.author: v-peabundio
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/26/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Create card visualizations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop.md)]

The new card is a helpful visual that presents important metrics such as total sales, profit growth, count of opportunities, or performance status. It's designed to be displayed in a visual container with multiple cards, enabling users to select the most relevant OKRs (Objectives and Key Results) and define an area for them.

:::image type="content" source="media/power-bi-visualization-card/power-bi-opportunities-card.png" alt-text="Screenshot of card visualization.":::

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

1. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

1. Browse to the **Retail Analysis Sample PBIX.pbix** file, then select **Open**.

1. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.

1. Select :::image type="icon" source="media/power-bi-visualization-new-card/Add.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Build a new card visual

# [On the ribbon](#tab/On-the-ribbon)


## Option 1: Create a card using the report editor

The first method to create a card is to use the report editor in Power BI Desktop.

1. In the ribbon, select **Visual gallery** under **Insert**.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon1.png" alt-text="The main menu bar of Power BI is displayed on the screen, with the Insert section selected. Within this section, the visual ribbon can be found.":::

1. In the Visual gallery menu, select the **New card visual** icon.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon2.png" alt-text="To create a new card, first expand the Ribbon of visuals and select the 'Card' category from the available options. Then, select the Card new to begin creating your card."":::

1. To add fields or measures, select the **+Add data** button. Each added data is displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-new-card/ribbon3.png" alt-text="To add data fields, with the visual selected, select on the Add data button located in the configuration menu icon at the top and we add the fields Store Count and Total Sales.":::



# [On the report canvas](#tab/On-the-report-canvas)

You can create a card directly from the report canvas.

1. In the report canvas, right select to display a menu, then select the **+Add visual** button.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas1.png" alt-text="To add a visual, select on the canvas and select the second option from the menu that appears.":::

1. In the On-object menu, expand the Visual types dropdown to select the **New card visual** icon.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas2.png" alt-text="To integrate a new visual, select on the icon of the new card in the menu section that visuals appear on the screen.":::

1. To add fields or measures, select the **+Add data** button. Each added data is displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-new-card/canvas3.png" alt-text="After adding the visual, select the visual settings icon. In the Data section, we add the fields Store Count and Total Sales.":::



# [In the data pane](#tab/In-the-data-pane)

Another commonly employed approach for creating a new card visual is to start the process from the data pane.

1. In the report canvas, right select to display a menu, then select the **+Add visual** button.

   :::image type="content" source="media/power-bi-visualization-new-card/pane1.png" alt-text="Secondary select action open a little menu on the canvas give us the ability to add visuals directly.":::

1. In the Data pane, select some measures or fields.

   :::image type="content" source="media/power-bi-visualization-new-card/pane2.png" alt-text="In the Data panel, we choose the Store Count and Total Sales fields. These fields appear in the Data menu within the visual configuration, allowing for easy access and analysis of the relevant data."":::

1. In the On-object menu, we can see the **data fields** applied on the visual.

   :::image type="content" source="media/power-bi-visualization-new-card/pane3.png" alt-text="After adding the measures, we can view the applied fields by accessing the visual fields. This section displays the Store Count and Total Sales fields, allowing for easy addition or removal of fields within the visual.":::

---

## Formatting the new card visual

The new card visual provides a wide range of options for customization. To gain a better understanding of these options, we recommend creating a new card visual with multiple values and exploring the Format pane. This method allows you to experiment with various formatting options and discovers the full range of features available. 

To access the Format panel, it's necessary to select a visual object. In this case, we select the new card within the report.

1. Select the new card and keep it selected always, start by selecting the paint brush icon to open the format pane.

   :::image type="content" source="media/power-bi-visualization-new-card/format1.png" alt-text="To access the format icon for a visual, select the visual in the right panel under data. If the format icon isn't active in the Power BI view menu, it can be activated to formatting of the visual.":::

1. Expand the **Callout** section and **Apply settings** to all series to change the **font family**, **font size**, **color**, and **transparency**. By doing so, you're able to modify all cards simultaneously.

      :::image type="content" source="media/power-bi-visualization-new-card/format2.png" alt-text="In the Callout tab, we choose the All series and apply Segoe UI Bold with size 18 and Blue color for the text. This formatting is applied to all series within the visual.":::

1. In **Apply settings to**, select a single series and then change the **color** and **horizontal alignment**. If you need to format a value in a specific way, you can use the **Custom** display units option and enter a format code in the text field. For example, typing **$#,#** as the format code changes the data type to currency format.

   :::image type="content" source="media/power-bi-visualization-new-card/format3.png" alt-text="In the Callout section, we select Total Sales in Apply settings to. We change the color to green with 0% transparency and set the horizontal alignment to the right position. In Display Units, we choose Custom and enter $#,###M, in the format code to format the displayed value.":::

1. In **Apply settings to**, select all series and then change **font size**, **position** and turn on **text wrap**.

   :::image type="content" source="media/power-bi-visualization-new-card/format4.png" alt-text="Select all series on apply settings to. Then, go to the Label and select the Segoe UI regular font with size 10 and gray color. Set the transparency to 0% and choose 'Below Value' for the position. Finally, activate Text Wrap and align baseline.":::

1. Adjust the space between the value and label by using **vertical spacing**. However, it's important to note that this feature only works when applied to all series.

   :::image type="content" source="media/power-bi-visualization-new-card/format5.png" alt-text="To apply settings to all series, return to the Apply settings to section and select 'All series'. Then, go to the Spacing section and add 4 px to the Vertical spacing.":::

1. Expand the **Layout** section and change the **vertical alignment**, **orientation**, and **space between cards**.

   :::image type="content" source="media/power-bi-visualization-new-card/format6.png" alt-text="Change to 'Layout' section configuration, select Top for vertical alignment and Vertical for orientation. Then, set the space between cards to 2 px.":::

1. To modify all cards at once, expand the **Cards** section, select All series under **Apply settings to** and adjust **padding**, **fill color**, **fill transparency**, and **border color**.

   :::image type="content" source="media/power-bi-visualization-new-card/format7.png" alt-text="To change the Card configuration, select All in Apply settings to. Then, choose 'Wide' for the size in the Padding section. For the Fill, select blue color with 90% transparency and choose blue color for the Border.":::

1. To modify a single card, select a series under **Apply settings to** and adjust **fill color**** and border color**.

   :::image type="content" source="media/power-bi-visualization-card/format8.png" alt-text="This image shows a card with the 'total sales' series selected and filled with a green color that is 90% transparent.":::



## Considerations and troubleshooting

* The new card visual is a preview feature turned on by default. However, if you prefer to disable the preview, or control when you see it, you can still find toggle under **Options** > **Preview features** > **New card visual**. This addition doesn't affect existing card visuals, so we believe it doesn't cause any disruption to the user experience.
* Certain settings only take effect if the 'Apply settings to' option is set to All. Other settings can only be configured by selecting an independent measure series.
* We take into account that the corner setup function of the shape is currently based on a percentage, which can make it difficult the appearance control. To improve precision, we're planning to replace the percentage-based system with one that uses pixels instead.
* Currently, the shadow and glow effect can cause the size of all cards to change unexpectedly. Our team is actively working on a solution to this issue.
* When we use the 'Edit interactions' and 'Filters in this visual' features and making a change, this change affects all cards within the container.
* It isn't possible to pin individual cards to a dashboard. Instead, all cards within the dashboard are pinned together.
* There are no limits to the number of cards that can be added to the new visual card. However, it's important to note that adding a large number of cards may cause the report to experience latency and slow data loading.
* We must consider that the new card visual currently doesn't support scrolling or pagination. As a result, if the container is small and multiple cards are added, they may appear in a reduced size. Our team is actively working on a solution to this issue.


## Next steps
[Combo charts in Power BI](power-bi-visualization-combo-chart.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
