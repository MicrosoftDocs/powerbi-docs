---
title: "Power BI implementation planning: Develop content and manage changes"
description: "This article helps you to develop content and manage changes as part of managing the content lifecycle."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 04/24/2024
---

# Power BI implementation planning: Develop content and manage changes

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to develop content and manage changes as part of managing the content lifecycle. It's primarily targeted at:

- **Center of Excellence (COE) and BI teams:** The teams that are responsible for overseeing Power BI in the organization. These teams include decision makers who decide how to manage the lifecycle of Power BI content. These teams can also include roles like release managers, who handle the lifecycle of content releases, or engineers who create and manage the components needed to effectively use and support lifecycle management.
- **Content creators and content owners:** Users who create content, which they want to publish to the Fabric portal to share with others. These individuals are responsible for managing the lifecycle of the Power BI content that they create.

Lifecycle management is the processes and practices you use to handle content from its creation to its eventual retirement. In the [first stage of lifecycle management](powerbi-implementation-planning-content-lifecycle-management-plan-design.md), you plan and design content, which involves [solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md) and making key decisions that affect your approach to lifecycle management. In the second stage, you develop content and manage changes.

Managing content changes during its lifecycle is important to ensure effective collaboration among content creators and stable and consistent delivery of content to consumers.

The following image depicts the lifecycle of Power BI content, highlighting stage two, where you develop content and manage changes.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-develop-manage/content-lifecycle-management-stage-2.svg" alt-text="Diagram shows the Power BI content lifecycle. Stage 2, which is about content development and managing change, is highlighted." border="false":::

> [!NOTE]
> For an overview of content lifecycle management, see the [first article in this series](powerbi-implementation-planning-content-lifecycle-management-overview.md).

