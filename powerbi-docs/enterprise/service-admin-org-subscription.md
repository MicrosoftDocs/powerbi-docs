---
title: Get a Power BI service subscription for your organization
description: How to sign up for a Power BI service subscription as an admin and purchase licenses in bulk.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 10/18/2022
ms.custom: licensing support
LocalizationGroup: Administration
---

# Get a Power BI service subscription for your organization

Administrators can sign up for the Power BI service from the **Purchase services** page of the Microsoft 365 admin center. As an administrator, after signing up for Power BI you can assign licenses to users in your organization.

Users in your organization can sign up for Power BI on the Power BI website. When a user signs up for Power BI, they automatically receive a Power BI license. Administrators can turn off these self-service capabilities by following [Enable or disable self-service sign-up and purchasing](/fabric/admin/service-admin-disable-self-service).

## Sign up through Microsoft 365

Global and billing administrators can get a Power BI subscription for their organization. For more information, see [Who can purchase and assign licenses?](service-admin-licensing-organization.md#who-can-purchase-and-assign-licenses)

> [!NOTE]
>
> A Microsoft 365 E5 subscription includes Power BI Pro licenses. To learn how to manage licenses, see [View and manage user licenses](service-admin-manage-licenses.md).

To purchase Power BI Pro licenses on the Microsoft 365 admin center:

1. From your administrator account, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).

1. On the navigation menu, select **Billing** > **Purchase services**.
  
   :::image type="content" source="media/service-admin-org-subscription/m365-purchase-services-2021.png" alt-text="Screenshot showing the Microsoft 365 billing menu with Purchase services selected.":::

1. Search for **Power BI** or select **Power BI** from the **View by category** section.

1. Select multiple offers to compare or select **Details** to purchase an offer.

1. Under **Select license quantity**, select the number of licenses you want to buy, and then select a billing frequency. Select **Buy**.  If you haven't previously used it, you can start a **Fabric (free)** trial subscription. The free trial subscription includes 25 user licenses and expires after one month. You can only get one free trial.

   :::image type="content" source="media/service-admin-org-subscription/power-bi-pro-purchase.png" alt-text="Screenshot showing example purchase options for Power B I Pro.":::

1. Complete the information on the checkout page, and then select **Place order**.

1. To verify your purchase, go to **Billing** > **Your products** and scroll to  **Power BI Pro**.

For more information about how your organization can get and use the Power BI service, see [Power BI in your organization](/microsoft-365/admin/misc/power-bi-in-your-organization).

## More ways to get Power BI for your organization

If you're not a Microsoft 365 subscriber, you can [Sign up for a new Microsoft 365 trial](service-admin-signing-up-for-power-bi-with-a-new-office-365-trial.md), and then add Power BI.

To sign up for a Power BI subscription, you need a work or school email address. Email addresses provided by consumer email services or telecommunications providers aren't supported. If you don't have a work or school email address, you can create one during sign-up.

To sign up for Power BI Pro:

1. Go to [Power BI Pro signup](https://signup.microsoft.com/create-account/signup?OfferId=d59682f3-3e3b-4686-9c00-7c7c1c736085&ali=1&products=d59682f3-3e3b-4686-9c00-7c7c1c736085) and enter an email address. Select **Next**.

     :::image type="content" source="../media/service-admin-get-started-email.png" alt-text="Screenshot showing the get started window.":::

1. The email address you entered is evaluated. Select **Set up account** or **Change my email** to enter a different address.

   > [!NOTE]
   >If your email address is already in use with another Microsoft service, you can **Sign in** or **Create a new account instead**. If you choose to create a new account, continue to the next step.

1. Complete the **Tell us about yourself** form and select **Next**. The country/region selected determines where your data is stored. For more information, see [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md#find-the-default-region-for-your-organization). The country/region doesn't have to match your physical location, but should match the location for most of your users.

   :::image type="content" source="../media/service-admin-tell-us-dialog.png" alt-text="Screenshot showing the tell us about yourself window.":::

1. Select whether you want to receive a verification code by text or call. Enter a phone number where the verification code will be sent. Select **Send verification code**.

1. Enter the verification code, and then select **Verify**.

1. Complete the **How you'll sign in** form. This step creates your user ID and password to sign in to your account. You can change the pre-filled username and domain. Domain name is validated to ensure that it isn't a duplicate. Once validated, the domain name is used to create your organization in the datacenter as a subdomain of `onmicrosoft.com`. Create and confirm a password. Select **Next**.

   :::image type="content" source="../media/business-identity-dialog.png" alt-text="Screenshot showing the window for creating the onmicrosoft.com subdomain.":::

Review the confirmation details. The account you created is now the global admin of a new Power BI Pro trial tenant. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com) to add more users, set up a custom domain, purchase more services, and manage your Power BI subscription.

## Related content

- [View and manage user licenses](service-admin-manage-licenses.md)
- [Enable or disable self-service sign-up and purchasing](/fabric/admin/service-admin-disable-self-service)
- [Business subscriptions and billing documentation](/microsoft-365/commerce/)
