---
title: New Card visualizations (large number tiles)
description: Create a New Card visualization in Power BI.
author: v-peabundio
ms.author: v-peabundio
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/21/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Create card visualizations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The new card is a helpful visual that presents important metrics such as total sales, profit growth, count of opportunities, or performance status. It is designed to be displayed in a visual container with multiple cards, enabling users to select the most relevant OKRs (Objectives and Key Results) and define an area for them.

:::image type="content" source="media/power-bi-visualization-card/power-bi-opportunities-card.png" alt-text="Screenshot of card visualization.":::

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

2. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

3. Browse to the **Retail Analysis Sample PBIX.pbix** file, then select **Open**.

4. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Build a new card visual

# [On the ribbon](#tab/On-the-ribbon)


## Option 1: Create a card using the report editor

The first method to create a card is to use the report editor in Power BI Desktop.

1. In the ribbon, select **Visual gallery** under **Insert**.

  
1. In the Visual gallery menu, select the **New card visual** icon.

 
1. To add fields or measures, select the **+Add data** button. Each added data will be displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-visualization.png" alt-text="Once selected, an empty visual list will be integrated to add data.":::



# [On the report canvas](#tab/On-the-report-canvas)

You can create a card directly from the report canvas.

1. In the report canvas, right click to display a menu, then select the **+Add visual** button.

1. In the On-object menu, expand the Visual types dropdown to select the **New card visual** icon.

1. To add fields or measures, select the **+Add data** button. Each added data will be displayed as a distinct card.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-box.png" alt-text="Once the visual is selected, it is time to add the data directly to the upper icon integrated into the visual..":::



# [In the data pane](#tab/In-the-data-pane)

Another commonly employed approach for creating a new card visual is to start the process from the data pane.

1. In the report canvas, right click to display a menu, then select the **+Add visual** button.

1. In the Data pane, select some measures or fields.

1. In the On-object menu, we can see the **data fields** applied on the visual.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-format-card-2.png" alt-text="The data dragged from the data panel will be reflected in the panel of each vidual..":::

---

## Formatting the new card visual

The new card visual provides a wide range of options for customization. To gain a better understanding of these options, we recommend creating a new card visual with multiple values and exploring the Format pane. This will allow you to experiment with various formatting options and discover the full range of features available. 

To access the Format pane, simply interact with the card within the report.

1. Keeping the new card visual selected, start by selecting the paint brush icon to open the format pane.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-overview-chart.png" alt-text="The format panel is activated in the View tab of Power BI.":::

1. Expand the **Callout** section and **Apply settings** to all series to change the **font family**, **font size**, **color**, and **transparency**. By doing so, you will be able to modify all cards simultaneously.

      :::image type="content" source="media/power-bi-visualization-card/power-bi-card-visualization.png" alt-text="Apply to allows us to apply a change in general or individually style a specific field.":::

1. In **Apply settings to**, select a single series and then change the **color** and **horizontal alignment**. If you need to format a value in a specific way, you can use the **Custom** display units option and enter a format code in the text field. For example, typing **$#,#** as the format code will change the data type to currency format.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-card.png" alt-text="Once a specific change is applied to a series, that series will not be affected when we make changes in general.":::

1. In **Apply settings to**, select all series and then change **font size**, **position** and turn on **text wrap** and adjust the space between the value and label by using **vertical spacing.**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-conversion.png" alt-text="However, it is important to note that this feature only works when applied to all series.":::

1. Expand the **Layout** section and change the **vertical alignment**, **orientation**, and **space between cards**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-format-2.png" alt-text="As shown in the image settings such as alignment can be managed independently.":::

1. To modify all cards at once, expand the **Cards** section, select All series under **Apply settings to** and adjust **padding**, **fill color**, **fill transparency**, and **border color**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-format-category.png" alt-text="For a more precise style we have to be switching between All series and a specific series.":::

1. To modify a single card, select a series under **Apply settings to** and adjust **fill color**** and border color**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-format-color-2.png" alt-text="Finally we select a series to apply the last configuration and thus we obtain a card with better style.":::



## Considerations and troubleshooting

* The new card visual is a preview feature turned on by default. However, if you prefer to disable the preview, or control when you see it, you can still find toggle under **Options** > **Preview features** > **New card visual**. As this addition does not affect existing card visuals, we believe it will not cause any disruption to the user experience.
* Please note that certain settings will only take effect if the 'Apply settings to' option is set to 'All'.
* We're aware that the shape corner feature is currently based on percentage, which can make it difficult to control. To improve precision, we're planning to replace the percentage-based system with one that uses pixels instead.
* Currently, the shadow and glow effect can cause the size of all cards to change unexpectedly. Our team is actively working on a solution to this issue.
* When using the 'Edit interactions' and 'Filters on this visual' features, any changes made will affect all cards within the container.
* It is not possible to pin individual cards to a dashboard. Instead, all cards within the dashboard will be pinned together.
* While there are no limits to the number of cards that can be added to the new card visual, it's important to note that a large number of cards may cause the report to experience latency.
* Please be aware that the new card visual currently does not support scrolling or pagination. As a result, if the container is very small and multiple cards are added, they may appear very small. Our team is actively working on a solution to this issue.


## Next steps
[Combo charts in Power BI](power-bi-visualization-combo-chart.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
