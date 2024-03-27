---
title: Power BI licensing for users in your organization 
description: Overview of the different user license types available in Power BI and how admins purchase and manage licensing for users in their organization.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 03/20/2024
ms.custom: licensing support
LocalizationGroup: Administration
---

# How to sign up for Power BI and Fabric 

There are two ways for users to get a license, from an administrator or self-service. For users to get their own free, Pro, or Premium Per User license they simply use a work or school email account and [the self-service sign-up process](../fundamentals/service-self-service-signup-for-power-bi.md). Global and Billing administrators can sign up for the Power BI service and Fabric from the Microsoft 365 Admin center. After signing up and purchasing a subscription or a free trial, administrators assign licenses to users.

This article is for the second scenario, where administrators purchase and manage services and licenses.

## Fabric and the Power BI service

The Power BI service is one of the experiences available in Microsoft Fabric. Everyone who uses Fabric must have a user license. Microsoft Fabric has three license options: Fabric free, Power BI Pro, and Power BI Premium Per User (PPU). The actions a user can take in Fabric depend on the license type. The exception to the license capabilities in something called Premium capacity. If workspace content is saved in Premium capacity, the workspace owner can assign roles to free users that allow those users to do more. If you are not familiar with Premium capacity and the license types, see [workspaces, licenses, and Premium capacity.](../consumer/end-user-license.md)

## Licensing the Power BI service for users in your organization

### How do admins purchase and assign licenses

You must belong to an admin role to purchase or assign licenses for your organization. Admin roles are assigned from the Microsoft Entra admin center or the Microsoft 365 admin center. For more information about admin roles in Microsoft Entra ID, see [View and assign administrator roles in Microsoft Entra ID](/azure/active-directory/users-groups-roles/directory-manage-roles-portal). To learn more about admin roles in Microsoft 365, including best practices, see [About admin roles](/microsoft-365/admin/add-users/about-admin-roles).

The following roles are required to manage licensing for an organization.

- To purchase services and licenses:
  - Billing administrator
  - Global administrator
- To manage user licenses:
  - License administrator
  - User administrator
  - Global administrator

For information about Power BI service admin roles, see [Understanding Power BI administration roles](../admin/service-admin-role.md).

## Get Microsoft Fabric for your organization

