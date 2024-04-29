---
title: Migrate from Azure Analysis Services to Power BI Premium or Power BI Embedded
description: Guidance to help you migrate your Azure Analysis Services (AAS) data models to Power BI Premium or Power BI Embedded.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat, intro-migration
ms.date: 05/22/2023
---

# Migrate from Azure Analysis Services to Power BI Premium

This article targets [Azure Analysis Services (AAS)](/azure/analysis-services/analysis-services-overview) data modelers and administrators. It provides them with guidance and rationale to help migrate their AAS databases to Power BI Premium or Power BI Embedded.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

## Background

Power BI has evolved into the leading platform for both self-service and IT-managed enterprise business intelligence (BI). With exponential growth in data volumes and complexity, Power BI customers demand enterprise BI solutions that scale to petabytes, are secure, easy to manage, and accessible to all users across the largest of organizations.

For over two decades, Microsoft has continued to make deep investments in enterprise BI. AAS and SQL Server Analysis Services (SSAS) are based on mature BI data modeling technology used by countless enterprises. Today, that same technology is also at the heart of Power BI semantic models ([previously known as datasets](../connect-data/service-datasets-rename.md)).

> [!NOTE]
> In this article, the terms data model, BI model, tabular model, database, and Power BI semantic model have the same meaning. This article commonly uses the terms *data model* for AAS model and *semantic model* for Power BI model.
>
> Also, while this article describes the process of migrating to Power BI Premium, it also applies to Power BI Embedded.

