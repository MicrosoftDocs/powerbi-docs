---
title: Sign up for Fabric and Power BI licensing for users in your organization. 
description: Overview of how admins sign up, purchase, and manage Power BI and Fabric licenses.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 07/25/2024
ms.custom: licensing support
LocalizationGroup: Administration
---

# Organizational licenses and subscriptions for Fabric and Power BI 

There are two ways for users to get a license, from an administrator or by using self-service. This article is for the administrators, who purchase and manage services and licenses.

Global and Billing administrators can sign up for the Power BI service and Fabric. After signing up and purchasing a subscription or a free trial, Billing, License, User, and Global administrators assign licenses to users in their organization.

If you give them permissions, users in your organization can get one of the organization's licenses simply by signing in to Power BI (app.powerbi.com) or Fabric (app.fabric.microsoft.com). When a user signs in, they automatically receive a license. Administrators can set these permissions by following [Enable and disable self-service](../enterprise/service-admin-disable-self-service.md).

> [!NOTE]
> If you're an individual, you can sign up for your own free, Pro, Premium Per User, trial licenses or trial of a Fabric capacity. This process is called *self-service.* To learn more, see [the self-service process](../fundamentals/service-self-service-signup-purchase-for-power-bi.md). 

## Fabric and the Power BI service

Power BI is available as a standalone SaaS service and as one of the services that's integrated with [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview). Administration and licensing of the Power BI service is now integrated with Microsoft Fabric.

## Licenses and subscriptions
Fabric and the Power BI service are both SaaS platforms and require licenses and at least one capacity subscription. There are some differences in how these licenses and capacities are acquired.

### Power BI licenses

Use of the Power BI service requires a license and a capacity. 

