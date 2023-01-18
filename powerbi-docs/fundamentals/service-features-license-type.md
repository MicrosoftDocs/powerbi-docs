---
title: Power BI service features by license type
description: "In the Power BI service, users have defined capabilities based on the type of per-user license they have (free, Pro, PPU) and whether the content they are interacting with is in a workspace assigned to a Power BI Premium capacity."
author: kfollis
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 09/01/2022
ms.custom: licensing support
LocalizationGroup: Get started
---

# Power BI service per-user and capacity-based licenses

There are three kinds of Power BI *per-user* licenses: Free, Pro, and Premium Per User (PPU). Which type of license you need is determined by where your content is stored, how you'll interact with that content, and if that content uses Premium features. The other type of license is a Premium *capacity-based* license. PPU and Pro users with access to a [Power BI Premium](../enterprise/service-admin-premium-purchase.md) capacity-based license, can create content in workspaces that are assigned to Premium capacity. PPU and Pro users can then grant colleagues, including free users, access to those Premium workspaces. 

> [!NOTE]
> A Premium Per User (PPU) workspace is not the same as a Premium capacity workspace.  

## Power BI service licenses 
The important distinction to understand about licenses is that there are licenses that apply to an individual (per-user) and a license (often also referred to as a *subscription*) that applies to the type of storage capacity that an organization purchases. Each of the three per-user licenses is unique, and each grants access to certain Power BI service features and capabilities. When you combine the features and capabilities of each type of per-user license with the use of a Premium capacity, that is where Pro, PPU, and free license holders gain access to additional features and capabilities - such as sharing, collaboration, and more.  


### Free per-user license

Users with free licenses can use the Power BI service to connect to data and create reports and dashboards for their own use. They can't use the Power BI sharing or collaborating features with others, or publish content to other people's workspaces. However, Pro and PPU users can share content and collaborate with free users if the content is saved in workspaces hosted in Premium capacity. To learn more about workspaces, see [Types of workspaces](../consumer/end-user-workspaces.md#types-of-workspaces). To learn more about features available to users with a free license, see [Power BI service feature list](../consumer/end-user-features.md).

### Pro license 

Power BI Pro is an individual per-user license that lets users create content and also read, and interact with content that others have published to the Power BI service. Users with this license type can share content and collaborate with other Power BI Pro users. Only Power BI Pro users can publish or share content with other Pro users or consume content that's created by other Pro users, unless a Power BI Premium capacity hosts that content. If a Power BI Premium capacity hosts the content, then Pro users can share content and collaborate with free and PPU users too. 

### Premium per user (PPU) license

A PPU per-user license provides the license holder with all of the capabilities of Power BI Pro plus access to most Premium capacity-based features. A Power BI PPU license unlocks access to a variety of features, capabilities, and types of content that are only available through Premium. This access is limited to the PPU license holder and other colleagues who also have a PPU license. For example, in order to collaborate and share content in a PPU workspace, all users must have a PPU license.

When using a PPU license, content created by a PPU licensed user can only be shared with other users that have a PPU license, *unless* that content is specifically put in a workspace hosted in Premium capacity. The table below summarizes the basic capabilities of each license type.

### Premium capacity

A capacity-based Premium license (often referred to as a Premium *subscription*) allows Pro or PPU users to create and save content in Premium capacity workspaces. They can then share that workspace with colleagues who have any license type. Only users with a Pro or PPU license can create and save content in Premium capacities, and only if their organization has purchased Premium capacity. 

To discover more about Power BI Premium, see [What is Power BI Premium?](../enterprise/service-premium-gen2-what-is.md)


| License type | Capabilities when workspace is in shared capacity | Additional  capabilities when workspace is in Premium capacity |
| --------- | ----------- | ----------- |
| Power BI (free) | Access to content they create for themselves. | Consume content shared with them by Pro or PPU users |
| Power BI Pro | Publish content to other workspaces, share dashboards, subscribe to dashboards and reports, share with users who have a Pro license | Distribute content to users who have free or PPU licenses |
| Power BI Premium Per User (PPU) | Publish content to other workspaces, share dashboards, subscribe to dashboards and reports, share with *users who have a PPU license* | Distribute content to users who have free and Pro licenses |

For a comparison of Power BI Pro and Power BI Premium, see the _Power BI features comparison_ section of [Power BI pricing](https://powerbi.microsoft.com/pricing/).

>[!NOTE]
>Power BI has released Power BI Premium Gen2, which improves the Power BI Premium experience with improvements in the following:
>* Performance
>* Per-user licensing. See [Power BI Premium Per User](../enterprise/service-premium-per-user-faq.yml) for more information.
>* Greater scale
>* Improved metrics
>* Autoscaling
>* Reduced management overhead
>
>For more information about Power BI Premium Gen2, see [What is Power BI Premium Gen2?](../enterprise/service-premium-gen2-what-is.md).
>

To learn more about the capabilities your license provides, see [Feature availability for users with free licenses](../consumer/end-user-features.md) and [Types of licenses for Power BI consumers](../consumer/end-user-license.md).

## Next steps

* [Sign up for the Power BI service as an individual](service-self-service-signup-for-power-bi.md)
* [Comparing Power BI Desktop and the Power BI service](service-service-vs-desktop.md)
