---
title: "Power BI usage scenarios: Self-service content publishing"
description: "Learn how Power BI self-service content publishing is about publishing content to development, test, and production with deployment pipelines."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 04/20/2022
---

# Power BI usage scenarios: Self-service content publishing

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

When analytical solutions are critical to the organization, it's important to ensure content in the Power BI service is stable and reliable for consumers. IT teams often solve this problem by working in multiple environments:

- In the **development** environment, content creators and owners make changes and improvements to the solution. When these changes are ready for broader review, the solution is deployed (sometimes known as *promoted*) to the test environment.
- In the **test** environment, reviewers validate the changes made to the solution. This review can involve validating the solution functionality and data. When the review is complete, the solution is deployed to the production environment.
- The **production** environment is where consumers view and interact with the released solution.

This structured approach ensures that content creators, owners, and reviewers can make and validate changes without negatively affecting consumers.

Using methodical and disciplined lifecycle management processes reduces errors, minimizes inconsistencies, and improves the user experience for consumers. Content creators and owners can use Power BI [deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) for *self-service content publishing*. Deployment pipelines simplify the process and improve the level of control when releasing new content.

> [!NOTE]
> This self-service content publishing scenario is one of the [content management and deployment](powerbi-implementation-planning-usage-scenario-overview.md#content-management-and-deployment-scenarios) scenarios. For a complete list of the self-service scenarios, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
>
> For brevity, some aspects described in the [content collaboration and delivery scenarios](powerbi-implementation-planning-usage-scenario-overview.md#content-collaboration-and-delivery-scenarios) topic aren't covered in this article. For complete coverage, read those articles first.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components to support self-service content publishing. The focus is on use of a Power BI deployment pipeline for promoting content through development, test, and production workspaces.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-self-service-content-publishing/usage-scenario-self-service-content-publishing-inline.svg" alt-text="Diagram shows self-service content publishing, which is about publishing content to development, test, and production by using deployment pipelines. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-self-service-content-publishing/usage-scenario-self-service-content-publishing-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#self-service-content-publishing) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The Power BI content creator develops a BI solution using Power BI Desktop. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The Power BI Desktop file (.pbix) of Power BI project file (.pbip) is saved to a shared library in OneDrive. The content creator retains versions of these files in OneDrive. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | When ready, the content creator publishes the Power BI Desktop file to the Power BI service. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Content is published to a [workspace](../collaborate-share/service-new-workspaces.md) that's dedicated to **development**. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | A deployment pipeline administrator sets up the Power BI deployment pipeline with three stages: development, test, and production. Each stage aligns to a separate workspace in the Power BI service. Deployment settings and access are set up for the deployment pipeline. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The development (or test) workspace is set to **Fabric capacity**, **Premium capacity**, **Premium Per User**, or **Embedded** [license mode](../collaborate-share/service-create-the-new-workspaces.md#premium-capacity-settings). Power BI deployment pipelines are a feature available only in workspaces with these license modes. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Content creators and owners collaborate in the development workspace to ensure all requirements are met. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | When the development content is ready, the deployment pipeline compares the content between the development and test stages. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Some, or all, Power BI items are deployed to a workspace that's dedicated to testing. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Once the deployment pipeline has completed its deployment, the content creator manually performs post-deployment activities for the test workspace. Activities can include configuring scheduled data refresh or publishing a Power BI app for the test workspace. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Quality assurance, data validations, and user acceptance testing occur by reviewers of the test workspace. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | When the test content is fully validated, the deployment pipeline compares the content between the test and production stages. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Some, or all, Power BI items are deployed to a workspace that's dedicated to production. For a production workspace, **Fabric capacity** or **Premium capacity** license mode is often more appropriate when there's a large number of read-only consumers. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | After the deployment pipeline completes deployment, content creators can manually perform post-deployment activities. Activities can include configuring scheduled data refresh or publishing a Power BI app for the production workspace. |
| ![Item 15.](../media/legend-number/legend-number-15-fabric.svg) | Content viewers access the content using the production workspace or a Power BI app. |
| ![Item 16.](../media/legend-number/legend-number-16-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 17.](../media/legend-number/legend-number-17-fabric.svg) | Fabric administrators oversee and monitor activity in the Fabric portal. Content that's deemed critical enough to have separate development, test, and production workspaces could be subject to stricter governance requirements than less critical content. |

> [!TIP]
> We recommend that you reviewing the [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) usage scenario as too. It builds upon concepts introduced in this scenario.

## Key points

The following are some key points to emphasize about the self-service content publishing scenario.

### Deployment pipeline

A deployment pipeline consists of three stages: development, test, and production. A single workspace is assigned to each stage in the deployment pipeline. Power BI items that are [supported by deployment pipelines](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#deployed-items) are published (or cloned) from one workspace to another when a deployment occurs. Once testing and validations are complete, the deployment pipeline can be reused many times to promote content quickly. The deployment pipeline interface is easy to implement for content creators who don't have the skills or desire to use code-based deployments (use of the Power BI REST APIs are described in the [enterprise content publishing](powerbi-implementation-planning-usage-scenario-overview.md#content-management-and-deployment-scenarios) scenario).

> [!NOTE]
> Publishing content using a deployment pipeline is known as a *metadata-only deployment*. In this case, data isn't overwritten or copied to the target workspace. A data refresh is usually required once the deployment completes—see the [post-deployment activities](#post-deployment-activities) topic below.

### Deployment process

It's a best practice to consider the entire workspace content as an *analytical package* that can be deployed together as a unit. Therefore, it's important to have clarity on the purpose and expectations of each workspace. Although a selective deployment of specific Power BI items is possible, it's more efficient and less risky when a deployment represents a logical unit of content.

> [!TIP]
> Plan for how urgent issues will be handled, in addition to planned deployments. If an immediate fix is required, still follow the [standard practice](/fabric/cicd/best-practices-cicd#quick-fixes-to-content) of propagating all changes from development through to test and production using the deployment pipeline.

### Permissions model

Spend time planning the [permissions model](/fabric/cicd/best-practices-cicd#plan-your-permission-model). Full flexibility for applying different [workspace roles](../collaborate-share/service-roles-new-workspaces.md#workspace-roles) (between development, test, and production) is supported. As depicted in the scenario diagram, it's common to assign the following workspace permissions:

- **Development workspace:** Limit access to a team of content creators and owners who collaborate together.
- **Test workspace:** Limit access to reviewers involved with quality assurance, data validations, and user acceptance testing activities.
- **Production workspace:** Grant viewer access to content consumers of the Power BI app (and the workspace, when appropriate). Limit access to those who need to manage and publish production content, involving the fewest number of users possible.

> [!NOTE]
> Most content consumers are unaware of the development and test workspaces.

### Access for deployment pipeline

Pipeline user permissions (for who can deploy content with a deployment pipeline) are managed separately from the workspace roles. [Access to both the workspace and the deployment pipeline](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#permissions) are required for the users conducting a deployment. Relevant [Premium permissions](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#create-a-workspace) are also required.

When possible, it's recommended that the existing content creator or owner conduct the deployments. In some situations, permissions are more restricted for the production workspace. In that case, it might be appropriate to coordinate the production deployment with someone else who has permission to deploy to production.

[Pipeline users](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#permissions) who are assigned to the workspace member (or admin) role are allowed to compare stages and deploy content. Assigning pipeline users to this role minimizes permissions issues and allows for a smoother deployment process.

> [!TIP]
> Keep in mind that workspace roles are set separately for development, test, and production. However, pipeline access is set once for the entire pipeline.

### Power BI Premium licensing

Power BI deployment pipelines are a Premium feature. There are various [ways to obtain licensing](/fabric/cicd/faq#what-type-of-capacity-do-i-need), depending on whether the content is used for development, test, or production purposes. The scenario diagram depicts use of a Premium [P SKUs](../enterprise/service-premium-what-is.md#capacities-and-skus) such as P1, P2, P3, P4, or P5 for the production workspace, and a Power BI Premium Per User (PPU) [user-based Premium license](../enterprise/service-premium-per-user-faq.yml) for the development and test workspaces. Using PPU licensing for workspaces with very few users (as depicted in the scenario diagram) is a cost-effective way to use Premium features, while keeping them separate from the Premium capacity that's assigned for production workloads.

### Deployment settings

[Data source rules and parameter rules](/fabric/cicd/deployment-pipelines/create-rules) are available for dynamically managing values that differ between development, test, and production. Use of deployment settings are an effective way to reduce effort and the risk of errors.

### Post-deployment activities

Purposefully, [certain properties aren't copied](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#item-properties-that-are-not-copied) to the target workspace during a deployment. Several key post-deployment activities include:

- **Data refresh:** Data isn't copied from the source workspace to the target workspace. Publishing from a deployment pipeline is always a metadata-only deployment. Therefore, a data refresh is usually required after deploying to a target workspace. For first-time deployments, the data source credentials or gateway connectivity (as appropriate) must be configured as well.
- **Apps:** Power BI apps aren't published automatically by deployment pipelines.
- **Access roles, sharing permissions, and app permissions:** Permissions aren't overwritten during a deployment.
- **Workspace properties:** Properties, such as contacts and the workspace description, aren't overwritten during a deployment.
- **Power BI item properties:** Certain Power BI item properties, such as sensitivity labels, might be overwritten during a deployment in [certain circumstances](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#item-properties-copied-during-deployment).
- **Unsupported Power BI items:** Additional manual steps might need to be taken for [Power BI items that aren't supported](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#deployed-items) by the deployment pipeline.

> [!CAUTION]
> There isn't a rollback process once a deployment has occurred with a deployment pipeline. Consider carefully what change management processes and approvals are required in order to deploy to the production workspace.

### OneDrive storage

The scenario diagram depicts using OneDrive for storing the source Power BI Desktop files. The goal is to store the source files in a location that is:

- Appropriately secured to ensure only publishers can access the source files. A [shared library](https://support.microsoft.com/office/create-a-new-shared-library-from-onedrive-for-work-or-school-345c8599-05d8-4bf8-9355-2b5cfabe04d0) (rather than a personal library) is a good choice.
- Backed up frequently so the files are safe from loss.
- Versioned when changes occur, to allow for a rollback to an earlier version.

> [!TIP]
> If a OneDrive location is [synchronized to a workspace](../collaborate-share/service-create-the-new-workspaces.md#set-a-workspace-onedrive), configure it only for the development workspace.

### Gateway setup

Typically, a data gateway is required when accessing data sources that reside within the private organizational network or a virtual network. The [On-premises data gateway](../connect-data/service-gateway-onprem.md) becomes relevant once a Power BI Desktop file is published to the Power BI service. The two purposes of a gateway are to [refresh imported data](../connect-data/refresh-data.md), or view a report that queries a live connection or [DirectQuery](../connect-data/desktop-directquery-about.md) semantic model—[previously known as a dataset](../connect-data/service-datasets-rename.md) (not depicted in the scenario diagram).

When working with multiple environments, it's common to configure development, test, and production connections to use different source systems. In this case, use [data source rules and parameter rules](/fabric/cicd/deployment-pipelines/create-rules) to manage values that differ between environments.

> [!NOTE]
> A centralized [data gateway](../connect-data/service-gateway-personal-mode.md#on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode) in *standard mode* is strongly recommended over gateways in *[personal mode](../connect-data/service-gateway-personal-mode.md)*. In standard mode, the data gateway supports live connection and DirectQuery operations (in addition to scheduled data refresh operations).

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand deployment activities that occur.

## Related content

In the next article in the series, learn about the [advanced data modeling](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) usage scenario.
