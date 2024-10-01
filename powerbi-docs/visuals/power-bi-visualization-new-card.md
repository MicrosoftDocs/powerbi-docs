---
title: Create a (new) card visual
description: This article provides an understanding of the (new) card visual and a quick three-step guide on how to build a (new) card visual in Power BI Desktop.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidiseminger
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 04/30/2024
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the (new) card visual so that I can effectively and more easily build card visuals in Power BI Desktop.
---

# Create a (new) Card visual Power BI Desktop

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

## Overview

The (new) Card visual in Power BI is a versatile tool for presenting key metrics in a visually appealing format. Each card can display a specific metric, such as total sales or profit growth, and can be customized to reflect your objectives and key results (OKRs). This flexibility allows users to group multiple cards within a single container, providing full control over every component of each card, and a comprehensive overview of important data points at a glance. 

The (new) Card visual is useful in business and finance for showcasing critical performance indicators, as well as in marketing for highlighting metrics like customer engagement and conversion rates. With its sleek design and enhanced functionality, the (new) Card visual enables users to interact with their data more effectively and make informed decisions based on real-time insights.

:::image type="content" source="media/power-bi-visualization-new-card/power-bi-opportunities-card.png" alt-text="Screenshot that shows card visualization.":::

> [!IMPORTANT]
> The (new) Card visual is currently in preview and only available for Power BI Desktop. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites

[!INCLUDE [prerequisites-desktop-download-latest-version-pbi-desktop](../includes/core-visuals/prerequisites-desktop-download-latest-version-pbi.md)]
[!INCLUDE [prerequisites-desktop-preview-features-new-card-visual](../includes/core-visuals/prerequisites-desktop-preview-features-new-card-visual.md)]
[!INCLUDE [prerequisites-desktop-preview-features-on-object-unselected](../includes/core-visuals/prerequisites-desktop-preview-features-on-object-unselected.md)]
[!INCLUDE [prerequisites-desktop-download-retail-analysis-sample-pbix](../includes/core-visuals/prerequisites-desktop-download-retail-analysis-sample-pbix.md)]

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual **Power BI Pro license** or that you have saved the report in **Premium capacity**. Keep in mind that the (new) card visual applies only to **Power BI Desktop** and isn’t available in Power BI service.

## Let's create a (new) card visual

There are three similar ways to create a (new) Card visual:

- Start from the Insert ribbon, and select New visual, then select the (new) Card visual icon from the Visualizations pane, or
- Start from the Visualizations pane, and select the (new) Card visual icon, or lastly,
- Expand the Data pane, and select the necessary data fields, and then select the (new) Card visual icon from the Visualizations pane.  

For this quick 3-step guide, lets use the first option:

1. In the **Insert** ribbon, select **New visual**. When the visual placeholder appears on the report canvas, expand the **Visualizations** pane and select the **(new) Card visual** icon in the **Build visual** menu.

    :::image type="content" source="media/power-bi-visualization-new-card/build-new-card-desktop-step-1.png" alt-text="Screenshot with the Insert ribbon, New visual button, Visualizations pane, Build visual icon, and the (new) Card visual icon, all highlighted." lightbox="media/power-bi-visualization-new-card/build-new-card-desktop-step-1.png":::

2. To add data to the visual, let’s use the **Data pane** in this example.Adding data can be done by selecting each field in the **Data pane**, or dragging the fields to the field wells on the **Visualizations pane**, or dragging the fields directly to the visual placeholder in the report canvas. Expand the **Sales** group, to add **StoreCount**, then expand the **TotalSalesTY** subgroup, and add **Value**. You'll notice that each data field you add is displayed as its own card. 

    :::image type="content" source="media/power-bi-visualization-new-card/build-new-card-desktop-step-2.png" alt-text="Screenshot with Data pane expanded and highlighted, Sales group is expanded, and both StoreCount and TotalSalesTV measures are highlighted and selected. Both measures are added to the Data field well in the Visualizations pane." lightbox="media/power-bi-visualization-new-card/build-new-card-desktop-step-2.png":::

3. To customize your column chart, select the Format visual icon in the Visualizations pane, granting you access to all available settings. This allows you to tailor the chart's appearance and functionality to your specific requirements as shown in the example below.

    :::image type="content" source="media/power-bi-visualization-new-card/build-new-card-desktop-step-3.png" alt-text="Screenshot with Visualizations pane highlighted and expanded, and the Format visual icon is selected and highlighted to display the Visual and General format tabs. The Visual tab is also selected to display the format controls." lightbox="media/power-bi-visualization-new-card/build-new-card-desktop-step-3.png":::

Congratulations! You've successfully created a (new) card visual with Power BI Desptop.

Next, now that you have completed this quick 3-step guide to build a (new) card visual, we've provided a comprehensive list of all available [Format settings](power-bi-visualization-card-visual-new-format-settings.md) and controls for you to use as reference. Also, take time to familiarize yourself with the [Considerations and limitations](power-bi-visualization-card-visual-considerations.md) for (new) card visuals.

## Related content

* [(new) Card visual considerations and limitations](power-bi-visualization-card-visual-considerations.md)
* [(new) Card visual format settings](power-bi-visualization-card-visual-new-format-settings.md) 
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
* [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
