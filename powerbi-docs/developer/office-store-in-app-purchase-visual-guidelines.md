---
title: Additional purchase may be required -  Power BI Visuals Guidelines
description: Learn how you can publish your custom visual to AppSource for others to discover and use it via a purchase.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 11/26/2018
---

# Guidelines for Power BI visuals with additional purchases

Until recently, the **Marketplace (AppSource)** accepted only Power BI visuals that are free. This policy is changing so that visuals with "additional purchase may be required" price-tag may also be submitted to the **AppSource**. Additional purchase may be required visuals are similar to in-app purchase (IAP) adds-in in office store. Developers may also submit these visuals for certification after the **AppSource** team approves them, and after making sure they comply with certification requirements, as described in the [Certified custom visuals article](../power-bi-custom-visuals-certified.md).

> [!Note]
> For the visual to be certified, it must not access external services or resources.

## What's changing in the submission process?

Developers upload their IAP visuals to AppSource via the Seller Dashboard, as they've been doing for free visuals. To indicate that the submitted visual has IAP features, developers should write in the seller dashboard notes: "Visual with in-app purchase." Also, developers need to provide a license key or token so that the validation team can validate the IAP features. Once the visual is validated and approved, the AppSource listing for the IAP visual states 'Additional purchase may be required' under the pricing options.

## What is a Power BI visual with IAP features?

An IAP visual is free visual and offers free features, but also has additional features for which extra charges may be applied to operate them. Developers must notify users in the visual's description regarding which features require additional purchases to operate. Currently, Microsoft does not provide native application programming interfaces (APIs) to support purchase in apps and add-ins.
Developers may use any third-party payment system for those purchases. Refer to our store [policy](https://docs.microsoft.com/office/dev/store/validation-policies#2-apps-or-add-ins-can-display-certain-ads).

## Logo guidelines

This section describes the specifications for adding logos and logotypes in visuals.

> [!NOTE]
> Logos are allowed in edit mode only. Logos can't be displayed in view mode.

![definitions](media/office-store-in-app-purchase-visual-guidelines/definitions.png)

![things-to-keep](media/office-store-in-app-purchase-visual-guidelines/things-to-keep-in-mind.png)

![things-to](media/office-store-in-app-purchase-visual-guidelines/things-to-avoid.png)

![size-and-format ](media/office-store-in-app-purchase-visual-guidelines/size-and-format.png)

![margins-and](media/office-store-in-app-purchase-visual-guidelines/margins-and-sizes.png)

![edit-mode](media/office-store-in-app-purchase-visual-guidelines/logos-in-edit-mode.png)

## Best practices

### Visual landing page

Use the landing page to clarify to users how they can use your visual and where to purchase the license. Don't include videos that are automatically triggered. Only add material that helps improve the user's experience, such as information or links on license purchasing details, and how to use IAP features.

### License key and token

For user convenience, add license key or token related fields at the top of the format pane, so they are better located for users.

## FAQ

For more information and answers to questions, visit  [Frequently asked questions about visuals with additional purchases](https://docs.microsoft.com/en-us/power-bi/power-bi-custom-visuals-faq#visuals-with-additional-purchases).

## Next steps

Learn how you can publish your custom visual to [AppSource](office-store.md) for others to discover and use.
