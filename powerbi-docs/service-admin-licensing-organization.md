---
title: Power BI licensing in your organization 
description: Overview of the different license types available in Power BI and how admins purchase and manage licensing for their organization."
author: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 04/08/2020
ms.author: kfollis

LocalizationGroup: Administration
---

# Power BI licensing in your organization

What a user can do in the Power BI service depends on the type of per-user license they have and whether the content they're acting on is in a workspace assigned to Power BI Premium capacity. All users of the Power BI service must have a license.

There are two ways for users to get a license. Using self-service sign-up capabilities and their work or school account, users can get their own free or Pro license. Or, admins can get a Power BI subscription and assign licenses to users.

This article focuses on purchasing services and per-user licensing from an administrator perspective. For more information about how users can get their own license, see [Signing up for Power BI as an individual](service-self-service-signup-for-power-bi.md).

## Who can purchase and assign licenses?

You must be assigned an admin role to purchase or assign licenses for your organization. Admin roles are assigned by using the Azure Active Directory admin center or the Microsoft 365 admin center. The following table shows which role is required to do tasks related to purchase and licensing. For more information about administrator roles in Azure Active Directory, see [View and assign administrator roles in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/users-groups-roles/directory-manage-roles-portal). To learn more about admin roles in Microsoft 365, including best practices, see [About admin roles](https://docs.microsoft.com/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide).

| Who can purchase services and licenses? | Who can manage user licenses? |
| --------------- | --------------- |
| Billing administrator | License administrator |
| Global administrator | User administrator |
|  | Global administrator |

These roles manage the organization. For information about Power BI service administrator roles, see [Understanding Power BI service administrator roles](service-admin-role.md).

## Get Power BI for your organization

A global administrator or a billing administrator can sign up for the Power BI service and buy licenses for the users in their organization. If you're not quite ready to purchase, select the Power BI Pro trial. You'll get 25 licenses to use for one month. For step-by-step instructions on how to sign up, see [Get a Power BI subscription for your organization](admin/service-admin-org-subscription.md).

## About self-service sign-up

Individual users can get their own Power BI license by signing up with their work or school account. With a free license, users can explore Power BI for personal data analysis and visualization using My Workspace, but they can't initiate collaboration with other users. A Power BI Pro license is required to share content. Users can upgrade their license type to Pro, or sign up for Pro directly, if the organization is using the commercial cloud. Direct purchase of or upgrade to Pro isn't available to educational organizations or organizations deployed to government or sovereign cloud instances.

If you don't want self-service sign-up to be available to users in your organization, see [Enable or disable self-service sign-up](admin/service-admin-disable-self-service.md) to learn how to turn it off.

If you want to see which users in your organization may already have a license, see [View and manage user licenses](admin/service-admin-manage-licenses.md) to learn how.

## License types and capabilities

There are two kinds of Power BI per-user licenses: free and Pro. Which type of license a user needs is determined by where content is stored and how they'll interact with that content. Where content can be stored is determined by your organization's [subscription type](#subscription-types).

If you purchase [Power BI Premium](service-admin-premium-purchase.md), users with a free license can act on content in workspaces that are assigned to Premium capacity. Outside of Premium capacity, a user with a free license can only use the Power BI service to connect to data and create reports and dashboards in a personal workspace. They can't share content with others or publish content to app workspaces.

A standard Power BI subscription uses shared capacity. When content is stored in shared capacity, users who are assigned a Power BI Pro license can collaborate only with other Power BI Pro users. They can consume content shared by other users, publish content to app workspaces, share dashboards, and subscribe to dashboards and reports.  When workspaces are in Premium capacity, Pro users can distribute content to users who don't have a Power BI Pro license.
The table below summarizes the basic capabilities of each license type. For a detailed breakdown of feature availability per license type, see [Features by license type](service-features-license-type.md).

| License type | Capabilities when workspace is in shared capacity | Additional  capabilities when workspace is in Premium capacity |
| --------- | ----------- | ----------- |
| Power BI (free) | Access to content in My Workspace | Consume content shared with them |
| Power BI Pro | Publish content to app workspaces, share dashboards, subscribe to dashboards and reports, share with users who have a Pro license | Distribute content to users who have free licenses |

## Subscription types

All user-based, commercial license subscriptions from Microsoft are based on Azure Active Directory identities. This means you must sign in with an identity that Azure Active Directory supports for commercial licenses. You can add a Power BI subscription to any Microsoft subscription that uses Azure Active Directory for identity services. Some subscriptions, such as Office 365 E5, include a Power BI Pro license, so no separate sign-up for Power BI is needed.

There are two kinds of Power BI subscriptions for organizations: self-service BI with Power BI Pro and advanced analytics with Power BI Premium.

With a standard, self-service Power BI Pro subscription, admins assign per user licenses. There is a per user monthly fee for Power BI Pro licenses, which enables collaboration, publishing, sharing, and ad-hoc analysis. Content is saved to shared storage capacity that is fully-managed by Microsoft.

A Power BI Premium subscription allocates dedicated capacity to an organization. Suitable for enterprise BI, big data analytics, and cloud and on-premises reporting, Premium provides advanced administration and deployment controls. Dedicated compute and storage resources are managed by capacity admins in your organization. There's a monthly cost for this dedicated environment. In addition to other Premium advantages, content stored in Premium capacity can be accessed by and distributed to users who don't have Power BI Pro licenses. At least one user has to have a Power BI Pro license assigned to use Premium, and content creators and developers still need a Power BI Pro license.

The two types of subscriptions aren't mutually exclusive. You can add Power BI Premium to any Power BI Pro deployment. In this configuration, content stored in Premium capacity can be shared with all users and shared capacity is also available. For information about capacity limits, see [Manage data storage in Power BI workspaces](service-admin-manage-your-data-storage-in-power-bi.md).

To compare product features and pricing, see [Power BI pricing](https://powerbi.microsoft.com/pricing).

## Guest user access

You may want to distribute content to users who are outside of your organization. It's possible to share content with external users by inviting them to view content as a guest. Azure Active Directory Business-to-business (Azure AD B2B) enables sharing with external guest users. The following prerequisites must be met to share with external users:

- The ability to share content with external users must be enabled

- The guest user must have the proper licensing in place to view the shared content

For more information about guest user access, see [Distribute Power BI content to external guest users with Azure AD B2B](service-admin-azure-ad-b2b.md).

## Purchase Power BI Pro licenses

As an administrator, you purchase Power BI Pro licenses through Microsoft 365 or through a Microsoft partner. After you buy the licenses, you assign them to individual users. For more information, see [Purchase and assign Power BI Pro licenses](service-admin-purchasing-power-bi-pro.md).

### Power BI Pro license expiration

There's a grace period after a Power BI Pro license expires. For licenses that are part of a volume license purchase, the grace period is 90 days. If you bought the license directly, the grace period is 30 days.

Power BI Pro has the same subscription lifecycle as Office 365. For more information, see [What happens to my data and access when my Office 365 for business subscription ends?](https://support.office.com/article/What-happens-to-my-data-and-access-when-my-Office-365-for-business-subscription-ends-4436582f-211a-45ec-b72e-33647f97d8a3).


## Next steps

- [Purchase and assign Power BI Pro licenses](service-admin-purchasing-power-bi-pro.md)
- [Microsoft 365 Business subscriptions and billing documentation](https://docs.microsoft.com/microsoft-365/commerce/?view=o365-worldwide)
- [Find Power BI users that have signed in](service-admin-access-usage.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
