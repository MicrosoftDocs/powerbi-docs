---
title: Create a card visual in Power BI
description: This article provides an understanding of the card visual and a quick three-step guide on how to build a card visual in Power BI Desktop.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: jacindaeng
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/18/2025
ai-usage: ai-assisted
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the card visual so that I can effectively and more easily build card visuals in Power BI Desktop.
---

# Create a card visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The **card visual** in Power BI is a versatile tool for presenting key metrics in a visually appealing format. Each card can display a specific metric, such as total sales or profit growth, and you can customize it to reflect your objectives and key results (OKRs). This flexibility allows you to group multiple cards within a single container, giving you full control over every component of each card and a comprehensive overview of important data points at a glance.

The card visual is useful in business and finance for showcasing critical performance indicators. It's also helpful in marketing for highlighting metrics like customer engagement and conversion rates. With its sleek design and enhanced functionality, the card visual enables you to interact with your data more effectively and make informed decisions based on real-time insights.

> [!NOTE]
> The **(new) card visual** became generally available as the **card visual** with the November 2025 Power BI release. If you used this visual during Public Preview, you might notice behavior or formatting changes that reflect improvements included in the general availability release. You can customize the visual by using the Format pane.

## Prerequisites

In the following guide, you use the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

# [Power BI Desktop](#tab/powerbi-desktop)

> [!IMPORTANT]
> Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

1. Launch **Power BI Desktop**.
1. From the left-side navigation pane, select **Open**, or select **File > Open** from the menu.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view.

# [Power BI service](#tab/powerbi-service)

1. Sign in to the Power BI service (`app.powerbi.com`).
1. From the left-side navigation pane, select **Learn**.
1. On the **Learning center** page, under **Sample reports**, locate and select **Retail Analysis Sample**. It opens in Reading mode and adds the dashboard, report, and semantic model to your workspace.
1. At the top of the report, select **Edit** to switch to the Report editor (Edit mode).

---

[!INCLUDE[sharing-license-requirements](../includes/share-license-requirements.md)]

## Create a card visual

You can create a card visual in several ways:

- Start from the **Visualizations** pane and select the **card visual** icon.
- Expand the **Data** pane, select the necessary data fields, then select the **card visual** icon from the **Visualizations** pane.
- In Power BI Desktop, you can also start from the **Insert** ribbon, select **New visual**, then select the **card visual** icon from the **Visualizations** pane.

For this article, use the first option:

1. From the **Visualizations** pane, make sure the **Build visual** tab is selected, then select the **card visual** icon in the visual gallery.
1. Use the **Data** pane to add data to the visual. You can add data by selecting each field in the **Data** pane, dragging the fields to the field wells on the **Visualizations** pane, or dragging the fields directly to the visual placeholder on the report canvas. Expand the **Sales** group, then drag **StoreCount** and **TotalSalesLY** to the **Value** field well. You see that each data field you added is displayed as its own card.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card.png" alt-text="Screenshot of the Data pane with StoreCount and TotalSalesLY measures added to the Value field well in the Visualizations pane." lightbox="media/power-bi-visualization-card-visual/build-card.png":::

1. To customize your visual, select the **Format visual** icon in the **Visualizations** pane. You can access all available settings under the **Visual** and **General** tabs. This access allows you to tailor the chart's appearance and functionality to your specific requirements.

You successfully created a card visual with Power BI. Now that you understand how to build a card visual, let's explore some of the other key features that this visual offers.

## Customize the card visual layout

Let's dive into layout features that make your visuals more organized and visually appealing. Under the **Visual** tab, you can find different parts of the card visual to customize. The **Multicategory layout** formats the organization of the category headers (such as Canada, Germany). The **Multicard layout** customizes the layout of the cards within each category. Each card can have three sections: callout, hero image, and reference label. To understand the difference between callouts and hero images, see the [Add an image](#add-an-image) section. **Reference labels layout** controls how the reference labels are organized.

Within each of these parts of the card, you can further customize the look and feel including gaps, padding, backgrounds, and more.

:::image type="content" source="media/power-bi-visualization-card-visual/multicard-layout.png" alt-text="Screenshot of the Visualizations pane with Format visual and Visual tab selected, all Format controls highlighted." lightbox="media/power-bi-visualization-card-visual/multicard-layout.png":::

## Add an image

The card visual in Power BI lets you create visually appealing cards that combine metrics with two image options for better context and branding:

- **Callout**: A value, label, or image that provides subtle enhancements that work well for branding elements or small visual cues without overwhelming the metric display.
- **Hero image**: A large, prominent image that can showcase product photos, campaign graphics, or branded imagery directly within the card.

To **add a callout image** to your card visual: 

1. From the **Visualizations** pane, select the **Format visual** icon, then expand the **Callout** card.
1. Ensure your card is selected in the **Apply settings to** control.
1. Expand the **Image** controls, and turn on the **Image toggle**.

To **add a hero image** to your card visual: 

1. Select the card visual on the canvas.
1. From the **Visualizations** pane, select the **Format visual** icon,
1. Under the **Visual** tab, expand the **Image** card.
1. Select your card in the **Cards** dropdown, and turn on the **Image toggle**.

For both image types, you can add it by uploading from your local device, pasting an image URL, or selecting an image from a data column. You can also customize the fit of the image and choose different image effects to enhance its appearance.

:::image type="content" source="media/power-bi-visualization-card-visual/add-image.png" alt-text="Screenshot of the Visual pane with the Image selections shown to upload an image and customize it." lightbox="media/power-bi-visualization-card-visual/add-image.png":::

## Apply enhanced formatting customizations 

The card visual introduces a dynamic *collage* layout, letting you highlight one section while the other two share the remaining space. You can also customize the display order of the callout, reference label, and hero image and give them each different background colors.  

:::image type="content" source="media/power-bi-visualization-card-visual/enhanced-layout.png" alt-text="Screenshot of the Image pane with the card and image settings you can apply." lightbox="media/power-bi-visualization-card-visual/enhanced-layout.png":::

## Considerations and limitations

### Format settings

- The **(new) card visual** is generally available as the **card visual** with the November 2025 Power BI release. If you used the card visual during the public preview phase, you might notice behavior or formatting changes that reflect the improvements in the general availability release.
- When formatting the card visual, you might notice that some of the format settings are in a different or new location, or the name of the setting is changed.
- In earlier versions of the card visual, the **Callout** image was available as part of the **Image card**. This image is now in the **Callout** section of the **Format** pane.
- Certain **Layout** arrangements might affect existing reports that used the card visual during its public preview phase. This effect is due to updates made to all card components as part of the general availability release, including enhancements to layout, styling, and image handling.
- If you previously relied on the Image card layout, update your visuals accordingly by using the Format pane to access and configure the Callout image settings.

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
