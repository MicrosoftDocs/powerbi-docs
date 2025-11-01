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

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The Card visual in Power BI is a versatile tool for presenting key metrics in a visually appealing format. Each card can display a specific metric, such as total sales or profit growth, and can be customized to reflect your objectives and key results (OKRs). This flexibility allows users to group multiple cards within a single container, providing full control over every component of each card, and a comprehensive overview of important data points at a glance.

The Card visual is useful in business and finance for showcasing critical performance indicators, as well as in marketing for highlighting metrics like customer engagement and conversion rates. With its sleek design and enhanced functionality, the Card visual enables users to interact with their data more effectively and make informed decisions based on real-time insights.

> [!NOTE]
> The **(new) Card visual** became generally available as the **Card visual** with the November 2025 Power BI release. If you used this visual during Public Preview, you may notice behavior or formatting changes that reflect improvements included in the General Availibility release. You can customize the visual using the Format pane.

## Prerequisites

In the following guide, we're using the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

# [Power BI Desktop](#tab/powerbi-desktop)

> [!IMPORTANT]
> Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

1. Launch **Power BI Desktop**.
1. From the left-side navigation pane, select **Open**, or select **File > Open** from the menu.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view.

# [Power BI service](#tab/powerbi-service)

1. Sign in to the Power BI service (`app.powerbi.com`).
1. From the left-side navigation pane, select **Learn**.
1. On the **Learning center** page, under **Sample reports**, locate and select **Retail Analysis Sample**. It opens in Reading mode and adds the dashboard, report, and semantic model to your workspace.
1. At the top of the report, select **Edit** to switch to the Report editor (Edit mode).

---
> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual **Power BI Pro license** or that you have saved the report in **Premium capacity**.

## Let's create Card visual

# [Power BI Desktop](#tab/powerbi-desktop)

Before we begin, if you haven't already done so, refer to the **[Prerequisites](#prerequisites)** section above, and follow the steps under the tab for **Power BI Desktop**.

There are three similar ways to create a Card visual:

- Start from the Insert ribbon, and select New visual, then select the Card visual icon from the Visualizations pane, or
- Start from the Visualizations pane, and select the Card visual icon, or lastly,
- Expand the Data pane, and select the necessary data fields, and then select the Card visual icon from the Visualizations pane.  

For this quick three-step guide, let's use the first option:

1. In the **Insert** ribbon, select **New visual**. When the visual placeholder appears on the report canvas, expand the **Visualizations** pane and select the **Card visual** icon in the **Build visual** menu.

    :::image type="content" source="media/power-bi-visualization-card/build-card-desktop-step-1.png" alt-text="Screenshot with the Insert ribbon, New visual button, Visualizations pane, Build visual icon, and the Card visual icon, all highlighted." lightbox="media/power-bi-visualization-card/build-card-desktop-step-1.png":::

2. To add data to the visual, let’s use the **Data pane** in this example. Adding data can be done by selecting each field in the **Data pane**, or dragging the fields to the field wells on the **Visualizations pane**, or dragging the fields directly to the visual placeholder in the report canvas. Expand the **Sales** group, to add **StoreCount**, then expand the **TotalSalesTY** subgroup, and add **Value**. You'll notice that each data field you add is displayed as its own card.

    :::image type="content" source="media/power-bi-visualization-card/build-card-desktop-step-2.png" alt-text="Screenshot: Data pane, Sales group expanded, StoreCount + TotalSalesTV measures highlighted, selected, and added to Data field in Visualizations pane." lightbox="media/power-bi-visualization-card/build-card-desktop-step-2.png":::

3. To customize your visual, select the Format visual icon in the Visualizations pane, granting you access to all available settings. This allows you to tailor the chart's appearance and functionality to your specific requirements as shown in the example.

    :::image type="content" source="media/power-bi-visualization-new-card/build-new-card-desktop-step-3.png" alt-text="Screenshot: Visualizations pane selected, expanded, Format visual icon selected. Visual + General tabs displayed, Visual tab displays format controls." lightbox="media/power-bi-visualization-new-card/build-new-card-desktop-step-3.png":::

# [Power BI service](#tab/powerbi-service)

Before we begin, if you haven't already done so, refer to the **[Prerequisites](#prerequisites)** section above, and follow the steps under the tab for **Power BI Desktop**.

There are three similar ways to create a Card visual:

- Start from the Insert ribbon, and select New visual, then select the Card visual icon from the Visualizations pane, or
- Start from the Visualizations pane, and select the Card visual icon, or lastly,
- Expand the Data pane, and select the necessary data fields, and then select the Card visual icon from the Visualizations pane.  

For this quick three-step guide, let's use the first option:

1. In the **Insert** ribbon, select **New visual**. When the visual placeholder appears on the report canvas, expand the **Visualizations** pane and select the **Card visual** icon in the **Build visual** menu.

    :::image type="content" source="media/power-bi-visualization-card/build-card-desktop-step-1.png" alt-text="Screenshot with the Insert ribbon, New visual button, Visualizations pane, Build visual icon, and the Card visual icon, all highlighted." lightbox="media/power-bi-visualization-card/build-card-desktop-step-1.png":::

