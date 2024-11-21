---
title: "Power BI implementation planning: Integration with Other Services"
description: "This article helps you to plan how and when to integrate Power BI and Microsoft Fabric with other services."
author: peter-myers
ms.author: daengli
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 10/12/2024
ms.collection: ce-skilling-ai-copilot
---

# Power BI implementation planning: Integration with other services

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to plan how and when to integrate Power BI and Microsoft Fabric with other services. This article is primarily targeted at:

- **BI and analytics directors and managers**: Decision makers who are responsible for overseeing the BI program and strategy. These individuals decide whether to use other services to support specific strategic objectives, or to complement Fabric or Power BI.
- **Fabric administrators**: The administrators who are responsible for overseeing Fabric in the organization. Fabric administrators control which services can integrate with Fabric by enabling [Integration tenant settings](/fabric/admin/service-admin-portal-integration), and they set up tenant-level integration with services in Azure or Microsoft Teams. Often, Fabric administrators need to collaborate with other administrators to facilitate this integration.
- **Center of Excellence (COE), IT, and BI teams**: The teams that are responsible for overseeing Power BI in the organization. These teams look for opportunities to use services that when integrated help people solve problems or use Power BI more effectively.
- **Content owners and content creators**: The teams and individuals that champion analytics in a team or department. These teams and individuals perform workspace-level and solution-level integration to support specific needs and use cases, where permitted.

When you use Power BI, you might experience certain needs or challenges that you can't address with the core Power BI tools and features. In these situations you can consider integrating Power BI with other services. Most of these services are Microsoft services, like Azure or Microsoft 365, but you can also integrate Power BI with custom or third-party services. Extending the functionality of Power BI in these ways can help solve new problems, and it allows people to become more effective with their regular tasks.

Here are some common scenarios involving the integration of Power BI with other services:

- You have specific requirements that mandate the use of another service. For example, you must integrate with [Azure Private Link](/azure/private-link/private-link-overview) to connect to services over a [private endpoint](/azure/private-link/private-endpoint-overview) in your virtual network.
- You encounter specific challenges that can't be overcome with Power BI alone. For example, you use [Azure Log Analytics](../transform-model/log-analytics/desktop-log-analytics-overview.md) integration to obtain detailed query diagnostics of your semantic models for troubleshooting and auditing.
- You want to use services that you already use, or extend the capabilities of Power BI. For example, you can allow Excel users to connect to semantic models by using the [Excel add-in](../collaborate-share/service-analyze-in-excel.md) to insert connected PivotTables.

You can integrate Power BI with other services at the level of your tenant, your workspace, or individual solutions (like semantic models and reports):

- **Tenant-level integration**: Affects the entire tenant and is set up by Fabric administrators, usually in collaboration with other administrators. For example, [Teams integration](../collaborate-share/service-collaborate-microsoft-teams.md) is set up at the tenant level. Another example that affects networking is [Azure ExpressRoute](/power-platform/guidance/expressroute/overview).
- **Workspace-level integration**: Affects all content in the workspace and is set up by workspace administrators. For example, [Git integration](/fabric/cicd/git-integration/intro-to-git-integration) is set up at the workspace level to achieve source control with [Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true), which is a service of [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops?view=azure-devops&preserve-view=true).
- **Solution-level integration**: Affects a single content item and is set up by the content creator. For example, [Python](../connect-data/desktop-python-visuals.md) or [R](../connect-data/service-r-packages-support.md) is set up at the solution level to enable the creation of custom, interactive visuals.

For all three of these levels, there are considerations you should keep in mind when you integrate Power BI with other services:

