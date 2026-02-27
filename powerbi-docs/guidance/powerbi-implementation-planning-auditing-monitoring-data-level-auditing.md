---
title: "Power BI implementation planning: Data-level auditing"
description: "Learn about data-level auditing planning for Power BI."
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: Data-level auditing

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This data-level auditing article is targeted at multiple audiences:

- **Data creators and workspace administrators**: Users who need to understand usage, adoption, and performance of the semantic models, dataflows, and datamarts that they create, publish, and share.
- **Power BI administrators**: The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators might need to collaborate with IT, security, internal audit, and other relevant teams. Power BI administrators might also need to collaborate with content creators when troubleshooting performance.
- **Power BI capacity administrators**: The administrators responsible for overseeing Premium capacity in the organization. Power BI capacity administrators might need to collaborate with content creators when troubleshooting performance.
- **Center of Excellence, IT, and BI team**: The teams that are also responsible for overseeing Power BI. They might need to collaborate with Power BI administrators and other relevant teams.
- **System administrators**: The team that's responsible for creating and securing [Azure Log Analytics](/azure/azure-monitor/logs/log-analytics-workspace-overview) resources, and the database administrators who manage data sources.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

The concepts covered in this article apply primarily to solutions created for three [content delivery scopes](fabric-adoption-roadmap-content-delivery-scope.md), specifically enterprise BI, departmental BI, and team BI. Creators of personal BI solutions might find the information in this article useful as well; however, they're not the primary target.

Achieving good performance in reports and visuals isn't possible when the underlying semantic model and/or data source isn't performing well. This article focuses on auditing and monitoring of semantic models, dataflows, and datamarts. It's the second article in the auditing and monitoring series because the tools and techniques are more complex than what's described in the [Report-level auditing](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md) article. Ideally, you create shared semantic models (intended for reuse among many reports) before users create reports. Therefore, we recommend that you read this article together with the [Report-level auditing](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md) article.

Because Power BI semantic models are built upon the Analysis Services tabular engine, you can connect to a local data model (in Power BI Desktop) or a Premium semantic model (in the Power BI service) as if it's an Analysis Services database. Therefore, many of the auditing and monitoring capabilities of Analysis Services are supported for Power BI Premium semantic models.

> [!NOTE]
> For more information about models hosted in Analysis Services, see [Monitoring overview](/analysis-services/instances/monitor-an-analysis-services-instance?view=asallproducts-allversions&preserve-view=true).

The remainder of this article primarily focuses on models published to the Power BI service.

## Semantic model event logs

Over time, data creators and owners might experience situations with their semantic models. A semantic model can:

- Become more complex and include complex measures.
- Grow larger in data volume.
- Consume more memory (sometimes unnecessarily when poor design decisions were made).
- Use more diverse data sources, and more complex table relationships.
- Include more row-level security (RLS) rules. For more information, see [Enforce data security based on consumer identity](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity).
- Have more reports that depend on it. For more information about using [live connections](../connect-data/desktop-report-lifecycle-datasets.md) with a shared semantic model, see the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario.
- Have more downstream data models that depend on it. For more information about using [DirectQuery for Power BI semantic models and Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md) with a shared semantic model, see the [customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) usage scenario.
- Experience slower query execution and slower data refresh times.
- Contribute to slower rendering of reports and visuals.

To ensure usability, good performance, and adoption of the content they create, you should audit the usage and performance of the data assets you're responsible for managing. You can use the dataset event logs, which capture user-generated and system-generated activities that occur for a semantic model. They're also referred to as _trace events_, _dataset logs_, or _dataset activity logs_. System administrators often call them _low-level trace events_ because they're detailed.

> [!NOTE]
> The [dataset name change](../connect-data/service-datasets-rename.md) has been rolled out in the Power BI service and in documentation, though there might be some instances—like with event log [operation names](/fabric/admin/operation-list)—where the change hasn't occurred yet.

You should analyze semantic model trace events to:

- Audit all activities that occurred on a semantic model.
- Troubleshoot and optimize semantic model performance, memory usage, and query efficiency.
- Investigate [semantic model refresh](../connect-data/refresh-data.md) details and duration.
- Monitor [Power Query formula language](/powerquery-m/m-spec-introduction) (M queries) sent by Power Query.
- Monitor [DAX formulas and expressions](../transform-model/desktop-quickstart-learn-dax-basics.md) sent to the semantic model (Analysis Services engine).
- Verify whether the correct [storage mode](../transform-model/desktop-storage-mode.md) was selected based on the workloads and the need to balance fresh data and optimal performance.
- Audit which [row-level security](rls-guidance.md) roles are invoked, for which users, and on which semantic models.
- Understand the number of concurrent users.
- Validate a semantic model (for example, to verify data quality and performance before [endorsing](../collaborate-share/service-endorsement-overview.md) a semantic model, or before publishing it to a production workspace).

The events generated by a Power BI semantic model are derived from existing [diagnostic logs available for Azure Analysis Services](/azure/analysis-services/analysis-services-logging). There are many types of [trace events](/analysis-services/trace-events/analysis-services-trace-events) that you can capture and analyze, which are described in the following sections.