In recent years, Microsoft has taken great strides to deliver AAS capabilities to [Power BI Premium](https://powerbi.microsoft.com/power-bi-premium/). To that end, Power BI instantly inherited a large ecosystem of developers, partners, BI tools, and solutions that were built up over decades. Today, the full set of Power BI Premium workloads, features, and capabilities now results in a modern, cloud BI platform that goes far beyond comparable functionality available in AAS or SSAS.

Today, many customers have Power BI reports that [live connect](../connect-data/desktop-report-lifecycle-datasets.md) to AAS. Naturally, these customers are asking whether there's an opportunity to consolidate by hosting their data models alongside their reports in Power BI. They often ask questions like:

- Does all the AAS functionality we depend on work in Power BI?
- Is Power BI backwards compatible with AAS tools and processes?
- What capabilities are available only in Power BI?
- How do we compare costs between AAS and Power BI?
- Why is Microsoft converging enterprise and self-service BI?
- How do we migrate from AAS to Power BI Premium?
- Is AAS marked for deprecation?
- What's Microsoft's roadmap for enterprise data models?

Answers to many of these questions are described in this article.

> [!NOTE]
> The decision to migrate to Power BI Premium depends on the requirements of each customer. Customers should carefully evaluate additional benefits in order to make an informed decision. We expect to see organic migration to Power BI Premium over time, and our intention is that it happens on terms that the customer is comfortable with.
>
> To be clear, currently there aren't any plans to deprecate AAS. There is a priority to focus investment on Power BI Premium for enterprise data modeling, and so the additional value provided by Power BI Premium will increase over time. Customers who choose Power BI Premium can expect to benefit from alignment with the Microsoft BI product roadmap.

### Convergence of self-service and enterprise BI

Consolidation of items (like reports and dashboards) in Power BI results in simplified discovery and management due to co-location. Once consolidated, there's no need to bridge the gap between AAS and Power BI. Central IT teams can then more easily adopt self-service items that have become popular yet are resulting in a management burden for the business. IT can take over such items. They can operationalize them for mission-critical decision making based on governed data that's aligned with corporate standards and with lineage transparency. Simplifying this workflow by sharing a common platform promotes better collaboration between the business and IT.

### Power BI Premium

Thanks to its distributed architecture, Power BI Premium is less sensitive to overall load, temporal spikes, and high concurrency. By consolidating capacities to larger Power BI Premium SKUs, customers can achieve increased performance and throughput.

Scalability benefits associated with Power BI Premium are described [later in this article](#scalability-benefits).

## Feature comparison

AAS provides the Analysis Services database engine for hosting data models, which is a core component of a Microsoft enterprise BI architecture. In fact, Power BI Premium is a superset of AAS because it provides much more functionality. The following table lists features supported in AAS and Power BI Premium. The table focuses on - but isn't limited to - Power BI semantic model-related capabilities.

| **Feature** | **AAS** | **Power BI Premium** |
|:-|:-:|:-:|
| **Premium workloads** |||
| [Paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md), which are ideal for reports that are designed to be printed, especially when table data overflows to multiple pages | No | Yes |
| [Dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md), which store fragments of data intended for use in a Power BI semantic model | No | Yes |
| [AI with dataflows](../transform-model/dataflows/dataflows-machine-learning-integration.md), which use artificial intelligence (AI) with Cognitive Services, Automated Machine Learning, and Azure Machine Learning (AML) integration | No | Yes |
| [Metrics](../create-reports/service-goals-introduction.md), which curate key business measures and allow tracking them against objectives | No | Yes |
| **Business enablement** |||
| Unlimited report distribution to anyone (even outside the organization) | No | Yes |
| Business-driven interactive reports, workspaces, and apps | No | Yes |
| **Platform scalability and resiliency** |||
| [Power BI Premium](../enterprise/service-premium-what-is.md) architecture, which supports increased scale and performance | No | Yes |
| Optimized semantic model memory management | No | Yes |
| Scale limits per data model instead of per server | No | Yes |
| CPU smoothing for refresh resiliency | No | Yes |
| [Autoscale](../enterprise/service-premium-auto-scale.md), which automatically adds compute capacity to avoid slowdowns under heavy use | No | Yes |
| [Business continuity and disaster recovery (BCDR)](../enterprise/service-admin-failover.yml) with Azure regions and availability zones | No | Yes |
| **Interactive analysis over big data** |||
| [Large model sizes](../enterprise/service-premium-large-models.md) (up to 400 GB with compression) | Yes | Yes |
| [Hybrid tables](../connect-data/service-dataset-modes-understand.md#hybrid-tables), which comprise in-memory and DirectQuery partitions that can help deliver near real-time results over large tables | No | Yes  |
| [Automatic aggregations](../enterprise/aggregations-auto.md), which use state-of-the-art machine learning (ML) to continuously optimize DirectQuery performance | No | Yes |
| [User-defined aggregations](../transform-model/aggregations-advanced.md), which can improve query performance over very large DirectQuery tables | No | Yes |
| [Query scale-out](/azure/analysis-services/analysis-services-scale-out), which distributes client queries among replicated servers | Yes | Yes |
| **Security** |||
| [Bring Your Own Key (BYOK)](../enterprise/service-encryption-byok.md), which allows customers to use their own encryption key to encrypt data stored in the Microsoft cloud | No | Yes |
| [Virtual network connectivity](/data-integration/vnet/overview), which allows Power BI to work seamlessly in an organization's virtual network (VNet) | No | Yes  |
| [Azure Private Link](/fabric/security/security-private-links-overview), which provides secure access for data traffic in Power BI | No | Yes |
| Single sign-on (SSO) for DirectQuery sources, which allows connecting to data sources by using the report user's identity | No | Yes |
| [Row-level security (RLS)](/fabric/security/service-admin-row-level-security), which restricts access to specific rows of data for specific users | Yes | Yes |
| [Object-level security (OLS)](/analysis-services/tabular-models/object-level-security), which restricts access to specific tables or columns for specific users | Yes | Yes |
| [Firewall](/azure/analysis-services/analysis-services-qs-firewall), which when enabled, allows setting allowed IP address ranges | Yes | No <sup>1</sup> |
| **Governance** |||
| [Microsoft Purview integration](/azure/purview/overview), which helps customers manage and govern Power BI items | No | Yes |
| Microsoft Information Protection (MIP) [sensitivity labels](../enterprise/service-security-sensitivity-label-overview.md) and integration with [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps) for data loss prevention | No | Yes |
| Content [endorsement](../collaborate-share/service-endorse-content.md), to promote or certify valuable, high-quality Power BI items | No | Yes |
| **Semantic modeling** |||
| Compatibility with Power BI Desktop | No | Yes |
| [Composite models](../transform-model/desktop-composite-models.md) including using [DirectQuery for Power BI semantic models and AAS](../connect-data/desktop-directquery-datasets-azure-analysis-services.md) | No | Yes  |
| [Translations](/analysis-services/tabular-models/translations-in-tabular-models-analysis-services) for multi-language model versions observed by the Power BI service | No | Yes |
| Analysis Service engine semantic modeling | Yes | Yes |
| **Model management** |||
| [Incremental refresh](../connect-data/incremental-refresh-overview.md), which uses policies to automate partition management and can help deliver near real-time reporting (see hybrid tables) | No | Yes |
| [Deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines), which manage the lifecycle of Power BI content | No | Yes |
| [Scheduled refresh](../connect-data/refresh-scheduled-refresh.md), which keeps cached semantic model data current | No | Yes |
| [Enhanced refresh](../connect-data/asynchronous-refresh.md), which allows any programming language to perform asynchronous semantic model refreshes by using a REST API call | Yes | Yes |
| [Backup and restore](../enterprise/service-premium-backup-restore-dataset.md) | Yes | Yes |
| [Semantic model workload settings](../enterprise/service-admin-premium-workloads.md#semantic-models), which control Premium capacity workloads | No | Yes |
| [Server properties](/analysis-services/server-properties/server-properties-in-analysis-services), which control Analysis Services server instance properties | Yes | Yes  |
| [Alias server names](/azure/analysis-services/analysis-services-server-alias), which allow connecting to an Analysis Services server instance by using a shorter alias | Yes | No |
| [XMLA endpoint](../enterprise/service-premium-connect-tools.md) enabled APIs for scripting and compatibility with services for automation and ALM including Azure Functions, Azure Automation and Azure DevOps | Yes | Yes |
| **Connectivity** |||
| Support for all [Power BI data sources](../connect-data/power-bi-data-sources.md) | No | Yes |
| [XMLA endpoint](../enterprise/service-premium-connect-tools.md), which allows open-platform connectivity for data model consumption and visualization tools, including third-party tools | Yes | Yes |
| [Multi-Geo feature](../admin/service-admin-premium-multi-geo.md), which helps multinational customers address regional, industry-specific, or organizational data residency requirements | Yes | Yes |
| **Discoverability** |||
| [Data hub](../connect-data/service-data-hub.md) integration, which helps users discover, explore, and use Power BI semantic models | No | Yes |
| [Data lineage view](../collaborate-share/service-data-lineage.md) and [semantic model impact analysis](../collaborate-share/service-dataset-impact-analysis.md), which help users understand and assess Power BI item dependencies | No | Yes |
| **Monitoring and diagnostic logging** |||
| [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app), which provides monitoring capabilities for Power BI capacities | No | Yes |
| [Audit log](/fabric/admin/track-user-activities), which tracks user activities across Power BI and Microsoft 365 | No | Yes |
| [Azure Log Analytics (LA) integration](../transform-model/log-analytics/desktop-log-analytics-overview.md), which allows administrators to configure a Log Analytics connection for a Power BI workspace | Yes | Yes  |
| [Metric alerts in Azure Monitor](/azure/azure-monitor/alerts/alerts-types#metric-alerts), which provide a way to get notified when one of your multi-dimensional metrics crosses a threshold | Yes | No |
| [XMLA endpoint](../enterprise/service-premium-connect-tools.md), which allows diagnostic logging tool connections, including SQL Server Profiler | Yes | Yes |
| [SQL Server Extended Events (xEvents)](/analysis-services/instances/monitor-analysis-services-with-sql-server-extended-events), which is a light-weight tracing and performance monitoring system useful for diagnosing issues | Yes | No |

<sup>1</sup> Use VNet connectivity and Azure Private Link instead

## Cost comparison

When comparing Power BI Premium to AAS costs, be sure to consider factors beyond price per core. Power BI provides reduced cost of ownership and business value, and with [many features](#feature-comparison) that are only available to Power BI data models.

Also, assuming you already use Power BI in your organization, calculate costs based on the existing profile that *combines* AAS and Power BI. Compare the existing profile with the target profile on Power BI Premium. To determine the target profile, be sure to consider the following points:

- Region requirements.
- The largest AAS data model size in each region.
- The number of users in each region.
- The number of users required to develop and manage content.
- CPU consumption across AAS and Power BI Premium.

> [!IMPORTANT]
> CPU consumption across AAS and Power BI Premium may vary significantly due to numerous factors. Factors can include the use of other workloads on the same capacities, refresh patterns, and query patterns. We recommended that you perform in-depth analysis to quantify comparative CPU consumption across AAS and Power BI Premium for migrated models.

> [!TIP]
> To help determine the right type and number of licenses for your business requirements and circumstances, see [this related article](migrate-azure-analysis-services-to-powerbi-premium-migration-scenarios.md).

### Consolidation opportunity

Many AAS customers already have Power BI reports that connect to AAS. So, migration to Power BI can represent an opportunity to consolidate BI items in Power BI Premium. Consolidation makes the larger sized Premium SKUs more economically viable and can help to provide higher levels of throughput and scalability.

### PPU licenses

The Premium Per User (PPU) license is a per-user license that provides a lower-cost price point for Premium. PPU licenses are typically purchased by small and medium-sized companies. They support all the Premium capabilities for data modeling listed earlier.

> [!TIP]
> It's possible to incrementally upgrade Power BI Pro licenses to PPU licenses.

### Pro licenses

A Pro (or PPU) license is required to publish and manage Power BI content. Pro licenses are typically assigned to developers and administrators, not end users.

### Development and test environments

AAS offers the **D** and **B** SKUs at lower cost with reduced service-level agreements and/or fewer features than the **S** SKUs. Some AAS customers use these SKUs for development and test environments. While there's no direct equivalent in Power BI, it might make sense to use PPU licenses for development and test environments. Such environments typically don't have large numbers of users because they're limited to developers and testers. Alternatively, consider using an **A** SKU in Azure for testing Premium capacity functionality.

For more information, see:

- [Power BI pricing](https://powerbi.microsoft.com/pricing/)
- [Azure Analysis Services pricing](https://azure.microsoft.com/pricing/details/analysis-services/)
- [Purchase A SKUs for testing and other scenarios](../enterprise/service-admin-premium-testing.md#purchase-a-skus-for-testing-and-other-scenarios)

## Scalability benefits

[Power BI Premium](../enterprise/service-premium-what-is.md) delivers scalability, performance, and cost-of-ownership benefits not available in AAS.

Power BI Premium provides features that enable fast interactive analysis over big data. Such features include aggregations, composite models, and hybrid tables. Each feature offers a different way to optimally combine import and DirectQuery storage modes, effectively reducing memory use. AAS, on the other hand, doesn't support these capabilities; the entire data model uses either import or DirectQuery storage mode.

Power BI Premium limits memory per semantic model, and not per capacity or server. Conversely, AAS requires all data models fit in memory on a single server. That requirement can compel customers with large data models to purchase larger SKU sizes.

Thanks to the distributed nature of the Premium architecture, more semantic models can be refreshed in parallel. Performing concurrent refreshes on the same AAS server can lead to refresh errors due to exceeding server memory limits.

In Power BI Premium, CPU consumption during refresh is spread across 24-hour periods. Power BI Premium [evaluates capacity throughput](../enterprise/service-premium-concepts.md) to provide resilience to temporal spikes in demand for compute resources. When necessary, it can delay refreshes until sufficient resources become available. This automatic behavior reduces the need for customers to perform detailed analysis and manage automation scripts to scale servers up or down. Premium customers should decide on the optimal SKU size for their overall CPU consumption requirements.

Another advantage of Power BI Premium is that it's able to dynamically balance the semantic models depending on the load of the system. This automatic behavior ensures busy/active semantic models get the necessary memory and CPU resources, while more idle semantic models can be evicted or migrated to other nodes. Semantic models are candidates for eviction when they're not used. They'll be loaded on-demand so that only the required data is loaded into memory without having to load the whole semantic model. On the other hand, AAS requires all data models be fully loaded in memory always. This requirement means queries to AAS can rely on the data model being available, but – especially for Power BI capacities with a high number of data models when some of them are used infrequently – dynamic memory management can make more efficient use of memory.

Lastly, Power BI Premium is able to better utilize next-generation hardware rollouts to benefit from scalability and performance enhancements.

## Considerations and limitations

There are considerations and limitations to factor into your planning before migrating to Power BI Premium.

### Permissions

AAS and SSAS use [roles](/analysis-services/tabular-models/roles-ssas-tabular) to manage data model access. There are two types of roles: the *server role* and *database roles*. The server role is a fixed role that grants administrator access to the Analysis Services server instance. Database roles, which are set by data modelers and administrators, control access to the database and data for non-administrator users.

Unlike AAS, in Power BI, you only use roles to enforce RLS or OLS. To grant permissions beyond RLS and OLS, use the Power BI security model (workspace roles and semantic model permissions). For more information, see [Semantic model permissions](../connect-data/service-datasets-permissions.md).

For more information about Power BI model roles, see [Semantic model connectivity with the XMLA endpoint (Model roles)](../enterprise/service-premium-connect-tools.md#model-roles).

When you migrate a data model from AAS to Power BI Premium, you must take the following points into consideration:

- Users who were granted **Read** permission on a model in AAS must be granted **Build** permission on the migrated Power BI semantic model.
- Users who were granted the **Administrator** permission on a model in AAS must be granted **Write** permission on the migrated Power BI semantic model.

### Refresh automation

Power BI Premium supports XMLA endpoint-enabled APIs for scripting, such as [Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference), [Tabular Object Model (TOM)](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo), and the PowerShell [SqlServer module](https://www.powershellgallery.com/packages/SqlServer/). These APIs have almost symmetric interfaces to AAS. For more information, see [Semantic model connectivity with the XMLA endpoint (Client applications and tools)](../enterprise/service-premium-connect-tools.md#client-applications-and-tools).

Compatibility with services for automation, including [Azure Functions](/azure/azure-functions/functions-overview), [Azure Automation](/azure/automation/overview), and [Azure Logic Apps](/azure/logic-apps/logic-apps-overview), is enabled in the same way.

Generally, scripts and processes that automate [partition management and processing](https://github.com/microsoft/Analysis-Services/tree/master/AsPartitionProcessing) in AAS will work in Power BI Premium. Bear in mind that Power BI Premium semantic models support the [incremental refresh feature](../connect-data/incremental-refresh-overview.md), which provides automated partition management for tables that frequently load new and updated data.

Like for AAS, you can use a service principal as an automation account for Power BI semantic model management operations, such as refreshes. For more information, see [Semantic model connectivity with the XMLA endpoint (Service principals)](../enterprise/service-premium-connect-tools.md#service-principals).

### Custom security

Like for AAS, applications can use a service principal to query a Power BI Premium per capacity or Power BI Embedded semantic model by using the [CustomData](../developer/embedded/embed-azure-analysis-services.md#dynamic-security---rls) feature.

However, you can't assign a service principal to a model role in Power BI Premium. Instead, a service principal gains access by assignment to the workspace **admin** or **member** role.

> [!NOTE]
> You can't use the CustomData feature when querying Premium Per User (PPU) semantic models because it would be in violation of the [license terms and conditions](../enterprise/service-premium-connect-tools.md#terms-of-use).

### Impersonation for testing

Impersonation techniques, including the [EffectiveUserName](/analysis-services/instances/connection-string-properties-analysis-services#effectiveusername) and the [Roles](/analysis-services/instances/connection-string-properties-analysis-services#roles) connection string properties, are supported by AAS and Power BI Premium. You typically use them when testing security roles.

### Network security

Setting up network security in AAS requires enabling the firewall and configuring IP address ranges for only those computers accessing the server.

Power BI doesn't have a firewall feature. Instead, Power BI offers a superior network security model by using VNets and Private Links. For more information, see [What is a virtual network (VNet)?](/data-integration/vnet/what-is).

### Data sources and credentials

AAS defines credentials for each data source declared in the [TOM tabular metadata](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo). However, Power BI doesn't work that way. Because Power BI can share data sources credentials across multiple semantic models, credentials are set in the Power BI service.

Any XMLA-based process that sets data source credentials must be replaced. For more information, see [Semantic model connectivity with the XMLA endpoint (Deploy model projects from Visual Studio)](../enterprise/service-premium-connect-tools.md#deploy-model-projects-from-visual-studio-ssdt).

### Backup and restore

Backup and restore in AAS requires Azure Blob storage, while in Power BI Premium it requires an Azure Data Lake Storage Gen2 (ADLS Gen2) account. Apart from the storage account difference, backup and restore work the same way in both products.

For more information, see [Backup and restore semantic models with Power BI Premium](../enterprise/service-premium-backup-restore-dataset.md).

### On-premises data gateway

Both AAS and Power BI Premium use the same [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) to connect to data sources. However, the setup steps are different.

For information on how to set up gateway data sources for Power BI Premium, see [Add or remove a gateway data source](../connect-data/service-gateway-data-sources.md).

### Server properties

Unlike AAS, Power BI Premium doesn't support [server properties](/analysis-services/server-properties/server-properties-in-analysis-services). Instead, you manage [Premium capacity settings](../enterprise/service-admin-premium-workloads.md#semantic-models).

### Link files

Unlike AAS, Power BI Premium doesn't support [alias server names](/azure/analysis-services/analysis-services-server-alias).

### Dynamic management views (DMVs)

Some [DMVs](/analysis-services/instances/use-dynamic-management-views-dmvs-to-monitor-analysis-services) that work in AAS aren't accessible in Power BI Premium because they require Analysis Services server-admin permissions. Power BI has workspace roles, but there isn't a workspace role that grants the equivalent of Analysis Services server-admin permissions.

### PowerShell

You can use the [SqlServer PowerShell module](https://www.powershellgallery.com/packages/SqlServer/) AAS cmdlets to automate semantic model management tasks, including refresh operations. For more information, see [Analysis Services PowerShell Reference](/analysis-services/powershell/analysis-services-powershell-reference).

However, the [Az.AnalysisServices module](https://www.powershellgallery.com/packages/Az.AnalysisServices/) AAS cmdlets aren't supported for Power BI semantic models. Instead, use the [Microsoft Power BI Cmdlets for Windows PowerShell and PowerShell Core](/powershell/power-bi/overview?view=powerbi-ps&preserve-view=true).

### Diagnostic logging

AAS integrates with Azure Monitor for [diagnostic logging](/azure/analysis-services/analysis-services-logging). The most common target for AAS logs is to Log Analytics workspaces.

Power BI Premium also supports [logging to Log Analytics workspaces](../transform-model/log-analytics/desktop-log-analytics-overview.md). Currently, the events sent to Log Analytics are mainly AS engine events. However, not all events supported for AAS are supported for Power BI. The Log Analytics schema for Power BI contains differences compared to AAS, which means existing queries on AAS may not work in Power BI.

Power BI offers another diagnostic logging capability that isn't offered in AAS. For more information, see [Use the Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app).

SQL Server Extended Events (xEvents) are supported in AAS but not in Power BI Premium. For more information, see [Monitor Analysis Services with SQL Server Extended Events](/analysis-services/instances/monitor-analysis-services-with-sql-server-extended-events).

### Business-to-business (B2B)

Both AAS and Power BI support [Microsoft Entra B2B collaboration](/azure/active-directory/external-identities/what-is-b2b), which enables and governs sharing with external users. Notably, the User Principal Name (UPN) format required by AAS is different to Power BI.

To identify the user, Power BI utilizes a unique name claim in Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)) while AAS uses an email claim. While there may be many instances where these two identifiers align, the unique name format is more stringent. If using dynamic RLS in Power BI, ensure that the value in the user identity table matches the account used to sign in to Power BI.

### Scale-out

[Azure Analysis Services scale-out](/azure/analysis-services/analysis-services-scale-out) is supported by Power BI Premium. For more information see [Power BI semantic model scale out](../enterprise/service-premium-scale-out.md).

## Migration feature

The Microsoft Azure Analysis Services to Microsoft Power BI Premium migration feature in Power BI migrates as AAS database to a semantic model in Power BI Premium, Power BI Premium Per User, or Power BI Embedded workspace. For more information, see [Migrate Azure Analysis Services to Power BI](../enterprise/aas-pbi-migration-overview.md).

## Related content

For more information about this article, check out the following resources:

- [Migrate from Azure Analysis Services to Power BI Premium: Migration scenarios](migrate-azure-analysis-services-to-powerbi-premium-migration-scenarios.md)
- [Migrate Azure Analysis Services to Power BI](../enterprise/aas-pbi-migration-overview.md)
- Questions? [Try asking the Power BI community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com)

Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
