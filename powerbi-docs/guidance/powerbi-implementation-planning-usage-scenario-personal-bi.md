---
title: "Power BI usage scenarios: Personal BI"
description: "Learn how Power BI personal BI is about private analytics for an individual."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 02/19/2023
---

# Power BI usage scenarios: Personal BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

As described in the [Fabric adoption roadmap](fabric-adoption-roadmap-content-delivery-scope.md#personal), *personal BI* is about enabling an individual to gain analytical value. It's also about allowing them to perform business tasks more efficiently with the use of data, information, and analytics. Personal BI is sometimes thought of as the entry point for *self-service BI*.

In personal BI scenarios, the content creator has a lot of freedom and flexibility to create content for individual usage. Simplicity and speed are usually high priorities. There's no sharing or collaboration in this usage scenario—those topics are covered in the [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md), [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md), and [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) scenario articles.

> [!NOTE]
> There are four *content collaboration and delivery* scenarios that build upon each other. The personal BI scenario is the first of the four scenarios. A list of all scenarios can be found in the [Power BI usage scenarios overview](powerbi-implementation-planning-usage-scenario-overview.md) article.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support personal BI. The focus is on private analytics for an individual.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-personal-bi/usage-scenario-personal-bi-inline.svg" alt-text="Diagram shows personal BI, which is about private analytics for an individual. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-personal-bi/usage-scenario-personal-bi-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#personal-bi) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The Power BI content creator develops a BI solution using [Power BI Desktop](../fundamentals/desktop-what-is-desktop.md). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Power BI Desktop connects to data from one or more data sources. Queries and data mashups, which combine multiple sources, are developed in the [Power Query Editor](/power-query/power-query-what-is-power-query). |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Data model development and report creation are done in Power BI Desktop. In a personal BI solution, the primary intention is typically data exploration and analysis. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | When ready, the content creator publishes the Power BI Desktop file (.pbix) of Power BI project file (.pbip) to the [Power BI service](../fundamentals/power-bi-service-overview.md). |
| ![Item 5](../media/legend-number/legend-number-05-fabric.svg) | Since the primary intention is personal usage, the content is published to the content creator's [personal workspace](../fundamentals/service-basic-concepts.md#workspaces). Some advantages of using the Power BI service (instead of remaining solely in Power BI Desktop) include scheduled data refresh, dashboard alerts, and the ability to consume content using a mobile app. The content creator can also edit reports and models in their personal workspace with web authoring (if they enable the workspace setting). |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The content creator views and interacts with the content published. One option is to sign in to the Power BI service using a web browser. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | The content creator can also use a [Power BI mobile app](../consumer/mobile/mobile-apps-for-mobile-devices.md) to view published content. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Scheduled data refresh can be set up in the Power BI service to keep imported data up to date. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Some data sources may require an [On-premises data gateway](../connect-data/service-gateway-onprem.md) or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Power BI administrators oversee and monitor activity in the Power BI service. Personal workspaces are usually governed to a much lesser extent than workspaces that are intended for collaboration and distribution. |

## Key points

The following are some key points to emphasize about the personal BI scenario.

### Choice of authoring tools

[Power BI Desktop](../fundamentals/desktop-what-is-desktop.md) is the authoring tool to develop queries, models, and Power BI reports. It's possible to use different tools to create Excel reports and Power BI paginated reports (not depicted in the scenario diagram).

### Reliance on personal workspace

Use of the [personal workspace](../fundamentals/service-basic-concepts.md#workspaces) can be thought of like an *analytical sandbox*. For many organizations, personal content is subject to little governance or formal oversight. However, it's still wise to educate content creators on [guidelines to be successful with personal BI](fabric-adoption-roadmap-content-delivery-scope.md#personal). Use of the sharing feature available within a personal workspace isn't depicted in this usage scenario since the focus is individual analytics.

> [!IMPORTANT]
> Limit the use of personal workspaces and ensure no mission-critical content is stored in them. Although a Power BI administrator can access and govern a user's [personal workspace](/power-bi/admin/service-admin-portal-workspaces#govern-my-workspaces), storing critical content in personal workspaces does represent risk to the organization.

### Use of Fabric free license

For personal use, which by definition means there's no sharing or collaboration with others, [only certain capabilities of the Power BI service](../consumer/end-user-features.md#feature-list) are available to a user with a Fabric free license. When using a free license, most activities to create and publish content to the Power BI service are limited to their personal workspace.

> [!TIP]
> The [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) scenario describes how users with a Fabric free license can view content when it's hosted in a Premium capacity.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a Power BI Desktop file is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a [live connection](../connect-data/desktop-directquery-about.md#live-connections) or [DirectQuery](../connect-data/desktop-directquery-about.md) semantic model—[previously known as a dataset](../connect-data/service-datasets-rename.md) (not depicted in the scenario diagram).

> [!NOTE]
> A data gateway in *personal mode* is most frequently installed on the machine of an individual user. Therefore, a data gateway in personal mode is best-suited to personal BI usage scenarios. Your organization can restrict individuals from installing data gateways, in which case the content creator can use a data gateway in standard mode (typically set up and managed by IT).

### Information protection

[Information protection](fabric-adoption-roadmap-system-oversight.md#information-protection-and-data-loss-prevention) policies can be applied to content in the Power BI service. Some organizations have a [mandatory label policy](/fabric/governance/service-security-sensitivity-label-mandatory-label-policy) that requires a sensitivity label be assigned, even within a personal workspace.

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service, and it extends to personal workspaces. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and detect risky activities. Auditing and governance requirements are typically less stringent for personal BI scenarios.

## Related content

In the [next article in this series](powerbi-implementation-planning-usage-scenario-team-bi.md), learn about small team collaboration with the team BI usage scenario.
