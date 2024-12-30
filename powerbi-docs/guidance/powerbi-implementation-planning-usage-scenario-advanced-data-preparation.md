---
title: "Power BI usage scenarios: Advanced data preparation"
description: "Learn how Power BI advanced data preparation is about improving the reach and reusability of dataflows."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI usage scenarios: Advanced data preparation

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

Data preparation (sometimes referred to as ETL, which is an acronym for _Extract, Transform, and Load_) activities often involve a large effort. The time, skill, and effort involved with collecting, cleaning, combining, and enriching data depends on the quality and structure of source data.

Investing time and effort in centralized data preparation helps to:

- Enhance reusability and gain maximum value from data preparation efforts.
- Improve the ability to provide consistent data to multiple teams.
- Reduce the level of effort required by other content creators.
- Achieve scale and performance.

The _advanced data preparation_ usage scenario expands on the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) scenario. Advanced data preparation is about increasing dataflow reuse by multiple users across various teams and for various use cases.

Separate workspaces, organized by dataflow purpose, are helpful when dataflow output is provided to multiple semantic model creators, especially when they are on different teams in the organization. Separate workspaces are also helpful for managing security roles when the people who create and manage dataflows are different from the people consume them.

> [!NOTE]
> The advanced data preparation scenario is the second of the data preparation scenarios. This scenario builds upon what can be done with centralized dataflows as described in the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) scenario.
>
> The advanced data preparation scenario is one of the self-service BI scenarios. However, a centralized team member can use the techniques in a similar way to what's described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario. For a complete list of the self-service scenarios, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

> [!TIP]
> We recommend that you review the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario if you're not familiar with it. The advanced self-service data preparation scenario builds upon that scenario.

The focus of this advanced data preparation scenario is on:

- The use of separate dataflows based on purpose: staging, transformation, or final. We recommend using _composable building blocks_ to obtain greater reuse, in various combinations, to support specific user requirements. Composable building blocks are described later in this article.
- The use of separate workspaces that support dataflow _creators_ or dataflow _consumers_. Data modelers, who consume dataflows, might be on different teams and/or have different use cases.
- The use of linked tables (also known as _linked entities_), computed tables (also known as _computed entities_), and the enhanced compute engine.

> [!NOTE]
> Sometimes the terms _semantic model_ and _data model_ are used interchangeably. Generally, from a Power BI service perspective, it's referred to as _semantic model_. From a development perspective, it's referred to as a _data model_ (or _model_ for short). In this article, both terms have the same meaning. Similarly, a semantic model creator and a data modeler have the same meaning.

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support the advanced data preparation scenario.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-advanced-data-preparation/usage-scenario-advanced-data-preparation-inline.svg" alt-text="Diagram shows advanced data preparation, which is about improving the reach and reusability of dataflows. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-advanced-data-preparation/usage-scenario-advanced-data-preparation-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#advanced-data-preparation) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| Item | Description |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The dataflow creator develops a collection of tables within a [dataflow](../transform-model/dataflows/dataflows-introduction-self-service.md). For a dataflow that's intended for reuse, it's common (but not required) that the creator belongs to a centralized team that supports users across organizational boundaries (such as IT, enterprise BI, or the Center of Excellence). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The dataflow connects to data from one or more data sources. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. These gateways are used both for authoring the dataflow in Power Query Online and refreshing the dataflow. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | All of the workspaces involved have their license mode set to **Fabric capacity**, **Premium capacity**, **Premium Per User**, or **Embedded**. These license modes allow for the use of linked tables and computed tables across workspaces, which are required in this scenario. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Dataflow creators develop dataflows by using Power Query Online, which is a [web-based version of Power Query](/power-query/power-query-what-is-power-query#where-can-you-use-power-query). |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | A _[staging dataflow](/power-query/dataflows/best-practices-for-dimensional-model-using-dataflows#staging-dataflows)_ is created in a workspace that's dedicated to the centralized management of dataflows. A staging dataflow copies the raw data as-is from the source. Few, if any, transformations are applied. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | A _[transformation dataflow](/power-query/dataflows/best-practices-for-dimensional-model-using-dataflows#transformation-dataflows)_ (also known as a _cleansed dataflow_) is created in the same workspace. It sources data by using [linked table(s)](../transform-model/dataflows/dataflows-create.md#create-a-dataflow-using-linked-tables) to the staging dataflow. [Computed table(s)](../transform-model/dataflows/dataflows-create.md#create-a-dataflow-using-a-computed-table) include transformation steps that prepare, cleanse, and reshape the data. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Dataflow creators have access to manage content in the workspace that's dedicated to the centralized management of dataflows. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | One or more other workspaces exist that are intended to provide access to the final dataflow, which delivers production-ready data to data models. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | The _final dataflow_ is created in a workspace available to data modelers. It sources data by using linked table(s) to the transformation dataflow. Computed table(s) represent the prepared output that's visible to data modelers who are granted the workspace **viewer** role. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Semantic model creators (who consume the dataflow output) have viewer access to the workspace that contains the final dataflow output. Dataflow creators also have access to manage and publish content in the workspace (not depicted in the scenario diagram). |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | Semantic model creators use the _final dataflow_ as a [data source](../transform-model/desktop-connect-dataflows.md) when developing a data model in Power BI Desktop. When ready, the semantic model creator publishes the Power BI Desktop file (.pbix) that contains the data model to the Power BI service (not depicted in the scenario diagram). |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Fabric administrators manage settings in the Admin portal. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | In the Admin portal, Power BI administrators can set up [Azure connections](../admin/service-admin-portal-azure-connections.md) to store dataflow data in their [Azure Data Lake Storage Gen2 (ADLS Gen2)](/azure/storage/blobs/data-lake-storage-introduction) account. Settings include assigning a tenant-level storage account and enabling workspace-level storage permissions. |
| ![Item 15.](../media/legend-number/legend-number-15-fabric.svg) |By default, dataflows store data by using internal storage that's managed by the Power BI service. Optionally, data output by the dataflow can be stored in the organization's ADLS Gen2 account. |
| ![Item 16.](../media/legend-number/legend-number-16-fabric.svg) | Fabric administrators oversee and monitor activity in the Fabric portal. |

