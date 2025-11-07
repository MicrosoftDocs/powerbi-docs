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
<!-- markdownlint-disable MD024 -->
# Create a Card visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The Card visual in Power BI is a versatile tool for presenting key metrics in a visually appealing format. Each card can display a specific metric, such as total sales or profit growth, and can be customized to reflect your objectives and key results (OKRs). This flexibility allows users to group multiple cards within a single container, providing full control over every component of each card, and a comprehensive overview of important data points at a glance.

The Card visual is useful in business and finance for showcasing critical performance indicators, as well as in marketing for highlighting metrics like customer engagement and conversion rates. With its sleek design and enhanced functionality, the Card visual enables users to interact with their data more effectively and make informed decisions based on real-time insights.

> [!NOTE]
> The **(new) Card visual** became generally available as the **Card visual** with the November 2025 Power BI release. If you used this visual during Public Preview, you may notice behavior or formatting changes that reflect improvements included in the General Availability release. You can customize the visual using the Format pane.

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

- Start from the **Insert** ribbon, and select **New visual**, then select the **Card visual** icon from the **Visualizations** pane, or
- Start from the **Visualizations** pane, and select the **Card visual** icon, or lastly,
- Expand the **Data** pane, and select the necessary data fields, and then select the **Card visual** icon from the **Visualizations** pane.  

For this quick three-step guide, let's use the first option:

1. In the **Insert** ribbon, select **New visual**. When the visual placeholder appears on the report canvas, expand the **Visualizations** pane and select the **Card visual** icon in the **Build visual** menu.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-desktop-step-1.png" alt-text="Screenshot with the Insert ribbon, New visual button, Visualizations pane, Build visual icon, and the Card visual icon, all highlighted." lightbox="media/power-bi-visualization-card-visual/build-card-desktop-step-1.png":::

2. To add data to the visual, let’s use the **Data** pane in this example. Adding data can be done by selecting each field in the **Data** pane, or dragging the fields to the field wells on the **Visualizations** pane, or dragging the fields directly to the visual placeholder in the report canvas. Expand the **Sales** group, then drag **StoreCount** and **TotalSalesLY** to the **Value** field well. You'll notice that each data field you added is displayed as its own card.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-desktop-step-2.png" alt-text="Screenshot: Data pane highlighted, StoreCount + TotalSalesLY measures highlighted under Sales group, and added to Value field well in Visualizations pane." lightbox="media/power-bi-visualization-card-visual/build-card-desktop-step-2.png":::

3. To customize your visual, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available settings under that **Visual** and **General** tabs. This allows you to tailor the chart's appearance and functionality to your specific requirements as shown in the example.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-desktop-step-3.png" alt-text="Screenshot: Visualizations pane selected, Format visual icon selected. Visual + General tabs highlighted, Visual tab displays format controls." lightbox="media/power-bi-visualization-card-visual/build-card-desktop-step-3.png":::

# [Power BI service](#tab/powerbi-service)

Before we begin, if you haven't already done so, refer to the **[Prerequisites](#prerequisites)** section above, and follow the steps under the tab for **Power BI Desktop**.

There are two ways to create a Card visual:

- Start from the **Visualizations** pane, and select the **Card visual** icon, or
- Expand the **Data** pane, and select the necessary data fields, and then select the **Card visual** icon from the **Visualizations** pane.  

For this quick three-step guide, let's use the first option:

1. From the **Visualizations** pane, ensure the **Build visual** tab is selected, then select the **Card visual** icon in the visual gallery.

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-service-step-1.png" alt-text="Screenshot with Visualizations pane, Build visual icon, and the Card visual icon, all highlighted." lightbox="media/power-bi-visualization-card-visual/build-card-service-step-1.png":::

2. To add data to the visual, let’s use the **Data pane** in this example. Adding data can be done by selecting each field in the **Data pane**, or dragging the fields to the field wells on the **Visualizations pane**, or dragging the fields directly to the visual placeholder in the report canvas. Expand the **Sales** group, then drag **StoreCount** and **TotalSalesLY** to the **Value** field well. You'll notice that each data field you added is displayed as its own card.

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-service-step-2.png" alt-text="Screenshot: Data pane highlighted, Sales group expanded, StoreCount + TotalSalesLY measures highlighted and added to Value field well in Visualizations pane." lightbox="media/power-bi-visualization-card-visual/build-card-service-step-2.png":::

3. To customize your visual, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available settings under that **Visual** and **General** tabs. This allows you to tailor the chart's appearance and functionality to your specific requirements as shown in the example.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-service-step-3.png" alt-text="Screenshot: Visualizations pane, Format visual icon, and Visual + General tabs all highlighted, with Visual tab displaying format controls." lightbox="media/power-bi-visualization-card-visual/build-card-service-step-3.png":::

