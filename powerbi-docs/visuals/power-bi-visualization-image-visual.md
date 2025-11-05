---
title: Create an Image visual in Power BI
description: Learn how to create, customize, and use Image visuals in Power BI.
author: jacinda-eng
ms.author: jacindaeng
ms.reviewer: JulCsc
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/05/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the Image visual feature in Power BI Desktop, including how to create and customize the visual, so I can enhance my reports with interactive Image visuals.
---
<!-- markdownlint-disable MD024 -->

# Create an Image visual in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The **Image visual** is a dedicated visual introduced in Power BI to display static images directly into reports with greater flexibility and control than previous methods.

Whether you're adding a company logo, product photo, or illustrative graphic, the Image visual enhances the visual storytelling of your data by integrating rich media elements seamlessly into the report canvas.

Beyond simple image placement, the Image visual supports dynamic formatting and interactive behavior, enabling report creators to design visuals that respond to user engagement. This makes it ideal for creating branded dashboards, intuitive navigation elements, and visually guided experiences.

With support for local image uploads, web-hosted images, and images from your data model, along with customizable styling and contextual enhancements, the Image visual empowers users to build more engaging, accessible, and user-friendly reports.

This article provides a step-by-step walkthrough for creating an Image visual in both Power BI Desktop and Power BI Service.

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
> Sharing your report with a Power BI colleague requires that you both have an individual Power BI Pro license or that you save the report in Premium capacity.

## Create an Image visual

# [Power BI Desktop](#tab/powerbi-desktop)

Before we begin, if you haven't already done so, refer to the **[Prerequisites](#prerequisites)** section above, and follow the steps under the tab for **Power BI Desktop**.

For this example, let’s create an Image visual starting from the Visualizations pane in Power BI Desktop.

1. From the **Visualizations** pane, first select the **Build visual** icon, then select the **Image visual** icon, and a visual placeholder will be added to the canvas.

   :::image type="content" source="media/power-bi-visualization-image-visual/build-image-visual-desktop-step-1.png" alt-text="Insert ribbon, Image element, Visualizations pane, Build visual tab, Image visual icon, all highlighted, visual placeholder on canvas." lightbox="media/power-bi-visualization-image-visual/build-image-visual-desktop-step-1.png":::

2. To add an image to your Image visual, we'll use the **Format image** pane, and from the **Image tab**, let's expand the **Style card**.

   Then, expand the **Image** controls to access the **Image source** dropdown. Choose **Upload image** to add a file from your device, **Enter URL** to link to an online image, or **Select from data** to bind the image visual to an image in your data model.

   For this guide, choose **Upload image** and pick an image from your local device.

   > [!TIP]
   > Large image files may affect report performance.

   :::image type="content" source="media/power-bi-visualization-image-visual/build-image-visual-desktop-step-2.png" alt-text="Power BI Format image pane: Image tab with Style card open, Image source set to Upload image, Open file dialog on canvas." lightbox="media/power-bi-visualization-image-visual/build-image-visual-desktop-step-2.png":::

3. After uploading an image from your device, while still on the **Format image** pane, you have access to a full suite of controls to customize the image from the **Image** tab.

   Take some time to explore all the customization options available. You can specify a **Corner radius** using the **Shape** controls, stylize a border use the **Border** controls, or a include a **Background color** using the **Background** controls. This array of options allows you to tailor the image's appearance and functionality to your specific requirements, as shown in the example.

   :::image type="content" source="media/power-bi-visualization-image-visual/build-image-visual-desktop-step-3.png" alt-text="Both Format image pane and Image tab highlighted, Style card expanded displaying controls, with a formated image on canvas." lightbox="media/power-bi-visualization-image-visual/build-image-visual-desktop-step-3.png"::::

# [Power BI service](#tab/powerbi-service)

Before we begin, if you haven't already done so, refer to the **[Prerequisites](#prerequisites)** section above, and follow the steps under the tab for **Power BI service**.

For this example, let’s create a Image visual starting from the **Visualizations pane** in **Power BI service**.

1. To create your Image visual, we'll start in the **Visualizations pane**. With the **Build visual** icon selected, choose the **Image visual** icon, and a visual placeholder is added to the canvas.

   :::image type="content" source="media/power-bi-visualization-image-visual/build-image-visual-service-step-1.png" alt-text="Visualizations pane, Build visual tab, Image visual icon, all highlighted, visual placeholder on canvas." lightbox="media/power-bi-visualization-image-visual/build-image-visual-service-step-1.png":::

2. To add an image to your Image visual, we'll use the **Format image** pane, and from the **Image tab**, let's expand the **Style card**.

   Then, expand the **Image** controls to access the **Image source** dropdown. Choose **Upload image** to add a file from your device, **Enter URL** to link to an online image, or **Select from data** to bind the image visual to an image in your data model.

   For this guide, choose **Upload image** and pick an image from your local device.

   > [!TIP]
   > Large image files may affect report performance.

   :::image type="content" source="media/power-bi-visualization-image-visual/build-image-visual-service-step-2.png" alt-text="Power BI Format image pane: Image tab with Style card open, Image source set to Upload image, Open file dialog on canvas." lightbox="media/power-bi-visualization-image-visual/build-image-visual-service-step-2.png":::

