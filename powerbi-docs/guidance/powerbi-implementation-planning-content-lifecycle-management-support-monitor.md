---
title: "Power BI implementation planning: Support and monitor content"
description: "This article helps you to support and monitor content as part of managing the content lifecycle."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 04/24/2024
---

# Power BI implementation planning: Support and monitor content

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to support and monitor content as part of managing the content lifecycle. It's primarily targeted at:

- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization. Fabric administrators might need to collaborate with other administrators, like those who oversee Microsoft 365 or Azure DevOps.
- **Center of Excellence (COE) and BI teams:** The teams that are responsible for overseeing Power BI in the organization. These teams include decision makers who decide how to manage the lifecycle of Power BI content. These teams can also include release managers, who handle the lifecycle of content releases, and engineers who create and manage the components needed to effectively use and support lifecycle management.
- **Content creators and content owners:** Users who create content that they want to publish to the Fabric portal to share with others. These individuals are responsible for managing the lifecycle of the Power BI content that they create.

Lifecycle management consists of the processes and practices that you use to handle content from its creation to its eventual retirement. In the [fourth stage of lifecycle management](powerbi-implementation-planning-content-lifecycle-management-deploy.md), you deploy content, which involves both initially publishing content to a development workspace and promoting content to a test and production workspace. At the end of the fourth stage, content consumers already use your content. In the fifth stage, you support this content and monitor usage to facilitate adoption and resolve issues.

Supporting and monitoring content is vital to ensure effective adoption of your solutions. Support refers to how you'll enable content viewers and consumers to effectively make use of the content you deploy. Monitoring refers to both auditing and monitoring activities that you perform to track and measure your solution, as well as how it's used by content viewers and consumers.

The following image depicts the lifecycle of Power BI content, highlighting stage five, where you support and monitor content.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-support-monitor/content-lifecycle-management-stage-5.svg" alt-text="Diagram shows the Power BI content lifecycle. Stage 5, which is about content support and monitoring, is highlighted." border="false":::

