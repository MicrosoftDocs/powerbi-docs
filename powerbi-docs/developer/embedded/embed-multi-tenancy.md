---
title: Manage multi-tenancy with Power BI embedded analytics 
description: Design a multi-tenant application with Power BI embedded analytics .
author: KesemSharabi
ms.author: kesharab
ms.reviewer: nishalit
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 04/02/2021
---

# Manage multi-tenancy with Power BI embedded analytics

When designing a multi-tenant SaaS application, you must carefully choose the tenancy model that best fits the needs of your SaaS application. This process is also valid for Power BI as an embedded analytics part of your SaaS application. A tenancy model determines how each tenant's data is mapped and managed within Power BI and the storage account. Your tenancy model impacts application design and management. Switching to a different model later may become costly and disruptive.

With Power BI Embedded, there are two main fundamental approaches to maintaining separation between tenants.

   1. **Workspace-based isolation** - creating a separate Power BI Workspace per tenant.
   2. **Row-level security-based isolation** - where the underlying data is used to control and manage access to data per user or group.

This article describes the different approaches and analyzes them according to several evaluation criteria.

## Concepts and terminology

**[AAD](/azure/active-directory/fundamentals/active-directory-whatis)** - Azure Active Directory.

**AAD application** - An application identity in AAD. An AAD application is required for authentication.

**SaaS application (software-as-a-service)** - A system implemented by an enterprise or ISV that is usually an online service. Its also related software systems for serving multiple customer tenants (organizations). For this article, **the SaaS application uses Power BI Embedded to serve analytics to its different tenants**. Power BI Embedded can also work for all types of applications when they have an online connection.

**Tenant** – A single customer (organization) that uses the SaaS application and any resources or data that the customer brings to the SaaS application.

**[Power BI](../../fundamentals/power-bi-overview.md)** - The Power BI cloud service that serves as a platform for Power BI Embedded.

**Power BI tenant** - Is a set of Power BI resources associated with a single AAD tenant.

**[Power BI workspace](../../collaborate-share/service-create-workspaces.md)** - A container for content in Power BI.

**Power BI artifacts** – There are several Power BI artifacts in Power BI workspaces such as dashboards, reports, datasets, and dataflows.

**[Power BI Embedded](azure-pbie-what-is-power-bi-embedded.md)** - A set of public APIs that allow developers to build applications that manage Power BI content and embed Power BI elements.

**[Row-level security (RLS)](embedded-row-level-security.md)** - Gives the ability to control user access to the data for individual rows in a table. You can implement row-level security at the data source level or in the Power BI semantic model.

**Master user** - The identity that represents the SaaS application in Power BI and that the SaaS application uses when calling Power BI APIs. Needs to be an AAD user with a Power BI Pro or Premium Per User (PPU) license.

**AAD Application user (service principal)** - The identity that represents the SaaS application in Power BI and that the SaaS application uses when calling Power BI APIs. Needs to be an AAD web application. Can replace the use of a *master* user to authenticate with Power BI.

**Capacity** - A set of resources dedicated to running the Power BI service. [Power BI Premium capacities](../../admin/service-premium-what-is.md) Intended for enterprise companies using Power BI internally, while [Power BI Embedded capacities](azure-pbie-create-capacity.md) intend for application developers to develop SaaS applications for third parties.

**[Power BI Pro or Premium Per User (PPU) license](../../admin/service-admin-purchasing-power-bi-pro.md)** - A user-based license, which grants rights to publish content to workspaces, consume apps without Premium capacity, share dashboards, and subscribe to dashboards and reports.

**[Data connectivity modes](../../connect-data/desktop-directquery-about.md)** - Connecting data sources to Power BI that can be done in different modes:

   * Import - which is the most common way to get data.
   * DirectQuery - connect directly to the data in its source repository.
   * Live connection - another mode that connects directly to Analysis Services data (both Azure and on-premises).

## Evaluation criteria

The optimal choice for the right tenancy model for your SaaS application varies according to specific business and technical requirements, data architecture and more. Deep understanding of these requirements along with available tenancy model options and trade-offs can help define robust, performant, cost-effective, and scalable architecture for your SaaS application.

