---
title: Card visualizations (large number tiles)
description: Learn how to use the Retail Analysis Sample file to create a Card visualization in Power BI to view a single type of data, such as total sales.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/18/2023
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations 
---

# Create card visualizations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A single number, such as total sales, market share year over year, or total opportunities, is sometimes the most important thing you want to track. A type of visualization in Power BI called a *card* might be the best way to view that number. As with almost all of the native Power BI visualizations, you can create cards with the report editor or Q&A. Here's an example of a card visualization:

:::image type="content" source="media/power-bi-visualization-card/power-bi-opportunities-card.png" alt-text="Screenshot of card visualization.":::

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

This tutorial uses the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. At the top left, select **File** > **Open report**.

1. Find your copy of the **Retail Analysis Sample PBIX** file, and select **Open**.

   The **Retail Analysis Sample PBIX** file opens in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

# [Power BI service](#tab/powerbi-service)

This tutorial uses the built-in Retail Analysis Sample in the Power BI service.

1. Sign in to the Power BI service (`app.powerbi.com`).

1. Select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, locate the **Retail Analysis Sample**. Select the sample to download.

   The **Retail Analysis Sample** opens in report view.
  
   :::image type="content" source="media/desktop-ribbon-charts/power-bi-retail-analysis-sample.png" alt-text="Screenshot that shows the Retail Analysis Sample open in report view in the Power BI service." lightbox="media/desktop-ribbon-charts/power-bi-retail-analysis-sample-expanded.png" border="false":::

1. At the top, select **Edit** to open the Report editor.

   :::image type="content" source="media/desktop-ribbon-charts/power-bi-edit-report.png" alt-text="Screenshot that shows how to select Edit to modify the report in the Power BI service." border="false":::

1. At the bottom, select the green plus symbol :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-plus-green-tab.png"::: to add a new page to the report.

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that you have saved the report in Premium capacity.

## Option 1: Create a card using the report editor

The first method to create a card is to use the report editor in Power BI.

1. On the **Data** pane, expand **Store** and select the **Open Store Count** checkbox.

    By default, Power BI creates a clustered column chart with the single data value. You can convert the chart to a card visualization.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-overview-chart.png" alt-text="Screenshot showing an example number tile chart.":::

1. In the **Visualizations** pane, select the **Card** icon.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-visualization.png" alt-text="Screenshot showing an example number title card.":::

You've now successfully created a card with the report editor.

## Option 2: Create a card from the Q&A question box

The Q&A question box is another option for you to use when creating a card. The Q&A question box is available in Power BI report view.

1. In the **Visualizations** pane, select the **Q&A** icon.

   Power BI creates a Q&A visualization with a box for you to "Ask a question about your data."

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-visualization.png" alt-text="Screenshot showing a new Q&A visualization with a question box.":::

1. Let's try searching for sales data by employee name. Enter the text "show me the open store count" in the question box.

   As you enter text, Power BI tries to resolve your search text and shows results that match your input. Continue entering your input until you see an option for **show me the open store count**. Select that option.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-box.png" alt-text="Screenshot showing a question box example.":::

1. Select the icon to the right of the question box to convert the Q&A visualization to a card visualization.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-conversion.png" alt-text="Screenshot showing a Q&A visualization with the 'Turn this Q&A result into a standard visual' icon highlighted.":::

Power BI makes the conversion. Notice that the card icon is now highlighted in the **Visualizations** pane.

:::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-card.png" alt-text="Screenshot showing a card example from question method.":::

You've now successfully created a card with the Q&A question box.

> [!NOTE]
> If you don't see a question box at all, contact your Power BI admin.

## Format a card

You have many options for changing labels, text, color and more. The best way to learn is to create a card and then explore the **Format** section of the **Visualizations** pane. Here are just a few of the formatting options available.

The **Format** section is available when interacting with the card in a report.

1. Start by selecting the paint brush icon at the top of the **Visualizations** pane to open the **Format** section.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-format-card-2.png" alt-text="Screenshot of the paint brush icon in the **Format** pane.":::

1. With the card selected, expand **Callout value** and change the **Font**, **Text size**, and **Color**. If you had thousands of stores, you could use **Display units** to show the number of stores by thousands and control the decimal places as well. For example, 125.8 K instead of 125,832.00.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-format-2.png" alt-text="Screenshot of Callout value expanded to change font and color.":::

1. Expand **Category label** and change the **Font**, **Text size**, and **Color**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-format-category.png" alt-text="Screenshot of Category label expanded to change font and color.":::

1. Choose **General**, expand **Effects**, then expand **Background**.
1. Move the slider to *On*. Now you can change the background **Color** and **Transparency**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-format-color-2.png" alt-text="Screenshot of Background expanded to change color.":::

1. Continue to explore the formatting options until your card is exactly how you'd like it.

## Related content

- [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
