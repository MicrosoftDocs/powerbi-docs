---
title: "Power BI usage scenarios: Self-service data preparation"
description: "Learn how Power BI self-service data preparation is about using dataflows to centralize data cleansing and transformation work."
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI usage scenarios: Self-service data preparation

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

Data preparation (sometimes referred to as ETL, which is an acronym for *Extract, Transform, and Load*) often involves a significant amount of work depending on the quality and structure of source data. The *self-service data preparation* usage scenario focuses on the reusability of data preparation activities by business analysts. It achieves this goal of reusability by relocating the data preparation work from Power Query (within individual Power BI Desktop files) to Power Query Online (using a [Power BI dataflow](../transform-model/dataflows/dataflows-introduction-self-service.md)). The centralization of the logic helps achieve a *single source of the truth* and reduces the level of effort required by other content creators.

Dataflows are created by using [Power Query Online](https://powerquery.microsoft.com/) in one of several tools: the Power BI service, Power Apps, or Dynamics 365 Customer Insights. A dataflow created in Power BI is referred to as an *analytical* dataflow. Dataflows created in Power Apps can either be one of [two types](/power-query/dataflows/understanding-differences-between-analytical-standard-dataflows): *standard* or *analytical*. This scenario only covers using a Power BI dataflow that's created and managed within the Power BI service.

> [!NOTE]
> The self-service data preparation scenario is one of the self-service BI scenarios. For a complete list of the self-service scenarios, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support self-service data preparation. The primary focus is on creating a dataflow in Power Query Online that becomes a source of data for multiple semantic models. The goal is for many semantic models to leverage the data preparation that's done once by the dataflow.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-self-service-data-preparation/usage-scenario-self-service-data-preparation-inline.svg" alt-text="Diagram shows self-service data preparation, which is about dataflows for centralizing data cleansing and transformation work. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-self-service-data-preparation/usage-scenario-self-service-data-preparation-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#self-service-data-preparation) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| Item | Description |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The dataflow creator develops a collection of tables within a Power BI [dataflow](../transform-model/dataflows/dataflows-introduction-self-service.md). For a dataflow that's intended for reuse, it's common (but not required) for the creator to belong to a centralized team that supports users across organizational boundaries (such as IT, enterprise BI, or the Center of Excellence). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The dataflow connects to data from one or more data sources. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. These gateways are used both for authoring the dataflow in Power Query Online, which is a [web-based version of Power Query](/power-query/power-query-what-is-power-query#where-can-you-use-power-query), and refreshing the dataflow. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Dataflows are developed using Power Query Online. The familiar Power Query interface in Power Query Online makes the transition from Power BI Desktop simple. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The dataflow is saved as an item in a workspace that's dedicated to storing and securing dataflows. A dataflow refresh schedule is required to keep the data current (not depicted in the scenario diagram). |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The dataflow can be reused as a data source by content creators, and by other semantic models that could reside in different workspaces. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | The semantic model creator develops a new data model by using Power BI Desktop. The semantic model creator can use the full capabilities of Power Query within Power BI Desktop. They can optionally apply other query steps to further transform the dataflow data or merge the dataflow output. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | When ready, the semantic model creator publishes the Power BI Desktop file (.pbix) that contains the data model to the Power BI service. Refresh for the semantic model is managed separately from the dataflow (not depicted in the scenario diagram). |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Other self-service semantic model creators can create new data models in Power BI Desktop by using the dataflow as a data source. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | In the Admin portal, Power BI administrators can set up [Azure connections](../admin/service-admin-portal-azure-connections.md) to store dataflow data in their Azure Data Lake Storage Gen2 (ADLS Gen2) account. Settings include assigning a tenant-level storage account and enabling workspace-level storage permissions. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Power BI administrators manage settings in the Admin portal. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | By default, dataflows store data using internal storage that's managed by the Power BI service. Optionally, data output by the dataflow can be stored in the organization's [ADLS Gen2](/azure/storage/blobs/data-lake-storage-introduction) account. This type of storage is sometimes called *bring your own data lake*. A benefit of storing dataflow data in the data lake is that it can be accessed and consumed by other BI tools. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Dataflow data in ADLS Gen2 is stored within a Power BI-specific container known as *filesystem*. Within this container, a [folder exists for each workspace](/power-query/dataflows/what-is-the-cdm-storage-structure-for-analytical-dataflows#whats-in-a-dataflow-folder). A subfolder is created for each dataflow, as well as for each table. Power BI generates a snapshot each time the dataflow data is refreshed. Snapshots are self-describing, comprising metadata and data files. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | Azure administrators manage permissions for the organization's ADLS Gen2 account. |
| ![Item 15.](../media/legend-number/legend-number-15-fabric.svg) | Power BI administrators oversee and monitor activity in the Power BI service. |

> [!TIP]
> We recommend that you review the [advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenario too. It builds upon concepts introduced in this scenario.

## Key points

The following are some key points to emphasize about the self-service data preparation scenario.

### Dataflows

A [dataflow](../transform-model/dataflows/dataflows-create.md) comprises a collection of tables (also known as *entities*). All work to create a dataflow is done in [Power Query Online](https://powerquery.microsoft.com/). You can create dataflows in [multiple products](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365#dataflows-can-be-created-in-multiple-microsoft-products), including Power Apps, Dynamics 365 Customer Insights, and Power BI.

> [!NOTE]
> You can't create dataflows in a personal workspace in the Power BI service.

### Support semantic model creators

The scenario diagram depicts using a Power BI dataflow to provide prepared data to other self-service semantic model creators.

> [!NOTE]
> Semantic model use the dataflow as a data source. A report can't connect directly to a dataflow.

Here are some advantages of using Power BI dataflows:

- Semantic model creators use the same familiar Power Query interface found in Power BI Desktop.
- Data preparation and data transformation logic defined by a dataflow can be reused many times because it's centralized.
- When data preparation logic changes are made to the dataflow, it might not require updating dependent data models. Removing or renaming columns, or changing column data types, will require updating dependent data models.
- Pre-prepared data can easily be made available to Power BI semantic model creators. Reuse is particularly helpful for commonly used tables—especially [dimension tables](star-schema.md#star-schema-overview), like date, customer, and product.
- The level of effort required by semantic model creators is reduced because the data preparation work has been *decoupled* from the data modeling work.
- Fewer semantic model creators need direct access to source systems. Source systems can be complex to query and could require specialized access permissions.
- The number of refreshes executed on source systems is reduced because semantic model refreshes connect to dataflows, and not to the source systems from which dataflows extract data.
- Dataflow data represents a snapshot in time, and promotes consistency when used by many semantic models.
- Decoupling data preparation logic into dataflows can help improve semantic model refresh success. If a dataflow refresh fails, semantic models will refresh using the last successful dataflow refresh.

> [!TIP]
> Create dataflow tables by applying [star schema](star-schema.md) design principles. A star schema design is well-suited to creating Power BI semantic models. Also, refine the dataflow output to apply friendly names and use specific data types. These techniques promote consistency in dependent semantic models and helps reduce the amount of work that semantic model creators need to do.

### Semantic model creator flexibility

When a semantic model creator [connects to a dataflow](../transform-model/desktop-connect-dataflows.md) in Power BI Desktop, the creator isn't limited to using the exact dataflow output. They still have the full functionality of Power Query available to them. This functionality is useful if additional data preparation work is required, or the data requires further transformation.

### Dataflow advanced features

There are many design techniques, patterns, and best practices for dataflows that can take them from self-service to enterprise-ready. Dataflows in a workspace that has its workspace type set to **Premium per user**, **Premium capacity**, or **Fabric capacity** can benefit from [advanced features](../transform-model/dataflows/dataflows-premium-features.md).

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

> [!NOTE]
> One of the [advanced features](../transform-model/dataflows/dataflows-premium-features.md) is incremental refresh for dataflows. Although incremental refresh for *semantic models* is a Power BI Pro feature, incremental refresh for dataflows is a Premium feature.
>
> To learn more about dataflow advanced features, see the [advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenario.

### Dataflow and semantic model refresh

As previously mentioned, a dataflow is a source of data for semantic models. In most cases, multiple data refresh schedules are involved: one for the dataflow and one for each semantic model. Alternatively, it's possible to use [DirectQuery from the semantic model to the dataflow](../transform-model/dataflows/dataflows-premium-features.md#use-directquery-with-dataflows-in-power-bi), which is a Premium feature (not depicted in the scenario diagram).

### Azure Data Lake Storage Gen2

In Microsoft Azure, an ADLS Gen2 account is a specific type of Azure Storage account that has the [hierarchical namespace](/azure/storage/blobs/create-data-lake-storage-account) enabled. ADLS Gen2 has [performance, management, and security advantages](/azure/storage/blobs/data-lake-storage-introduction) for operating analytical workloads. By default, Power BI dataflows use internal storage, which is a built-in data lake account managed by the Power BI service. Optionally, organizations can *bring their own data lake* by connecting to their organization's ADLS Gen2 account.

Here are some advantages of using the organization's data lake account:

- The data stored by a Power BI dataflow can (optionally) be accessed from the data lake by other users or processes. That's helpful when dataflow reuse occurs beyond Power BI. For example, the data could be accessed by Azure Data Factory.
- The data in the data lake can (optionally) be managed by other tools or systems. In this case, Power BI could consume the data rather than manage it (not depicted in the scenario diagram).

### Tenant-level storage

The [Azure connections](../admin/service-admin-portal-azure-connections.md) section of the Admin portal includes a setting to configure a connection to an ADLS Gen2 account. Configuring this setting enables *bring your own data lake*. Once set up, you can [set workspaces to use that data lake account](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md#connect-to-an-azure-data-lake-gen-2-at-a-workspace-level).

> [!IMPORTANT]
> Setting [Azure connections](../admin/service-admin-portal-azure-connections.md) does not mean that all dataflows in the Power BI tenant are stored in this account by default. In order to use an explicit storage account (instead of internal storage), each workspace must be specifically connected.
>
> It's critical to set the workspace Azure connections *prior to creating any dataflows* in the workspace. The same Azure storage account is used for [Power BI semantic model backups](../enterprise/service-premium-backup-restore-dataset.md).

### Workspace-level storage

A Power BI administrator can configure a setting to allow workspace-level storage permissions (in the Azure connections section of the Admin portal). When enabled, this setting allows [workspace administrators to use a different storage account](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md#connect-to-an-azure-data-lake-gen-2-at-a-workspace-level) than the one defined at the tenant-level. Enabling this setting is particularly helpful for decentralized business units who manage their own data lake in Azure.

> [!NOTE]
> The [workspace-level storage permission](../admin/service-admin-portal-azure-connections.md) in the Admin portal applies to all workspaces in the Power BI tenant.

### Common Data Model format

The data in an ADLS Gen2 account is stored in the *[Common Data Model (CDM) structure](/power-query/dataflows/what-is-the-cdm-storage-structure-for-analytical-dataflows#what-is-the-common-data-model-storage-structure)*. The CDM structure is a metadata format that dictates how the self-describing schema, as well as the data, is stored. The CDM structure enables semantic consistency in a format that's standardized for sharing data across numerous applications (not depicted in the scenario diagram).

### Publish to separate workspaces

There are several advantages to publishing a dataflow to a [workspace](../collaborate-share/service-new-workspaces.md) that's separate from where the dependent semantic models are stored. One advantage is clarity on who's responsible for managing which types of content (if you have different people handling different responsibilities). Another advantage is that specific workspace permissions can be assigned for each type of content.

> [!NOTE]
> You can't create dataflows in a personal workspace in the Power BI service.
>
> The [advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenario describes how to set up multiple workspaces to provide better flexibility when supporting enterprise-level self-service creators.

### Gateway setup

Typically, an [On-premises data gateway](/power-query/dataflows/using-dataflows-with-on-premises-data) is required for connecting to data sources that reside within a private organizational network or a virtual network.

A data gateway is required when:

- Authoring a dataflow in Power Query Online that connects to private organizational data.
- Refreshing a dataflow that connects to private organizational data.

> [!TIP]
> Dataflows require a centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode*. A gateway in *[personal mode](../connect-data/service-gateway-personal-mode.md)* isn't supported when working with dataflows.

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and adoption. The activity log is also valuable for supporting governance efforts, security audits, and compliance requirements. With a self-service data preparation scenario, it's particularly helpful to track usage of dataflows.

## Related content

In the next article in the series, learn about the [advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenario.