For information about pricing, see [Pricing & Product Comparison](https://powerbi.microsoft.com/pricing/).

If you're not ready to purchase, you have several options.

1. Start with an organizational trial. Select the Power BI Premium Per User trial. You get 25 licenses to use for one month. For step-by-step instructions on how to sign up, see [Get a Power BI subscription for your organization](service-admin-purchasing-power-bi-pro.md).

    :::image type="content" source="media/service-admin-licensing-organization/power-bi-ppu-trial.png" alt-text="Screenshot of the PPU trial showing 25 licenses and zero dollars.":::

1. Start by enabling self-service signup for a Fabric free license and a [Fabric free trial capacity](/fabric/get-started/fabric-trial). 

    Ensure that self-service signup is enabled for the tenant. Now your users can [sign themselves up for a Fabric free license](https://app.fabric.microsoft.com) and a Fabric trial capacity. With the Fabric free license, users can explore Power BI for personal data analysis and visualization using My Workspace, but they can't share Power BI content with others. A Power BI Pro or Power BI Premium Per User (PPU) license is required before users can share content in Power BI. For descriptions of the license types, see [license types for the Power BI service](../fundamentals/service-features-license-type.md).

If you're ready to purchase, your options include bulk purchasing for your organization or enabling your users to upgrade their own licenses. 

1. To allow your users to purchase paid licenses for Power BI, enable self-service purchase. With self-service purchase turned on, your users can upgrade their license type, or sign up for a different license directly. This works if the organization is using the commercial cloud. Direct purchase, or upgrading to Pro isn't available to educational organizations or organizations deployed to Azure Government or Azure China 21Vianet clouds.


### Assign a **Fabric free** license to all existing users

A Fabric free license includes access to the Power BI service.

1. From your global admin or billing admin account, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. On the navigation menu, select **Billing** and then select **Purchase services**.
1. Search or scroll to locate the Fabric (free) offer. Select **Details**.
1. Select the number of licenses you want, and then select **Buy**.

    :::image type="content" source="media/service-admin-licensing-organization/m365-assign-2021.png" alt-text="Screenshot showing the Fabric free subscription dialog.":::

1. Complete the information on the **Checkout** page, and then select **Place order**.
1. Select **Licenses** from the left sidebar, and then select **Fabric (free)** from the subscriptions.
1. Select **Assign licenses** and assign the licenses to users.

To see which users in your organization already have a license, see [View and manage user licenses](service-admin-manage-licenses.md).

### Enable and disable self-service signup for Power BI and Fabric

Users in your organization can sign up for Power BI on the Power BI website. When a user signs up for Power BI, they automatically receive a Power BI license. Administrators can turn off these self-service capabilities by following [Enable or disable self-service sign-up and purchasing](service-admin-disable-self-service.md).x

As an admin, you configure self-service signup and purchase in the tenant settings. [Tenant settings](/fabric/admin/service-admin-portal-help-support)

## License types and capabilities

There are three kinds of Power BI per-user licenses: Fabric free, Pro, and Premium Per User (PPU). The type of license a user needs is determined by where content is stored, how they'll interact with that content, and if that content uses Premium features. Where an organization stores content is determined by [subscription license type](#subscription-license-types).

One type of organizational subscription, [Power BI Premium](service-admin-premium-purchase.md), is a capacity-based license. Premium capacity allows users with Pro and PPU licenses to share content and collaborate with others who have free, Pro, and PPU licenses.

For detailed information about licensing, see [Licenses for the Power BI](../fundamentals/service-features-license-type.md).

Content created by a user who is assigned a PPU license can only be shared with other users who have a PPU license. Content that is saved in a workspace hosted with Premium capacity can be shared with users who don't have a PPU license. For a detailed breakdown of feature availability per license type, see [Features by license type](../fundamentals/service-features-license-type.md).

## Subscription license types

All user-based, commercial licenses from Microsoft are based on Microsoft Entra identities. To use the Power BI service, sign in with an identity that Microsoft Entra ID supports for commercial licenses. You can add Power BI to any Microsoft license that uses Microsoft Entra ID for identity services. Some licenses, such as Office 365 E5, include a Power BI Pro license.

There are two kinds of Power BI subscription licenses for organizations: standard and premium.

- Standard - With a standard, self-service Power BI subscription, administrators can assign per user licenses. There's a per user monthly fee for Power BI Pro licenses. This license type enables collaboration, publishing, sharing, and ad-hoc analysis. Content is saved to shared storage capacity that is fully managed by Microsoft.
- Premium - A Power BI Premium subscription license allocates a capacity to an organization. This subscription type is suitable for enterprise BI, big data analytics, cloud and on-premises reporting. Premium provides advanced administration and deployment controls. Reserved compute and storage resources are managed by capacity admins in your organization. There's a monthly cost for this reserved environment. In addition to other Premium advantages, content stored in Premium capacity can be accessed by and distributed to users who don't have Power BI Pro licenses. At least one user must have a Power BI Pro license assigned to use Premium, and content creators and developers need a Power BI Pro license.

The two types of subscriptions aren't mutually exclusive. You can have both Power BI Premium and standard. In this configuration, content stored in Premium capacity can be shared with all users and shared capacity is available. For information about capacity limits, see [Manage data storage in Power BI workspaces](../admin/service-admin-manage-your-data-storage-in-power-bi.md).

To compare product features and pricing, see [Power BI pricing](https://powerbi.microsoft.com/pricing).

## Guest user access

You might want to distribute content to users who are outside of your organization. You can share content with external users by inviting them to view content as a guest. Microsoft Entra Business-to-business (Microsoft Entra B2B) enables sharing with external guest users. Prerequisites:

- The ability to share content with external users must be enabled

- The guest user must have the proper licensing in place to view the shared content

For more information about guest user access, see [Distribute Power BI content to external guest users with Microsoft Entra B2B](service-admin-azure-ad-b2b.md).

## Purchase Power BI Pro licenses

As an administrator, you can purchase Power BI Pro licenses through Microsoft 365 or through a Microsoft partner. After your purchase, you can assign them to individual users. For more information, see [Purchase and assign Power BI Pro licenses](service-admin-purchasing-power-bi-pro.md).

### Power BI license expiration

There's a grace period after a Power BI license expires. For licenses that are part of a volume license purchase, the grace period is 90 days. If you bought the license directly, the grace period is 30 days.

Power BI has the same license lifecycle as Microsoft 365. For more information, see [What happens to my data and access when my Microsoft 365 for business subscription ends](/microsoft-365/commerce/subscriptions/what-if-my-subscription-expires).

## Manage subscriptions included with Microsoft 365 E5 SKUs

A Microsoft 365 E5 subscription includes Power BI Pro licenses. To learn how to manage licenses, see [View and manage user licenses](service-admin-manage-licenses.md).

## Related content

- [Purchase and assign Power BI Pro licenses](service-admin-purchasing-power-bi-pro.md)
- [Business subscriptions and billing documentation](/microsoft-365/commerce/)
- [Find Power BI users that have signed in](../admin/service-admin-access-usage.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