## Key points

The following are some key points to emphasize about the advanced data preparation scenario.

### Dataflows

A [dataflow](../transform-model/dataflows/dataflows-create.md) comprises a collection of tables (also known as _entities_). Each table is defined by a query, which contains the data preparation steps required to load the table with data. All work to create a dataflow is done in [Power Query Online](https://powerquery.microsoft.com/). You can create a dataflow in [multiple products](/power-query/dataflows/overview-dataflows-across-power-platform-dynamics-365#dataflows-can-be-created-in-multiple-microsoft-products), including Power Apps, Dynamics 365 Customer Insights, and Power BI.

> [!NOTE]
> You can't create dataflows in a personal workspace in the Power BI service.

### Types of dataflows

Use of _composable building blocks_ is a design principle that allows you to manage, deploy, and secure system components, and then use them in various combinations. Creating modular, self-contained dataflows that are specific to a purpose is a best practice. They help to achieve data reuse and enterprise scale. Modular dataflows are also easier to manage and test.

Three types of dataflows are shown in the scenario diagram: _staging dataflow_, _transformation dataflow_, and _final dataflow_.

#### Staging dataflow

A [staging dataflow](/power-query/dataflows/best-practices-for-dimensional-model-using-dataflows#staging-dataflows) (sometimes called a _data extraction dataflow_) copies raw data as-is from the source. Having the raw data extracted with minimal transformation means that downstream transformation dataflows (described next) can use the staging dataflow as their source. This modularity is useful when:

- Access to a data source is restricted to narrow time windows and/or to a few users.
- Temporal consistency is desired to ensure that all downstream dataflows (and related semantic models) deliver data that was extracted from the data source at the same time.
- Reducing the number of queries submitted to the data source is necessary due to source system restrictions or its ability to support analytical queries.
- A copy of the source data is useful for reconciliation processes and data quality verifications.

#### Transformation dataflow

A [transformation dataflow](/power-query/dataflows/best-practices-for-dimensional-model-using-dataflows#transformation-dataflows) (sometimes called a _cleansed dataflow_) sources its data from linked tables that connect to the staging dataflow. It's a [best practice](/power-query/dataflows/best-practices-reusing-dataflows#separate-data-transformation-dataflows-from-stagingextraction-dataflows) to separate out transformations from the data extraction process.

A transformation dataflow includes all the transformation steps required to prepare and restructure the data. However, there's still a focus on reusability at this layer to ensure the dataflow is suitable for multiple use cases and purposes.

#### Final dataflow

A final dataflow represents the prepared output. Some additional transformations might occur based on the use case and purpose. For analytics, a [star schema](/power-query/dataflows/best-practices-for-dimensional-model-using-dataflows#build-a-star-schema) table (dimension or fact) is the preferred design of the final dataflow.

Computed tables are visible to data modelers that are granted the workspace **viewer** role. This table type is described in the [types of dataflow tables](#types-of-dataflow-tables) topic below.

> [!NOTE]
> Data lakes often have _zones_, like bronze, silver, and gold. The three types of dataflows represent a similar design pattern. To make the best possible data architecture decisions, give thought to who will maintain the data, the expected use of the data, and the skill level required by people accessing the data.

### Workspaces for dataflows

If you were to create all dataflows in a single workspace, it would significantly limit the extent of reusability. Using a single workspace also limits the security options available when supporting multiple types of users across teams and/or for different use cases. We recommend using [multiple workspaces](/power-query/dataflows/best-practices-reusing-dataflows#use-multiple-workspaces). They provide better flexibility when you need to support self-service creators from various areas of the organization.

The two types of workspaces shown in the scenario diagram include:

- **Workspace 1**: It stores [centrally managed dataflows](../transform-model/dataflows/dataflows-develop-solutions.md#create-user-dataflows-with-security-applied) (sometimes referred to as a _backend workspace_). It contains both the staging and transformation dataflows because they're managed by the same people. Dataflow creators are often from a centralized team, such as IT, BI, or the Center of Excellence. They should be assigned to either the workspace **admin**, **member**, or **contributor** role.
- **Workspace 2**: It stores and delivers [the final dataflow output](../transform-model/dataflows/dataflows-develop-solutions.md#create-user-dataflows-with-security-applied) to consumers of the data (sometimes referred to as a _user workspace_). Semantic model creators are often self-service analysts, power users, or citizen data engineers. They should be assigned to the workspace **viewer** role because they only need to [consume the output](/power-query/dataflows/best-practices-reusing-dataflows#set-the-correct-access-levels-on-workspaces) of the final dataflow. To support semantic model creators from various areas of the organization, you can create numerous workspaces like this one, based on use case and security needs.

> [!TIP]
> We recommend reviewing ways to [support semantic model creators](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#support-semantic-model-creators) as described in the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario. It's important to understand that semantic model creators can still use the full capabilities of Power Query within Power BI Desktop. They can choose to add query steps to further transform the dataflow data or merge the dataflow output with other sources.

### Types of dataflow tables

Three types of dataflow tables (also known as _entities_) are depicted in the scenario diagram.

- **Standard table**: Queries an external data source, such as a database. In the scenario diagram, standard tables are depicted in the staging dataflow.
- **[Linked table](/power-query/dataflows/linked-entities)**: References a table from another dataflow. A linked table doesn't duplicate the data. Rather, it allows the reuse of a standard table multiple times for multiple purposes. Linked tables aren't visible to workspace viewers since they inherit permissions from the original dataflow. In the scenario diagram, linked tables are depicted twice:
  - In the transformation dataflow for accessing the data in the staging dataflow.
  - In the final dataflow for accessing the data in the transformation dataflow.
- **[Computed table](/power-query/dataflows/computed-entities)**: Performs additional computations by using a different dataflow as its source. Computed tables allow customizing the output as needed for individual use cases. In the scenario diagram, computed tables are depicted twice:
  - In the transformation dataflow for performing [common transformations](/power-query/dataflows/best-practices-for-dimensional-model-using-dataflows#use-a-computed-entity-as-much-as-possible).
  - In the final dataflow for delivering output to semantic model creators. Since computed tables persist the data again (after the dataflow refresh), data modelers can access the computed tables in the final dataflow. In this case, data modelers should be granted access with the workspace **viewer** role.

> [!NOTE]
> There are many design techniques, patterns, and [best practices](../transform-model/dataflows/dataflows-best-practices.md) that can take dataflows from self-service to enterprise-ready. Also, dataflows in a workspace that has its license mode set to **Premium per user** or **Premium capacity** can benefit from [advanced features](../transform-model/dataflows/dataflows-premium-features.md). Linked tables and computed tables (also known as _entities_) are two advanced features that are essential for increasing the reusability of dataflows.

### Enhanced compute engine

The [enhanced compute engine](../transform-model/dataflows/dataflows-premium-features.md#the-enhanced-compute-engine) is an advanced feature available with Power BI Premium.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

The enhanced compute engine improves performance of linked tables (within the same workspace) that reference (link to) the dataflow. To get [maximum benefit](../transform-model/dataflows/dataflows-premium-features.md) from the enhanced compute engine:

- Split out the staging and transformation dataflows.
- Use the same workspace to store the staging and transformation dataflows.
- Apply complex operations that can [query fold](/power-query/power-query-folding) early in the query steps. Prioritizing foldable operations can help to achieve the best refresh performance.
- Use [incremental refresh](../transform-model/dataflows/dataflows-understand-optimize-refresh.md) to reduce refresh durations and resource consumption.
- Perform testing early and frequently during the development phase.

### Dataflow and semantic model refresh

A dataflow is a source of data for semantic models. In most cases, multiple data refresh schedules are involved: one for each dataflow and one for each semantic model. Alternatively, it's possible to use [DirectQuery from the semantic model to the dataflow](../transform-model/dataflows/dataflows-premium-features.md#use-directquery-with-dataflows-in-power-bi), which requires Power BI Premium and the enhanced compute engine (not depicted in the scenario diagram).

### Azure Data Lake Storage Gen2

An ADLS Gen2 account is a specific type of Azure storage account that has the [hierarchical namespace](/azure/storage/blobs/create-data-lake-storage-account) enabled. ADLS Gen2 has [performance, management, and security advantages](/azure/storage/blobs/data-lake-storage-introduction) for operating analytical workloads. By default, Power BI dataflows use internal storage, which is a built-in data lake account managed by the Power BI service. Optionally, organizations can _bring their own data lake_ by connecting to an ADLS Gen2 account in their organization.

Here are some advantages of using your own data lake:

- Users (or processes) can directly access the dataflow data stored in the data lake. That's helpful when dataflow reuse occurs beyond Power BI. For example, Azure Data Factory could access the dataflow data.
- Other tools or systems can manage the data in the data lake. In this case, Power BI could consume the data rather than manage it (not depicted in the scenario diagram).

When using linked tables or computed tables, make sure that each workspace is assigned to the same ADLS Gen2 storage account.

> [!NOTE]
> Dataflow data in ADLS Gen2 is stored within a Power BI-specific container. This container is depicted in the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario diagram.

### Admin portal settings

There are two important settings to manage in the Admin portal:

- **Azure connections**: The [Azure connections](../admin/service-admin-portal-azure-connections.md) section of the Admin portal includes a setting to set up a connection to an ADLS Gen2 account. This setting allows a Power BI administrator to _bring your own data lake_ to dataflows. Once configured, [workspaces can use that data lake account](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md#connect-to-an-azure-data-lake-gen-2-at-a-workspace-level) for storage.
- **Workspace-level storage**: A Power BI administrator can set workspace-level storage permissions. When enabled, the setting allows [workspace administrators to use a different storage account](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md#connect-to-an-azure-data-lake-gen-2-at-a-workspace-level) to the one set at tenant-level. Enabling this setting is helpful for decentralized business units that manage their own data lake in Azure.

### Gateway setup

Typically, an [On-premises data gateway](/power-query/dataflows/using-dataflows-with-on-premises-data) is required for connecting to data sources that reside within a private organizational network or a virtual network.

A data gateway is required when:

- Authoring a dataflow in Power Query Online that connects to private organizational data.
- Refreshing a dataflow that connects to private organizational data.

> [!TIP]
> Dataflows require a centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in _standard mode_. A gateway in _[personal mode](../connect-data/service-gateway-personal-mode.md)_ isn't supported when working with dataflows.

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and adoption. The activity log is also valuable for supporting governance efforts, security audits, and compliance requirements. In the advanced data preparation scenario, the activity log data is helpful to track the management and use of dataflows.

## Related content

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
