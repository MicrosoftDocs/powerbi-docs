---
title: Create a card visual in Power BI
description: This article provides an understanding of the card visual and a quick three-step guide on how to build a card visual in Power BI Desktop.
author: jacinda-eng
ms.author: jacindaeng
ms.reviewer: JulCsc
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/28/2025
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the card visual so that I can effectively and more easily build card visuals in Power BI Desktop.
---

# Create a Card visual in Power BI

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

The Card visual in Power BI is a versatile tool for presenting key metrics in a visually appealing format. Each card can display a specific metric, such as total sales or profit growth, and can be customized to reflect your objectives and key results (OKRs). This flexibility allows users to group multiple cards within a single container, providing full control over every component of each card, and a comprehensive overview of important data points at a glance.

The Card visual is useful in business and finance for showcasing critical performance indicators, as well as in marketing for highlighting metrics like customer engagement and conversion rates. With its sleek design and enhanced functionality, the Card visual enables users to interact with their data more effectively and make informed decisions based on real-time insights.

> [!NOTE]
> The **(new) Card visual** became generally available as the **Card visual** with the November 2025 Power BI release. If you used this visual during Public Preview, you may notice behavior or formatting changes that reflect improvements included in the General Availibility release. You can customize the visual using the Format pane.

## Prerequisites

[!INCLUDE [prerequisites-desktop-download-latest-version-pbi-desktop](../includes/core-visuals/prerequisites-desktop-download-latest-version-pbi.md)]
[!INCLUDE [prerequisites-desktop-download-retail-analysis-sample-pbix](../includes/core-visuals/prerequisites-desktop-download-retail-analysis-sample-pbix.md)]

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual **Power BI Pro license** or that you have saved the report in **Premium capacity**. Keep in mind that the card visual applies only to **Power BI Desktop** and isn’t available in Power BI service.

## Let's create Card visual

There are three similar ways to create a Card visual:

- Start from the Insert ribbon, and select New visual, then select the Card visual icon from the Visualizations pane, or
- Start from the Visualizations pane, and select the Card visual icon, or lastly,
- Expand the Data pane, and select the necessary data fields, and then select the Card visual icon from the Visualizations pane.  

For this quick three-step guide, let's use the first option:

1. In the **Insert** ribbon, select **New visual**. When the visual placeholder appears on the report canvas, expand the **Visualizations** pane and select the **Card visual** icon in the **Build visual** menu.

    :::image type="content" source="media/power-bi-visualization-new-card/build-new-card-desktop-step-1.png" alt-text="Screenshot with the Insert ribbon, New visual button, Visualizations pane, Build visual icon, and the Card visual icon, all highlighted." lightbox="media/power-bi-visualization-new-card/build-new-card-desktop-step-1.png":::

2. To add data to the visual, let’s use the **Data pane** in this example. Adding data can be done by selecting each field in the **Data pane**, or dragging the fields to the field wells on the **Visualizations pane**, or dragging the fields directly to the visual placeholder in the report canvas. Expand the **Sales** group, to add **StoreCount**, then expand the **TotalSalesTY** subgroup, and add **Value**. You'll notice that each data field you add is displayed as its own card.

    :::image type="content" source="media/power-bi-visualization-new-card/build-new-card-desktop-step-2.png" alt-text="Screenshot: Data pane, Sales group expanded, StoreCount + TotalSalesTV measures highlighted, selected, and added to Data field in Visualizations pane." lightbox="media/power-bi-visualization-new-card/build-new-card-desktop-step-2.png":::

3. To customize your visual, select the Format visual icon in the Visualizations pane, granting you access to all available settings. This allows you to tailor the chart's appearance and functionality to your specific requirements as shown in the example.

    :::image type="content" source="media/power-bi-visualization-new-card/build-new-card-desktop-step-3.png" alt-text="Screenshot: Visualizations pane selected, expanded, Format visual icon selected. Visual + General tabs displayed, Visual tab displays format controls." lightbox="media/power-bi-visualization-new-card/build-new-card-desktop-step-3.png":::

Congratulations! You've successfully created a card visual with Power BI Desktop.

### Additional updates

#### Image

The Card visual now includes Image Hero support, allowing you to add a prominent image to the card to visually represent the data or category being displayed. This feature is especially useful for dashboards that benefit from visual storytelling or branding. You can enable and customize the image through the Format pane under Image settings, where options include image placement (for example, overlay or side-by-side), size adjustments, and alignment controls. This enhancement helps make your visuals more engaging and contextually rich.

#### Collage layout

The Card visual introduces a new **Collage layout** option. This layout arranges multiple cards in a dynamic, freeform style that breaks away from traditional grid-based designs. It’s ideal for dashboards that aim for a more creative or informal presentation. You can activate this layout by navigating to the **Format pane**, selecting **Layout**, and choosing **Collage** under the **Arrangement** dropdown. The collage layout automatically adapts to the content and available space, offering a visually appealing alternative to standard layouts.

#### Additional styling capabilities

The Card visual also brings expanded styling capabilities, giving you more control over the appearance of each card. These enhancements include advanced font settings (such as typeface, weight, and size), customizable backgrounds and borders, and conditional formatting options for both text and images. These settings are accessible in the **Format** pane under sections like **General** > **Style** and **Visual** > **Callout value**. With these tools, you can tailor the visual design to match your report themes, improve readability, and highlight key metrics more effectively.

Take the time to familiarize yourself with the [Considerations and limitations](power-bi-visualization-card-visual-considerations.md) for card visuals.

## Related content

- [Card visual considerations and limitations](power-bi-visualization-card-visual-considerations.md)
- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
