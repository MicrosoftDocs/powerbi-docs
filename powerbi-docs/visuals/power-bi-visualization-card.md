---
title: Create a Card Visual in Power BI
description: This article provides an understanding of the card visual and a quick three-step guide on how to build a card visual in Power BI Desktop.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: jacindaeng
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/28/2025
ai-usage: ai-assisted
ms.custom: sample-Retail-Analysis
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the card visual so that I can effectively and more easily build card visuals in Power BI Desktop.
---

# Create a Card visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The Card visual in Power BI is a versatile tool for presenting key metrics in a visually appealing format. Each card can display a specific metric, such as total sales or profit growth, and you can customize it to reflect your objectives and key results (OKRs). This flexibility allows you to group multiple cards within a single container, giving you full control over every component of each card and a comprehensive overview of important data points at a glance.

The Card visual is useful in business and finance for showcasing critical performance indicators. It's also helpful in marketing for highlighting metrics like customer engagement and conversion rates. With its sleek design and enhanced functionality, the Card visual enables you to interact with your data more effectively and make informed decisions based on real-time insights.

> [!NOTE]
> The **(new) Card visual** became generally available as the **Card visual** with the November 2025 Power BI release. If you used this visual during Public Preview, you might notice behavior or formatting changes that reflect improvements included in the General Availability release. You can customize the visual by using the Format pane.

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

You can create a Card visual in several ways:

- Start from the **Visualizations** pane and select the **Card visual** icon
- Expand the **Data** pane, select the necessary data fields, then select the **Card visual** icon from the **Visualizations** pane
- In Power BI Desktop, you can also start from the **Insert** ribbon, select **New visual**, then select the **Card visual** icon from the **Visualizations** pane

For this guide, use the first option:

1. From the **Visualizations** pane, make sure the **Build visual** tab is selected, then select the **Card visual** icon in the visual gallery.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-desktop-step-1.png" alt-text="Screenshot of the Visualizations pane with the Build visual tab and Card visual icon highlighted." lightbox="media/power-bi-visualization-card-visual/build-card-desktop-step-1.png":::

1. Use the **Data** pane to add data to the visual. You can add data by selecting each field in the **Data** pane, dragging the fields to the field wells on the **Visualizations** pane, or dragging the fields directly to the visual placeholder on the report canvas. Expand the **Sales** group, then drag **StoreCount** and **TotalSalesLY** to the **Value** field well. You see that each data field you added is displayed as its own card.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-desktop-step-2.png" alt-text="Screenshot of the Data pane highlighted with StoreCount and TotalSalesLY measures highlighted under Sales group and added to Value field well in Visualizations pane." lightbox="media/power-bi-visualization-card-visual/build-card-desktop-step-2.png":::

1. To customize your visual, select the **Format visual** icon in the **Visualizations** pane. You can access all available settings under the **Visual** and **General** tabs. This access allows you to tailor the chart's appearance and functionality to your specific requirements as shown in the example.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-desktop-step-3.png" alt-text="Screenshot of the Visualizations pane selected with Format visual icon selected, Visual and General tabs highlighted, and Visual tab displaying format controls." lightbox="media/power-bi-visualization-card-visual/build-card-desktop-step-3.png":::

You successfully created a card visual with Power BI. Now that you understand how to build a Card visual, let's explore some of the other key features that this visual offers.

## Key features of the Card visual

### Working with images

The Card visual in Power BI lets you create visually appealing cards that combine metrics with two image options for better context and branding.

Callout images provide subtle enhancements that work well for branding elements or small visual cues without overwhelming the metric display.

Adding 'hero' images, a term widely used by designers to describe a large, prominent image that captures attention, lets report creators showcase impactful visuals such as product photos, campaign graphics, or branded imagery directly within the card.

In the following steps, you learn how to set up and customize the Card visual in Power BI, ensuring your report delivers a visually rich and intuitive experience. This guide helps you combine data with images in an easy to follow guide that includes how to:

- Build a card visual that displays key metrics.
- Add a hero image that occupies the entire card space for strong visual emphasis.
- Add Callout images positioned in the callout section of the card, ideal for small logos, icons, or indicators.

