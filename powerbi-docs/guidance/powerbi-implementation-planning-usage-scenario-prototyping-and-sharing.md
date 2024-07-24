---
title: "Power BI usage scenarios: Prototyping and sharing"
description: "Learn how Power BI prototyping and sharing is about rapid exploration of user requirements."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 02/27/2022
---

# Power BI usage scenarios: Prototyping and sharing

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

As described in the [Fabric adoption roadmap](fabric-adoption-roadmap.md), exploration, experimentation, and obtaining useful feedback from a small group of users is the purpose of [phase 1 of solution adoption](fabric-adoption-roadmap-maturity-levels.md#solution-adoption-phases).

A prototype—or proof of concept (POC)—is a Power BI solution that's intended to address unknowns and mitigate risk. This solution can be shared with others to get feedback during development iterations. The solution might be a temporary, short-lived solution, or it might ultimately evolve into a solution that's fully validated and released. Creating a prototype is commonly done for [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) and [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) scenarios (and can occasionally be done for [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) scenarios).

Prototyping often occurs naturally during self-service BI development efforts. Or a prototype might be a small project that has specific [goals and a scope](powerbi-migration-proof-of-concept.md#set-poc-goals-and-scope).

> [!NOTE]
> The prototyping and sharing scenario is one of the self-service BI scenarios. For a complete list of the self-service scenarios, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components to support prototyping activities. The focus is on using Power BI Desktop during an interactive prototyping session. Focus can also be on sharing in the Power BI service when additional feedback is needed from subject matter experts.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-prototyping-and-sharing/usage-scenario-prototyping-and-sharing-inline.svg" alt-text="Diagram shows prototyping and sharing, which is about rapidly exploring prototypes or defining user requirements. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-prototyping-and-sharing/usage-scenario-prototyping-and-sharing-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#prototyping-and-sharing if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Power BI content creators develop BI solutions using Power BI Desktop. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Power BI Desktop connects to data from one or more data sources. Queries and data mashups, which combine multiple sources, are developed in the [Power Query Editor](/power-query/power-query-what-is-power-query). |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Data model development and report creation are done in Power BI Desktop. The purpose is to help team members understand the meaning and significance of data by placing it in a visual context. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Subject matter experts provide feedback during an interactive prototyping session. Based on feedback from the subject matter experts (and other team members), content creators make iterative improvements directly to the BI solution. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | If desired, content creators publish their Power BI Desktop file (.pbix) of Power BI project file (.pbip) to the [Power BI service](../fundamentals/power-bi-service-overview.md). Publication of prototyping solutions to the Power BI service is optional. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The content is published to a non-production [workspace](../collaborate-share/service-new-workspaces.md). Its primary purpose is to provide a development area that enables review by team members. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | An individual report is shared with a colleague to provide read-only permissions to the report (and its underlying data). The [sharing operation](../collaborate-share/service-share-dashboards.md) can be done with a sharing link or direct access sharing. Sharing can be advantageous for a prototyping solution to provide temporary access during the feedback process. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Power BI administrators oversee and monitor activity in the Power BI service. A development workspace (containing non-production and prototyping solutions) is usually governed to a much lesser extent than a production workspace. |

## Key points

The following are some key points to emphasize about the prototyping and sharing scenario.

### Interactive prototyping sessions

Interactive prototyping sessions are valuable to get immediate feedback when exploring user requirements, validating calculations, clarifying visual layout needs, validating user experience, and confirming report presentation. Use Power BI Desktop during prototyping sessions that are interactively conducted with subject matter experts.

### Power BI service

Publishing prototyping solutions to the Power BI service is optional. It can be useful when there's a need to share preliminary results for feedback and decision-making purposes.

> [!TIP]
> Prototyping solutions should be clearly separated from other production content so that consumers have proper expectations for a non-production solution. For example, consumers of a prototype report might not expect it to include all the data or be refreshed on a schedule. A prototype report shouldn't be used for business decisions until it's fully validated, finalized, and published to a production workspace.

### Workspace

A development [workspace](../collaborate-share/service-new-workspaces.md) is appropriate in this scenario since it involves working with a small [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) collaboration scenario (rather than a personal workspace as described in the [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) scenario). Once the solution is finalized and fully tested, it can be quickly promoted to a production workspace (as described in the [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) scenario).

### Sharing reports and dashboards

The scenario diagram depicts [sharing](../collaborate-share/service-share-dashboards.md) directly to a recipient (rather than [workspace roles](../collaborate-share/service-roles-new-workspaces.md) or using a [Power BI app](../collaborate-share/service-create-distribute-apps.md)). Using the sharing feature is appropriate for collaboration scenarios when colleagues work closely together in an informal way. Sharing is useful in this situation because it's limited to a small number of colleagues who need to review and provide feedback on the prototyped solution.

> [!TIP]
> Individual item sharing should be done infrequently. Since sharing is configured per individual items in a workspace, it's more tedious to maintain and increases the risk of error. A valid alternative to sharing (not depicted in the scenario diagram) is to use [workspace roles](../collaborate-share/service-roles-new-workspaces.md) (described in the [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) scenario). Workspace roles work best when colleagues need access to *all items* in a workspace.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a Power BI Desktop file is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a live connection or [DirectQuery](../connect-data/desktop-directquery-about.md) semantic model—[previously known as a dataset](../connect-data/service-datasets-rename.md) (not depicted in the scenario diagram).

> [!NOTE]
> For team, departmental, and enterprise BI scenarios, a centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and detect risky activities. Auditing and governance requirements are typically less stringent for prototyping and [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) scenarios.

## Related content

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