3. After uploading an image from your device, while still on the **Format image** pane, you have access to a full suite of controls to customize the image from the **Image** tab.

   Take some time to explore all the customization options available. You can specifiy a **Corner radius** using the **Shape** controls, stylize a border use the **Border** controls, or a include a **Background color** using the **Background** controls. This array of options allows you to tailor the image's appearance and functionality to your specific requirements, as shown in the example.

   :::image type="content" source="media/power-bi-visualization-image-visual/build-image-visual-service-step-3.png" alt-text="Both Format image pane and Image tab highlighted, Style card expanded displaying controls, with a formated image on canvas." lightbox="media/power-bi-visualization-image-visual/build-image-visual-service-step-3.png"::::

---

You've successfully created a Image visual with Power BI. Now, let's discover some of the other Image visual features.

## Image visual features

In this section, let's explore how the **Apply settings to** options relate to the **Action control** in the Image visual.

The **Apply settings to** dropdown under the **Style card** works in tandem with the **Action control** to define how the Image visual behaves and appears during user interaction. When an action is enabled, such as **Page navigation** or opening a **Web URL**, the image becomes interactive, and its visual styling can change depending on the interaction state. For example, you might use the **Hover** state to highlight the image with a border or shadow when a user hovers over it, or the **Pressed** state to visually indicate that the image has been clicked. These styling states help reinforce the image’s role as an actionable element, providing visual feedback that improves usability and accessibility. By customizing each state, you can create a more intuitive and responsive experience for report viewers.

### Visual states and styling

The **Apply settings to** dropdown under the Style card lets you define how the Image visual appears during different stages of user interaction. You can style the image for four states:

- **All**: Applies the same formatting across all states.
- **Default**: The image's standard appearance.
- **Hover**: Styling when the cursor is over the image.
- **Pressed**: Styling when the image is clicked or tapped.

These states are especially useful when the image is interactive, allowing you to guide user behavior with visual cues like borders, shadows, or color changes.

   :::image type="content" source="media/power-bi-visualization-image-visual/image-visual-features-1.png" alt-text="Format Image pane and Image tab highlighted, Style card and Apply setting to controls expanded, displaying options for image State." lightbox="media/power-bi-visualization-image-visual/image-visual-features-1.png"::::

### Interactive behavior

When the **Action toggle** is turned on in the **Action card**, the Image visual becomes an interactive element, and the **Type** dropdown offers several options for defining what happens when interacting with the image:

- **Back**: Returns to the previous report page.
- **Bookmark**: Navigates to a saved view or layout.
- **Page navigation**: Switches to another report page.
- **Q&A**: Opens a Q&A visual for natural language queries.
- **Web URL**: Opens a specified website in a browser.
- **Apply all slicers**: Applies slicer selections across the report.
- **Clear all slicers**: Resets slicer selections across the report.

These options allow the image to function like a button, enhancing navigation, interactivity, and user engagement.

   :::image type="content" source="media/power-bi-visualization-image-visual/image-visual-features-2.png" alt-text="Format Image pane and Image tab highlighted, Action card expanded and toggled On, Action controls displaying options for action Type." lightbox="media/power-bi-visualization-image-visual/image-visual-features-2.png"::::

### Contextual tooltips

The **Tooltip** control lets you add helpful text that appears when hovering over the image. You can enter static descriptions or use conditional formatting to display dynamic, data-driven content. Tooltips are a great way to provide context, instructions, or additional insights without taking up space on the report canvas.

   :::image type="content" source="media/power-bi-visualization-image-visual/image-visual-features-3.png" alt-text="Format Image pane and Image tab highlighted, Action card expanded and toggled On, Tooltip control toggled On, showing text input box and Conditional formatting button." lightbox="media/power-bi-visualization-image-visual/image-visual-features-3.png"::::

## Considerations and limitations

As a Power BI user, the awareness of any Image visual considerations and limitations is helpful when creating effective and visually appealing visualizations. Understanding the considerations and limitations allow you to make informed decisions and leverage the full potential of Power BI Image visuals. Whether you're a novice or an experienced user, this information aims to enhance your experience by keeping you up-to-date with practical insights and tips for any known issues.

Here is a list of any known considerations and limitations for the Image visual, designed to help you navigate the nuances of image visuals in both Power BI Desktop and the Power BI service.

### Image file label behavior

- When uploading a report that includes an image to the Power BI service, the original image file name will not be displayed; instead, the **Image** control will show the file name as "Uploaded file".

## Related content

- [List slicer](power-bi-visualization-list-slicer.md)
- [Text slicer](power-bi-visualization-text-slicer.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
