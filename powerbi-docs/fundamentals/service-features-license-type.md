---
title: Power BI service features by license type
description: "Learn how Power BI service features vary by license type. Compare Free, Pro, PPU, and Premium capacity licenses to choose the right option for your needs."
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: concept-article
ms.date: 09/30/2025
ms.custom: licensing support
ai-usage: ai-assisted
LocalizationGroup: Get started
---

# Power BI service features by license type

> [!NOTE]
> The Power BI service is available as a standalone service and as a service that is integrated with [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview). Administration and licensing are integrated with Microsoft Fabric.

Power BI service features vary by license. There are three per user license types: Fabric (Free), Power BI Pro, and Power BI Premium Per User (PPU). The license you need depends on where the content is stored, how you interact with it, and whether it uses Premium (capacity) features. Another license type is a capacity license (Fabric F SKUs or Power BI Premium P SKUs). Pro and PPU users who have access to a capacity (Fabric F64+ or Power BI Premium (P)) can create content in workspaces assigned to that capacity and grant colleagues, including free users, access to those capacity workspaces. Premium Per User (PPU) unlocks most Premium features per user without requiring the workspace itself to be on a dedicated capacity.

> [!NOTE]
> A Premium Per User (PPU) workspace isn't the same as a Premium capacity workspace.  

## Sign up for a license

There are several ways to begin using the Power BI service and Fabric.

- If you already have a Microsoft 365 subscription, [check whether that subscription includes a Power BI and Fabric license](end-user-license.md).
- If your [administrator purchased an organizational subscription](../enterprise/service-admin-manage-licenses.md), go to app.powerbi.com to check your license.
- If you're not ready to buy, start a [Fabric capacity trial](/fabric/get-started/fabric-trial). The trial capacity includes a license similar to PPU.
- If you're signing up as an individual in an organization and your administrator didn't assign you a license, [use self-service signup to try or buy](service-self-service-signup-purchase-for-power-bi.md) Power BI or Fabric.
- If you don't have Microsoft 365 or a Power BI license, [sign up for a Microsoft 365 Office 365 E5 trial](../enterprise/service-admin-signing-up-for-power-bi-with-a-new-office-365-trial.md).

## Power BI service licenses

There are licenses that apply to an individual (per-user) and a license (often also referred to as a *subscription*) that applies to the type of storage capacity that an organization purchases. Each of the three per-user licenses is unique, and each grants access to certain Power BI service features and capabilities. The combination of per-user license and capacity determines the features and capabilities available to you. Just a few of those capabilities are sharing, collaborating, and editing.

### Free per-user license

Users with free licenses can use the Power BI service to connect to data and create reports and dashboards for their own use. They can't use the Power BI sharing or collaborating features with others, or publish content to other people's workspaces. However, Pro and PPU users can share content and collaborate with free users if the content is saved in workspaces hosted in Premium capacity, Fabric F64, or greater capacity. To learn more about workspaces, see [Types of workspaces](../collaborate-share/end-user-workspaces.md#types-of-workspaces). To learn more about features available to users with a free license, see [Power BI service feature list](../fundamentals/end-user-features.md).

### Pro license

Power BI Pro is a per-user license that lets users create, read, and interact with content that others publish to the Power BI service. Users with this license type can share content and collaborate with other Power BI Pro users. Only Power BI Pro users can publish, share, or consume other Pro users' content unless it resides in a Power BI Premium capacity. If a Power BI Premium capacity hosts the content, Pro users can also share and collaborate with free and PPU users.

### Premium per user (PPU) license

A PPU per-user license provides all Power BI Pro capabilities plus most Premium capacity features. A Power BI PPU license adds features and content available only with a paid license. Access is limited to people who also have a PPU license. For example, to collaborate and share content in a PPU workspace, all users need a PPU license.

With a PPU license, you can share content only with users who also have a PPU license. The exception is when that content is saved in a workspace hosted in Premium capacity. The table summarizes the basic capabilities of each license type.

### Premium capacity

A capacity-based Premium license (often called a Premium *subscription*) lets Pro or PPU users create and save content in Premium capacity workspaces. They can then share content in that workspace with colleagues who have any license type. Only users with a Pro or PPU license can create and save content in Premium capacities, and only if their organization purchased Premium capacity.

Learn more about capacity options in [Microsoft Fabric capacity licenses](/fabric/enterprise/licenses).

| License type | Capabilities when workspace is in shared capacity | Extra capabilities when workspace is in Premium capacity |
| --------- | ----------- | ----------- |
| Fabric (free) | Access content they create for themselves | Consume content shared with them by Pro or PPU users |
| Power BI Pro | Publish content to other workspaces, share dashboards, subscribe to dashboards and reports, share with users who have a Pro license | Distribute content to users who have free or PPU licenses |
| Power BI Premium Per User (PPU) | Publish content to other workspaces, share dashboards, subscribe to dashboards and reports, share with *users who have a PPU license* | Distribute content to users who have free and Pro licenses |

For a comparison of Power BI Pro and Power BI Premium, see the *Power BI features comparison* section of [Power BI pricing](https://www.microsoft.com/power-platform/products/power-bi/pricing).

To learn more about the capabilities your license provides, see [Feature availability for users with free licenses](../fundamentals/end-user-features.md) and [Types of licenses for Power BI consumers](end-user-license.md).

## Related content

- [Sign up for the Power BI service as an individual](service-self-service-signup-for-power-bi.md)
- [Comparing Power BI Desktop and the Power BI service](service-service-vs-desktop.md)
