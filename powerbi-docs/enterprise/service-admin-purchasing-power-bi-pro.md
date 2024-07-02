---
title: Purchase Power BI and assign licenses
description: Learn how to purchase Power BI and assign user licenses to users so they can access content and collaborate with others in the Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 06/30/2024
ms.custom: licensing support
LocalizationGroup: Administration
#customer intent: As am admin, I need to know how to acquire and assign Power BI Pro licenses to users in my organization. 
---

# Purchase and assign Power BI paid user licenses

This article is for administrators and explains how to purchase paid user licenses for Power BI and Fabric in the Microsoft 365 admin center. After purchasing, you assign licenses to users from either the Microsoft 365 admin center or the Azure portal. Some organizations make licenses available for self-service upgrade and purchase by the organization's users. [This self-service can be disabled or alternate processes can be put in place by an organization](./service-admin-disable-self-service.md). 

> [!NOTE]
>The Power BI service is available as a standalone service and as one of the services that's integrated with [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview). Administration and licensing of the Power BI service is now integrated with Microsoft Fabric.

To learn about license types, see [Licensing for Fabric and Power BI](/power-bi/fundamentals/service-features-license-type).

## Prerequisites

- To purchase and assign licenses in the Microsoft 365 admin center, you must be a member of the [Global or Billing admin role in Microsoft 365](https://support.office.com/article/about-office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d).
- To assign licenses in the Azure portal, you must be an owner of the Azure subscription that Power BI uses for Microsoft Entra lookups.

## Purchase licenses in Microsoft 365

To purchase Power BI paid licenses in the Microsoft 365 admin center:

1. Using your administrator account, sign in to the [Microsoft 365 admin center.](https://admin.microsoft.com)
1. On the navigation menu, select **Home**, and then select **Subscriptions** > **Add more products**.
1. In the **View by category** section, search for **Power BI**.
1. Scroll to the license you want to purchase, and select **Details**.

    :::image type="content" source="media/service-admin-purchasing-power-bi-pro/power-bi-m365-purchase.png" alt-text="Screenshot showing the Power BI options for Purchase services.":::

1. Select the number of licenses you need and whether you want to be charged monthly or yearly.
1. Select **Buy**.
1. Complete the **Checkout** page and place your order.
1. To verify your purchase, on the navigation menu, select **Billing**, and then select **Your Products**.

> [!NOTE]
> To receive an invoice instead of using a credit card or bank account, work with your Microsoft Reseller or go through the Volume Licensing Service Center to add or remove licenses. For more information, see [Manage subscription licenses](/microsoft-365/commerce/licenses/buy-licenses).

## Assign licenses from the Microsoft 365 admin center

To assign licenses to users, from **Billing**, select **Licenses**, and **Power BI Pro** or **Power BI Premium Per User**. For detailed information about assigning licenses from the Microsoft 365 admin center, see [Assign Microsoft 365 licenses to users](/microsoft-365/admin/manage/assign-licenses-to-users).

For guest users, see [Use the licenses page to assign licenses to users](/microsoft-365/admin/manage/assign-licenses-to-users#assign-licenses-by-using-the-licenses-page). Before assigning paid licenses to guest users, contact your Microsoft account representative to make sure you're in compliance with the terms of your agreement.

## Assign licenses from the Azure portal

Follow these steps to assign Power BI licenses to individual user accounts:

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Search for and select **Microsoft Entra ID**.
   :::image type="content" source="media/service-admin-purchasing-power-bi-pro/fabric-assign-licenses.png" alt-text="Screenshot showing the selection for Microsoft Entra ID.":::
1. In the navigation pane, under **Manage**, select **Licenses**. 
1. Select **Manage** again and choose **All products.**
1. Select the name of your product (for example, **Power BI Premium Per User** or **Power BI Pro**) and then choose **+ Assign**.
1. On the **Assign license** page, select a user, or select **+ Add users and groups**. Select one or more users from the list. 
1. Select **Assignment options** and set the required options to **On**.
1. Select **Review + Assign**, and then select **Assign**.

## Considerations and limitations

Self-service purchase, subscription, and license management capabilities for Fabric and Power BI are available for commercial cloud customers. For more information:

- [Self-service purchase FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq)  
- [Enable or disable self-service sign-up and purchasing](./service-admin-disable-self-service.md)

## Related content

- [Power BI licensing in your organization](service-admin-licensing-organization.md)

- [Sign up for Power BI as an individual](../fundamentals/service-self-service-signup-for-power-bi.md)

More questions? [Try asking the Power BI Community.](https://community.powerbi.com/)
