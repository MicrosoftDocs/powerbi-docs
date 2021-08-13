---
title: Add custom branding to the Power BI service
description: Custom branding lets you change the look and feel of the Power BI service to match your organization's theme. 
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to 
ms.date: 05/19/2021
ms.custom: template-how-to
---

# Add custom branding to the Power BI service

As a Power BI admin, you can change the look and feel of the Power BI service to match your organization's own branding. Custom branding lets you change the theme color that appears in the top navigation bar, add your company logo, and bring your default landing page to life by adding a cover image.

Custom branding will change the look of Power BI for your whole organization. Users can't override your custom branding with their own theme. Custom branding also appears to any external users who have access to your reports in B2B scenarios, helping to easily distinguish your organization.

## Before you begin

- Make sure you're a Power BI Administrator.
- Prepare your images for upload. You'll need these files:
    - A logo file that's saved in .png format, is 10 KB or smaller, and is at least 200 x 30 pixels. Using a PNG file will make sure your logo has a high-resolution appearance on all screens and at all zoom levels. The logo appears on every page.
    - A cover image that's saved in .jpg or .png format, is 1 MB or smaller, and is at least 1920 x 160 pixels. Get creative with your choice with an image that complements your theme color and feels welcoming. The cover image appears only at the top of Home.
- Identify the hex or decimal code for your theme color. Your theme color appears on every page and provides the background for your logo. We recommend that you choose a color that complements your logo and cover image or that matches other custom branding in your organization.

The image below indicates where each of these elements appears in the Power BI service.

:::image type="content" source="media/service-admin-custom-branding/custom-brand-elements.png" alt-text="Screen capture labeling where custom  brand appears." lightbox="media/service-admin-custom-branding/custom-brand-elements.png":::

1. Logo
1. Cover image
1. Theme color

## Add custom branding

Follow these steps to customize the look of Power BI for your whole organization.

1.  Sign in to the [Power BI service](https://app.powerbi.com) as a Power BI admin.
1. From the navigation bar, select **Settings** > **Admin portal** > **Custom branding**.

    :::image type="content" source="media/service-admin-custom-branding/custom-brand-navigate.png" alt-text="Screen capture showing how to get to custom branding settings." border="false" lightbox="media/service-admin-custom-branding/custom-brand-navigate.png":::

1. Upload a logo file.
1. Upload a cover image file, then crop as needed to adjust how the image appears on the page.
1. Select your theme color by using the color picker or by typing the hex or decimal code.

    :::image type="content" source="media/service-admin-custom-branding/custom-brand-color-picker.png" alt-text="Screen capture showing theme color picker.":::
   
1. Select  **Preview** to see how your custom branding looks before you publish.
1. When you're happy with your settings, select **Publish** to make the custom branding the default appearance for all users in your organization. The custom branding will appear when you refresh your browser window.

    :::image type="content" source="media/service-admin-custom-branding/custom-brand-publish.png" alt-text="Screen capture showing all custom brand elements ready to publish.":::

## Remove custom branding

Follow these steps to return the look of Power BI to the default settings.

1. Sign in to the Power BI service as a Power BI admin.
1. From the navigation bar, select **Settings** > **Admin portal** > **Custom branding**.
1. Select **Remove custom branding**, then select **Publish** to go back to the Power BI default look.

## Next steps

Give your users a consistent online experience by applying custom branding to other services. Custom branding settings aren't shared between Microsoft 365 and Power BI, but your users will see branding that you apply to your organization's Azure Active Directory sign-in page.

- [Add branding to your organization's Azure Active Directory sign-in page](/azure/active-directory/fundamentals/customize-branding)
- [Customize the Microsoft 365 theme for your organization](/microsoft-365/admin/setup/customize-your-organization-theme)
- [Add featured content to Power BI Home](../collaborate-share/service-featured-content.md)
