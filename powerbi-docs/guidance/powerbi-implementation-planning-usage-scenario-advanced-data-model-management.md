---
title: "Power BI usage scenarios: Advanced data model management"
description: "Learn how Power BI advanced data model management is about empowering creators with advanced data modeling and publishing capabilities."
author: peter-myers
ms.author: v-petermyers
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 04/20/2022
---

# Power BI usage scenarios: Advanced data model management

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

As content creators become more experienced, they learn advanced data modeling skills. It's often the case when content creators work with enterprise-grade models or deliver centralized shared datasets as described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario.

This usage scenario focuses on *advanced data model management*, which is when a Power BI content creator uses a third-party tool to design, manage, or debug data models. Use of a third-party tool can occur when authoring models by using *[external tools](../transform-model/desktop-external-tools.md)*, which Power BI Desktop directly supports. Or it can occur after you publish a model by communicating directly with the [XMLA endpoint](../enterprise/service-premium-connect-tools.md).

> [!NOTE]
> Models are hosted in either the Power BI service, Azure Analysis Services (AAS), or SQL Server Analysis Services (SSAS). This usage scenario focuses on using the XMLA endpoint in the Power BI service.

> [!TIP]
> Many people refer to third-party tools as *external tools*. However, there are distinctions in how various tools may be used. Connecting to a local model in Power BI Desktop is the most literal interpretation of the term *external tool*. This advanced data model management usage scenario focuses on connecting to a remote model (hosted in the Power BI service) by using the XMLA endpoint. More details on the different ways to use third-party tools are described [later in this article](#third-party-applications-and-tools).

You can achieve connectivity to a model by using the *[XML for Analysis (XMLA)]([XML for Analysis](/analysis-services/xmla/xml-for-analysis-xmla-reference))* protocol. The XMLA protocol is an industry standard protocol that's supported by more than 25 vendors, including Microsoft. Any tool (including [third-party tools](../admin/service-premium-connect-tools.md#client-applications-and-tools)) that's compliant with the XMLA protocol uses Microsoft [client libraries](../admin/service-premium-connect-tools.md#client-libraries) to read and/or write data to a model. Connectivity is achieved with an XMLA endpoint, which is an API exposed by a data model that broadens the development and management capabilities available to dataset creators.

> [!NOTE]
> This advanced data model management usage scenario is one of the [content management and deployment](powerbi-implementation-planning-usage-scenario-overview.md#content-management-and-deployment-scenarios) scenarios. For a complete list of the self-service usage scenarios, see [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md).
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The focus of this advanced data model management usage scenario is using [Tabular Editor](#tabular-editor) to manage the data model. You can publish a data model to the Power BI service by using the XMLA endpoint, which is available with Power BI Premium.

> [!TIP]
> We recommend that you review the [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) usage scenario if you're not familiar with it. The advanced data model management scenario builds upon that scenario.

> [!NOTE]
> Sometimes the terms *dataset* and *data model* are used interchangeably. Generally, from a Power BI service perspective, it's referred to as *dataset*. From a development perspective, it's referred to as a *data model* (or *model* for short). In this article, both terms have the same meaning. Similarly, a dataset creator and a data modeler have the same meaning.

The following diagram depicts a high-level overview of the most common user actions and tools required to support advanced data model management.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-advanced-data-model-management/usage-scenario-advanced-data-model-management-inline.png" alt-text="Image shows a diagram of advanced data model management, which is about empowering creators with advanced data modeling and publishing capabilities." lightbox="media/powerbi-implementation-planning-usage-scenario-advanced-data-model-management/usage-scenario-advanced-data-model-management-expanded.png" border="false":::

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | Dataset creators develop models by using Tabular Editor. It's common that the initial design work (like Power Query queries) is done in Power BI Desktop before switching to Tabular Editor (not depicted in the scenario diagram). |
| ![Item 2.](media/common/icon-02-red-30x30.png) | The data model connects to data from one or more data sources. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | Data model development is done in Tabular Editor. Editing of Power Query (M) scripts is supported. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | When ready, dataset creators publish the data model from Tabular Editor to the Power BI service by using the [XMLA endpoint](../admin/service-premium-connect-tools.md) of the target workspace. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | The model is published to a workspace dedicated to storing and securing shared datasets. Access to the workspace by using the XMLA endpoint is only possible when the workspace [license mode](../collaborate-share/service-create-the-new-workspaces.md#premium-capacity-settings) is set to **Premium per user**, **Premium per capacity**, or **Embedded**. |
| ![Item 6.](media/common/icon-06-red-30x30.png) | Report authors create reports by using a [live connection](../connect-data/desktop-report-lifecycle-datasets.md) to the shared dataset. |
| ![Item 7.](media/common/icon-07-red-30x30.png) | Report authors develop reports in Power BI Desktop. Other than purposefully [separating reports from datasets](report-separate-from-model.md), content creators follow the typical report creation process. |
| ![Item 8.](media/common/icon-08-red-30x30.png) | When ready, report authors publish their Power BI Desktop file to the Power BI service. |
| ![Item 9.](media/common/icon-09-red-30x30.png) | Reports are published to a workspace dedicated to storing and securing reports and dashboards. |
| ![Item 10.](media/common/icon-10-red-30x30.png) | Published reports remain connected to the shared dataset that's stored in a different workspace. Any changes made to the shared dataset affect all dependent reports. |
| ![Item 11.](media/common/icon-11-red-30x30.png) | [Third-party tools](../admin/service-premium-connect-tools.md#client-applications-and-tools) can use the XMLA endpoint to query the shared dataset. Other XMLA-compliant tools, such as DAX Studio or PowerShell, may be used to query or update the shared dataset. Power BI Desktop, Excel, and Report Builder may also connect by using the XMLA endpoint, if desired (not depicted in the scenario diagram). |
| ![Item 12.](media/common/icon-12-red-30x30.png) | Other Microsoft and third-party tools can use the XMLA endpoint to manage the dataset. These tools include [SQL Server Management Studio (SSMS)](/sql/ssms/sql-server-management-studio-ssms) and [SQL Server Data Tools (SSDT)](/sql/ssdt/sql-server-data-tools). ALM Toolkit can be used to help with application lifecycle management. |
| ![Item 13.](media/common/icon-13-red-30x30.png) | Power BI administrators manage the tenant setting to enable the use of the XMLA endpoint. The administrator must [enable the XMLA endpoint](../admin/service-premium-connect-tools.md#enable-xmla-read-write) for Premium capacities and Premium Per User capacities. |
| ![Item 14.](media/common/icon-14-red-30x30.png) | To connect to data sources that reside within a private organizational network, an On-premises data gateway is required for data refresh. Data refresh is scheduled and managed in the Power BI service. |
| ![Item 15.](media/common/icon-15-red-30x30.png) | Power BI administrators oversee and monitor activity in the Power BI service. |

## Key points

The following are some key points to emphasize about the advanced data model management scenario.

### Third-party applications and tools

Enterprise BI teams commonly use client tools, such as Tabular Editor (depicted in the scenario diagram and described in the next topic), to help them manage centralized datasets. However, any dataset creator that wants to work with advanced modeling capabilities can take advantage of the methods described in this scenario.

There are several ways to use third-party applications:

- **Connect to a remote model by using the XMLA endpoint:** Some third-party tools can connect directly to a remote model in the Power BI service (or Analysis Services). When connecting to the XMLA endpoint, all [Tabular Object Model (TOM)](/analysis-services/tom/tom-pbi-datasets) operations are supported. This approach is the primary focus of this usage scenario.
- **Connect to a local model in Power BI Desktop:** Some third-party tools can connect to a [local model](../transform-model/desktop-external-tools.md) that's open in Power BI Desktop (not depicted in the scenario diagram). However, there are some [limitations](../transform-model/desktop-external-tools.md#data-modeling-limitations), and not all external tool functionality is officially supported.
- **Connect to a template file in Power BI Desktop:** Some third-party tools distribute their functionality in a lightweight way by using a Power BI Desktop template file (.pbit) (not depicted in the scenario diagram).

### Tabular Editor

For advanced data model management, [Tabular Editor](https://tabulareditor.com/) is depicted in this scenario. It's an open-source tool that's achieved widespread adoption by the Power BI community. Some advantages of managing tabular models with Tabular Editor include:

- **Setting up data model capabilities not supported in Power BI Desktop:** Tabular Editor provides an interface for setting up object-level security (OLS), calculation groups, perspectives, translations, and partitions.
- **Support for concurrent model development:** Certain Microsoft model development tools (such as SSDT) store the entire model definition in a *Model.bim* file. This single file makes it difficult for a team of developers to work together on a single model. Tabular Editor has a feature called *Folder serialization*. Folder serialization deconstructs the Model.bim file into separate object-specific files in an organized folder structure. Different data modelers can then work on different files without overwriting each other's efforts.
- **Integration with source control:** Folder serialization allows source control system to easily detect model changes, making source merging and conflict resolution easier to do.
- **Improved data model quality and design:** Tabular Editor integrates with [Best Practices Analyzer (BPA)](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance/). BPA helps data modelers with a set of customizable rules that can improve the quality, consistency, and performance of models. You can download a set of best practice rules (provided by Microsoft) from [GitHub](https://github.com/microsoft/Analysis-Services/tree/master/BestPracticeRules).
- **Increased productivity when developing data models:** The Tabular Editor interface makes it well-suited for performing batch edits, debugging, and viewing model dependencies. Tabular Editor is different from Power BI Desktop in that it works in *disconnected mode*. You can make model changes in disconnected mode and commit them as a batch of updates. Work this way allows for faster development and validation, especially for experienced data modelers. It's also possible to create C# scripts and save them as macros. These scripts can help improve the efficiency of managing and synchronizing multiple data models.

### XMLA endpoint

The XMLA endpoint uses the XMLA protocol to expose all features of a tabular model, including some [data modeling operations](../transform-model/desktop-external-tools.md#data-modeling-operations) that aren't supported by Power BI Desktop. You can use the [TOM API](/analysis-services/tom/tom-pbi-datasets) to make programmatic changes to a data model.

The XMLA endpoint also provides connectivity. For an XMLA endpoint to be available, you must publish the dataset to a workspace that has its license mode set to **Premium per user**, **Premium per capacity**, or **Embedded**. Once a connection is made, an XMLA-compliant tool can operate on the data model in two ways:

- **Write data and metadata:** Read/write usage of the XMLA endpoint allows for:
  - Data modeling capabilities that aren't supported by Power BI Desktop. Examples include OLS, calculation groups, perspectives, translations, and partition management.
  - More complex deployments. For example, a partial deployment or a metadata-only deployment to publish only a single new measure.
  - Asynchronous [dataset refresh](../admin/service-premium-connect-tools.md#dataset-refresh). For example, refreshing a single table or a single partition.
- **Read data and metadata:** Read-only usage of the XMLA endpoint is useful for:
  - Monitoring, debugging, and tracing datasets and queries.
  - Allowing third-party data visualization tools to visualize data sourced from a shared dataset. This technique is a great way to extend the benefits and investments in [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md).

> [!WARNING]
> Once you modify or deploy a dataset by using the XMLA endpoint, you can no longer download it from the Power BI service as a Power BI Desktop file (.pbix).

### XMLA settings per capacity

Each Power BI Premium and Power BI Embedded capacity has a setting to control whether the XMLA endpoint is read-only, read/write, or off. This setting is also available for all Premium Per User workspaces in the Power BI tenant. [Read/write XMLA access must be enabled](../admin/service-premium-connect-tools.md#enable-xmla-read-write) for each capacity that contains datasets that are to be managed by a tool other than Power BI Desktop.

> [!TIP]
> The XMLA endpoint setting (read/write, read-only, or off) applies to all workspaces and datasets assigned to a particular capacity. You may choose to set up multiple capacities to decentralize and/or customize how content is managed for each capacity.

### XMLA tenant setting

In addition to the XMLA endpoint settings (described previously), a Power BI administrator must use the tenant settings to [allow XMLA endpoints and Analyze in Excel with on-premises datasets](../admin/service-premium-connect-tools.md#security). When enabled, it permits all users, or specific security groups, to use XMLA endpoint functionality.

> [!NOTE]
> All standard security and data protection features still apply to specify which users can view and/or edit content.

### Third-party tools

Power BI Desktop alone can handle the end-to-end needs for most self-service content creators. However, third-party tools offer other enterprise features and workflows. For this reason, third-party tools, such as [Tabular Editor](https://tabulareditor.com/), have become prevalent in the Power BI community, especially for advanced content creators, developers, and IT professionals.

> [!TIP]
> This [blog post](https://powerbi.microsoft.com/blog/community-tools-for-enterprise-powerbi-and-analysisservices/) describes how third-party tools allow the Power BI product team to reevaluate their development priorities, increase the reach of the Power BI platform, and satisfy more advanced and diverse requests from the user community.

> [!NOTE]
> Some third-party tools require a paid license, such as Tabular Editor 3. Other community tools are free and open source (such as Tabular Editor 2, DAX Studio, and ALM Toolkit). We recommend that you carefully evaluate the features of each tool, cost, and support model so you can adequately support your community of content creators.

### Data model management

The primary focus of this usage scenario is on the content creator who uses Tabular Editor to manage a data model. For infrequent advanced data model management requirements, like occasional partition management, you might choose to use a tool such as SSMS. It's also possible for a .NET developer to create and manage Power BI datasets by using the TOM API.

> [!TIP]
> When using the XMLA endpoint for data model management, we recommend that you enable the [large dataset storage format](../admin/service-premium-large-models.md) to optimize write operations.

### Separation of model and reports

For this usage scenario to be successful, you should [separate reports from the model](report-separate-from-model.md). This approach results in managing separate Power BI Desktop files as described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario. Even if the same person is responsible for all development, the separation of datasets and reports is important because Tabular Editor doesn't have an awareness of report content.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a data model is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a live connection or [DirectQuery](../connect-data/desktop-directquery-about.md) dataset (not depicted in the scenario diagram).

> [!NOTE]
> A centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](../admin/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-adoption-roadmap-system-oversight.md#auditing) to help them understand [activities that connect through XMLA endpoints](../admin/service-premium-connect-tools.md#audit-logs).

## Next steps

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
