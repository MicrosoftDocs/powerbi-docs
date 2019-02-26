---
title: Deploying and Managing Power BI Premium Capacities
description: Understand the potential of Power BI Premium, and learn how to design, deploy, monitor and troubleshoot scalable solutions.
author: minewiskan
ms.author: owend
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 02/26/2019

LocalizationGroup: Premium
---

# Deploying and Managing Power BI Premium Capacities

**Summary:** Power BI Premium provides more consistent performance, support for large data volumes, and the flexibility of a unified self-service and enterprise BI platform for everyone in your organization. This level 300 technical whitepaper has been written specifically for Power BI administrators, and content authors and publishers. It aims to help them understand the potential of Power BI Premium, and to explain how to design, deploy, monitor and troubleshoot scalable solutions.

**Author:** [Peter Myers](https://www.linkedin.com/in/peterjsmyers) (Data Platform MVP, and independent BI expert with Bitwise Solutions)

**Technical Reviewers:** Adam Saxton, Akshai Mirchandani, Bhavik Merchant, David Magar, Josh Caplan, Michael Blythe, Nimrod Shalit, Olivier Matrat, Swati Gupta

**Applies to:** Power BI service, Power BI Premium and Azure Power BI Embedded capacities

## Introducing Power BI

Power BI is a business analytics service designed to deliver insights that enable fast, informed decisions. Since its release in 2015 it has quickly become a popular service used to deliver solutions for the smallest of organizations to the largest of enterprises.

It is made available in two ways: As a cloud service and as an on-premises reporting solution named **Power BI Report Server**.1 [1](#footnote-01)

Power BI as a cloud service is Software-as-a-Service (SaaS)2 [2](#footnote-02). It represents a set of services and applications that enable organizations to develop, deploy, manage, share solutions to monitor their business.

It is not the intention of this whitepaper to provide a comprehensive description of the Power BI service. Instead, it focuses on topics relevant to the subject of Power BI Premium. For general information about Power BI, refer to the comprehensive [Power BI Documentation](https://docs.microsoft.com/en-us/power-bi/service-admin-premium-multi-geo). For a more detailed explanation of the Power BI service with a focus on achieving well-performing enterprise deployments, refer to the comprehensive [Planning a Power BI Enterprise Deployment](https://aka.ms/pbienterprisedeploy) whitepaper.

Within the context of this whitepaper&#39;s subject, this section introduces and describes capacities, Power BI content types, model storage modes and licensing. An understanding of these topics is essential to successfully deploying and managing Power BI Premium.

### Capacities

**Capacities** are a core Power BI concept representing a set of resources (storage, processor and memory) used to host and deliver Power BI content. Capacities are either shared or dedicated. A **Shared Capacity** is shared with other Microsoft customers, while a **Dedicated Capacity** is fully committed to a single customer. Dedicated capacities are introduced in the Premium Capacities topic.

In shared capacity, workloads run on computational resources shared with other customers. As the capacity must share resources, limitations are imposed to ensure &quot;fair play&quot;, such as the maximum model size (1 GB) and maximum daily refresh frequency (eight times per day).

### Workspaces

Power BI workspaces reside within capacities and they represent security, collaboration and deployment containers. Each Power BI user has a personal workspace known as **My Workspace**. Additional workspaces can be created to enable collaboration and deployment, and these are known as **App Workspaces**. By default, workspaces—including personal workspaces—are created in the shared capacity.

### Power BI Content Types

To introduce Power BI Premium topics, it is important to start with a thorough discussion of Power BI architecture including fundamental content types.

All Power BI content is stored and managed within workspaces which are containers for Power BI content. Each Power BI user has their own personal workspace, but the general best practice is to create app workspaces. App workspaces enable co-ownership of content and the ability to collaborate on content. They also provide the ability to stage and distribute content to wide audiences as apps.

The following Power BI content is stored in workspaces:

- Dataflows
- Datasets
- Workbooks
- Reports
- Dashboards

#### Dataflows

Power BI dataflows help organizations to unify data from disparate sources. They can be considered as data prepared and staged for use in models, however they cannot be used directly as a source for reporting. They leverage the extensive collection of Microsoft data connectors, enabling the ingestion of data from on-premises and cloud-based data sources.

Dataflows can only be created and managed in app workspaces, and they are stored as entities in the Common Data Model (CDM) in Azure Data Lake Storage Gen2. Typically, they are scheduled to refresh on a recurring basis to store up-to-date data.

For further information, refer to the [Self-service data prep in Power BI (Preview)](https://docs.microsoft.com/power-bi/service-dataflows-overview) document.

#### Datasets

Power BI datasets represent a source of data ready for reporting and visualization. There are many types of datasets, created by:

- Connecting to an existing data model which is not hosted in a Power BI capacity
- Uploading a Power BI Desktop file that contains a model
- Uploading an Excel workbook (containing one or more Excel tables and/or a workbook data model) or uploading a Comma-Separated Value (CSV) file
- Using the Power BI service to create a push, streaming or hybrid streaming dataset

Except for streaming datasets3 [3](#footnote-03), the dataset represents a data model which leverages the mature modeling technologies of Analysis Services.

Note that in documentation, sometimes the terminologies datasets and models are interchangeable. Generally, from a Power BI service perspective it is referred to as a **dataset** , and from a development perspective it is referred to as a **model**. In the context of this whitepaper they mean much the same thing.

##### Externally-Hosted Models

Connecting to an externally-hosted model involves installing the [On-Premises Data Gateway](https://docs.microsoft.com/en-us/power-bi/service-gateway-onprem) to connect to SQL Server Analysis Services, whether it is on-premises or VM-hosted Infrastructure-as-a-Service (IaaS). Azure Analysis Services does not require a gateway. This scenario often makes sense when existing model investments exist, typically forming part of the Enterprise Data Warehouse (EDW). It allows Power BI to perform a **Live Connection** (LC) to Analysis Services and does so by enforcing data permissions by using the identity of the Power BI report user. For SQL Server Analysis Services, both multidimensional models (cubes) and tabular models are supported.

![A Live Connection dataset passes queries to externally hosted models](media/whitepaper-premium-deployment/live-connection-dataset.png)

Figure 1.1 —A Live Connection dataset passes queries to externally hosted models

##### Power BI Desktop-Developed Models

Power BI Desktop—a client application intended for Power BI development—can be used to develop a model which is effectively an Analysis Services tabular model. Models can be developed by importing data from dataflows, which can then be integrated with other data sources. While the specifics on how modeling can be achieved is outside the scope of this whitepaper, it is important to understand that there are three different types—or modes—of models that can be developed by using Power BI Desktop. These modes determine whether data is imported into the model, or whether it remains in the data source. The three modes are: Import, DirectQuery, and Composite. A complete discussion of each mode will be covered in the Model Storage Modes topic.

Externally-hosted models and models developed in Power BI desktop can enforce Row-Level Security (RLS) to limit the data that can be retrieved for a certain user. For example, users assigned to the Salespeople security group can only view report data for the sales region(s) to which they are assigned. RLS roles can be dynamic or static. **Dynamic roles** filter by the report user, while **static roles** apply the same filters for all users assigned to the role.

##### Excel Workbook Models

Creating datasets based on Excel workbooks or CSV files will result in the automatic creation of a model. Excel tables and CSV data will be imported to create model tables, while an Excel workbook data model will be transposed to create a Power BI model. In all cases, file data is imported into a model.

Distinctions, then, can be made about Power BI datasets that represent models:

- They are either hosted in the Power BI service, or are externally hosted by Analysis Services
- They can store imported data, or they can issue passthrough query requests to underlying data sources, or a mix of both

Here is a summary of important facts about Power BI datasets that represent models:

- SQL Server Analysis Services hosted models require a gateway to perform LC queries
- Power BI-hosted models that import data
  - Must be fully loaded into memory so that they can be queried
  - Require refresh to keep data current, and must involve gateways when source data is not accessible directly over the Internet
- Power BI-hosted models that use DirectQuery (DQ) storage mode require connectivity to the source data. When the model is queried, Power BI issues queries to the source data to retrieve current data. This mode must involve gateways when source data is not accessible directly over the Internet.
- Models may enforce RLS rules, enforcing filters to limit data access to certain users

To successfully deploy and manage Power BI Premium, it is important to understand where models are hosted, their storage mode, any dependencies on gateways, size of imported data, and refresh type and frequency. These can all have a significant impact on the Power BI Premium resources. In addition, the model design itself including its data preparation queries and calculations can add to the mix of considerations.

It is also important to understand that Power BI-hosted import models can refresh according to schedule or be triggered on-demand by a user in the Power BI service.

Designing optimized models is discussed later in this technical paper in the Optimizing Models topic.

#### Workbooks

Power BI workbooks are a Power BI content type4 [4](#footnote-04). They are Excel workbooks that have been uploaded to the Power BI service, and should not be confused with uploaded Excel workbooks that create datasets (models). The workbook content type represents a connection to a workbook, which could either be uploaded to the Power BI service or remain in cloud storage on OneDrive or SharePoint Online.

It is important to understand that this content type is not available as a data source for Power BI data visualizations. Instead, it can be opened as a workbook in the Power BI service by using Excel Online. The main intention of this content type is to allow legacy Excel workbook reports to be accessible from within the Power BI service, and to allow its data visualizations to be pinned to Power BI dashboards.

For further information, refer to the [Get data from Excel workbook files](https://docs.microsoft.com/power-bi/service-excel-workbook-files) document.

#### Reports

There are two types of reports: Power BI reports and paginated reports.

**Power BI reports** provide an interactive data visualization experiences which connects to only a single dataset. Reports are often designed to encourage user participation allowing them to interact with an extraordinary array of capabilities, including filtering, slicing, cross filtering and highlighting, drilling up, drilling down, drilling through, Q&amp;A natural language questioning, focusing, page navigation, spotlighting, viewing bookmarks, and more.

In the context of this whitepaper, it is important to understand how the Power BI architecture, Power BI report design and user interactions can all impact on the Power BI service resources:

- To load and interact with reports based on import models, the model must be fully loaded into memory (whether hosted in the Power BI service or hosted externally)
- Each report visual issues a query to retrieve data by querying the model
-
Generally, filter and slicer interactions involve querying the model. For example, changing a slicer selection will—by default—require reloading each visual on the page5 [5](#footnote-05)
- Power BI reports do not guarantee displaying current data, and may require the user to refresh the report to reload the report page and its visuals
- Users can engage with the Q&amp;A natural language feature to ask questions, providing the Power BI report design permits it and the dataset represents a Power BI-hosted data import model or a LC dataset configured to enable Q&amp;A

**Paginated reports** allowing the publication and rendering of SQL Server Reporting Services (SSRS) reports (\*.rdl format). As their name suggests, paginated reports are commonly used when requirements dictate a need for printing to a fixed page size, or when there are variable lists of data that must be fully expanded. For example, an invoice designed for multi-page rendering (rather than scrolling within a visual) and printing.

The two supported report types provide choice for report authors, allowing them to select the type based on requirements and intended use. Generally, Power BI reports are ideal for interactive experiences allowing the user to explore and discover insights from data, while paginated reports are better suited to parameter-driven page layouts.

Regardless of report type, achieving responsive report load and data updates (when filters or parameters are changed) is imperative to delivering a reliable and well-performing user experience.

#### Dashboards

Power BI dashboards are intended to deliver monitoring experiences and are conceptually very different from Power BI reports. Dashboards are designed for display on a single pane of glass to express values and data visualizations in tiles. Generally, dashboards offer fewer interaction experiences than Power BI reports, with some dashboard designs expecting no interaction. For example, an unattended dashboard presented on a non-touch screen in a server room. Another significant difference is that dashboards may present tiles that source data from multiple datasets, while a Power BI report can only ever be based on a single dataset.

It is important to understand that a dashboard is designed to load quickly and to express the most current data (known to the Power BI service) at all times. It achieves this by caching tile query results, and it does this for each dashboard. In fact, it must do this for each user that has access to a dashboard that is based on models that enforce dynamic RLS.

The Power BI service automatically updates dashboard query caches immediately after Power BI-hosted import models are refreshed. In the case of LC and DQ models, the dataset owner has a degree of control over how often the Power BI service updates the cache, which can be configured as frequently as every 15 minutes, or as infrequently as once a week. Note that LC query cache updates will first query model metadata to determine whether a model refresh has taken place since the last cache update, and it will not proceed to update the cache when a refresh has not since occurred. This check is not possible for DQ models, and so cache updates will happen whether the source data has changed or not.

Dashboard query cache updates based on DQ and LC models can significantly impact on both Power BI service resources and external data sources. Consider a dashboard with 20 tiles, all based on an Azure Analysis Services model that enforces dynamic RLS and that is refreshed every hour, and that this dashboard is shared with 100 users. If the dataset is configured to refresh every hour, this would result in at least 2000 (20 x 100) LC queries. This could place an enormous load on the Power BI service and external data sources, and it could also exceed limits imposed on available resources. Capacity resources and limits are described in the Capacity Nodes topic.

Users can interact with a dashboard in various ways, which require Power BI service resources. Specifically, they can:

- Trigger a refresh of dashboards tiles, which can result in an on-demand refresh of all related Power BI-hosted data import models
- Engage with the Q&amp;A natural language feature to ask questions (providing the dashboard design permits it and the dataset is a Power BI-hosted data import model or a LC dataset configured to enable Q&amp;A)
- Use the Quick Insights feature to have Power BI discover insights from an underlying dataset, and respond with visuals that display and describe them (providing that the tile is based on a dataset that is Power BI-hosted data import model)
- Configure alerts on dashboard tiles, requiring the Power BI service to compare thresholds to tile values—possibly as frequently as hourly—and to notify users when thresholds are exceeded (providing that the tile displays a single numeric value and is based on a dataset that is Power BI-hosted data import model)

### Model Storage Modes

Recall that Power BI Desktop allows developing a model in one of three modes. It is important to understand the rationale for each data model storage mode and possible impacts on Power BI service resources. This section introduces all three modes. These will be discussed in further detail later in this whitepaper in the Optimizing Models topic.

#### Import Mode

Import mode is the most common mode used to develop models because of the extremely fast performance associated with in-memory querying, the design flexibility available to modelers, and support for specific Power BI service capabilities (Q&amp;A, Quick Insights, etc.). It is the default mode when creating a new Power BI Desktop solution.

It is important to understand that imported data is always stored to disk and must be fully loaded into memory to be queried or refreshed. Once in memory, import models achieve blazingly fast query results. It is also important to understand that there is no concept of an import model being partially loaded into memory.

When refreshed, data is compressed and optimized and then stored to disk by the VertiPaq storage engine. When loaded from disk into memory, it is possible to see 10x compression, and so it is reasonable to expect that 10 GB of source data can compress to about 1 GB in size. Storage size on disk can achieve a 20% reduction on top this.6 [6](#footnote-06)

Design flexibility can be achieved in three ways. Data modelers can:

- Integrate data by caching data from multiple data sources—regardless of data source type and format
- Leverage the entire set of Power Query Formula Language (informally referred to as M) functions when creating data preparation queries
- Leverage the entire set of Data Analysis Expressions (DAX) functions when enhancing the model with business logic, achieved with calculated columns, calculated tables and measures

![An Import model can integrate data from any number of supported data source types](media/whitepaper-premium-deployment/ import-model.png)

Figure 1.2 —An Import model can integrate data from any number of supported data source types

However, while there are compelling advantages associated with import models, there are disadvantages too:

- The entire model must be loaded to memory before Power BI can query the model, which can place pressure on available resources as the number and size of models grow
- Model data is only as current as the latest refresh, and so import models need to be refreshed, preferably on a scheduled basis
- A full refresh will remove all data from all tables and reload it from the data source. This can be very expensive in terms of time and resources for the Power BI service and the data source(s). Power BI does have support for incremental refresh which can avoid truncating and reloading entire tables, and this is covered in the Optimizing Power BI-Hosted Models topic.

From a Power BI service resource perspective, import models require:

- Sufficient memory to load the model when it is queried or refreshed
- Processing resources and additional memory resources to refresh data

#### DirectQuery Mode

Models developed in DirectQuery (DQ) mode do not import data. Instead, they consist only of metadata that when queried issues native queries to the underlying data source.

![A DirectQuery model issues native queries to the underlying data source](media/whitepaper-premium-deployment/direct-query-model.png)

Figure 1.3 —A DirectQuery model issues native queries to the underlying data source

There are two main reasons to consider developing a DQ model. The first reason is when data volumes are too large—even when data reduction methods are applied—to load into a model or practically refresh. The second reason is when reports and dashboards need to deliver &quot;near real-time&quot; data, beyond what can be achieved within scheduled refresh limits (48 times a day for a dedicated capacity).

There are several advantages associated with DQ models:

- Import model size limits do not apply
- Models do not require refresh
- Report users will see the latest data when interacting with report filters and slicers, and can refresh the entire report to retrieve current data
- Dashboard tiles, when based on DQ models, can update automatically as frequently as every 15 minutes

However, there are numerous disadvantages and limitations associated with DQ models:

-
The model must be based on a single supported data source, and therefore any data integration must already be achieved in the data source. Supported data sources are relational and analytic systems, with support for many popular data stores7 [7](#footnote-07).
- Performance can be slow, potentially negatively impacting on the Power BI service (queries can be very CPU-intensive) and on the data source (which may not be optimized for analytic queries)
- Power Query queries cannot be overly complex, and are limited to M expressions and functions that can be transposed to native queries understood by the data source
- DAX functions are limited to those that can be transposed to native queries understood by the data source, and there is no support for calculated tables or built-in Time Intelligence capabilities
- By default, model queries that require retrieval of more than one million rows will fail
- Reports and dashboards with multiple visuals can display inconsistent results, especially when the data source is volatile
- Q&amp;A and Quick Insight are not supported

From a Power BI service resource perspective, DQ models require:

- Minimal memory to load the model (metadata only) when it is queried
- Sometimes significant processor resources to generate and process queries sent to the data source

For further information, refer to the [Use Direct Query in Power BI Desktop](https://docs.microsoft.com/power-bi/desktop-use-directquery) document.

#### Composite Mode

Models developed in Composite mode allow configuring the storing mode for individual model tables. It therefore supports a mix of import and DQ tables. It also supports calculated tables (defined with DAX) and multiple DQ data sources.

Table storage mode can be configured as Import, DirectQuery or Dual. A table configured as Dual storage mode is both Import and DirectQuery, and this allows the Power BI service to determine the most efficient mode to use on a query by query basis.

![A Composite model is a combination of Import and DQ storage modes, configured at table level](media/whitepaper-premium-deployment/composite-model.png)

Figure 1.4 —A Composite model is a combination of Import and DQ storage modes, configured at table level

Composite models strive to deliver the best of Import and DirectQuery modes. When configured appropriately they can combine high query performance of in-memory models with the ability to retrieve near real-time data from data sources.

Data modelers who develop Composite models are likely to configure dimension-type tables in Import or Dual storage mode and fact-type tables in DirectQuery mode. For example, consider a model with a Product dimension-type table in Dual mode and a Sales fact-type table in DirectQuery mode. The Product table could be efficiently and quickly queried from in-memory to render a report slicer. The Sales table could then be queried in DirectQuery mode joined to the related Product table. The latter query could enable the generation of a single efficient native query to join Product and Sales tables and filtering by the slicer values.

In general, the advantages and disadvantages, associated with each model mode can be considered to apply to table storage mode in Composite models.

For further information, refer to the [Use composite models in Power BI Desktop](https://docs.microsoft.com/power-bi/desktop-composite-models) document.

### Licensing

Power BI has three licenses:

- Power BI Free
- Power BI Pro
- Power BI Premium

The **Power BI Free** license allows an individual to sign in to the Power BI service and work within their personal workspace by publishing models and reports. It is important to understand that it is not possible to share Power BI content by using this license. This license, as its name suggests, is free.

The **Power BI Pro** license allows an individual to create and collaborate within app workspaces and share and distribute Power BI content. They can also configure refresh for their datasets to automatically keep data current, including from on-premises data sources. In addition, they can audit and govern how data is accessed and used. This license is required to receive shared content from others unless the user is associated with a Power BI Premium dedicated capacity.

The **Power BI Premium** license is a tenant-level license, and it is discussed in the Introducing Power BI Premium section.

For further information about Power BI licensing, refer to the [Power BI Pricing](https://powerbi.microsoft.com/pricing/) page.

## Introducing Power BI Premium

Power BI Premium delivers a unified self-service and enterprise BI platform with scale, dependable performance, and predictable costs. It primarily achieves this by providing dedicated resources to run the Power BI service for your organization.

In addition, Power BI Premium delivers many enterprise features:

- Cost-effective content distribution, enabling the sharing of Power BI content to unlimited Power BI Free users, including external users
-
Support for larger dataset sizes8 [8](#footnote-08)
- Higher refresh rates of dataflows and datasets (up to 48 times per day)
- Incremental refresh of dataflows and datasets
- Dataflow linked entities, and parallel execution of transforms
- Paginated reports
- Power BI Report Server, for on-premises reporting
- Ability to embed content in apps on behalf of app users (PaaS)

Many of these features can be leveraged to deliver efficient and scalable enterprise solutions and are covered in the Optimizing Premium Capacities section.

### Subscriptions and Licensing

Power BI Premium is a tenant-level Office 365 subscription available in two SKU (Stock-Keeping Unit) families:

- **EM** SKUs (EM1-EM3) for embedding, requiring a yearly commitment, billed monthly
- **P** SKUs (P1-P3) for embedding and enterprise features, requiring a monthly or yearly commitment, billed monthly, and includes a license to install Power BI Report Server on-premises

An alternative approach is to purchase an Azure Power BI Embedded subscription which has a single SKU family: **A** SKUs (A1-A6) for embedding and capacity testing purposes only.

All SKUs deliver v-cores to create capacities9 [9](#footnote-09), but the EM SKUs are restricted for smaller scale embedding. While the focus of this whitepaper is on the P SKUs, much of what is discussed is also relevant also to the A SKUs.

In contrast to the Premium subscription SKUs, Azure SKUs require no time commitment and are billed hourly. They deliver full elasticity enabling scale up, scale down, pause, resume and delete.

Azure Power BI Embedded is largely out of scope for this whitepaper, but it is discussed in the Testing Approaches topic as a practical and economic option to test and measure workloads.

For further information about the Azure SKUs, refer to the [Azure Power BI Embedded Documentation](https://docs.microsoft.com/azure/power-bi-embedded/).

Power BI Premium subscriptions are purchased by administrators in the Office 365 Admin Center. Specifically, only Office 365 Global Administrators or Billing Administrators can purchase SKUs.

Once purchased, the tenant receives a corresponding number of v-cores to assign to capacities—this is known as **v-core pooling**. For example, purchasing a P3 SKU provides the tenant with 32 v-cores.

For further information, refer to the [How to purchase Power BI Premium](https://docs.microsoft.com/power-bi/service-admin-premium-purchase) document.

### Premium Capacities

In contrast to a shared capacity where workloads run on computational resources shared with other customers, a **dedicated capacity** is for exclusive use by an organization. It is isolated with dedicated computational resources which provide dependable and consistent performance for hosted content.

The focus of this whitepaper is **Premium capacity** , meaning it is associated with any of the EM or P SKUs.

#### Capacity Nodes

As described in the Subscriptions and Licensing topic, there are two Power BI Premium SKU families: EM and P. All Power BI Premium SKUs are available as capacity nodes, with each representing a set amount of resources consisting of processor, memory and storage. In addition to resources, each SKU has operational limits on the number of DirectQuery (DQ) and Live Connection (LC) connections per second and the number of parallel model refreshes.

Processing is achieved by a set number of v-cores, divided equally between backend and frontend.

**Backend v-cores** are responsible for core Power BI functionality, including query processing, cache management, running R services, model refresh, natural language processing (Q&amp;A), and server-side rendering of reports and images. Backend v-cores are assigned a fixed amount of memory which is primary used to host models which are also referred to as active datasets.

**Frontend v-cores** are responsible for the web service, dashboard and report document management, access rights management, scheduling, APIs, uploads and downloads, and generally for everything relating to the user experiences.

Storage is set to 100 TB per capacity node.

The resources and limits of each Premium SKU (and equivalently sized A SKU) are described in the following table.

[TABLE 1: Capacity nodes]

#### Capacity Workloads

Capacity workloads are services made available to users. By default, Premium and Azure capacities support only a dataset workload associated with running Power BI queries which cannot be disabled.

Additional workloads can be enabled for paginated reports and dataflows. Each additional workload requires configuring the maximum memory (as a percentage of total available memory) that can be used by the workload.

#### How Capacities Function

At all times, the Power BI service strives to make the best use of capacity resources while not exceeding limits imposed on the capacity.

Capacity operations are classified as either interactive or background. Interactive operations include rendering requests and responding to user interactions (filtering, Q&amp;A querying, etc.). Generally, import model querying is memory resource-intensive, while querying LC/DQ models is CPU-intensive. Background operations include dataflow and import model refreshes, and dashboard query caching.

It is important to understand that interactive operations are always prioritized over background operations to ensure the best possible user experience. If there are insufficient resources, background operations are added to a queue for processing when resources free up. Background operations, like dataset refreshes, can be stopped mid-process by the Power BI service and added to a queue.

Import models must be fully loaded into memory so that they can be queried or refreshed. The Power BI service manages memory usage by using sophisticated algorithms to ensure maximum use of available memory, and can achieve overcommitting the capacity: While it is possible for a capacity to store many import models (up to 100 TB per Premium capacity), when their combined disk storage exceeds the supported memory (and additional memory is required for querying and refresh), then they cannot all be loaded into memory at the same time.

Import models are therefore loaded into—and removed from—memory according to usage. An import model is loaded when it is queried (interactive operation) and not yet in memory, or when it is to be refreshed (background operation).

The removal of a model from memory is known as **eviction** , and it is an operation that Power BI can perform quickly depending on the size of the models. If the capacity is not experiencing any memory pressure, models are simply loaded into memory and remain there.10 [10](#footnote-10) However, when insufficient memory is available to load a model, the Power BI service will first need to free up memory. It frees up memory by detecting models that have become inactive by seeking models which have not been used in the last three minutes11 [11](#footnote-11), and then evicting them. If there are no inactive models to evict, the Power BI service seeks to evict models loaded for background operations. A last resort, after 30 seconds of failed attempts
# 11

#
[11](#footnote-11), is to fail the interactive operation. In this case, the report user is gracefully notified of failure with a suggestion to try again shortly.

It is important to stress that dataset eviction is a normal and expected behavior. It strives to maximize memory usage by loading and unloading models whose combined sizes can exceed available memory. This is by design, and completely transparent to report users. High eviction rates do not necessarily mean the capacity is insufficiently resourced. They can, however, become a concern if query or refresh responsiveness is suffering because of high eviction rates.

Refreshes of import models are always memory intensive as models must be loaded into memory and additional memory is required for the processing. A full refresh can use approximately double the amount of memory required by the model. This ensures that the model can be queried even when being processed (queries are sent to the existing model, until the refresh has completed, and the new model data is available). Note, incremental refresh will require less memory and could complete faster, and so can substantially reduce pressure on capacity resources. Refreshes can also be CPU-intensive for models, especially those with complex Power Query transformations, or calculated tables/columns that are complex or are based on large tables.

Refreshes—like queries—require that the model be loaded into memory. If there is insufficient memory, the Power BI service will attempt to evict inactive models, and if this is not possible (as all models are active), the refresh job is queued. Refreshes are typically very CPU-intensive, even more so than queries. For this reason, there are capacity limits on the number of concurrent refreshes, set to 1.5 x the number of backend v-cores, rounded up. If there are too many concurrent refreshes, a scheduled refresh will be queued. When these situations occur, it takes longer for the refresh to complete. Note that on-demand refreshes (triggered by a user request or API call) will retry three times

# 11

#
[11](#footnote-11), and then fail if there are still not enough resources.
## Managing Power BI Premium

Managing Power BI Premium involves purchasing subscriptions, and creating, managing and monitoring Premium capacities.

### Creating and Managing Capacities

The **Capacity Settings** page of the **Power BI Admin** Portal displays the number of v-cores purchased and available (i.e. yet to be assigned to a capacity) and lists Premium capacities. The page allows Office 365 Global Administrators or Power BI service administrators to create Premium capacities from available v-cores, or to modify existing Premium capacities.

When creating a Premium capacity, the administrator is required to define:

- Capacity name (unique within the tenant)
- Capacity admin(s)
- Capacity size
-
Region for data residency12 [12](#footnote-12)

At least one Capacity Admin must be assigned. Users assigned as Capacity Admins can:

- Assign workspaces to the capacity
- Manage user permissions, to add additional Capacity Admins or users with assignment permissions (to enable them to assign workspaces to the capacity)
- Manage workloads, to configure maximum memory usage for paginated reports and dataflows workloads
-
Restart the capacity, to reset all operations in case of system overload13 [13](#footnote-13)

Capacity Admins cannot access workspace content (unless explicitly assigned workspace permissions) and they do not have access to all Power BI admin areas (unless explicitly assigned) such as usage metrics, audit logs or tenant settings. Importantly, Capacity Admins do not have permissions to create new capacities or scale existing capacities. Also, they are assigned on a per capacity-basis, ensuring that they can only view and manage capacities to which they are assigned.

Capacity size must be selected from an available list of SKU options which is constrained by the number of available v-cores in the pool. It is possible to create multiple capacities from the pool which could be sourced from one or more purchased SKUs. For example, a P3 SKU (32 v-cores) could be used to create three capacities: one P2 (16 v-cores), and two P1 (2 x 8 v-cores). Improved performance and scale may be achieved by creating smaller sized capacities, and this topic is discussed in the Optimizing Premium Capacities section.

![An example setup for the fictitious Contoso organization](media/whitepaper-premium-deployment/contoso-organization-example.png)

Figure 3.1 —An example setup for the fictitious Contoso organization consisting of five Premium capacities (3 x P1, and 2 x P3) with each containing app workspaces, and several workspaces in shared capacity.

A Premium capacity can be assigned to a region other than the home region of the Power BI tenant

# 12
, providing administrative control over which datacenters (within defined geographic regions) Power BI content resides.
# 12

Power BI service administrators and Office 365 Global Administrators can modify Premium capacities. Specifically, they can:

- Change the capacity size to scale up or scale down resources. However, it is not possible to downgrade a P SKU to an EM SKU, or upgrade vice versa.
- Add or remove Capacity Admins
- Add or remove users that have assignment permissions
- Add or remove additional workloads
- Change regions

Assignment permissions are required to assign a workspace to a specific Premium capacity. The permissions can be granted to the entire organization, specific users or groups.

By default, Premium capacities support workloads associated with running Power BI queries. It also supports two additional workloads: **Paginated Reports** and **Dataflows**. Each workload requires configuring the maximum memory (as a percentage of total available memory) that can be used by the workload. It is important to understand that increasing maximum memory allocations can impact on the number of active models that can be hosted, and the throughput of refreshes.

Memory is dynamically allocated to dataflows, but it is statically allocated to paginated reports. The reason for statically allocating the maximum memory is that paginated reports runs within a secured contained space of the capacity. Care should be taken when setting paginated reports memory as it reduces available memory for loading models.

[TABLE 2: Memory usage]

Deleting a Premium capacity is possible and will not result in the deletion of its workspaces and content. Instead, it will move any assigned workspaces to shared capacity. When the Premium capacity was created in a different region, the workspace will be moved to shared capacity of the home region.

### Assigning Workspaces to Capacities

Workspaces can be assigned to a Premium capacity in the **Power BI Admin**  **Portal** or—for an app workspace—in the **Workspace** pane.

Capacity Admins, as well as Office 365 Global Administrators or Power BI service administrators, can bulk assign workspaces in the **Power BI Admin**  **Portal**. Bulk assigned can apply to:

- **Workspaces by users** : All workspaces owned by those users, including personal workspaces, are assigned to the Premium capacity. This will include the re-assignment of workspaces when they are already assigned to a different Premium capacity. In addition, the users are also assigned workspace assignment permissions.

- **Specific workspaces**
-
 **The entire organization&#39;s workspaces** : All workspaces, including personal workspaces, are assigned to the Premium capacity. In addition, all current and future users are assigned workspace assignment permissions.14 [14](#footnote-14)

A workspace can be added to a Premium capacity by using the **Workspace** pane providing the user is both a workspace admin and has assignment permissions.

![Using the Workspace pane to assign a workspace to a Premium capacity](media/whitepaper-premium-deployment/assign-workspace-capacity.png)

Figure 3.2 —Using the **Workspace** pane to assign a workspace to a Premium capacity

Workspace admins can remove a workspace from a capacity (to shared capacity) without requiring assignment permission. Removing workspaces from dedicated capacities effectively relocates the workspace to shared capacity. Note that removing a workspace from a Premium capacity may have negative consequences resulting, for example, in shared content becoming unavailable to Power BI Free licensed users, or the suspension of scheduled refresh when they exceed the allowances supported by shared capacities.

In the Power BI service, a workspace assigned to a Premium capacity is easily identified by the diamond icon which adorns the workspace name.

![Identifying a workspace assigned to a Premium capacity](media/whitepaper-premium-deployment/premium-diamond-icon.png)

Figure 3.3 —Identifying a workspace assigned to a Premium capacity

### Monitoring Capacities

Monitoring Premium capacities provides administrators with an understanding of how the capacities are performing. Capacities can be monitored by using the **Power BI Admin**  **Portal** or the **Power BI Premium Capacity Metrics** (Power BI) app.

#### Power BI Admin Portal

The **Power BI Admin**  **Portal** allows monitoring of four summary tiles which report on loads placed on the capacity resources. The four summary tiles are:

- **CPU** : Number of times CPU exceeded 80% utilization
- **Memory Thrashing** : Number of times exceeded 80%, representing memory pressure on the backend v-cores. Specifically, it is a measure of how many times a dataset was evicted from memory due to memory pressure and the demand for more active datasets.
- **Memory Usage** : Average memory usage (in GB)
- **Direct Query** : Number of times DQ and LC queries—measured per second—exceeded 80% of the limit

![Four summary tiles used to monitor capacity resources](media/whitepaper-premium-deployment/resource-summary-tiles.png)

Figure 3.4 —Four summary tiles used to monitor capacity resources.

Tile values are calculated over an hourly time window to indicate how many hours in the past seven days corresponded to the metric threshold. It is important to understand that exceeding a threshold is not necessarily a dire situation, but possibly an indication of performance degradation.

By clicking on a summary tile, it is possible to clickthrough to a report to view the metric as a line chart over the past seven days. The data presented in the chart is a summary of hourly results that can help you to determine a general understanding of what was taking place at a specific hour.

The monitoring capabilities in the **Power BI Admin** Portal are basic and are designed to provide a quick understanding of key system metrics. For more detailed monitoring, it is recommended that you use the **Power BI Premium Capacity Metrics** app.

#### Power BI Premium Capacity Metrics App

The **Power BI Premium Capacity Metrics** app is a Power BI app available to Capacity Admins and is installed like any other Power BI app15 [15](#footnote-15). It contains a dashboard and report.

![Power BI Premium Capacity Metrics app](media/whitepaper-premium-deployment/capacity-metrics-app.png)

Figure 3.5 —Power BI Premium Capacity Metrics app

When the app opens, the dashboard is loaded to present numerous tiles expressing an aggregated view over all capacities of which the user is a Capacity Admin. The dashboard layout includes five main sections:

1. **Overview** : App version, number of capacities and workspaces
2. **System Summary** : Memory and CPU metrics
3. **Dataset Summary** : Number of datasets, DQ/LC, refresh and query metrics
4. **Dataflow Summary** : Number of dataflows, and dataset metrics
5. **Paginated Report Summary** : Refresh and view metrics

The underlying report (from which the dashboard tiles were pinned) can be accessed by clicking on any dashboard tile. It provides a more detailed perspective of each of the dashboard sections and supports interactive filtering. Filtering can be achieved by setting slicers by date range, capacity, workspace and workload (report, dataset, dataflow), and by selecting elements within report visuals to cross filter the report page. Cross filtering is a powerful technique to narrow down to specific time periods, capacities, workspaces, datasets, etc. and can be very helpful when performing root cause analysis.

The report consists of the following six pages:

1. **Filters** : Enables setting filters which are applied to all report pages. Button selection reveals slicers appropriate for each of the three workloads: Datasets, paginated reports or dataflows. Slicer selection can allow narrowing focus to specific time periods, capacities, workspaces, and content (datasets, paginated reports or dataflows). It is recommended that you filter the report to one capacity at a time.
2. **Datasets** : Displays detailed metrics on dataset health. Button selection reveals different perspectives: Summary, Refreshes, Query Durations, Query Waits and Datasets
3. **Paginated Reports** : Displays detailed metrics on paginated report health
4. **Dataflows** : Displays detailed metrics on dataflow health
5. **System** : Displays overall capacity metrics, including memory and CPU utilization
6. **Display Names and IDs** : Displays names, IDs, and owners for capacities, workspaces and workloads

The reports pages include different perspectives accessible by clicking buttons. Report visuals allow monitoring metrics over time to compare them against system resource usage.

This whitepaper will not describe each page and perspective. Instead, it lists the metrics available in the report together with their purpose. The report presents many pages and visuals based on the following metrics, first by resource:

[TABLE 3: Resource metrics]

The following are workload-related metrics:

[TABLE 4: Workload metrics]

[TABLE 4 FOOTNOTES]

Average refresh wait time (lag between the scheduled time and start time) in minutes16 [16](#footnote-16)

Average size (in MB) of datasets in memory17 [17](#footnote-17)

Monitor memory metrics18 [18](#footnote-18), and eviction counts19 [19](#footnote-19)

Monitor dataset query metrics20 [20](#footnote-20)

Monitor CPU utilization21 [21](#footnote-21), query wait times, and DQ/LC utilization22 [22](#footnote-22)

[END TABLE 4 FOOTNOTES]

The app is likely to undergo frequent version updates. For up to date information, refer to the [Monitor Power BI Premium and Power BI Embedded capacities](../../C:%5CUsers%5CPeterMyers%5CAppData%5CLocal%5CMicrosoft%5CWindows%5CINetCache%5CContent.Outlook%5CFVRFPI2U%5C%E2%80%A2%09https:%5Cdocs.microsoft.com%5Cpower-bi%5Cservice-admin-premium-monitor-capacity) document.

#### Interpreting Metrics

Metrics should be monitored to establish a baseline understanding of resource usage and workload activity. If the capacity becomes slow, it is important to understand which metrics to monitor, and the conclusions you can make.

Ideally, queries should complete within a second to deliver responsive experiences to report users and enable higher query throughput. It is usually of lesser concern when background processes—including refreshes—take longer times to complete.

In general, slow reports can be an indication of an over-heating capacity. When reports fail to load, this is an indication of an over-heated capacity. In either situation, the root cause could be attributable to many factors, including:

- **Failed queries** certainly indicate memory pressure, and that a model could not be loaded into memory. The Power BI service will attempt to load a model for 30 seconds before failing.

- **Excessive query wait times** can be due to several reasons:
  - The need for the Power BI service to first evict model(s) and then load the to-be-queried model (recall that higher dataset eviction rates alone are not an indication of capacity stress, unless accompanied by long query wait times that indicate memory thrashing)
  - Model load times (especially the wait to load a large model into memory)
  - Long running queries
  - Too many LC\DQ connections (exceeding capacity limits)
  - CPU saturation
  - Complex report designs with an excessive number of visuals on a page (recall that each visual is a query)
- **Long query durations** can indicate that model designs are not optimized, especially when multiple datasets are active in a capacity, and just one dataset is producing long query durations. This suggests that the capacity is sufficiently resourced, and that the in-question dataset is sub-optimal or just slow. Long running queries can be problematic as they can block access to resources required by other processes.
- **Long refresh wait times** indicate insufficient memory due to many active models consuming memory, or that a problematic refresh is blocking other refreshes (exceeding parallel refresh limits).

A more detailed explanation of how to use the metrics is covered next in the Optimizing Premium Capacities section.

## Optimizing Premium Capacities

When Premium capacity performance issues arise, a common first approach is to optimize or tune already-deployed solutions to restore acceptable response times. The overriding rationale is to avoid purchasing additional Premium capacity unless it can be justified.

When additional Premium capacity is required, there are two options which will be discussed later in this section:

- Scale up the Premium capacity
- Add a new Premium capacity

Finally, testing approaches and Premium capacity sizing will conclude this section.

### General Best Practices

When striving to achieve best utilization and performance there are some best practices which can be taken on board as general recommendations. These include:

- Using app workspaces instead of personal workspaces
-
Separating business critical and Self-Service BI (SSBI) into different capacities

 ![](data:image/*;base64,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hgvW2IR7/PHHQ7ZwtpRTCAgBIVA0AjrLrmgIRUAICAEhIASKRkBn2RUNoQgIASEgBIRASAjIZRcSkCIjBISAEBACxSEgg1QcfsotBISAEBACISEggxQSkCIjBISAEBACxSEgg1QcfsotBISAEBACISEggxQSkCIjBISAEBACxSEgg1QcfsotBISAEBACISEggxQSkCIjBISAEBACxSEgg1QcfsotBISAEBACISEggxQSkCIjBISAEBACxSEgg1QcfsotBISAEBACISEggxQSkCIjBISAEBACxSEgg1QcfsotBISAEBACISEggxQSkCIjBISAEBACxSEQj+snli9fvnDhwgU8/3xn4T/fXr58WXX1ujXV1dVr1/O3ZcvW4kBQbiFQawjUq1e3WdPG/DVvtmOz5i3a7tS6au/vdN72VFVVtW3bttY4q9WC16xZ8+yzzy785ztLP1m0bOmHS5d9tmz558tWrK5VphJYeLs2Ldq1bd2eS9V23q39LmhcFVejNW/evFaqyvUT0TVIy5YtmzVr1uxZz8966fnPP19ZtVujzh02VnXcXLVr/fY71W2241d/9TXNqxX1UaFhILB5S53qL7a6v6Wfbl34weYFH2xZ+EmLhUvWtm7duvsRR3frfnT37t3dTYxhFBtRGh9++OGzT0955uknZv75tZ5HtN63anP7/9nY7uv12n297rZPzHdEOY8jW4zkl322ZdvfVj6Xfrbl7fdbPvviimO+e8gJJ/0Yy9SxY8dy1iuKBmnFihWTHn1o0qQ/LFiwuNtBO3bbf123Axvs27l+OXFRWUIgIgi8tWDz7L9tmv3mDrP/uvZ/O+/R6/Rzevfu3aZNm4iwFyIbzzzzzG2/uX7hwsU9u9Y//vCtPbs23KGxjE+IAAcltW791mkvb3x29sZpr9avqup0xVU3nnDCCUEzF5cuWgZp0qRJkx8dN33my72Oa97rmI3HdmlYXO2UWwgkCoEZczZOnr5h8owtPXoc1av3WVimZFRv7ty5I2657oMl7wzqu6V3j0bJqFQyajFp+oYRE+rtutueV1wz4tBDDy11paJikCZMmPD7u25r2eSzPidsOq1HwyaNNDIqtehFP64IfLlh6+PTN058tsnKL5pefOm1ffv2jWtN6tRhYfi239z4/MznBvXdekHvxvGtSLI5v2fS+hEPbjnm2BOuuOp6FplK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)

![](media/whitepaper-premium-deployment/.png)

- If sharing content only with Power BI Pro users, there may be no need to store the content in a dedicated capacity
- Use dedicated capacities when looking to achieve a specific refresh time, or when specific features are required, for example large datasets or paginated reporting

### Addressing Common Questions

Optimizing Power BI Premium deployments is a complex topic involving an understanding of workload requirements, available resources and their effective use.

This topic addresses seven common support questions, describing possible issues and explanations, and information on how to identify and resolve them.

#### Why is the capacity slow, and what can I do?

There are many reasons that can contribute to a slow Premium capacity. This question requires further information to understand what is meant by slow. Are reports slow to load? Or are they failing to load? Are report visuals slow to load or update when users interact with the report? Are refreshes taking longer to complete than expected, or previously experienced?

Having gained an understanding of the reason, you can then begin to investigate. Responses to the following six questions will help you to address more specific issues.

#### What content is using up my capacity?

You can use the **Power BI Premium Capacity Metrics** app to filter by capacity, and review performance metrics for workspace content. It is possible to review the performance metrics and resource usage by hour for the past seven days for all content stored within a Premium capacity. This is often the first step to take when troubleshooting a general concern about Premium capacity performance.

Key metrics to monitor include:

- Average CPU and high utilization count
- Average Memory and high utilization count, and memory usage for specific datasets, dataflows and paginated reports
- Active datasets loaded in memory
- Average and maximum query durations
- Average query wait times
- Average dataset and dataflow refresh times

Additionally, in the Power BI Premium Capacity Metrics App, active memory shows the total amount of memory allocated to a report that cannot be evicted because it is in use in the last three minutes. A high spike in refresh wait time could be correlated with a large and/or active dataset.

The &quot;Top 5 by Average Duration&quot; chart highlights the top five datasets, paginated reports and dataflows consuming capacity resources. Content in the top five lists are candidates for investigation and possible optimization.

#### Why are reports slow?

[Table 5: slow reports]

#### Why are reports not loading?

When reports fail to load it is a worst-case scenario, and a sure sign that the capacity has insufficient memory and is over-heated. This can occur when all loaded models are being actively queried and so cannot be evicted, and any refresh operations have been paused or delayed. The Power BI service will attempt to load the dataset for 30 seconds, and the user is gracefully notified of the failure with a suggestion to try again shortly.

Currently there is no metric to monitor for report loading failures. You can identify the potential for this issue by monitoring system memory, specifically highest utilization and time of highest utilization. High dataset evictions and long dataset refresh average wait time could suggest that this issue is occurring.

If this happens only very occasionally, this may not be considered a priority issue. Report users are informed that the service is busy and that they should retry after a short time. If this happens too frequently, the issue can be resolved by scaling up the Premium capacity or by assigning the content to a different capacity.

Capacity Admins (and Power BI service administrators) can monitor the **Query Failures** metric to determine when this happens. They can also restart the capacity, resetting all operations in case of system overload.

#### Why are refreshes not starting on schedule?

Scheduled refresh start times are not guaranteed. Recall that the Power BI service will always prioritize interactive operations over background operations. Refresh is a background operation that can occur when two conditions are met:

- There is sufficient memory
- The number of supported concurrent refreshes for the Premium capacity is not exceeded

When the conditions are not met, the refresh is queued until the conditions are favorable.

For a full refresh, recall that at least double the current dataset memory size is required. If sufficient memory is not available, then the refresh cannot commence until model eviction frees up memory—this means delays until one or more datasets becomes inactive and can be evicted.

Recall that the supported number of maximum concurrent refreshes is set to 1.5 times the backend v-cores, rounded up.

A scheduled refresh will fail when it cannot commence before the next scheduled refresh is due to commence. An on-demand refresh triggered manually from the UI will attempt to run up to three times before failing.

Capacity Admins (and Power BI service administrators) can monitor the **Average Refresh Wait Time (minutes)** metric to determine average lag between the scheduled time and the start of the operation.

While not usually an administrative priority, to influence on-time data refreshes, ensure that sufficient memory is available. This may involve isolating datasets to capacities with known sufficient resources. It is also possible that admins could coordinate with dataset owners to help stagger or reduce scheduled data refresh times to minimize collisions. Note that it is not possible for an administrator to view the refresh queue, or to retrieve dataset schedules.

#### Why are refreshes slow?

Refreshes can be slow—or perceived to be slow (as the previous common question addresses).

When the refresh is in fact slow, it can be due to several reasons:

- Insufficient CPU (refresh can be very CPU-intensive)
- Insufficient memory, resulting in refresh pausing (which requires the refresh to start over when conditions are favorable to recommence)
- Non-capacity reasons, including data source system responsiveness, network latency, invalid permissions or gateway throughput
- Data volume—a good reason to configure incremental refresh, as discussed below

Capacity Admins (and Power BI service administrators) can monitor the **Average Refresh Duration (minutes)** metric to determine a benchmark for comparison over time, and the **Average Refresh Wait Time (minutes)** metrics to determine average lag between average lag between the scheduled time and the start of the operation.

Incremental refresh can significantly reduce data refresh duration, especially for large model tables. There are four benefits associated with incremental refresh:

- **Refreshes are faster** : Only a subset of a table needs loading, reducing CPU and memory usage, and parallelism can be higher when refreshing multiple partitions
- **Refreshes occur only when required** : Incremental refresh policies can be configured to load only when data has changed
- **Refreshes are more reliable** : Shorter running connections to volatile data source systems are less susceptible to disconnection
- **Models remain trim** : Incremental refresh policies can be configured to automatically remove history beyond a sliding window of time

For further information, refer to the [Incremental refresh in Power BI Premium](https://docs.microsoft.com/power-bi/service-premium-incremental-refresh) document.

#### Why are data refreshes not completing?

When the data refresh commences but fails to complete, it can be due to several reasons:

- Insufficient memory, even if there is only one model in the Premium capacity, i.e. the model size is very large
- Non-capacity reasons, including data source system disconnection, invalid permissions or gateway error

Capacity Admins (and Power BI service administrators) can monitor the **Refresh Failures due to out of Memory** metric.

### Optimizing Models

Optimal model design is crucial to delivering an efficient and scalable solution. However, it is beyond the scope of this whitepaper to provide a complete discussion. Instead, this section will provide key areas for consideration when optimizing models.

#### Optimizing Power BI-Hosted Models

Optimizing models hosted in a Premium capacity can be achieved at the data source(s) and model layers.

Consider the optimization possibilities for an Import model:

![Optimization possibilities for an Import model](media/whitepaper-premium-deployment/import-model-optimizations.png)

Figure 4.1 —Optimization possibilities for an Import model

At the data source layer:

- Relational data sources can be optimized to ensure the fastest possible refresh by pre-integrating data, applying appropriate indexes, defining table partitions that align to incremental refresh periods, and materializing calculations (in place of calculated model tables and columns) or adding calculation logic to views
- Non-relational data sources can be pre-integrated with relational stores
- Ensure that gateways have enough resources, preferably on dedicated machines, with sufficient network bandwidth and in close proximity to the data sources

At the model layer:

- Power Query query designs can minimize or remove complex transformations and especially those that merge different data sources (data warehouses achieve this during their Extract-Transform-Load stage). Also, ensuring that appropriate data source privacy levels are set, this can avoid requiring Power BI to load full results to produce a combined result across queries.
- The model structure determines the data to load and has a direct impact on the model size. It can be designed to avoid loading unnecessary data by removing columns, removing rows (especially historic data) or by loading summarized data (at the expense of loading detailed data). Dramatic size reduction can be achieved by removing high cardinality columns (especially text columns) which do not store or compress very efficiently.
- Model query performance can be improved by configuring single direction relationships unless there is a compelling reason to allow bi-directional filtering. Consider also using the CROSSFILTER function instead of bi-directional filtering.
- Aggregation tables can achieve fast query responses by loading pre-summarized data, however this will increase the size of the model and result in longer refresh times. Generally, aggregation tables should be reserved for very large models or Composite model designs.
- Calculated tables and columns increase the model size and result in longer refresh times. Generally, a smaller storage size and faster refresh time can be achieved when the data is materialized or calculated in the data source. If this is not possible, using Power Query custom columns can offer improved storage compression.
- There may be opportunity to tune DAX expressions for measures and RLS rules, perhaps rewriting logic to avoid expensive formulas
- Incremental refresh can dramatically reduce refresh time and conserve memory and CPU. The incremental refresh can also be configured to remove historic data keeping model sizes trim.
- A model could be redesigned as two models when there are different and conflicting query patterns. For example, some reports present high-level aggregates over all history, and can tolerate 24 hours&#39; latency. Other reports are concerned with today&#39;s data and need granular access to individual transactions. Rather than design a single model to satisfy all reports, create two models optimized for each requirement.

Consider the optimization possibilities for a DirectQuery model. As the model issues query requests to the underlying data source, data source optimization is critical to delivering responsive model queries.

 ![Optimization possibilities for a DirectQuery model](media/whitepaper-premium-deployment/direct-query-model-optimizations.png)

Figure 4.2 — Optimization possibilities for a DirectQuery model

At the data source layer:

- The data source can be optimized to ensure the fastest possible querying by pre-integrating data (which is not possible at the model layer), applying appropriate indexes, defining table partitions, materializing summarized data (with indexed views), and minimizing the amount of calculation. The best experience is achieved when passthrough queries need only filter and perform inner joins between indexed tables or views.
- Ensure that gateways have enough resources, preferably on dedicated machines, with sufficient network bandwidth and in close proximity to the data source

At the model layer:

- Power Query query designs should preferably apply no transformations—otherwise attempt to keep transformations to an absolute minimum
- Model query performance can be improved by configuring single direction relationships unless there is a compelling reason to allow bi-directional filtering. Also, model relationships should be configured to assume referential integrity is enforced (when this is the case) and will result in data source queries using more efficient inner joins (instead of outer joins).
- Avoid creating Power Query query custom columns or model calculated column—materialize these in the data source, when possible
- There may be opportunity to tune DAX expressions for measures and RLS rules, perhaps rewriting logic to avoid expensive formulas

Consider the optimization possibilities for a Composite model. Recall that a Composite model enables a mix of import and DirectQuery tables.

![Optimization possibilities for a Composite model](media/whitepaper-premium-deployment/composite-model-optimizations.png)

Figure 4.3 — Optimization possibilities for a Composite model

- Generally, the optimization topics for Import and DirectQuery models apply to Composite model tables that use these storage modes.
- Typically, strive to achieve a balanced design by configuring dimension-type tables (representing business entities) as Dual storage mode and fact-type tables (often large tables, representing operational facts) as DirectQuery storage mode. Dual storage mode means both Import and DirectQuery storage modes, and this allows the Power BI service to determine the most efficient storage mode to use when generating a native query for passthrough.
- Ensure that gateways have enough resources, preferably on dedicated machines, with sufficient network bandwidth and in close proximity to the data sources
- Aggregations tables configured as Import storage mode can deliver dramatic query performance enhancements when used to summarize DirectQuery storage mode fact-type tables. In this case, aggregation tables will increase the size of the model and increase refresh time, and often this is an acceptable tradeoff for faster queries.

#### Optimizing Externally-Hosted Models

Many optimization possibilities discussed in the Optimizing Power BI-Hosted Models topic apply also to models developed with Azure Analysis Services and SQL Server Analysis Services. Clear exceptions are certain features which are not currently supported, including Composite models and aggregation tables.

An additional consideration for externally-hosted datasets is the database hosting in relation to the Power BI service. For Azure Analysis Services, this means creating the Azure resource in the same region as the Power BI tenant (home region). For SQL Server Analysis Services, for IaaS, this means hosting the VM in the same region, and for on-premises, it means ensuring an efficient gateway setup.

As an aside, it may be of interest to note that Azure Analysis Services databases and SQL Server Analysis Services tabular databases require that their models be loaded fully into memory and that they remain there at all times to support querying. Like the Power BI service, there needs to be sufficient memory for refreshing if the model must remain online during the refresh. Unlike the Power BI service, there is no concept that models are automatically aged in and out of memory according to usage. Power BI Premium, therefore, offers a more efficient approach to maximize model querying with lower memory usage.

### Capacity Planning

The size of a Premium capacity determines its available memory and processor resources and limits imposed on the capacity. The number of Premium capacities is also a consideration, as creating multiple Premium capacities can help isolate workloads from each other. Note that storage is 100 TB per capacity node, and this is likely to be more than sufficient for any workload.

Determining the size and number of Premium capacities can be challenging, especially for the initial capacities you create. The first step when capacity sizing is to understand the average workload representing expected day-to-day usage. It is important to understand that not all workloads are equal. For example—at one end of a spectrum—100 concurrent users accessing a single report page that contains a single visual is easily achievable. Yet—at the other end of the spectrum—100 concurrent users accessing 100 different reports, each with 100 visuals on the report page, is going to make very different demands of capacity resources.

Capacity Admins will therefore need to consider many factors specific to your environment, content and expected usage. The overriding objective is to maximize capacity utilization while delivering consistent query times, acceptable wait times, and eviction rates. Factors for consideration can include:

- **Model size and data characteristics** : Import models must be fully loaded into memory to allow querying or refreshing. LC/DQ datasets can require significant processor time and possibly significant memory to evaluate complex measures or RLS rules. Memory and processor size, and LC/DQ query throughput are constrained by the capacity size.
- **Concurrent active models** : The concurrent querying of different import models will deliver best responsiveness and performance when they remain in memory. There should be sufficient memory to host all heavily-queried models, with additional memory to allow for their refresh.
- **Import model refresh** : The refresh type (full or incremental), duration and complexity of Power Query queries and calculated table/column logic can impact on memory and especially processor usage. Concurrent refreshes are constrained by the capacity size (1.5 x backend v-cores, rounded up).
- **Concurrent queries** : Many concurrent queries can result in unresponsive reports when processor or LC/DQ connections exceeds the capacity limit. This is especially the case for report pages that include many visuals.
- **Dataflows and paginated reports:** The capacity can be configured to support dataflows and paginated reports, with each requiring a configurable maximum percentage of capacity memory. Memory is dynamically allocated to dataflows, but it is statically allocated to paginated reports.

In addition to these factors, Capacity Admins can consider creating multiple capacities. Multiple capacities allow for the isolation of workloads and can be configured to ensure priority workloads have guaranteed resources. For example, two capacities can be created to separate business-critical workloads from self-service BI (SSBI) workloads. The business-critical capacity can be used to isolate large corporate models providing them with guaranteed resources, with authoring access granted only to the IT department. The SSBI capacity can be used to host a growing number of smaller models, with access granted to business analysts. The SSBI capacity may at times experience query or refresh waits that are tolerable.

Over time, Capacity Admins can balance workspaces across capacities by moving content between workspaces, or workspaces between capacities, and by scaling capacities up or down. Generally, to host larger models you scale up and for higher concurrency you scale out.

Recall that purchasing a license provides the tenant with v-cores. The purchase of a **P3** subscription can be used to create one, or up to four Premium capacities, i.e. 1 x P3, or 2 x P2, or 4 x P1. Also, before upsizing a P2 capacity to a P3 capacity, consideration can be given to splitting the v-cores to create two P1 capacities.

### Testing Approaches

Once a capacity size is decided, testing can be performed by creating a controlled environment. A practical and economic option is to create an Azure (A SKUs) capacity, noting that a P1 capacity is the same size as an A4 capacity, with the P2 and P3 capacities the same size as the A5 and A6 capacities, respectively. Azure capacities can be created quickly and are billed on an hourly basis. So, once testing is complete, they can be easily deleted to stop accruing costs.

The test content can be added to the workspaces created on the Azure capacity, and then as a single user can run reports to generate a realistic and representative workload of queries. If there are import models, a refresh for each model should be performed also. Monitoring tools can then be used to review all metrics to understand resource utilization.

It is important that the tests are repeatable: Tests should be run several times and they should deliver approximately the same result each time. An average of these results can be used to extrapolate and estimate a workload under true production conditions.

To generate a stress test, consider developing a load testing application to simulate a realistic workload. The specifics of how to achieve this are outside the scope of this whitepaper. For further information including a code sample, refer to the [Load Testing Power BI Applications with Visual Studio Load Test](https://blogs.msdn.microsoft.com/charles_sterling/2018/04/04/webinar-load-testing-power-bi-applications-with-visual-studio-load-test/) webinar.

## Exploring Real-World Scenarios

In this section, several real-world scenarios will be introduced to describe common issues or challenges, how to identify them, and how to help resolve them:

- Keeping datasets up to date
- Identifying slow-responding datasets
- Identifying causes for sporadically slow-responding datasets
- Determining whether there is enough memory
- Determining whether there is enough CPU

The steps, along with chart and table examples are from the **Power BI Premium Capacity Metrics App** (app) that a Power BI administrator will have access to.

### Keeping Datasets Up to Date

In this scenario, an investigation was triggered when users complained that report data sometimes appeared to be old or &quot;stale&quot;.

In the app, the admin interacts with the **Refreshes** visual, sorting datasets by the **Max Wait Time** statistics in descending order. This helps them reveal the datasets that have the longest wait times, grouped by workspace name.

![Dataset refreshes sorted by descending max wait time, grouped by workspace](media/whitepaper-premium-deployment/dataset-refreshes.png)

Figure 5.1 – Dataset refreshes sorted by descending max wait time, grouped by workspace

In addition, in the **Hourly Average Refresh Wait Times** visual, they notice that the refresh wait times peak consistently around 4PM each day.

![Refresh waits peak periodically at 4:00PM](media/whitepaper-premium-deployment/peak-refresh-waits.png)

Figure 5.2 – Refresh waits peak periodically at 4:00PM

There are several possible explanations for these results:

- Too many refresh attempts could be taking place at the same time, exceeding the limits imposed by the capacity node (six concurrent refreshes on a P1 with default memory allocation)

- Datasets to be refreshed may be too large to fit into available memory (requiring at least 2x the memory required for full refresh)
- Inefficient Power Query logic may be resulting in a memory usage spike during dataset refresh. On a busy capacity this can occasionally reach the physical limit, failing the refresh and potentially affecting other report view operations on the capacity.
- Frequently queried datasets that need to stay in memory may affect the ability of other datasets to refresh, due to limited available memory

To help investigate this, the Power BI administrator can look for:

- Low available memory at the time of data refresh, when available memory is less than 2x the size of the dataset to be refreshed
- Datasets that were not being refreshed and were not in memory prior to a refresh, yet which started to show interactive traffic during heavy refresh times. To see which datasets were loaded into memory at any given time a Power BI administrator can look at the datasets area of **Datasets** tab in the app and cross filter to a given time by clicking on one of the bars in the **Hourly Loaded Dataset Counts**. A local spike (shown in Figure 3) indicates an hour when multiple datasets were loaded into memory, which may delay start of scheduled refreshes
- Increased dataset evictions taking place when data refreshes are scheduled to start, indicating there was high memory pressure caused by serving too many different interactive reports prior to the time of refresh. The **Hourly Dataset Evictions and Memory Consumption** visual can clearly indicate spikes in evictions.

![A local spike in loaded datasets suggests interactive querying delayed start of refreshes](media/whitepaper-premium-deployment/hourly-loaded-dataset-counts.png)

Figure 5.3 – A local spike in loaded datasets suggests interactive querying delayed start of refreshes. Selecting a time period in the **Hourly Loaded Dataset Counts** visual will cross filter the **Dataset Sizes** visual.

The Power BI administrator can attempt to resolve the issue by taking steps to ensure that sufficient memory is available for data refreshes to start by:

- Contacting dataset owners and asking them to stagger and space out data refresh schedules
- Reducing dataset query load by removing unnecessary dashboards or dashboard tiles, especially those that enforce row-level security
- Speeding up data refreshes by optimizing Power Query logic, model calculated columns or tables, reducing dataset sizes, or configuring larger datasets to perform incremental data refresh

### Identifying Slow-Responding Datasets

In this scenario, an investigation was triggered when users complained that certain reports took a long time to open, and at times would hang.

In the app, the Power BI administrator can use the **Query Durations** visual to determine the worst performing datasets by sorting datasets by descending **Average Duration**. This visual also shows dataset query counts, so you can see how often the datasets are queried.

![Revealing worst performing datasets](media/whitepaper-premium-deployment/worst-performing-datasets.png)

Figure 5.4 – Revealing worst performing datasets

The Power BI administrator can refer to the **Query Duration Distribution** visual, which shows an overall distribution of bucketed query performance (\&lt;= 30ms, 0-100ms, etc.) for the filtered time period. Generally, queries that take one second or less are considered responsive by most users; queries that take longer tend to create a perception of bad performance.

The **Hourly Query Duration Distribution** visual allows the Power BI administrator to identify one-hour periods when the capacity performance could have been perceived as poor. The larger the bar segments that represent query durations over one second, the larger the risk that users will perceive poor performance.

The visual is interactive, and when a segment of the bar is selected, the corresponding **Query Durations** table visual on the report page is cross-filtered to show the datasets it represents. This cross-filtering allows the Power BI administrator to easily identify which datasets are responding slowly.

![Filtered Hourly Query Duration Distributions visual shows the worse performing datasets](media/whitepaper-premium-deployment/hourly-query-duration-distributions.png)

Figure 5.5 – Filtered **Hourly Query Duration Distributions** visual shows the worse performing datasets in one-hour buckets

Once the poor performing dataset in a specific 1-hour timespan is identified, the Power BI administrator can investigate whether poor performance is caused by an overloaded capacity, or due to a poorly designed dataset or report. To achieve this, they can refer to the **Query Wait Times** visual, and sort datasets by descending average query wait time. If a large percentage of queries are waiting, a high demand for the dataset is likely the cause of the many query waits. If the average query wait time is substantial (\&gt; 100ms), it may be worth reviewing the dataset and report to see if optimizations can be made. For example, perhaps fewer visuals on given report pages or a DAX expression optimization.

![The Query Wait Times visual helps to reveal poorly performing datasets](media/whitepaper-premium-deployment/query-wait-times.png)

Figure 6 – The **Query Wait Times** visual helps to reveal poorly performing datasets

There are several possible reasons for query wait time build up in datasets:

- A sub-optimal model design, measure expressions, or even report design—all circumstances that can contribute to long running queries that consume high levels of CPU. This forces new queries to wait until CPU threads become available and can create a convoy effect (think traffic jam), commonly seen during peak business hours. The **Query Waits** page will be the main resource to determine whether datasets have high average query wait times.
- A high number of concurrent capacity users (hundreds to thousands) consuming the same report or dataset. Even well-designed datasets can perform badly beyond a concurrency threshold. This is usually indicated by a single dataset showing a dramatically higher value for query counts than other datasets show (i.e. 300K queries for one dataset compared to \&lt;30K queries for all other datasets). At some point the query waits for this dataset will start to stagger, and this will be seen in the **Query Durations** visual.
- Many disparate datasets queried concurrently, causing thrashing as datasets frequently cycle in and out of memory. This results in users experiencing slow performance when the dataset is loaded into memory. To confirm this, the Power BI administrator can refer to the **Hourly Dataset Evictions and Memory Consumption** visual, which may indicate that a high number of datasets loaded into memory are being repeatedly evicted.

### Identifying Causes for Sporadically Slow-Responding Datasets

In this scenario, an investigation was triggered when users described that report visuals sometimes felt slow to respond or could become unresponsive, but at other times they were acceptably responsive.

Within the app, the **Query Durations** section was used to find the culprit dataset in the following way:

- In the **Query Durations** visual the admin filtered dataset by dataset (starting at the top datasets queried) and examined the cross filtered bars in the **Hourly Query Distributions** visual.
- When a single one-hour bar showed significant changes in the ratio between all query duration groups vs. other one-hour bars for that dataset (i.e. the ratios between the colors changes drastically), it means this dataset demonstrated a sporadic change in performance.
- The one-hour bars showing an irregular portion of poor performing queries, indicated a timespan where that dataset was impacted by a noisy neighbor effect, caused by other datasets&#39; activities.

The screenshot below shows one hour on January 30, where a significant setback in a dataset&#39;s performance, indicated by the size of the &quot;(3,10s]&quot; execution duration bucket. Clicking that one-hour bar reveals all the datasets loaded into memory during that time, thus surfacing the candidate culprit datasets causing the noisy neighbor effect.

![Bar showing worst performance by a large &quot;(3,10s]&quot; portion](media/whitepaper-premium-deployment/worst-performing-queries.png)

Figure 5.6 – Bar showing worst performance by a large &quot;(3,10s]&quot; portion

Once a problematic timespan is identified (i.e. during Jan 30 in Figure 5.6) the Power BI administrator can remove all dataset filters then filter only by that timespan to determine which datasets were actively queried during this time. The culprit dataset for the noisy neighbor effect is usually either the top queried dataset or the one with the longest average query duration.

A solution to this problem could be to distribute the culprit datasets over different workspaces on different Premium capacities, or on shared capacity if the dataset size, consumption requirements, and data refresh patterns are supported.

The reverse could be true as well. The Power BI administrator could identify times when a dataset query performance drastically improves and then look for what disappeared. If certain information is missing at that point, then that may help to point to the causing problem.

### Determining Whether There is Enough Memory

To determine whether there is enough memory for the capacity to complete its workloads, the Power BI administrator can refer to the **Consumed Memory Percentages** visual in the **Datasets** tab of the app. **All** (total) memory represents the memory consumed by datasets loaded into memory, regardless of whether they are actively queried or processed. **Active** memory represents the memory consumed by datasets that are being actively processed.

In a healthy capacity the visual will look like this:

![A healthy capacity will show a gap between All (total) and Active memory](media/whitepaper-premium-deployment/memory-healthy-capacity.png)

Figure 5.7 – A healthy capacity will show a gap between All (total) and Active memory

In a capacity experiencing memory pressure, the same visual will clearly show active memory and total memory converging, meaning that it is impossible to load additional datasets into memory at that point in time. In this case, the Power BI administrator can click **Capacity Restart** (in **Advanced Options** of the capacity settings area of the admin portal). Restarting the capacity results in all datasets being flushed from memory and allowing them to reload into memory as required (by queries or data refresh).

![**Active** memory converging with **All** memory](media/whitepaper-premium-deployment/memory-unhealthy-capacity.png)

Figure 5.8 – **Active** memory converging with **All** memory

### Determining Whether There is Enough CPU

In general, a capacity&#39;s average CPU utilization should remain below 80%. Exceeding this value means the capacity is approaching CPU saturation.

Effects of CPU saturation are expressed by operations taking longer than they should due to the capacity performing many CPU context switches as it attempts to process all operations. In a Premium capacity with a high number of concurrent queries this is indicated by high query wait times. A consequence of high query wait times is slower responsiveness than usual. The Power BI administrator can easily identify when the CPU is saturated by viewing the **Hourly Query Wait Time Distributions** visual. Periodic peaks of query wait time counts indicate potential CPU saturation.

![Periodic peaks of query wait time counts indicate potential CPU saturation](media/whitepaper-premium-deployment/peak-query-wait-times.png)

Figure 5.9 – Periodic peaks of query wait time counts indicate potential CPU saturation

A similar pattern can sometimes be detected in background operations if they contribute to CPU saturation. A Power BI administrator can look for a periodic spike in refresh times for a specific dataset, which can indicate CPU saturation at the time (probably due to other ongoing dataset refreshes and/or interactive queries). In this instance, referring to the **System** view in the app may not necessarily reveal that the CPU is at 100%. The **System** view displays hourly averages, but the CPU can become saturated for several minutes of heavy operations, which shows up as spikes in wait times.

There are more nuances to seeing the effect of CPU saturation. While the number of queries that wait is important, query wait time will always happen to some extent without causing discernable performance degradation. Some datasets (with lengthier average query time, indicating complexity or size) are more prone to the effects of CPU saturation than others. To easily identify these datasets, the Power BI administrator can look for changes in the color composition of the bars in the **Hourly Wait Time**** Distribution** visual. After spotting an outlier bar, they can look for the datasets that had query waits during that time and also look at the average query wait time compared to average query duration. When these two metrics are of the same magnitude and the query workload for the dataset is non-trivial, it is likely that the dataset is impacted by insufficient CPU.

This effect can be especially apparent when a dataset is consumed in short bursts of high frequency queries by multiple users (i.e. in a training session), resulting in CPU saturation during each burst. In this case, significant query wait times on this dataset can be experienced as well as impacting on other datasets in the capacity (noisy neighbor effect).

In some cases, Power BI administrators can request that dataset owners create a less volatile query workload by creating a dashboard (which queries periodically with any dataset refresh for cached tiles) instead of a report. This can help prevent spikes when the dashboard is loaded. This solution may not always be possible for given business requirements, however it can be an effective way to avoid CPU saturation, without making changing to the dataset.

## Conclusion

Power BI Premium provides more consistent performance, support for large data volumes, and the flexibility of a unified self-service and enterprise BI platform for everyone in your organization. This level 300 technical whitepaper has been written specifically for Power BI administrators, and content authors and publishers. It aims to help them understand the potential of Power BI Premium, and to explain how to design, deploy, monitor and troubleshoot scalable solutions.

To deploy and manage Power BI Premium capacities, administrators and model developers will require a very good understanding of how capacities function, how they can be managed and monitored, and how models can be optimized, in order to appropriately respond to performance issues and bottlenecks should they arise.

## End notes

1

#
 This technical paper is concerned with Power BI Premium which is only supported by the Power BI cloud service, and so Power BI Report Server is not in scope, except to state that the license required to install Power BI Report Server is included with some Power BI Premium SKUs.

2

#
 Power BI as a cloud service when used to embed content on behalf of application users is Platform-as-a-Service (PaaS). This type of embedding can be achieved with different two products, one of which is Power BI Premium.

3

#
 Push, streaming and hybrid datasets are not stored in Premium capacities, and are therefore not a consideration when deploying, managing and monitoring Premium capacities.

4

#
 Excel workbooks as a Power BI content type are not stored in Premium capacities, and are therefore not a consideration when deploying, managing or monitoring Premium capacities.

5

#
 Visuals can be configured to ignore slicer interactions. For further information, refer to the [Visualization interactions in a Power BI report](https://docs.microsoft.com/power-bi/service-reports-visual-interactions) document.

6

#
 The difference in size can be determined by comparing the Power BI Desktop file size with the Task Manager memory using for the file.

7

#
 Support for Microsoft data sources include SQL Server, Azure Data Bricks, Azure HDInsight Spark (Beta), Azure SQL Database and Azure SQL Data Warehouse. For information about additional sources, refer to the [Data sources supported by Direct Query in Power BI](https://docs.microsoft.com/power-bi/desktop-directquery-data-sources) document.

8

#
 Power BI Premium supports uploading a Power BI Desktop (.pbix) file up to a maximum of 10 GB in size. Once uploaded, a dataset can grow up to 12 GB in size as a result of refresh. Maximum upload size varies by SKU. For further information, refer to the [Power BI Premium support for large datasets](https://docs.microsoft.com/power-bi/service-premium-large-datasets) document.

9

#
 SKUs with less than four v-cores do not run on dedicated infrastructure. This includes the EM1, EM2, A1 and A2 SKUs.

10

#
 While rare, models may be unloaded from memory due to service operations.

11

#
 These timings are subject to change at any time.

12

#
 This is referred to as multi-geo, currently in preview. The rationale for a multi-geo deployment is typically for corporate or government compliance, rather than performance and scale. Report and dashboard loading still involves requests to the home region for metadata. For further information, refer to the [Multi-Geo support for Power BI Premium (Preview)](https://docs.microsoft.com/power-bi/service-admin-premium-multi-geo) document.

13

#
 It is possible that users can cause performance issues by overloading the Power BI service with jobs, writing overly complex queries, creating circular references, etc.

14

#
 The option to assign the entire organization&#39;s workspaces is not recommended, and a more targeted approach is preferred. Generally, it is not best practice to use personal workspaces for production content.

15

#
 It is possible to monitor A SKUs in the app or in the Azure portal, but not in the Power BI Admin Portal. To monitor A SKUs, refresh of the report will fail if app has not been added to the reader role of the resource. For further information, refer to the [Monitor Power BI Premium and Power BI Embedded capacities](https://docs.microsoft.com/power-bi/service-admin-premium-monitor-capacity#monitor-power-bi-embedded-capacity) document.

16

#
 Refreshes can wait when there is not enough CPU or memory to start.

17

#
 The dataset size in memory can be larger than the size on disk by up to 20%.

18

#
**Average Memory Usage (GB)**, and **Highest Memory Consumption (GB)**

19

#
**Dataset evictions**

20

#
**Dataset Queries** , **Dataset Average Query Duration (ms)**, **Dataset Wait Count** , and **Dataset Average Wait Time (ms)**

21

#
**CPU High Utilization Count** and **CPU Time of Highest Utilization** (past seven days)

22

#
**DQ/LC High Utilization Count** and **DQ/LC Time of Highest Utilization** (past seven days)