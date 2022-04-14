---
title: License enforcement for Power BI custom visuals
description: This tutorial explains how the licenses for Power BI custom visuals are enforced.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 04/14/2022
---

# Custom visual license enforcement

When you buy a custom visual from [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals), there are several business and licensing models (pricing, free trial period etc.) available. Some visuals have a free trial period before you have to purchase it. Others have a basic version available for free with extra functionality available for purchase.

If you try to render an unlicensed visual or a visual that you only have a partial license for, you may see one of the following icons:

* If you have an unlicensed visual in your report during the free trial period, the visual will render with an icon in the corner. Hover over the icon for a link to that visual on AppSource.com.

  :::image type="content" source="media/custom-visual-licenses/unlicensed-icon.png" alt-text="Screenshot showing an unlicensed custom visual with the unlicensed user icon in the corner.":::

* If you have a free version of the visual, when you are in edit mode, a banner will appear with a link to upgrade your license. This banner will disappear after a while.

  :::image type="content" source="media/custom-visual-licenses/upgrade-visual-banner.png" alt-text="Screenshot showing a banner offering to upgrade the visual license.":::

* If you have a free version of the visual and try using a feature that is only available in the paid version, a banner will appear with a link to upgrade your license.

  :::image type="content" source="media/custom-visual-licenses/upgrade-banner.png" alt-text="Screenshot showing a banner offering to upgrade the license.":::

* If you have an unlicensed visual in your report, the visual won't render and a button will appear enabling you to get a license or contact the owner of the report.

  :::image type="content" source="media/custom-visual-licenses/get-a-license.png" alt-text="Screenshot showing a button for getting a license or contacting owner.":::

* If your report contains a custom visual that isn't supported in your environment, it won't render and a notification will appear.

  :::image type="content" source="media/custom-visual-licenses/unsupported-environment.png" alt-text="Screenshot showing notification of an unsupported environment.":::

Selecting the icon will take you to the AppSource page where you can buy the license or upgrade to the paid version.

After you purchase and assign the license, you might have to refresh the visual or restart the Desktop, before the icon disappears.