2. To add data to the visual, let’s use the **Data pane** in this example. Adding data can be done by selecting each field in the **Data pane**, or dragging the fields to the field wells on the **Visualizations pane**, or dragging the fields directly to the visual placeholder in the report canvas. Expand the **Sales** group, to add **StoreCount**, then expand the **TotalSalesTY** subgroup, and add **Value**. You'll notice that each data field you add is displayed as its own card.

    :::image type="content" source="media/power-bi-visualization-card/build-card-desktop-step-2.png" alt-text="Screenshot: Data pane, Sales group expanded, StoreCount + TotalSalesTV measures highlighted, selected, and added to Data field in Visualizations pane." lightbox="media/power-bi-visualization-card/build-card-desktop-step-2.png":::

3. To customize your visual, select the Format visual icon in the Visualizations pane, granting you access to all available settings. This allows you to tailor the chart's appearance and functionality to your specific requirements as shown in the example.

    :::image type="content" source="media/power-bi-visualization-new-card/build-new-card-desktop-step-3.png" alt-text="Screenshot: Visualizations pane selected, expanded, Format visual icon selected. Visual + General tabs displayed, Visual tab displays format controls." lightbox="media/power-bi-visualization-new-card/build-new-card-desktop-step-3.png":::

---

Congratulations! You've successfully created a card visual with Power BI. Now that you understand how to build a Card visual, let's explore some of the other key features that this visual offers.

### Key features of the Card visual

#### Working with images

The Card visual in Power BI allows users to create visually appealing cards that combine metrics with two image options for better context and branding.

Callout images are designed for subtle enhancements that are perfect for branding elements or small visual cues without overwhelming the metric display. 

On the other hand, adding hero images, a term widely used by designers to describe a large, prominent image that captures attention, allows report creators to showcase impactful visuals such as product photos, campaign graphics, or branded imagery directly within the card.

In the following steps, you’ll learn how to set up and customize the Card visual in Power BI, ensuring your report delivers a visually rich and intuitive experience. This will help you combine data with images in an easy to follow guide that includes how to:

- Build a card visual that displays key metrics.
- Add a hero image that occupies the entire card space for strong visual emphasis.
- Add Callout images positioned in the callout section of the card, ideal for small logos, icons, or indicators.

1. **Build a Card visual**

    From the **Visualizations** pane, ensure the **Build visual** icon is selcted, and choose the **Card visual** from the gallery. This adds a visual placeholder to the canvas.

    Then, from the **Data** pane, expand the **Sales** dropdown, and drag the **Store count** measure to the **Value** field well to create your first card.

2. **Add data the the visual**

    Continuing from the **Data** pane, drag the **DM** (*District Managers*) measure from the **District** dropdown, and add it to the **Categories** field well to display multiple cards showing the various managers.

    Then, to narrow down what appears in the Card visual, from the **Filters** pane, expand the filter card, and select only the first two district managers. This keeps your Card visual focused on the selected data.

3. **Add a hero image**

    Now it’s time to make the visual pop. With the Card visual still selected on the canvas, from the **Visualizations** pane, select the **Format visual** icon. Under the **Visual** tab, expand the **Image** card, and turn on the **Image toggle**.

    Next, choose **Select from data** as the **Image source**, and drag the **DM_Pic_fl** field into the **Data** field well. This adds a hero image below your metric area creating a strong visual cue.

4. **Add a callout image**

    Here’s where the **Callout image** comes in. From the **Visualizations** pane, with the **Format visual** icon selected, expand the **Callout** card, and ensure **Store Count** is selected in the **Cards** section of **Apply settings to**.

    Then, turn on the **Image toggle** in the **Image** controls, and select **Upload Image** as the **Image type**. Browse your device for an approiate image, and select **Open** to add the image to the visual. This image sits in the Callout section, making it perfect for subtle branding or quick visual hints without cluttering the card.

5. **Adjust image position**

    Under Callout settings, pick Store Count, turn on the image toggle, and click Image Browse to upload a small logo or indicator. This image sits in the callout section, making it perfect for subtle branding or quick visual hints without cluttering the card.

#### Dynamic collage layout

The Card visual includes a dynamic **Collage layout** that arranges multiple cards in a freeform style, offering a visually engaging alternative to traditional grid-based designs. This layout is ideal for dashboards that benefit from a more creative or informal presentation, as it automatically adapts to the content and available space.

You can enable it by navigating to the **Format pane**, selecting **Cards**, and choosing **Collage** under the **Layout** dropdown. The layout allows you to highlight one section while the other two share the remaining space, and it allows customization of the display order for the callout area, reference label, and image, ensuring your most important insights are always front and center.

#### Additional styling capabilities

The Card visual also brings expanded styling capabilities, giving you more control over the appearance of each card. These enhancements include advanced font settings (such as typeface, weight, and size), customizable backgrounds and borders, and conditional formatting options for both text and images. These settings are accessible in the **Format** pane under sections like **General** > **Style** and **Visual** > **Callout value**. With these tools, you can tailor the visual design to match your report themes, improve readability, and highlight key metrics more effectively.

Take the time to familiarize yourself with the [Considerations and limitations](power-bi-visualization-card-visual-considerations.md) for card visuals.

## Related content

- [Card visual considerations and limitations](power-bi-visualization-card-visual-considerations.md)
- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
