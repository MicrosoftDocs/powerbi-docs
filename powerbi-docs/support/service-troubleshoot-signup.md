---
title: "Troubleshoot getting a license for the Power BI service"
description: "This article troubleshoots issues you might encounter when you try to get a license for the Power BI service or upgrade licenses."
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.topic: troubleshooting
ms.date: 06/26/2024

#As a new user of the Power BI service, I need help signing in for the first time or upgrading my license.

---

# Troubleshoot signing up for or purchasing a Power BI individual license

This article describes scenarios that you might encounter when you try to sign up for the Power BI service. These scenarios include signing up for the first time, signing up for a free license, and upgrading to a paid license.

In most cases, you can sign up for the Power BI service and for Microsoft Fabric by following the described processes. Some of the issues that might prevent you from signing up are described here, with possible workarounds.

> [!NOTE]
> The Power BI service is available as a standalone service and as one of the services that's integrated with [Fabric](/fabric/get-started/microsoft-fabric-overview). Administration and licensing of the Power BI service is now integrated with Fabric.

## Potential quick workarounds

- To learn how to sign up for a Power BI license and to purchase a license, see [Sign up or purchase the Power BI service as an individual](../fundamentals/service-self-service-signup-purchase-for-power-bi.md).
- If the problem that you're encountering is related to passwords, see [Troubleshoot signing in](power-bi-cannot-sign-in.md).

## Troubleshooting checklist

This section lists troubleshooting tips for common problems.

### Your email address doesn't work with the Power BI service

Before you start the self-service process, it's important to learn which types of email addresses you can use to sign up for or purchase Power BI.

Power BI requires that you use a work or school email address. You can't sign up or purchase by using email addresses provided by consumer email services or telecommunication providers. These services include `outlook.com`, `hotmail.com`, `gmail.com`, and others. If you don't have a work or school account, [learn about alternate ways to sign up](../enterprise/service-admin-signing-up-for-power-bi-with-a-new-office-365-trial.md).

When you attempt to sign up by using a personal email address, you receive prompts similar to one of these messages:

"You entered a personal email address: Enter your work email address so we can securely store your company's data."

"That looks like a personal email address. Enter your work address so we can connect you with others in your company. And don't worry. We don't share your address with anyone."

## Cause: Personal email addresses aren't supported

The Power BI service doesn't support email addresses provided by consumer email services or telecommunications providers.

### Solution: For email issues

1. To finish signing up, try again by using an email address assigned by your work or school.

1. If sign-up still doesn't work, try a more advanced setup process. This process creates a new `onmicrosoft.com` email address that can be used with the Power BI service. Register for a new [Microsoft 365 trial subscription](../enterprise/service-admin-signing-up-for-power-bi-with-a-new-office-365-trial.md) and use that email address to sign up.

## Cause: Your email address isn't a Microsoft 365 ID

You attempt to sign up or purchase and receive a message like this:

"We can't find you at contoso.com. Do you use a different ID at work or school? Try signing in with that ID. If it doesn't work, contact your IT department."

When you sign in to Microsoft 365 and other services, your organization uses IDs that are different than your email address. For example, your email address might be `zalan.bola@contoso.com` but your ID is `zalanb@contoso.com`.

### Solution: Use your Microsoft 365 ID

To finish signing up or purchasing, use the ID that your organization assigned to you for signing in to Microsoft 365 or other Microsoft services. If you don't know what this ID is, contact your global admin.

### You're unable to sign up for a free license or upgrade to a paid license

When you try to sign up for a free or paid license, you receive an error message. The error message might state that your organization disabled self-service. Or the error message might state that your organization manages sign-up.

## Cause: Your admin disabled self-service

Your organization might not want employees to use self-service sign-up or to be able to upgrade to paid versions of the Power BI licenses. The paid versions are Pro and Premium Per User (PPU).

### Solution: If self-service isn't available

