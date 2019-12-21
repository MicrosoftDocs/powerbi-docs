---
title: "Purchase and assign Power BI Pro licenses"
description: Learn how to purchase and assign Power BI Pro user licenses so that your users can access content and collaborate with colleagues in the Power BI service.
author: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: quickstart
ms.date: 12/18/2019
ms.author: kfollis

LocalizationGroup: Administration
---

# Purchase and assign Power BI Pro user licenses

Power BI Pro is an individual user license that allows users to read and interact with reports and dashboards other users have published in the Power BI service, and to share content and collaborate with other Power BI Pro users. Only users with a Power BI Pro user license can publish or share content with other users or consume content created by other users, unless that content is hosted in a Power BI Premium capacity. For more information, see the _Power BI features comparison_ section of [Power BI pricing](https://powerbi.microsoft.com/pricing/).

## Purchase and assign Power BI Pro user licenses

This article explains how to purchase Power BI Pro user licenses in the Microsoft 365 admin center and then explains two options admins have for assigning those licenses to individual users: in the Microsoft 365 admin center and the Azure portal (choose one option).

### Prerequisites

To purchase and assign licenses in the Microsoft 365 admin center, you must be a member of the **[Global administrator or Billing administrator](https://support.office.com/article/about-office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d)** role in Microsoft 365.

To assign licenses in the Azure portal, you must be an owner of the Azure subscription that Power BI uses for Azure Active Directory lookups.

### Purchase licenses in Microsoft 365

Follow these steps to purchase Power BI Pro licenses in the Microsoft 365 admin center:

1. Open the [Microsoft 365 admin center](https://portal.office.com/adminportal/home#/homepage).

2. On the nav pane, select **Billing** then select **Subscriptions**.

3. In the upper right corner of the **Subscriptions** page, select **Add subscriptions**.

4. Locate the desired subscription offering:

    - Under **Enterprise Suite**, select **Office 365 Enterprise E5**.

    - Under **Other Plans**, select **Power BI Pro**.

5. Hover over the ellipsis (**. . .**) for the desired subscription, and select **Buy now**.

6. Choose **Pay monthly** or **Pay for a full year**, according to your billing preference.

7. Under **How many users do you want?** enter the desired number of licenses, and then select **Check out now** to complete the transaction.

8. Verify that the acquired subscription is now listed on the **Subscriptions** page.

9. To add more licenses after the initial purchase, select **Power BI Pro** from the **Subscriptions** page, and then select **Change license quantity**.

### Assign licenses in the Microsoft 365 admin center

For information about assigning licenses in the Microsoft 365 admin center, see [Assign licenses to users](/office365/admin/manage/assign-licenses-to-users).

For guest users, see [Assign licenses to users on the Licenses page](/office365/admin/manage/assign-licenses-to-users#assign-licenses-to-users-on-the-licenses-page). Before assigning Pro licenses to guest users, contact your Microsoft account representative to ensure you're in compliance with the terms of your agreement with Microsoft.

### Assign licenses in the Azure portal

Follow these steps to assign Power BI Pro licenses to individual user accounts:

1. Open the [Azure portal](https://portal.azure.com/).

2. Search for and select **Azure Active Directory**.

3. Under **Azure Active Directory**, select **Licenses**.

4. Under **Licenses**, select **All products** then select **Power BI Pro** to display the list of licensed users.

5. Select **Assign** to add a Power BI Pro license to a user account.

## Next steps

Now that you've assigned licenses, learn more about Power BI Pro.

[Power BI licensing in your organization](service-admin-licensing-organization.md)

[Find Power BI users who have signed in](service-admin-access-usage.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
