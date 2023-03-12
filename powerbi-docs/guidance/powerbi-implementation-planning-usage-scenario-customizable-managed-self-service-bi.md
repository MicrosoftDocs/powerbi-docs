---
title: "Power BI usage scenarios: Customizable managed self-service BI"
description: "Learn how Power BI customizable managed self-service BI is about creating new specialized datasets by extending and personalizing existing datasets."
author: davidiseminger
ms.author: davidi
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 05/26/2022
---

# Power BI usage scenarios: Customizable managed self-service BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

As described in the [Power BI adoption roadmap](powerbi-adoption-roadmap-content-ownership-and-management.md#managed-self-service-bi), *managed self-service BI* is characterized by a blended approach that emphasizes *discipline at the core* and *flexibility at the edge*. The data architecture is usually maintained by a single team of centralized BI experts, while reporting responsibility belongs to creators within departments or business units.

However, when the core data architecture doesn't include all data required, dataset creators can extend, personalize, or customize existing shared datasets. New specialized datasets can be created that meet business requirements not met by existing centrally delivered datasets. Importantly, there's no duplication of core data. This usage scenario is called *customizable managed self-service BI*.

> [!NOTE]
> This customizable managed self-service BI scenario is the second of the self-service BI scenarios. This scenario builds upon what can be done with a centralized shared dataset (that was introduced in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario). A list of all scenarios can be found in the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components to support customizable managed self-service BI. The primary focus is on providing content creators in the business units with the ability to create a specialized data model by extending an existing shared dataset. The goal is to achieve reusability whenever possible and to allow flexibility to meet additional analytical requirements.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi/usage-scenario-customizable-managed-self-service-bi-inline.png" alt-text="Image shows a diagram of customizable managed self-service BI, which is about creating new specialized datasets by extending and personalizing existing datasets. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi/usage-scenario-customizable-managed-self-service-bi-expanded.png" border="false":::

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | Dataset creator A develops a model using Power BI Desktop. For a dataset that's intended for reuse, it's common (but not required) for the creator to belong to a centralized team that supports users across organizational boundaries (such as IT, enterprise BI, or the Center of Excellence). |
| ![Item 2.](media/common/icon-02-red-30x30.png) | Power BI Desktop connects to data from one or more data sources. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | Data model development is done in Power BI Desktop. Additional effort is made to create a well-designed and user-friendly model because it may be used as a data source by many self-service report creators. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | When ready, dataset creator A publishes their Power BI Desktop file (.pbix) *that contains only a model* to the Power BI service. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | The dataset is published to a workspace dedicated to storing and securing shared datasets. Since the dataset is intended for reuse, it's [endorsed](../collaborate-share/service-endorse-content.md) (certified or promoted, as appropriate). The dataset is also marked as [discoverable](../collaborate-share/service-discovery.md) to further encourage its reuse. The [lineage view](../collaborate-share/service-data-lineage.md) in the Power BI service can be used to track dependencies that exist between Power BI items. |
| ![Item 6.](media/common/icon-06-red-30x30.png) | [Data discovery in the data hub](../connect-data/service-data-hub.md) is enabled because the dataset is marked as discoverable. Discoverability allows the existence of a dataset to be visible in the data hub by other Power BI content creators who are looking for data. |
| ![Item 7.](media/common/icon-07-red-30x30.png) | Dataset creator B uses the data hub in the Power BI service to search for discoverable datasets. |
| ![Item 8.](media/common/icon-08-red-30x30.png) | If dataset creator B doesn't have permission, they can request [Build permission](../connect-data/service-datasets-build-permissions.md) on the dataset. This starts a workflow to request Build permission from an authorized approver. |
| ![Item 9.](media/common/icon-09-red-30x30.png) | In Power BI Desktop, dataset creator B creates a live connection to the original shared dataset that's located in the Power BI service. Since the intention is to extend and customize the original dataset, the [live connection](../connect-data/desktop-report-lifecycle-datasets.md) is [converted to a DirectQuery model](../connect-data/desktop-directquery-datasets-azure-analysis-services.md#using-directquery-for-live-connections). This action results in a local model in the Power BI Desktop file. |
| ![Item 10.](media/common/icon-10-red-30x30.png) | Power BI Desktop connects to data from additional data sources. The goal is to augment the shared dataset so that additional analytical requirements are met by the new specialized dataset. |
| ![Item 11.](media/common/icon-11-red-30x30.png) | Relationships are created in Power BI Desktop between the existing tables (from the shared dataset, also known as the remote model) and new tables just imported (stored in the [local model](../connect-data/desktop-directquery-datasets-azure-analysis-services.md#using-directquery-for-live-connections)). Additional calculations and modeling work is done in Power BI Desktop to complete the design of the specialized model. |
| ![Item 12.](media/common/icon-12-red-30x30.png) | When ready, dataset creator B publishes their Power BI Desktop file to the Power BI service. |
| ![Item 13.](media/common/icon-13-red-30x30.png) | The new specialized dataset is published to a workspace dedicated to storing and securing datasets that are owned and managed by the department. |
| ![Item 14.](media/common/icon-14-red-30x30.png) | The specialized dataset remains connected to the original Power BI shared dataset. Any changes to the original shared dataset will affect [downstream specialized datasets that have dependency on it](../connect-data/desktop-directquery-datasets-azure-analysis-services.md#chaining). |
| ![Item 15.](media/common/icon-15-red-30x30.png) | Other self-service report creators can author new reports connected to the specialized dataset. Report creators can choose to use Power BI Desktop, Power BI Report Builder, or Excel. |
| ![Item 16.](media/common/icon-16-red-30x30.png) | Report creators create new reports using Power BI Desktop. |
| ![Item 17.](media/common/icon-17-red-30x30.png) | Reports are published to a workspace dedicated to storing and securing reports and dashboards. |
| ![Item 18.](media/common/icon-18-red-30x30.png) | Published reports remain connected to the specialized dataset that's stored in a different workspace. Any changes to the specialized dataset affect all reports connected to it. |
| ![Item 19.](media/common/icon-19-red-30x30.png) | To connect to data sources that reside within a private organizational network, an On-premises data gateway is required for data refresh. |
| ![Item 20.](media/common/icon-20-red-30x30.png) | Power BI administrators oversee and monitor activity in the Power BI service. |

## Key points

The following are some key points to emphasize about the customizable managed self-service BI scenario.

### Shared dataset

The key aspect of making *managed self-service BI* work is to minimize the number of datasets. This scenario depicts a [shared dataset](../connect-data/service-datasets-across-workspaces.md) that contributes towards achieving a *single version of the truth*.

> [!NOTE]
> For simplicity, the scenario diagram depicts just one shared dataset. However, it's not usually practical to model all organizational data in a single dataset. The other extreme is to create a new dataset for every report, as less experienced content creators often do. The goal is to find the right balance, leaning toward relatively few datasets and creating new datasets when it makes sense to do so.

### Augment the initial shared dataset

Sometimes self-service creators need to augment an existing dataset with, for instance, additional data that's specific to their department. In this case, they can use [DirectQuery connections to Power BI datasets](../connect-data/desktop-directquery-datasets-azure-analysis-services.md). This feature allows for an ideal balance of self-service enablement while taking advantage of the investment in centrally managed data assets. The scenario diagram depicts a DirectQuery connection. The act of converting a live connection to a DirectQuery connection creates a local model that allows new tables to be added. Relationships can be created between tables from the original shared dataset (the remote model) and new tables just added (the local model). Additional calculations and data modeling can be done to customize the new data model.

> [!TIP]
> This scenario highlights reusing a shared dataset. However, sometimes there are situations when data modelers want to limit the creation of downstream data model. In that case, they can enable the [Discourage DirectQuery connections](../connect-data/desktop-discourage-directquery-connections-to-dataset.md#discourage-directquery-connections-to-a-dataset-using-power-bi-desktop) property in the Power BI Desktop settings.

### Dataset endorsement

Because shared datasets are intended for reuse, it's helpful to [endorse](../collaborate-share/service-endorse-content.md) them. A *certified* dataset conveys to report creators that the data is trustworthy and meets the organization's quality standards. A *promoted* dataset highlights that the dataset owner believes the data is valuable and worthwhile for others to use.

> [!TIP]
> It's a best practice to have a consistent, repeatable, rigorous process for endorsing content. Certified content should indicate that data quality has been validated. It should also follow change management rules, have formal support, and be fully documented. Because certified content has passed rigorous standards, the expectations for trustworthiness are higher.

### Dataset discovery

The [data hub](../connect-data/service-data-hub.md) helps report creators find, explore, and use datasets across the organization. In addition to dataset endorsement, [enabling dataset discovery](../collaborate-share/service-discovery.md#how-to-mark-a-dataset-as-discoverable) is critical for promoting its reuse. A discoverable dataset is visible in the data hub for report creators who are searching for data.

> [!NOTE]
> If a dataset isn't configured to be discoverable, only Power BI users with Build permission can find it.

### Request dataset access

A report creator may find a dataset in the [data hub](../connect-data/service-data-hub.md) that they want to use. If they don't have Build permission for the dataset, they can request access. Depending on the [request access setting](../connect-data/service-datasets-build-permissions.md#configure-how-users-request-build-permission) for the dataset, an email will be submitted to the dataset owner or custom instructions will be presented to the person who is requesting access.

### Publish to separate workspaces

There are several advantages to publishing reports to a workspace different from where the dataset is stored.

First, there's clarity on who's responsible for managing content in which workspace. Second, report creators have permissions to publish content to a reporting workspace (via workspace admin, member, or contributor roles). However, they only have Read and Build permissions for specific datasets. This technique allows [row-level security (RLS)](../enterprise/service-admin-rls.md) to take effect when necessary for users assigned to the viewer role.

### Dependency and impact analysis

When a shared dataset is used by other datasets or reports, those dependent objects can exist in many workspaces. The [lineage view](../collaborate-share/service-data-lineage.md) helps identify and understand the downstream dependencies. When planning a dataset change, first perform [impact analysis](../collaborate-share/service-dataset-impact-analysis.md#perform-dataset-impact-analysis) to understand which datasets or reports should be edited or tested.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a Power BI Desktop file is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a live connection or [DirectQuery](../connect-data/desktop-directquery-about.md) dataset.

> [!NOTE]
> For customizable managed self-service BI scenarios, a centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](../admin/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-adoption-roadmap-system-oversight.md#auditing) to help them understand usage patterns and adoption. The activity log is also valuable for supporting governance efforts, security audits, and compliance requirements. With a customizable managed self-service BI scenario, it's particularly helpful to track usage of the original shared dataset as well as dependent datasets.

## Next steps

In the [next article in this series](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md), learn about reusing data preparation work with dataflows in the self-service data preparation scenario.
