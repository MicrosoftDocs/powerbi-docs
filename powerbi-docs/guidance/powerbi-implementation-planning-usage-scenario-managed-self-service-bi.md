---
title: "Power BI usage scenarios: Managed self-service BI"
description: "Learn how Power BI managed self-service BI is about reuse of centralized shared semantic models by other report creators."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI usage scenarios: Managed self-service BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

As described in the [Fabric adoption roadmap](fabric-adoption-roadmap-content-ownership-and-management.md#managed-self-service), *managed self-service BI* is characterized by a blended approach that emphasizes *discipline at the core* and *flexibility at the edge*. The data architecture is usually maintained by a single team of centralized BI experts, while reporting responsibility belongs to creators within departments or business units.

Usually, there are many more report creators than semantic model creators. These report creators can exist in any area of the organization. Because self-service report creators often need to quickly produce content, a blended approach allows them to focus on producing reports that support timely decision-making without the additional effort of creating a semantic model.

> [!NOTE]
> The managed self-service BI scenario is the first of the self-service BI scenarios. For a complete list of the self-service BI scenarios, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support managed self-service BI. The primary objective is for many report creators to reuse centralized shared semantic models. To accomplish that, this scenario focuses on decoupling the model development process from the report creation process.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-managed-self-service-bi/usage-scenario-managed-self-service-bi-inline.svg" alt-text="Diagram shows managed self-service BI, which is about centralizing semantic models for reuse by other report creators. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-managed-self-service-bi/usage-scenario-managed-self-service-bi-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#customizable-managed-self-service-bi) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| Item | Description |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Semantic model creators develop models by using Power BI Desktop. For semantic models that are intended for reuse, it's common (but not required) for creators to belong to a centralized team that supports users across organizational boundaries (such as IT, enterprise BI, or the Center of Excellence). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Power BI Desktop connects to data from one or more data sources. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Data model development is done in Power BI Desktop. Additional effort is made to create a well-designed and user-friendly model because it will be used as a data source by many self-service report creators. Model creators can use DAX queries to develop and explore the model during development. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | When ready, semantic model creators publish their Power BI Desktop file (.pbix) or Power BI project file (.pbip) *that contains only a model* to the Power BI service. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The semantic model is published to a workspace dedicated to storing and securing shared semantic models. Since the semantic model is intended for reuse, it's [endorsed](../collaborate-share/service-endorse-content.md) (certified or promoted, as appropriate). The semantic model is also marked as [discoverable](../collaborate-share/service-discovery.md) to further encourage its reuse. The [lineage view](../collaborate-share/service-data-lineage.md) in the Power BI service can be used to track dependencies that exist between Power BI items, including reports connected to the semantic model. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | [Semantic model discovery in the OneLake catalog](/fabric/governance/onelake-catalog) is enabled because the semantic model is marked as discoverable. Discoverability allows the existence of a semantic model to be visible in the OneLake catalog by other content creators who are looking for data. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Report creators use the OneLake catalog in the Fabric portal to search for discoverable data items, like semantic models. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | If report creators don't have permission, they can request [Build permission](../connect-data/service-datasets-build-permissions.md) on the data items. This starts a workflow to request Build permission from an authorized approver. When approved, the report creator can reuse data items to create new reports. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Report creators create new reports by using Power BI Desktop. Reports use a [live connection](../connect-data/desktop-report-lifecycle-datasets.md) to a shared semantic model. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Report creators develop reports in Power BI Desktop. In addition to the report, the report creators can use themes, images, and custom visuals, and they can create report-level measures. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | When ready, report creators publish their Power BI Desktop file to the Power BI service. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | Reports are published to a workspace dedicated to storing and securing reports and dashboards. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Published reports remain connected to the shared semantic models that are stored in a different workspace. Any changes to the shared semantic model affect all reports connected to it. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | Other self-service report creators can author new reports using the existing shared semantic model. Report creators can choose to use Power BI Desktop, Power BI Report Builder, or Excel. |
| ![Item 15.](../media/legend-number/legend-number-15-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 16.](../media/legend-number/legend-number-16-fabric.svg) | Power BI administrators oversee and monitor activity in the Power BI service. |

## Key points

The following are some key points to emphasize about the managed self-service BI scenario.

### Shared semantic model

The key aspect of making *managed self-service BI* work is to minimize the number of semantic models. This scenario is about [shared semantic models](../connect-data/service-datasets-across-workspaces.md) that help achieve a *single version of the truth*.

> [!NOTE]
> For simplicity, the scenario diagram depicts just one shared semantic model. However, it's not usually practical to model all organizational data in a single semantic model. The other extreme is to create a new semantic model for every report, as less experienced content creators often do. The goal of managed self-service BI is to find the right balance, leaning toward relatively few semantic models and creating new semantic models when it makes sense to do so.

### Decouple semantic model and reports

When the semantic model is decoupled from reports, it facilitates the separation of effort and responsibility. A shared semantic model is commonly maintained by a centralized team (like IT, BI, or Center of Excellence), while reports are maintained by subject matter experts in the business units. However, that's not required. For example, this pattern can be adopted by any content creator that wants to achieve reusability.

> [!NOTE]
> For simplicity, dataflows aren't depicted in the scenario diagram. To learn about dataflows, see the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) scenario.

### Semantic model endorsement

Because shared semantic models are intended for reuse, it's helpful to [endorse](../collaborate-share/service-endorse-content.md) them. A *certified* semantic model conveys to report creators that the data is trustworthy and meets the organization's quality standards. A *promoted* semantic model highlights that the semantic model owner believes the data is valuable and worthwhile for others to use.

> [!TIP]
> It's a best practice to have a consistent, repeatable, rigorous process for endorsing content. Certified content should indicate that data quality has been validated. It should also follow change management rules, have formal support, and be fully documented. Because certified content has passed rigorous standards, the expectations for trustworthiness are higher.

### Semantic model discovery

The [OneLake catalog](/fabric/governance/onelake-catalog) helps report creators find, explore, and use semantic models across the organization. In addition to semantic model endorsement, [enabling semantic model discovery](../collaborate-share/service-discovery.md#how-to-mark-a-semantic-model-as-discoverable) is critical for promoting its reuse. A discoverable semantic model is visible in the OneLake catalog for report creators who are searching for data.

> [!NOTE]
> If a semantic model isn't configured to be discoverable, only Power BI users with Build permission can find it.

### Request semantic model access

A report creator might find a semantic model in the [OneLake catalog](/fabric/governance/onelake-catalog) that they want to use. If they don't have Build permission for the semantic model, they can request access. Depending on the [request access setting](../connect-data/service-datasets-build-permissions.md#configure-how-users-request-build-permission) for the semantic model, an email will be submitted to the semantic model owner or custom instructions will be presented to the person who is requesting access.

### Live connection to the shared semantic model

A Power BI Desktop [live connection](../connect-data/desktop-report-lifecycle-datasets.md) connects a report to an existing semantic model. Live connections avoid the need to create a new data model in the Power BI Desktop file.

> [!IMPORTANT]
> When using a live connection, all data that the report creator needs must reside within the connected semantic model. However, the [customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) scenario describes how a semantic model can be extended with additional data and calculations.

### Publish to separate workspaces

There are several advantages to publishing reports to a workspace different from where the semantic model is stored.

First, there's clarity on who's responsible for managing content in which workspace. Second, report creators have permissions to publish content to a reporting workspace (via workspace admin, member, or contributor roles). However, they only have Read and Build permissions for specific semantic models. This technique allows [row-level security (RLS)](/fabric/security/service-admin-row-level-security) to take effect when necessary for users assigned to the viewer role.

> [!IMPORTANT]
> When you publish a Power BI Desktop report to a workspace, the RLS roles are applied to members who are assigned to the viewer role in the workspace. Even if viewers have Build permission to the semantic model, RLS still applies. For more information, see [Using RLS with workspaces in Power BI](/fabric/security/service-admin-row-level-security#using-rls-with-workspaces-in-power-bi).

### Dependency and impact analysis

When a shared semantic model is used by many reports, those reports can exist in many workspaces. The [lineage view](../collaborate-share/service-data-lineage.md) helps identify and understand the downstream dependencies. When planning a semantic model change, first perform [impact analysis](../collaborate-share/service-dataset-impact-analysis.md#perform-semantic-model-impact-analysis) to understand which dependent reports might require editing or testing.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a Power BI Desktop file is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a live connection or [DirectQuery](../connect-data/desktop-directquery-about.md) semantic model.

> [!NOTE]
> For managed self-service BI scenarios, a centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and adoption. The activity log is also valuable for supporting governance efforts, security audits, and compliance requirements. With a managed self-service BI scenario, it's particularly helpful to track usage of shared semantic models. A high report-to-semantic model ratio indicates good reuse of semantic models.

## Related content

In the [next article in this series](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md), learn about ways to customize and extend a shared semantic model to meet additional types of requirements.
