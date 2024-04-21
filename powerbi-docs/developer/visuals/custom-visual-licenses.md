---
title: License models for Power BI AppSource visuals
description: This article explains how the licenses for Power BI visuals purchased on AppSource are enforced.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 09/17/2023
---

# Power BI AppSource visual license models

When you buy a custom visual from [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals&exp=kyyw&page=1&filters=pay-as-you-go), there are several business and licensing models (pricing, free trials etc.) available. Some visuals have free trial versions, while others have a basic version available for free with extra functionality available for purchase.

>[!NOTE]
>Licensed visuals are supported from the July 2022 desktop.

## No license or partial license

If you try to render an unlicensed visual or a visual that you only have a partial license for, you may see one of the following icons:

* If you have an unlicensed visual in your report, the visual will render with an icon in the corner. Hover over the icon for a link to that visual on AppSource.com.

  :::image type="content" source="media/custom-visual-licenses/unlicensed-icon.png" alt-text="Screenshot showing an unlicensed custom visual with the unlicensed user icon in the corner.":::

* If you have a free version of the visual, a banner will appear with a link to upgrade your license. This banner will disappear after a while.

  :::image type="content" source="media/custom-visual-licenses/upgrade-visual-banner.png" alt-text="Screenshot showing a banner offering to upgrade the visual license.":::

* If you try using a feature in the visual that you don't have a license to use, a banner will appear with a link to upgrade your license.

  :::image type="content" source="media/custom-visual-licenses/upgrade-banner.png" alt-text="Screenshot showing a banner offering to upgrade the license.":::

* If you have an unlicensed visual in your report, the visual won't render, and a button will appear enabling you to get a license or contact the report owner.

  :::image type="content" source="media/custom-visual-licenses/get-a-license.png" alt-text="Screenshot showing a button for getting a license or contacting owner.":::

## Unsupported environment

If your report or dashboard contains a visual that isn't supported in your environment, the visual won't render and a notification will appear.

  :::image type="content" source="media/custom-visual-licenses/unsupported-environment.png" alt-text="Screenshot showing notification of an unsupported environment.":::

For a list of unsupported environments see [limitations](#considerations-and-limitations).

## Solution

Select **Upgrade visual** to go to the AppSource page where you can buy the license or upgrade to the paid version.

After you purchase and assign the license, it can take up to an hour for the license to be recognized. Wait one hour and then refresh your Power BI session (restart Desktop or refresh your web browser).

## Considerations and limitations

Currently, the following Power BI environments don't support license management or license enforcement:

* Embedded - Publish To Web, PaaS embed
* National/Regional clouds (Depends on general support for transactability in national/regional clouds)
* RS Server (No planned support)
* Exporting (PDF\PPT) using REST API

## Related content

[Import a Power BI visual](import-visual.md)