1. **Build a Card visual**

    From the **Visualizations** pane, ensure the **Build visual** icon is selcted, and choose the **Card visual** from the gallery to add a visual placeholder to the canvas.

    Then, from the **Data** pane, expand the **Sales** group, and drag the **Store count** measure to the **Value** field well to create your first card.

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-1.png" alt-text="Screenshot of the Visualizations pane with Build visual icon and Card visual icon highlighted, plus Store Count highlighted in Data pane and dragged to Value field well." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-1.png":::

1. **Add data the the visual**

    Continuing from the **Data** pane, drag **DM** (*District Managers*) from the **District** group, and add it to the **Categories** field well to display multiple cards showing the various managers.

    Then, to narrow down what appears in the Card visual, from the **Filters** pane, expand the **DM** filter card, and select only the first two district managers. This keeps your Card visual focused on the selected data.

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-2.png" alt-text="Screenshot of the Data pane with DM field highlighted and dragged to Categories field well, plus Filter pane and DM filter highlighted with first two DM names selected." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-2.png":::

1. **Add a hero image**

    Now it's time to make the visual pop. With the Card visual still selected on the canvas, from the **Visualizations** pane, select the **Format visual** icon. Under the **Visual** tab, expand the **Image** card, and in the **Apply setting to** section, select **Store Count** in the **Cards** dropdown.

    Next, expand the **Image** controls, and turn on the **Image toggle**. For the **Image source** choose **Select from data** and drag the **DM_Pic_fl** field into the **Data** field well. This adds a hero image below your metric area creating a strong visual cue.

    > [!TIP]
    > A 'hero' image is a term widely used by designers to describe a large, prominent image that captures attention

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-3.png" alt-text="Screenshot of the Visualizations pane with Format visual icon and Visual tab highlighted, Store count selected in Image Apply settings to Cards, Image toggle ON, Source is Data, DM_pic_fl field placed in Data field well." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-3.png":::

    > [!TIP]
    > You might need to resize the Card visual on the canvas to see everything clearly and avoid truncated text or images.

1. **Add a callout image**

    Here's where the **Callout image** comes in. From the **Visualizations** pane, with the **Format visual** icon selected, expand the **Callout** card, and ensure **Store Count** is selected from the **Cards** dropdown in the **Apply settings to** control.

    Then, expand the **Image** controls, turn on the **Image toggle**, and select **Upload Image** as the **Image type**. Browse your device for an approiate image, and select **Open** to add the image to the visual. This image sits in the Callout section, making it perfect for subtle branding or quick visual hints without cluttering the card.

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-4.png" alt-text="Screenshot of the Visual tab highlighted, Store count selected in Callout card Apply settings to Cards, Image toggle on, Image selected and uploaded from device." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-4.png":::

1. **Adjust image settings**

   Finally, tweak the image layout by setting the **Position** to **Left of text** and reducing the **Image area size** so it complements your metric without stealing the spotlight.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-5.png" alt-text="Screenshot of the Visualizations pane expanded with Format visual icon and Visual tab displayed, Image position set to Left of text, and Image area size set to 20%." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-5.png":::

Now that you understand these image features, try adding images to your Card visuals to make them more engaging and informative. Use 'hero' images for full visual storytelling and callout images for small, meaningful touches like logos or indicators. When used thoughtfully, these features turn plain metrics into polished, professional visuals that stand out.

### Card visual layout features

