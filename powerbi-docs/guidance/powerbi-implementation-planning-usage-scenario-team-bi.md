---
title: "Power BI usage scenarios: Team BI"
description: "Learn how Power BI team BI is about small team collaboration."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 02/27/2022
---

# Power BI usage scenarios: Team BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

Once a valuable BI solution is created, it's time to collaborate with colleagues. The goal is to deliver additional value beyond what can be achieved with the [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) scenario.

As described in the [Fabric adoption roadmap](fabric-adoption-roadmap-content-delivery-scope.md#team), *team BI* focuses on a small team of people who work closely together. Collaborating and sharing content with each other in an informal way is usually a key objective of team BI (more formal delivery of content is covered in the [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) and [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) scenarios).

Sometimes when working with close colleagues, collaboration for small teams can be done simply within a workspace. A workspace can be thought of as a way to informally view content (without the formality of publishing a Power BI app, which is covered in the [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) scenario) by members of a small team.

> [!NOTE]
> There are four *content collaboration and delivery* usage scenarios that build upon each other. The team BI scenario is the second of the four scenarios. A list of all scenarios can be found in the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> The [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario introduces an important concept about decoupling semantic model and report development. For simplicity, this concept isn't explicitly discussed in this article. You're encouraged to apply the concepts discussed in the managed self-service BI scenario whenever possible.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support team BI. The primary focus is small team collaboration.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-team-bi/usage-scenario-team-bi-inline.svg" alt-text="Diagram shows team BI, which is about small team collaboration. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-team-bi/usage-scenario-team-bi-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#team-bi) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Power BI content creators develop BI solutions using Power BI Desktop. In a team BI scenario, it's common for creators to work within a decentralized team, department, or business unit. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Power BI Desktop connects to data from one or more data sources. Queries and data mashups, which combine multiple sources, are developed in the Power Query Editor. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Data model development and report creation are done in Power BI Desktop. In a team BI solution, the purpose is to help team members understand the meaning and significance of data by placing it in a visual context. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | When ready, content creators publish their Power BI Desktop file (.pbix) or Power BI project file (.pbip) to the Power BI service. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The content is published to a workspace. Its primary purpose is to provide information and enable collaboration for a small team. Content creators can also create or edit some content in a workspace. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | All users assigned to a [workspace role](../collaborate-share/service-roles-new-workspaces.md) (viewer or higher) view and interact with content in the workspace. One option is to sign in to the Power BI service using a web browser. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | The Power BI mobile apps are also available for viewing published content. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Users who frequently work in Microsoft Teams might find it convenient to manage or [view Power BI content directly in Teams](../collaborate-share/service-collaborate-microsoft-teams.md). They can use the Power BI app for Microsoft Teams or view reports that are embedded within a team channel. Users can also have private chats with each other and receive notifications directly in Teams. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Users assigned to the administrator, member, or contributor [workspace role](../collaborate-share/service-roles-new-workspaces.md) can publish and manage workspace content. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Scheduled data refresh can be set up in the Power BI service to keep imported data—in semantic models or dataflows—up to date. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | Other self-service content creators can author new reports using an existing semantic model. They can choose to use Power BI Desktop, Excel, or Power BI Report Builder (not depicted in the scenario diagram). The [reuse of existing semantic models](../connect-data/desktop-report-lifecycle-datasets.md) in this manner is highly encouraged. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Power BI administrators oversee and monitor activity in the Power BI service. Team BI solutions could be subject to more governance requirements than [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md), but fewer than [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) and [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) solutions. |

## Key points

The following are some key points to emphasize about the team BI scenario.

### Source file storage

[Power BI Desktop](../fundamentals/desktop-what-is-desktop.md) is the authoring tool to develop queries, models, and interactive reports. Because collaboration is a high priority for team BI, it's important to store the source Power BI Desktop file in a secure, shared location. Locations such as OneDrive for work or school or SharePoint (not depicted in the scenario diagram) are useful due to built-in version history and automatic file synchronization. A shared library is securable, easily accessible by colleagues, and has built-in versioning capabilities.

When the co-management of a BI solution involves multiple people with different skillsets, consider decoupling the model and reports into separate Power BI Desktop files (described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario). This approach encourages reuse of the semantic model and is more efficient than continually alternating between the people who are editing the Power BI Desktop file. That's particularly helpful when, for instance, one person works on the semantic model while another person works on the reports.

### Workspaces

A Power BI [workspace](../collaborate-share/service-create-the-new-workspaces.md) serves as a logical container in the Power BI service for storing related Power BI items, such as semantic models and reports. In a team BI scenario, it's practical and simple to use the workspace for collaboration as well as for the viewing of reports by a small number of users. The distribution of content as a Power BI app is described in the [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) scenario.

### Workspace access and sharing

In addition to organizing content, a workspace forms a security boundary. Assign users to workspace roles when a team member needs to edit or view all items published to a workspace. The four [workspace roles](../collaborate-share/service-roles-new-workspaces.md) (administrator, member, contributor, and viewer) support productivity for self-service content creators and consumers, without over-provisioning permissions.

> [!NOTE]
> Alternatively, workspace users can [share individual reports](../collaborate-share/service-share-dashboards.md) and dashboards (not depicted in the scenario diagram). Sharing can grant read-only access to someone who isn't assigned to a workspace role. However, try to limit sharing because it can be tedious to setup for many items or many users.

### Power BI user licenses

When collaborating in a workspace, all users must have a [Power BI Pro or Power BI Premium Per User (PPU) license](https://powerbi.microsoft.com/pricing/).

> [!NOTE]
> There's one exception to the requirement of a Power BI Pro or PPU license: When the workspace is assigned to Premium capacity or Fabric F64 or greater capacity, Fabric free license users (with proper permissions) can view the workspace (and/or Power BI app) content. This approach is described in the [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) scenario.

### Reuse existing semantic models

The reuse of existing semantic models is important for team collaboration. It helps to promote a *single version of the truth*. It's particularly important when a small number of semantic model creators support many report creators. A Power BI Desktop [live connection](../connect-data/desktop-report-lifecycle-datasets.md) can connect a report to an existing semantic model, avoiding the need to create another semantic model. Alternatively, when users prefer to create an Excel report, they can use the [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) feature. This type of connectivity is preferred to exporting data to Excel because it:

- Avoids creating duplicate semantic models.
- Reduces the risk of inconsistent data and calculations.
- Supports all slicing, dicing, and pivoting capabilities within the visuals while remaining connected to the semantic model that's stored in the Power BI service.

To access an existing semantic model, the content creator must have [Build permission](../connect-data/service-datasets-build-permissions.md) for the semantic model. It can be granted directly or indirectly when the user is assigned to a [workspace role](../collaborate-share/service-roles-new-workspaces.md) (contributor or higher) or granted when publishing a Power BI app or sharing a Power BI item. The [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario explores the reuse of shared semantic models further.

### Power BI integration with Microsoft Teams

Using a modern collaboration tool like Microsoft Teams engages users to make data-driven decisions. Microsoft Teams supports collaborative discussions about data while viewing Power BI content within a natural workflow. To learn about more collaboration options, see [Collaborate in Microsoft Teams with Power BI](../collaborate-share/service-collaborate-microsoft-teams.md).

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a Power BI Desktop file is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a [live connection](../connect-data/desktop-directquery-about.md#live-connections) or [DirectQuery semantic model](../connect-data/desktop-directquery-about.md) (not depicted in the scenario diagram).

> [!NOTE]
> For team, departmental, and enterprise BI scenarios, a centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and adoption. The activity log is also valuable for supporting governance efforts, security audits, and compliance requirements.

## Related content

In the [next article in this series](powerbi-implementation-planning-usage-scenario-departmental-bi.md), learn about distributing content to a larger number of viewers in the departmental BI usage scenario.