The following are a set of areas to consider when choosing between the different tenancy models.

### Data architecture

Usually, developers building applications with Power BI Embedded already have a single or multi-tenant database. It's easier to use a tenancy model for Power BI Embedded which is similar to the tenancy model of the database. If the database tenancy model hasn't been defined yet, you may want to consider other aspects before deciding on your data architecture.

### Data Isolation

How sensitive is the data being stored? What level of isolation do you need separating different customer tenants? The answer might vary across different industries or specific customers that have certain requirements.

### Scalability

To find the best solution, define the scale you reach in the foreseeable future. Remember that a solution that might be suitable now might not suffice when usage and data scale up. When analyzing scalability, consider the following list:

   * Number of tenants (customers).
   * Number of reports, dashboards, and datasets for each tenant.
   * Size of data on each dataset and frequency of refreshes.
   * Number of users.
   * Number of concurrent users in peak times.

Some SaaS applications might have a low number of customers and low usage, but large amounts of data. Others might have many customers and high usage, but a small amount of data and reports for each customer. High numbers in any of these situations can impact future costs and operational complexity.

### Automation & operational complexity

Identify frequently occurring processes that need automation.

   * What is the frequency of onboarding new tenants? What actions are needed to fully onboard each one?
   * What is the release cadence for new or updated Power BI content, that needs to be deployed?
   * How many row-level security roles are defined for each tenant?  

Identifying these processes and how you address them can help you understand the operational complexity involved in maintaining each model.

### Data Residency Requirements and the need to support multiple geographies

Power BI Embedded supports multi-geo deployment (preview feature). [Multi-Geo](embedded-multi-geo.md) enables Power BI Embedded resources to be deployed in different regions with specific content assigned to reside in specific regions. This feature can be used across all models, but can have an impact on the amount of content to manage and cost. Currently multi-geo is designed for meeting data residency requirements and doesn't improve performance by moving data closer to consumers.

### Cost

[Power BI Embedded](azure-pbie-what-is-power-bi-embedded.md) has a resource-based purchase model, like **Power BI Premium**. You purchase one or more capacities with fixed computing power and memory. This capacity is the main cost item when working with **Power BI Embedded**. There's no limit on the number of users using the capacity. The only limit is the performance of the capacity. A [Power BI Pro license](../../admin/service-admin-licensing-organization.md) is required for each *master* user, or specific users that need to access the Power BI portal.

We recommend testing and measuring the expected load on your capacity by simulating live environment and usage and run load testing on the capacity. You can measure the load and performance with the various Metrics available in the Azure capacity or [Premium capacity metrics app](../../admin/service-admin-premium-monitor-capacity.md).

### Content customization and authoring

There are two approaches to SaaS applications that give users the ability to edit and create reports or upload data into the service as part of the flow:

   * [Edit/Create mode in an embedded iFrame](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Create-Report-in-Embed-View) - The user gets a view of the report or a new blank canvas inside the SaaS application. This way they can use the Power BI toolbar to create content based on a dataset in the workspace. We recommend this option since it's in the user's context in a familiar environment. It's easier to get started working and editing, and the user creates a report attached to an existing dataset.

   * Use Power BI Desktop to create content and upload it through the SaaS application UI to the workspace. In this approach, users have more tools to work with using the Power BI Desktop. However, we do not recommend this  approach since users need to be familiar with an additional tool outside of the SaaS application context. Uploading a PBIX file means the user is adding an additional dataset, that might be a duplicate of datasets already in the workspace.

## Power BI workspace-based isolation

With Power BI workspace-based isolation, the SaaS application supports multiple tenants from a single Power BI tenant. Workspace-based isolation contains all the Power BI content that different tenants use. The separation of tenants is done at the Power BI workspace level, by creating multiple workspaces. Each workspace contains the relevant datasets, reports, and dashboards for that tenant. Also, each workspace is connected only to that tenant's data. If you need additional isolation, you can create a *master* user or a service principal for each workspace and its content.

![Workspace](media/embed-multi-tenancy/multi-tenant-saas-workspace.png)

### Data architecture

There are two main approaches to manage tenant's data.

