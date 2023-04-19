---
title: "Power BI usage scenarios: Enterprise content publishing"
description: "An explanation of how content creators and technical owners use Azure DevOps to manage and publish Power BI content"
author: data-goblin
ms.author: painbar
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 04/17/2023
---

# Power BI usage scenarios: Enterprise content publishing

[!INCLUDE [powerbi-implementation-planning](includes/powerbi-implementation-planning-context.md)]

When content creators collaborate to deliver analytical solutions that are important to the organization, they must ensure timely and reliable delivery of content to consumers. Technical teams address this challenge by using a process called _[DevOps](/devops/what-is-devops)_. DevOps allows teams to automate and scale processes by adopting practices that improve and accelerate delivery.

> [!NOTE]
> Data teams that address the same challenges may also practice _DataOps_. DataOps builds upon DevOps principles, but DataOps includes additional practices specific to data management, such as data quality assurance and governance. We refer to DevOps in this article, but be aware that the underlying principles can also apply to DataOps.

Content creators and consumers benefit from several advantages when adopting DevOps practices to publish Power BI content. The following points are a high-level overview of how this process works.

1. **Develop content and commit work to a remote repository:** Content creators develop their solution on their own machine. They commit and save their work to a _remote repository_ at regular intervals during development. A remote repository contains the latest version of the solution, and it's accessible to the entire development team.
1. **Collaborate and manage content changes by using version control:** Other content creators can make revisions to the solution by creating a _branch_. A branch is copy of a remote repository. When these revisions are ready and approved, the branch is merged with the latest version of the solution. All revisions to the solution are tracked. This process is known as _version control_ (or _source control_).
1. **Deploy and promote content by using pipelines:** In the [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) usage scenario, content is promoted (or _deployed_) through development, test, and production workspaces by using [Power BI deployment pipelines](/power-bi/create-reports/deployment-pipelines-overview). Power BI deployment pipelines can promote content to Premium Power BI workspaces manually using the user interface, or programmatically using the REST APIs. In contrast, enterprise content publishing (the focus of this usage scenario) promotes content by using _[Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true)_. Azure Pipelines are an Azure DevOps service that automates testing, management, and deployment of content by using a series of customized, programmatic steps. In the enterprise content publishing usage scenario, these pipelines can also be referred to as _continuous integration and deployment_ (or CI/CD) pipelines. These pipelines frequently and automatically integrate changes and streamline content publishing.

DevOps supports a mature, systematic approach to content management and publication. It enables content creators to collaborate on solutions, and it ensures fast and reliable delivery of content to consumers. When you adhere to DevOps practices, you benefit from streamlined workflows, fewer errors, and improved experiences for content creators and content consumers.

You set up and manage DevOps practices for your Power BI solution by using [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops). In enterprise scenarios, you can automate content publication with Azure DevOps and the [Power BI REST APIs](/rest/api/power-bi/) in three different ways.

