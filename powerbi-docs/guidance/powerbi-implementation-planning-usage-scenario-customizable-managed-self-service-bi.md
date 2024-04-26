---
title: "Power BI usage scenarios: Customizable managed self-service BI"
description: "Learn how Power BI customizable managed self-service BI is about creating new specialized semantic models by extending and personalizing existing semantic models."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 05/26/2022
---

# Power BI usage scenarios: Customizable managed self-service BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

As described in the [Fabric adoption roadmap](fabric-adoption-roadmap-content-ownership-and-management.md#managed-self-service), *managed self-service BI* is characterized by a blended approach that emphasizes *discipline at the core* and *flexibility at the edge*. The data architecture is usually maintained by a single team of centralized BI experts, while reporting responsibility belongs to creators within departments or business units.

However, when the core data architecture doesn't include all data required, semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) creators can extend, personalize, or customize existing shared semantic models. New specialized semantic models can be created that meet business requirements not met by existing centrally delivered semantic models. Importantly, there's no duplication of core data. This usage scenario is called *customizable managed self-service BI*.

> [!NOTE]
> This customizable managed self-service BI scenario is the second of the self-service BI scenarios. This scenario builds upon what can be done with a centralized shared semantic model (that was introduced in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario). A list of all scenarios can be found in the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components to support customizable managed self-service BI. The primary focus is on providing content creators in the business units with the ability to create a specialized data model by extending an existing shared semantic model. The goal is to achieve reusability whenever possible and to allow flexibility to meet additional analytical requirements.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi/usage-scenario-customizable-managed-self-service-bi-inline.svg" alt-text="Diagram shows customizable managed self-service BI, which is about creating composite semantic models that extend and customize other semantic models. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi/usage-scenario-customizable-managed-self-service-bi-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#customizable-managed-self-service-bi) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Semantic model creator A develops a model using Power BI Desktop. For a semantic model that's intended for reuse, it's common (but not required) for the creator to belong to a centralized team that supports users across organizational boundaries (such as IT, enterprise BI, or the Center of Excellence). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Power BI Desktop connects to data from one or more data sources. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Data model development is done in Power BI Desktop. Additional effort is made to create a well-designed and user-friendly model so it can be used as a data source by many self-service report creators. Model creators can use DAX queries to develop and explore the model during development. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | When ready, model creator A publishes their Power BI Desktop file (.pbix) or Power BI project file (.pbip) *that contains only a model* to the Power BI service. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The semantic model is published to a workspace dedicated to storing and securing shared semantic models. Since the semantic model is intended for reuse, it's [endorsed](../collaborate-share/service-endorse-content.md) (certified or promoted, as appropriate). The semantic model is also marked as [discoverable](../collaborate-share/service-discovery.md) to further encourage its reuse. The [lineage view](../collaborate-share/service-data-lineage.md) in the Power BI service can be used to track dependencies that exist between Power BI items. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | [Data discovery in the OneLake data hub](../connect-data/service-data-hub.md) is enabled because the semantic model is marked as discoverable. Discoverability allows the existence of a semantic model to be visible in the OneLake data hub by other Power BI content creators who are looking for data. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Content creators use the OneLake data hub in the Power BI service to search for discoverable data items, like semantic models. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | If content creators have permission, they can request [Build permission](../connect-data/service-datasets-build-permissions.md) on data items. This starts a workflow to request Build permission from an authorized approver. Once they have permission, content creators can reuse the data items to build new solutions. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | In Power BI Desktop, model creator B creates a live connection to the original shared semantic model that's located in the Power BI service. Since the intention is to extend and customize the original semantic model, the [live connection](../connect-data/desktop-report-lifecycle-datasets.md) is [converted to a DirectQuery model](../connect-data/desktop-directquery-datasets-azure-analysis-services.md#using-directquery-for-live-connections). This action results in a local model in the Power BI Desktop file. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Power BI Desktop connects to data from additional data sources. The goal is to augment the shared semantic model so that additional analytical requirements are met by the new specialized composite semantic model. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Relationships are created in Power BI Desktop between the existing tables (from the shared semantic model, also known as the remote model) and new tables just imported (stored in the [local model](../connect-data/desktop-directquery-datasets-azure-analysis-services.md#using-directquery-for-live-connections)). Additional calculations and modeling work is done in Power BI Desktop to complete the design of the specialized composite model. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | When ready, semantic model creator B publishes their .pbix or .pbip file to the Power BI service. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | The new specialized composite semantic model is published to a workspace dedicated to storing and securing semantic models that are owned and managed by the department. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | The specialized semantic model remains connected to the original Power BI shared semantic model. Any changes to the original shared semantic model will affect [downstream specialized composite semantic models that have dependency on it](../connect-data/desktop-directquery-datasets-azure-analysis-services.md#chaining). |
| ![Item 15.](../media/legend-number/legend-number-15-fabric.svg) | Other self-service report creators can author new reports connected to the specialized composite semantic model. Report creators can choose to use Power BI Desktop, Power BI Report Builder, or Excel. |
| ![Item 16.](../media/legend-number/legend-number-16-fabric.svg) | Reports are published to a workspace dedicated to storing and securing reports and dashboards. |
| ![Item 17.](../media/legend-number/legend-number-17-fabric.svg) | Published reports remain connected to the specialized semantic model that's stored in a different workspace. Any changes to the specialized semantic model affect all reports connected to it. |
| ![Item 18.](../media/legend-number/legend-number-18-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 19.](../media/legend-number/legend-number-19-fabric.svg) | Fabric administrators oversee and monitor activity in the Fabric portal. |

## Key points

The following are some key points to emphasize about the customizable managed self-service BI scenario.

### Shared semantic model

The key aspect of making *managed self-service BI* work is to minimize the number of semantic models. This scenario depicts a [shared semantic model](../connect-data/service-datasets-across-workspaces.md) that contributes towards achieving a *single version of the truth*.

> [!NOTE]
> For simplicity, the scenario diagram depicts just one shared semantic model. However, it's not usually practical to model all organizational data in a single semantic model. The other extreme is to create a new semantic model for every report, as less experienced content creators often do. The goal is to find the right balance, leaning toward relatively few semantic models and creating new semantic models when it makes sense to do so.

### Augment the initial shared semantic model

Sometimes self-service creators need to augment an existing semantic model with, for instance, additional data that's specific to their department. In this case, they can use [DirectQuery connections to Power BI semantic models](../connect-data/desktop-directquery-datasets-azure-analysis-services.md). This feature allows for an ideal balance of self-service enablement while taking advantage of the investment in centrally managed data assets. The scenario diagram depicts a DirectQuery connection. The act of converting a live connection to a DirectQuery connection creates a local model that allows new tables to be added. Relationships can be created between tables from the original shared semantic model (the remote model) and new tables just added (the local model). Additional calculations and data modeling can be done to customize the new data model.

> [!TIP]
> This scenario highlights reusing a shared semantic model. However, sometimes there are situations when data modelers want to limit the creation of downstream data model. In that case, they can enable the [Discourage DirectQuery connections](../connect-data/desktop-discourage-directquery-connections-to-dataset.md#use-power-bi-desktop-to-discourage-directquery-connections-to-a-semantic-model) property in the Power BI Desktop settings.

### Semantic model endorsement

Because shared semantic models are intended for reuse, it's helpful to [endorse](../collaborate-share/service-endorse-content.md) them. A *certified* semantic model conveys to report creators that the data is trustworthy and meets the organization's quality standards. A *promoted* semantic model highlights that the semantic model owner believes the data is valuable and worthwhile for others to use.

> [!TIP]
> It's a best practice to have a consistent, repeatable, rigorous process for endorsing content. Certified content should indicate that data quality has been validated. It should also follow change management rules, have formal support, and be fully documented. Because certified content has passed rigorous standards, the expectations for trustworthiness are higher.

### Semantic model discovery

The [OneLake data hub](../connect-data/service-data-hub.md) helps report creators find, explore, and use semantic models across the organization. In addition to semantic model endorsement, [enabling semantic model discovery](../collaborate-share/service-discovery.md#how-to-mark-a-semantic-model-as-discoverable) is critical for promoting its reuse. A discoverable semantic model is visible in the data hub for report creators who are searching for data.

> [!NOTE]
> If a semantic model isn't configured to be discoverable, only Power BI users with Build permission can find it.

### Request semantic model access

A report creator might find a semantic model in the [data hub](../connect-data/service-data-hub.md) that they want to use. If they don't have Build permission for the semantic model, they can request access. Depending on the [request access setting](../connect-data/service-datasets-build-permissions.md#configure-how-users-request-build-permission) for the semantic model, an email will be submitted to the semantic model owner or custom instructions will be presented to the person who is requesting access.

### Publish to separate workspaces

There are several advantages to publishing reports to a workspace different from where the semantic model is stored.

First, there's clarity on who's responsible for managing content in which workspace. Second, report creators have permissions to publish content to a reporting workspace (via workspace admin, member, or contributor roles). However, they only have Read and Build permissions for specific semantic models. This technique allows [row-level security (RLS)](/fabric/security/service-admin-row-level-security) to take effect when necessary for users assigned to the viewer role.

### Dependency and impact analysis

When a shared semantic model is used by other semantic models or reports, those dependent objects can exist in many workspaces. The [lineage view](../collaborate-share/service-data-lineage.md) helps identify and understand the downstream dependencies. When planning a semantic model change, first perform [impact analysis](../collaborate-share/service-dataset-impact-analysis.md#perform-semantic-model-impact-analysis) to understand which semantic models or reports should be edited or tested.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a Power BI Desktop file is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a live connection or [DirectQuery](../connect-data/desktop-directquery-about.md) semantic model.

> [!NOTE]
> For customizable managed self-service BI scenarios, a centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and adoption. The activity log is also valuable for supporting governance efforts, security audits, and compliance requirements. With a customizable managed self-service BI scenario, it's particularly helpful to track usage of the original shared semantic model as well as dependent semantic models.

## Related content

In the [next article in this series](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md), learn about reusing data preparation work with dataflows in the self-service data preparation scenario.
