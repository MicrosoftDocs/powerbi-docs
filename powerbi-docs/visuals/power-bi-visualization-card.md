---
title: Card visualizations (big number tiles)
description: Create a Card visualization in Power BI
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 05/05/2020
LocalizationGroup: Visualizations
---

# Create card visualizations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Sometimes a single number is the most important thing you want to track in your Power BI dashboard or report, such as total sales, market share year over year, or total opportunities. This type of visualization is called a *Card*. As with almost all of the native Power BI visualizations, Cards can be created using the report editor or Q&A.

:::image type="content" source="media/power-bi-visualization-card/pbi-opptuntiescard.png" alt-text="Card visualization.":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

## Prerequisite

This tutorial uses the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix)

1. From the upper left section of the menubar, select **File** \> **Open report**

1. Find your copy of the **Retail Analysis Sample PBIX file**

1. Open the **Retail Analysis Sample PBIX file** in report view :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::.

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

## Option 1: Create a card using the report editor

The first method to create a card is to use the report editor in Power BI Desktop.

1. Start on a blank report page and select the **Store** \> **Open Store Count** field.

    Power BI creates a column chart with the one number.

   :::image type="content" source="media/power-bi-visualization-card/pbi-overview-chart.png" alt-text="Screenshot showing an example number tile chart.":::

1. In the Visualizations pane, select the card icon.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-visualization.png" alt-text="Screenshot showing an example number title card.":::

You have now successfully created a card with the report editor. Below is the second option for creating a card using the Q&A question box.

## Option 2: Create a card from the Q&A question box

The Q&A question box is another option for you to use when creating a card. The Q&A question box is available in Power BI Desktop report view.

1. Start on a blank report page

1. In the Visualizations pane, select the **Q&A** icon.

   Power BI creates a Q&A visualization with a box for you to "Ask a question about your data".

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-visualization.png" alt-text="Screenshot showing a new Q&A visualization with an 'Ask a question about your data' box.":::

1. For example, type "Total Sales for Tina" in the question box.

   The question box helps you with suggestions and restatements. At this point, the entire **TotalSales** number is displayed until you further qualify it and select **Total Sales for Tina Lassila (store DM)**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-box.png" alt-text="Question box example.":::

1. Select the icon to the right of the question box to convert the Q&A visualization to a card visualization.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-conversion.png" alt-text="Screenshot showing a Q&A visualization with the 'Turn this Q&A result into a standard visual' icon highlighted.":::

Power BI makes the conversion. Notice that the card icon is now highlighted in the Visualizations pane.

:::image type="content" source="media/power-bi-visualization-card/power-bi-q-and-a-card.png" alt-text="Card example from question method.":::

You have now successfully created a card with the Q&A question box. Below are steps for formatting your card to your specific needs.

## Format a card

You have many options for changing labels, text, color and more. The best way to learn is to create a card and then explore the Formatting pane. Here are just a few of the formatting options available. 

The Formatting pane is available when interacting with the card in a report.

1. Start by selecting the paint roller icon to open the Formatting pane.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-format-card-2.png" alt-text="Card with paint roller outlined.":::

1. With the card selected, expand **Data label** and change the **Color**, **Text size**, and **Font family**. If you had thousands of stores, you could use **Display units** to show the number of stores by thousands and control the decimal places as well. For example, 125.8K instead of 125,832.00.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-format-2.png" alt-text="Card with data format example.":::

1. Expand **Category label** and change the **Color**, **Text size**, and **Font family**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-card-format-category.png" alt-text="Card with category example.":::

1. Expand **Background** and move the slider to On.  Now you can change the background **Color** and **Transparency**.

   :::image type="content" source="media/power-bi-visualization-card/power-bi-format-color-2.png" alt-text="Slider set to ON.":::

1. Continue to explore the formatting options until your card is exactly how you'd like it.

## Considerations and troubleshooting

If you do not see a question box at all, contact your Power BI admin.

## Next steps
[Combo charts in Power BI](power-bi-visualization-combo-chart.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
