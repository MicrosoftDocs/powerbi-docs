---
title: Purchase and assign Power BI paid licenses
description: Learn how to purchase and assign Power BI paid user licenses to users so they can access content and collaborate with others in the Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 03/21/2024
ms.custom: licensing support
LocalizationGroup: Administration
---

# Purchase and assign Power BI paid user licenses

> [!IMPORTANT]
>This article is for administrators and explains how to purchase Power BI paid user licenses in the Microsoft 365 admin center. After purchasing, you assign licenses to users from either the Microsoft 365 admin center or the Azure portal.

Power BI Pro and Power BI Premium Per User (PPU) are individual user licenses that let users read and interact with reports and dashboards that others publish to the Power BI service. Users with a paid license can share content and collaborate with other Pro or PPU users. Only paid users can publish or share content with other users or use content that's created by others, unless a Power BI Premium capacity hosts that content. For more information about the available types of licenses and subscriptions, see [Power BI licensing in your organization](service-admin-licensing-organization.md).


## Prerequisites

- To purchase and assign licenses in the Microsoft 365 admin center, you must be a member of the [Global or Billing admin role in Microsoft 365](https://support.office.com/article/about-office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d).
- To assign licenses in the Azure portal, you must be an owner of the Azure subscription that Power BI uses for Microsoft Entra lookups.

## Purchase licenses in Microsoft 365

To Purchase Power BI paid licenses in the Microsoft 365 admin center:

1. Using your administrator account, sign in to the [Microsoft 365 admin center.](https://admin.microsoft.com)
1. On the navigation menu, select **Billing**, and then select **Purchase services**.
1. Search for **Power BI** or select **Power BI** from the **View by category** section.
1. Compare offers or select **Power BI**, and choose **Details**.

   :::image type="content" source="media/service-admin-purchasing-power-bi-pro/power-bi-purchase-services.png" alt-text="Screenshot showing the Microsoft 365 billing menu with Purchase services selected.":::
1. Select the number of licenses you want to purchase and the billing frequency. 
    - If you didn't already use it, start a **Fabric free** trial subscription. The Fabric free trial expires after 60 days.
    - Not ready to purchase Power BI, start with a **Power BI Pro** trial. The Power BI Pro trial includes up to 25 licenses. You'll need to enter your payment information because you'll be charged the monthly fee after the 30-day trial expires. 
1. Ready to purchase a Power BI paid license? Select **Buy**.

1. Complete the information on the checkout page, and then select **Place order**.
1. To verify your purchase, on the navigation menu, select **Billing**, and then select **Your Products**.
1. To assign licenses to users, from **Billing**, select **Licenses**.

> [!NOTE]
> To receive an invoice instead of using a credit card or bank account, work with your Microsoft Reseller or go through the Volume Licensing Service Center to add or remove licenses. For more information, see [Manage subscription licenses](/microsoft-365/commerce/licenses/buy-licenses).

## Assign licenses from the Microsoft 365 admin center

To learn how to assign licenses from the Microsoft 365 admin center, see [Assign Microsoft 365 licenses to users](/microsoft-365/admin/manage/assign-licenses-to-users).

For guest users, see [Use the licenses page to assign licenses to users](/microsoft-365/admin/manage/assign-licenses-to-users#assign-licenses-by-using-the-licenses-page). Before assigning paid licenses to guest users, contact your Microsoft account representative to make sure you're in compliance with the terms of your agreement.

## Assign licenses from the Azure portal

Follow these steps to assign Power BI licenses to individual user accounts:

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Search for and select **Manage Microsoft Entra ID**.
   :::image type="content" source="media/service-admin-purchasing-power-bi-pro/fabric-assign-licenses.png" alt-text="Screenshot showing the selection for Microsoft Entra ID.":::
1. In the navigation pane, under **Manage**, select **Licenses**.
1. Select **All products**.
1. Select the name of your product (for example, **Fabric** or **Power BI**) and then choose **+ Assign**.
1. On the **Assign license** page, select a user or select **+ Add users and groups**. Add users.
1. Select **Assignment options** and set the required options to **On**.
1. Select **Review + Assign**, and then select **Assign**.

## Considerations and limitations

Self-service purchase, subscription, and license management capabilities for Fabric and Power BI are available for commercial cloud customers. For more information:

- [Self-service purchase FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq)  
- [Enable or disable self-service sign-up and purchasing](./service-admin-disable-self-service.md)

To upgrade your own free license to a Power BI Pro license, go to [Get started with Power BI Pro](https://go.microsoft.com/fwlink/?LinkId=2106428&clcid=0x409&cmpid=pbidocs-purchasing-power-bi-pro) and purchase a Pro license.


## Related content

- [Power BI licensing in your organization](service-admin-licensing-organization.md)

- [Sign up for Power BI as an individual](../fundamentals/service-self-service-signup-for-power-bi.md)

More questions? [Try asking the Power BI Community.](https://community.powerbi.com/)