- **Security considerations**: Integrating other services inevitably results in more risks that you must mitigate to use them successfully. For example, integration with AI services has the potential to expose internal data to external services that train their models. To mitigate this risk, ensure that you proactively evaluate any security risks and considerations of integrating a service. Also, identify concrete actions to ensure compliance with data security and privacy policies in your region and organization.
- **Licensing considerations**: Integrating other services might require a specific subscription or license. For example, integrating Power BI reports with [PowerApps](/power-apps/powerapps-overview) is only possible when you have the appropriate PowerApps licenses. For each service, ensure that you evaluate whether you need a specific license or subscription to integrate it, and what the estimated cost is per user or capacity. Do this evaluation not only for the services, but also for Fabric and Power BI per-user and per-capacity licenses.
- **Governance considerations**: Integrating other services results in more diverse activities and operations that people undertake in your tenant, some of which might lead to inappropriate practices. For example, integration of Power BI reports with OneDrive or SharePoint might lead to people sharing Power BI Desktop (.pbix) files directly with report viewers. This approach diverts from the better practices of publishing the report to a workspace and sharing it via direct access, workspace viewer roles, or a Power BI app. Therefore, you should proactively identify any potential governance risks before you integrate a service, and identify the effort needed to monitor and support the service in your tenant.
- **Mentoring and user enablement considerations**: Integrating other services might require time and effort to train users to use any new capabilities effectively. For example, if you allow users to integrate Excel with Power BI, you should train users about how to effectively use [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md#analyze-in-excel). Training should guide them on when to use it, and inform them of its considerations and limitations. Ensure that you proactively plan how to train and support people that will use this integration.

The remainder of this article describes the possibilities to integrate Power BI with other services at the level of your tenant, workspaces, and individual solutions (like reports or semantic models).

> [!NOTE]
> This article provides an overview of the different services that you can integrate with Power BI, and the potential use cases to do so. The purpose of this article _is not_ to guide you in the technical steps required to set up or troubleshoot the integration. You will find links to technical information in each respective section of this article.

## Tenant-level integration

Fabric administrators can integrate some services for use across the entire tenant. Typically, this integration facilitates broader interoperability between Fabric or Power BI and related services, like those available in Azure. Tenant-level integration can also affect how certain data is handled.

> [!IMPORTANT]
> For an overview of the relevant administration settings a Fabric administrator can use to control integration of Microsoft Fabric or Power BI with external services, see [Integration tenant settings](/fabric/admin/service-admin-portal-integration). A Fabric administrator can control integration with services across all levels with these tenant settings.

### Integration with Azure services

You can integrate your tenant with a wide range of Azure services that you might already use to store or manage your data. This integration helps you apply the scope and benefits of Azure services from within Fabric and Power BI. It also enables more advanced capabilities that can support many roles, from administrators and centralized teams to decentralized content owners or creators.

Integrating with Azure services requires that you have an active Azure subscription for them. Additionally, there are some specific licensing considerations for this option. Using sensitivity labels and DLP policies requires an Azure Information Protection Premium P1 or Premium P2 license. Users might require a Power BI Pro or Premium Per User (PPU) license to use features resulting from this integration, like applying sensitivity labels. Finally, some of these services also require that you have Fabric or Premium capacity, and they might use your capacity resources.

For guidance on how to integrate with Azure services, see:

- [Azure Information Protection](../enterprise/service-security-enable-data-sensitivity-labels.md) for sensitivity labels and data loss prevention (DLP) policies
- [Azure Synapse Analytics](/fabric/onelake/onelake-azure-synapse-analytics)
- [Azure Databricks](/fabric/onelake/onelake-azure-databricks)
- [Databricks Unity Catalog](/fabric/onelake/onelake-unity-catalog)
- [Azure HDInsight](/fabric/onelake/onelake-azure-hdinsight)
- [Azure Automation](/azure/automation/overview)

While not necessarily Azure services, you can also use the following tools available for tenant-level integration with Power BI:

- [PowerShell](/fabric/onelake/onelake-powershell)
- [Azure Storage Explorer](/fabric/onelake/onelake-azure-storage-explorer)

#### Integration with AI services

Apart from [Copilot in Fabric](/fabric/get-started/copilot-fabric-overview), there are various AI services that you can integrate with Fabric and Power BI. These services can help you perform advanced analytics to apply specific models to your data, depending on your needs and use cases.

Integrating with AI Azure services requires that you have an active Azure subscription for them. Additionally, some of these services also require that you have Fabric or Premium capacity, and they will use your capacity resources. To ensure that these workloads don't have a negative impact on your capacity utilization, ensure that you set a memory limit for AI workloads within your capacity. That way, you can avoid unexpected usage of your capacity units (CUs). For more information, see [Manage impact on a Premium capacity](../transform-model/desktop-ai-insights.md#manage-impact-on-a-premium-capacity).

For guidance on how to integrate with the different AI services in Azure, see:

- [Azure OpenAI Services](/fabric/data-science/ai-services/how-to-use-openai-via-rest-api)
- [Azure AI Services (Text Analytics and Vision)](../transform-model/desktop-ai-insights.md#use-text-analytics-and-vision)
- [Azure AI Translator](/fabric/data-science/ai-services/how-to-use-text-translator?tabs=rest)
- [Azure Machine Learning](../transform-model/desktop-ai-insights.md#use-azure-machine-learning)

#### Integrate Azure AI Services in Power Query

You can invoke specific AI functions in Power Query by using Azure AI Services. These functions run by using Fabric capacity or Premium capacity for a selected workspace. They can derive useful information from less-structured text or image data.

Use cases for Azure AI Services integration with a semantic model or dataflow include:

- [Language detection](../transform-model/desktop-ai-insights.md#detect-language) from text in a field.
- [Key phrase extraction](../transform-model/desktop-ai-insights.md#extract-key-phrases) from text in a field.
- [Sentiment analysis](../transform-model/desktop-ai-insights.md#score-sentiment) of text from input fields.
- [Image classification](../transform-model/desktop-ai-insights.md#tag-images) of images of recognizable objects, entities, scenes, or actions.

#### Integrate Azure Machine Learning in Power Query

Similarly to how you can use Azure AI Services, you can apply machine learning models to your data by [invoking dynamic Power Query functions](../transform-model/desktop-ai-insights.md#invoke-an-azure-machine-learning-model-in-power-query). These machine learning models must have schema files generated in Python by the model creator.

Dataflow Gen1 creators can also use [AutoML](../transform-model/dataflows/dataflows-machine-learning-integration.md#work-with-automl) to create their own machine learning models by using Power BI during data preparation. Creators can choose a specific type of model, either [binary prediction](../transform-model/dataflows/dataflows-machine-learning-integration.md#binary-prediction-models), [general classification](../transform-model/dataflows/dataflows-machine-learning-integration.md#classification-models), or [regression](../transform-model/dataflows/dataflows-machine-learning-integration.md#regression-models). Next, they train these models with input data, and evaluate the results before they [apply the model](../transform-model/dataflows/dataflows-machine-learning-integration.md#apply-the-automl-model) to new or updated data after dataflow refresh.

Use cases for Azure Machine Learning integration with a semantic model or dataflow Gen1 include:

- Conduct predictive modeling in Power BI without needing a deep expertise in data science tools or Python.
- Perform simple churn prediction and forecasting.
- Apply organizational models in Azure Machine Learning to enrich data in Power BI.

### Integration for Independent Software Vendors

Independent software vendors (ISVs), who produce and sell software, can integrate with Fabric to support and extend their applications.

There are three different models that ISVs can use to integrate with Fabric:

- **[Interop model](/fabric/cicd/partners/partner-integration#interop-with-fabric-onelake)**: ISVs can integrate with OneLake through various tools, such as the OneLake APIs, and others.
- **[Develop on Fabric model](/fabric/cicd/partners/partner-integration#develop-on-fabric)**: ISVs can develop their own products and services on Fabric, and even embed the capabilities of Fabric in their software.
- **[Build a Fabric workload model](/fabric/cicd/partners/partner-integration#build-a-fabric-workload)**: ISVs can use the Microsoft Fabric Workload Development Kit to create and [monetize](/fabric/workload-development-kit/monetization) workloads.

For more information about how ISVs can integrate with Fabric, see [Microsoft Fabric Integration Pathways for ISVs](/fabric/cicd/partners/partner-integration).

### Microsoft Teams integration

You can integrate your tenant with Microsoft Teams to allow users to access Fabric and Power BI from within the Teams application. This capability is a convenient way to centralize collaboration and promote adoption of both Teams and Power BI.

For more information about how to integrate teams with Power BI, see:

- [Add the Power BI app to Microsoft Teams](../collaborate-share/service-microsoft-teams-app.md): Integrate the Power BI experience into Microsoft Teams.
- [Embed interactive reports in Teams channels and chats with a Power BI tab](../collaborate-share/service-embed-report-microsoft-teams.md): Help colleagues find and discuss your team's data.
- [Use interactive reports in Teams meetings](../consumer/business-user-teams-meetings.md): Discuss a report during a meeting, or use the report to support the meeting objectives.
- [Create a link preview in the Teams message box](../collaborate-share/service-teams-link-preview.md): Paste links to reports, dashboards, or Power BI apps.
- [Chat in Microsoft Teams directly from within the Power BI service](../collaborate-share/service-share-report-teams.md): Share a filtered view of reports and dashboards, and start conversations.
- [View all the Power BI tabs you have in Microsoft Teams](../collaborate-share/service-teams-pivot.md): Select the _In Teams_ tab on the Power BI app home page.
- [Get notified in the Teams activity feed](../collaborate-share/service-teams-notifications.md): Quickly learn when important events happen in Power BI.

Use cases for Teams integration with Power BI include:

- Curate a [centralized portal](../guidance/fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) for your [community of practice](../guidance/fabric-adoption-roadmap-community-of-practice.md) and embed key Power BI reports and resources.
- Create dedicated teams or teams channels for content distributed from a Power BI app, where people can share feedback, issues, or ask questions about the content.
- Train users to make [shared views](../collaborate-share/service-share-reports.md) that they can share via Teams to discuss specific perspectives or data points.

### Geospatial services integration

When you work with geospatial data, you'll probably want to visualize it in interactive map visuals with Power BI. However, these visuals require integration with other services, which you can control at the tenant-level by using the tenant settings. These visuals can be effective in reports that present geospatial data, but you should ensure that using these services doesn't violate any data residency or compliance requirements.

For more information about how to integrate Power BI with various geospatial services, see:

- [ArcGIS visualizations in Power BI reports](../visuals/power-bi-visualizations-arcgis.md), which use Esri services.
- [Azure Maps visualizations for Power BI reports](https://go.microsoft.com/fwlink/?linkid=2132636), which use Azure services.
- [Map](../visuals/desktop-shape-map.md) and [filled map visuals](../visuals/power-bi-visualization-filled-maps-choropleths.md), which use Bing services.

> [!WARNING]
> Geospatial services might use other services that are outside of the geographic region of your Power BI tenant, compliance boundary, or national cloud instance. Furthermore, these services might store and process your data where they maintain facilities, and use of these services might be subject to separate terms and privacy policies beyond Power BI.
>
> This warning also applies to any third-party custom visual that you use to visualize geospatial information.

## Workspace-level integration

You can integrate certain services at the level of individual workspaces. These services can enable capabilities to help you develop, manage, and view content in a workspace.

### Git integration

If your workspace uses Fabric capacity, Premium capacity, or PPU license modes, you can use [Git integration](/fabric/cicd/git-integration/intro-to-git-integration) to connect a workspace to a remote Git repository to support more advanced lifecycle management scenarios. A remote Git repository facilitates [source control](../guidance/powerbi-implementation-planning-content-lifecycle-management-develop-manage.md#source-control-by-using-a-remote-git-repository) of files, which allows content creators to [track and manage changes](../guidance/powerbi-implementation-planning-content-lifecycle-management-develop-manage.md#decide-how-youll-use-version-control). Git integration also promotes [collaboration](../guidance/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md#collaboration-flow-diagram) among developers, particularly when using [branches](/fabric/cicd/git-integration/manage-branches) to isolate development of specific features before integrating those changes into a main branch with a merge before deployment.

In brief, content creators can develop content either locally or in the Power BI service, then commit and push those changes to a remote Git repository, like [Azure Repos](/azure/devops/repos/get-started/what-is-repos) or [GitHub Enterprise](/visualstudio/subscriptions/access-github). For information about how to set up and use Git integration for Power BI and Fabric, see [Get started with Git integration](/fabric/cicd/git-integration/git-get-started?tabs=commit-to-git) or [Tutorial: end-to-end lifecycle management](/fabric/cicd/cicd-tutorial).

Content creators store Power BI Project (.pbip) files, metadata files, and documentation in a central Azure Repos remote repository. These files are curated by a [technical owner](../guidance/powerbi-adoption-roadmap-content-ownership-and-management.md#ownership-and-stewardship). While a content creator develops a solution, a technical owner is responsible for managing the solution and reviewing the changes and merging them into a single solution. Azure Repos provides more sophisticated options for tracking and managing changes compared to SharePoint and OneDrive. Maintaining a well-curated, documented repository is essential because it's the foundation of all content and collaboration.

Consider using source control to track and manage changes in the following scenarios:

- Centralized or decentralized teams create and manage the content.
- Content creators collaborate by using Azure DevOps.
- Content creators are familiar with Git, source control management, or [DataOps architecture design](/azure/architecture/data-guide/azure-dataops-architecture-design).
- Content creators manage complex or important content, or they expect the content to scale and grow in complexity and importance.

To help you effectively use source control with Azure DevOps, you need to be aware of considerations and meet certain prerequisites:

- **Git**: To commit and push changes to a remote repository, content creators need to [download](https://git-scm.com/downloads) and install _Git_. Git is a distributed version control system that tracks changes in your files. To learn about the basics of Git, see [What is Git?](/devops/develop/git/what-is-git).
- **Tools**: To use Git, content creators need to use either a [command line interface (CLI)](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line) or a graphical user interface (GUI) client that has integrated source control management (SCM), like [Visual Studio](/visualstudio/extensibility/internals/source-control) or [Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/overview).
- **Licenses and permissions**: To create and use an Azure Repos Git repository, content creators must:
  - Have their Azure DevOps [access level](/azure/devops/organizations/billing/buy-basic-access-add-users?view=azure-devops&preserve-view=true) set to _Basic_ (as opposed to _Stakeholder_).
  - Belong to an Azure DevOps [organization](/azure/devops/user-guide/manage-organization-collection?view=azure-devops&preserve-view=true#add-users-to-your-organization) and a [project](/azure/devops/organizations/security/add-users-team-project?view=azure-devops&tabs=preview-page&preserve-view=true).
  - Have appropriate Azure DevOps [repository permissions](/azure/devops/repos/git/set-git-repository-permissions?view=azure-devops&preserve-view=true).
  - Work with Power BI items only due to the Git integration constraints when using a Power BI Premium capacity (A SKUs) or PPU workspaces.
- **Fabric Git integration**: To sync content in a remote repository with a Fabric workspace, content creators use [Fabric Git integration](/fabric/cicd/git-integration/intro-to-git-integration). This tool is important because it tracks and manages changes to content that's created in the Fabric portal, like dataflows.

### Integrate Azure Log Analytics

You can use Azure Log Analytics to gather valuable information to support [data-level auditing](../guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md#azure-log-analytics) of workspace items. Azure Log Analytics is a component of the [Azure Monitor](/azure/azure-monitor/) service. Specifically, [Azure Log Analytics integration with Power BI](../transform-model/log-analytics/desktop-log-analytics-overview.md) allows you to capture semantic model events from all semantic models in a Power BI workspace. It's only supported for workspaces that use Fabric or Premium capacity. For information about how to set up and use Azure Log Analytics for Power BI and Fabric, see [Data-level auditing: Azure Log Analytics](../guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md#azure-log-analytics) and [Configure Azure Log Analytics in Power BI](../transform-model/log-analytics/desktop-log-analytics-configure.md).

After you set up Azure Log Analytics integration and the connection is enabled (for a supported workspace), semantic model events are automatically captured and continually sent to an Azure Log Analytics workspace. The semantic model logs are stored in [Azure Data Explorer](/azure/data-explorer/data-explorer-overview), which is an append-only database that's optimized for capturing high-volume, near real-time telemetry data.

Use cases for using Azure Log Analytics include:

- You want to monitor strategically important semantic models, like centralized models that you provide to decentralized teams in a [managed self-service](../guidance/powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario.
- You want to audit or investigate semantic models that have a high impact on resource utilization, like Fabric capacity.
- You want detailed analytics about query and usage patterns for semantic models.

To use Azure Log Analytics, you must set up and pay for an [Azure Log Analytics workspace](/services-hub/unified/health/log-analytics-workspace) as part of your Azure subscription. You pay for Azure Log Analytics with a pay-as-you-go subscription. For more information, see [Azure Log Analytics Pricing](/services-hub/unified/health/azure-pricing).

### Integrate Azure Data Lake Storage Gen2

You can connect a workspace to an Azure Data Lake Storage (ADLS) Gen2 account. When you connect a workspace to ADLS Gen2, you can store data for Power BI dataflows (also called dataflows Gen1) and semantic model backups. For information about how to set up and use ADLS Gen2 to store data from Power BI dataflows, see [Configuring dataflow storage to use Azure Data Lake Gen 2](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md).

Setting [Azure connections](../admin/service-admin-portal-azure-connections.md) in the Fabric admin portal doesn't mean that all Power BI dataflows for the tenant are stored by default in an ADLS Gen2 account. To use a specific storage account (instead of internal storage), each workspace must be explicitly connected. It's critical that you set the workspace Azure connections _before you create any Power BI dataflows_ in the workspace.

The following two sections present reasons why you might integrate a workspace with ADLS Gen2.

#### Storage of Power BI dataflows data

If you bring your own data lake, the data for Power BI dataflows (Gen1) can be accessed directly in Azure. Direct access to [dataflow storage in ADLS Gen2](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md) is helpful when you want other users or processes to view or access the data. It's especially helpful when your goal is to reuse dataflows data beyond Power BI.

There are two options for assigning storage:

- [Tenant-level storage](../guidance/powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#tenant-level-storage): This option is helpful when you want to centralize all data for Power BI dataflows into one ADLS Gen2 account.
- [Workspace-level storage](../guidance/powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#workspace-level-storage): This option is helpful when business units manage their own data lake or have certain data residency requirements.

> [!TIP]
> If you use Fabric, we recommend that you use [dataflows Gen2](/fabric/data-factory/dataflows-gen2-overview), which can store data in [different destinations](/fabric/data-factory/dataflows-gen2-overview#data-destinations), including [OneLake](/fabric/onelake/onelake-overview). Dataflows Gen2 are more flexible than dataflows Gen1, because they provide more options to [integrate with other data pipelines](/fabric/data-factory/dataflows-gen2-overview#integration-with-data-pipelines) and they benefit from [high-scale compute](/fabric/data-factory/dataflows-gen2-overview#high-scale-compute).

#### Backup and restore for Power BI semantic models

The [Power BI semantic model backup and restore feature](../enterprise/service-premium-backup-restore-dataset.md) is supported for workspaces that are assigned to Fabric capacity, Premium capacity, or PPU. This feature uses the same ADLS Gen2 account that's used to store Power BI dataflows data (described in the previous section).

Semantic model backups help you:

- Comply with data retention requirements.
- Store routine backups as part of a [disaster recovery strategy](/azure/well-architected/reliability/disaster-recovery).
- Store backups in a different region.
- Migrate a data model.

## Solution-level integration

You can integrate certain services at the level of individual items, like semantic models or reports. These integrations can enable specific use cases and extend the functionality of your Power BI items.

### Integration with Microsoft Fabric

Power BI is part of Fabric, but Power BI is a distinct workload in Fabric that can integrate with the other experiences that are unified under the Fabric umbrella. If you're familiar with only working with Power BI, it's important to understand the possibilities and opportunities to apply other workloads, items, and features in Fabric.

The following sections present examples of how you can integrate Power BI content with Fabric to extend the capabilities of Power BI.

#### OneLake integration with semantic models

Content creators who make Power BI semantic models can use [OneLake integration](../enterprise/onelake-integration-overview.md) to write model tables to [Delta tables in OneLake](/fabric/data-engineering/lakehouse-and-delta-tables). After the initial copying of the in-memory tables, they can then be reused from OneLake for other use cases, without the need to copy them. The Delta tables are accessible via a [lakehouse](/fabric/data-engineering/lakehouse-overview) in Fabric. Users can also create shortcuts to access the tables so they can use them from another lakehouse or a different item type, like a [data warehouse](/fabric/data-warehouse/data-warehousing).

Use cases for using OneLake integration with semantic models include:

- Reuse data from a semantic model that isn't already available in OneLake.
- Reuse data from a semantic model for use in another Fabric experience.
- Create snapshots of a semantic model table.

#### Semantic link integration with semantic models via notebooks

Content creators who build semantic models or analyze data in notebooks can use [semantic link](/fabric/data-science/semantic-link-overview) to read and write to semantic models from a notebook in Fabric. Semantic link has a wide range of benefits for Power BI developers, including enhanced productivity, automation, and the ability to quickly and easily perform ad hoc analysis in code.

Use cases for using semantic link integration with semantic models include:

- Automate testing of semantic models by evaluating DAX queries and comparing the results to known baselines.
- Programmatically manage semantic models by running [Best Practice Analyzer](../guidance/powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md#best-practice-analyzer) over multiple models at the same time to identify and classify possible issues.
- Save common templates and patterns for DAX measures and business logic (like currency conversion) that can be applied to new semantic models.
- Analyze and visualize data from a semantic model by using Python.
- Validate models created by data scientists by using the business logic from a semantic model.
- Use data from a semantic model to enrich analysis.

> [!TIP]
> The [semantic-link-labs](https://github.com/microsoft/semantic-link-labs/) Python library further extends the utility of semantic link. It's a valuable tool for anyone who creates and manages semantic models and wants to improve productivity and efficiency of the model creation or management process.

Even if you don't know Python, you can use [Copilot](/fabric/get-started/copilot-notebooks-chat-pane) and [Chat-magics](/fabric/get-started/copilot-notebooks-chat-magics) to gain assistance writing functional Python code to obtain a useful result.

#### Fabric Activator integration with Power BI reports

Content creators or consumers who build or use Power BI reports can use [Activator](/fabric/real-time-intelligence/data-activator/data-activator-get-data-power-bi) to automate actions and notifications based on data changes. Similar to [data alerts from dashboard tiles](../create-reports/service-set-data-alerts.md), a user can set alerts on a Power BI visual and define triggers for those alerts. The user can also extend this functionality to use [Custom actions to trigger a Power Automate flow](/fabric/real-time-intelligence/data-activator/data-activator-trigger-power-automate-flows) that can initiate other downstream changes.

Use cases for Activator integration with Power BI include:

- Automated anomaly detection, by setting an alert to trigger when a value exceeds a threshold.
- Automated regression testing of business-critical reports, by setting an alert to trigger when a value (like previous year sales, or a budget variance) exceeds a threshold.

### Integration with Microsoft Office 365

There are many ways to integrate Power BI with Microsoft 365 products, like [Excel](../collaborate-share/service-connect-power-bi-datasets-excel.md), [PowerPoint](../collaborate-share/service-power-bi-powerpoint-add-in-about.md), and [Outlook](/power-platform-release-plan/2022wave1/power-bi/power-bi-integration-outlook-office-hub).

#### Use Power BI data in Excel

Users who prefer working in Excel can use either Analyze in Excel or live connected tables to use Power BI data.

Content consumers who have Build permission for a semantic model can connect to the model from Excel to use [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md). This approach allows users to explore models so they can perform their own ad hoc analysis with PivotTables.

Use cases for Analyze in Excel include:

- Users prefer to analyze data in Excel instead of using Power BI.
- Users want to conduct [personal BI](../guidance/powerbi-implementation-planning-usage-scenario-personal-bi.md) to create their own reports in Excel.
- Users want to use Power BI data to support existing analysis in Excel.

> [!TIP]
> If you expect users to connect to a semantic model from Excel, ensure that you take the necessary steps to train them how to use it, and organize your semantic model in a helpful way. For example, organize fields into display folders, and hide tables and fields that aren't intended for use in reports.

Analyze in Excel uses Multidimensional Expressions (MDX) for queries instead of Data Analysis Expressions (DAX) used by Power BI reports. MDX queries can experience poorer performance compared to equivalent DAX queries. Ensure that users understand that they should use Analyze in Excel for high-level aggregate analysis, and perform more detailed analysis by using Power BI or other Fabric experiences.

Also, some features in a semantic model, like [field parameters](../create-reports/power-bi-field-parameters.md) and [dynamic measure format strings](../create-reports/desktop-dynamic-format-strings.md), don't work in Analyze in Excel. For other considerations and limitations, see [this article](../collaborate-share/service-analyze-in-excel.md#considerations-and-limitations).

You can also get Power BI data in Excel by using [live-connected tables](../collaborate-share/service-analyze-in-excel.md#export-to-excel-with-live-connection). With this approach, users who export data from a Power BI report visual receive an Excel workbook that contains a table populated with data. The table query automatically retrieves the latest data when the workbook is opened, or when the table is manually refreshed.

Use cases for live-connected tables include:

- Users want to investigate or analyze the data in a particular visual.
- Users need to regularly export data to support a valid business case.
- You're performing manual testing of a [semantic model](../guidance/powerbi-implementation-planning-content-lifecycle-management-validate.md#manually-test-semantic-models) or [report](../guidance/powerbi-implementation-planning-content-lifecycle-management-validate.md#manually-test-reports).

While exporting live-connected tables is better than exporting disconnected tables from a Power BI report, you should encourage users to avoid exporting any data. Exported data presents governance challenges and data security risks that can lead to data exfiltration from the organization. Instead, consider training users to connect to semantic models from Excel or Power BI Desktop to perform their own analysis, and to safely share the results with their colleagues.

Managing data exports is an important [change management](../guidance/fabric-adoption-roadmap-change-management.md) exercise to improve the maturity of your [data culture](../guidance/fabric-adoption-roadmap-data-culture.md) and enable people to use Power BI effectively.

#### Integrate Power BI reports in PowerPoint

You can use the [Power BI add-in for PowerPoint](../collaborate-share/service-power-bi-powerpoint-add-in-about.md) to add live, interactive Power BI reports or specific visuals to PowerPoint slides. This feature is a good alternative to inserting static screenshots because the visuals can be filtered and interacted with during a presentation.

PowerPoint is a useful tool to complement existing Power BI reports, but it doesn't scale as a primary distribution method. Instead, use report distribution methods, like Power BI apps, and look for opportunities for PowerPoint integration to complement or extend them.

Managing distribution of reports as flat files and PowerPoint presentations is an important [change management](../guidance/fabric-adoption-roadmap-change-management.md) exercise to improve the maturity of your [data culture](../guidance/fabric-adoption-roadmap-data-culture.md) and [content delivery scope](../guidance/fabric-adoption-roadmap-content-delivery-scope.md), and to enable people to use Power BI effectively.

Use cases of Power BI integration in PowerPoint include:

- [Continuously play a presentation in slide show mode](../collaborate-share/service-power-bi-powerpoint-add-in-view-present.md#automatically-refresh-data-during-slide-shows) with up-to-date Power BI reports, for example on a large screen in a factory.
- Freeze snapshots of a specific view so that report data doesn't update automatically, for example when you want to review point-in-time reports from a past date.
- Share a presentation with live Power BI reports so people can see the latest data, for example when you want an audience to review the presentation and reports before you present it.

Fabric administrators can control its use with the _[Enable Power BI add-in for PowerPoint](/fabric/admin/service-admin-portal-export-sharing#enable-power-bi-add-in-for-powerpoint)_ tenant setting. For other considerations and limitations, see [this article](../collaborate-share/service-power-bi-powerpoint-add-in-about.md#considerations-and-limitations).

### Integration with Power Platform

Power BI is part of [Power Platform](/power-platform/). As such, Power BI integrates well with other applications in the Power Platform family, such as Power Apps, Power Automate, and Power Pages.

- [Power Apps](/power-apps/powerapps-overview) lets you quickly create and deploy low-code applications in your organization.
- [Power Automate](/power-automate/getting-started) lets you automate tasks and workflows by creating logical flows that trigger either automatically, on a schedule, or in response to a manual action. You can create [cloud flows](/power-automate/overview-cloud) that run unattended without a dedicated machine. You can also use the [Power Automate desktop application](/power-automate/desktop-flows/getting-started-windows-11) to author [desktop flows](/power-automate/overview-cloud) that require a machine because they use robotic process automation to simulate user actions.
- [Power Pages](/power-pages/introduction) lets you create external-facing business websites with a low-code user interface.

#### Use the Power Apps visual in a Power BI report

You can integrate Power Apps in Power BI by using the [Power Apps visual](/power-apps/maker/canvas-apps/powerapps-custom-visual). This visual allows you to display an interactive, functional Power Apps canvas app within a Power BI report. In Power BI, you can select fields to add to the Power Apps visual. Then, in Power Apps, you can use these fields to create data-driven labels and functionality to enhance your app. Together, the integration of Power BI reports and Power Apps enables a wide range of use cases that can help people make decisions and take actions by using data in a report.

There are some licensing considerations to keep in mind if you take this approach. To use the Power Apps visual in the Power BI report, a report viewer must have a [Power Apps license](/power-platform/admin/pricing-billing-skus) in addition to any required Power BI per-user licenses. Alternatively, you can use a [pay-as-you-go plan](/power-platform/admin/pay-as-you-go-overview) for Power Apps and Power Automate.

Use cases of the Power Apps visual include:

- Facilitate writeback to a database, for example to add comments to certain customers or to modify forecast values from within a Power BI report.
- Facilitate direct actions informed by the Power BI report, such as contacting customers from a customer satisfaction report.
- Allow users to submit forms from within the Power BI report, such as feedback forms, polls, or surveys.

In an embedded scenario, the Power Apps visual is only supported for the [Embed for your organization](../developer/embedded/embed-organization-app.md) scenario and not the [Embed for your customers](../developer/embedded/embed-customer-app.md) scenario. For other limitations, see [Limitations of the Power Apps visual](/power-apps/maker/canvas-apps/powerapps-custom-visual#limitations-of-the-power-apps-visual).

#### Integrate a Power BI report in a Power Apps canvas app

You can integrate [Power BI dashboard tiles within a Power Apps canvas app](/power-apps/maker/canvas-apps/how-to/build-powerbi-visual). With this approach, the primary consumption medium is the Power App, which is enhanced by the Power BI tile. You embed tiles by using the [Power BI tile control](/power-apps/maker/canvas-apps/controls/control-power-bi-tile) during canvas app development.

#### Take actions in Power BI from Power Automate

You can use Power Automate to automate specific actions in Power BI, such as report export, semantic models refresh, or DAX query evaluation. This capability can be helpful to streamline certain tasks or improve productivity.

Use cases for automating Power BI from Power Automate include:

- Trigger refresh of a semantic model when an upstream data source is updated.
- Automate distribution of Power BI reports or paginated reports.
- Add rows to a Power BI semantic model table when a flow is triggered.

#### Trigger a Power Automate flow from Power BI

You can also use Power BI to trigger a Power Automate cloud flow in three ways:

- Use the Power Automate visual in a Power BI report.
- Use data alerts from a Power BI dashboard tile.
- [Create flows to notify changed goals](../create-reports/service-goals-power-automate.md) in Power BI.

With this approach, you aren't automating Power BI actions as much as you're responding to events that happen in Power BI. These events can either be triggered manually (like the Power Automate visual) or automatically (like data alerts). You can also use data from Power BI downstream in the flows, which can help you automate more specific and relevant actions.

There are some licensing considerations to keep in mind with this approach. To use the Power Automate visual in a Power BI report, the report viewer must have access to the Power Automate flow and a [Power Automate license](/power-platform/admin/power-automate-licensing/types), if necessary, in addition to any required Power BI per-user licenses. Alternatively, you can use a [pay-as-you-go plan](/power-platform/admin/pay-as-you-go-overview) for Power Apps and Power Automate.

Use cases for triggering a Power Automate flow from Power BI include:

- Update or add rows to an Excel table from within a Power BI report by using the Power Automate visual.
- Automate regression testing by setting up reports and dashboards to report differences in current values with known baselines, and by setting data alerts on dashboard tiles.
- Notify a team or individual when there are unexpected values or anomalies in semantic model data by using data alerts. To use the Power Automate visual in a Power BI report, the report viewer must have access to the Power Automate flow and a [Power Automate license](/power-platform/admin/power-automate-licensing/types), if necessary, in addition to any required Power BI per-user licenses. Alternatively, you can use a [pay-as-you-go plan](/power-platform/admin/pay-as-you-go-overview) for Power Apps and Power Automate.

#### Embed a Power BI report in a Power Pages website

You can [embed a Power BI report in a Power Pages website](/power-pages/admin/set-up-power-bi-integration), which allows you to show Power BI reports on your external-facing website made with Power Pages. This approach streamlines the Embed for your customers scenario by [enabling the Power BI Embedded service](/power-pages/admin/set-up-power-bi-integration#enable-power-bi-embedded-service) from the Power Platform admin center.

There are some licensing considerations to keep in mind with this approach. To embed Power BI reports in a Power Pages website, you must have an F, P, EM, or A SKU. You also need an appropriate [Power Pages license](/power-platform/admin/powerapps-flow-licensing-faq#power-pages).

Use cases for embedding a Power BI report in a Power Pages website include:

- Distribute reports via a custom portal to external users or customers.
- Display website analytics, like subscribers or traffic for your website.
- Enhance your Power Pages website with interactive Power BI visualizations.

In addition to the [limitations of Power BI Embedded](../developer/embed-service-principal.md#considerations-and-limitations), there are also [specific limitations for embedding a report in Power Pages](/power-pages/admin/set-up-power-bi-integration#considerations-and-limitations). For example, the report must be published to the same workspace as its connected semantic model. Ensure that you take these considerations into account before you decide to embed Power BI content in a Power Pages website.

### OneDrive and SharePoint integration

OneDrive and SharePoint are commonly used because they're convenient options to store content and data files for Power BI. By integrating OneDrive and SharePoint, you can further enhance their sharing capabilities.

#### OneDrive refresh of Power BI Desktop files

When you save a Power BI Desktop (.pbix) file to OneDrive for Work or School, or SharePoint, you can import that file into a workspace from OneDrive instead of publishing it from Power BI Desktop. By doing so, you can benefit from [OneDrive refresh](../connect-data/refresh-data.md#onedrive-refresh), where the data model is automatically updated, usually within an hour.

Use cases for using OneDrive refresh include:

- Self-service users want to streamline publishing of Power BI Desktop files.
- Content creators want to track and manage changes while collaborating in OneDrive.

In addition to integrating OneDrive for an individual .pbix file for semantic models and reports, you can also set up [workspace-level integration with OneDrive](../collaborate-share/service-create-the-new-workspaces.md#set-a-workspace-onedrive).

#### Preview Power BI Desktop files in OneDrive and SharePoint

When you share a Power BI Desktop file with people via OneDrive or SharePoint, they can [preview the report](../collaborate-share/service-sharepoint-viewer.md) from OneDrive or SharePoint without opening it in Power BI Desktop. This capability works only for reports that are connected to a shared semantic model, or Power BI Desktop files that contain a report and an import semantic model. Additionally, you can't preview Power BI Desktop files that are 1 GB or larger. For more information, see [Considerations and limitations](../collaborate-share/service-sharepoint-viewer.md#considerations-and-limitations).

There are some licensing considerations to keep in mind with this approach. Users require a Power BI Pro license to preview Power BI Desktop files in OneDrive or SharePoint. For more information, see [Prerequisites to viewing reports in OneDrive and SharePoint](../collaborate-share/service-sharepoint-viewer.md#prerequisites-to-viewing-report-in-onedrive-and-sharepoint).

Use cases for using OneDrive to preview files include:

- Content creators use OneDrive or SharePoint to facilitate collaboration.
- Content creators who use OneDrive integrations, like [OneDrive refresh](../connect-data/refresh-data.md#onedrive-refresh), or use it to [track and manage changes](../collaborate-share/service-sharepoint-viewer.md#version-history) to .pbix files, want the convenience to preview the files before they open them.

#### Embed Power BI reports in SharePoint Online

You can integrate Power BI with SharePoint by [embedding Power BI reports in SharePoint Online](../collaborate-share/service-embed-report-spo.md) (also known as _secure embed_). The report experience is the same as when users view them in a Fabric workspace by using a link shared with direct access. [Row-level security](/fabric/security/service-admin-row-level-security) is enforced, together with item permissions. Users must have direct access to reports in order to view them in a SharePoint site.

Use cases for embedding Power BI reports in SharePoint Online include:

- You want to distribute reports from a SharePoint portal instead of via a Fabric workspace. This approach can be useful when you want to distribute reports from several workspaces to a specific audience.
- You want to embed reports that support collaboration or decision making in your SharePoint site.

### Integration with Visual Studio and VS Code

Many developers are familiar with using [Visual Studio](/visualstudio/get-started/visual-studio-ide) or [Visual Studio Code (VS Code)](/shows/visual-studio-code/) to manage source files and metadata. These tools provide several options to integrate with Power BI and Fabric.

#### Develop semantic models by using Visual Studio with Analysis Services projects

If developers prefer working in Visual Studio, they can [develop and deploy semantic models from Visual Studio](/analysis-services/tools-and-applications-used-in-analysis-services?view=power-bi-premium-current&preserve-view=true) instead of Power BI Desktop. In this case, they need Visual Studio 2017 or a later edition, and the 2.9.14 version (or higher) of the SQL Server Data Tools (SSDT) extension.

> [!TIP]
> Developers who prefer a Visual Studio-like experience to build and manage semantic models may find it more effective to use [Tabular Editor](https://tabulareditor.com/). Tabular Editor is an external tool that connects to a local model open in Power BI Desktop, or a remote model via the XMLA read/write endpoint. It also supports scripting and batch tasking to improve developer productivity.
>
> For more information, see [Advanced data model management](../guidance/powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md).

#### Manage items with VS Code

If developers prefer working in VS Code, they can use extensions to facilitate some of their work with Power BI via the VS Code application.

There are several tools that they can use to manage different parts of Power BI from VS Code:

- **[TMDL](https://github.com/microsoft/vscode-tmdl)**: An official VS Code extension from Microsoft that provides language support for the Tabular Model Definition Language (TMDL) to work with semantic models that use the TMDL metadata format.
- **[Power BI Studio](https://marketplace.visualstudio.com/items?itemName=GerhardBrueckl.powerbi-vscode)**: A community-developed VS Code extension that uses the Power BI REST API to view and manage items in a workspace.
- **[Power BI VSCode Extension Pack](https://marketplace.visualstudio.com/items?itemName=GerhardBrueckl.powerbi-vscode-extensionpack)**: A collection of VS Code extensions that enables developers to work in VS Code with Fabric and Power BI. It includes both the TMDL and Power BI Studio extensions.

VS Code integration is also supported by other Fabric experiences, like [notebooks](/fabric/data-engineering/setup-vs-code-extension) for data engineering and data science, or for managing Power BI semantic models by using [semantic link](#semantic-link-integration-with-semantic-models-via-notebooks) (described earlier).

### Python or R integration

You can run Python or R scripts in Power BI semantic models and reports to extend the functionality of these items. This capability can be helpful for content creators who are familiar with Python or R, and who create and distribute content for business users via Power BI.

Content owners or creators who are proficient in Python or R might benefit from using [notebook items](/fabric/data-engineering/how-to-use-notebook) in a Fabric capacity. For many use cases, notebooks are a preferred option over Python and R integration with Power BI. That's because they provide more options to create and maintain solutions built in these languages, they also have fewer limitations and typically involve less effort to support.

#### Run Python or R code in a semantic model

You can integrate Python or R code as part of the data transformations that you perform in a semantic model that uses import storage mode. This integration lets you transform data or perform advanced analytics with Python or R whenever you refresh the model.

To refresh a published semantic model that uses Python or R integrated in Power Query, you must use an on-premises data gateway in [personal mode](../connect-data/service-gateway-personal-mode.md). That's because the Python or R code runs locally by using the Python or R installed on the machine. This setup is typically challenging to manage and maintain. If you need to use Python or R in a semantic model, we recommend alternative approaches, like notebooks in Fabric.

#### Create Python or R visuals in Power BI reports

You can integrate Python or R with Power BI reports in order to create custom visuals with Python libraries, like Seaborn or R packages like ggplot2. These visuals are fully customizable and support interactive features in Power BI like rendering a filtered result, cross-filtering, custom tooltips, drilldown, and drillthrough.

Ensure that all your Python or R visuals use [Python libraries](../connect-data/service-python-packages-support.md#python-packages-that-are-supported-in-power-bi) and [R packages](../connect-data/service-r-packages-support.md#r-packages-that-are-supported-in-power-bi) that are supported in Fabric. If you use an unsupported library or package, the visual won't render in the Power BI service, even when the visual renders in your report in Power BI Desktop.

While you can transform data and make calculations as part of a Python or R custom visual, it isn't recommended. Placing this logic in the Python or R visual can result in slower render durations, and greater difficulty to maintain the visual and achieve harmonization across visuals and reports in calculation logic.

Instead, add your logic to DAX calculations by creating measures, and perform your transformations further upstream, such as in Power Query or the data source, if possible.

### Custom visuals for Power BI reports

There are other options for creating custom visuals in Power BI reports aside from Python and R. While not explicitly integration, it's possible to use custom visuals in Power BI reports for advanced or specific use cases. You can [create your own custom visual](../developer/visuals/develop-power-bi-visuals.md)—which requires no integration with other services—or obtain a visual from [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals&exp=kyyw&page=1&filters=pay-as-you-go), which can be either free or [requires a license](../developer/visuals/custom-visual-licenses.md). Depending on the custom visual, it might involve integration with a third-party service and you will need to agree to their license terms.

If you're thinking about using custom visuals to extend the functionality of Power BI reports, consider [Deneb](https://deneb-viz.github.io/). Deneb is a community-developed, [certified custom visual](../developer/visuals/power-bi-custom-visuals-certified.md) that allows you to use a declarative [JSON syntax](https://www.json.org/json-en.html) of the [Vega](http://vega.github.io/vega) or [Vega-Lite](http://vega.github.io/vega-lite) languages to build your own visualizations. Deneb has a large community and many templates, which makes it a good choice for report creators who want to create their own visuals without using JavaScript, Python, or R.

### Integration with other third-party services

There are other third-party services which offer integration with Power BI.

The following section presents third-party services, together with use cases that are important to consider.

#### Integration with semantic models via the XMLA endpoint

In Power BI, external tools can connect to your Power BI semantic models by using the XMLA endpoint. There are both open source and commercially available tools that you can use to enhance productivity or extend the functionality of your existing semantic models.

Here are some examples of tools that can integrate with semantic models via the XMLA endpoint:

- [PowerShell cmdlets](/analysis-services/powershell/analysis-services-powershell-reference?view=power-bi-premium-current&preserve-view=true) to automate certain semantic model tasks.
- [Power BI report builder](../paginated-reports/report-builder-power-bi.md) to query semantic models with DAX and build paginated reports.
- [Tabular Editor](https://tabulareditor.com/), a third-party tool to develop and manage semantic models.
- [DAX Studio](https://daxstudio.org/), a third-party tool to author and optimize DAX queries.
- [ALM toolkit](http://alm-toolkit.com/), a third-party tool to compare and deploy semantic models.

For more information about XMLA endpoints and client applications and tools that use them, see [Semantic model connectivity and management with the XMLA endpoint in Power BI](../enterprise/service-premium-connect-tools.md#client-applications-and-tools). The XMLA endpoint is only supported for workspaces that have their license mode set to Fabric capacity, Premium capacity, or Premium Per User.

You can [enable the XMLA endpoint](../enterprise/troubleshoot-xmla-endpoint.md#enabling-the-xmla-endpoint) and set it to read, or read/write from the Power BI workload options in the [admin portal](../enterprise/service-admin-premium-workloads.md#outbound-connectivity). There are also [several tenant settings](../enterprise/service-premium-connect-tools.md#security) that you can use to control which users and groups can use the XMLA endpoint.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to integrate Power BI with other services, key decisions and considerations include:

- **Define the requirement**: Describe what you're trying to achieve and what the expected benefit is of doing so.
- **Describe why you can't accomplish the task in Power BI alone**: Define the challenges or limitations that prevent you from fulfilling this requirement with the built-in tools and features in Power BI.
- **Identify the services that can help you fulfill the requirement**: Compile a list of the services that can help you achieve your objective. Depending on the requirement, there might be only one plausible option.
- **Identify any potential risks, limitations, or considerations**: Carefully plan and consider the implications for this integration for different areas, like security, licensing, governance, and user enablement.
- **Research how you'll set up the integration**: Read the appropriate technical documentation and compile a step-by-step protocol that applies to your specific scenario for how you'll integrate Power BI with the service or tool. Pay special attention to possible troubleshooting or customization of this integration that you might need to do.
- **Conduct a test or proof of concept (POC)**: Before you set up the integration for your tenant, workspace, or item, first perform a representative trial to test any assumptions and reveal any challenges or limitations. Conducting a test or POC is important.
- **Set up training and monitoring**: Ensure that centralized teams are equipped to monitor the new service and its effect on usage in your tenant. Prepare relevant training material so that people can use the new service, and that helps them to avoid issues.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).
