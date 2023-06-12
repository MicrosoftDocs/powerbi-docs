---
title: Create a new card visual
description: Create a new card visualization in Power BI.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 06/12/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
---

# Create a new card visual

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A single number, such as total sales, market share year over year, or total opportunities, is sometimes the most important thing you want to track. A type of visualization in Power BI called a *card* may be the best way to view that number. As with almost all of the native Power BI visualizations, cards can be created using the report editor or Q&A.

:::image type="content" source="media/power-bi-visualization-card/power-bi-opportunities-card.png" alt-text="Screenshot of card visualization.":::

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the Retail Analysis Sample.

1. Download the [sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix) to your desktop.

2. Open Power BI Desktop, and from the menu bar, select **File** > **Open report**.

3. Browse to the **Retail Analysis Sample PBIX.pbix** file, then select **Open**.

4. On the left pane, select the **Report** icon :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png"::: to open the file in report view.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the built-in Retail Analysis Sample in the Power BI service.

1. Open the Power BI service, then select **Get data** in the bottom left corner.

2. On the Get Data page that appears, select **Samples**.

   :::image type="content" source="media/power-bi-visualization-slicers/get-data-samples.png" alt-text="Screenshot of Get Data box with link to samples.":::

3. Select the **Retail Analysis Sample**, and choose **Connect**.

4. Select **Edit** on the menu bar to display the **Visualizations** pane.

5. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Option 1: Create a card using the report editor

The first method to create a card is to use the report editor in Power BI Desktop.

1. Select the **Store** \> **Open Store Count** field.

    Power BI creates a column chart with the one number.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-overview-chart.png" alt-text="Screenshot showing an example number tile chart.":::

1. In the Visualizations pane, select the **Card** icon.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-visualization.png" alt-text="Screenshot showing an example number title card.":::

You've now successfully created a card with the report editor. Below is the second option for creating a card using the Q&A question box.

## Option 2: Create a card from the Q&A question box

The Q&A question box is another option for you to use when creating a card. The Q&A question box is available in Power BI Desktop report view.

1. In the Visualizations pane, select the **Q&A** icon.

   Power BI creates a Q&A visualization with a box for you to "Ask a question about your data."

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-visualization.png" alt-text="Screenshot showing a new Q&A visualization with a question box.":::

1. For example, type "Total Sales for Tina" in the question box.

   The question box helps you with suggestions and restatements. At this point, the entire **TotalSales** number is displayed until you further qualify it and select **Total Sales for Tina Lassila (store DM)**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-box.png" alt-text="Question box example.":::

1. Select the icon to the right of the question box to convert the Q&A visualization to a card visualization.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-conversion.png" alt-text="Screenshot showing a Q&A visualization with the 'Turn this Q&A result into a standard visual' icon highlighted.":::

Power BI makes the conversion. Notice that the card icon is now highlighted in the Visualizations pane.

:::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-card.png" alt-text="Card example from question method.":::

You've now successfully created a card with the Q&A question box. Below are steps for formatting your card to your specific needs.

## Format a card

You have many options for changing labels, text, color and more. The best way to learn is to create a card and then explore the Format pane. Here are just a few of the formatting options available. 

The Format pane is available when interacting with the card in a report.

1. Start by selecting the paint brush icon to open the Format pane.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-format-card-2.png" alt-text="Screenshot of the paint brush icon in the Format pane.":::

1. With the card selected, expand **Callout value** and change the **Font**, **Text size**, and **Color**. If you had thousands of stores, you could use **Display units** to show the number of stores by thousands and control the decimal places as well. For example, 125.8K instead of 125,832.00.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-format-2.png" alt-text="Screenshot of Callout value expanded to change font and color.":::

1. Expand **Category label** and change the **Font**, **Text size**, and **Color**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-format-category.png" alt-text="Screenshot of Category label expanded to change font and color.":::

1. Choose **General**, then expand **Background** under **Effects**. Move the slider to On. Now you can change the background **Color** and **Transparency**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-format-color-2.png" alt-text="Screenshot of Background expanded to change color.":::

1. Continue to explore the formatting options until your card is exactly how you'd like it.

## Considerations and troubleshooting

If you don't see a question box at all, contact your Power BI admin.

## Next steps
[Combo charts in Power BI](power-bi-visualization-combo-chart.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
