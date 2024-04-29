---
title: "Power BI usage scenarios: Departmental BI"
description: "Learn how Power BI departmental BI is about business unit content distribution."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 02/27/2022
---

# Power BI usage scenarios: Departmental BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

As described in the [Fabric adoption roadmap](fabric-adoption-roadmap-content-delivery-scope.md#departmental), *departmental BI* focuses on distributing content to a larger number of users. These users are typically members of a department or business unit.

When teams grow larger, it becomes impractical to use a workspace effectively for the distribution of all reports (as described in the [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) scenario). A more effective way to handle larger departmental BI scenarios is to use the workspace for collaboration and distribute workspace content as an app to consumers.

> [!NOTE]
> There are four *content collaboration and delivery* usage scenarios that build upon each other. The departmental BI scenario is the third of the four scenarios. A list of all scenarios can be found in the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> The [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario introduces an important concept about decoupling semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) and report development. For simplicity, this concept isn't explicitly discussed in this article. You're encouraged to apply the concepts discussed in the managed self-service BI scenario whenever possible.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support departmental BI. The primary focus is on using a Power BI app for content distribution to a large consumer audience.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-departmental-bi/usage-scenario-departmental-bi-inline.svg" alt-text="Diagram shows departmental BI, which is about business unit content distribution. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-departmental-bi/usage-scenario-departmental-bi-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#departmental-bi) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Power BI content creators develop BI solutions using Power BI Desktop. In a departmental BI scenario, it's common for creators to work within a decentralized team, department, or business unit. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Power BI Desktop connects to data from one or more data sources. Queries and data mashups, which combine multiple sources, are developed in the Power Query Editor. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Data model development and report creation are done in Power BI Desktop. In a departmental BI solution, the purpose is to help colleagues understand the meaning and significance of data by placing it in a visual context. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | When ready, content creators publish their Power BI Desktop file (.pbix) or Power BI project file (.pbip) to the Power BI service. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The content is published to a workspace. Its primary purpose is to provide a collaboration area for people who are responsible for creating, managing, and validating content. Content creators can also create or edit some content in the workspace. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | Some, or all, reports and dashboards are published as a Power BI app. The purpose of the app is to provide a set of related content for consumers to view in a user-friendly way. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Power BI app users are added to app audiences, which are assigned read-only permissions. App settings, app content, and app audiences are managed separately from the workspace. Some teams may install and use template apps. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | The Power BI mobile apps are also available for viewing apps and workspace content. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Users who frequently work in Microsoft Teams might find it convenient to manage or [view Power BI content directly in Teams](../collaborate-share/service-collaborate-microsoft-teams.md). |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Users assigned to the administrator, member, or contributor [workspace roles](../collaborate-share/service-roles-new-workspaces.md) can publish and manage workspace content. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Scheduled data refresh is set up in the Power BI service to keep imported data—in semantic models or dataflows—up to date. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Other self-service content creators can author new reports using an existing semantic model. They can choose to use Power BI Desktop, Excel, or Power BI Report Builder (not depicted in the scenario diagram). The [reuse of existing semantic models](../connect-data/desktop-report-lifecycle-datasets.md) in this manner is highly encouraged. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | Power BI administrators oversee and monitor activity in the Power BI service. Departmental BI solutions could be subject to more governance requirements than [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) solutions, but fewer requirements than [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) solutions. |

## Key points

The following are some key points to emphasize about the departmental BI scenario.

### Source file storage

[Power BI Desktop](../fundamentals/desktop-what-is-desktop.md) is the authoring tool to develop queries, models, and interactive reports. For departmental BI, it's important to store the source Power BI Desktop file in a secure, shared location. Locations such as OneDrive for work or school or SharePoint (not depicted in the scenario diagram) are useful. A shared library is securable, easily accessible by colleagues, and has built-in versioning capabilities.

When the co-management of a BI solution involves multiple people with different skillsets, consider decoupling the model and reports into separate Power BI Desktop files (described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario). This approach encourages reuse of the semantic model and is more efficient than continually alternating between the people who are editing the Power BI Desktop file. That's particularly helpful when, for instance, one person works on the semantic model while another person works on the reports.

### Workspaces

A Power BI [workspace](../collaborate-share/service-create-the-new-workspaces.md) serves as a logical container in the Power BI service for storing related Power BI items, such as semantic models and reports. Although this scenario depicts one workspace, multiple workspaces are commonly required to satisfy all workspace planning requirements.

The [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario describes the use of separate workspaces.

### Power BI app publication

For departmental BI, a [Power BI app](../consumer/end-user-apps.md) works well for content distribution to consumers (rather than direct workspace access, which is described in the [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) scenario). A Power BI app provides the best experience for consumers because it presents a set of related content with a user-friendly navigation experience. A Power BI app is particularly useful in situations where there's a larger and more diverse number of consumers, or when the content developer doesn't work closely with the app consumers.

### Power BI app permissions

Power BI app users are granted read-only permission to the app, and these permissions are managed separately from the workspace. This additional level of flexibility is useful for managing who can view the content.

For departmental BI, it's a best practice to limit workspace access to those who are responsible for content authoring, development, and quality assurance activities. Typically, only a small number of people genuinely require workspace access. Consumers can access the content by opening the Power BI app, rather than opening the workspace.

### Power BI user licenses

All content creators and consumers of the workspace or the Power BI app must have a [Power BI Pro or Power BI Premium Per User (PPU) license](https://powerbi.microsoft.com/pricing/).

> [!NOTE]
> There's one exception to the requirement of a Power BI Pro or PPU license: When the workspace is assigned to Premium capacity or Fabric F64 or greater capacity, Fabric free license users (with proper permissions) can view the workspace (and/or app) content. This approach is described in the [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) scenario.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

### Reuse existing semantic models

The reuse of existing semantic models is important for team collaboration. It helps to promote a *single version of the truth*. It's particularly important when a small number of semantic model creators support many report creators. A Power BI Desktop [live connection](../connect-data/desktop-report-lifecycle-datasets.md) can connect a report to an existing semantic model, avoiding the need to create another semantic model. Alternatively, when users prefer to create an Excel report, they can use the [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) feature. Retaining connectivity to the semantic model is preferred to exporting data to Excel because it:

- Avoids creating duplicate semantic models.
- Reduces the risk of inconsistent data and calculations.
- Supports all slicing, dicing, and pivoting capabilities within the visuals while remaining connected to the semantic model that's stored in the Power BI service.

To access an existing semantic model, the content creator must have [Build permission](../connect-data/service-datasets-build-permissions.md) for the semantic model. It can be granted directly or indirectly when the user is assigned to a [workspace role](../collaborate-share/service-roles-new-workspaces.md) (contributor or higher) or granted when publishing a Power BI app or sharing a Power BI item. The [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario explores the reuse of shared semantic models further.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a Power BI Desktop file is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a live connection or [DirectQuery](../connect-data/desktop-directquery-about.md) semantic model (not depicted in the scenario diagram).

> [!NOTE]
> For team, departmental, and enterprise BI scenarios, a centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and adoption. The activity log is also valuable for supporting governance efforts, security audits, and compliance requirements.

## Related content

In the [next article in this series](powerbi-implementation-planning-usage-scenario-enterprise-bi.md), learn about organization-wide content distribution at scale in the enterprise BI scenario.
