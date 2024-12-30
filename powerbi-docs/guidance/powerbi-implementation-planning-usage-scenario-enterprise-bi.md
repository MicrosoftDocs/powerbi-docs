---
title: "Power BI usage scenarios: Enterprise BI"
description: "Learn how Power BI enterprise BI is about organization-wide content distribution at scale."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI usage scenarios: Enterprise BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

As described in the [Fabric adoption roadmap](fabric-adoption-roadmap-content-delivery-scope.md#enterprise), *enterprise BI* is characterized by having a significantly larger number of content consumers, compared to a much smaller number of authors who create and publish content.

The distinction between the enterprise BI and the [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) scenarios is the use of [Microsoft Fabric capacity](/fabric/enterprise/licenses#capacity-license) or [Power BI Premium capacity](../enterprise/service-premium-what-is.md), which allow content to be widely [distributed to consumers](../fundamentals/service-features-license-type.md) who have a Fabric free license. Consumers can include users within the organization, as well as [guest users](whitepaper-azure-b2b-power-bi.md) who are external to the organization.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

Large enterprise BI implementations often employ a centralized approach. Enterprise Power BI content is commonly maintained by a centralized team, for use broadly throughout the organization. The centralized team responsible for content management is usually IT, BI, or the [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md).

> [!NOTE]
> There are four *content collaboration and delivery* usage scenarios that build upon each other. The enterprise BI scenario is the fourth scenario. A list of all scenarios can be found in the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> The [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario introduces an important concept about decoupling semantic model and report development. For simplicity, this concept isn't explicitly discussed in this article. You're encouraged to apply the concepts discussed in the managed self-service BI scenario whenever possible.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support enterprise BI. The primary focus is on organization-wide content distribution at scale including the use of Power BI Premium capacity. This scenario also depicts developing [Power BI paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md).

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-enterprise-bi/usage-scenario-enterprise-bi-inline.svg" alt-text="Diagram shows enterprise BI, which is about organization-wide content distribution. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-enterprise-bi/usage-scenario-enterprise-bi-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#enterprise-bi) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| Item | Description |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Power BI content creators develop BI solutions using Power BI Desktop. In an enterprise BI scenario, it's common that creators are members of a centralized team (such as IT, BI, or the COE) that supports users across organizational boundaries. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Power BI Desktop connects to data from one or more data sources. Queries and data mashups, which combine multiple sources, are developed in the Power Query Editor. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Data model development and report creation are done in Power BI Desktop. The purpose is to help colleagues understand the meaning and significance of data by placing it in a visual context. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | When ready, content creators publish their Power BI Desktop file (.pbix) or Power BI project file (.pbip) to the Power BI service. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Report creators develop paginated reports by using Power BI Report Builder. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | Power BI Report Builder queries data from one or more data source types. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | When ready, report creators publish their Power BI Report Builder file (.rdl) to the Power BI service. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Multiple Power BI item types can be published to a workspace that has Fabric capacity, Premium capacity, or Premium Per User license mode. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | In the enterprise BI scenario, use of [Fabric capacity](/fabric/enterprise/licenses) or [Premium capacity](../enterprise/service-premium-what-is.md) (rather than Premium Per User) is depicted. This choice is made to support content delivery to many content viewers who have a free Fabric license. |
| ![Item 10](../media/legend-number/legend-number-10-fabric.svg) | Some, or all, reports and dashboards are published as a [Power BI app](../consumer/end-user-apps.md). The purpose of the app is to provide a set of related content for consumers to view in a user-friendly way. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Power BI app users are added to app audiences, which are assigned read-only permission. App settings, app content, and app audiences are managed separately from the workspace. In an enterprise BI scenario, users with any type of Power BI license (Fabric (free), Power BI Pro, or Premium Per User) can be assigned as a viewer of the app. This feature applies only when the workspace is assigned a license mode of **Fabric capacity** or **Premium capacity** (free users cannot access workspace content when it's assigned a license mode of **Premium per user** or **Embedded**). |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | The Power BI mobile apps are also available for viewing app and workspace content. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Users who frequently work in Microsoft Teams might find it convenient to manage or [view Power BI content directly in Teams](../collaborate-share/service-collaborate-microsoft-teams.md). |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | Users assigned to the administrator, member, or contributor workspace roles can publish and manage workspace content. |
| ![Item 15.](../media/legend-number/legend-number-15-fabric.svg) | Scheduled data refresh is set up in the Power BI service to keep imported data—in semantic models or dataflows—up to date. |
| ![Item 16.](../media/legend-number/legend-number-16-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 17.](../media/legend-number/legend-number-17-fabric.svg) | Other self-service content creators can author new reports using an existing semantic model. They can choose to use Power BI Desktop, Excel, or Power BI Report Builder. The reuse of existing semantic models in this manner is highly encouraged. The [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario explores semantic model reuse further. |
| ![Item 18.](../media/legend-number/legend-number-18-fabric.svg) | Fabric administrators oversee and monitor activity in the Fabric portal. Enterprise BI solutions are often subject to stricter governance requirements than [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) or [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) solutions. |

## Key points

The following are some key points to emphasize about the enterprise BI scenario.

### Choice of report authoring tools

 [Power BI Desktop](../fundamentals/desktop-what-is-desktop.md) is a tool to develop highly interactive reports, whereas [Power BI Report Builder](../paginated-reports/report-builder-power-bi.md) is a tool to develop paginated reports. For more information about when to use paginated reports, see [When to use paginated reports in Power BI](report-paginated-or-power-bi.md).

Excel reports can also be published to the Power BI service (not depicted in the scenario diagram) when a PivotTable or PivotChart better meets reporting requirements.

### Source file storage

For enterprise BI, it's important to store the source Power BI Desktop files and Power BI Report Builder files in a secure, shared location. Locations such as OneDrive for work or school or SharePoint (not depicted in the scenario diagram) are useful. A shared library is securable, easily accessible by colleagues, and has built-in versioning capabilities.

When the co-management of a BI solution involves multiple people with different skillsets, consider decoupling the model and reports into separate Power BI Desktop files (described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario). This approach encourages reuse of the semantic model, and is more efficient than continually alternating between the people who are editing the Power BI Desktop file. That's particularly helpful when, for instance, one person works on the semantic model while another person works on the reports.

### Workspaces

A Power BI [workspace](../collaborate-share/service-create-the-new-workspaces.md) serves as a logical container in the Power BI service for storing related Power BI items, such as semantic models and reports. Although this scenario depicts one workspace, multiple workspaces are commonly required to satisfy all workspace planning requirements.

The [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario describes the use of separate workspaces.

### Workspace license mode

A workspace license mode can be assigned to **Pro**, **Premium per user** (PPU), **Premium per capacity**, or **Embedded**. This choice impacts [feature availability](../fundamentals/service-features-license-type.md), as well as which users can access the content in the workspace and the associated Power BI app. An enterprise BI scenario often involves many consumers of the content. So, it can be cost effective to use the **Premium per capacity** license mode to distribute content to users with a free license.

### Power BI app publication

For enterprise BI, a [Power BI app](../consumer/end-user-apps.md) works well for content distribution to consumers (rather than direct workspace access, which is described in the [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) scenario). A Power BI app provides the best experience for consumers because it presents a set of related content with a user-friendly navigation experience. A Power BI app is particularly useful in situations where there's a larger and more diverse number of consumers, or when the content developer doesn't work closely with the app consumers.

### Power BI app permissions

Power BI app users are granted read-only permission to the app, and these permissions are managed separately from the workspace. This additional level of flexibility is useful for managing who can view the content.

For enterprise BI, it's a best practice to limit workspace access to those who are responsible for content authoring, development, and quality assurance activities. Typically, only a small number of people genuinely require workspace access. Consumers can access the content by opening the Power BI app, rather than opening the workspace.

### Distribute content to Fabric free license users

Users with a Power BI free license (or Power BI Pro or PPU license) can view content when granted app access or are added to a workspace role—provided the workspace is assigned to Premium capacity. This ability to distribute content to users with a free license is not available for any of the other workspace license modes, including **Pro**, **Premium per user**, or **Embedded**.

### Power BI Premium capacity license

Use of a [P SKU](../enterprise/service-premium-what-is.md#capacities-and-skus) (such as P1, P2, P3, P4, or P5) is described in this scenario. A P SKU is required for typical production scenarios and is appropriate for the enterprise BI scenario described in this article.

### Manage lifecycle of content

Generally, enterprise BI solutions require stability for production content. One aspect is controlling when and how content is deployed to production. Use of [deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) is described in the [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) scenario.

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

In the [next article in this series](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md), learn more about the importance of reusing semantic models in the managed self-service BI scenario.