- [Per user license](../fundamentals/service-features-license-type.md#power-bi-service-licenses) - Per user licenses allow users to work in the Power BI service. The options are Fabric (Free), Pro, and Premium Per User (PPU).

- [Capacity subscription](../fundamentals/service-features-license-type.md#premium-capacity) - There are two types of Power BI subscriptions for organizations: standard and Premium. Premium provides enhancements to Power BI, and a comprehensive portfolio of [Premium features](service-premium-features.md). Power BI Premium is a tenant-level Microsoft 365 subscription, available in a choice of SKUs (Stock Keeping Units).

Each Microsoft 365 E5 subscription includes standard capacity and a Pro license. 

### Fabric licenses

To access the Fabric SaaS platform, you need a license and a capacity.  

- [Per user license](/fabric/enterprise/licenses#per-user-licenses): Per user licenses allow users to work in Fabric. The options are Fabric (Free), Pro, and Premium Per User (PPU). The two Power BI licenses apply to using the Power BI workload in Fabric.
- [Capacity license](/fabric/enterprise/licenses#capacity-license) - An organizational license that provides a pool of resources for Fabric operations. Capacity licenses are divided into stock keeping units (SKUs). Each SKU provides a different number of capacity units (CUs) which are used to calculate the capacity's compute power. Fabric capacities are available for purchase and for trial.

## Which admins can purchase licenses and subscriptions

### Admin roles for purchasing licenses and subscriptions

You must belong to the Global or Billing admin role to purchase or assign licenses for your organization. Admin roles are assigned from the Microsoft Entra admin center or the Microsoft 365 admin center. For more information about admin roles in Microsoft Entra ID, see [View and assign administrator roles in Microsoft Entra ID](/azure/active-directory/users-groups-roles/directory-manage-roles-portal). To learn more about admin roles in Microsoft 365, including best practices, see [About admin roles](/microsoft-365/admin/add-users/about-admin-roles).

### Admin roles for managing licenses and subscriptions

After the licenses and subscriptions are purchased, Global, Billing, License, or User admins manage licenses for an organization. For details about these four admin roles, see [Admin roles.](/fabric/admin/microsoft-fabric-admin#microsoft-365-admin-roles)

## Get Fabric or Power BI for your organization

Fabric and the Power BI service are available for organizations to purchase and to try for free. For detailed instructions, select the option you prefer. 

> [!TIP]
> If you're ready to make a purchase, use these links to find up-to-date pricing information.
> 
> - [Power BI Pricing & product comparison](https://powerbi.microsoft.com/pricing/)
>
> - [Pricing options for Fabric](/azure.microsoft.com/pricing/details/microsoft-fabric.md)

1. [Purchase a Fabric subscription.](/fabric/enterprise/buy-subscription) If you're ready to purchase, your options include bulk purchasing for your organization or enabling your users to upgrade their own licenses.

    After you purchase a Fabric subscription, [enable Fabric for your organization](/fabric/admin/fabric-switch). This includes setting up tenants and capacities.

1. Purchase a Power BI subscription and licenses. Power BI Pro is included in Microsoft 365 E5. Otherwise, you can purchase Pro or PPU licenses from the [Microsoft pricing site](https://powerbi.microsoft.com/en-us/pricing/), through Microsoft 365, or through a Microsoft partner. After your purchase, you can assign licenses to individual users or use self-service. For more information, see [enabling your users to upgrade their own licenses](#enable-and-disable-self-service-sign-up-and-purchase).

1. Go directly to the [sign-up wizard for Power BI Pro](https://go.microsoft.com/fwlink/?LinkId=2106428&clcid=0x409&cmpid=pbidocs-purchasing-power-bi-pro). 

1. [Start a free 60-day Fabric trial for your organization.](/fabric/get-started/fabric-trial) The trial includes a trial capacity, 1 TB of storage, and access to all of the Fabric experiences and features.
1. Get free licenses for all of your users. The Fabric (Free) license doesn't include a Fabric capacity. The Fabric (Free) license includes access to the paid features of the Power BI service. Sign up on app.fabric.microsoft.com.
1. [Start a free 30-day trial of Power BI Pro.](service-admin-signing-up-for-power-bi-with-a-new-office-365-trial.md) The trial includes up to 25 licenses. After the 30 days expire, you're charged for the licenses.

## View existing licenses

To see which users in your organization already have a license, see [View and manage user licenses](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins#view-self-service-subscriptions).

## Enable and disable self-service sign-up and purchase 

You purchased licenses or signed up for an organizational trial. Now, decide whether your users can assign themselves a license or give themselves an automatic license upgrade. Here are links to help you decide which settings to use. 

**Self-service**

- [When to use self-service sign-up and purchase](service-admin-disable-self-service.md)
- [Manage self-service purchases and trials](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins)
- [Manage self-service license requests in the Microsoft 365 admin center](/microsoft-365/commerce/licenses/manage-license-requests)
- [Manage self-service sign-up subscriptions in the Microsoft 365 admin center](/microsoft-365/commerce/subscriptions/manage-self-service-signup-subscriptions)
- [How to combine self-service settings](/fabric/admin/service-admin-portal-help-support#users-can-try-microsoft-fabric-paid-features)

## Guest user licenses

You might want to distribute content to users who are outside of your organization. You can share content with external users by inviting them to view content as a guest. Microsoft Entra Business-to-business (Microsoft Entra B2B) enables sharing with external guest users. Prerequisites:

- The ability to share content with external users must be enabled.

- The guest user must have the proper licensing in place to view the shared content.

For more information about guest user access, see [Distribute Power BI content to external guest users with Microsoft Entra B2B](service-admin-azure-ad-b2b.md).

## Other articles for admins

There are many other admin tasks related to licenses and subscriptions. Some of them are listed and linked here. 

- Assign and manage licenses with [Microsoft 365](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users) and with the [Azure portal](service-admin-purchasing-power-bi-pro.md).
- [Remove or reassign a license, enable, disable a license](/microsoft-365/admin/manage/assign-licenses-to-users)
- [Cancel a trial](/fabric/get-started/fabric-trial)
- [Takeover a license or tenant](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins)
- [Handle expiring trials](/microsoft-365/commerce/subscriptions/cancel-your-subscription).
- Handle expiring licenses for Power BI

### Power BI license expiration

There's a grace period after a Power BI license expires. For licenses that are part of a volume license purchase, the grace period is 90 days. If you bought the license directly, the grace period is 30 days. For license trials, there is no grace period.

Power BI has the same license lifecycle as Microsoft 365. For more information, see [What happens to my data and access when my Microsoft 365 for business subscription ends](/microsoft-365/commerce/subscriptions/what-if-my-subscription-expires).

## Manage subscriptions included with Microsoft 365 E5 SKUs

A Microsoft 365 E5 subscription includes Power BI Pro licenses. To learn how to manage licenses, see [Administration overview](/fabric/admin/admin-overview).

## Related content

- [Purchase and assign Power BI Pro licenses](service-admin-purchasing-power-bi-pro.md)
- [About self-service sign-up](/microsoft-365/admin/misc/self-service-sign-up)
- [Business subscriptions and billing documentation](/microsoft-365/commerce/)
- [Find Power BI users that are signed in](../admin/service-admin-access-usage.md)
- [Self service FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq)