---

Congratulations! You've successfully created a card visual with Power BI. Now that you understand how to build a Card visual, let's explore some of the other key features that this visual offers.

## Key features of the Card visual

### Working with images

The Card visual in Power BI allows users to create visually appealing cards that combine metrics with two image options for better context and branding.

Callout images are designed for subtle enhancements that are perfect for branding elements or small visual cues without overwhelming the metric display.

On the other hand, adding 'hero' images, a term widely used by designers to describe a large, prominent image that captures attention, allows report creators to showcase impactful visuals such as product photos, campaign graphics, or branded imagery directly within the card.

In the following steps, you’ll learn how to set up and customize the Card visual in Power BI, ensuring your report delivers a visually rich and intuitive experience. This will help you combine data with images in an easy to follow guide that includes how to:

- Build a card visual that displays key metrics.
- Add a hero image that occupies the entire card space for strong visual emphasis.
- Add Callout images positioned in the callout section of the card, ideal for small logos, icons, or indicators.

1. **Build a Card visual**

    From the **Visualizations** pane, ensure the **Build visual** icon is selcted, and choose the **Card visual** from the gallery to add a visual placeholder to the canvas.

    Then, from the **Data** pane, expand the **Sales** group, and drag the **Store count** measure to the **Value** field well to create your first card.

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-1.png" alt-text="Screenshot: Visualizations pane, Build visual icon, Card visual icon, all highlighted, plus Store Count highlighted in Data pane and dragged to Value field well ." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-1.png":::

2. **Add data the the visual**

    Continuing from the **Data** pane, drag **DM** (*District Managers*) from the **District** group, and add it to the **Categories** field well to display multiple cards showing the various managers.

    Then, to narrow down what appears in the Card visual, from the **Filters** pane, expand the **DM** filter card, and select only the first two district managers. This keeps your Card visual focused on the selected data.

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-2.png" alt-text="Screenshot: Data pane with DM field highlighted and dragged to Categories field well, plus Filter pane and DM filter highlighted with first two DM names selected." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-2.png":::

3. **Add a hero image**

    Now it’s time to make the visual pop. With the Card visual still selected on the canvas, from the **Visualizations** pane, select the **Format visual** icon. Under the **Visual** tab, expand the **Image** card, and in the **Apply setting to** section, select **Store Count** in the **Cards** dropdown.

    Next, expand the **Image** controls, and turn on the **Image toggle**. For the **Image source** choose **Select from data** and drag the **DM_Pic_fl** field into the **Data** field well. This adds a hero image below your metric area creating a strong visual cue.

    > [!TIP]
    > A 'hero' image is a term widely used by designers to describe a large, prominent image that captures attention

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-3.png" alt-text="Screenshot: Visualizations pane, Format visual icon, Visual tab all highlighted, Store count selected in Image>Apply settings to>Cards, Image toggle ON, Source is Data, DM_pic_fl field placed in Data field well." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-3.png":::

    > [!TIP]
    > You may need to resize the Card visual on the canvas to see everything clearly and avoid truncated text or images.

4. **Add a callout image**

    Here’s where the **Callout image** comes in. From the **Visualizations** pane, with the **Format visual** icon selected, expand the **Callout** card, and ensure **Store Count** is selected from the **Cards** dropdown in the **Apply settings to** control.

    Then, expand the **Image** controls, turn on the **Image toggle**, and select **Upload Image** as the **Image type**. Browse your device for an approiate image, and select **Open** to add the image to the visual. This image sits in the Callout section, making it perfect for subtle branding or quick visual hints without cluttering the card.

    :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-4.png" alt-text="Screenshot: Visual tab highlighted, Store count is selected in Callout card > Apply settings to > Cards, Image toggle on, Image selected and uploaded from device." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-4.png":::

5. **Adjust image settings**

   Finally, let's tweak the image layout by setting the **Position** to **Left of text** and reducing the **Image area size** so it complements your metric without stealing the spotlight.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-5.png" alt-text="Screenshot: Visualizations pane expanded, Format visual icon and Visual tab displayed, Image position set to Left of text, and Image area size set to 20%." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-5.png":::

Now that you have learned about these image features, try your adding images to your Card visuals to make them more engaging and informative. Use 'hero' images for full visual storytelling and callout images for small, meaningful touches like logos or indicators. When used thoughtfully, these features turn plain metrics into polished, professional visuals that stand out.

### Card visual layout features

Now that you've learned about images in the previous section ([Working with images](#working-with-images)), let's continue our progress and dive into layout features that will make your visuals more organized and visually appealing. These settings allow you to control how multiple cards are displayed, adjust spacing, and customize the overall look and feel of your report.