### Azure Log Analytics

Azure Log Analytics is a component of the [Azure Monitor](/azure/azure-monitor/) service. [Azure Log Analytics integration with Power BI](../transform-model/log-analytics/desktop-log-analytics-overview.md) allows you to capture semantic model events from all semantic models in a Power BI workspace. It's supported only for [Premium workspaces](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-type). After you set up integration and the connection is enabled (for a Power BI Premium workspace), semantic model events are automatically captured and continually sent to an Azure Log Analytics workspace. The semantic model logs are stored in [Azure Data Explorer](/azure/data-explorer/data-explorer-overview), which is an append-only database that's optimized for capturing high-volume, near-real time telemetry data.

You assign a Power BI Premium workspace to a Log Analytics workspace in Azure. You must create a new Log Analytics resource in your Azure subscription to enable this type of logging.

Logs from one or more Power BI workspaces will be sent to a target Log Analytics workspace. Here are some ways you can choose to organize the data.

- **One target workspace for all audit data**: Store all the data in one Log Analytics workspace. That's helpful when the same administrator or users will access all data.
- **Target workspaces organized by subject area**: Organize the content by subject area. This technique is particularly helpful when different administrators or users are permitted to access the audit data from Azure Log Analytics. For example, when you need to segregate sales data from operations data.
- **One target workspace for each Power BI workspace**: Set up a one-to-one relationship between a Power BI workspace and an Azure Log Analytics workspace. That's useful when you have particularly sensitive content, or when the data is subject to specific compliance or regulatory requirements.

> [!TIP]
> Thoroughly review the [documentation](../transform-model/log-analytics/desktop-log-analytics-overview.md) and [frequently asked questions](../transform-model/log-analytics/desktop-log-analytics-faq.md) on this functionality so that you're clear on what's possible and that you understand the technical requirements. Before making this functionality broadly available to workspace administrators in your organization, consider doing a technical proof of concept (POC) with one Power BI workspace.

> [!IMPORTANT]
> Although the names are similar, the data captured by Azure Log Analytics isn't the same as the Power BI activity log. Azure Log Analytics captures detail-level trace events from the Analysis Services engine. Its sole purpose is to help you analyze and troubleshoot semantic model performance. Its scope is at the workspace level. Conversely, the purpose of the activity log is to help you understand how often certain [user activities](/fabric/admin/operation-list) occur (such as editing a report, refreshing a semantic model, or creating an app). Its scope is the entire Power BI tenant.
>
> For more information about the user activities you can audit for your Power BI tenant, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