> [!NOTE]
> For an overview of content lifecycle management, see the [first article in this series](powerbi-implementation-planning-content-lifecycle-management-overview.md).
>
> This article focuses on key considerations and decisions to support and monitor content throughout its lifecycle. For more guidance about how to support and monitor content, see:
>
> - **[Fabric adoption roadmap: User support](fabric-adoption-roadmap-user-support.md):** This article describes general considerations and guidance for supporting users of Fabric and Power BI.
> - **[Power BI implementation planning: Auditing and monitoring](powerbi-implementation-planning-auditing-monitoring-overview.md):** This series describes in detail the options available for you to audit and monitor your content.
> - **[BI solution planning: Deploy, support, and monitor](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#step-5-deploy-support-and-monitor):** This article describes some considerations to support content when you first create your Fabric or Power BI solution.
> - **[Migrate to Power BI: Support the solution](powerbi-migration-create-validate-content.md#validate-the-solution):** This article describes some considerations for how to best support a Power BI solution during a migration from other technologies.

At this point, content has been deployed and is being used by consumers. Your next action is to sufficiently support the content throughout its lifecycle.

How you handle support depends significantly on who [owns and manages](fabric-adoption-roadmap-content-ownership-and-management.md) the content. Enterprise BI content is likely to have the most robust support model. However, business-led and self-service content created by decentralized teams should also be supported, although the people and processes involved might differ. Make sure it's clear to all authors what their obligations are for supporting the content that they publish.

> [!TIP]
> If you expect your data and BI environment to thrive, don't underestimate how important it is to support production (non-development, non-test) content.

The following sections outline some key considerations and decisions for how you'll support and monitor content.

## Decide on your support model

There are many valid ways to define a support model. Options range from informal intra-team and internal community support to the more formally organized help desk and extended support. However, it's common to use more than one method to support users. For more considerations about planning for the different types of user support, see [User support](fabric-adoption-roadmap-user-support.md).

> [!TIP]
> The level of support that's required might also depend on the [governance](fabric-adoption-roadmap-governance.md) level that you've selected. Make sure to involve your [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md) in decisions about support.

There are two main types of users to consider when planning your support model.

- **Consumer support:** The focus is on supporting delivery of accurate and timely content to _consumers_, or _view-only users_, who consume content that's produced by others in the organization.
- **Content creator support:** The focus is on supporting the needs of self-service BI _creators_ who design, publish, secure, and manage content that other users consume. These self-service BI creators consume the solution that you've delivered to create other content.

> [!NOTE]
> There are different topics important to plan your support model.
>
> - **[User tools and devices](powerbi-implementation-planning-user-tools-devices.md):** Plan how content creators and consumers can get help to install and use tools to make and view content.
> - **[Mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md):** Plan how you can improve the competencies of the user community so they can create and use content effectively.
> - **[User support](fabric-adoption-roadmap-user-support.md):** Plan how you can resolve issues for users with both internal and external support channels.

The remainder of this section introduces considerations for both content consumers and creators.

### Content consumer support

Consider the following points when supporting consumers who only need to view content.

- **How to get help:** How will the consumer know who to contact for help? A few common situations include:
  - Having a [strategy for read-only consumers](powerbi-implementation-planning-security-report-consumer-planning.md#strategy-for-read-only-consumers).
  - Creating a [request access workflow for consumers](powerbi-implementation-planning-security-report-consumer-planning.md#request-access-workflow-for-consumers).
  - Addressing critical issues that block productivity, such as a [data refresh](../connect-data/refresh-data.md), [DirectQuery](../connect-data/desktop-directquery-about.md) report connectivity failure, or when [data-level security](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity) isn't set up properly for a user.
  - Addressing noncritical issues that aren't time-sensitive, like report issues with a [bookmark](../create-reports/desktop-bookmarks.md) or a [button](../create-reports/desktop-buttons.md).
  - Resolving data discrepancies.
- **How to use the solution:** What sort of assistance is available to help consumers use and fully understand the solution? An overview page within the report or a short video tutorial can be helpful for users (for example, it could show how to [drillthrough](../create-reports/desktop-drillthrough.md) to another report). Providing that type of help can lead to increased adoption of the solution, greater return on investment, and fewer support cases.
- **How to accept feedback:** When the consumer has a new request or enhancement, how should they submit their request? A feedback loop (such as a form) allows you to accept ideas for improving the solution. Feedback loops are often considered alongside support planning because it's a closely related concept.

> [!NOTE]
> Expect that once a solution is deployed to production, you'll receive different types and volumes of feedback compared to that which you received during validation. Anticipate that there will be higher volumes of requests and feedback during this _hypercare_ period (the period immediately after a major change). Plan accordingly for this higher volume, and try to see it as an opportunity to build trust with the user community.

### Content creator support

Consider the following points when supporting both [data creators](powerbi-implementation-planning-security-content-creator-planning.md#data-creators) and [report creators](powerbi-implementation-planning-security-content-creator-planning.md#report-creators) who need to create, publish, and maintain content.

- **How to publish new content:** How will the author know who to contact for help when they need to publish new content? The extent of help that they'll need depends on the [tenant settings](/fabric/admin/tenant-settings-index), and the author's [workspace role](/fabric/get-started/roles-workspaces). A few common requests that often arise include:
  - Managing [who can create new workspaces](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-creation-permissions) and the [workspace creation process](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-creation-process).
  - [Creating a deployment pipeline](/fabric/cicd/deployment-pipelines/get-started-with-deployment-pipelines) or getting access to [Azure](/fabric/cicd/git-integration/git-integration-process#permissions) DevOps (see also [Stage 4: Deploy content](powerbi-implementation-planning-content-lifecycle-management-deploy.md)).
- **How to update security:** What's the process for an author to request security updates? The permissions for content might need regular attention, depending on how frequently users change. Several common actions include adding and removing users, security groups, and service principals from:
  - [Workspace roles](powerbi-implementation-planning-security-content-creator-planning.md#workspace-roles)
  - [Power BI app permissions](powerbi-implementation-planning-security-report-consumer-planning.md#power-bi-app-permissions) and [Per-item permissions](powerbi-implementation-planning-security-report-consumer-planning.md#per-item-permissions)
  - [OneLake security](/fabric/onelake/onelake-security)
  - [Files in OneDrive and SharePoint](../create-reports/desktop-sharepoint-save-share.md) and [Power BI files that consumers view from OneDrive and SharePoint](../collaborate-share/service-sharepoint-viewer.md)
- **How to get access to new functionality:** What should an author do when they need to use functionality that they don't currently have access to? A few common situations include:
  - [Workspace license mode](/fabric/enterprise/licenses#workspace)
  - [Capacity](/fabric/enterprise/licenses#capacity-license) management and (SKU) size.
- **How to update data connectivity:** If an author needs access to a gateway or a connection, what's the procedure they should follow to request updates (if they don't have [permissions](/data-integration/gateway/manage-security-roles))? Common situations include:
  - [Adding a new data source connection](../connect-data/service-gateway-data-sources.md)
  - [Adding a new user for a data source connection](/data-integration/gateway/manage-security-roles#connection-roles)

> [!TIP]
> Be prepared to address the most urgent support issues quickly to allow users to continue being productive. When they're blocked, a user might find a workaround (which might not be ideal) to keep moving, especially when there's a slow response from their support channel.

Once you define your support model for both content consumers and creators, you next should plan how you'll support content. Typically, this involves auditing and monitoring content regularly.

## Decide how to audit and monitor content

Auditing and monitoring of content throughout its lifecycle is important. Creating processes to audit content can help you in various ways.

- **Assess solution adoption:** You should regularly analyze two aspects of [adoption](powerbi-implementation-planning-auditing-monitoring-overview.md#analyze-adoption-efforts):
  - **Usage of the solution:** Analyzing _content usage levels_ involves understanding what content is used, when, by whom, and how. For more information about the types of questions you might ask, see [Content usage](powerbi-implementation-planning-auditing-monitoring-overview.md#content-usage).
  - **Effective use of the solution:** Analyzing the _effective use of content_ is more difficult to define and measure (vs. usage). You can further examine the [user activity data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#user-activity-data) to determine whether actual user behavior matches your expectations. For example, if you expect a high number of report views per day but what you see is one export per user per day, you should investigate further.
- **Understand published items:** You can document the metadata for published items as of a point in time. For example, you can create a _tenant inventory_ as of January 1 that might indicate that 12 semantic models and 94 reports existed then. For more information about the benefits of a tenant inventory, see [Understand published items](powerbi-implementation-planning-auditing-monitoring-overview.md#understand-published-items).
- **Reduce risk:** Because you understand more about what's happening with your content, you can act quickly to reduce risks. For example, you might identify security or data protection concerns with the content. For other considerations, see [Mitigate risk](powerbi-implementation-planning-auditing-monitoring-overview.md#mitigate-risk).
- **Find performance and health concerns:** When auditing content, you'll find data that can be used as an input to performance tuning activities. It's also possible that you can resolve an issue before it's noticed by consumers of the content. For more information, see [Performance monitoring](powerbi-implementation-planning-auditing-monitoring-overview.md#performance-monitoring).

> [!TIP]
> There are many planning considerations and decision-making criteria related to auditing and monitoring that are covered in other articles. The scope for your auditing and monitoring activities could differ depending on your focus and your job role. For more information, see:
>
> - [Report-level auditing](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md) for auditing and monitoring reporting items, like paginated reports.
> - [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md) for auditing and monitoring data items, like semantic models.
> - [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md) for auditing content across your entire tenant.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to support and monitor content, key decisions and actions include:

> [!div class="checklist"]
> - **Assess how user support is handled:** Investigate how support is currently handled to become familiar with the current state.
> - **Decide how to handle support:** Determine how you'll support the content throughout its lifecycle. Decide how to support both consumers and authors.
> - **Clarify support roles and responsibilities:** Confirm who's expected to do what, and when, for supporting content after it's published. Clarify specific expectations for content owners (including self-service authors). Also clarify expectations for the Center of Excellence (COE), IT team, BI team, and help desk staff.
> - **Create a support model for consumers:** Create specific processes and supporting documentation targeted at supporting content consumers.
> - **Create a support model for content creators:** Create specific processes and supporting documentation targeted at supporting authors.
> - **Set up a support tracking system:** Create a system to accept and track the status of requests from users.
> - **Train the support staff:** Conduct knowledge transfer sessions or training sessions to prepare the help desk staff.
> - **Communicate the support model to users:** Make sure your consumers and authors know what resources are available to them, and what processes to follow. In the Fabric tenant settings, customize the help menu links to direct users to your internal resources.
> - **Determine specific data needs for auditing and monitoring:** Consider what report-level, data-level, and tenant-level auditing and monitoring activities should be conducted.
> - **Prioritize auditing efforts:** Identify several key questions to be answered. Determine the focus and priorities for your initial auditing and monitoring efforts.
> - **Clarify auditing roles and responsibilities:** Confirm who's expected to do what, and when, for auditing content. Clarify specific expectations for content owners (including self-service authors), as well as the COE and IT.
> - **Make initial auditing architecture decisions:** Consult with your IT team(s) as appropriate to determine whether existing processes exist to extract and store auditing data. When possible, access existing data rather than creating a new process. When a new process is required, consider architecture decisions for extracting, storing, and securing the data.
> - **Create initial auditing analytical reports:** Identify the requirements and audience for each auditing report. Create reports that are clear about purpose, what action should be taken, and by whom. Obtain feedback and iterate as appropriate.
> - **Create documentation and training for content authors:** Provide guidance for both administrators and content creators relevant to the support and auditing capabilities that are applicable to their job role. Include recommendations and information about how to meet internal auditing requirements for support and auditing.

## Related content

In the [next article in this series](powerbi-implementation-planning-content-lifecycle-management-retire-archive.md), learn how to retire and archive content at the end of its lifecycle.