* A separate database per tenant
* A single multi-tenant database

If the SaaS application storage is keeping a separate database per tenant, then the natural choice is to use single-tenant datasets in Power BI with the connection string for each dataset pointing to the matching database.

If the SaaS application storage is using a multi-tenancy database for all tenants, it's easy to separate tenants by workspace. You can configure the database connection for the Power BI dataset with a parameterized database query that only retrieves the relevant tenant's data. You can update the connection using the [Power BI Desktop](../../transform-model/desktop-query-overview.md) or using the [API](/rest/api/power-bi/datasets/updatedatasourcesingroup) with [parameters](/rest/api/power-bi/datasets/updateparametersingroup) on the query.

### Data isolation

Data in this tenancy model is separated at the workspace level. A simple mapping between a workspace and a tenant prevents users from one tenant seeing content from another tenant. Using a single *master* user demands you to have access to all the different workspaces. The configuration of which data to show an end user is defined during the [generation of the embed token](/rest/api/power-bi/embedtoken), a backend-only process which end users can't see, or change.

To add additional isolation, an application developer can define a *master* user or an application per workspace rather than a single *master* user or application with access to multiple workspaces. This way, you can ensure that any human error or credential leak does not cause multiple customers' data to be exposed.

### Scalability

One advantage of this model is that separating the data into multiple datasets for each tenant overcomes the [size limits of a single dataset](../../admin/service-premium-what-is.md) (currently 10 GB in a capacity). When the capacity is overloaded, it can evict unused datasets to free memory for active datasets. This task isn't possible with a single large dataset. Using multiple datasets, it is also possible to separate tenants into multiple Power BI capacities if needed.

