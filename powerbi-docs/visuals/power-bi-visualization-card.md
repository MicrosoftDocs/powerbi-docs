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

The Card visual in Power BI presents key metrics in a visually appealing format. Each card displays a specific metric, such as total sales or profit growth, and can be customized to reflect your objectives and key results (OKRs). Multiple cards can be grouped within a single container, providing full control over every component and a comprehensive overview of important data points.

The Card visual is useful for showcasing critical performance indicators in business and finance, and for highlighting metrics like customer engagement and conversion rates in marketing. The visual's design and functionality enable you to interact with your data effectively and make informed decisions based on real-time insights.

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

## Build your card visual

You can create a Card visual in several ways:

- Start from the **Visualizations** pane and select the **Card visual** icon.
- Expand the **Data** pane, select the necessary data fields, then select the **Card visual** icon from the **Visualizations** pane.
- In Power BI Desktop, you can also start from the **Insert** ribbon, select **New visual**, then select the **Card visual** icon from the **Visualizations** pane.

:::image type="content" source="media/power-bi-visualization-card-visual/build-card-service-step-1.png" alt-text="Screenshot with Visualizations pane, Build visual icon, and the Card visual icon, all highlighted." lightbox="media/power-bi-visualization-card-visual/build-card-service-step-1.png":::

## Add data to your card visual

To add data to the visual, let’s use the Data pane in this example. Adding data can be done by selecting each field in the Data pane, or dragging the fields to the field wells on the Visualizations pane, or dragging the fields directly to the visual placeholder in the report canvas. Expand the Sales group, then drag StoreCount and TotalSalesLY to the Value field well. You'll notice that each data field you added is displayed as its own card.

:::image type="content" source="media/power-bi-visualization-card-visual/build-card-service-step-2.png" alt-text="Screenshot: Data pane highlighted, Sales group expanded, StoreCount + TotalSalesLY measures highlighted and added to Value field well in Visualizations pane." lightbox="media/power-bi-visualization-card-visual/build-card-service-step-2.png":::

## Customize your card visual

To customize your visual, select the Format visual icon in the Visualizations pane, granting you access to all available settings under that Visual and General tabs. This allows you to tailor the chart's appearance and functionality to your specific requirements.

Additional format settings are available under the **Format visual** tab. These options include layout adjustments and color customization.

Layout properties can be used to group related metrics and organize reports. The available settings provide control over the appearance and arrangement of Card visuals.

### Add a Card visual to the canvas

1. From the **Visualizations** pane, make sure the **Build visual** tab is selected, then select the **Card visual** icon in the visual gallery.

   :::image type="content" source="media/power-bi-visualization-card-visual/build-card-desktop-step-1.png" alt-text="Screenshot of the Visualizations pane with the Build visual tab and Card visual icon highlighted." lightbox="media/power-bi-visualization-card-visual/build-card-desktop-step-1.png":::

### Add data to your card

1. From the **Data** pane, expand the **Sales** group, and drag the **Store count** measure to the **Value** field well to create your first card.

### Add categories to display multiple cards

1. From the **Data** pane, drag **DM** (*District Managers*) from the **District** group, and add it to the **Categories** field well to display multiple cards showing the various managers.
1. To narrow down what appears in the Card visual, from the **Filters** pane, expand the **DM** filter card, and select only the first two district managers. This keeps your Card visual focused on the selected data.

### Add a hero image

A **hero image** is a large, prominent image that captures attention. To add a hero image below your metric area, follow these steps:

1. With the Card visual selected on the canvas, from the **Visualizations** pane, select the **Format visual** icon.
1. Under the **Visual** tab, expand the **Image** card.
1. In the **Apply setting to** section, select **Store Count** in the **Cards** dropdown.
1. Expand the **Image** controls, and turn on the **Image toggle**.
1. For the **Image source** choose **Select from data** and drag the **DM_Pic_fl** field into the **Data** field well.

:::image type="content" source="media/power-bi-visualization-card-visual/build-card-images-step-3.png" alt-text="Screenshot of the Visualizations pane with Format visual icon and Visual tab highlighted, Store count selected in Image Apply settings to Cards, Image toggle ON, Source is Data, DM_pic_fl field placed in Data field well." lightbox="media/power-bi-visualization-card-visual/build-card-images-step-3.png":::

> [!TIP]
> You might need to resize the Card visual on the canvas to see everything clearly and avoid truncated text or images.

### Add a callout image

A **callout image** provides subtle enhancements that work well for branding elements or small visual cues without overwhelming the metric display. To add an image to the callout section, follow these steps:

1. From the **Visualizations** pane, with the **Format visual** icon selected, expand the **Callout** card, and ensure **Store Count** is selected from the **Cards** dropdown in the **Apply settings to** control.
1. Expand the **Image** controls, turn on the **Image toggle**, and select **Upload Image** as the **Image type**.
1. Browse your device for an appropriate image, and select **Open** to add the image to the visual.

### Adjust image settings

1. Set the **Position** to **Left of text**.
1. Reduce the **Image area size** to complement your metric.

### Switch to multicard layout

From the **Visualizations** pane, select the **Format visual** icon, and under the **Visual** tab, expand the **Multi-category layout** card. In the **Layout** controls, change the **Style** dropdown to **Tiles**, and set the number of **Rows** to **2**. This step instantly makes your layout more compact and visually appealing.

:::image type="content" source="media/power-bi-visualization-card-visual/multi-card-layout-step-2.png" alt-text="Screenshot of the Power BI Format pane with Multi-category layout expanded, Layout Style set to Tiles and Rows set to 2." lightbox="media/power-bi-visualization-card-visual/multi-card-layout-step-2.png":::

### Adjust gaps and scrolling

Expand the **Gap** control and set the **Vertical gap** to **20 px** for better spacing between cards. In the **Overflow** control, switch the **Overflow style** to **Continuous Scroll**. This setting creates a smooth scrolling experience and keeps your report clean.

### Explore table layout

In the **Multi-card layout** card in the **Visualizations** pane, return to the **Layout** controls and change the **Style** to **Table**, and set the number of **Columns** to **2**. This setting gives you another way to view multiple cards side by side for better comparison.

### Customize padding and background

Expand the **Padding** control and set **Uniform padding** to **20 px**. Use the **Background** control to change the color to **Gray**.

### Arrange horizontally

From the **Visualizations** pane, navigate to the **Cards** section, and use the **Layout** control to change the **Arrangement** to **Horizontal**. This layout option can make your report feel more dynamic, and tailored to your design preferences.

## Considerations and limitations

- **Format settings**:
  - The **(new) Card visual** is generally available as the **Card visual** with the November 2025 Power BI release. If you used the Card visual during the public preview phase, you might notice behavior or formatting changes that reflect the improvements in the general availability release.
  - When formatting the Card visual, you might notice that some of the format settings are in a different or new location, or the name of the setting is changed.
  - In earlier versions of the Card visual, the **Callout** image was available as part of the **Image card**. This image is now in the **Callout** section of the **Format** pane.
  - Certain **Layout** arrangements might impact existing reports that used the Card visual during its public preview phase. This impact is due to updates made to all card components as part of the general availability release, including enhancements to layout, styling, and image handling.
  - If you previously relied on the Image card layout, update your visuals accordingly by using the Format pane to access and configure the Callout image settings.

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
