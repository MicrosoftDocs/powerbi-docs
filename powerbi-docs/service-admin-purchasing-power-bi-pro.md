---
title: "Purchase and assign Power BI Pro licenses"
description: Learn how to purchase and assign Power BI Pro user licenses so that your users can access content and collaborate with colleagues in the Power BI service.
author: mgblythe
manager: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: quickstart
ms.date: 10/29/2019
ms.author: mblythe

LocalizationGroup: Administration
---

# Purchase and assign Power BI Pro user licenses

Power BI Pro is an individual user license that allows users to read and interact with reports and dashboards other users have published in the Power BI service, and to share content and collaborate with other Power BI Pro users. Only users with a Power BI Pro user license can publish or share content with other users or consume content created by other users, unless that content is hosted in a Power BI Premium capacity. For more information, see [Power BI features by license type](service-features-license-type.md).

## Purchase and assign Power BI Pro user licenses

This article explains how to purchase Power BI Pro user licenses in the Microsoft 365 admin center and then explains two options admins have for assigning those licenses to individual users: in the Microsoft 365 admin center and the Azure portal (choose one option).

### Prerequisites

To purchase and assign licenses in the Microsoft 365 admin center, you must be a member of the **[Global administrator or Billing administrator](https://support.office.com/article/about-office-365-admin-roles-da585eea-f576-4f55-a1e0-87090b6aaa9d)** role in Microsoft 365.

To assign licenses in the Azure portal, you must be an owner of the Azure subscription that Power BI uses for Azure Active Directory lookups.

### Purchase licenses in Microsoft 365

Follow these steps to purchase Power BI Pro licenses in the Microsoft 365 admin center:

1. Open the [Microsoft 365 admin center](https://portal.office.com/adminportal/home#/homepage).

2. On the nav pane, select **Billing** > **Subscriptions**.

    ![Nav pane](media/service-admin-purchasing-power-bi-pro/service-purchasing-power-bi-pro-01.png)

3. In the upper right corner of the **Subscriptions** page, select **Add subscriptions**.

    ![Subscription](media/service-admin-purchasing-power-bi-pro/service-purchasing-power-bi-pro-02.png)

4. Locate the desired subscription offering:

    Under **Enterprise Suite**, select **Office 365 Enterprise E5**.

    ![Office E5 subscription](media/service-admin-purchasing-power-bi-pro/service-purchasing-power-bi-pro-03.png)

    Under **Other Plans**, select **Power BI Pro**.

    ![Power BI subscription](media/service-admin-purchasing-power-bi-pro/service-purchasing-power-bi-pro-04.png)

5. Hover over the ellipsis (**. . .**) for the desired subscription, and select **Buy now**.

    ![Buy Now](media/service-admin-purchasing-power-bi-pro/service-purchasing-power-bi-pro-05.png)

6. Choose **Pay monthly** or **Pay for a full year**, according to your billing preference.

7. Under **How many users do you want?** enter the desired number of licenses, and then select **Check out now** to complete the transaction.

8. Verify that the acquired subscription is now listed on the **Subscriptions** page.

   ![Acquired subscription](media/service-admin-purchasing-power-bi-pro/service-purchasing-power-bi-pro-06.png)

9. To add more licenses after the initial purchase, select **Power BI Pro** from the **Subscriptions** page, and then select **Add/Remove licenses**.

### Assign licenses in the Microsoft 365 admin center

Follow these steps to assign Power BI Pro licenses to individual user accounts:

1. Open the [Microsoft 365 admin center](https://portal.office.com/adminportal/home#/homepage).

2. On the nav pane, expand **Users**, and then select **Active users**.

    ![Active users](media/service-admin-purchasing-power-bi-pro/service-assigning-power-bi-pro-licenses-05.png)

3. Select a user, then under **Product licenses** select **Edit**.

    ![Edit product licenses](media/service-admin-purchasing-power-bi-pro/service-assigning-power-bi-pro-licenses-06.png)

4. Under **Power BI Pro**, toggle the setting to **On**, then select **Save**.

    ![Product licenses on](media/service-admin-purchasing-power-bi-pro/service-assigning-power-bi-pro-licenses-07.png)

5. Under **Status** for the selected account, verify that the Power BI Pro license has been assigned successfully.

    ![Verify license status](media/service-admin-purchasing-power-bi-pro/service-assigning-power-bi-pro-licenses-08.png)

### Assign licenses in the Azure portal

Follow these steps to assign Power BI Pro licenses to individual user accounts:

1. Open the [Azure portal](https://ms.portal.azure.com/#@microsoft.onmicrosoft.com/dashboard/private/39bc3cf7-31a4-43f6-954c-f2d69ca2f0).

2. In the nav pane, select **Azure Active Directory**.

    ![Azure Active Directory](media/service-admin-purchasing-power-bi-pro/service-assigning-power-bi-pro-licenses-01.png)

3. Under **Azure Active Directory**, select **Licenses**.

    ![Licenses](media/service-admin-purchasing-power-bi-pro/service-assigning-power-bi-pro-licenses-02.png)

4. Under **Licenses**, select **All products** then select **Power BI Pro** to display the list of licensed users.

    ![Licenses - all products](media/service-admin-purchasing-power-bi-pro/service-assigning-power-bi-pro-licenses-03.png)

5. Select **Assign** to add a Power BI Pro license to a user account.

    ![Assign license](media/service-admin-purchasing-power-bi-pro/service-assigning-power-bi-pro-licenses-04.png)

## Next steps

Now that you've assigned licenses, learn more about Power BI Pro.

[Power BI licensing in your organization](service-admin-licensing-organization.md)

[Find Power BI users who have signed in](service-admin-access-usage.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
