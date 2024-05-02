---
title: "Power BI implementation planning: Plan and design content"
description: "This article helps you to plan and design content as part of managing the content lifecycle."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 04/24/2024
---

# Power BI implementation planning: Plan and design content

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to plan and design content as part of managing the content lifecycle. It's primarily targeted at:

- **Center of Excellence (COE) and BI teams:** The teams that are responsible for overseeing Power BI in the organization. These teams include decision makers who decide how to manage the lifecycle of Power BI content.
- **Content creators and content owners:** Users who create content that they want to publish to the Fabric portal to share with others. These individuals are responsible for managing the lifecycle of the Power BI content that they create.

Lifecycle management consists of the processes and practices that you use to handle content from its creation to its eventual retirement. As described in the [first article in this series](powerbi-implementation-planning-content-lifecycle-management-overview.md), managing the Power BI content lifecycle is important to ensure reliable and consistent delivery of content to business users.

The first stage of the content lifecycle is to plan and design content. You typically start the content lifecycle by performing [BI solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md). You [gather requirements](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#step-1-gather-requirements) to understand and define the problem that your solution should address, and arrive at a solution design. During this planning and design stage, you make key decisions to prepare for the later stages.

The following image depicts the lifecycle of Power BI content, highlighting stage one, where you plan and design content.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-plan-design/content-lifecycle-management-stage-1.svg" alt-text="Diagram shows the Power BI content lifecycle. Stage 1, which is about content planning and design, is highlighted." border="false":::

> [!NOTE]
> For an overview of content lifecycle management, see the [first article in this series](powerbi-implementation-planning-content-lifecycle-management-overview.md).

> [!TIP]
> This article focuses on key considerations and decisions for content planning and design as they pertain to lifecycle management.
>
> - For more information about _how to effectively plan and design a Fabric or Power BI solution_, we recommend that you read the [solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md) article.
> - For more information about how to _effectively plan a Power BI migration_, we recommend that you read the [Power BI migration](powerbi-migration-overview.md) series.

When gathering requirements, you should clearly describe aspects about the content that affect your approach to lifecycle management. You should document these aspects as part of your solution planning and design.

The following sections in this article describe the key aspects and considerations of a solution that will motivate your approach to lifecycle management as you plan and design your content.

## Identify and describe the content

When you design your solution, you should describe what the content is, who will create it, who will support it, and how critical this content is for the organization. You should address these factors during, or after you finish, [gathering requirements](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#step-1-gather-requirements) as part of your solution design.

> [!NOTE]
> Like your requirements, the answers to these questions may change as you develop the solution, or later in its lifecycle. After you answer these questions, be prepared to periodically re-evaluate them when you make changes to content, or as it scales in the number of users that it serves.

Answer the following questions about your content to help you make later lifecycle management decisions.

### What is the format of the content?

The type, scope, and complexity of content motivates key decisions about how you'll manage it. For instance, a single report for a limited audience requires a different lifecycle management approach compared to a semantic model that will be used by the entire organization and by multiple different downstream workloads.

Answer questions like the following to help you determine the type of content you'll create.

- Which item types do you expect to create, and how many of each? For instance, will you create data items like dataflows or semantic models, reporting items like reports or dashboards, or a combination of both?
- How is the content delivered to content consumers? For instance, will consumers use data items to build their own content, will they only view centralized reports, or a combination of both?
- How complex is the content? For instance, is it a small prototype, or a large semantic model that encompasses multiple business processes?
- Do you expect the scale, scope, and complexity of the content to grow over time? For instance, will the content encompass other regions or business areas in the future?
- How long do you expect the business to need this content? For instance, will this content support a key initiative of the business that has a finite timeline?

> [!TIP]
> Consider making an architectural diagram to describe the format of the content. You can include different data sources, item types, and content consumers, and the relationships between these discrete components. An architectural diagram can help to concisely depict the content and its complexity, and it helps you to plan its lifecycle management. You can use the [Fabric icons](/fabric/get-started/icons) and [Azure icons](/azure/architecture/icons/) to create these diagrams in external software. Alternatively, you can use [Azure Diagrams](https://azurediagrams.com/), which comes with icons and drawing tools to make these diagrams.
>
> For an example of such diagrams, see the Power BI implementation planning [usage scenario diagrams](powerbi-implementation-planning-usage-scenario-overview.md).

### Who will create and support the content?

Content creators have varying needs, skills, and workflows. These factors will influence the success of different lifecycle management approaches. Larger, central teams with collaboration often require more sophisticated content lifecycle management than smaller teams of self-service creators.

Answer questions like the following to help you determine who will create or support the content.

- How many different individuals do you expect to create this content? Will multiple content creators collaborate, or is a single individual responsible for creating the content?
- Are content creators familiar with lifecycle management and related concepts, such as version control? Do content creators understand the benefits of lifecycle management?
- Will the content creators who develop the solution be the same individuals who support it after deployment?
- Do content creators or their teams have existing lifecycle management practices in place to support existing solutions?
- Do content creators currently use lifecycle management tools like Azure DevOps?

> [!IMPORTANT]
> Ensure that you clearly document who is responsible for creating content, and who will support it once it's deployed to production. Involve all of these individuals in your content lifecycle management planning.

### What is the importance of the content?

Depending upon how important the content is for the business, you'll make different decisions about how to manage it. Business-critical content requires more robust content lifecycle management approaches to safeguard quality and mitigate possible disruptions.

Answer questions like the following to help you determine whether the content is critical.

- How critical is this content to the business? How urgent is the request to develop it?
- Will business-critical decisions or actions be made from information provided by this content?
- How broadly do you expect to distribute this content (from organization-wide to a limited local team)?
- Will executives or other strategic decision makers rely upon this content for their work?
- What is the impact of this content? For instance, if the content is suddenly not available, what business impacts would occur, such as lost revenue or interrupted business processes?

When you've sufficiently identified and described the content you'll create, you should next decide how content creators should collaborate.

## Decide how content creators should collaborate

As a solution increases in scope and complexity, it might become necessary for multiple content creators and owners to work in collaboration. When creating complex solutions, we recommend that you use effective tools that help structure, manage, and support collaboration. There are many ways to collaborate when producing Power BI content, such as by using Microsoft Teams or Azure DevOps.

> [!TIP]
> Even when content creators work independently, they can still benefit from planning and structuring their work by using tools such as Microsoft Teams and Azure DevOps.

### Microsoft Teams

For smaller or simpler projects, content creators can collaborate by using [Microsoft Teams](/training/teams/).

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-plan-design/collaborate-microsoft-teams.svg" alt-text="Diagram shows approach 1, which is about collaborating by using Microsoft Teams. Items shown in the diagram are described next." border="false":::

By using Microsoft Teams, content creators structure their communication, planning, and work in teams and channels. Microsoft Teams is often a good choice for simpler collaboration scenarios. For instance, decentralized teams that produce content for a limited audience can use document libraries for storing files and version control. They can also make use of other integrated tools and services.

> [!TIP]
> We recommend that you use Microsoft Teams to facilitate effective content lifecycle management in [self-service scenarios](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) with decentralized content delivery.

To collaborate and communicate in Microsoft Teams, you use supporting services throughout the lifecycle of your Power BI content.

- **[Planner](https://techcommunity.microsoft.com/t5/planner-blog/the-new-microsoft-planner-a-unified-experience-bringing-together/ba-p/3977998):** Content owners can use Planner to create plans, which they use to track tasks and scope content work. Tasks can describe issues, bugs, or features in the solution, and the corresponding stakeholders.
- **[SharePoint](/sharepoint/teams-connected-sites):** Content creators can store and manage files in a Microsoft Teams document library or connected site for each channel. Content files stored in SharePoint can use version control to help track and manage content changes. For more information about tracking and managing changes by using SharePoint, see [Stage 2: Develop content and manage changes](powerbi-implementation-planning-content-lifecycle-management-develop-manage.md#version-control-by-using-sharepoint-or-onedrive-for-work-and-school).
- **[Approvals](/microsoftteams/approval-admin#overview-of-approvals):** Content creators and owners can set up and use workflows to approve content changes or releases after review.
- **[Fabric and Power BI](../collaborate-share/service-collaborate-microsoft-teams.md):** Content creators and owners can access the Fabric portal from within Microsoft Teams. From there, they can manage or discuss content, and add helpful reports to tabs in Teams channels.
- **Other integrations:** Content creators can make use of other Microsoft or third-party services that integrate with Microsoft Teams to best fit their preferred workflow and needs.

We recommend that you define a structured process for how content creators should use Microsoft Teams to collaborate. Ensure that you determine:

- How to manage access to teams and channels.
- Who's responsible for managing teams and channels.
- How work is scoped and organized into distinct teams, channels, and plans.
- How content creators should use a document library to organize files and track and manage changes. For instance, how to organize the document library and whether content creators should check in and check out files.
- Whether content creators should use [OneDrive Refresh](../connect-data/refresh-desktop-file-onedrive.md) to automatically publish Power BI Desktop (.pbix) files.
- How file sync conflicts are resolved.
- When to archive and remove files from a document library that are no longer relevant.

### Azure DevOps

Content creators and owners can also communicate and collaborate in a central, organized hub by using [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops?view=azure-devops&preserve-view=true).

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-plan-design/collaborate-azure-devops.svg" alt-text="Diagram shows approach 2, which is about collaborating by using Azure DevOps. Items shown in the diagram are described next." border="false":::

> [!NOTE]
> [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops?view=azure-devops&preserve-view=true) is a suite of services that integrate with Power BI and Fabric to help you plan and orchestrate content lifecycle management. When you use Azure DevOps this way, you typically leverage the following services:
>
> - **[Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true):** Allows you to create and use a remote Git repository, which is a remote storage location you use to track and manage content changes.
> - **[Azure Pipelines](/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops&preserve-view=true):** Allows you to create and use a set of automated tasks to handle, test, and deploy content from a remote repository to a workspace.
> - **[Azure Test Plans](/azure/devops/test/overview?view=azure-devops&preserve-view=true):** Allows you to design tests to validate the solution and automate quality control together with Azure Pipelines.
> - **[Azure Boards](/azure/devops/boards/get-started/what-is-azure-boards?view=azure-devops&preserve-view=true):** Allows you to use boards to track tasks and plans as work items, and link or refer to work items from other Azure DevOps services.
> - **[Azure Wiki](/azure/devops/project/wiki/wiki-create-repo?view=azure-devops&tabs=browser&preserve-view=true):** Allows you to share information with their team to understand and contribute to content.

By using Azure DevOps, content creators use projects to structure their communication, planning, and work. Additionally, content creators can orchestrate content lifecycle management from within Azure DevOps by performing _source control_, validation, and deployment. Source control is the process of managing more granular changes to content code and metadata.

Azure DevOps is often a good choice for more advanced collaboration scenarios, because there are supporting services and options to orchestrate content creation and deployment.

> [!TIP]
> We recommend that you use Azure DevOps to aid in effective content lifecycle management in [enterprise scenarios](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md) with centralized content delivery. Collaborating by using Azure DevOps or similar tools is preferred in larger or more complex scenarios over collaborating by using Microsoft Teams or SharePoint. That's because there are more tools and options available to facilitate more robust collaboration and automation.

We recommend that you define a structured process for how content creators should use Azure DevOps to collaborate. Ensure that you determine:

- How work is scoped and how content branches are created, named, and used.
- How authors group and commit changes and describe them with commit messages.
- Who's responsible for reviewing and approving changes by using pull requests.
- How to pull request merge conflicts are resolved and who resolves them.
- How changes made in different branches should be merged into a single branch.
- How content is tested and who performs testing before content is deployed.
- How and when changes are deployed to development, test, and production workspaces.
- How and when deployed changes or versions of the solution can be rolled back.

> [!NOTE]
> You can also use Microsoft Teams together with Azure DevOps because there are different ways to integrate these services. For instance, you can view and manage [Azure Boards](/azure/devops/boards/integrations/boards-teams?view=azure-devops&preserve-view=true) and monitor events in [Azure Pipelines](/azure/devops/pipelines/integrations/microsoft-teams?view=azure-devops&preserve-view=true) from within Microsoft Teams.
>
> What's most important is that you use tools and services that facilitate collaboration for you, and that best fit your team's needs and the way they work.

When you've decided if and how content creators should collaborate, you should next decide where you'll store your files. Many of these files will be stored where you choose to collaborate.

## Decide where to store files

When creating content, you typically produce different types of files. It's important to decide where to store these files so that you can effectively manage them.

> [!TIP]
> Store files where they can be accessed by multiple team members, and where changes can be easily tracked (known as _version control_). This approach ensures that the departure of a team member or loss of a file doesn't lead to disruption.

The types of files you'll need to store often include:

- **Content files:** Files that contain the content data or metadata. Content files with data like .pbix and Power BI Project (.pbip) files contain sensitive information. Store content files in a secure location accessible only by those who need access to them. Also, you should store content files in a location that supports version control, such as a document library in Microsoft Teams or a Git repository in Azure DevOps. Examples of content files include:
  - Power BI Desktop (.pbix) files
  - Power BI Project (.pbip) files
  - Power BI paginated report (.rdl) files
  - Model metadata (.bim or TMDL) files
  - Dataflow metadata (.json) files
- **Data source files:** Files that are consumed by data items like semantic models or dataflows. Content is directly dependent on data source files, so it's important to carefully consider where they're stored because removing them will result in data refresh failure. Additionally, these files might contain sensitive information. So, store data source files in a secure, reliable, and trustworthy environment that has limited access by other individuals. Examples of data source files might include:
  - Structured data sources, like Excel workbooks, Parquet, or CSV files.
  - Semi-structured data sources, like JSON or XML files.
  - Unstructured data sources, like images that you import into reports.
- **Supporting files:** Files that support content creation or management, but aren't required for it to function. Supporting files should be stored in a location that supports version control, and where other tools and content creators can access them. Examples of supporting files might include:
  - Best Practice Analyzer Rules (.json) files.
  - Power BI theme (.json) files.
  - Source code files for content and queries.
  - Custom visualization (.pbiviz) files.
- **Templates and documentation:** Files that aid in the creation of self-service content or describe existing content. Templates and documentation should be easily accessible by the people who need to use them. Examples of templates and documentation might include:
  - Power BI template (.pbit) files.
  - Visualization templates and example reports.
  - Solution designs and documentation.
  - Solution planning and roadmaps.
  - User requests and solution issues.

> [!CAUTION]
> Some content files like .pbix and .pbip files can contain sensitive data imported from data sources. Additionally, metadata files like TMDL or .pbit files can also contain sensitive information. Ensure that you take the necessary precautions to store these files in secure locations and that you practice effective [data loss prevention](powerbi-implementation-planning-data-loss-prevention.md).

You have different options to store files. Ensure that you select the appropriate location, depending on the type of file, its content, and how it will be used.

### SharePoint Online or OneDrive

A common solution for storing files is by using [SharePoint](/sharepoint/introduction) sites. SharePoint is widely accessible for most users and highly integrated with both Power BI and other Microsoft 365 applications, like Microsoft Teams. Additionally, it has built-in [version control](/microsoft-365/community/versioning-basics-best-practices), making it convenient for storing most file types. Version control allows you to view and manage different saved versions of a file.

When you store files in SharePoint, consider the following points.

- **Organization:** Ensure that you maintain a consistent and logical structure so it's straightforward to find specific files. Use good naming conventions, organize files in folders, and archive files that are no longer relevant for ongoing projects.
- **OneDrive refresh:** You can [link](../connect-data/refresh-desktop-file-onedrive.md) a published semantic model or report to a .pbix file that's stored in a SharePoint or OneDrive for Business (also known as OneDrive for work or school) site. With this approach, you no longer have to publish the semantic model to bring changes into effect. Instead, your changes are visible after an automatic [OneDrive refresh](../connect-data/refresh-desktop-file-onedrive.md#automatic-versus-manual-updates-of-model-information)_,_ which occurs hourly. While convenient, be aware that this approach comes with some [caveats and challenges](../connect-data/refresh-desktop-file-onedrive.md#when-things-go-wrong). When things go, it can't be easily reversed.
- **Preview reports:** In SharePoint, it's possible to [view Power BI reports](../collaborate-share/service-sharepoint-viewer.md) without having to install Power BI Desktop or download the .pbix file locally. When you open reports in this way, they're displayed in the [browser](../collaborate-share/service-sharepoint-viewer.md#open-a-power-bi-file-stored-in-a-onedrive-or-sharepoint-library). This capability can be a convenient alternative to viewing reports from the Fabric portal. It's [enabled by default](/fabric/admin/service-admin-portal-integration#users-can-view-power-bi-files-saved-in-onedrive-and-sharepoint-preview) in the [Fabric tenant settings](/fabric/admin/tenant-settings-index).

> [!TIP]
> When you collaborate by using Microsoft Teams, consider storing files in the channel document library. This approach helps centralize files and facilitates collaboration.

Consider storing the following file types in SharePoint.

- **Templates and documentation:** Store templates and documentation in SharePoint when you don't have an existing storage solution. SharePoint is ideal for these files because you can grant access to others and manage files without complex setup or processes.
- **Supporting files:** Store supporting files in SharePoint when you don't have an existing storage solution. However, some supporting files (like Power BI theme .json files for reports) might be better stored in a version control system that allows viewing and managing saved changes.
- **Content files:** Store content in SharePoint when it isn't critical to the business, or when you don't have access to a remote repository like [Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true).
- **Data sources:** Store data sources in SharePoint only when they're small in size and complexity. Exercise discipline when using SharePoint to store data source files. Consider other possible alternatives, like [OneLake](/fabric/onelake/onelake-overview).

> [!CAUTION]
> Don't use SharePoint as an alternative to a proper data architecture. While storing data source files in SharePoint can be convenient in some limited scenarios, this approach doesn't scale when you have larger, more complex data sources, or when you need lower data latency.

> [!WARNING]
> Don't use personal file systems or personal OneDrive accounts to store files. If the owner leaves the organization, these files will no longer be available.

### OneLake

If you have a [Fabric capacity](/fabric/enterprise/licenses#capacity), OneLake can be a good choice to store data source files. You can [upload](/fabric/onelake/create-lakehouse-onelake#load-data-into-a-lakehouse) or [synchronize](/fabric/onelake/onelake-file-explorer) files to OneLake by using OneLake File Explorer, where they can be [transformed to tables](/fabric/data-engineering/lakehouse-notebook-load-data) for use in downstream workloads like Power BI. For larger or regularly updated data sources, you can load files to OneLake automatically by using Fabric [Data Factory](/fabric/data-factory/data-factory-overview) or other applications that use the [Azure Data Lake Storage (ADLS) Gen2 API](/fabric/onelake/onelake-access-api) or the [Azure Storage Python SDK](/fabric/onelake/onelake-access-python).

> [!CAUTION]
> Actions like uploading or downloading files from OneLake [consume Fabric capacity units](/fabric/onelake/onelake-consumption). You should [monitor capacity metrics](/fabric/enterprise/metrics-app) and take steps to avoid capacity strain caused by unnecessary movement of large files.
>
> Additionally, files accessed by users with OneLake File Explorer are vulnerable to [accidental changes or loss](/fabric/onelake/onelake-file-explorer#delete-files-or-folders-in-onelake-file-explorer). We recommend that you avoid using OneLake File Explorer for business-critical solutions.

> [!WARNING]
> OneLake File Explorer has several important [limitations and considerations](/fabric/onelake/onelake-file-explorer#limitations-and-considerations). For instance, OneLake doesn't support version control for files, like SharePoint or OneDrive. Take into account these considerations and limitations when you decide where to store files.

> [!TIP]
> When storing data in OneLake, consider enabling [Business Continuity and Disaster Recovery (BCDR)](/fabric/onelake/onelake-disaster-recovery) to mitigate risk of data loss. With BCDR enabled, your data is duplicated and stored in two different geographic regions, according to Azure's standard region pairings.

### Remote repository

Content creators can commit and save work from their local machine to a _remote repository_—such as an [Azure Repos](/azure/devops/repos/get-started/what-is-repos?view=azure-devops&preserve-view=true) Git repository—at regular intervals during development. A remote repository contains the latest version of the solution, and it's accessible by the entire development team. Typically, a remote repository facilitates more advanced lifecycle management approaches than using Teams, SharePoint, or OneDrive. That's because by using a remote repository, content creators can benefit from more sophisticated options to collaborate on files, or track and manage file changes. For instance, content creators can work on their own branch of the remote repository to make changes, and request to merge those changes into the main branch when ready.

Consider storing the following file types in a remote repository.

- **Templates and documentation:** Store templates and documentation in a remote repository when you manage the project with related services like [Azure DevOps](/azure/devops/user-guide/what-is-azure-devops).
- **Supporting files:** Store supporting files in a remote repository when one is available to easily track and manage changes.
- **Content files:** Store content in a remote repository when it's critical to the business, or you intend to collaborate with other developers on the same content. A remote repository is ideal for tracking content changes and facilitating collaboration.

> [!TIP]
> When you use a remote repository, consider storing Power BI reports and semantic models as [Power BI Desktop projects (.pbip) files](../developer/projects/projects-overview.md) instead of .pbix files. That's because saved changes can't be identified in a .pbix file.

### No files: Content created in the Fabric portal

Content creators can author content directly in the Fabric portal. In this scenario, they don't typically work directly with content files. You should typically author content in the Fabric portal only when the item types can't be created elsewhere (like dataflows, dashboards, or scorecards). You can also author reports and semantic models in the Fabric portal when don't have access to a Windows machine, and therefore can't use Power BI Desktop. For more information, see [User tools and devices](powerbi-implementation-planning-user-tools-devices.md).

> [!CAUTION]
> You can't download as a file some content that's created in the Fabric portal. For instance, reports created in the Fabric portal can't be downloaded as .pbix files.  
>
> When authoring content in the Fabric portal, you should instead use the [Fabric APIs](/rest/api/fabric/articles/using-fabric-apis) or [Git integration](/fabric/cicd/git-integration/intro-to-git-integration) to back up [content definitions](/rest/api/fabric/articles/item-management/definitions/item-definition-overview). When you back up content definitions, you mitigate disruption if that content gets accidentally deleted or unintentionally changed. If content is accidentally deleted or changed, you can replace it by using the backup.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning and designing content, key decisions and actions include:

> [!div class="checklist"]
> - **Conduct solution planning:** Gather [business requirements](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#gather-business-requirements) and [technical requirements](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#gather-technical-requirements) to sufficiently understand the problem your content will address, and to design how this content will address the problem.
> - **Identify who will create the content:** Depending on the workflow, skills, and needs of the individual content creator, different approaches to lifecycle management might be needed.
> - **Identify whether multiple content creators need to collaborate:** Ensure that collaborating content creators are using file types that support version control, like .pbip files.
> - **Decide how content creators will collaborate:** Decide how sophisticated the collaboration will be. Additionally, decide how you'll facilitate this collaboration, such as by using Microsoft Teams or Azure DevOps.
> - **Set up collaboration tools:** Ensure that you perform the necessary first-time setup for the solution or project. Make key decisions about how you'll manage collaboration by using these tools.
> - **Store data source files in SharePoint or OneLake:** Store small, simple data source files in SharePoint. Otherwise, use OneLake or ADLSGen2 (if they're available) instead.
> - **Store content and supporting files in SharePoint or a remote repository:** For simpler, smaller projects, use SharePoint for most files if it's organized and you practice good access management. For larger environments or when parallel collaboration is required, consider using a remote repository, which will provide detailed visibility of content changes.
> - **Store templates and documentation in SharePoint:** Ensure that templates and documentation are easy for others to find, use, and understand.
> - **Plan for development and deployment:** To conclude this first stage, perform specific planning to [address key areas](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#plan-to-address-key-areas) and [conduct initial setup](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#conduct-initial-setup). For instance, establish tools and test data source connections.

## Related content

In the [next article in this series](powerbi-implementation-planning-content-lifecycle-management-develop-manage.md), learn how to develop content and manage changes as part of managing the content lifecycle.