- **Power BI REST APIs with Power BI deployment pipelines:** You can import content to development workspaces and use deployment pipelines to [deploy](/rest/api/power-bi/pipelines/deploy-all) content through test and production workspaces. You still control deployment from Azure DevOps, and use the Power BI REST APIs to manage deployment pipelines instead of individual content items. Additionally, you use the [XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools) to deploy data model metadata instead of a Power BI Desktop file (.pbix) with Azure DevOps. This metadata allows you to track object-level changes by using version control. While more robust and easier to maintain, this approach does require Premium licensing and moderate scripting effort to set up content import and deployment with the Power BI REST APIs. Use this approach when you want to simplify content lifecycle management with deployment pipelines, and you have a Premium license. The XMLA endpoint and Power BI deployment pipelines are Premium features.
- **Power BI REST APIs:** You can also [import](/rest/api/power-bi/imports/post-import-in-group) content to development, test and production workspaces by using Azure DevOps and only the Power BI REST APIs. This approach doesn't require Premium licensing, but it does involve high scripting effort and setup, because deployment is managed outside of Power BI. Use this approach when you want to deploy Power BI content centrally from Azure DevOps, or when you don't have a Premium license. For a visual comparison between the first two approaches, see the release pipeline approaches flow diagram.
- **Power BI automation tools with Power BI deployment pipelines:** You can use the [Power BI automation tools](/power-bi/create-reports/deployment-pipelines-automation#use-the-power-bi-automation-tools-extension) Azure DevOps extension to manage deployment pipelines instead of the Power BI REST APIs. This approach is an alternative to the first option, which uses the Power BI REST APIs with Power BI deployment pipelines. The Power BI automation tools extension is an open source tool. It helps you manage and publish content from Azure DevOps without the need to write PowerShell scripts. Use this approach when you want to manage deployment pipelines from Azure DevOps with minimal scripting effort, and you have a Premium capacity.

This article focuses on the first option, which uses the Power BI REST APIs with Power BI deployment pipelines. It describes how you can use Azure DevOps to set up DevOps practices. It also describes how you can use [Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true) for your remote repositories and automate content testing, integration, and delivery with [Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true). Azure DevOps isn't the only way to set up enterprise content publishing, but simple integration with Power BI makes it a good choice.

> [!NOTE]
> This usage scenario is one of the [content management and deployment](powerbi-implementation-planning-usage-scenario-overview.md#content-management-and-deployment-scenarios) scenarios. For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support enterprise content publishing. The focus is on the use of Azure DevOps to manage and publish content programmatically at scale through development, test, and production workspaces in the Power BI service.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing/usage-scenario-enterprise-content-publishing-inline.png" alt-text"Image shows a diagram of enterprise content publishing, which is enhancing collaboration and managing content at scale by using Azure DevOps. Items in the diagram are described in the table." lightbox="media/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing/usage-scenario-enterprise-content-publishing-expanded.png" border="false":::

The scenario diagram depicts the following user actions, processes, and features.

| **Item** | **Description** |
|---|---|
| ![Item 1.](media/common/icon-01-red-30x30.png) | Content creators develop data models by using [Tabular Editor](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md#tabular-editor) and develop reports by using Power BI Desktop. It's also possible that content creators develop data models with Power BI Desktop. Content creators save their work to a local repository during development. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | The data model connects to the data from one or more data sources. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | Content creators regularly commit and push their changes to a remote repository during development by using a Git client such as Visual Studio Code. In this diagram, the remote repository is Azure Repos. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | Other content creators use Azure Repos to track changes with version control. They collaborate by committing changes into separate branches. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | Changes to content in the remote repository trigger Azure Pipelines. A **validation pipeline** is the first pipeline that is triggered. The validation pipeline performs automated tests to validate content before it's published. |
| ![Item 6.](media/common/icon-06-red-30x30.png) | Content that passes the validation pipeline triggers a subsequent **build pipeline**. The build pipeline prepares content for publishing to the Power BI service. This pipeline is sometimes referred to as _continuous integration_ (CI). |
| ![Item 7.](media/common/icon-07-red-30x30.png) | Content is published and deployed by using **release pipelines**. The release pipelines use either the Power BI REST APIs or the workspace XMLA endpoint to programmatically import content to the Power BI service. These pipelines are sometimes referred to as _continuous deployment_ (CD). |
| ![Item 8.](media/common/icon-08-red-30x30.png) | A release pipeline publishes content to the development workspace. This is the first release pipeline that initially imports content to the Power BI service. Other release pipelines will later promote content through development, test, and production workspaces. |
| ![Item 9.](media/common/icon-09-red-30x30.png) | A release manager controls deployment to test and production workspaces by using an Azure Pipelines release approval. In enterprise content publishing, a release manager typically plans and coordinates the content release to test and production environments. They coordinate and communicate with content creators, stakeholders, and users. |
| ![Item 10.](media/common/icon-10-red-30x30.png) | Release pipelines promote content by using Power BI deployment pipelines with the Power BI REST APIs. The test release pipeline promotes content from the development workspace to the test workspace. The production release pipeline promotes content from test workspace to the production workspace. |
| ![Item 11.](media/common/icon-11-red-30x30.png) | After deployment, release pipelines perform post-deployment activities. Activities can include setting dataset credentials or updating the Power BI app for test and production workspaces. |
| ![Item 12.](media/common/icon-12-red-30x30.png) | Azure Pipelines publishes content to a development workspace. Separate workspaces are set up for test and production environments. Power BI deployment pipelines deploy content from development to test workspaces, and from test to production workspaces once approved. |
| ![Item 13.](media/common/icon-13-red-30x30.png) | Reviewers within the test workspace perform user acceptance testing (UAT). |
| ![Item 14.](media/common/icon-14-red-30x30.png) | Workspaces are set to **Premium per user**, **Premium per capacity**, or **Embedded** [license mode](/power-bi/collaborate-share/service-create-the-new-workspaces#premium-capacity-settings), to allow using Power BI deployment pipelines and the XMLA read/write endpoint. |
| ![Item 15.](media/common/icon-15-red-30x30.png) | Content viewers access the content by using the production workspace or a Power BI app. |
| ![Item 16.](media/common/icon-16-red-30x30.png) | To connect to data sources that reside within a private organizational network, an on-premises data gateway is required. You can set up Azure Pipelines to perform gateway configuration activities by using the Power BI REST APIs (not shown in this scenario diagram). |
| ![Item 17.](media/common/icon-17-red-30x30.png) | Power BI administrators oversee and monitor activity in the Power BI service. Content that's deemed critical enough to have separate development, test, and production workspaces may be subject to stricter governance requirements than less critical content. |
| ![Item 18.](media/common/icon-18-red-30x30.png) | DevOps administrators oversee and monitor repository and pipeline activity in Azure DevOps. |

> [!TIP]
> We recommend that you also review the [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) and [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) usage scenarios. The enterprise content publishing usage scenario builds upon concepts that these scenarios introduce.

## Key points

The following are some key points to emphasize about the enterprise content publishing scenario.

### Version control

Tracking changes during the content lifecycle is important to ensure stable and consistent delivery of content to consumers. In this usage scenario, content creators and owners manage content changes in a remote repository by using _version control_. Version control is the practice of managing changes to files or code in a central repository. This practice allows for better collaboration and effective management of version history. Version control has advantages for content creators, including the ability to roll back or merge changes.

Content creators typically develop data models in Tabular Editor to support better version control.Unlike a data model that you develop in Power BI Desktop, a data model developed in [Tabular Editor](https://www.tabulareditor.com/) is saved in human-readable metadata format. This format enables data model object-level version control. You should use object-level version control when collaborating with multiple people on the same data model. For more information, see the [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md#tabular-editor) usage scenario. However, it isn't possible to see changes that you made to the report definition in a Power BI Desktop file (.pbix). For example, you can't track changes to a report page, such as the visuals used, their positions, and their field mappings or formatting.

Content creators store data model metadata files and .pbix files in a central remote repository, like Azure Repos. These files are curated by a _[technical owner](powerbi-adoption-roadmap-content-ownership-and-management.md#ownership-and-stewardship)_. While a content creator develops a solution, a technical owner is responsible for managing the solution and reviewing the changes, and merging them into a single solution. Azure Repos provides sophisticated options for tracking and managing changes. This approach differs from the approach described in the [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) usage scenario, where the creator uses OneDrive storage with version tracking. Maintaining a well-curated, documented repository is essential because it's the foundation of all content and collaboration.

Here are some key considerations to help you set up a remote repository for version control.

- **Scope:** Clearly define the scope of the repository. Ideally, the scope of the repository is identical to the scope of the downstream workspaces and apps that you use to deliver content to consumers.
- **Access:** You should set up access to the repository by using a similar permissions model as you have set up for your [deployment pipeline permissions](powerbi-implementation-planning-security-content-creator-planning.md#deployment-pipeline-access) and [workspace roles](powerbi-implementation-planning-security-content-creator-planning.md#workspace-roles). Content creators need access to the repository.
- **Documentation:** Add text files to the repository to document its purpose, ownership, access, and defined processes. For example, the documentation can describe how changes should be staged and committed.
- **Tools:** To commit and push changes to a remote repository, content creators need a _Git_ client like [Visual Studio](/visualstudio/windows/?view=vs-2022&preserve-view=true) or [Visual Studio Code](https://code.visualstudio.com/docs). Git is a distributed version control system that tracks changes in your files.To learn Git basics, see [What is Git?](/devops/develop/git/what-is-git).

### Collaboration with Azure DevOps

As a solution increases in scope and complexity, it may become necessary for multiple content creators and owners to work in collaboration. Content creators and owners communicate and collaborate in a central, organized hub by using Azure DevOps.

To collaborate and communicate in Azure DevOps, you use supporting services.

- **[Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards?view=azure-devops&preserve-view=true):** Content owners use boards to track _work items_. Work items are each assigned to a single developer on the team, and they describe issues, bugs, or features in the solution, and the corresponding stakeholders.
- **[Azure Wiki](/azure/devops/project/wiki/wiki-create-repo?view=azure-devops&tabs=browser&preserve-view=true):** Content creators share information with their team to understand and contribute to the solution.
- **[Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true):** Content creators track changes in the remote repository and merge them into a single solution.
- **[Azure Pipelines](https://learn.microsoft.com/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true):** Pipeline owners set up programmatic logic to deploy the solution, either automatically or on-demand.

#### Collaboration flow diagram

The following diagram depicts a high-level overview of how Azure DevOps enables collaboration in the enterprise content publishing usage scenario. The focus of the diagram is on the use of Azure DevOps to create a structured and documented content publishing process.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing/azure-devops-collaboration-flow-inline.png" alt-text"Image shows the diagram as described in the previous paragraph. Items in the diagram are described in the table" lightbox="media/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing/azure-devops-collaboration-flow-expanded.png" border="false":::

The diagram depicts the following user actions, processes, and features.

| **Item** | **Description** |
|---|---|
| ![Item 1.](media/common/icon-01-red-30x30.png) | A content creator makes a new branch by cloning an existing production or release branch. The new branch is often referred to as the _feature_ or _development_ branch. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | The content creator commits their changes to a local repository during development. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | The content creator links their changes to work items that are managed in Azure Boards. Works items describe specific developments, improvements, or bug fixes scoped to their branch. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | The content creator regularly commits their changes. When ready, the content creator publishes their branch to the remote repository. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | To test their changes, the content creator deploys their solution to a development workspace (not shown in this diagram). Once tested, the content creator opens a pull request to merge their changes into the _release_ branch. The release branch is the latest working version, and it may contain changes from other members of the development team. |
| ![Item 6.](media/common/icon-06-red-30x30.png) | A technical owner is responsible for reviewing the pull request and merging changes. When they approve the pull request, they merge the feature branch into the release branch. |
| ![Item 7.](media/common/icon-07-red-30x30.png) | A successful merge triggers deployment of the solution to a test workspace (not shown in this diagram). Users test the solution in user acceptance testing (UAT). If extra development is required, content creators can make other changes to the development branch, which must be merged to the test branch after the content owner reviews a new pull request. |
| ![Item 8.](media/common/icon-08-red-30x30.png) | The technical owner opens a pull request to merge the release branch into the _production_ branch (sometimes known as the _main_ branch) once UAT is complete. The production branch contains the latest version of the solution that's deployed to the production workspace for content consumers. |
| ![Item 9.](media/common/icon-09-red-30x30.png) | The release manager reviews the changes and approves the pull request. They then merge the release branch into the production branch. |
| ![Item 10.](media/common/icon-10-red-30x30.png) | The release manager performs a final review and approval of the solution. This release approval prevents the solution from being published before it's ready. In enterprise content publishing, a release manager typically plans and coordinates the content release to test and production environments. They coordinate and communicate with content creators, stakeholders and users. |
| ![Item 11.](media/common/icon-11-red-30x30.png) | When the release manager approves the release, Azure Pipelines automatically prepare the solution for deployment. |
| ![Item 12.](media/common/icon-12-red-30x30.png) | The pipelines deploy the solution to the production workspace. |
| ![Item 13.](media/common/icon-13-red-30x30.png) | Content creators and content owners document the solution and its processes in an Azure Wiki, which is available to the entire development team. |

To elaborate, content creators achieve collaboration by using a _branching strategy_. A branching strategy allows individual content creators to work in isolation in their local repository. When ready, they combine their changes as a single solution in the remote repository. Content creators should scope their work to branches by linking them to work items for specific developments, improvements, or bug fixes. Each content creator creates their own branch of the remote repository for their scope of work. Work done on their local solution is committed and pushed to a version of the branch in the remote repository with a _commit message_. A commit message describes the changes made in that commit.

To merge the changes, a content creator opens a _pull request_. A pull request is a submission for peer review that can lead to the merge of the work done into a single solution. Merging can result in conflicts, which must be resolved before the branch can be merged. Pull request reviews are important to ensure creators adhere to organizational standards and practices for development, quality, and compliance.

#### Collaboration recommendations

We recommend that you define a structured process for how content creators should collaborate. Ensure that you determine:

- How work is scoped and how branches are created, named, and used.
- How authors group changes and describe them with commit messages.
- Who's responsible for reviewing and approving pull requests.
- How merge conflicts are resolved.
- How changes made in different branches are merged together into a single branch.
- How content is tested and who performs testing before content is deployed.
- How and when changes are deployed to development, test, and production workspaces.
- How and when deployed changes or versions of the solution should be rolled back.

> [!IMPORTANT]
> The value provided by DevOps is directly proportional to the adherence to the processes that define its use.

A successful collaboration depends on a well-defined process. It's important to clearly describe and document the end-to-end development workflow. Ensure that the selected strategies and processes align with existing practices in your team, and if not, how you'll manage change. Further, ensure that the processes are clear and communicated to all team members and stakeholders. Make sure that team members and stakeholders who are new to the processes are trained in how to adopt them, and that they appreciate the value of successful DevOps adoption.

### Power BI REST APIs

You develop programmatic logic to import and deploy content from Azure DevOps by using the Power BI REST APIs. You import Power BI files (.pbix) to a workspace by using an [import operation](/rest/api/power-bi/imports/post-import-in-group). You use a [pipeline operation](/rest/api/power-bi/pipelines/) to deploy [some content](/rest/api/power-bi/pipelines/selective-deploy) or [all content](/rest/api/power-bi/pipelines/deploy-all) to test or production workspaces by using Power BI deployment pipelines. The programmatic logic is defined in the Azure Pipelines.

We recommend that you use a [service principal](/power-bi/enterprise/service-premium-service-principal) to call Power BI REST APIs in your pipelines. A service principal is intended for unattended, automated activities, and it doesn't rely on user credentials. However, some items and activities [aren't supported by the Power BI REST APIs or when using a service principal](/power-bi/create-reports/deployment-pipelines-automation#considerations-and-limitations), like dataflows.

When you use a service principal, be sure to carefully manage permissions. Your goal should be to follow the [principle of least privilege](/azure/active-directory/develop/secure-least-privileged-access). You should set sufficient permissions for the service principal without over-provisioning permissions. Use [Azure Key Vault](/azure/devops/pipelines/release/azure-key-vault?view=azure-devops&tabs=yaml&preserve-view=true) or another service that securely stores the service principal secrets and credentials.

> [!IMPORTANT]
> If you have a data model that's saved as a human-readable metadata format, it can't be published by using the Power BI REST APIs. Instead, you must publish it by using the [XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools). You can publish metadata files by using third-party tools like the [Tabular Editor command-line interface](https://docs.tabulareditor.com/te2/Command-line-Options.html) (CLI). You can also publish metadata files programmatically by using your own custom .NET development. Developing a custom solution requires more effort, since you must use the Microsoft Tabular Object Model (TOM) extension of the Analysis Management Object (AMO) client libraries.

### Azure Pipelines

[Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true) programmatically automate testing, management, and deployment of content. When a pipeline is run, steps in the pipeline execute automatically. Pipeline owners can customize its triggers, steps, and functionality to meet deployment needs. As such, the number and types of pipelines vary depending on the solution requirements. For example, an Azure Pipeline could run automated tests or modify data model parameters before a deployment.

There are three types of Azure Pipelines that you can set up to test, manage, and deploy your Power BI solution:

- Validation pipelines.
- Build pipelines.
- Release pipelines.

> [!NOTE]
> It's not necessary to have all three of these pipelines in your publishing solution. Depending on your workflow and needs, you may set up one or more of the variants of the pipelines described in this article to automate content publication. This ability to customize the pipelines is an advantage of Azure Pipelines over the built-in Power BI deployment pipelines. For example, you don't have to have a validation pipeline; you can use only use build and release pipelines.

#### Validation pipelines

Validation pipelines perform basic quality checks of data models before they're published to a development workspace. Typically, changes in a branch of the remote repository trigger the pipeline to validate those changes with automated testing.

Examples of automated testing include scanning the data model for best practice rule violations by using [Best Practice Analyzer](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance/) (BPA), or by running DAX queries against a published dataset. The results of these tests are then stored in the remote repository for documentation and auditing purposes. Data models that fail validation shouldn't be published. Instead, the pipeline should notify content creators of the issues.

#### Build pipelines

Build pipelines prepare data models for publication to the Power BI service. These pipelines combine serialized model metadata into a single file that's later published by a release pipeline (described in the release pipelines diagram). A build pipeline may also make other changes to the metadata, like modifying parameter values. The build pipelines produce deployment artifacts that consist of data model metadata (for data models) and Power BI Desktop files (.pbix) that are ready for publication to the Power BI service.

#### Release pipelines

Release pipelines publish or deploy content. A publishing solution typically includes several release pipelines, depending on the target environment.

- **Development release pipeline:** This first pipeline is triggered automatically. It publishes content to a development workspace after the build and validation pipelines succeed.
- **Test and production release pipelines:** These pipelines aren't triggered automatically. Instead, they're triggered on-demand or when approved. Test and production release pipelines deploy content to a test or production workspace, respectively, after _release approval_. [Release approvals](/azure/devops/pipelines/release/approvals/approvals?view=azure-devops&preserve-view=true) ensure that content isn't automatically deployed to a test or production stage before it's ready. These approvals are provided by release managers, who are responsible for planning and coordinating content release to test and production environments.

There are two different approaches to publish content with test and release pipelines. Either they promote content by using a Power BI deployment pipeline, or they publish content to the Power BI service from Azure DevOps.

The following diagram depicts the first approach. In this approach, release pipelines orchestrate content deployment to test and production workspaces by using Power BI deployment pipelines. Content is promoted through development, test, and production workspaces in Power BI. While this approach is more robust and simpler to maintain, it requires Premium licensing.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing/azure-pipelines-publish-content-approach-1-inline.png" alt-text"Image shows a diagram of the first approach as described in the previous paragraph. Items in the diagram are described in the table." lightbox="media/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing/azure-pipelines-publish-content-approach-1-expanded.png" border="false":::

The diagram depicts the following user actions, processes, and features of the first approach.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | In the first approach, the release pipelines publish content by using the XMLA endpoint and the Power BI REST APIs with Power BI deployment pipelines. Content is published and then promoted through development, test, and production workspaces. Power BI deployment pipelines and the XMLA read/write endpoint are [Premium features](/power-bi/enterprise/service-premium-features). |
| ![Item 2.](media/common/icon-02-red-30x30.png) | Either a successful branch merge or completion of an upstream pipeline triggers the build pipeline. The build pipeline then prepares content for publishing, and triggers the development release pipeline. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | The development release pipeline publishes content to the development workspace by using the XMLA endpoint (for data model metadata) or the Power BI REST APIs (for Power BI Desktop files, which can contain data models and reports). The development pipeline uses the Tabular Editor command-line interface (CLI) to deploy data model metadata by using the XMLA endpoint. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | A release approval or on-demand trigger activates the test release pipeline. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | The test release pipeline deploys content by using the Power BI REST API deploy operations, which run the Power BI deployment pipeline. |
| ![Item 6.](media/common/icon-06-red-30x30.png) | The Power BI deployment pipeline promotes content from the development workspace to the test workspace. After deployment, the release pipeline performs post-deployment activities by using the Power BI REST APIs (not shown in the diagram). |
| ![Item 7.](media/common/icon-07-red-30x30.png) | A release approval or on-demand trigger activates the production release pipeline. |
| ![Item 8.](media/common/icon-08-red-30x30.png) | The production release pipeline deploys content by using the Power BI REST API deploy operations, which run the Power BI deployment pipeline. |
| ![Item 9.](media/common/icon-09-red-30x30.png) | The Power BI deployment pipeline promotes content from the test workspace to the production workspace. After deployment, the release pipeline performs post-deployment activities by using the Power BI REST APIs (not shown in the diagram). |

The following diagram depicts the second approach. This approach doesn't use deployment pipelines. Instead, it uses release pipelines to publish content to test and production workspaces from Azure DevOps. Notably, this second approach doesn't require Premium licensing when you publish only Power BI Desktop files with the Power BI REST APIs. It does involve more setup effort and complexity, because you must manage deployment outside of Power BI. Development teams that already use DevOps for data solutions outside of Power BI may be more familiar with this approach. Development teams that use this approach can consolidate deployment of data solutions in Azure DevOps.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing/azure-pipelines-publish-content-approach-2-inline.png" alt-text"Image shows a diagram of the second approach as described in the previous paragraph. Items in the diagram are described in the table." lightbox="media/powerbi-implementation-planning-usage-scenario-enterprise-content-publishing/azure-pipelines-publish-content-approach-2-expanded.png" border="false":::

The diagram depicts the following user actions, processes, and features in the second approach.

| **Item** | **Description** |
|---|---|
| ![Item 1.](media/common/icon-01-red-30x30.png) | In the second approach, the release pipelines publish content by using the XMLA endpoint and the Power BI REST APIs only. Content is published to development, test, and production workspaces. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | Either a successful branch merge or completion of an upstream pipeline triggers the build pipeline. The build pipeline then prepares content for publishing, and triggers the development release pipeline. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | The development release pipeline publishes content to the development workspace by using the XMLA endpoint (for data model metadata) or the Power BI REST APIs (for Power BI Desktop files, which can contain data models and reports). The development pipeline uses the Tabular Editor command-line interface (CLI) to deploy data model metadata by using the XMLA endpoint. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | A release approval or on-demand trigger activates the test release pipeline. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | The development release pipeline publishes content to the test workspace by using the XMLA endpoint (for data model metadata) or Power BI REST APIs (for Power BI Desktop files, which can contain data models and reports). The development pipeline uses the Tabular Editor command-line interface (CLI) to deploy data model metadata by using the XMLA endpoint. After deployment, the release pipeline performs post-deployment activities by using the Power BI REST APIs (not shown in the diagram). |
| ![Item 6.](media/common/icon-06-red-30x30.png) | A release approval or on-demand trigger activates the production release pipeline. |
| ![Item 7.](media/common/icon-07-red-30x30.png) | The development release pipeline publishes content to the production workspace by using the XMLA endpoint (for data model metadata) or Power BI REST APIs (for Power BI Desktop files, which can contain data models and reports). The development pipeline uses the Tabular Editor command-line interface (CLI) to deploy data model metadata by using the XMLA endpoint. After deployment, the release pipeline performs post-deployment activities by using the Power BI REST APIs (not shown in the diagram). |

Release pipelines should manage [post-deployment activities](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md#post-deployment-activities). These activities could include setting dataset credentials or updating the Power BI app for test and production workspaces. We recommend that you [set up notifications](/azure/devops/organizations/notifications/about-notifications?view=azure-devops&preserve-view=true) to inform relevant people about deployment activities.

> [!TIP]
> Using a repository for version control allows content creators to create a rollback process. The rollback process can reverse the last deployment by restoring the previous version. Consider creating a separate set of Azure Pipelines that you can trigger to roll back production changes. Think carefully about what processes and approvals are required to initiate a rollback. Ensure that these processes are documented.

### Power BI deployment pipelines

A Power BI deployment pipeline consists of three stages: development, test, and production. You assign a single Power BI workspace to each stage in the deployment pipeline. When a deployment occurs, the deployment pipeline promotes Power BI items from one workspace to another.

An Azure Pipelines release pipeline uses the Power BI REST APIs to [deploy content by using a Power BI deployment pipeline](/power-bi/create-reports/deployment-pipelines-automation). [Access to both the workspace and the deployment pipeline](/power-bi/create-reports/deployment-pipelines-process#permissions) is required for the users conducting a deployment. We recommend that you [plan deployment pipeline access](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md#access-for-deployment-pipeline) so that pipeline users can view deployment history and compare content.

> [!TIP]
> When you [separate data workspaces from reporting workspaces](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-item-types), consider using Azure Pipelines to orchestrate content publishing with multiple Power BI deployment pipelines. Datasets are deployed first, and then they're refreshed. Lastly, reports are deployed. This approach helps you simplify deployment.

### Premium licensing

Power BI deployment pipelines and the XMLA read/write endpoint are [Premium features](/power-bi/enterprise/service-premium-features). These features are available with Power BI Premium capacity and Power BI Premium Per User (PPU).

PPU is a cost-effective way to manage enterprise content publishing for development and test workspaces, which typically have few users. This approach has the added advantage of isolating development and test workloads from production workloads.

> [!NOTE]
> You can still set up enterprise content publishing without a Premium license, as described by the second approach in the [release pipeline](#azure-pipelines) section. In the second approach, you use Azure Pipelines to manage deployment of Power BI Desktop files to development, test, and production workspaces. However, you can't deploy model metadata by using the XMLA endpoint because it's not possible to publish a metadata format dataset with the Power BI REST APIs. Also, it's not possible to promote content through environments with deployment pipelines without a Premium license.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The two purposes of a gateway are to [refresh imported data](/power-bi/connect-data/refresh-data), and view a report that queries a live connection or [DirectQuery](/power-bi/connect-data/desktop-directquery-about) dataset (not depicted in the scenario diagram).

When working with multiple environments, it's common to set up development, test, and production connections to different source systems. In this case, use [data source rules and parameter rules](/power-bi/create-reports/deployment-pipelines-create-rules) to manage values that differ between environments. You can use Azure Pipelines to manage gateways by using the [gateway operations](/rest/api/power-bi/gateways) of the Power BI REST APIs.

> [!NOTE]
> A centralized data gateway in _standard mode_ is strongly recommended over gateways in _[personal mode](/power-bi/connect-data/service-gateway-personal-mode#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode)_. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](/power-bi/admin/service-admin-auditing) records events that occur in the Power BI service. Power BI administrators can use the activity log to [audit](powerbi-adoption-roadmap-system-oversight.md#auditing) deployment activities.

You can use the Power BI [metadata scanning APIs](/power-bi/enterprise/service-admin-metadata-scanning) to create a tenant inventory. The API results are helpful to verify which items have been deployed to each workspace, to check lineage, and to validate security settings.

There's also an [audit log](/azure/devops/organizations/audit/azure-devops-auditing?view=azure-devops&tabs=preview-page&preserve-view=true) within Azure DevOps, which is outside of the Power BI service. Azure DevOps administrators can use the audit log to review activities in remote repositories and pipelines.

## Next steps

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
