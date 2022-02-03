---
title: Purchase and assign Power BI Pro licenses
description: Learn how to purchase and assign Power BI Pro user licenses to users so they can access content and collaborate with others in the Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 04/02/2021
ms.custom: licensing support
LocalizationGroup: Administration
---

# Purchase and assign Power BI Pro user licenses

>[!IMPORTANT]
>This article is for admins. Are you a user ready to upgrade to a Power BI Pro license? Go directly to [Get started with Power BI Pro](https://go.microsoft.com/fwlink/?LinkId=2106428&clcid=0x409&cmpid=pbidocs-purchasing-power-bi-pro) to set up your account.

Power BI Pro is an individual user license that lets users read and interact with reports and dashboards that others have published to the Power BI service. Users with this license type can share content and collaborate with other Power BI Pro users. Only Power BI Pro users can publish or share content with other users or consume content that's created by others, unless a Power BI Premium capacity hosts that content. For more information about the available types of licenses and subscriptions, including Premium Per User (PPU) licenses, see [Power BI licensing in your organization](service-admin-licensing-organization.md).

## Purchase Power BI Pro user licenses

This article explains how to buy Power BI Pro user licenses in the Microsoft 365 admin center. After you buy licenses, you can assign them to users in either the Microsoft 365 admin center or the Azure portal.

> [!NOTE]
> Self-service purchase, subscription, and license management capabilities for Power Platform products (Power BI, Power Apps, and Power Automate) are available for commercial cloud customers. For more information, see [Self-service purchase FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq). To enable or disable self-service purchasing capabilities, see [Enable or disable self-service sign-up and purchasing](./service-admin-disable-self-service.md).

### Prerequisites

To purchase and assign licenses in the Microsoft 365 admin center, you must be a member of the [global administrator or Billing administrator](https://support.office.com/article/about-office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d) role in Microsoft 365.

To assign licenses in the Azure portal, you must be an owner of the Azure subscription that Power BI uses for Azure Active Directory lookups.

### Purchase licenses in Microsoft 365

> [!NOTE]
> If you usually purchase licenses through a volume licensing agreement, such as an Enterprise Agreement, and want to receive an invoice instead of purchasing with a credit card or bank account, you need to submit the order differently. Work with your Microsoft Reseller or go through the Volume Licensing Service Center to add or remove licenses. For more information, see [Manage subscription licenses](/microsoft-365/commerce/licenses/buy-licenses).

Follow these steps to purchase Power BI Pro licenses in the Microsoft 365 admin center:

1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).

2. On the navigation menu, select **Billing** > **Purchase services**.

3. Search or scroll to find the subscription you want to buy. You'll find **Power BI** under **Other categories that might interest you** near the bottom of the page. Select the link to view the Power BI subscriptions available to your organization.

4. Select **Power BI Pro**.

5. On the **Purchase services** page, select **Buy**.

6. Choose **Pay monthly** or **Pay for a full year**, according to how you want to pay.

7. Under **How many users do you want?** enter the number of licenses to buy, then select **Check out now** to complete the transaction.

8. To verify your purchase, go to **Billing** > **Products & services** and look for  **Power BI Pro**.

9. To add more licenses later, locate **Power BI Pro** on the **Products & services** page, and then select **Add/Remove licenses**.


## Assign licenses in the Microsoft 365 admin center

For information about assigning licenses in the Microsoft 365 admin center, see [Assign licenses to users](/office365/admin/manage/assign-licenses-to-users).

For guest users, see [Assign licenses to users on the Licenses page](/office365/admin/manage/assign-licenses-to-users#assign-licenses-to-users-on-the-licenses-page). Before assigning Pro licenses to guest users, contact your Microsoft account representative to make sure you're in compliance with the terms of your agreement with Microsoft.

## Assign licenses in the Azure portal

Follow these steps to assign Power BI Pro licenses to individual user accounts:

1. Sign in to the [Azure portal](https://portal.azure.com/).

2. Search for and select **Azure Active Directory**.

3. Under **Manage** on the **Azure Active Directory** resource menu, select **Licenses**.

4. Select **All products** from the **Licenses - Overview** resource menu, then select **Power BI Pro** to display the list of licensed users.

5. From the command bar, select **+ Assign**. On the **Assign license** page, first choose a user, then select **Assignment options** to turn on a Power BI Pro license for the selected user account.

## Next steps

- [Power BI licensing in your organization](service-admin-licensing-organization.md)

 - [Find Power BI users who have signed in](service-admin-access-usage.md)

 - [Sign up for Power BI as an individual](../fundamentals/service-self-service-signup-for-power-bi.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)