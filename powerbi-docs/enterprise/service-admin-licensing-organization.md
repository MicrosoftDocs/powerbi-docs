---
title: Power BI licensing for users in your organization 
description: Overview of the different user license types available in Power BI and how admins purchase and manage licensing for users in their organization.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 10/27/2022
ms.custom: licensing support
LocalizationGroup: Administration
---

# Licensing the Power BI service for users in your organization

All users of the Power BI service must have a license. What a user can do depends on the type of *per-user license* that they have, whether free, Pro, or Premium Per User (PPU). The level of access provided their license depends on whether the workspace is a *Premium* workspace or not.

To get a license, users can get a free, Pro, or PPU license from the  self-service sign-up with their work or school account. Or, an administrator can get a Power BI license subscription and then assign licenses to users.

This article focuses on administrators who can purchase services and per-user licensing. For more information about how users can get their own license, see [Signing up for Power BI as an individual](../fundamentals/service-self-service-signup-for-power-bi.md).

## Who can purchase and assign licenses

You must belong to an admin role to purchase or assign licenses for your organization. Admin roles are assigned using the Azure Active Directory admin center or the Microsoft 365 admin center. For more information about administrator roles in Azure Active Directory, see [View and assign administrator roles in Azure Active Directory](/azure/active-directory/users-groups-roles/directory-manage-roles-portal). To learn more about admin roles in Microsoft 365, including best practices, see [About admin roles](/microsoft-365/admin/add-users/about-admin-roles).

The following roles are required.

- To purchase services and licenses:
  - Billing administrator
  - Global administrator
- To manage user licenses:
  - License administrator
  - User administrator
  - Global administrator

These roles manage licensing for the organization. For information about Power BI service administrator roles, see [Understanding Power BI service administrator roles](../admin/service-admin-role.md).

## Get Power BI for your organization

