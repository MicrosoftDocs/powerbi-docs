---
title: Power BI service features by license type
description: "In the Power BI service, users have defined capabilities based on the type of per-user license they have (free or Pro) and whether the content they are interacting with is in a workspace assigned to a Power BI Premium capacity."
author: kfollis
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 10/18/2021
ms.custom: licensing support
LocalizationGroup: Get started
---

# Power BI service features by license type

There are three kinds of Power BI per-user licenses: Free, Pro, and Premium Per User. Which type of license a user needs is determined by where content is stored, how they'll interact with that content, and if that content uses Premium features. Where content can be stored is determined by your organization's [license type](#licenses-and-license-types).

## Licenses and license types

One type of license, [Power BI Premium](../admin/service-admin-premium-purchase.md) capacity-based license, allows users with a free license to act on content in workspaces that are assigned to Premium capacity. Outside of Premium capacity, a user with a free license can only use the Power BI service to connect to data and create reports and dashboards in **My Workspace**. They can't share content with others or publish content to other workspaces. To learn more about workspace types, see [Types of workspaces](../consumer/end-user-workspaces.md#types-of-workspaces). To discover more about Power BI Premium, see [What is Power BI Premium?](../admin/service-premium-what-is.md)

A Power BI license with free and Pro per-user license only uses a shared and limited capacity to process content. If content is stored in that shared capacity, users who are assigned a Power BI Pro license can collaborate only with other Power BI Pro users. They can consume content shared by other users, publish content to app workspaces, share dashboards, and subscribe to dashboards and reports.  When workspaces are in Premium capacity, Pro users may distribute content to users who don't have a Power BI Pro license.

When using Premium Per User licenses, content created by a Premium Per User licensed user can only be shared with other users that have a Premium license, unless that content is specifically put on a workspace hosted on a Premium capacity. The table below summarizes the basic capabilities of each license type. 

| License type | Capabilities when workspace is in shared capacity | Additional  capabilities when workspace is in Premium capacity |
| --------- | ----------- | ----------- |
| Power BI (free) | Access to content in My Workspace | Consume content shared with them |
| Power BI Pro | Publish content to other workspaces, share dashboards, subscribe to dashboards and reports, share with users who have a Pro license | Distribute content to users who have free licenses |
| Power BI Premium Per User | Publish content to other workspaces, share dashboards, subscribe to dashboards and reports, share with users who have a Premium Per User license | Distribute content to users who have free and Pro licenses |

For a comparison of Power BI Pro and Power BI Premium, see the _Power BI features comparison_ section of [Power BI pricing](https://powerbi.microsoft.com/pricing/).

>[!NOTE]
>Power BI has released Power BI Premium Gen2, which improves the Power BI Premium experience with improvements in the following:
>* Performance
>* Per-user licensing. See [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) for more information.
>* Greater scale
>* Improved metrics
>* Autoscaling
>* Reduced management overhead
>
>For more information about Power BI Premium Gen2, see [What is Power BI Premium Gen2?](../admin/service-premium-gen2-what-is.md).
>

To learn more about the capabilities your license provides, see [Feature availability for users with free licenses](../consumer/end-user-features.md) and [Types of licenses for Power BI consumers](../consumer/end-user-license.md).

## Next steps

* [Sign up for the Power BI service as an individual](service-self-service-signup-for-power-bi.md)
* [Comparing Power BI Desktop and the Power BI service](service-service-vs-desktop.md)