The _Azure Log Analytics connection for workspace administrators_ [tenant setting](../transform-model/log-analytics/desktop-log-analytics-configure.md#allow-workspace-level-logging-from-the-admin-portal) controls which groups of users (who also have the necessary [workspace admin role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles)) can connect a Power BI workspace to an existing Azure Log Analytics workspace.

Before you can set up integration, you must meet security [prerequisites](../transform-model/log-analytics/desktop-log-analytics-configure.md#prerequisites). Therefore, consider enabling the Power BI tenant setting only for Power BI workspace administrators who also have the required permissions in Azure Log Analytics, or who can obtain those permissions upon request.

> [!TIP]
> Collaborate with your Azure administrator early in the planning process, especially when getting approval to create a new Azure resource is a challenge in your organization. You'll also need to plan for the security prerequisites. Decide whether to grant permission to your Power BI workspace administrator in Azure, or whether to grant permission to the Azure administrator in Power BI.

The semantic model logs captured by Azure Log Analytics include the semantic model queries, query statistics, detailed refresh activity, CPU time consumed on Premium capacities, and more. Because they're detail-level logs from the Analysis Services engine, the data can be verbose. Large data volumes are common for large workspaces that experience high semantic model activity.

To optimize cost when using Azure Log Analytics with Power BI:

- [Connect Power BI workspaces to Azure Log Analytics](../transform-model/log-analytics/desktop-log-analytics-configure.md#configure-logging-in-a-premium-workspace) only when you're actively troubleshooting, testing, optimizing, or investigating semantic model activity. When connected, a trace runs on all the semantic models in the workspace.
- [Disconnect Azure Log Analytics](../transform-model/log-analytics/desktop-log-analytics-configure.md#disconnect-azure-log-analytics) from a Power BI workspace when you no longer need to actively troubleshoot, test, optimize, or investigate semantic model activity. By disconnecting, you're terminating the trace from running on all the semantic models in the workspace.
- Make sure you understand the [cost model](/azure/azure-monitor/logs/cost-logs) for how Azure Log Analytics bills for data ingestion, storage, and queries.
- Don't store the data in Log Analytics for longer than the default 30-day retention period. That's because semantic model analysis typically focuses on immediate troubleshooting activities.

There are several ways to access the events that are sent to Azure Log Analytics. You can use:

- The prebuilt Log Analytics for Power BI Semantic Models template app.
- The Power BI Desktop [connector](/azure/data-explorer/power-bi-connector) for Azure Data Explorer (Kusto). Use the [Kusto Query Language](/azure/data-explorer/kusto/query/) (KQL) to analyze the data that's stored in Log Analytics. If you have SQL query experience, you'll find many similarities with KQL.
- The [web-based query](/azure/data-explorer/web-query-data) experience in Azure Data Explorer.
- Any query tool that can run KQL queries.

> [!TIP]
> Because there's a high volume of semantic model trace events, we recommend that you develop a DirectQuery model to analyze the data. A DirectQuery model allows you to query the data in near-real time. The events usually arrive within five minutes.

For more information, see [Govern Azure connections](powerbi-implementation-planning-tenant-administration.md#govern-azure-connections).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to use Azure Log Analytics, key decisions and actions include:

> [!div class="checklist"]
> - **Consider a technical POC**: Plan for a small project to ensure that you fully understand the technical requirements, security requirements, which events to capture, and how to analyze the logs.
> - **Decide which workspaces should be integrated with Log Analytics**: Determine which Premium workspaces contain semantic models that you're interested to analyze.
> - **Decide whether Log Analytics should be enabled full-time for any workspaces**: For cost optimization, determine whether there are situations (or specific workspaces) where logging should be enabled permanently. Decide whether workspaces should be disconnected when troubleshooting isn't occurring.
> - **Decide how long to retain Log Analytics data**: Determine whether there's a need to set a longer retention period than the 30-day default.
> - **Clarify the process for requesting new Log Analytics workspace**: Collaborate with your Azure administrator to clarify how requests for a new Log Analytics resource should be submitted by Power BI workspace administrators.
> - **Decide how security will work**: Collaborate with your Azure administrator to decide whether it's more feasible for a Power BI workspace administrator to be granted rights to an Azure Log Analytics workspace, or for a Azure administrator to be granted rights to a Power BI workspace. As you make this security decision, consider your plan to connect and disconnect workspaces regularly (for cost optimization).
> - **Decide how to organize the target Log Analytics workspaces**: Consider how many Azure Log Analytics workspaces will be appropriate to organize the data from one or more Power BI workspaces. Align this decision with your security decisions for who can access the log data.
> - **Decide which workspace administrators are allowed to connect**: Determine which groups of workspace administrators can connect a Power BI workspace to a Log Analytics workspace. Set the _Azure Log Analytics connection for workspace administrators_ tenant setting to align with this decision.
> - **Create the Azure Log Analytics resource**: Collaborate with your Azure administrator to create each Log Analytics workspace. Verify and update the permissions that are assigned in Azure to ensure that the Power BI configuration can occur without any issues. Validate that the data stored in Azure is in the correct geographic region.
> - **Set the Log Analytics connection for each Power BI workspace**: Collaborate with your Power BI workspace administrators to set up the connection to Log Analytics for each Power BI workspace. Verify that the log data is flowing correctly to the Log Analytics workspace.
> - **Create queries to analyze the data**: Set up KQL queries to analyze the data in Log Analytics based on your use case and current needs.
> - **Include guidance for Power BI workspace administrators**: Provide information and prerequisites to your Power BI workspace administrators for how to request a new Log Analytics workspace and how to connect to a Power BI workspace. Also, explain when it's appropriate to disconnect a Power BI workspace.
> - **Provide guidance and sample queries for analyzing the data**: Create KQL queries for workspace administrators to make it easier for them to get started with analyzing the data that's been captured.
> - **Monitor costs**: Collaborate with your Azure administrator to monitor Log Analytics costs on an ongoing basis.

### SQL Server Profiler

You can use [SQL Server Profiler](/analysis-services/instances/use-sql-server-profiler-to-monitor-analysis-services) (SQL Profiler) to capture Power BI semantic model events. It's a component of [SQL Server Management Studio](/sql/ssms/download-sql-server-management-studio-ssms) (SSMS). Connectivity to a Power BI semantic model is supported with SSMS because it's based on the Analysis Services architecture that originated in SQL Server.

You can use SQL Profiler during different stages of the lifecycle of a semantic model.

- **During data model development**: SQL Profiler can connect to a data model in Power BI Desktop as an [external tool](../transform-model/desktop-external-tools.md). This approach is useful for data modelers who want to validate their data model, or do performance tuning.
- **After the semantic model is published to the Power BI service**: SQL Profiler can connect to a semantic model in a Premium workspace. SSMS is one of many supported [client tools](../enterprise/service-premium-connect-tools.md#client-applications-and-tools) that can use the [XMLA endpoint](../enterprise/service-premium-connect-tools.md) for connectivity. This approach is useful when you want to audit, monitor, validate, troubleshoot, or tune a published semantic model in the Power BI service.

It's also possible to use SQL Profiler as an external tool within [DAX Studio](https://daxstudio.org/). You can use DAX Studio to start a profiler trace, parse the data, and format the results. Data modelers who use DAX Studio often prefer this approach versus using SQL Profiler directly.

> [!NOTE]
> Using SQL Profiler is a different use case to the activity of _profiling data_. You [profile data](/power-query/data-profiling-tools) in the Power Query Editor to gain a deeper understanding of its characteristics. While data profiling is an important activity for data modelers, it's not in scope for this article.

Consider using SQL Profiler instead of Azure Log Analytics when:

- Your organization doesn't allow you to use or create Azure Log Analytics resources in Azure.
- You want to capture events for a data model in Power BI Desktop (that hasn't been published to a Premium workspace in the Power BI service).
- You want to capture events for one semantic model for a short period of time (rather than all semantic models in a Premium workspace).
- You want to capture certain events only during a trace (such as only the _Query End_ event).
- You want to start and stop traces on a frequent basis (like when you need to capture semantic model events that are occurring now).

Like Azure Log Analytics (described earlier in this article), semantic model events captured by SQL Profiler are derived from existing [diagnostic logs available for Azure Analysis Services](/azure/analysis-services/analysis-services-logging). However, there are some differences in the events that are available.

> [!TIP]
> The use of SQL Profiler for monitoring Analysis Services is covered in many books, articles, and blog posts. Most of that information is relevant for monitoring a Power BI semantic model.

> [!IMPORTANT]
> You can also use SQL Profiler to monitor queries sent from the Power BI service to the underlying data sources (for example, to a SQL Server relational database). However, the capability to trace a relational database is deprecated. Connecting to the Analysis Services engine is [supported](/sql/tools/sql-server-profiler/sql-server-profiler?view=sql-server-ver15&preserve-view=true) and _not_ deprecated. If you're familiar with [Analysis Services extended events](/analysis-services/instances/monitor-analysis-services-with-sql-server-extended-events) and you prefer to use them, connectivity from SSMS is possible for a data model in Power BI Desktop. However, it's not supported for Power BI Premium. Therefore, this section focuses only on standard SQL Profiler connectivity.

The _Allow XMLA endpoints and Analyze in Excel with on-premises semantic models_ tenant setting controls which groups of users (who are also assigned to the Contributor, Member, or Admin [workspace role](../collaborate-share/service-roles-new-workspaces.md), or the [Build](../connect-data/service-datasets-build-permissions.md) permission for the individual semantic model) can use the XMLA endpoint to query and/or maintain semantic models in the Power BI service. For more information about using the XMLA endpoint, see the [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) usage scenario.

> [!NOTE]
> You can also use SQL Profiler to help debug and troubleshoot specific DAX expressions. You can connect SQL Profiler to Power BI Desktop as an [external tool](../transform-model/desktop-external-tools.md). Look for the _DAX Evaluation Log_ event class to view intermediary results of a DAX expression. That event is generated when you use the [EVALUATEANDLOG](/dax/evaluateandlog-function-dax) DAX function in a model calculation.
>
> This function is only intended for development and test purposes. You should remove it from your data model calculations before publishing the data model to a production workspace.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to use SQL Profiler, key decisions and actions include:

> [!div class="checklist"]
> - **Decide who can have SSMS or DAX Studio installed**: Determine whether you'll allow all the Power BI content creators in your organization to install SSMS and/or DAX Studio so they can use SQL Profiler. Decide whether these ancillary tools are installed upon request, or part of a standard set of software that's installed for approved data creators in the organization.
> - **Add SQL Profiler to the External Tools menu in Power BI Desktop**: If data creators will use SQL Profiler often, ask IT to automatically add it to the External Tools menu in Power BI Desktop for these users.
> - **Decide who can use the XMLA endpoint**: Determine whether all users are permitted to connect to published semantic models by using the XMLA endpoint, or whether it's limited to approved data creators only. Set the _Allow XMLA endpoints and Analyze in Excel with on-premises semantic models_ tenant setting to align with this decision.
> - **Provide guidance and sample queries for analyzing the data**: Create documentation for your data creators so they understand the recommended way to audit and monitor semantic models. Provide guidance for common use cases to make it easier for them to get started gathering and analyzing trace data.

## Data model metadata

Because Power BI semantic models are built upon the Analysis Services engine, you have access to the tools that can query the metadata of a data model. Metadata includes everything about the data model, including table names, column names, and measure expressions.

### Dynamic management views

The Analysis Services [Dynamic Management Views](/analysis-services/instances/use-dynamic-management-views-dmvs-to-monitor-analysis-services) (DMVs) can query the data model metadata. You can use the DMVs to audit, document, and optimize your data models at a point in time.

Specifically, you can:

- Audit the data sources used by a model.
- Discover which objects are consuming the most memory in a model.
- Determine how efficiently column data can be compressed.
- Find columns in a model that aren't used.
- Audit active user sessions and connections.
- Verify the structure of the model.
- Review DAX expressions used by calculated tables, calculated columns, measures, and [row-level security](rls-guidance.md) (RLS) rules.
- Identify dependencies between objects and measures.

> [!TIP]
> The DMVs retrieve information about the _current state_ of a semantic model. Think of the data returned by DMVs as a snapshot of what's occurring at a point in time. Conversely, the semantic model event logs (described earlier in this article) retrieve information about what _activities_ occurred for a semantic model while a trace connection was active.

[SSMS](/sql/ssms/download-sql-server-management-studio-ssms) is a tool commonly used to run [DMV queries](/analysis-services/instances/use-dynamic-management-views-dmvs-to-monitor-analysis-services?view=asallproducts-allversions&preserve-view=true#tools-and-permissions). You can also use the [Invoke-ASCmd](/powershell/module/sqlserver/invoke-ascmd) PowerShell cmdlet to create and execute [XMLA](/analysis-services/xmla/xml-for-analysis-xmla-reference) scripts that query the DMVs.

[Third-party tools](../enterprise/service-premium-connect-tools.md#client-applications-and-tools) and [external tools](../transform-model/desktop-external-tools.md) are also popular with the Power BI community. These tools use the publicly documented DMVs to simplify access and to work with data returned by the DMVs. One example is [DAX Studio](https://daxstudio.org/), which includes explicit functionality to access the DMVs. DAX Studio also includes a built-in _View Metrics_ feature, which is commonly known as _Vertipaq Analyzer_. Vertipaq Analyzer has a user interface for analyzing the structure and size of tables, columns, relationships, and partitions in a data model. You can also export (or import) the data model metadata to a .vpax file. The exported file only contains metadata about the data model structure and size, without storing any model data.

> [!TIP]
> Consider sharing a .vpax file with someone when you need assistance with a data model. That way, you won't share the model data with that person.

You can use DMV queries during different stages of the lifecycle of a semantic model.

- **During data model development**: Your tool of choice can connect to a data model in Power BI Desktop as an [external tool](../transform-model/desktop-external-tools.md). This approach is useful for data modelers who want to validate their data model, or do performance tuning.
- **After the semantic model is published to the Power BI service**: Your tool of choice can connect to a semantic model in a Premium workspace. SSMS is one of many supported [client tools](../enterprise/service-premium-connect-tools.md#client-applications-and-tools) that use the [XMLA endpoint](../enterprise/service-premium-connect-tools.md) for connectivity. This approach is useful when you want to audit or validate a published semantic model in the Power BI service.

> [!TIP]
> If you decide to write your own DMV queries (for example, in SSMS), be aware that the DMVs don't support all SQL operations. Also, some DMVs aren't supported in Power BI (because they require Analysis Services server administrator permissions that aren't supported by Power BI).

The _Allow XMLA endpoints and Analyze in Excel with on-premises semantic models_ tenant setting controls which groups of users (who are also assigned to the Contributor, Member, or Admin [workspace role](../collaborate-share/service-roles-new-workspaces.md), or the [Build](../connect-data/service-datasets-build-permissions.md) permission for the individual semantic model) can use the XMLA endpoint to query and/or maintain semantic models in the Power BI service.

For more information about using the XMLA endpoint, third-party tools, and external tools, see the [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) usage scenario.

### Best Practice Analyzer

[Best Practice Analyzer](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance/) (BPA) is a feature of [Tabular Editor](https://tabulareditor.com/), which is a third-party tool that's achieved widespread adoption by the Power BI community. BPA includes a set of customizable rules that can help you audit the quality, consistency, and performance of your data model.

> [!TIP]
> To set up BPA, download the set of best practice rules, which are provided by Microsoft on [GitHub](https://github.com/microsoft/Analysis-Services/tree/master/BestPracticeRules).

Primarily, BPA can help you improve consistency of models by detecting suboptimal design decisions that can reduce performance issues. It's helpful when you have self-service data modelers distributed throughout different areas of the organization.

BPA can also help you audit and govern your data models. For example, you can verify whether a data model includes any [row-level security](rls-guidance.md) (RLS) roles. Or, you can validate whether all model objects have a description. That's helpful when, for example, your goal is to ensure that a data model includes a data dictionary.

BPA can expose design issues that can help the [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md) determine whether more training or documentation is necessary. It can take action to educate data creators on best practices and organizational guidelines.

> [!TIP]
> Keep in mind that BPA can detect the _existence_ of a characteristic (such as row-level security). However, it might be difficult to determine whether it's set up correctly. For that reason, a subject matter expert might need to conduct a review . Conversely, the _non-existence_ of a particular characteristic doesn't necessarily mean a bad design; the data modeler might have a good reason for producing a particular design.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to access metadata for data models, key decisions and actions include:

> [!div class="checklist"]
> - **Decide who can have SSMS installed**: Determine whether you'll allow all Power BI content creators in your organization to install SSMS so that they can connect to published semantic models. Decide whether it's installed upon request, or as part of a standard set of software that's installed for approved data creators in the organization.
> - **Decide who can have third-party tools installed**: Determine whether you'll allow all Power BI content creators in your organization to install third-party tools (such as DAX Studio and Tabular Editor) so that they can monitor local data models and/or published semantic models. Decide whether they're installed upon request, or as part of a standard set of software that's installed for approved data creators in the organization.
> - **Set up best practice rules**: Decide which Best Practice Analyzer rules can scan the data models in your organization.
> - **Decide who can use the XMLA endpoint**: Determine whether all users are permitted to connect to semantic models by using the XMLA endpoint, or whether it's limited to approved data creators only. Set the _Allow XMLA endpoints and Analyze in Excel with on-premises semantic models_ tenant setting to align with this decision.
> - **Provide guidance for content creators**: Create documentation for your data creators so that they understand the recommended way(s) to analyze semantic models. Provide guidance for common use cases to make it easier for them to start gathering and analyzing DMV results and/or using Best Practice Analyzer.

## Data model and query performance

Power BI Desktop includes several [tools](monitor-report-performance.md#use-query-diagnostics) that help data creators troubleshoot and investigate their data models. These capabilities are targeted at data modelers who want to validate their data model, and do performance tuning before publishing to the Power BI service.

### Performance Analyzer

Use [Performance Analyzer](../create-reports/desktop-performance-analyzer.md), which is available in Power BI Desktop, to audit and investigate performance of a data model. Performance Analyzer helps report creators measure the performance of individual report elements. Commonly, however, the root cause of performance issues is related to data model design. For this reason, a semantic model creator can benefit from using Performance Analyzer too. If there are different content creators responsible for creating reports versus semantic models, it's likely that they'll need to collaborate when troubleshooting a performance issue.

> [!TIP]
> You can use [DAX Studio](https://daxstudio.org/) to import and analyze the log files generated by Performance Analyzer.

For more information about Performance Analyzer, see [Report-level auditing](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md#performance-analyzer).

### Query Diagnostics

Use [Query Diagnostics](/power-query/QueryDiagnostics), which are available in Power BI Desktop, to investigate the performance of Power Query. They're useful for troubleshooting, and for when you need to understand what the Power Query engine is doing.

The information you can gain from Query Diagnostics includes:

- Extra detail related to error messages (when an exception occurs).
- The queries that are sent to a data source.
- Whether [query folding](power-query-folding.md) is or isn't occurring.
- The number of rows returned by a query.
- Potential slowdowns during a data refresh operation.
- Background events and system-generated queries.

Depending on what you're looking for, you can enable one or all the logs: aggregated, detailed, performance counters, and data privacy partitions.

You can start session diagnostics in Power Query Editor. Once enabled, query and refresh operations are collected until diagnostic tracing is stopped. The data is populated directly in the query editor as soon as the diagnostics are stopped. Power Query creates a _Diagnostics_ group (folder), and adds several queries to it. You can then use standard Power Query functionality to view and analyze the diagnostics data.

Alternatively, you can enable a trace in Power BI Desktop in the _Diagnostics_ section of the _Options_ window. Log files are saved to a folder on your local machine. These log files are populated with the data after you close Power BI Desktop, at which time the trace is stopped. Once Power BI Desktop is closed, you can open the log files with your preferred program (such as a text editor) to view them.

### Query evaluation and folding

Power Query supports various capabilities to help you understand [query evaluation](/power-query/query-folding-basics), including the [query plan](/power-query/query-plan). It can also help you determine whether [query folding](/power-query/power-query-folding) is occurring for an entire query, or for a subset of steps in a query. Query folding is one of the most important aspects of performance tuning. It's also helpful to review the [native queries](/power-query/native-query-folding) sent by Power Query when you're monitoring a data source, which is [described later](#data-refresh-monitoring) in this article.

### Premium metrics app

When troubleshooting, it can be helpful to collaborate with your Power BI Premium capacity administrator. The capacity administrator has access to the [Power BI Premium utilization and metrics app](../enterprise/service-premium-metrics-app.md). This app can provide you with a wealth of information about activities that occur in the capacity. That information can help you troubleshoot semantic model issues.

> [!TIP]
> Your Premium capacity administrator can grant access to additional users (non-capacity administrators) to allow them to access the Premium metrics app.

The Premium metrics app comprises an internal semantic model and an initial set of reports. It helps you perform near-real-time monitoring of a Power BI Premium capacity (P SKU) or Power BI Embedded (A SKU) capacity. It includes data for the last two to four weeks (depending on the metric).

Use the Premium metrics app to troubleshoot and optimize semantic models. For example, you can identify semantic models that have a large [memory footprint](/fabric/enterprise/metrics-app#considerations-and-limitations) or that experience routinely high [CPU usage](/fabric/enterprise/metrics-app#considerations-and-limitations). It's also a useful tool to find semantic models that are approaching the limit of your capacity size.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering approaches to use for monitoring data model and query performance, key decisions and actions include:

> [!div class="checklist"]
> - **Identify semantic model query performance targets**: Ensure that you have a good understanding of what good semantic model performance means. Determine when you'll require specific query performance targets (for example, queries to support reports must render within five seconds). If so, make sure the targets are communicated to the data creators in your organization.
> - **Identify semantic model refresh performance targets**: Determine when you'll require specific data refresh targets (for example, completion of a data refresh operation within 15 minutes and prior to 5am). If so, make sure the targets are communicated to the data creators in your organization.
> - **Educate your support team**: Ensure that your internal user support team is familiar with the diagnostic capabilities so they're ready to support Power BI users when they need help.
> - **Connect your support team and database administrators**: Make sure that your support team knows how to contact the correct administrators for each data source (when troubleshooting query folding, for example).
> - **Collaborate with your Premium capacity administrator**: Work with your capacity administrator to troubleshoot semantic models that reside in a workspace that's assigned to Premium capacity or Power BI Embedded capacity. When appropriate, request access to the Premium metrics app.
> - **Provide guidance for content creators**: Create documentation for your data creators so that they understand what actions to take when troubleshooting.
> - **Include in training materials**: Provide guidance to your data creators about how to create well-performing data models. Help them adopt good design habits early. Focus on teaching data creators how to make good design decisions.

## Data source monitoring

Sometimes it's necessary to directly monitor a specific data source that Power BI connects to. For example, you might have a data warehouse that's experiencing an increased workload, and users are reporting performance degradation. Typically, a database administrator or system administrator monitors data sources.

You can monitor a data source to:

- Audit which users are sending queries to the data source.
- Audit which applications (like Power BI) are sending queries to the data source.
- Review what query statements are sent to the data source, when, and by which users.
- Determine how long it takes for a query to run.
- Audit how row-level security is invoked by the source system when it's using single sign-on (SSO).

There are many actions that a Power BI content creator might take once they analyze monitoring results. They could:

- Tune and refine the queries that are sent to the data source so they're as efficient as possible.
- Validate and tune the [native queries](/power-query/native-database-query) that are sent to the data source.
- Reduce the number of columns that are imported into a data model.
- Remove high precision and high cardinality columns that are imported into a data model.
- Reduce the amount of historical data that's imported into a data model.
- Adjust the Power BI data refresh times to help spread out the demand for the data source.
- Use [incremental data refresh](../connect-data/incremental-refresh-overview.md) to reduce the load on the data source.
- Reduce the number of Power BI data refreshes by consolidating multiple semantic models into a [shared semantic model](../connect-data/service-datasets-across-workspaces.md).
- Adjust [automatic page refresh](../create-reports/desktop-automatic-page-refresh.md) settings to increase the refresh frequency, and therefore reduce the load on the data source.
- Simplify calculations to reduce the complexity of queries sent to the data source.
- Change the [data storage mode](../transform-model/desktop-storage-mode.md) (for example, to import mode instead of DirectQuery) to reduce the consistent query load on the data source.
- Use [query reduction techniques](../connect-data/desktop-directquery-about.md#report-design) to reduce the number of queries that are sent to the data source.

System administrators might take other actions. They could:

- Introduce an intermediary data layer, such as Power BI dataflows (when a data warehouse isn't a viable option). Power BI content creators can use the dataflows as their data source instead of connecting directly to data sources. An intermediary data layer can reduce the load on a source system. It also has the added benefit of centralizing data preparation logic. For more information, see the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario.
- Change the data source location to reduce the impact of network latency (for example, use the same [data region](powerbi-implementation-planning-tenant-setup.md#location-for-data-storage) for the Power BI service, data sources, and gateways).
- Optimize the data source so it more efficiently retrieves data for Power BI. Several commons techniques include creating table indexes, creating indexed views, creating persisted computed columns, maintaining statistics, using in-memory or columnstore tables, and creating materialized views.
- Direct users to use a read-only replica of the data source, rather than an original production database. A replica might be available as part of a high availability (HA) database strategy. One advantage of a read-only replica is to reduce contention on the source system.

The tools and techniques that you can use to monitor data sources depend on the technology platform. For example, your database administrator can use [extended events](/sql/relational-databases/extended-events/extended-events) or the [Query Store](/sql/relational-databases/performance/monitoring-performance-by-using-the-query-store) for monitoring Azure SQL Database and SQL Server databases.

Sometimes, Power BI accesses a data source through a [data gateway](../connect-data/service-gateway-onprem.md). Gateways handle connectivity from the Power BI service to certain types of data sources. However, they do more than just connect to data. A gateway includes a mashup engine that performs processing and data transformations on the machine. It also compresses and encrypts the data so that it can be efficiently and securely transmitted to the Power BI service. Therefore, an unmanaged, or non-optimized, gateway can contribute to performance bottlenecks. We recommend that you talk to your gateway administrator for help with monitoring gateways.

> [!TIP]
> Your Power BI administrator can compile a full tenant inventory (which includes lineage) and access user activities in the activity log. By correlating the lineage and user activities, administrators can identify the most frequently used data sources and gateways.
>
> For more information about the tenant inventory and the activity log, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to monitor a data source, key decisions and actions include:

> [!div class="checklist"]
> - **Determine specific goals**: When monitoring a data source, get clarity about exactly what you need to accomplish and the goals for troubleshooting.
> - **Collaborate with database administrators**: Work with your database or system administrator(s) to get their help when monitoring a specific data source.
> - **Collaborate with gateway administrators**: For data sources that connect through a data gateway, collaborate with the gateway administrator when troubleshooting.
> - **Connect your support team and database administrators**: Make sure that your support team knows how to contact the correct administrators for each data source (for example, when troubleshooting query folding).
> - **Update training and guidance**: Include key information and tips for data creators about how to work with organizational data sources. Include information about what to do when something goes wrong.

## Data refresh monitoring

A [data refresh](../connect-data/refresh-data.md) operation involves importing data from underlying data source(s) into a Power BI semantic model, dataflow, or datamart. You can schedule a data refresh operation or run it on-demand.

### Service-level agreement

IT commonly uses service-level agreements (SLAs) to document the expectations for data assets. For Power BI, consider using an SLA for critical content or enterprise-level content. It commonly includes when users can expect updated data in a semantic model to be available. For example, you could have an SLA that all data refreshes must complete by 7am every day.

### Semantic model logs

The [semantic model event logs](#semantic-model-event-logs) from Azure Log Analytics or SQL Profiler (described previously in this article) include detailed information about what's happening in a semantic model. The captured events include semantic model refresh activity. The event logs are especially useful when you need to troubleshoot and investigate semantic model refreshes.

### Premium capacity semantic models

When you have content that's hosted in a Power BI Premium capacity, you have more capabilities to monitor data refresh operations.

- The [Power BI refresh summaries](../connect-data/refresh-summaries.md) page in the admin portal includes a summary of the refresh history. This summary provides information about refresh duration and error messages.
- The [Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) also includes helpful refresh information. It's useful when you need to investigate refresh activity for a Power BI Premium capacity (P SKU), Power BI Embedded (A SKU) capacity, or Fabric capacities.

### Enhanced semantic model refreshes

Content creators can initiate semantic model refreshes programmatically by using [enhanced refresh](../connect-data/asynchronous-refresh.md#get-refreshes) with the [Refresh Dataset in Group](/rest/api/power-bi/datasets/refresh-dataset-in-group) Power BI REST API. When you use enhanced refresh, you can [monitor](../connect-data/asynchronous-refresh.md#get-refreshes) the historical, current, and pending refresh operations.

### Data refresh schedule monitoring

Power BI administrators can monitor data refresh schedules in the tenant to determine whether there are many refresh operations scheduled concurrently during a specific timeframe (for example, between 5am and 7am, which could be a particularly busy data refresh time). Administrators have permission to access the semantic model refresh schedule metadata from the [metadata scanning APIs](/fabric/governance/metadata-scanning-overview), which are known as the _scanner APIs_.

### Power BI REST APIs

For critical semantic models, don't rely solely on email notifications for monitoring data refresh issues. Consider compiling the data refresh history in a centralized store where you can monitor, analyze, and act upon it.

You can retrieve data refresh history by using:

- The [Get Refresh History in Group](/rest/api/power-bi/datasets/get-refresh-history-in-group) REST API to retrieve refresh information for a _workspace_.
- The [Get Refreshables for Capacity](/rest/api/power-bi/admin/get-refreshables-for-capacity) REST API to retrieve refresh information for a _capacity_.

> [!TIP]
> We strongly recommend that you monitor the refresh history of your semantic models to ensure that current data is available to reports and dashboards. It also helps you to know whether SLAs are being met.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for data refresh monitoring, key decisions and actions include:

> [!div class="checklist"]
> - **Determine specific goals**: When monitoring data refreshes, get clarity about exactly what you need to accomplish and what the scope of monitoring should be (for example, production semantic models, certified semantic models, and others).
> - **Consider setting up an SLA**: Determine whether an SLA would be useful to set expectations for data availability and when data refresh schedules should run.
> - **Collaborate with database and gateway administrators**: Work with your database or system administrator(s), and gateway administrators, to monitor or troubleshoot data refresh.
> - **Knowledge transfer for support team**: Make sure that your support team knows how to help content creators when data refresh issues arise.
> - **Update training and guidance**: Include key information and tips for data creators about how to refresh data from organizational data sources and common data sources. Include best practices and organizational preferences for how to manage data refresh.
> - **Use a support email address for notifications**: For critical content, set up refresh notifications to use a support email address.
> - **Set up centralized refresh monitoring**: Use the Power BI REST APIs to compile data refresh history.

## Dataflow monitoring

You create a Power BI [dataflow](../transform-model/dataflows/dataflows-introduction-self-service.md) with Power Query Online. Many of the query performance features, and the Power Query diagnostics, which were [described earlier](#query-diagnostics), are applicable.

Optionally, you can set workspaces to use Azure Data Lake Storage Gen2 for [dataflow storage](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md) (known as _bring-your-own-storage_) rather than internal storage. When you use bring-your-own-storage, consider [enabling telemetry](/azure/storage/blobs/data-lake-storage-best-practices#monitor-telemetry) so that you can monitor metrics for the storage account. For more information, see the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario, and the [advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenario.

You can use the Power BI REST APIs to monitor dataflow transactions. For example, use the [Get Dataflow Transactions](/rest/api/power-bi/dataflows/get-dataflow-transactions) API to check the status of dataflow refreshes.

You can track user activities for Power BI dataflows with the Power BI activity log. For more information, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

> [!TIP]
> There are many best practices that you can adopt to optimize your dataflow designs. For more information, see [Dataflows best practices](../transform-model/dataflows/dataflows-best-practices.md).

## Datamart monitoring

A Power BI [datamart](../transform-model/datamarts/datamarts-overview.md) includes several integrated components, including a dataflow, a managed database, and a semantic model. Refer to the previous sections of this article to learn about auditing and monitoring of each component.

You can track user activities for Power BI datamarts by using the Power BI activity log. For more information, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

## Related content

In the [next article in this series](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md), learn about tenant-level auditing.