For information about pricing, see [Pricing & Product Comparison](https://powerbi.microsoft.com/pricing/).

If you're not ready to purchase, select the Power BI Pro trial. You'll get 25 licenses to use for one month. For step-by-step instructions on how to sign up, see [Get a Power BI subscription for your organization](service-admin-org-subscription.md).

## About self-service sign-up

Individual users can get their own Power BI license by signing up with their work or school account. With a free license, users can explore Power BI for personal data analysis and visualization using My Workspace, but they can't share with other users. A Power BI Pro or Power BI Premium Per User license is required to share content. For descriptions of the license types, see [license types for the Power BI service](../fundamentals/service-features-license-type.md). 

Users can upgrade their license type, or sign up for a different license directly, if the organization is using the commercial cloud. Direct purchase of or upgrade to Pro isn't available to educational organizations or organizations deployed to Azure Government or Azure China 21Vianet clouds.

If you don't want users in your organization to use self-service sign-up, see [Enable or disable self-service sign-up](service-admin-disable-self-service.md).

Turning off self-service sign-up keeps users from exploring Power BI. If you block individual sign-up, you can get Power BI (free) licenses for your organization and assign them to all users. 

To assign a Power BI (free) license to all existing users:

1. From your global admin or billing admin account, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
1. On the navigation menu, select **Billing** > **Purchase services**.
1. Search or scroll to locate the Power BI (free) offer. Select **Details**.
1. Select the number of licenses you want, and then select **Buy**.

    :::image type="content" source="media/service-admin-licensing-organization/m365-assign-2021.png" alt-text="Screenshot showing the Power BI free subscription dialog.":::

1. Complete the information on the **Checkout** page, and then select **Place order**.
1. Select **Licenses** from the left sidebar, and then select **Power BI (free)** from the subscriptions.
1. Select **Assign licenses** and assign the licenses to users.

To see which users in your organization already have a license, see [View and manage user licenses](service-admin-manage-licenses.md).

## License types and capabilities

There are three kinds of Power BI per-user licenses: Free, Pro, and Premium Per User. The type of license a user needs is determined by where content is stored, how they'll interact with that content, and if that content uses Premium features. Where an organization stores content is determined [subscription license type](#subscription-license-types).

The [Power BI Premium](service-admin-premium-purchase.md) organizational subscription is a capacity-based license. Using Premium capacity Pro and PPU users can share content and collaborate with free and other PPU users.

For detailed information about licensing, see [Licenses for the Power BI](../fundamentals/service-features-license-type.md).

An organization using Power BI with free and Pro per-user licenses has a shared and limited capacity to process content. If content is stored in that shared capacity, users who are assigned a Power BI Pro license can collaborate only with other Power BI Pro users. They can use content shared by other users, publish content to app workspaces, share dashboards, and subscribe to dashboards and reports.  When workspaces are in Premium capacity, Pro users can distribute content to users who don't have a Power BI Pro license.

Content created by a user with a PPU license can only share with other users with a PPU license, unless that content is put into a workspace hosted on a Premium capacity. For a detailed breakdown of feature availability per license type, see [Features by license type](../fundamentals/service-features-license-type.md).


## Subscription license types

All user-based, commercial licenses from Microsoft are based on Azure Active Directory identities. To use the Power BI service, sign in with an identity that Azure Active Directory supports for commercial licenses. You can add Power BI to any Microsoft license that uses Azure Active Directory for identity services. Some licenses, such as Office 365 E5, include a Power BI Pro license.

There are two kinds of Power BI subscription licenses for organizations: standard and premium.

- Standard - With a standard, self-service Power BI subscription, admins can assign per user licenses. There's a per user monthly fee for Power BI Pro licenses. This license type enables collaboration, publishing, sharing, and ad-hoc analysis. Content is saved to shared storage capacity that is fully managed by Microsoft.
- Premium - A Power BI Premium subscription license allocates a capacity to an organization. This subscription type is suitable for enterprise BI, big data analytics, cloud and on-premises reporting. Premium provides advanced administration and deployment controls. Reserved compute and storage resources are managed by capacity admins in your organization. There's a monthly cost for this reserved environment. In addition to other Premium advantages, content stored in Premium capacity can be accessed by and distributed to users who don't have Power BI Pro licenses. At least one user must have a Power BI Pro license assigned to use Premium, and content creators and developers need a Power BI Pro license.

The two types of subscriptions aren't mutually exclusive. You can have both Power BI Premium and standard. In this configuration, content stored in Premium capacity can be shared with all users and shared capacity is available. For information about capacity limits, see [Manage data storage in Power BI workspaces](../admin/service-admin-manage-your-data-storage-in-power-bi.md).

>[!NOTE]
>Power BI has released Power BI Premium Gen2, which improves the Power BI Premium experience with improvements in the following areas:

>- Performance
>- Per-user licensing. For more information, see [Premium Per User article](service-premium-per-user-faq.yml).
>- Greater scale
>- Improved metrics
>- Autoscaling
>- Reduced management overhead
>
>For more information about Power BI Premium Gen2, see [Power BI Premium Generation 2](service-premium-what-is.md#power-bi-premium-generation-2).
>

To compare product features and pricing, see [Power BI pricing](https://powerbi.microsoft.com/pricing).

## Guest user access

You might want to distribute content to users who are outside of your organization. You can share content with external users by inviting them to view content as a guest. Azure Active Directory Business-to-business (Azure AD B2B) enables sharing with external guest users. Prerequisites:

- The ability to share content with external users must be enabled

- The guest user must have the proper licensing in place to view the shared content

For more information about guest user access, see [Distribute Power BI content to external guest users with Azure AD B2B](service-admin-azure-ad-b2b.md).

## Purchase Power BI Pro licenses

As an administrator, you purchase Power BI Pro licenses through Microsoft 365 or through a Microsoft partner. After your purchase, you can assign them to individual users. For more information, see [Purchase and assign Power BI Pro licenses](service-admin-purchasing-power-bi-pro.md).

### Power BI Pro license expiration

There's a grace period after a Power BI Pro license expires. For licenses that are part of a volume license purchase, the grace period is 90 days. If you bought the license directly, the grace period is 30 days.

Power BI Pro has the same license lifecycle as Microsoft 365. For more information, see [What happens to my data and access when my Microsoft 365 for business subscription ends](/microsoft-365/commerce/subscriptions/what-if-my-subscription-expires).

## Next steps

- [Purchase and assign Power BI Pro licenses](service-admin-purchasing-power-bi-pro.md)
- [Business subscriptions and billing documentation](/microsoft-365/commerce/)
- [Find Power BI users that have signed in](../admin/service-admin-access-usage.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