> [!TIP]
> This article focuses on key decisions and considerations to help you develop content and manage changes throughout its lifecycle. For more guidance about how to develop content and manage changes, see:
>
> - **[What is lifecycle management in Microsoft Fabric?](/fabric/cicd/cicd-overview):** This article provides a technical introduction and [tutorial](/fabric/cicd/cicd-tutorial) to Fabric Git integration and deployment pipelines.
> - **[Lifecycle management best practices](/fabric/cicd/best-practices-cicd#content-preparation):** This article contains practical tips and guidance for using the lifecycle management features of Fabric and Power BI to develop content and manage changes.
> - **[Power BI Desktop OneDrive and SharePoint integration](../create-reports/desktop-sharepoint-save-share.md):** This article contains an overview of the options to use and store files saved to OneDrive for Work and School or SharePoint when you perform version control with .pbix files.
> - **[Get started with Git in Azure Repos](/azure/devops/repos/git/gitquickstart?view=azure-devops&tabs=visual-studio-2022&preserve-view=true):** This series of articles contain practical tips, tutorials, and guidance for performing source control by using a Git repository in Azure Repos.

Content creators and owners should manage content changes by using _version control_. Version control is the practice of managing changes to files or code in a central repository. This practice facilitates more effective collaboration and content management.

Other benefits of version control include the ability to:

- Merge changes from multiple content creators, and handle merge conflicts.
- Identify which content changed, and what changed in that content.
- Link content changes to specific work items.
- Group changes into distinct releases with version history.
- Roll back changes or entire versions of content.

> [!TIP]
> We recommend that you use version control for all content that you create, where possible. Using version control has significant benefits both for content creators and consumers and reduces the risk of disruption due to file loss or the inability to roll back changes.

The first step to set up version control is to decide how you'll develop content.

## Decide how to develop content

Depending on how you author content, you'll make different decisions about how to manage it. For instance, for Power BI reports and semantic models, a Power BI Desktop (.pbix) file has fewer options for version control compared to the [Power BI Desktop project (.pbip)](../developer/projects/projects-overview.md) format. That's because a .pbix file is a binary format, whereas the .pbip format contains text-based human-readable content and metadata. Having human-readable content and metadata allows for easier tracking of model and report changes by using _source control_. Source control is when you view and manage changes _within_ content to its code and metadata.

> [!TIP]
> When developing semantic models and reports by using Power BI Desktop, we recommend that you use .pbip files instead of .pbix files. When developing semantic models by using XMLA tools, we recommend that you use the Tabular Model Definition Language (TMDL) format, instead of .bim files.
>
> The .pbip and TMDL formats support easier tracking and merging of object-level changes. This means that you can view and manage changes to individual objects, like DAX measures or tables.

### Power BI Desktop

You can use Power BI Desktop to create semantic models or reports, which you can save as either .pbix or .pbip files. There are additional custom content files that you also may use when you use Power BI Desktop.When using Power BI Desktop to create content, some key decisions you should make include:

- **Which file format to use:** You can save content either as .pbix or .pbip files. For instance, Git integration requires that you use .pbip files, self-service creators might find .pbix files simpler to manage and maintain in Teams, SharePoint, or OneDrive.
- **How to manage custom content:** You can add themes, custom visuals, or images to Power BI Desktop files, which may require distinct considerations for lifecycle management. For instance, when content creators make their own custom visuals, they should save and manage the visual definition in a separate file.
- **How to manage preview features:** You can opt-in to preview features or settings in Power BI Desktop, which alters content and how you'll use it. For instance, you might take additional steps to validate content that uses preview features.

### Web authoring

Certain content—such as dataflows, dashboards, and scorecards—can only be created in the Fabric portal. You can also create or modify some content—such as semantic models, reports, and paginated reports—in both the Fabric portal or by using local tools. When creating content by using web authoring, some key decisions you should make include:

- **How to manage changes:** You can make changes to many item types by using web authoring, but these changes might be saved instantly, overwriting previous versions. For instance, if you are collaborating with others, you might want to avoid web authoring on shared items, working instead on your own copy.
- **How to retrieve content backups:** You can create content like reports or semantic models by using web authoring, but these items [cannot be downloaded to local .pbix files](../create-reports/service-export-to-pbix.md#limitations). For instance, you can choose to back up this content by retrieving and storing its metadata.

> [!TIP]
> When developing dataflows and scorecards, we recommend that you retrieve the item definitions to manage changes and store a backup. You can automate dataflow and scorecard retrieval by using the [Fabric REST APIs](/rest/api/fabric/articles/using-fabric-apis). Specifically, you can use the [Get Dataflow](/rest/api/power-bi/dataflows/get-dataflow) and [Get Scorecards](/rest/api/power-bi/scorecards_%28preview%29/get) endpoints, respectively.

> [!CAUTION]
> Some content—like dashboards—doesn't have the option to retrieve a definition. For this content, you can't easily track changes or retrieve a backup.

### Other tools

You can use other tools to create or manage certain types of content. These tools may provide added benefits, better suit your workflow, or be required to manage specific features or content types. You can use both other Microsoft tools or third-party tools to create and manage content. Other tools you can use to create or manage content are as follows.

- **Visual Studio or Visual Studio Code:** An integrated development environment for developers to create and manage semantic models or Fabric notebooks. With both [Visual Studio](/visualstudio/windows/?view=vs-2022&preserve-view=true) and [Visual Studio Code](https://code.visualstudio.com/docs), developers can also perform source control management (SCM) by committing and pushing local changes to a remote repository.
- **Tabular Editor:** A third-party tool to develop and manage semantic models.
- **Excel:** A client tool for pivot tables and live connected tables that work with a semantic model.
- **Power BI Report Builder:** A desktop application for creating paginated report (.rdl) files.

When creating content by using other tools, some key decisions you should make include:

- **How to manage licenses:** Other tools may require additional licenses that you should manage.
- **How to publish content:** Other tools may require additional steps to publish content, such as by using XMLA endpoints or the Power BI REST APIs.

Once you decide how you'll create content, you next need to choose where you'll publish and test content while you develop it.

## Decide how you'll set up and use workspaces

When developing content, you should use multiple workspaces (or stages) to separate production content used by the organization from content being developed or validated. There are several advantages to using separate workspaces for your content:

- You can develop and test content without affecting the content that's currently in use. This avoids changes that can cause unintentional disruption to content in production.
- You can use separate resources for developing and testing content, like using separate [data gateways](powerbi-implementation-planning-data-gateways.md) or [Fabric capacities](/fabric/enterprise/licenses). This avoids that resources used for development and testing disrupts production workloads, causing slow data refreshes or reports.
- You can create a more structured process to develop, test, and release content by having discrete environments for each of these stages. This helps you to improve productivity.

In Fabric and Power BI, we recommend that you use separate Fabric workspaces, as described in the [tenant-level](powerbi-implementation-planning-workspaces-tenant-level-planning.md) and [workspace-level](powerbi-implementation-planning-workspaces-workspace-level-planning.md) planning articles.

> [!IMPORTANT]
> Using separate environments is an essential step to ensure the success of your content lifecycle management approach.

There's multiple ways to use Fabric workspaces to separate environments. Typically, in addition to your local environment, you use two or more workspaces to manage content during its lifecycle.

Answer the following questions as you plan how you'll use separate workspaces throughout the lifecycle of this content:

- How many workspaces do you need?
- Will you [separate workspaces by item type](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-item-types)?
- Who will have access to each workspace?
- Will the workspaces belong to a [Fabric deployment pipeline](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines), or will you orchestrate deployment by using other approaches, such as by using [Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true)?
- How will you manage [cross-workspace publishing](../connect-data/service-datasets-across-workspaces.md)? For instance, do you need to ensure that reports in a test workspace for reports connect to semantic models in a separate test workspace for data items?
- Do you need to also use separate supporting resources for items in production workspaces, such as a [separate on-premises data gateway cluster](/data-integration/gateway/service-gateway-high-availability-clusters)?

The following sections provide a high-level overview of the different approaches you can take to separate workspaces to facilitate lifecycle management.

> [!NOTE]
> The following sections focus on how you can set up and use separate workspaces. You can deploy content to these workspaces by using one of the following four approaches:
>
> - Publishing from Power BI Desktop.
> - Deploying content from another workspace by using Fabric deployment pipelines.
> - Syncing content from a remote Git repository by using Git integration.
> - Deploying content programmatically by using the Fabric REST APIs, Power BI REST APIs, or XMLA endpoints.
>
> For more information about these approaches to deploy content, see [Stage 4: Deploy content](powerbi-implementation-planning-content-lifecycle-management-deploy.md) later in this series.

### Test and production workspaces

When you deliver simpler content that's not critical for the organization, two workspaces can often suffice. In this scenario, content creators typically have limited collaboration on the same items, and develop content locally.

The following diagram depicts a high-level example of how you might use separate environments with only a test and production workspace.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-develop-manage/test-production-workspaces.svg" alt-text="Diagram shows approach 1, which is about test and production workspaces. Items in the diagram are described in the following table." border="false":::

The diagram depicts the following processes and components to separate workspaces in this approach.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Content creators develop content in their local environment. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | When ready, content creators publish content to a test workspace. Content creators can develop content that can only be produced with web authoring and perform content validation in the test workspace. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | When ready, content creators deploy content to a production workspace. In the production workspace, content creators distribute content by publishing a Power BI app or sharing content from the workspace. |

> [!NOTE]
> There are many different ways to set up and use separate workspaces, and deploy content between these workspaces. However, we recommend that you don't perform local development, then publish content directly to a production workspace. This can lead to preventable disruptions and errors.

### Development, test, and production workspaces

When delivering business-critical content, you typically use three or more separate workspaces. In this scenario, content creators often collaborate in an additional, development workspace that contains the latest version of the solution.

The following diagram depicts a high-level example of how you might use separate environments with a development, test, and production workspace.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-develop-manage/development-test-production-workspaces.svg" alt-text="Diagram that shows approach 2: Development, test, and production workspaces." border="false":::

The diagram depicts the following processes and components to separate workspaces in this approach.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Content creators develop content in their local environment. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | When ready, content creators publish content to a development workspace. In the development workspace, content creators can develop content that can only be produced with web authoring. Content creators can also validate content in the development workspace. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | When ready, content creators deploy content to a test workspace. In the test workspace, users validate content, either in the workspace or an app. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | When ready, content creators deploy content to a production workspace. In the production workspace, content creators distribute content by publishing a Power BI app or sharing content from the workspace. |

> [!NOTE]
> You can use up to ten different environments with deployment pipelines. For instance, you might want to have a pre-production environment between test and production that's specifically for special types of validation, like performance testing.

### Private workspace with Git integration

When delivering business-critical content, each developer can also use their own, [private workspace for development](/fabric/cicd/best-practices-cicd#working-with-a-private-workspace). In this scenario, a private workspace allows content creators to test content in the Fabric portal, or use features like scheduled refresh without risking disruption to others in the development team. Content creators can also develop content in the Fabric portal here, such as dataflows. Private workspaces can be a good choice when you are managing content changes by using Git integration together with Azure DevOps.

> [!NOTE]
> [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops?view=azure-devops&preserve-view=true) is a suite of services that integrate with Power BI and Fabric to help you plan and orchestrate content lifecycle management. When you use Azure DevOps this way, you typically leverage the following services:
>
> - **[Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true):** Allows you to create and use a remote Git repository, which is a remote storage location you use to track and manage content changes.
> - **[Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true):** Allows you to create and use a set of automated tasks to handle, test, and deploy content from a remote repository to a workspace.
> - **[Azure Test Plans](/azure/devops/test/overview?view=azure-devops&preserve-view=true):** Allows you to design tests to validate the solution and automate quality control together with Azure Pipelines.
> - **[Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards?view=azure-devops&preserve-view=true):** Allows you to use boards to track tasks and plans as work items, and link or refer to work items from other Azure DevOps services.
> - **[Azure Wiki](/azure/devops/project/wiki/wiki-create-repo?view=azure-devops&tabs=browser&preserve-view=true):** Allows you to share information with their team to understand and contribute to content.

The following diagram depicts a high-level example of how you might use separate environments by using a private workspace with Git integration.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-develop-manage/private-workspace-git-integration.svg" alt-text="Diagram that shows approach 3: Private workspaces with Git integration." border="false":::

> [!NOTE]
> The diagram depicts separate developers working on separate branches of a solution (branch one and branch two) before merging their changes into a main branch. This is a simplified depiction of a [Git branching strategy](/azure/devops/repos/git/git-branching-guidance?view=azure-devops&preserve-view=true) to illustrate how developers can integrate their changes with a remote Git repository and benefit from Git integration in Fabric.

The diagram depicts the following processes and components to separate workspaces in this approach.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Each content creator develops content in their own local environment. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | When ready, content creators commit and push their changes to a remote repository, such as an Azure Repos Git repository. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | In the remote Git repository, content creators track and manage content changes by using source control, and branch and merge content to facilitate collaboration. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Content creators sync a branch of the remote repository with a private workspace. After syncing, the latest changes that a creator commits and pushes to the branch are visible in that private workspace. Different content creators work on their own, separate branches as they make changes. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | In the private workspaces, content creators can develop content by using web authoring, and validate their own changes. Changes to content made by web authoring can sync with the branch in the Git repository when the content creator commits and pushes these changes from the workspace. Different content creators work in their own, separate private workspaces. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | When ready, content creators perform a pull request to merge their changes into the main branch of the solution. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | After merging changes, the main branch syncs with the development workspace. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | In the development workspace, content creators can develop content that isn't supported by Fabric Git integration, such as dashboards. Content creators also validate the integrated solution that contains all of the latest changes. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | When ready, content creators deploy content to a test workspace. In the test workspace, users perform user acceptance testing of content. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | When ready, content creators deploy content to a production workspace. In the production workspace, content creators distribute content by publishing a Power BI app or sharing content from the workspace. |

### Supporting resources for workspaces

When you use separate environments, you should also consider how this will impact various supporting resources that you use in these environments. For these supporting resources, consider whether you also need to separate them into the same number of stages, or else how you'll coordinate their use across these environments.

- **Gateways:** Consider using [separate on-premises data gateway clusters](powerbi-implementation-planning-data-gateways.md#determine-the-number-of-gateways) and VNet gateways for production workloads. This is beneficial to prevent disruption, but also to ensure uptime when you need to update these gateways.
- **Apps:** Consider having separate apps for test and production workspaces. It's not possible to deploy or copy apps between stages. Apps in the test workspace are intended to help you test content and the app experience before you deploy changes to the production workspace. Apps in the production workspace are intended to deliver content to end-users in a structured and experience.
- **Azure DevOps:** If you intend to use Azure DevOps to collaborate and orchestrate source control and deployment, consider how you'll use branches and Azure Pipelines to deploy content between these environments. For more information about using Azure Pipelines to deploy content, see [Stage 4: Deploy content](powerbi-implementation-planning-content-lifecycle-management-deploy.md).

Once you've decided how you'll set up and use workspaces, the next step is to decide how you'll perform version control to track and manage content changes.

## Decide how you'll use version control

In Power BI, you can perform version control either by using SharePoint/OneDrive, or by using a remote Git repository, such as [Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true), which is a component of [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops). In both approaches, you add local content files to a remote storage location to help track and manage changes. We recommend that you use SharePoint or OneDrive only for smaller and simpler projects, as it lacks the features and robustness to support larger or more complicated scenarios.

Here are some general considerations to help you set up and use version control.

- **Alerts:** You should set up alerts for when others add, remove, or modify critical files.
- **Scope:** Clearly define the scope of the remote storage location. Ideally, the scope of the remote storage location is identical to the scope of the downstream workspaces and apps that you use to deliver content to consumers.
- **Access:** You should set up access to the remote storage location by using a similar permissions model as you have set up for your [deployment pipeline permissions](powerbi-implementation-planning-security-content-creator-planning.md#deployment-pipeline-access) and [workspace roles](powerbi-implementation-planning-security-content-creator-planning.md#workspace-roles). Content creators need access to the remote storage location.
- **Documentation:** Add text files to the remote storage location to describe the remote storage location and its purpose, ownership, access, and defined processes.

The following sections describe each approach and key considerations to decide which one you should use.

### Version control by using SharePoint or OneDrive for Work and School

SharePoint has built-in version control for files. Content creators can develop semantic models or reports locally, and their changes are synchronized to a SharePoint or OneDrive for Work and School document library.

> [!TIP]
> Use SharePoint or OneDrive only for version control in simpler, smaller scenarios, like [self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md). For larger or more complicated scenarios, you should consider performing [source control by using a remote Git repository](#source-control-by-using-a-remote-git-repository).

The following diagram depicts a high-level overview of how you perform version control by using SharePoint or OneDrive.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-develop-manage/version-control-sharepoint-onedrive.svg" alt-text="Diagram that shows approach 1: Version control by using SharePoint or OneDrive." border="false":::

The diagram describes the following processes and components.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Content creators develop semantic models and reports in their local environment and save these models and reports as .pbix files. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | When ready, content creators save their changes, which they sync to a remote SharePoint or OneDrive for Work and School library. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | In the remote library, content creators track file-level changes which facilitates version control. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Content creators can link a published semantic model or report to a .pbix file to facilitate OneDrive refresh. OneDrive refresh automatically publishes content changes every hour. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | In the Fabric workspace, content creators see the changes to Power BI content after OneDrive refresh completes. |

> [!IMPORTANT]
> You can only perform version control by using SharePoint or OneDrive for Power BI Desktop files that contain semantic models or reports. You can't easily perform version control by using SharePoint or OneDrive for other Power BI item types like dataflows, or for Fabric item types like notebooks. For these other item types, you should perform version control by using a remote Git repository, like Azure Repos.

To summarize, content creators can [link](../connect-data/refresh-desktop-file-onedrive.md) a published semantic model or report to a .pbix file that's stored in a SharePoint or OneDrive for Work and School library. With this approach, content creators no longer have to publish the semantic model to see changes. Instead, the changes are visible after an automatic _[OneDrive refresh](../connect-data/refresh-desktop-file-onedrive.md#automatic-versus-manual-updates-of-model-information)_, which occurs hourly. While convenient, this approach comes with some [considerations](../connect-data/refresh-desktop-file-onedrive.md#when-things-go-wrong), and it can't be easily reversed.

While easy to set up and manage, version control with SharePoint or OneDrive has more limitations. For example, it's not possible to view changes _within_ the content, and it's also not possible to compare versions. Additionally, it's not possible to set up more sophisticated processes to manage these changes (like branching or pull requests, [described later in this article](#use-branches)).

Consider using SharePoint or OneDrive to track and manage changes in the following scenarios:

- Content consists of only semantic models or reports saved as .pbix files.
- Self-service users create and manage the content.
- Content creators collaborate by using Microsoft Teams.
- Content creators are inexperienced with Git and source control management.
- Content creators manage a single item with limited complexity and collaboration.
- The .pbix files have a sensitivity label applied that encrypts their contents.

> [!NOTE]
> OneDrive and SharePoint support content that has sensitivity labels applied, except for some [limited scenarios](../connect-data/refresh-desktop-file-onedrive.md#when-things-go-wrong). In contrast, Fabric Git integration [doesn't support sensitivity labels](/fabric/cicd/git-integration/git-integration-process#sync-and-commit-limitations).

Avoid using SharePoint or OneDrive to track and manage changes in the following scenarios:

- Content consists of item types other than semantic models and reports.
- Content is complex or large in scope.
- Content creators need to work collaboratively on the same item at the same time.

The following sections describe additional considerations to effectively use version control by using SharePoint or OneDrive with Power BI.

#### Microsoft Teams integration

You might use the document libraries from Microsoft Teams if content creators use it for their collaboration. Document libraries are SharePoint sites, and using the document libraries (instead of a separate SharePoint site or OneDrive folder) ensures centralization of content, files, and collaboration.

#### Check-in and check-out files

You should [check-out](https://support.microsoft.com/office/check-out-or-check-in-files-in-a-document-library-acce24cd-ab39-4fcf-9c4d-1ce3050dc602) files that you're working on to avoid possible change conflicts. Once changes are complete, check-in the files with comments that describe the change. Checking-in and checking-out files helps you to improve collaboration between content creators when you use SharePoint or OneDrive for Work and School for version control. If you check-in and check-out files with multiple content creators, you can modify the SharePoint site library to view the last update and the comments of the last check-in.

#### Version history

Ensure that you back up content to a separate location in case of unexpected disruptions to your SharePoint site document library. You should also set limits to the number of versions kept in the SharePoint site and delete old versions. This ensures that version history remains meaningful and doesn't take up too much space.

For more sophisticated version control, you can store files in a remote repository like Azure Repos and manage changes by using source control.

### Source control by using a remote Git repository

A remote Git repository facilitates source control of files, which allows content creators more options to track and manage changes. In brief, content creators can develop content either locally or in the Power BI service, then commit and push those changes to a remote Git repository like Azure Repos

> [!NOTE]
> You can also perform source control of your content without using Git integration. In this scenario, you still track and manage content changes in a remote Git repository, but you deploy content using either the REST APIs or XMLA read/write endpoints. For more information about these methods of deploying content, see [Stage 4: Deploy content](powerbi-implementation-planning-content-lifecycle-management-deploy.md).

The following diagram depicts a high-level overview of how you perform source control by

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-develop-manage/source-control-azure-devops.svg" alt-text="Diagram that shows approach 2: Source control by using Azure DevOps." border="false":::

The diagram describes the following processes and components.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Content creators develop semantic models and reports in their local environment and save these models and reports as .pbip files. Content creators can also develop semantic models and save model metadata. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | When ready, content creators save their changes, which they commit and push to a remote Git repository at regular intervals. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | In the remote Git repository, content creators track object-level changes, which facilitates version control. Content creators can also create branches to work on content, and merge their changes into a single branch by using pull requests. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Content creators can sync content from the remote repository by using Git integration. They can also deploy content by using other approaches, such as Azure Pipelines together with the REST APIs. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | In the Fabric workspace, content creators see the changes to Power BI content after sync or deployment completes. Content creators can author content like dataflows or notebooks in the workspace. If they use Git integration, content creators link this workspace to a specific branch of the remote repository. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | Content creators can commit and push changes from a workspace to the remote repository by using Git integration. These changes can import item definitions for supported content authored in the workspace, like dataflows and notebooks. |

In summary, content creators store .pbip files, metadata files, and documentation in a central Azure Repos remote repository. These files are curated by a _[technical owner](powerbi-adoption-roadmap-content-ownership-and-management.md#ownership-and-stewardship)_. While a content creator develops a solution, a technical owner is responsible for managing the solution and reviewing the changes, and merging them into a single solution. Azure Repos provides more sophisticated options for tracking and managing changes compared to SharePoint and OneDrive. Maintaining a well-curated, documented repository is essential because it's the foundation of all content and collaboration.

Consider using source control to track and manage changes in the following scenarios:

- Centralized or decentralized teams create and manage the content.
- Content creators collaborate by using Azure DevOps.
- Content creators are familiar with Git, source control management, or DataOps principles.
- Content creators manage complex or important content or expect the content to scale and grow in complexity and importance.

Here are some pre-requisites and considerations to help you effectively use source control with Azure DevOps.

- **Git:** To commit and push changes to a remote repository, content creators need to [download](https://git-scm.com/downloads) and install _Git_. Git is a distributed version control system that tracks changes in your files. To learn Git basics, see [What is Git?](/devops/develop/git/what-is-git).
- **Tools:** To use Git, content creators need to either use a [command line interface (CLI)](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line) or a graphical user interface (GUI) client for SCM, like [Visual Studio](https://visualstudio.microsoft.com/) or [Visual Studio Code](https://code.visualstudio.com/).
- **Licenses and permissions:** To create and use an Azure Repos Git repository, content creators must have the following:
  - [Access level](/azure/devops/organizations/billing/buy-basic-access-add-users?view=azure-devops&preserve-view=true) set to Basic (as opposed to Stakeholder).
  - Belong to an [organization](/azure/devops/user-guide/manage-organization-collection?view=azure-devops&preserve-view=true#add-users-to-your-organization) and a [project](/azure/devops/organizations/security/add-users-team-project?view=azure-devops&tabs=preview-page&preserve-view=true).
  - Appropriate [repository permissions](/azure/devops/repos/git/set-git-repository-permissions?view=azure-devops&preserve-view=true).
- **Fabric Git integration:** To sync content in a remote repository with a Microsoft Fabric workspace, content creators use [Fabric Git integration](/fabric/cicd/git-integration/intro-to-git-integration). This is important to track and manage changes to content that's created in the Fabric portal, like dataflows.

> [!TIP]
> To facilitate source control with local development, we recommend using a client application like [Visual Studio Code](https://code.visualstudio.com/). You use Power BI Desktop to develop content, then you can use Visual Studio Code to perform source control management of that content, by staging, committing, and pushing changes to your remote repository.

> [!WARNING]
> Fabric Git integration has [some limitations](/fabric/cicd/git-integration/intro-to-git-integration#considerations-and-limitations) with the supported items and scenarios. Ensure that you first validate whether Fabric Git integration best suits your specific scenario, or whether you should take a different approach to implement source control.
>
> Additionally, [sensitivity labels aren't supported with Fabric Git integration](/fabric/cicd/git-integration/git-integration-process#sync-and-commit-limitations), and [exporting items with sensitivity labels might be disabled](/fabric/admin/git-integration-admin-settings#users-can-export-workspace-items-with-applied-sensitivity-labels-to-git-repositories-preview). If your content has sensitivity labels, you should plan how you can achieve version control while still honoring your data loss prevention policies.

A key benefit of using source control with Azure Repos is improved collaboration between content creators and more customization and oversight regarding content changes and deployment.

The following diagram depicts a high-level overview of how Azure DevOps enables collaboration with source control.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-develop-manage/azure-devops-collaboration-flow.svg" alt-text="Diagram that shows how to collaborate by using Azure DevOps." border="false":::

> [!NOTE]
> The previous diagram depicts one example of how to collaborate by using Azure DevOps. Choose an approach that best fits the needs and the way of working of your team.

The diagram depicts the following user actions, processes, and features.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | A content creator makes a new, short-lived branch by cloning the main branch, which contains the latest version of the content. The new branch is often referred to as the feature branch, as it's used to develop a specific feature or fix a specific issue. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The content creator commits their changes to a local repository during development. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The content creator links their changes to work items that are managed in Azure Boards. Works items describe specific developments, improvements, or bug fixes scoped to their branch. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | The content creator regularly commits their changes. When ready, the content creator publishes their branch to the remote repository. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | To test their changes, the content creator deploys their solution to an isolated workspace for their development (not shown in this diagram). The content creator can also sync the feature branch to the workspace by using Fabric Git integration. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | Content creators and content owners document the solution and its processes in an Azure Wiki, which is available to the entire development team. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | When ready, the content creator opens a pull request to merge the feature branch into the main branch. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | A technical owner is responsible for reviewing the pull request and merging changes. When they approve the pull request, they merge the feature branch into the main branch. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | A successful merge triggers deployment of the solution to a development workspace by using an Azure Pipeline (not shown in this diagram). When using Fabric Git integration, the main branch syncs to the development workspace. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | The release manager performs a final review and approval of the solution. This release approval prevents the solution from being published before it's ready. In enterprise content publishing, a release manager typically plans and coordinates the content release to test and production workspaces. They coordinate and communicate with content creators, stakeholders, and users. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | When the release manager approves the release, Azure Pipelines automatically prepare the solution for deployment. Alternatively, an Azure Pipeline can also trigger a deployment pipeline to promote content between workspaces. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg)| Users test and validate content in the test workspace. When using Git integration with Azure Pipelines for deployment, the test workspace doesn't sync with any branch. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | After users accept and validate changes, the release manager performs a final review and approval of the solution to deploy to the production workspace. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | Users view content that's published to the production workspace. When using Git integration with Azure Pipelines for deployment, the production workspace doesn't sync with any branch. |

The following sections describe additional considerations to effectively use source control by using Azure DevOps and Power BI.

> [!IMPORTANT]
> Effective use of branching, commits, pull requests, and merges are essential to most benefit from source control when you manage the lifecycle of your Power BI content.

#### Use branches

Content creators achieve collaboration by using a _branching strategy_. A branching strategy allows individual content creators to work in isolation in their local repository. When ready, they combine their changes as a single solution in the remote repository. Content creators should scope their work to branches by linking them to work items for specific developments, improvements, or bug fixes. Each content creator creates their own branch of the remote repository for their scope of work. Work done on their local solution is committed and pushed to a version of the branch in the remote repository with a descriptive _commit message_. A commit message describes the changes made in that commit.

When you use a branching strategy to manage Fabric content, consider the following factors.

- Which branch content creators should clone for their own work. For instance, if these branches are a clone of the main branch (known as _[trunk based development](https://trunkbaseddevelopment.com/)_) or if they are other branches, like release branches for specific, planned versions of content.
- Whether you'll scope specific work to distinct content releases by using [release branches](/azure/devops/repos/git/git-branching-guidance?view=azure-devops&preserve-view=true#manage-releases).
- Which branches connect to which workspace when you use Fabric Git integration.

> [!TIP]
> See [Adopt a Git branching strategy](/azure/devops/repos/git/git-branching-guidance?view=azure-devops&preserve-view=true) for specific guidance and recommendations about how to best use a branching strategy to effectively facilitate collaboration.

#### Batch changes in commits

While developing content, creators should regularly stage changes into batches (or groups). These changes should address a specific work item for the solution (such as a feature or issue). When ready, content creators commit these staged changes.

Batching changes this way has several benefits.

- It helps structure development and gives content creators a chance to review and document the changes that they've grouped.
- It improves the alignment between planning and development, making it easier to link features and issues and get transparency about how the work is proceeding.
- Technical owners can more easily review pull requests from content creators if changes are batched appropriately and have clear commit messages.

When you stage and commit changes to Power BI content, consider the following factors.

- Whether you'll stage and commit changes from a local repository or from the Fabric workspace.
- Place .pbip files in top-level folders when you store multiple models or reports in a single repository. This will make it easier to identify and group changes that you make.
- Ignore innocuous or unhelpful metadata changes by using a [gitignore file](/azure/devops/repos/git/ignore-files?view=azure-devops&tabs=visual-studio-2022&preserve-view=true#use-a-gitignore-file) or a [.gitattributes file](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes). This will ensure that all changes you commit are meaningful.

> [!TIP]
> See [Save your work with commits](/azure/devops/repos/git/commits?view=azure-devops&tabs=visual-studio-2022&preserve-view=true) for specific guidance and recommendations about how to stage and commit your work to a Git repository.

#### Create pull requests to merge changes

To merge the changes, a content creator opens a _pull request_. A pull request is a submission for peer review that can lead to the merge of the work done into a single solution. Merging can result in conflicts, which must be resolved before the branch can be merged. Pull request reviews are important to ensure creators adhere to organizational standards and practices for development, quality, and compliance.

When you use pull requests to merge changes to Power BI content, consider the following factors.

- What standards and practices you'll use to perform your review, if any. For instance, you can use rules from the [Best Practice Analyzer](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance/) for semantic models.
- How you'll review changes to report metadata, which isn't easy to read and understand without using third-party tools.
- How you'll [address and resolve merge conflicts](/fabric/cicd/git-integration/conflict-resolution).

> [!TIP]
> See [About pull requests](/azure/devops/repos/git/about-pull-requests?view=azure-devops&preserve-view=true) and [Merge strategies and squash merge](/azure/devops/repos/git/merging-with-squash?view=azure-devops&preserve-view=true) for specific guidance and recommendations about how to best use pull requests to facilitate collaboration by merging changes to content.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning where you'll store files, key decisions and actions include:

> [!div class="checklist"]
> - **Choose your development tools:** Ensure your approach to develop content aligns with how you'll collaborate with other content creators and use version control.
> - **Choose between .pbip and .pbix formats for models and reports:** Typically, the .pbip format is more beneficial for source control, but self-service users can find .pbix files easier to use.
> - **Separate semantic model and report development:** Version control is most effective when you manage changes for different item types, separately. [Separating model and report development](report-separate-from-model.md) is considered a good practice.
> - **Decide how many workspaces that you need:** Using separate environments is critical for the success of content lifecycle management. Ensure that you've clarified how many workspaces you need and conduct appropriate [workspace-level planning](powerbi-implementation-planning-workspaces-workspace-level-planning.md).
> - **Decide how you'll implement version control:** Decide between a simpler approach by using SharePoint or OneDrive for Business, or by using Azure DevOps to facilitate source control.
> - **Set up your remote repository:** Create a structured space in the OneDrive folder or Git Repo where you'll store content to track and manage changes.
> - **If you're using source control, set up .gitignore and .gitattributes files:** Ensure that you set up your repository so that you're only tracking meaningful changes.
> - **If you're using source control, define branching and merge strategies:** Ensure that you define clear processes for how you'll set up and use source control to best support development. Avoid overcomplicating your process. Instead, try to complement the current way of working in your development teams.

## Related content

In the [next article in this series](powerbi-implementation-planning-content-lifecycle-management-validate.md), learn how to validate content as part of managing the content lifecycle.
