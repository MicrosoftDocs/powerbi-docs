---
title: Create an Image Visual in Power BI
description: Learn how to create, customize, and use image visuals in Power BI Desktop and Power BI service. Add logos, photos, and graphics to enhance your reports with step-by-step guidance.
author: jacinda-eng
ms.author: jacindaeng
ms.reviewer: JulCsc
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/05/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the image visual feature in Power BI Desktop, including how to create and customize the visual, so I can enhance my reports with interactive image visuals.
---
<!-- markdownlint-disable MD024 -->

# Create an image visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The **Image visual** in Power BI is a dedicated visual that displays static images directly in reports with greater flexibility and control than previous methods. Whether you're adding a company logo, product photo, or illustrative graphic, this visual enhances data storytelling by integrating rich media elements seamlessly into the report canvas.

Beyond simple image placement, the image visual supports dynamic formatting and interactive behavior, enabling report creators to design visuals that respond to user engagement.

Beyond simple image placement, the image visual supports dynamic formatting and interactive behavior, enabling report creators to design visuals that respond to user engagement. This makes it ideal for creating branded dashboards, intuitive navigation elements, and visually guided experiences.

With support for local image uploads, web-hosted images, and images from your data model, along with customizable styling and contextual enhancements, the image visual empowers users to build more engaging, accessible, and user-friendly reports.

This article provides a step-by-step walkthrough for creating an image visual in both Power BI Desktop and Power BI Service.

## Prerequisites

In the following guide, you use the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

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

[!INCLUDE[sharing-license-requirements](../includes/share-license-requirements.md)]

## Create an image visual

For this example, create an image visual starting from the Visualizations pane.

1. From the **Visualizations** pane, select the **Build visual** icon, then select the **image visual** icon. A visual placeholder is added to the canvas.

   :::image type="content" source="media/power-bi-visualization-image-visual/build-image-visual-desktop-step-1.png" alt-text="Screenshot showing the Visualizations pane with the Build visual tab and image visual icon highlighted, and a visual placeholder on the canvas." lightbox="media/power-bi-visualization-image-visual/build-image-visual-desktop-step-1.png":::

1. To add an image to your image visual, use the **Format image** pane. From the **Image** tab, expand the **Style** card. Then, expand the **Image** controls to access the **Image source** dropdown. Choose **Upload image** to add a file from your device, **Enter URL** to link to an online image, or **Select from data** to bind the image visual to an image in your data model. For this guide, choose **Upload image** and pick an image from your local device.

   > [!TIP]
   > Large image files might affect report performance.

1. After uploading an image from your device, while still on the **Format image** pane, you have access to a full suite of controls to customize the image from the **Image** tab. Take some time to explore all the customization options available. You can specify a **Corner radius** using the **Shape** controls, stylize a border with the **Border** controls, or include a **Background color** using the **Background** controls. This array of options allows you to tailor the image's appearance and functionality to your specific requirements.

You successfully created an image visual with Power BI. Now, let's discover some of the other image visual features.

## Image visual features

In this section, you explore how the **Apply settings to** options relate to the **Action control** in the image visual.

The **Apply settings to** dropdown under the **Style card** works with the **Action control** to define how the image visual behaves and appears during user interaction. When you enable an action, such as **Page navigation** or opening a **Web URL**, the image becomes interactive. Its visual styling can change depending on the interaction state. For example, you might use the **Hover** state to highlight the image with a border or shadow when a user hovers over it, or the **Pressed** state to visually indicate that the image is clicked. These styling states help reinforce the image's role as an actionable element, providing visual feedback that improves usability and accessibility. By customizing each state, you create a more intuitive and responsive experience for report viewers.

### Visual states and styling

The **Apply settings to** dropdown under the Style card lets you define how the image visual appears during different stages of user interaction. You can style the image for four states:

- **All**: Applies the same formatting across all states.
- **Default**: The image's standard appearance.
- **Hover**: Styling when the cursor is over the image.
- **Pressed**: Styling when the image is clicked or tapped.

These states are especially useful when the image is interactive. They allow you to guide user behavior with visual cues like borders, shadows, or color changes.

### Interactive behavior

When you turn on the **Action toggle** in the **Action card**, the image visual becomes an interactive element. The **Type** dropdown offers several options for defining what happens when interacting with the image:

- **Back**: Returns to the previous report page.
- **Bookmark**: Navigates to a saved view or layout.
- **Page navigation**: Switches to another report page.
- **Q&A**: Opens a Q&A visual for natural language queries.
- **Web URL**: Opens a specified website in a browser.
- **Apply all slicers**: Applies slicer selections across the report.
- **Clear all slicers**: Resets slicer selections across the report.

These options let the image function like a button, enhancing navigation, interactivity, and user engagement.

### Contextual tooltips

The **Tooltip** control lets you add helpful text that appears when hovering over the image. You can enter static descriptions or use conditional formatting to display dynamic, data-driven content. Tooltips are a great way to provide context, instructions, or other insights without taking up space on the report canvas.

## Considerations and limitations

As a Power BI user, being aware of any image visual considerations and limitations helps you create effective and visually appealing visualizations. Understanding the considerations and limitations allows you to make informed decisions and use the full potential of Power BI image visuals. Whether you're a novice or an experienced user, this information aims to enhance your experience by keeping you up-to-date with practical insights and tips for any known issues.

The following list presents known considerations and limitations for the image visual. It helps you navigate the nuances of image visuals in both Power BI Desktop and the Power BI service.

### Image file label behavior

- When you upload a report that includes an image to the Power BI service, the original image file name doesn't appear. Instead, the **Image** control shows the file name as "Uploaded file".

## Related content

- [List slicer](power-bi-visualization-list-slicer.md)
- [Text slicer](power-bi-visualization-text-slicer.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
