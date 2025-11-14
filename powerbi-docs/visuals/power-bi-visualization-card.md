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

- Start from the **Visualizations** pane and select the **card visual** icon
- Expand the **Data** pane, select the necessary data fields, then select the **card visual** icon from the **Visualizations** pane
- In Power BI Desktop, you can also start from the **Insert** ribbon, select **New visual**, then select the **card visual** icon from the **Visualizations** pane

For this article, use the first option:

1. From the **Visualizations** pane, make sure the **Build visual** tab is selected, then select the **card visual** icon in the visual gallery.
1. Use the **Data** pane to add data to the visual. You can add data by selecting each field in the **Data** pane, dragging the fields to the field wells on the **Visualizations** pane, or dragging the fields directly to the visual placeholder on the report canvas. Expand the **Sales** group, then drag **StoreCount** and **TotalSalesLY** to the **Value** field well. You see that each data field you added is displayed as its own card.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card.png" alt-text="Screenshot of the Data pane with StoreCount and TotalSalesLY measures added to the Value field well in the Visualizations pane." lightbox="media/power-bi-visualization-card-visual/build-card.png"::::::

1. To customize your visual, select the **Format visual** icon in the **Visualizations** pane. You can access all available settings under the **Visual** and **General** tabs. This access allows you to tailor the chart's appearance and functionality to your specific requirements.

You successfully created a card visual with Power BI. Now that you understand how to build a card visual, let's explore some of the other key features that this visual offers.

## Key features of the card visual

### Working with images

The card visual in Power BI lets you create visually appealing cards that combine metrics with two image options for better context and branding.

Callout images provide subtle enhancements that work well for branding elements or small visual cues without overwhelming the metric display.

A hero image - that is, a large, prominent image that captures attention - lets report creators showcase impactful visuals such as product photos, campaign graphics, or branded imagery directly within the card.

To add images to your card visual:

1. **Add a hero image**: With the card visual selected on the canvas, select the **Format visual** icon in the **Visualizations** pane. Under the **Visual** tab, expand the **Image** card, select your card in the **Cards** dropdown, turn on the **Image toggle**, choose **Select from data** as the **Image source**, and drag your image field into the **Data** field well. This step adds a hero image below your metric area, creating a strong visual cue.
1. **Add a callout image**: From the **Visualizations** pane, with the **Format visual** icon selected, expand the **Callout** card, ensure your card is selected in the **Apply settings to** control, expand the **Image** controls, turn on the **Image toggle**, and select **Upload Image** as the **Image type**. Browse your device for an appropriate image to add to the visual. This image sits in the Callout section, making it perfect for subtle branding or quick visual hints without cluttering the card.
1. **Adjust image settings**: Tweak the image layout by setting the **Position** to **Left of text** and reducing the **Image area size** so it complements your metric without stealing the spotlight.

Now that you understand these image features, try adding images to your card visuals to make them more engaging and informative. Use hero images for full visual storytelling and callout images for small, meaningful touches like logos or indicators. When used thoughtfully, these features turn plain metrics into polished, professional visuals that stand out.

### Card visual layout features

Now that you learned about images in the previous section ([Working with images](#working-with-images)), let's dive into layout features that make your visuals more organized and visually appealing. These settings allow you to control how multiple cards are displayed, adjust spacing, and customize the overall look and feel of your report.

:::image type="content" source="media/power-bi-visualization-card-visual/multicard-layout.png" alt-text="Screenshot of the Visualizations pane with Format visual and Visual tab selected, all Format controls highlighted." lightbox="media/power-bi-visualization-card-visual/multicard-layout.png":::

To configure layout features:

1. **Multicard layout**: From the **Visualizations** pane, select the **Format visual** icon, and under the **Visual** tab, expand the **Multicategory layout** card. In the **Layout** controls, change the **Style** dropdown to **Tiles** or **Table**, and adjust the number of **Rows** or **Columns**. This setting makes your layout more compact and visually appealing.
1. **Adjust gaps and scrolling**: Expand the **Gap** control and set the **Vertical gap** for better spacing between cards. In the **Overflow** control, switch the **Overflow style** to **Continuous Scroll** for a smooth scrolling experience.
1. **Customize padding and background**: Expand the **Padding** control and set **Uniform padding**, then use the **Background** control to change the color for a professional look that makes your cards stand out.
1. **Layout arrangement**: From the **Visualizations** pane, go to the **Cards** section, and use the **Layout** control to change the **Arrangement** to **Horizontal** or **Vertical**. This layout option can make your report feel more dynamic and tailored to your design preferences.

Next, try customizing your card visuals to create more organized and visually compelling reports. Use layout properties to group related metrics, guide the viewer's eye, and add polish to your design. With just a few thoughtful adjustments, your Power BI visuals can go from functional to intuitive, so that things are smoother and more impactful.

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
