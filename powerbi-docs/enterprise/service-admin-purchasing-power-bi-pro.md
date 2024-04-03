---
title: Purchase and assign Power BI Pro licenses
description: Learn how to purchase and assign Power BI Pro user licenses to users so they can access content and collaborate with others in the Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 02/08/2024
ms.custom: licensing support
LocalizationGroup: Administration
---

# Purchase and assign Power BI Pro user licenses

>[!IMPORTANT]
>This article is for administrators. To upgrade to a Power BI Pro license, go to [Get started with Power BI Pro](https://go.microsoft.com/fwlink/?LinkId=2106428&clcid=0x409&cmpid=pbidocs-purchasing-power-bi-pro) to set up your account.

This article explains how to purchase Power BI Pro user licenses in the Microsoft 365 admin center. After purchasing, you can assign licenses to users from either the Microsoft 365 admin center or the Azure portal.

Power BI Pro is an individual user license that lets users read and interact with reports and dashboards that others publish to the Power BI service. Users with this license can share content and collaborate with other Power BI Pro users. Only Power BI Pro users can publish or share content with other users or use content that's created by others, unless a Power BI Premium capacity hosts that content. For more information about the available types of licenses and subscriptions, including Premium Per User (PPU) licenses, see [Power BI licensing in your organization](service-admin-licensing-organization.md).

Self-service purchase, subscription, and license management capabilities for Power Platform products (Power BI, Power Apps, and Power Automate) are available for commercial cloud customers. For more information:

- [Self-service purchase FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq)  
- [Enable or disable self-service sign-up and purchasing](./service-admin-disable-self-service.md)

## Prerequisites

- To purchase and assign licenses in the Microsoft 365 admin center, you must be a member of the [Global or Billing admin role in Microsoft 365](https://support.office.com/article/about-office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d).
- To assign licenses in the Azure portal, you must be an owner of the Azure subscription that Power BI uses for Microsoft Entra lookups.

## Purchase licenses in Microsoft 365

To Purchase Power BI Pro licenses in the Microsoft 365 admin center:

1. Sign in to the [Microsoft 365 admin center.](https://admin.microsoft.com)
1. On the navigation menu, select **Billing**, and then select **Purchase services**.
1. Search for **Power BI** or select **Power BI** from the **View by category** section.
1. Scroll to **Power BI Pro**, and select **Details**.
1. Select the number of licenses you want to purchase.
1. Select **Buy**.
1. On the **Checkout** page:
   1. Verify your organization and contact information.
   1. Enter payment information, and then select **Save**.
   1. Review your order information.
   1. Select **Place order**.
1. To verify your purchase, on the navigation menu, select **Billing**, and then select **Your Products**.
1. To add licenses, from **Billing**, select **Licenses**.

> [!NOTE]
> To receive an invoice instead of using a credit card or bank account, work with your Microsoft Reseller or go through the Volume Licensing Service Center to add or remove licenses. For more information, see [Manage subscription licenses](/microsoft-365/commerce/licenses/buy-licenses).

## Assign licenses from the Microsoft 365 admin center

For information about assigning licenses from the Microsoft 365 admin center, see [Assign Microsoft 365 licenses to users](/office365/admin/manage/assign-licenses-to-users).

For guest users, see [Use the licenses page to assign licenses to users](/office365/admin/manage/assign-licenses-to-users#assign-licenses-to-users-on-the-licenses-page). Before assigning Pro licenses to guest users, contact your Microsoft account representative to make sure you're in compliance with the terms of your agreement.

## Assign licenses in the Azure portal

Follow these steps to assign Power BI Pro licenses to individual user accounts:

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Search for and select **Microsoft Entra ID**.
1. Select **View** under **Manage Microsoft Entra ID**.
1. In the navigation pane, under **Manage**, select **Licenses**.
1. Select **All products**.
1. Select **Power BI Pro**, and then select **+ Assign**.
1. On the **Assign license** page, select a user or select **+ Add users and groups**. Add users.
1. Select **Assignment options** and set both options to **On**.
1. Select **Review + Assign**, and then select **Assign**.

## Related content

- [Power BI licensing in your organization](service-admin-licensing-organization.md)

- [Find Power BI users who have signed in](../admin/service-admin-access-usage.md)

- [Sign up for Power BI as an individual](../fundamentals/service-self-service-signup-for-power-bi.md)

More questions? [Try asking the Power BI Community.](https://community.powerbi.com/)
