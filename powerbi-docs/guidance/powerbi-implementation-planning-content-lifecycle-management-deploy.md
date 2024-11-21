---
title: "Power BI implementation planning: Deploy content"
description: "This article helps you to deploy content as part of managing the content lifecycle."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 04/24/2024
---

# Power BI implementation planning: Deploy content

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to deploy content as part of managing the content lifecycle. It's primarily targeted at:

- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization. Fabric administrators might need to collaborate with other administrators, like those who oversee Microsoft 365 or Azure DevOps.
- **Center of Excellence (COE) and BI teams:** The teams that are responsible for overseeing Power BI in the organization. These teams include decision makers who decide how to manage the lifecycle of Power BI content. These teams can also include release managers, who handle the lifecycle of content releases, and engineers who create and manage the components needed to effectively use and support lifecycle management.
- **Content creators and content owners:** Users who create content that they want to publish to the Fabric portal to share with others. These individuals are responsible for managing the lifecycle of the Power BI content that they create.

Lifecycle management consists of the processes and practices that you use to handle content from its creation to its eventual retirement. In the [third stage of lifecycle management](powerbi-implementation-planning-content-lifecycle-management-validate.md), you validate content changes, which involves validation performed by both content creators and users. In the fourth stage, you deploy content for consumers to use it.

To share Power BI content with consumers, you should first publish (or _deploy_) the content to a Fabric workspace. Deploying content also involves moving that content between environments, such as deploying from a development workspace to a test workspace, or from a test workspace to a production workspace.

The following image depicts the lifecycle of Power BI content, highlighting stage four, where you deploy content.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/content-lifecycle-management-stage-4.svg" alt-text="Diagram shows the Power BI content lifecycle. Stage 4, which is about content deployment, is highlighted." border="false":::

