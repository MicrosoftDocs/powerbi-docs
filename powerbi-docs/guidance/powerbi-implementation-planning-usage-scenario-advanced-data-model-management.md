---
title: "Power BI usage scenarios: Advanced data model management"
description: "Learn how Power BI advanced data model management is about empowering creators with advanced data modeling and publishing capabilities."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 02/13/2024
---

# Power BI usage scenarios: Advanced data model management

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This usage scenario focuses on *advanced data model management*, which is when a Power BI content creator relies on a third-party tool to develop, manage, or optimize data models. Some third-party tools are *[external tools](../transform-model/desktop-external-tools.md)*, which Power BI Desktop supports directly. You can also manage a published a data model (semantic model) by communicating directly with the [XMLA endpoint](../enterprise/service-premium-connect-tools.md) in the Power BI service.

Data models are hosted in either the Power BI service, Azure Analysis Services (AAS), or SQL Server Analysis Services (SSAS). This usage scenario focuses on using the XMLA endpoint in the Power BI service.

> [!TIP]
> Many people refer to third-party tools as *external tools*. However, there are distinctions in how different tools can be used. Connecting to a local data model in Power BI Desktop is the most literal interpretation of the term *external tool*. This advanced data model management usage scenario focuses on connecting to a remote data model (a semantic model hosted in the Power BI service) by using the XMLA endpoint. More details on the different ways to use third-party tools are described [later in this article](#third-party-applications-and-tools).

You can achieve connectivity to a data model by using the *[XML for Analysis (XMLA)](/analysis-services/xmla/xml-for-analysis-xmla-reference)* protocol. The XMLA protocol is an industry standard protocol that's supported by more than 25 vendors, including Microsoft. All tools, including [third-party tools](/power-bi/enterprise/service-premium-connect-tools#client-applications-and-tools), that are compliant with the XMLA protocol use Microsoft [client libraries](/power-bi/enterprise/service-premium-connect-tools#client-libraries) to read and/or write data to a data model. Connectivity is achieved with an XMLA endpoint, which is an API exposed by a data model that broadens the development and management capabilities available to semantic model creators.

> [!NOTE]
> This advanced data model management usage scenario is one of the [content management and deployment](powerbi-implementation-planning-usage-scenario-overview.md#content-management-and-deployment-scenarios) scenarios. For a complete list of the self-service usage scenarios, see [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md).
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The focus of this advanced data model management usage scenario is on using [Tabular Editor](#tabular-editor) to manage the data model. You can publish a data model to the Power BI service by using the XMLA endpoint, which is available with Power BI Premium.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

> [!TIP]
> We recommend that you review the [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) usage scenario if you're not familiar with it. The advanced data model management scenario builds upon that scenario.

> [!NOTE]
> Sometimes the terms *semantic model* and *data model* are used interchangeably. Generally, from a Power BI service perspective, it's referred to as *semantic model*. From a development perspective, it's referred to as a *data model* (or *model* for short). In this article, both terms have the same meaning. Similarly, a semantic model creator and a data modeler have the same meaning.

The following diagram depicts a high-level overview of the most common user actions and tools that can help you develop, manage, or optimize data models.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-advanced-data-model-management/usage-scenario-advanced-data-model-management-inline.svg" alt-text="Diagram shows advanced data model management, which is about empowering creators with advanced modeling and publishing capabilities. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-advanced-data-model-management/usage-scenario-advanced-data-model-management-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#advanced-data-model-management) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Model creators develop data models by using Tabular Editor. It's common that the initial design work (like Power Query work) is done in Power BI Desktop before switching to Tabular Editor (not depicted in the scenario diagram). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The data model connects to data from one or more data sources. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Data model development is done in Tabular Editor. Editing of Power Query (M) scripts is supported. Model creators may use C# scripts to accelerate development. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | When ready, semantic model creators publish the data model from Tabular Editor to the Power BI service by using the [XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools) of the target workspace. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The data model is published to a workspace dedicated to storing and securing shared semantic models. Access to the workspace by using the XMLA endpoint is only possible when the workspace [license mode](../collaborate-share/service-create-the-new-workspaces.md#premium-capacity-settings) is set to **Fabric capacity**, **Premium capacity**, **Premium per user**, or **Embedded**. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Report creators create reports by using a [live connection](../connect-data/desktop-report-lifecycle-datasets.md) to the shared semantic model. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Report creators develop reports in Power BI Desktop. Other than purposefully [separating reports from semantic models](report-separate-from-model.md), content creators follow the typical report creation process. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | When ready, report creators publish their Power BI Desktop file (.pbix) or Power BI project file (.pbip) to the Power BI service. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Reports are published to a workspace dedicated to storing and securing reports and dashboards. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Published reports remain connected to the shared semantic model that's stored in a different workspace. Any changes made to the shared semantic model affect all dependent reports. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | [Third-party tools](/power-bi/enterprise/service-premium-connect-tools#client-applications-and-tools) can use the XMLA endpoint to query the shared semantic model. Other XMLA-compliant tools—such as DAX Studio, Semantic Link from Fabric notebooks, or Windows PowerShell—can be used to query or update the shared semantic model. Power BI Desktop, Excel, and Report Builder can also connect by using the XMLA endpoint (not depicted in the scenario diagram). |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Other Microsoft and third-party tools can use the XMLA endpoint to manage the semantic model and provide application lifecycle management. To learn more, see [XMLA endpoint-based client tools](../enterprise/service-premium-connect-tools.md#client-applications-and-tools). |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | Fabric administrators manage the tenant setting to enable the use of the XMLA endpoint. The administrator must [enable the XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools#enable-xmla-read-write) for Fabric capacities, Premium capacities, and Premium Per User settings. |
| ![Item 15.](../media/legend-number/legend-number-15-fabric.svg) | Fabric administrators oversee and monitor activity in the Fabric portal. |

## Key points

The following are some key points to emphasize about the advanced data model management scenario.

### Third-party applications and tools

Enterprise BI teams commonly use client tools, such as Tabular Editor (depicted in the scenario diagram and described in the next topic), to help them manage centralized semantic models. However, any semantic model creator that wants to work with advanced modeling capabilities can take advantage of the methods described in this usage scenario.

There are several ways to use third-party applications:

- **Connect to a remote data model by using the XMLA endpoint:** Some third-party tools can connect directly to a remote data model in the Power BI service (or Analysis Services). Once connected to the XMLA endpoint, all [Tabular Object Model (TOM)](/analysis-services/tom/tom-pbi-datasets) operations are supported. This approach is the primary focus of this usage scenario.
- **Connect to a local data model in Power BI Desktop:** Some third-party tools can connect to a [local data model](../transform-model/desktop-external-tools.md) that's open in Power BI Desktop (not depicted in the scenario diagram). However, there are some [limitations](../transform-model/desktop-external-tools.md#data-modeling-limitations), and not all external tool functionality is officially supported.
- **Connect to a template file in Power BI Desktop:** Some third-party tools distribute their functionality in a lightweight way by using a Power BI Desktop template file (.pbit) (not depicted in the scenario diagram).

### Tabular Editor

[Tabular Editor](https://tabulareditor.com/) is depicted in the scenario diagram. It's a third-party tool that's achieved widespread adoption by the Power BI community. Some advantages of managing tabular data models with Tabular Editor include:

- **Setting up data model capabilities not supported in Power BI Desktop:** Tabular Editor provides an interface to set up object-level security (OLS), calculation groups, perspectives, translations, and partitions.
- **Support for concurrent model development:** Microsoft data model development tools, such as Visual Studio with Analysis Services projects, store the entire data model definition in a *Model.bim* file. This single file can make it difficult for a team of developers to work together on a single data model. Tabular Editor has a feature called *Folder serialization*. Folder serialization deconstructs the Model.bim file into separate object-specific files within an organized folder structure. Different data modelers can then work on different files with less risk of overwriting each other's efforts.
- **Integration with source control:** Folder serialization allows source control system to easily detect data model changes, making source merges and conflict resolution easier to do.
- **Improved data model quality and design:** Tabular Editor integrates with [Best Practices Analyzer (BPA)](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance/). BPA helps data modelers with a set of customizable rules that can improve the quality, consistency, and performance of data models. You can download a set of best practice rules (provided by Microsoft) from [GitHub](https://github.com/microsoft/Analysis-Services/tree/master/BestPracticeRules).
- **Increased productivity when developing data models:** The Tabular Editor interface makes it well-suited for performing batch edits, debugging, and viewing data model dependencies. Tabular Editor is different from Power BI Desktop in that it works in *disconnected mode*. You can make data model changes in disconnected mode and commit them as a batch of edits. Working this way allows for faster development and validation, especially for experienced data modelers. It's also possible to create C# scripts and save them as macros. These scripts can help you to improve the efficiency of managing and synchronizing multiple data models.

### XMLA endpoint

The XMLA endpoint uses the XMLA protocol to expose all features of a tabular data model, including some [data modeling operations](../transform-model/desktop-external-tools.md#data-modeling-operations) that aren't supported by Power BI Desktop. You can use the [TOM API](/analysis-services/tom/tom-pbi-datasets) to make programmatic changes to a data model.

The XMLA endpoint also provides connectivity. You can only connect to a semantic model when the workspace that has its license mode set to **Premium per user**, **Premium per capacity**, or **Embedded**. Once a connection is made, an XMLA-compliant tool can operate on the data model in two ways:

- **Write data and metadata:** Read/write use of the XMLA endpoint allows for:
  - Data modeling capabilities that aren't supported by Power BI Desktop, like object-level security (OLS), calculation groups, perspectives, translations, and partition management.
  - More complex deployments. For example, a partial deployment or a metadata-only deployment that publishes only a single new measure.
  - Asynchronous [semantic model refresh](/power-bi/enterprise/service-premium-connect-tools#semantic-model-refresh). For example, refreshing a single table or partition.
- **Read data and metadata:** Read-only use of the XMLA endpoint allows for:
  - Monitoring, debugging, and tracing semantic models and queries.
  - Allowing third-party data reporting tools to visualize data sourced from a shared semantic model. This technique is a great way to extend the benefits and investments in [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md).

> [!WARNING]
> Once you modify or publish a semantic model by using the XMLA endpoint, you can no longer download it from the Power BI service as a Power BI Desktop file.

### XMLA settings per capacity

Each Power BI Premium capacity and Power BI Embedded capacity has a setting to control whether the XMLA endpoint is read-only, read/write, or off. This setting is also available for all Premium Per User workspaces in the Power BI tenant. [Read/write XMLA access must be enabled](/power-bi/enterprise/service-premium-connect-tools#enable-xmla-read-write) for each capacity that contains semantic models that you want to manage with a tool other than Power BI Desktop.

> [!TIP]
> The XMLA endpoint setting (read/write, read-only, or off) applies to all workspaces and semantic models assigned to a particular capacity. You can set up multiple capacities to decentralize and/or customize how content is managed for each capacity.

### XMLA tenant setting

In addition to the XMLA endpoint settings, a Power BI administrator must use the tenant settings to [allow XMLA endpoints and Analyze in Excel with on-premises semantic models](/power-bi/enterprise/service-premium-connect-tools#security). When enabled, you can allow all users, or specific security groups, to use XMLA endpoint functionality.

> [!NOTE]
> All standard security and data protection features still apply to specify which users can view and/or edit content.

### Third-party tools

Power BI Desktop can handle the end-to-end needs for most self-service content creators. However, third-party tools offer other enterprise features and functionality. For this reason, third-party tools, such as [Tabular Editor](https://tabulareditor.com/), have become prevalent in the Power BI community, especially for advanced content creators, developers, and IT professionals.

> [!TIP]
> This [blog post](https://powerbi.microsoft.com/blog/community-tools-for-enterprise-powerbi-and-analysisservices/) describes how third-party tools allow the Power BI product team to reevaluate their development priorities, increase the reach of the Power BI platform, and satisfy more advanced and diverse requests from the user community.

> [!NOTE]
> Some third-party tools require a paid license, such as Tabular Editor 3. Other community tools are free and open source (such as Tabular Editor 2, DAX Studio, and ALM Toolkit). We recommend that you carefully evaluate the features of each tool, cost, and support model so you can adequately support your community of content creators.

### Data model management

The primary focus of this usage scenario is on the content creator who uses Tabular Editor to manage a data model. For infrequent advanced data model management requirements, like occasional partition management, you might choose to use a tool such as SQL Server Management Studio (SSMS). It's also possible for a .NET developer to create and manage Power BI semantic models by using the TOM API.

> [!TIP]
> When using the XMLA endpoint for data model management, we recommend that you enable the [large semantic model storage format](/power-bi/enterprise/service-premium-large-models) setting. When enabled, the large semantic model storage format can improve XMLA write operation performance.

### Separation of data model and reports

For this usage scenario to be successful, you should [separate reports from the data model](report-separate-from-model.md). This approach results in managing separate Power BI Desktop files as described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario. Even if the same person is responsible for all development, the separation of semantic models and reports is important because Tabular Editor doesn't have an awareness of report content.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a data model is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a live connection or [DirectQuery](../connect-data/desktop-directquery-about.md) semantic model (not depicted in the scenario diagram).

> [!NOTE]
> A centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).
>
> For more information, see [On-premises data gateway (standard mode)](powerbi-implementation-planning-data-gateways.md#on-premises-data-gateway-standard-mode).

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand [activities that connect through XMLA endpoints](/power-bi/enterprise/service-premium-connect-tools#audit-logs).

## Related content

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