Now that you learned about images in the previous section ([Working with images](#working-with-images)), let's continue our progress and dive into layout features that make your visuals more organized and visually appealing. These settings allow you to control how multiple cards are displayed, adjust spacing, and customize the overall look and feel of your report.

In the following steps, you learn how to configure multi-card layouts, adjust gaps and scrolling behavior, and explore additional layout options like vertical and horizontal arrangements, to ensure your report looks clean, professional, and easy to navigate.

1. **Continuing from previous section, [Working with images](#working-with-images)**

   After learning how to work with images, start learning about layout features by continuing the same card visual you created earlier.

   From the **Filters** pane, expand the **DM** filter card, and choose **Select all** district managers to give yourself a broader view. Then, in the **Data** pane, drag the **District** field into the **Values** field well, so that it is below the  field. This step creates a second card inside each category, giving you a richer multi-card visual.

   :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-1.png" alt-text="Screenshot of the Visualizations pane selected and expanded with Format visual icon selected and Visual and General tabs displayed, Visual tab displays format controls." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-1.png":::

1. **Switch to Multi-card layout**

   From the **Visualizations** pane, select the **Format visual** icon, and under the **Visual** tab, expand the **Multi-category layout** card. In the **Layout** controls, change the **Style** dropdown to **Tiles**, and set the number of **Rows** to **2**. This step instantly makes your layout more compact and visually appealing.

      :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-2.png" alt-text="Screenshot of the Power BI Format pane with Multi-category layout expanded, Layout Style set to Tiles and Rows set to 2." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-2.png":::

1. **Adjust gaps and scrolling**

   Expand the **Gap** control and set the **Vertical gap** to **20 px** for better spacing between cards. Then, in the **Overflow** control, switch the **Overflow style** to **Continuous Scroll**. This setting creates a smooth scrolling experience and keeps your report clean.

      :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-3.png" alt-text="Screenshot of the Visualizations pane showing Multi-card layout with Vertical gap 20 px and Overflow style Continuous Scroll." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-3.png":::

1. **Explore table layout**

   While still on the **Multi-card layout** card in the **Visualizations** pane, go back to the **Layout** controls and change the **Style** back to **Table**, and set the number of **Columns** to **2**. This setting gives you another way to view multiple cards side by side for better comparison.

      :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-4.png" alt-text="Screenshot of the Visualizations pane with Multi-card layout set to Table and Columns 2, Visual tab visible." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-4.png":::

1. **Customize padding and background**

   Expand the **Padding** control and set **Uniform padding** to **20 px**, then use the **Background** control and change the color to **Gray** for a subtle, professional look that makes your cards stand out.

   :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-5.png" alt-text="Screenshot of the Visualizations pane with Multi-card layout expanded, Uniform padding 20 px, Background color is grey." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-5.png":::

1. **Horizontal layout arrangement**

   From the **Visualizations** pane, go back to **Cards** section, and use the **Layout** control to change the **Arrangement** to **Horizontal**. This layout option can make your report feel more dynamic, and tailored to your design preferences.

   :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-6.png" alt-text="Screenshot of the Visualizations pane with Cards expanded, Apply settings to is set to All, Layout Arrangement is Horizontal." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-6.png":::

1. **Explore more formatting options**

   Finally, now that you learned about several card visual layout features, take some time to explore  all the format settings under the **Format visual** tab. You'll find multiple options to customize your card visuals, including everything from layout tweaks to color adjustments, so you can design a report that fits your exact requirements.

   :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-7.png" alt-text="Screenshot of the Visualizations pane with Format visual and Visual tab selected, all Format controls highlighted." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-7.png":::

Now that you've explored these layout settings, try customizing your Card visuals to create more organized and visually compelling reports. Use layout properties to group related metrics, guide the viewer's eye, and add polish to your design. With just a few thoughtful adjustments, your Power BI visuals can go from functional to intuitive, so that things are smoother and more impactful.

## Considerations and limitations

### Format settings

- The **(new) Card visual** is generally available as the **Card visual** with the November 2025 Power BI release. If you used the Card visual during the public preview phase, you might notice behavior or formatting changes that reflect the improvements in the general availability release.
- When formatting the Card visual, you might notice that some of the format settings are in a different or new location, or the name of the setting is changed.
- In earlier versions of the Card visual, the **Callout** image was available as part of the **Image card**. This image is now in the **Callout** section of the **Format** pane.
- Certain **Layout** arrangements might impact existing reports that used the Card visual during its public preview phase. This impact is due to updates made to all card components as part of the general availability release, including enhancements to layout, styling, and image handling.
- If you previously relied on the Image card layout, update your visuals accordingly by using the Format pane to access and configure the Callout image settings.

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