> [!NOTE]
> For an overview of content lifecycle management, see the [first article in this series](powerbi-implementation-planning-content-lifecycle-management-overview.md).
>
> This article focuses on key considerations and decisions for deploying content throughout its lifecycle. For more guidance about how to deploy content, see:
>
> - **[Migrate to Power BI: Deploy content](powerbi-migration-deploy-support-monitor.md):** This article describes key considerations and decisions for deployment when you migrate to Power BI from other technologies.
> - **[BI solution planning: Deploy, support, and monitor](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#step-5-deploy-support-and-monitor):** This article describes how to plan for deployment when you first create your Power BI or Fabric solution.
> - **[Power BI Implementation Planning: Self-service content publishing usage scenario](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md):** This article describes how self-service users can deploy content by using OneDrive for Work and School and Fabric deployment pipelines.
> - **[Power BI Implementation Planning: Enterprise content publishing usage scenario](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md):** This article describes how central teams can deploy and manage content by using Azure DevOps.

You deploy content at two main points during the content lifecycle:

- When you publish content to a development workspace. At this point, you publish content to validate your changes.
- When you promote content between two workspaces (such as promoting content from a development workspace to a test workspace). At this point, you deploy content when it's ready for the next stage (such as when new content is ready to be tested).

The following sections outline approaches you can take to publish or promote content.

## Decide how you'll publish content

When you develop content on your local machine, you need to publish that content to a development workspace in the Fabric portal. You typically publish this content when you want to perform [validation of the changes you made](powerbi-implementation-planning-content-lifecycle-management-validate.md).

> [!NOTE]
> In this article, we refer to _publishing_ content as the initial deployment to the development workspace. However, in principle, publishing content is the same as deploying it.
>
> Content that's created in the Fabric portal (such as dataflows, dashboards, and scorecards) is created directly in the development workspace, and doesn't need to be published.

The following sections describe different approaches you can take to publish content.

### Publish with Power BI Desktop

Power BI Desktop allows users to [publish semantic models and reports](../create-reports/desktop-upload-desktop-files.md) from their local machine to a workspace in the Fabric portal. This approach is the simplest way to publish content; however, it can't be automated.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/publish-power-bi-desktop.svg" alt-text="Diagram shows approach 1, which is about publishing from Power BI Desktop. Items in the diagram are described next." border="false":::

Consider using this approach when:

- Content creators prefer to manually control content publishing to the Fabric portal.
- Content creators are using Power BI Desktop to develop and manage content.
- Content creators aren't familiar with Azure DevOps or Git.
- Content comprises only semantic models or reports.

### Publish with third-party tools

Third-party tools allow content creators to publish a semantic model by using the workspace [XMLA read/write endpoint](../enterprise/service-premium-connect-tools.md). For example, a content creator uses Tabular Editor to develop and manage model metadata, like TMDL (Tabular Model Definition Language) or .bim files.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/publish-third-party-tools.svg" alt-text="Diagram shows approach 2, which is about publishing from third-party tools. Items in the diagram are described next." border="false":::

> [!TIP]
> For more information about how to use third-party tools to deploy semantic models, see the [advanced data model management usage scenario](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md).
>
> For more information about how you can enable and use XMLA read/write endpoints, see [Semantic model connectivity with the XMLA endpoint](../enterprise/service-premium-connect-tools.md).

Consider using this approach when:

- Content creators prefer to manually control content publishing to the Fabric portal.
- Content creators use a third-party tool to develop and manage the content.
- Content will be published to a workspace that uses Premium per user (PPU), Premium capacity, or Fabric capacity license mode.
- Content creators aren't familiar with Azure DevOps or Git.
- Content comprises only semantic models.

### Publish with OneDrive refresh

OneDrive allows self-service content creators to automatically publish semantic models or reports to a workspace in the Fabric portal by using OneDrive refresh. Content creators can save Power BI Desktop (.pbix) files to a shared library in OneDrive. The shared library can also be a SharePoint or Microsoft Teams document library.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/publish-onedrive-refresh.svg" alt-text="Diagram shows approach 3, which is about publishing by using OneDrive Refresh. Items in the diagram are described next." border="false":::

> [!TIP]
> For more information about how to use OneDrive for Work and School with Power BI content, see the [self-service content publishing usage scenario](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md).
>
> For more information about how you can set up OneDrive refresh, see [Refresh a semantic model stored on OneDrive or SharePoint Online](../connect-data/refresh-desktop-file-onedrive.md).

Consider using this approach when:

- Content creators want to automate content publishing to the Fabric portal.
- Content creators aren't familiar with Azure DevOps or Git.
- Content creators perform version control of content by using OneDrive or SharePoint.
- Content creators save semantic models and reports as .pbix files.
- Content comprises only semantic models or reports.

### Publish with Fabric Git integration

[Fabric Git integration](/fabric/cicd/git-integration/intro-to-git-integration) is a feature exclusive to Fabric capacities that allows content creators to sync a branch from a remote Git repository to a Fabric workspace. You can use Git integration together with Azure DevOps to sync content from Azure Repos, or you can deploy content by using Azure Pipelines (described in the next section).

> [!NOTE]
> [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops?view=azure-devops&preserve-view=true) is a suite of services that integrate with Power BI and Fabric to help you plan and orchestrate content lifecycle management. When you use Azure DevOps this way, you typically leverage the following services:
>
> - **[Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true):** Allows you to create and use a remote Git repository, which is a remote storage location you use to track and manage content changes.
> - **[Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true):** Allows you to create and use a set of automated tasks to handle, test, and deploy content from a remote repository to a workspace.
> - **[Azure Test Plans](/azure/devops/test/overview?view=azure-devops&preserve-view=true):** Allows you to design tests to validate the solution and automate quality control together with Azure Pipelines.
> - **[Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards?view=azure-devops&preserve-view=true):** Allows you to use boards to track tasks and plans as work items, and link or refer to work items from other Azure DevOps services.
> - **[Azure Wiki](/azure/devops/project/wiki/wiki-create-repo?view=azure-devops&tabs=browser&preserve-view=true):** Allows you to share information with their team to understand and contribute to content.

To summarize, content that's been committed and pushed to the remote repository is automatically published to the workspace via this sync process. A key benefit of this approach is that it allows you to couple your [source control management](powerbi-implementation-planning-content-lifecycle-management-develop-manage.md#source-control-by-using-a-remote-git-repository) processes with content publication. For instance, it allows for easier rollback of changes or entire versions of a solution.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/publish-fabric-git-integration.svg" alt-text="Diagram shows approach 4, which is about publishing by using Fabric Git integration. Items in the diagram are described next." border="false":::

> [!TIP]
> For more information about how to use Fabric Git integration to deploy Power BI content, see the [enterprise content publishing usage scenario](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md).
>
> For more information about how you can set up Git integration, see [Tutorial: Lifecycle management in Fabric](/fabric/cicd/cicd-tutorial) and [Power BI Desktop projects: Git integration](../developer/projects/projects-git.md).

Consider using this approach when:

- Content creators are familiar with Azure DevOps and Git.
- Content creators are using Azure DevOps for collaboration and source control.
- Content creators save semantic models and reports as [Power BI project (.pbip)](../developer/projects/projects-overview.md) files.
- Content will be published to a workspace on a Fabric capacity.
- Content is comprised of [supported item types](/fabric/cicd/git-integration/intro-to-git-integration#supported-items) by the Git integration feature.
- Content doesn't have [sensitivity labels](../enterprise/service-security-sensitivity-label-overview.md).

> [!NOTE]
> How you use Git integration to deploy and manage content is heavily dependent upon your [branching and merging strategies](powerbi-implementation-planning-content-lifecycle-management-develop-manage.md#use-branches), which you decide in stage two of lifecycle management.

### Publish with Azure Pipelines

[Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true) programmatically automate testing, management, and deployment of content. When a pipeline is run, steps in the pipeline execute automatically. Azure Pipelines is more complex and requires more time and effort to set up compared to other approaches, but it allows the most control and flexibility to orchestrate the deployment process.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/publish-azure-pipelines-azure-devops.svg" alt-text="Diagram shows approach 5, which is about publishing by using Azure Pipelines in Azure DevOps. Items in the diagram are described next." border="false":::

> [!TIP]
> You can deploy content by using Azure Pipelines and Power BI REST APIs to workspaces that aren't on Fabric or Premium capacity. However, the Fabric REST APIs only work with Fabric, and the XMLA endpoints only work with Fabric or Premium capacity.
>
> For more information about how to use Azure Pipelines to deploy Power BI content, see the [enterprise content publishing usage scenario](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md).
>
> For more information about how you can integrate Azure DevOps with Power BI, see [Power BI Desktop projects Azure DevOps integration](../developer/projects/projects-azdo.md) and [build pipelines](../developer/projects/projects-build-pipelines.md).

Consider using Azure Pipelines to orchestrate content deployment when:

- Content creators are familiar with Azure DevOps and the Fabric REST APIs.
- Content creators are using Azure DevOps for collaboration and source control.
- Content creators aren't using Fabric Git integration.

Azure Pipelines and other code-based tools can programmatically deploy content by using one or more of the following APIs or endpoints:

- **[Power BI REST APIs](/rest/api/power-bi/):** There are different Power BI REST API endpoints that you can use to deploy content. The Power BI REST APIs support only Power BI item types.
  - _[Import](/rest/api/fabric/core/items/create-item)_: You can publish supported items by using the Power BI REST APIs to import a valid source file to a workspace (such as a .pbix file).
  - _[Deploy](/rest/api/power-bi/pipelines/selective-deploy)_: You can deploy supported items, promoting them from one workspace to another if they're stages in a deployment pipeline.
- **[Fabric REST APIs](/rest/api/fabric/articles/using-fabric-apis):** There are different Fabric REST API endpoints that you can use to deploy content. The Fabric REST APIs support both Power BI and Fabric item types.
  - _[Create](/rest/api/fabric/core/items/create-item)_: You can create supported items by using the Fabric REST APIs together with a valid [item definition](/rest/api/fabric/articles/item-management/definitions/item-definition-overview).
  - _[Update From Git](/rest/api/fabric/core/git/update-from-git)_: You can update a workspace with content from a remote repository connected by using Git integration.
- **[XMLA read/write endpoints](../enterprise/service-premium-connect-tools.md):** You can _[create](/analysis-services/tmsl/create-command-tmsl?view=asallproducts-allversions&preserve-view=true)_ or [_alter_ semantic models](/analysis-services/tmsl/alter-command-tmsl?view=asallproducts-allversions&preserve-view=true) by using XMLA endpoints together with a valid model.bim file. XMLA endpoints let you deploy changes to specific model objects instead of the entire model. Azure Pipelines can make use of third-party tools (like the Tabular Editor command line interface) to deploy semantic models by using the XMLA endpoints.

> [!TIP]
> When you use the Fabric or Power BI REST APIs, you must first create an app registration in Azure ([described here for Power BI Embedded](../developer/embedded/register-app.md?tabs=customers&preserve-view=true#step-2---register-your-application)). This requires a Microsoft Entra ID tenant and an organizational user, and can be a complex process to set up the appropriate permissions. However, you can execute the Fabric REST APIs in notebooks without creating an app registration. This streamlines the setup and use of APIs in your solutions, so that you don't have to manage credentials or configure any setup prior to using the APIs.
>
> To use the Fabric REST APIs without registering an app, use [semantic link](/fabric/data-science/semantic-link-overview) in a Fabric notebook with the [FabricRestClientClass](/python/api/semantic-link-sempy/sempy.fabric.fabricrestclient?view=semantic-link-python&preserve-view=true) of [sempy](/python/api/semantic-link-sempy/sempy?view=semantic-link-python&preserve-view=true) to call the API.

Together with automated testing, Azure Pipelines integration with Power BI helps you to achieve [continuous integration and continuous deployment (CI/CD)](/azure/devops/pipelines/architectures/devops-pipelines-baseline-architecture?view=azure-devops&preserve-view=true).

When using Azure Pipelines, pipeline owners can customize triggers, steps, and functionality to meet deployment needs. As such, the number and types of pipelines vary depending on the solution requirements.

There are three types of Azure Pipelines that you can set up to test, manage, and deploy your Power BI solution.

- Validation pipelines
- Build pipelines
- Release pipelines

> [!NOTE]
> It's not necessary to have all three types of pipeline in your publishing solution. Depending on your workflow and needs, you might set up one or more of the variants of the pipelines described in this article to automate content publication. This ability to customize the pipelines is an advantage of Azure Pipelines over the built-in Fabric deployment pipelines.

#### Validation pipelines

Validation pipelines perform basic quality checks of data models before they're published to a development workspace. Typically, changes in a branch of the remote repository trigger the pipeline to validate those changes with [automated testing](powerbi-implementation-planning-content-lifecycle-management-validate.md#automate-testing).

Examples of automated testing include scanning the data model for best practice rule violations by using [Best Practice Analyzer (BPA)](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance/), or by running DAX queries against a published semantic model. The results of these tests are then stored in the remote repository for documentation and auditing purposes. Data models that fail validation shouldn't be published. Instead, the pipeline should notify content creators of the issues.

#### Build pipelines

[Build pipelines](/azure/devops/pipelines/create-first-pipeline?view=azure-devops&tabs=java%2Cbrowser&preserve-view=true) prepare data models for publication to the Power BI service. These pipelines combine serialized model metadata into a single file that's later published by a release pipeline. A build pipeline can also make changes to the metadata, like modifying parameter values. The build pipelines produce deployment artifacts that consist of data model metadata (for data models) and Power BI project (.pbip) files that are ready for publication to the Power BI service.

#### Release pipelines

Release pipelines publish or deploy content. A publishing solution typically includes several release pipelines, depending on the target environment.

- **Development release pipeline:** This first pipeline is triggered automatically. It publishes content to a development workspace after the build and validation pipelines succeed.
- **Test and production release pipelines:** These pipelines aren't triggered automatically. Instead, they're triggered on demand or when approved. Test and production release pipelines deploy content to a test or production workspace, respectively, after _release approval_. [Release approvals](/azure/devops/pipelines/release/approvals/approvals?view=azure-devops&preserve-view=true) ensure that content isn't automatically deployed to a test or production stage before it's ready. These approvals are provided by release managers, who are responsible for planning and coordinating content release to test and production environments.

## Decide how you'll promote content between workspaces

When you use different environments for development, test, and production, you must deploy content to all three environments. There are different tools and approaches that you can take to promote content between workspaces, depending on your specific workflow and needs.

The following sections describe approaches you can take to promote content between workspaces.

> [!CAUTION]
> Avoid manually publishing content from your local machine to test and production workspaces. It can result in errors or disruptions due to mistakes. Generally, you should only publish to a development workspace, or to a [private workspace](powerbi-implementation-planning-content-lifecycle-management-validate.md#decide-how-creators-should-validate-content) if you use one.

### Deploy with Fabric deployment pipelines

Deployment pipelines allow you to set up two or more stages (such as development, test, or production) and to deploy Fabric content between these stages. A pipeline administrator assigns a single Power BI workspace to each stage in the deployment pipeline. How you use deployment pipelines depends upon how you've decided to [set up and use workspaces](powerbi-implementation-planning-content-lifecycle-management-deploy.md#decide-how-youll-promote-content-between-workspaces).

Consider using deployment pipelines when:

- Content is deployed to workspaces with PPU, Premium capacity, or Fabric capacity license mode.
- Content item types and scenarios are supported by deployment pipelines.

Consider another approach than deployment pipelines when:

- You prefer to deploy content from a remote repository, such as by using Azure Pipelines.
- You intend on using Git integration to synchronize different stages with different branches of your remote repository, instead of deploying the content.

> [!TIP]
> For more information about how to use deployment pipelines to promote content between workspaces, see the [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) and [enterprise content publishing](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md) usage scenarios.
>
> For more information about deployment pipelines, see [Deployment Pipelines: Understand the deployment process](/fabric/cicd/deployment-pipelines/understand-the-deployment-process).

The simplest way to use a deployment pipeline is when you publish all content to a single workspace and promote it to later stages within a single deployment pipeline. The following diagram depicts this first approach to deploy content by using a deployment pipeline.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/deploy-single-deployment-pipeline.svg" alt-text="Diagram shows approach 1, which is about content deployment by using a deployment pipeline. Items in the diagram are described next." border="false":::

In summary, a content creator typically first publishes content to the initial stage of the pipeline. Then, to promote content to the later stages, a pipeline administrator triggers a deployment. When a deployment occurs, the deployment pipeline deploys content metadata from one workspace to the next.

When you separate content by item type in different workspaces, you'll use separate deployment pipelines to deploy this content. You can link content across workspaces with multiple deployment pipelines by using [auto-binding](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#auto-binding-across-pipelines). Auto-binding across deployment pipelines ensures that content remains linked to the appropriate item in the respective stage. For instance, the report in the development stage will remain linked to the model in the development stage of the other deployment pipeline. However, you can also [avoid auto-binding](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#avoid-using-auto-binding) behavior if your scenario requires you link content across workspaces with a different pattern.

The following diagram depicts this second approach to deploy content by using multiple deployment pipelines.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/deploy-multiple-deployment-pipelines.svg" alt-text="Diagram shows approach 2, which is about content deployment by using multiple pipelines. Items in the diagram are described next." border="false":::

In summary, deploying content by using multiple deployment pipelines is similar to using a single pipeline. A key difference is that you can optionally link content that's connected across workspaces and deployment pipelines by using auto-binding. Otherwise, it's identical to the first approach.

Deployment pipelines are a flexible, straightforward tool suitable to improve your content lifecycle management for both self-service and enterprise scenarios.

[Access to both the workspace and the deployment pipeline](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#permissions) is required for the users conducting a deployment. We recommend that you [plan deployment pipeline access](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md#access-for-deployment-pipeline) so that pipeline administrators can view deployment history and compare content. When collaborating with multiple content creators, consider restricting pipeline access to release managers or technical owners who are best suited to oversee the deployment and release processes.

Additionally, consider using [deployment rules](/fabric/cicd/deployment-pipelines/create-rules) to set different configurations for items in different stages. For instance, you might want a semantic model in the development workspace to source data from the development database, while the semantic model in the production workspace sources data from the production database.

> [!TIP]
> If multiple people have access to your deployment pipeline, we recommend that you review the [deployment history](/fabric/cicd/deployment-pipelines/deployment-history) regularly. These reviews can help you identify unapproved deployments or deployment failures.
>
> If you're using [auto-binding](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#auto-binding-across-pipelines) to link items across deployment pipelines, ensure that you also review item lineages to identify breaks in auto-binding caused by someone publishing linked content to the wrong stage.

You can trigger deployments manually or programmatically by using the [Power BI REST APIs](/rest/api/power-bi/pipelines/selective-deploy). In both cases, you should define a clear and robust process about when you promote content to each stage, and how to roll back unintended changes.

#### Manually perform deployment

You can deploy content manually by using the Fabric deployment pipeline. You can choose [deploy all content](/fabric/cicd/deployment-pipelines/deploy-content#deploy-all-content) or [select items](/fabric/cicd/deployment-pipelines/deploy-content#selective-deployment). Selective deployment can be beneficial when some content is ready to move to the next stage, but some items are still undergoing development or validation. Additionally, you can perform a [backwards deployment](/fabric/cicd/deployment-pipelines/deploy-content#backwards-deployment) when content changes exist in a later stage but not in an earlier one.

> [!CAUTION]
> When using deployment pipelines, we recommend that you deploy content in a single direction, such as from development to test to production workspaces. Typically, you should avoid making changes to content in later stages before those changes have undergone the appropriate validation in development or test.

When you conduct a manual deployment, you can [compare stages](/fabric/cicd/deployment-pipelines/compare-pipeline-content?tabs=browser#compare-stages) to identify content changes in the _change review_ window. This approach is especially useful when you don't use a Git remote repository for source control.

#### Use the Power BI REST APIs to perform deployment

You can use the Power BI REST APIs to [deploy content by using a deployment pipeline](/fabric/cicd/deployment-pipelines/pipeline-automation). A benefit of using the REST APIs is that you can automate deployment and integrate it with other tools, like Azure Pipelines in Azure DevOps.

### Deploy with Azure Pipelines

Azure Pipelines allow you to orchestrate deployment between all stages. With this approach, you use the Fabric REST APIs to deploy and manage content, making use of different Azure Pipelines such as validation and release pipelines.

Consider using Azure Pipelines when:

- You want to centralize orchestration of deployment from within Azure DevOps.
- Content creators are using Azure DevOps to collaborate and for source control.

Consider another approach than Azure Pipelines when:

- Content creators aren't familiar with Azure DevOps or code-based deployments.
- Content includes item types that don't have a supported definition or source file format, like dashboards.

There are two different approaches to deploy content with Azure Pipelines. Either they orchestrate deployment pipelines, or they deploy content to a workspace without a deployment pipeline.

#### Orchestrate Fabric deployment pipelines by using Azure Pipelines

In this approach, release pipelines orchestrate content deployment to test and production workspaces by using deployment pipelines. Content is promoted through development, test, and production workspaces in Fabric.

The following diagram depicts how you orchestrate deployment pipelines from Azure Pipelines.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/deploy-orchestrate-deployment-pipelines-azure-pipelines.svg" alt-text="Diagram shows approach 3, which is about orchestrating content deployment from Azure Pipelines. Items in the diagram are described next." border="false":::

In summary, content creators publish content to the workspace in the first stage of the deployment pipeline. Then, a release manager approves the deployment, which triggers an Azure Pipeline. This pipeline uses the Power BI REST APIs to promote content between stages, so that the metadata is deployed to another workspace. One advantage of this approach is that you can orchestrate deployment of multiple Fabric item types through deployment pipelines, because some item types are developed in the Fabric portal and thus can't be deployed by Azure Pipelines alone.

#### Deploy content by using only Azure Pipelines

You can also deploy content to a workspace from Azure DevOps by using Azure Pipelines. This approach doesn't use deployment pipelines. Instead, it uses release pipelines to deploy source files or metadata files by using either the Fabric or Power BI REST APIs, or XMLA read/write endpoints. Typically, these files are stored in an Azure Repos Git repository.

The following diagram depicts how you deploy content by using only Azure Pipelines.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/deploy-azure-pipelines-only.svg" alt-text="Diagram shows approach 4, which is about content deployment by using only Azure Pipelines. Items in the diagram are described next." border="false":::

In summary, content creators commit and push content changes to a remote Git repository in Azure Repos. This content is used by Azure Pipelines for the deployment. Once the release manager approves the specific deployment, the Azure Pipeline will deploy content to the workspace, either by using the Power BI REST APIs (that is, for .pbix files), the Fabric REST APIs (that is, for item definitions), or XMLA endpoints (that is, for model.bim files). A separate Azure Pipeline exists for each workspace.

This approach doesn't require Fabric capacity or Premium licensing when you publish only Power BI Desktop files with the Power BI REST APIs. However, it does involve more setup effort and complexity because you must manage deployment outside of Power BI. Development teams that already use DevOps for data solutions outside of Power BI might be familiar with this approach. Development teams that use this approach can consolidate deployment of data solutions in Azure DevOps.

### Deploy with Fabric Git integration

When you use Git integration, you can sync different branches to different workspaces instead of publishing or deploying content, explicitly. That way, you can have separate branches for development, test, and production workspaces. In this scenario, the _main_ branch syncs with the _production_ workspace. You then deploy content between workspaces by performing a pull request to merge the development branch into the test branch (to deploy to the test workspace) or to merge the test branch into the main branch (to deploy to the production workspace).

The following diagram depicts how you deploy content by using Fabric Git integration to sync branches to different workspaces. For simplicity, the diagram doesn't include details of branching or merging content.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-deploy/deploy-fabric-git-integration.svg" alt-text="Diagram shows approach 5, which is about content deployment by using Fabric Git integration. Items in the diagram are described next." border="false":::

In summary, content creators commit and push content changes to a remote Git repository in Azure Repos. Content creators open pull requests (PRs) to request to merge their changes into a specific branch. Depending on the branching strategy, different branches are connected to different workspaces. Once changes are merged into a branch, content creators sync the workspace with the remote Git repository to view the latest changes to the content in that workspace.

Consider this approach when:

- You want to orchestrate deployment between workspaces by using your branching and merging strategy.
- You don't intend to use Azure Pipelines or Fabric deployment pipelines to orchestrate deployments to test and production.
- The workspace doesn't contain [unsupported items](/fabric/cicd/git-integration/intro-to-git-integration#supported-items) or [scenarios](/fabric/cicd/git-integration/intro-to-git-integration#considerations-and-limitations).
- Content doesn't have [sensitivity labels](../enterprise/service-security-sensitivity-label-overview.md).

> [!NOTE]
> There are many valid ways to deploy content. For instance, you can use a combination of the different approaches discussed in this article.
>
> For instance, you can deploy content to a development workspace by using an Azure Pipeline, which allows you to benefit from continuous integration features and conduct automated testing (such as using the Best Practice Analyzer). Then, you can deploy content between workspaces by using either Git integration or a Fabric deployment pipeline.
>
> Choose the approach that best fits your needs and the way your team works.

## Decide how to handle post-deployment activities

After deployment, there are various [post-deployment activities](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md#post-deployment-activities) that must be handled. Many of these activities can be handled programmatically, for instance by an Azure Pipeline or notebook and the Power BI and Fabric REST APIs. For example, you can programmatically set data source credentials, manage scheduled refresh, and trigger refreshes after a metadata deployment. However, some tasks require manual intervention, such as a first-time setup or updating a Power BI app.

Ensure that you identify all relevant post-deployment activities for your content, and that you decide how they'll be handled.

Once you've planned how you'll deploy content, you should next consider how you'll [support and monitor](powerbi-implementation-planning-content-lifecycle-management-support-monitor.md) it.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning how to deploy content, key decisions and actions include:

> [!div class="checklist"]
> - **Identify the deployment options available to you:** Depending on your licensing and content, you'll have different options available to publish content or promote it between workspaces. Identify whether you can use deployment pipelines, Azure DevOps, Git integration, the Fabric REST APIs, and XMLA read/write endpoints.
> - **Decide how you'll publish content:** Choose an approach to publish content that best suits your workflow and needs. Ensure that this approach aligns with your other strategies, like how you track and manage changes.
> - **Decide how you'll promote content between workspaces:** Choose an approach to deploy content from development to test workspaces and from test to production workspaces. Ensure that this approach aligns with your other strategies, like how you'll publish content.
> - **Plan your release strategy:** Determine whether a specific individual will be responsible for the final review of content before approving a release or deployment. Ensure that this individual is aware of this task and what they should do to safeguard the deployment process without blocking progress.
> - **Plan post-deployment activities:** Ensure that you've decided on a process to perform activities such as updating a Power BI app or refreshing data items after a metadata deployment. Consider automating this process by using the Fabric REST APIs.
> - **Perform first-time set up of deployment tools and processes:** Ensure that you set up the appropriate access, and that permissions align to how you set up access to your content.
> - **Deploy content to production:** When you've planned and set up your deployment, deploy content to production.

## Related content

In the [next article in this series](powerbi-implementation-planning-content-lifecycle-management-support-monitor.md), learn how to support and monitor content as part of managing the content lifecycle.
