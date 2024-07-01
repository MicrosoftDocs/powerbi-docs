---
title: Guidelines for publishing Power BI custom visuals
description: Learn about the guidelines to publish Power BI custom visuals to Microsoft AppSource so that others can discover and use them.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 07/01/2024
#customer intent: As a Power BI visual developer, I want to learn how to publish Power BI custom visuals to Microsoft AppSource so that others can discover and use them.
---

# Guidelines for publishing Power BI custom visuals

Before you [publish Power BI custom visuals to Microsoft commercial marketplace](office-store.md) for others to discover and use, follow these guidelines to create a great experience for your users.

## Power BI visuals: Free or for purchase

Power BI visuals submitted to the [Commercial Marketplace](/azure/marketplace/overview) (Microsoft AppSource) can be made available for free, or you can add the tag *additional purchase may be required*. Visuals with the *additional purchase may be required* designation are similar to in-app purchase (IAP) add-ins.

Like the free Power BI visuals, an IAP Power BI visual can also be certified. Before submitting your IAP Power BI visual for certification, make sure it complies with the [certification requirements](power-bi-custom-visuals-certified.md).

### Power BI visuals with IAP features

An IAP Power BI visual is a *free* visual that offers *free features*. It also has some advanced features available for a fee. In the Power BI visual's description, developers must notify users about features that require additional purchases to operate them. We recommend using Microsoft's native [Licensing API](./licensing-api.md) to manage the purchase of these apps and add-ins, but developers can use any third-party payment system for these purchases. For more information, see [our Commercial Marketplace certification policy](/legal/marketplace/certification-policies#11002-displaying-ads).

>[!IMPORTANT]  
> If you update your Power BI visual from *free* to *additional purchase may be required*, customers must receive the same level of free functionality as before the update. You can add optional advanced paid features in addition to the existing free features.

### Watermarks

You can use watermarks to allow customers to continue using the IAP advanced features without paying.

Watermarks let you showcase the full functionality of the Power BI visual to customers before they make a purchase.

Only use watermarks on **paid** features used without a valid license. Watermarks aren't allowed on free features of IAP visuals.

### Pop-up window

Use a pop-up window to explain how to purchase a license when customers use an invalid (or expired) license with your Power BI IAP visual.

### Submission process

Follow the [submission process](./office-store.md#submit-or-update-your-custom-visual-to-appsource), then navigate to the **Offer setup** tab. Select the **My product requires the purchase of a service** check box.

After the Power BI visual is validated and approved, the Microsoft AppSource listing for the IAP Power BI visual displays that *more purchase may be required* under the pricing options.

## Context menu

The context menu is the menu that displays when the user right-clicks inside a visual.
All Power BI visuals should enable the context menu to give users a unified experience. For more information, see [Add a context menu to your Power BI visual](context-menu.md).

:::image type="content" source="media/guidelines-powerbi-visuals/context-menu.png" alt-text="Screenshot of a Power BI visual context menu.":::

## Commercial logo

This section describes the specifications for adding commercial logos in Power BI visuals. Commercial logos aren't required. If you add them, make sure they follow these guidelines.

> [!NOTE]
>
> * In this article, the term commercial logo refers to any commercial company icon. See the following pictures.
> * The Microsoft commercial logo is used in this article only as an example. Use your own commercial logo with your Power BI visual.

> [!IMPORTANT]
> Commercial logos are allowed in *edit* mode only. Commercial logos can't be displayed in view mode.

### Commercial logo type

There are three types of commercial logos:

* **Logo**: Two elements locked together, an icon and a name.

   :::image type="icon" source="media/guidelines-powerbi-visuals/microsoft-logo.png":::

* **Symbol**: A graphic without any text.

   :::image type="icon" source="media/guidelines-powerbi-visuals/microsoft-symbol.png":::

* **Logotype**: A text logo without an icon.

    :::image type="icon" source="media/guidelines-powerbi-visuals/microsoft-logotype.png":::

### Commercial logo color

When using a commercial logo, the color of the logo must be grey (hex color #C8C8C8). Don't add effects such as gradients to the commercial logo.

* **Logo**

    :::image type="icon" source="media/guidelines-powerbi-visuals/grey-microsoft-logo.png":::

* **Symbol**

    :::image type="icon" source="media/guidelines-powerbi-visuals/grey-microsoft-symbol.png":::

* **Logotype**

   :::image type="icon" source="media/guidelines-powerbi-visuals/grey-microsoft-logotype.png":::

> [!TIP]
>
> * If your Power BI visual contains a graphic, consider adding a white background with 10 px margins to your logo.
> * Consider adding dropshadow to your logo (30% opacity black).

### Commercial logo size

A Power BI visual uses two commercial logos&mdash;one for the offer details page and one for the search page. Provide the large logo in PNG format at 300 x 300 px. The Partner Center will use this logo to generate a smaller logo for the search page. You can optionally replace this with a different image later.

### Commercial logo behavior

Commercial logos are only allowed in edit mode. When selected, a commercial logo can only include the following functionality:

* Selecting the commercial logo redirects customers to your website.

* Selecting the commercial logo opens a pop-up window with additional information divided into two sections.

  * A marketing area for the commercial logo, a visual, and market ratings.
  * An information area for information and links.

### Limitations regarding logos

* Commercial logos can't be displayed in view mode.

* If your Power BI visual includes informative icons (i) in reading mode, they should comply with the color, size, and location of the commercial logo, as described earlier.

* Avoid a colorful or a black commercial logo. The commercial logo must be grey (hex color #C8C8C8).

    :::image type="icon" source="media/guidelines-powerbi-visuals/no-color-logo.png"::: :::image type="icon" source="media/guidelines-powerbi-visuals/black-logo.png":::

* Avoid a commercial logo with effects such as gradients or strong shadows.

     :::image type="icon" source="media/guidelines-powerbi-visuals/no-style-logo.png":::

## Best practices

When publishing a Power BI visual, consider the following recommendations to give customers the best possible experience.

* Create a [landing page](landing-page.md) that provides information about your Power BI visual. Include details like how to use the visual and where to purchase the license. A meaningful landing page helps report creators use the visual correctly and easily.
* Don't include videos that are automatically triggered.
* Add only material that improves the customer's experience, such as information or links to license purchasing details and how to use IAP features.
* For the customer's convenience, add the license key or token related fields at the top of the format pane.
* Submit a short screen-recording video that shows how to use the visual.
* Submit a detailed description of the visual's functionality. Include information about supported features such as [high contrast](high-contrast-support.md), [report page tooltip](add-tooltips.md), and [drill down](drill-down-support.md).
* Check the quality of your code. Make sure it's up to standard, including unhandled exceptions.
* Update your visual using the [latest API](https://www.npmjs.com/package/powerbi-visuals-api).

## FAQ

For more information about Power BI visuals, see [Frequently asked questions about Power BI visuals with extra purchases](/power-bi/developer/visuals/power-bi-custom-visuals-faq#visuals-with-additional-purchases).

## Related content

Learn how you can publish your Power BI visual to for others to discover and use.

>[Publish Power BI visuals](office-store.md)

>[Get a Power BI visual certified](power-bi-custom-visuals-certified.md)