In the following steps, you’ll learn how to configure multi-card layouts, adjust gaps and scrolling behavior, and explore additional layout options like vertical and horizontal arrangements, to ensure your report looks clean, professional, and easy to navigate.

> [!TIP]
> Before learning about **Card visual layout features**, please take time to review the previous section, **[Working with images](#working-with-images)**.

1. **Continuing from previous section, [Working with images](#working-with-images)**

   After learning how to work with images, let's start learning about layout features by continuing the same card visual you created earlier.

   Ready? Let's go. From the **Filters** pane, expand the **DM** filter card, and choose **Select all** district managers to give yourself a broader view. Then, in the **Data** pane, drag the **District** field into the **Values** field well, so that it is below the  field. This creates a second card inside each category, giving you a richer multi-card visual.

   :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-1.png" alt-text="Screenshot: Visualizations pane selected, expanded, Format visual icon selected. Visual + General tabs displayed, Visual tab displays format controls." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-1.png":::

2. **Switch to Multi-card layout**

   From the **Visualizations** pane, select the **Format visual** icon, and under the **Visual** tab, expand the **Multi-category layout** card. In the **Layout** controls, change the **Style** dropdown to **Tiles**, and set the number of **Rows** to **2**. This instantly makes your layout more compact and visually appealing.

      :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-2.png" alt-text="Power BI Format pane with Multi-category layout expanded; Layout Style set to Tiles and Rows set to 2." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-2.png":::

3. **Adjust gaps and scrolling**

   Expand the **Gap** control and set the **Vertical gap** to **20 px** for better spacing between cards. Then, in the **Overflow** control, switch the **Overflow style** to **Continuous Scroll**. This creates a smooth scrolling experience and keeps your report clean.

      :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-3.png" alt-text="Visualizations pane showing Multi-card layout with Vertical gap 20 px and Overflow style Continuous Scroll." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-3.png":::

4. **Explore table laout**

   While still on the **Multi-card layout** card in the **Visualizations** pane, go back to the **Layout** controls and change the **Style** back to **Table**, and set the number of **Columns** to **2**. This gives you another way to view multiple cards side by side for better comparison.

      :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-4.png" alt-text="Visuslizations pane: Multi-card layout set to Table, Columns 2; Visual tab visible; neutral tone." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-4.png":::

5. **Customize padding and background**

   Expand the **Padding** control and set **Uniform padding** to **20 px**, then use the **Background** control and change the color to **Gray** for a subtle, professional look that can make your cards stand out.

   :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-5.png" alt-text="Visualizations pane: Multi-card layout expanded, Uniform padding 20 px, Background color is grey." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-5.png":::

6. **Horizontal layout arrangement**

   From the **Visualizations** pane, lets go back to **Cards** section, and use the **Layout** control to change the **Arrangement** to **Horizontal**. This is another layout option that can make your report feel more dynamic, and tailored to your design preferences.

   :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-6.png" alt-text="Visualizations pane: Cards expanded, Apply settings to is set to All, Layout Arrangement is Horizontal." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-6.png":::

7. **Explore more formatting options**

   Finally, now that you have learned about several card viisual layout features, take some time to explore  all the format settings under the **Format visual** tab. You’ll find multiple options to customize your card visuals, including everything from layout tweaks to color adjustments, so you can design a report that fits your exact requirements.

   :::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-7.png" alt-text="Visualizations pane: Format visual, Visual tab selected, all Format controls highlighted." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-7.png":::

Now that you've explored these layout settings, try customizing your Card visuals to create more organized and visually compelling reports. Use layout properties to group related metrics, guide the viewer’s eye, and add polish to your design. With just a few thoughtful adjustments, your Power BI visuals can go from functional to intuitive, so that things are smoother and more impactful.

## Considerations and limitations

### Format settings

- The **(new) Card visual** became generally available as the **Card visual** with the November 2025 Power BI release. If you used the Card visual during the Public Preview phase, you may notice behavior or formatting changes that reflect the improvements that are included in the General Availibility release.
- When formatting the Card visual, you might notice that some of the format settings are in a different or new location, or the name of the setting is changed.
- In earlier versions of the Card visual, the **Callout** image was available as part of the **Image card**. This now been moved to the **Callout** section of **Format** pane.
- Certain **Layout** arrangements may impact existing reports that used the Card visual during its Public Preview phase. This is due to updates made to all card components as part of the General Availability release, including enhancements to layout, styling, and image handling.
- Users who previously relied on the Image card layout should update their visuals accordingly using the Format pane to access and configure the Callout image settings.

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