Despite these advantages, one must consider the scale that the SaaS application can reach in the future. For example, one might reach limitations around the number of artifacts one can manage. See deployment [limitations](#summary-comparison-of-the-different-approaches) later in this article for more details. The capacity SKU used introduces a limit on the size of memory that datasets need to fit in, how many refreshes can run at the same time and the maximum frequency of data refreshes. It's recommended to test when managing hundreds or thousands of datasets. It is also recommended to consider the average and peak volume of usage, as well as any specific tenants with large datasets, or different usage patterns, that are managed differently than other tenants.

### Automation & operational complexity

With Power BI workspace-based isolation, an application developer might need to manage hundreds or thousands of artifacts. It's essential to define the processes that frequently happen in your application lifecycle management, and ensure you have the right set of tools to perform these operations at scale in this tenancy model. Some example operations include:

   * Adding a new tenant (customer)
   * Updating a report or dashboard for some or all the tenants
   * Updating the dataset schema for some or all the tenants
   * Unplanned customizations for specific tenants
   * Frequency of dataset refreshes

For example, creating a workspace for a new tenant is a common task, which needs automation. With the [Power BI REST API](/rest/api/power-bi/), you can achieve [full automation when creating workspaces](https://powerbi.microsoft.com/blog/duplicate-workspaces-using-the-power-bi-rest-apis-a-step-by-step-tutorial/).

### Multi-Geo needs

Multi-geo involves purchasing capacity in the desired regions and assigning a workspace to that capacity. If you need to support different tenants in different regions, you need to assign the tenant's workspace to a capacity in the desired region. This task is a simple operation and one where the cost is not more than having all workspaces in the same capacity. However, if you have tenants that need data resident in multiple regions, all artifacts in the workspace need to be duplicated in each regional capacity, increasing both cost and management complexity.

### Cost

Application developers using Power BI Embedded need to [purchase Power BI Embedded capacity to go to production](move-to-production.md).  It's important to understand the impact of workspace-based isolation model and their effect on capacities.

The workspace-based isolation model sits well with capacities for the following reasons:

   * The smallest object you can independently assign to a capacity is a workspace that is, you can't assign a report, for example), so by separating tenants by workspaces, you get full flexibility in managing each tenant and its performance needs, and optimizing capacity utilization by scaling up/down. For example, large and essential tenants with high volume and volatility can be managed in a separate capacity to ensure a consistent service level, while grouping smaller tenants in another capacity to optimize costs.

   * Separating workspaces also means separating datasets between tenants so that data models can be in smaller chunks, rather than in a single large dataset. This task allows the capacity to manage memory usage better, evicting small, and unused datasets when not needed, while keeping users satisfied with the performance.

Application developers need to consider the limit on the number of parallel refreshes, as refresh processes might need extra capacity when you have multiple datasets.

### Content customization and authoring

For the primary use cases of content creation, the application developer needs to carefully consider which tenants can have editing capabilities, and how many users in each tenant can edit. Permitting multiple users in each tenant to edit can result in many contents being generated, that can reach a dataset limitation such as the number of reports per dataset, or the number of datasets in a workspace. If you give users this capability, we recommend monitoring the content generation closely and scale up as needed. For the same reasons, we don't recommend using this capability for content personalization, where each user can make small changes to a report and save it for themselves. If the SaaS application allows content personalization, consider introducing and communicating workspace retention policies for user-specific content to facilitate the flow of content deletion when end users move to a new position, leaving the company or not using the platform anymore.

## Row-level security-based isolation

With row-level security-based isolation, the SaaS application uses a single workspace to host multiple tenants. It means each Power BI artifact report, dashboard, & dataset, is created once all tenants use it. Data separation between tenants is accomplished using [row-level security](embedded-row-level-security.md) on the multi-tenant dataset. When end users log into the SaaS application and open content, an Embed token is generated for that user's session, with the roles and filters that ensure the user only sees the data they are permitted to see. If users from the same tenant are not permitted to view the same data, the application developer needs to implement hierarchical roles both between tenants and within the same tenant.

![Row-level security](media/embed-multi-tenancy/multi-tenant-saas-rls.png)

### Data architecture

Implementing row-level security-based isolation is most comfortable when all tenants' data is stored in a single data warehouse. In this case, the application developer can pass only the relevant data from the data warehouse into the Power BI dataset, either via Direct Query or data import. If data in the database is separated per tenant, it needs to be combined into a single dataset, which results in a lower degree of separation between tenants that existed in the database.

### Data isolation

With row-level security-based isolation, data separation is accomplished using [row-level security definitions](embedded-row-level-security.md) on the dataset, which means all the data coexist. This form of data separation is more susceptible to data leakage through developer error. Even though row-level security is done on the backend and secured from an end user, if the data is highly sensitive or customers are asking for data separation, it might be better to use workspace-based isolation.

### Scalability

With row-level security-based isolation, the data needs to fit within the dataset size limit, which is currently 10 GB. With the introduction of [incremental refresh](../../connect-data/incremental-refresh-overview.md) and the release of an XMLA endpoint for Power BI datasets, the dataset size limit is expected to increase significantly. However, the data still needs to fit into the capacity's memory, with enough remaining memory for data refreshes to run. Large-scale deployments need a large capacity to avoid users experiencing issues due to memory exceeding the limits of the current capacity. Alternative ways to handle scale include using [aggregations](../../transform-model/desktop-aggregations.md) or connecting to the data source directly using DirectQuery or Live connection, rather than caching all the data in the Power BI capacity.

### Automation & operational complexity

Managing artifacts is far more comfortable using row-level security-based isolation than with workspace-based isolation as there is only one version of an artifact for each environment (dev/test/production), instead of a version per tenant. At a large scale, managing artifacts means managing and updating tens of artifacts, rather than thousands to ten-thousands.

Power BI doesn't yet have an API to modify or create RLS roles and rules. Adding or changing roles can only be done manually in the Power BI Desktop. If an RLS hierarchy needs to be applied, it can be complicated and error-prone to manage if you don't plan it carefully.

If the application developer needs to manage many roles and role definitions that need to be created or updated frequently, row-level security-based isolation isn't scalable, from a manageability perspective.

Another operational complexity is the need to closely monitor memory utilization and build a robust mechanism of alerts and scaling to ensure users get a smooth experience.  

### Multi-Geo needs

Since all the data is stored in a single dataset, it is challenging to meet data residency requirements that require certain data to be bound to specific locations. It can also significantly increase the cost of using multiple regions as all the data is replicated and stored in each region. If only a limited number of tenants need different geographies, you can keep only those tenants' data in a different region, using the workspace-based isolation model described above.

### Cost

The primary cost driver with row-level security-based isolation is the memory footprint of the dataset. You need enough capacity to store the dataset and keep some additional memory buffer for any peaks in memory demand. One way to mitigate this situation is to store the data in a SQL Server database or SQL Server Analysis Services cube and using Direct Query or a Live connection to retrieve the data from the data source in real time. This approach increases the cost of the data sources, but reduces the need for large capacity because of memory needs, hence reducing the cost of Power BI capacity.

### Content customization and authoring

As end users edit or create reports, they can use the production multi-tenant dataset. For that reason, we advise only using the embedded iFrame option to edit or [create reports](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Create-Report-in-Embed-View), as it relies on the same dataset, with row-level security applied. Having users uploading PBIX files with additional datasets can be costly and difficult to manage with row-level security-based isolation. Also, when users generate new content that is in the same workspace, you need to make sure the production workspace doesn't hit its limits and build a robust mechanism to distinguish which content is connected to which tenant.

## Summary comparison of the different approaches

> [!Important]
> The following analysis is based on the current state of the product. As we are releasing new features on a monthly cadence, we continue to provide new capabilities and features that answer existing limitations and weak spots. Make sure to check our monthly blog posts to see what's new and come back to this article to see how new features affect the tenancy model recommendation.

| Evaluation Criteria | Workspace-based   | Row-level security-based  |
|---------------------|-------------------|---------------------------|
| Data architecture  | Easiest when there's a separate database per tenant  | Easiest when all the data for all tenants are in a single data warehouse   |
| Data isolation  | Good. Each tenant has a dedicated dataset.  | Moderate. All data is in the same shared dataset but managed through access-control.  |
| Scalability  | Medium. Breaking the data into multiple datasets enables optimization.  | Lowest. Constrained by dataset limits.  |
| Multi-Geo needs  | Good fit when most tenants are only in one region.  | Not recommended. Needs to keep the entire dataset stored in multiple regions.  |
| Automation & operational complexity  | Good automation for the individual tenant.   Complex to manage many artifacts at scale.  | Easy to manage Power BI artifacts but complex to manage RLS at scale.  |
| Cost  | Low-medium. Can optimize utilization to reduce cost-per-tenant.  Might increase when frequent refreshes are needed.  | Medium- high if using Import mode.  Low- medium if using Direct Query mode.  |
| Content customization and authoring  | Good fit. Might hit limitations at large scale.  | Content generation in embedded iFrame only  |

## Deployment considerations and limitations

**Power BI Artifact limits:**

* The number of workspaces V1 (groups) that a single user/application can be a member/admin of is 250.
* The number of workspaces V2 (folders) that a single user/application can be a member/admin of is 1000.
* The number of datasets in a single workspace is 1000.
* The number of reports/dashboards connected to a single dataset is 1000.
* The dataset memory size limit to upload a *.pbix* file is 10 GB.

**Power BI Capacity considerations and limitations:**

* Each capacity can only use its allocated memory and V-cores, according to the [SKU purchased](../../admin/service-premium-what-is.md).
* For the recommended dataset size for each SKU, reference [Premium large datasets](../../admin/service-premium-what-is.md#large-datasets).
* The max dataset size in a capacity is 10 GB.
* The number of scheduled refreshes for an *import mode* dataset in a day is 48.
* The time between scheduled refreshes for an *import mode* dataset is 30 minutes.
* For the number of refreshes that can run concurrently on a capacity, reference [resource management and optimization](../../admin/service-premium-what-is.md#capacity-nodes).
* The average time of scaling a capacity is between 1-2 minutes. During that time, the capacity isn't available. We recommend using a scale-out approach to [avoid downtime](https://powerbi.microsoft.com/blog/power-bi-developer-community-november-update-2018/#scale-script).

## Next steps

* [Embedded analytics with Power BI](embedding.md)
* [Power BI Embedded](azure-pbie-what-is-power-bi-embedded.md)
* [Power BI Premium](../../admin/service-premium-what-is.md)
* [Row-level security](embedded-row-level-security.md)