- If you're unable to use self-service to get your own Power BI license, check to see if your Microsoft 365 global admin disabled the self-service options. Also check with the Fabric admin to see if they changed the upgrade and trial options available to you. For help when you can't use self-service, go to [Self-service sign-up and purchase help](../fundamentals/service-self-service-sign-up-help.md).
- If you're part of an organization and used self-service to purchase Power BI, the global or billing admin for your organization can [take over ownership](/azure/active-directory/enterprise-users/domains-admin-takeover) of your subscription, and then assign or unassign licenses. Check with your global and billing admins.
- If you're following along with the article [Sign up or purchase the Power BI service as an individual](../fundamentals/service-self-service-signup-purchase-for-power-bi.md), the screens might look different. It might be that your organization has its own process for self-service sign-ups and purchases. Follow that process instead to request a license.
- Self-service purchase of Pro and PPU licenses isn't available to educational organizations or organizations deployed to Azure Government or Azure China 21Vianet clouds.
- You can sign up for or purchase Power BI with .gov or .mil addresses, but this approach requires a different process. For more information, see [Enroll your US Government organization in the Power BI service](../enterprise/service-govus-signup.md).
- Pay for the new license yourself. After you sign in, you select how many licenses you want to buy and provide credit card payment. When the purchase is complete, you can start using your paid licenses. You also have access to a limited view of the Microsoft 365 admin center where you can assign licenses for the product to other people in your organization.

> [!TIP]
> If you're a global admin or billing admin, learn how to enable self-service for users in your organization. For more information, see [Enable or disable self-service](../enterprise/service-admin-disable-self-service.md).

### You don't see your account manager

You're following along with a Power BI article and the screens look different. You can't find your account manager. Or you can't find the features that you need to model your data.

## Cause: You want to open Power BI Desktop or one of the mobile apps

Power BI Desktop is a free Windows application that you download. Power BI is also available as a mobile app.

### Solution: Download Power BI Desktop or the mobile apps

- [Power BI Desktop (free download)](https://powerbi.microsoft.com/desktop)
- [Power BI mobile apps (free download)](../consumer/mobile/mobile-apps-for-mobile-devices.md)

### You're attempting to get a free license but can only get Pro

You follow along with the Power BI or Fabric articles for getting a free license. But, when you check your account manager, it lists your license type as **Pro**.

## Cause: Your organization purchased a subscription that includes Pro licenses

If your organization provided you with access to a subscription for Microsoft Office 365 E5, you have a Pro license.

### Solution: Use Pro instead of Fabric (Free)

The Power BI Pro license gives you access to a wider range of Power BI features. Anything that you can do with a Fabric (Free) license, you can do with a Power BI Pro license.

### You can't access your Fabric items

You opened Fabric. You see the landing page but can't access any of the Fabric items.

## Cause: You don't have a Fabric capacity

A Fabric (Free) license isn't the only thing that you need to access Fabric items. If you're using a Power BI Premium capacity, Fabric items aren't supported. You need a Fabric capacity.

### Solution: Purchase or use a trial Fabric capacity

- To enable support for Fabric items on your Power BI capacity, [enable Fabric](/fabric/admin/fabric-switch).
- If you don't have a Fabric capacity, sign up for a [trial of a Fabric capacity](/fabric/get-started/fabric-trial).
- If you're using Microsoft 365, certain versions include a free Fabric license and a free or paid Power BI license. For example, the Office 365 E5 SKU includes a Fabric free license (but no capacity) and a Power BI Pro license. Without a trial or a purchased capacity, you might not be able to access your Fabric items.

### You don't receive in-product prompts

You don't see prompts to upgrade (**Buy now**) or start a trial (**Try now**), and the UI doesn't display **Buy now** or **Try now** buttons.

## Cause: Your admins disabled this option

The type of upgrade and trial options available to you depends on how your global and billing admins set up your domain. Your admins have the ability to disable all trials, disable self-service purchase, and more.

### Solution: Contact your admins

Contact your global and billing admins and ask them to enable self-service.

## Related content

- [Power BI quickstart for getting an individual license](../fundamentals/service-self-service-signup-for-power-bi.md)
- [Self-service purchase FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq)
- [Power BI features by license type](../consumer/end-user-features.md)