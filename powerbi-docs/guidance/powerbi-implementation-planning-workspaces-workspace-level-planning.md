---
title: "Implementation Planning: Workspace-Level Workspaces"
description: "Review the tactical Power BI planning decisions you make at the workspace level for workspaces in Microsoft Fabric."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: Workspaces at the workspace level

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article describes tactical implementation planning that you do at the _workspace level_ for [Microsoft Fabric workspaces](/fabric/fundamentals/workspaces), with an emphasis on the Power BI experience inside Fabric.

The article primarily is for:

- **Fabric administrators**: Administrators who are responsible for overseeing the Fabric implementation in the organization.
- **Center of Excellence (CoE), IT, and business intelligence (BI) teams**: Teams that are responsible for overseeing the use of data and BI in the organization, and for supporting self-service users throughout the organization.
- **Content creators and owners**: Self-service users who create, publish, and manage content in workspaces.

To use workspaces effectively, you make many tactical decisions. Whenever possible, individual workspace-level decisions should align with your [tenant-level decisions](powerbi-implementation-planning-workspaces-tenant-level-planning.md).

> [!NOTE]
> The concept of a workspace originated in Power BI. With Fabric, the purpose of a workspace became broader. The result is that a workspace can now contain items from one or more different [Fabric experiences](/fabric/get-started/fabric-terminology) (also called _workloads_). Even though the content scope is broader than in Power BI, you can apply most of the workspace planning activities that are described in these articles to planning your Fabric workspace.

## Workspace purpose

When you plan for workspaces, it's important to consider not only the type of content it will store, but also the activities that the workspace is intended to support.

Consider the following two examples of finance-related workspaces. Although they're both dedicated to the same team, each workspace serves a different purpose:

- **Financial month-end workspace**: The _Financial month-end workspace_ contains reconciliation and month-end closing reports. This workspace is considered an informal workspace to support collaborative efforts. A Power BI app isn't necessary for content viewers because the primary use of this workspace is collaboration by a small group of people who work closely together. Most team members have permission to edit content in this workspace.
- **Financial reporting workspace**: The _Financial reporting workspace_ contains the finalized, presentation-level reports. This workspace contains content that's broadly distributed throughout the organization to many viewers (including executives) by using a Power BI app. The workspace is closely [governed](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-governance-level).

With these two examples in mind, consider two specific aspects of workspace purpose: _intent for collaboration_, and _intent for viewing_.

### Intent for collaboration

The primary objective of a workspace in the Fabric portal is to facilitate [collaboration](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md#collaborate-in-a-workspace) among multiple people.

Collaboration in a workspace can happen in multiple ways:

- **Team-based development**: Multiple people can work together to build, test, and publish content. One user might work on the design of a [lakehouse](/fabric/data-engineering/lakehouse-overview). Another user might work on the design of the semantic model, while other users might focus on building reports.
- **Testing and validations**: Users might need to perform data validations for new content. Subject matter experts from the business unit might need to perform user acceptance testing (UAT), or a data quality team might need to validate the accuracy of the semantic model.
- **Enhancements**: Stakeholders and consumers of the content might suggest enhancements to the content as circumstances change.
- **Ownership transfer**: Another person or team might [take over responsibility](fabric-adoption-roadmap-content-ownership-and-management.md#ownership-transfers) for content that someone else created.

One of the key areas of the Fabric adoption roadmap is [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md). The type of collaboration that occurs in a workspace differs based on the approach that is used for content ownership and management:

- **Business-led self-service BI**: Content that the content creators in a business unit or department own or manage. In this scenario, most collaboration in the workspace occurs among users within that business unit.
- **Managed self-service BI**: Data that a centralized team owns or manages, whereas various content creators from business units take responsibility for reports and dashboards. In this scenario, it's highly likely that multiple workspaces are needed to securely facilitate collaboration by multiple teams of people.
- **Enterprise BI**: Content that a centralized team, such as IT, enterprise BI, or the CoE owns or manages. In this scenario, collaboration efforts in the workspace occur among users in the centralized team.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider your intentions for collaboration in a workspace, key decisions and actions include:

> [!div class="checklist"]
> - **Consider expectations for collaboration**: Determine how workspace collaboration needs to occur and who's involved within a single team or across organizational boundaries.
> - **Consider expectations for content ownership and management**: Think about how the different content ownership and management approaches (business-led self-service BI, managed self-service BI, and enterprise BI) will influence how you design and use workspaces.

> [!TIP]
> When your needs aren't met by taking a single approach, be prepared to be flexible and use a different [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) strategy for different workspaces. The strategy can be based on the scenario and on the team members that are involved.

### Intent for content viewing

The secondary objective for a workspace is to distribute content to consumers who need to view the content. For content viewers, the primary Fabric workload is Power BI.

You can approach content distribution in the Power BI service in multiple ways:

- **Reports can be viewed by using a Power BI app**: Content stored in a nonpersonal workspace can be published to a [Power BI app](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md#distribute-insights-in-an-app). A Power BI app is a more user-friendly experience than viewing reports directly in a workspace. For this reason, using a Power BI app is often the best choice for distributing content to consumers. Audiences for a Power BI app are flexible. However, sometimes the goals for how you want to distribute content with an app are a factor in determining how to organize content in or across workspaces. For more information about securing Power BI apps, see [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#power-bi-app-permissions).
- **Reports can be viewed directly in the workspace**: This approach is often appropriate for informal, collaborative workspaces. [Workspace roles](/fabric/get-started/roles-workspaces#workspace-roles) define who can view or edit the content contained in a workspace. For more information about workspace roles, see [Content creator security planning](powerbi-implementation-planning-security-content-creator-planning.md).
- **Reports can be shared**: Use of [per-item permissions](../collaborate-share/service-share-dashboards.md) (links or direct access) is useful when you need to provide read-only access to a single item in a workspace. We recommend that you use app permissions and workspace roles more frequently than sharing because they're easier to maintain. For more information, see [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#per-item-permissions).
- **Reports can be embedded in another application and viewed in the application**: Sometimes the intention is for consumers to view Power BI content that's embedded in another application. Embedding content is useful when it makes sense for the user to remain in the application to increase efficiency and stay within its workflow.

Another key area of the Fabric adoption roadmap is [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md). The ways that a workspace support content distribution differs based on the content delivery scope:

- **Personal BI**: Content is intended for use by the creator. Since sharing content with others isn't an objective, personal BI is done within a personal workspace (described in the next section).
- **Team BI**: Content is shared with a relatively small number of colleagues who work closely together. In this scenario, most workspaces are informal, collaborative workspaces.
- **Departmental BI**: Content is distributed to many consumers who belong to a large department or business unit. In this scenario, the workspace is primarily for collaboration efforts. In departmental BI scenarios, content is commonly viewed in a Power BI app (instead of directly viewed in the workspace).
- **Enterprise BI**: Content is delivered broadly across organizational boundaries to the largest number of target consumers. In this scenario, the workspace is primarily for collaboration efforts. For enterprise BI scenarios, content is commonly viewed in a Power BI app (instead of directly viewed in the workspace).

> [!TIP]
> When you plan your workspaces, consider the needs of the audience when determining the workspace [license mode](/fabric/enterprise/licenses). The type of license that's assigned to the workspace affects the features that are available, including who can view or manage workspace content.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider your expectations for how workspace content is viewed, key decisions and actions include:

> [!div class="checklist"]
> - **Consider expectations for viewing content**: Determine how you expect consumers to view content that's been published to the workspace. Consider whether viewing will happen directly in the workspace directly or by using a different method.
> - **Determine who the content will be delivered to**: Consider who the target audience is. Also consider the workspace license mode, especially when you expect a significant number of content viewers.
> - **Evaluate needs for a Power BI app**: Consider what the workspace purpose is as it relates to the content distribution requirements. A requirement for a Power BI app can influence decisions about creating a workspace.
> - **Consider expectations for content delivery scope**: Consider how the different content delivery scopes (personal BI, team BI, departmental BI, and enterprise BI) will influence how you design and use workspaces.

> [!TIP]
> Be prepared to be flexible. You can use a different content viewing strategy for workspaces based on the scenario and on the team members that are involved. Also, don't be afraid to use different [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md) approaches for workspaces when it can be justified.

### Appropriate use of personal workspaces

You can choose from two types of workspaces:

- **Personal workspaces**: Every user has a personal workspace. A personal workspace can be used for publishing certain types of content to the Fabric portal. Its primary purpose is to support [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) usage scenarios.
- **Workspaces**: The primary purpose of a [workspace](../collaborate-share/service-new-workspaces.md) is to support collaboration among multiple users. Secondarily, a workspace can also be used for viewing content.

Using a personal workspace for anything other than learning [personal BI](fabric-adoption-roadmap-content-delivery-scope.md#personal), temporary content, or testing purposes can be risky because content in a personal workspace that one person manages and maintains. Further, a personal workspace doesn't support collaboration with others.

To allow the creation of any type of Fabric item, such as a lakehouse or a warehouse, a workspace must be added to a [Fabric capacity](/fabric/enterprise/licenses#capacity). The process applies to both standard workspaces and personal workspaces. You can govern who can create certain types of items in a personal workspace by managing its capacity assignment.

A personal workspace is limited in its options to share content with others. You can't publish a Power BI app from a personal workspace (and Power BI apps are an important mechanism for distributing content to the organization). Per-item permissions (links or direct access) are the only way to share personal workspace content with others. Extensive use of per-item permissions involves more effort, and it increases the risk of error. For more information, see [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider your expectations for how personal workspaces are used, key decisions and actions include:

> [!div class="checklist"]
> - **Understand current use of personal workspaces**: Have conversations with your users and review the [activity activity data](../enterprise/service-admin-auditing.md#track-user-activities-in-power-bi) to ensure you understand what users are doing with their personal workspaces.
> - **Decide how personal workspaces should be used**: Decide how personal workspaces should (and should not) be used in your organization. Focus on balancing risk and ease of use with needs for content collaboration and viewing.
> - **Relocate personal workspace content when it's appropriate**: For critical content, move content from personal workspaces to standard workspaces when it's appropriate.
> - **Create and publish documentation about personal workspaces**: Create useful documentation or FAQs for your users about how to effectively use personal workspaces. Make the information available in your centralized portal and training materials.

> [!NOTE]
> For more information, see these Fabric adoption roadmap topics: [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal), [training](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training), and [documentation](fabric-adoption-roadmap-mentoring-and-user-enablement.md#documentation).

## Workspace ownership

One of the most important things to consider when you plan workspaces is determining the [ownership and stewardship](fabric-adoption-roadmap-content-ownership-and-management.md#ownership-and-stewardship) roles and responsibilities. The goal is to have clarity on exactly who is accountable for creating, maintaining, publishing, securing, and supporting the content in each workspace.

Clarity on ownership is especially relevant when responsibilities for creating and managing data are decentralized or distributed among departments and business units. This concept is also sometimes referred to as a _data mesh_ architecture. For more information about data mesh, see [What is data mesh?](/azure/cloud-adoption-framework/scenarios/cloud-scale-analytics/architectures/what-is-data-mesh).

In Fabric, decentralized or distributed ownership is enabled through workspaces. Different areas of the organization can work independently, while still contributing to the same underlying data structure in [OneLake](/fabric/onelake/onelake-overview). Each workspace can have its own administrator, access control, and capacity assignment (for billing, geographic data location, and performance monitoring).

> [!TIP]
> Another way to support workspace ownership in Fabric is with [domains](#workspace-domain), which are described later in this article.

When the intent for collaboration involves decentralization and multiple teams beyond a single business unit, it can add complexity for managing workspaces. Often, it's helpful to [create separate workspaces](/fabric/cicd/best-practices-cicd#separate-development-between-teams) to clearly delineate which team is responsible for which content. Use of multiple workspaces allows you to be specific as to ownership and management responsibilities, and it can help you to set security according to the [principle of least privilege](/azure/active-directory/develop/secure-least-privileged-access). For more security considerations, see [Content creator security planning](powerbi-implementation-planning-security-content-creator-planning.md).

> [!TIP]
> Your decisions related to accountability and responsibility should correlate directly with your actions related to defining [workspace access](#workspace-access), which is described later in this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider workspace ownership responsibilities, key decisions and actions include:

> [!div class="checklist"]
> - **Gain a full understanding of how content ownership works**: Ensure that you deeply understand how content ownership and management is happening throughout the organization. Recognize that you likely won't have a one-size-fits-all approach to apply uniformly across the entire organization. Understand decentralized or distributed ownership needs.
> - **Define and document roles and responsibilities**: Ensure that you define and document clear roles and responsibilities for people who collaborate in workspaces. Make this information available in onboarding activities, training materials, and your centralized portal.
> - **Create a responsibility matrix**: Map out who is expected to handle each function to create, maintain, publish, secur, and support content. Have this information ready when you start planning for workspace access roles.
> - **Consider co-ownership or multi-team ownership scenarios**: Identify a scenario when it would be helpful to separate out workspaces so that responsibilities are clear.
> - **Create workspace management documentation**: Educate workspace administrators and members about how to manage workspace settings and access. Include responsibilities for workspace administrators, members, and contributors. Make the information available in your centralized portal and training materials.

## Workspace organization

How to organize workspaces is one of the most important aspects of workspace planning.

Different business units and departments might use workspaces differently depending on their collaboration requirements. When you need a new workspace, we recommend that you consider the factors described in this section.

### Workspace subject and scope

The following options present some suggestions about how you can organize workspaces by subject and scope.

In some cases, you might already have some useful groups established in Microsoft Entra ID. You can then use them to manage access to resources for the defined subject area and scope. However, you might need to create some new groups to suit this purpose. See the [workspace access](#workspace-access) section for considerations.

#### Option 1: Workspace per subject area or project

Creating a workspace for each subject area or project allows you to focus on its purpose. It allows you to take a balanced approach.

Examples: _Quarterly Financials_ or _Product Launch Analysis_

The advantages of option 1 include:

- Managing user access for who is allowed to edit or view content is more straightforward since it's scoped per subject area.
- When users across organizational boundaries access content, structuring workspaces by subject area is more flexible and easier to manage (compared to option 2 discussed next).
- Using a scope per subject area is a good compromise between workspaces that contain too many items and workspaces that contain too few items.

A disadvantage of option 1 is that, depending on how narrow or wide workspaces are defined, you still have some risk that users will create many workspaces. Finding content can be challenging for users when content is spread across many workspaces.

> [!TIP]
> When they're well-planned and managed, creating one workspace per subject area or project usually results in a manageable number of workspaces.

#### Option 2: Workspace per department or team

Creating a workspace per department or team (or business unit) is a common approach. In fact, alignment with the organizational chart is the most common way people start with workspace planning. However, it's not ideal for all scenarios.

Examples: _Finance Department_ or _Sales Team Analytics_

The following diagram depicts a generalized example of how you might separate workspaces by department, team, or subject area. Option one and option two look the same; which items are included in each workspace would depend on the nature of the data that department, team, or subject area focuses on, and how they intend on using it.

:::image type="content" source="media/powerbi-implementation-planning-workspace-planning/workspace-planning-area.svg" alt-text="Diagram shows separate workspaces for departments, teams, or subject areas." border="false":::

The advantages of option 2 include:

- Getting started with planning is simple. All content needed by the people that work in that department resides in one workspace.
- It's easy for users to know which workspace to use since all of their content is published to the workspace associated with their department or team.
- Managing security roles can be straightforward, especially when Microsoft Entra groups are assigned to workspace roles (which is a best practice).

The disadvantages of option 2 include:

- The result is often a broad-scoped workspace that contains many items. A broadly defined workspace scope can make it challenging for users to locate specific items.
- Because a one-to-one relationship exists between a workspace and a Power BI app, a broadly defined workspace can result in apps for users that contain lots of content. This issue can be mitigated by excluding certain workspace items from the app, and with good design of the app [navigation experience](../collaborate-share/service-create-distribute-apps.md#set-up-the-app).
- When users from other departments need to view specific workspace items, managing permissions can become more complex. There's a risk that people assume that everything in the departmental workspace is for their eyes only. There's also a risk that sharing individual items will become overused to accomplish granular viewing permissions.
- If some content creators need permissions to edit some but not all items, it's not possible to set those permissions in a single workspace. Workspace roles, which determine edit or view permissions, are defined at the workspace level.
- When you have a large number of workspace items, you often need to use strict naming conventions for items so that users can find what they need.
- Broad workspaces with many items might run into a technical [limitation](/fabric/get-started/workspaces#considerations-and-limitations) on the number of items that can be stored in a workspace.

> [!TIP]
> When you create workspaces that align with your organizational chart, you often end up with fewer workspaces. However, it can result in workspaces that contain large amounts of content. We recommend that you don't align workspaces per department or team when you expect to have a significant number of items or many users.

#### Option 3: Workspace for a specific report or app

Creating a workspace for each report or type of analysis isn't recommended except in specific circumstances.

Examples: _Daily Sales Summary_ or _Executive Bonuses_

Advantages of option 3 include:

- The purpose of a narrowly defined workspace is clear.
- Ultra-sensitive content can, and often should, be segregated into its own workspace so that it can be managed and governed explicitly.
- Fine-grained workspace permissions are applicable to a few items. This setup is useful when, for instance, a user is permitted to edit one report but not another.

Disadvantages of option 3 include:

- If overused, creating narrowly defined workspaces results in a large number of workspaces.
- Having a large number of workspaces to work with involves more effort. While users can rely on search, finding the right content in the right workspace can be frustrating.
- A larger number of workspaces means more work to do from in auditing and monitoring.

> [!TIP]
> You should create a workspace with a narrow scope, such as an individual report, only for specific reasons. It should be the exception rather than the rule. Occasionally, [separating scorecards](../create-reports/service-goals-create.md) into their own workspace is a useful technique. For example, using a separate workspace is helpful when a scorecard presents goals that span multiple subject areas. It's also helpful to set up specific permissions for managing and viewing the scorecard.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider the subject area and scope of workspace content, key decisions and actions include:

> [!div class="checklist"]
> - **Assess how workspaces are currently set up**: Review how people currently use workspaces. Identify what works well and what doesn't work well. Plan for potential changes and user education opportunities.
> - **Consider the best workspace scope**: Identify how you want people to use workspaces based on purpose, subject area, scope, and who's responsible for managing the content.
> - **Identify where highly sensitive content resides**: Determine when you can justify creating a specific workspace for highly sensitive content.
> - **Create and publish documentation about using workspaces**: Create useful documentation or FAQs for your users about how to organize and use workspaces. Make this information available in training materials and your centralized portal.

### Workspace item types

Separating _data workspaces_ from _reporting workspaces_ is a common practice for decoupling data assets from analytical assets.

- A _data workspace_ is dedicated to storing and securing data items such as a lakehouse, warehouse, data pipeline, dataflow, or semantic model.
- A _reporting workspace_ is focused more on downstream analytical activities. It's dedicated to storing and securing items such as reports, dashboards, and metrics. Reporting workspaces primarily include Power BI content, but not always.

In Fabric, you might extend this separation to have distinct workspaces for other item types. Some examples might include:

- _Data source workspaces_ for data warehouses, lakehouses, and SQL databases that store data
- _Data transformation workspaces_ for data pipelines, notebooks, and dataflows that transform data
- _Distribution workspaces_ for scorecards, metric sets, and organization applications that distribute data to users

The following diagram depicts an example of how you might separate workspaces by item type.

:::image type="content" source="media/powerbi-implementation-planning-workspace-planning/workspace-planning-item-type.svg" alt-text="Diagram that shows separate workspaces for transformations, data sources, semantic models, and distribution." border="false":::

> [!TIP]
> Each [Fabric experience](/fabric/get-started/fabric-terminology) allows you to create various types of items. These items don't always fit neatly into the concept of what's considered data versus reporting (or analytical) content. One example is a [Fabric notebook](/fabric/data-engineering/author-execute-notebook) that can be used in many different ways, such as: loading and transforming data in a lakehouse, submitting Spark SQL queries, or analyzing and visualizing data with PySpark. When the workspace contains mixed workloads, we recommend that you focus primarily on the workspace [purpose](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-purpose) and [ownership](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-ownership) of the content as described elsewhere in this article.

The advantages for separating data workspaces from reporting workspaces include:

- Critical organizational data, such as an [endorsed](../collaborate-share/service-endorse-content.md) lakehouse or semantic model, can reside in a specific workspace that's designed to make reusable data available at enterprise scale. Common examples include:
  - Report creators can locate and reuse trustworthy [shared semantic models](../connect-data/service-datasets-across-workspaces.md) more easily. For more information, see the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario.
  - Semantic model creators can locate trustworthy dataflows or lakehouse tables more easily. For more information, see the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario and the [advanced self-service data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenario.
- Access management can be centralized for critical organizational data. Managing access separately for the data workspace compared with reporting workspaces is useful when different people are responsible for data and reports. With managed self-service BI, it's common to have many report creators and fewer data creators.
- Limiting who can edit and manage semantic models minimizes the risk of unintentional changes, especially to critical data items that are reused for many purposes or by many users. Physical separation reduces the chances of inadvertent, or unapproved, changes. This extra layer of protection is helpful for [certified](../collaborate-share/service-endorse-content.md#certify-content) semantic models, which are relied upon for their quality and trustworthiness.
- Coownership scenarios are clarified. When shared semantic models are delivered from a centralized BI or IT team, self-service content creators in business units publish reports. A good practice is to segregate the semantic models in a separate workspace. This approach avoids the ambiguity of coownership scenarios because ownership and responsibility per workspace is more clearly defined.
- Row-level security (RLS) is enforced. When you encourage creators to work in different workspaces, they don't have unnecessary edit permissions to the original semantic model. The advantage is that [RLS](/fabric/security/service-admin-row-level-security) and [object-level security (OLS)](/analysis-services/tabular-models/object-level-security) are enforced for content creators and content viewers.

The disadvantages for separating data workspaces from reporting workspaces include:

- A workspace naming convention is required to differentiate a data workspace from a reporting workspace.
- Extra user education is required to ensure that content authors and consumers know where to publish and find content.
- Sometimes it's challenging to clearly delineate the item types that should be contained within a workspace. Over time, a workspace can end up containing more types of content than was originally intended.
- Use of separate workspaces results in a larger number of workspaces that you need to manage and audit. As you plan for purpose, scope, and other considerations (such as the separation of development, test, and production content) the approach to workspace design can become more complicated.
- Extra change management processes could be required to track and prioritize requested changes to centralized data items, particularly when report creators have requirements beyond what [composite models](../transform-model/desktop-composite-models.md) and report-level measures can handle.

### Workspace development stage

A common practice is to use separate workspaces for different stages of content development. Typically, this practice involves the following stages:

- _Development workspaces_ for untested changes
- _Test workspaces_ for dedicated internal and user testing
- _Production workspaces_ for releasing content for consumers

In Fabric, you can add workspaces for each stage to a deployment pipeline. A deployment pipeline helps with content lifecycle management, by letting pipeline administrators compare and deploy changes between stages. Typically, you first publish content to the earliest stage (like _development_) and then deploy it to the next stage (like deploying content from _development_ to _test_ workspaces, and then from _test_ to _production_ workspaces).

Here's an example of this setup:

:::image type="content" source="media/powerbi-implementation-planning-workspace-planning/workspace-planning-stages-deployment-pipeline.svg" alt-text="Diagram shows three workspace stages contained in a deployment pipeline: development, test, and production." border="false":::

You can also combine separating workspaces by both development stage and item type. If you use deployment pipelines, you can use _autobinding_ to ensure that stages are linked. Autobinding ensures that, for example, reports in the _report development workspace_ point to the correct semantic model in the _model development workspace_.

Here's an example:

:::image type="content" source="media/powerbi-implementation-planning-workspace-planning/workspace-planning-stages-deployment-pipeline-autobinding.svg" alt-text="Diagram that shows development, test, and production workspaces for reports and models in two separate deployment pipelines linked by autobinding." border="false":::

Optionally, you might have other workspaces, such as the following types of workspaces:

- _Private workspaces_ for creators to work in isolation. Using this setup is a common practice for collaborating on content by using Git integration because each content creator works on their own separate copy (branch) of the content to avoid disrupting each other's work. Then, creators can open a pull request to merge their changes into another branch that syncs to the development workspace, which creators can view, but not modify or publish content to.
- _Preproduction workspaces_ for creators to perform specific tests before releasing content. These tests might include performance testing or testing supporting resources like data gateways and apps.
- _Sandbox workspaces_ for creators to freely experiment and conduct _improvised_ explorations. Sandbox workspaces are typically emptied at a regular cadence (often automatically, such as by using APIs or notebooks). Content that creators want to retain from a sandbox workspace can be copied to a personal or private workspace for more development.

> [!TIP]
> We recommend that you organize workspaces by a minimum of two development stages. Taking this approach ensures separation between development or testing by creators, and consumption by business users. If you use a single workspace stage, you frequently will struggle to avoid disrupting existing content that is consumed from that workspace or from changes from other creators.
>
> Also, you can organize workspaces using multiple approaches. For instance, you can have separate data and reporting workspaces with multiple development stages.

The advantages for separating workspaces by development stage include:

- Support for more sophisticated and structured development processes, including:
  - Use of Deployment Pipelines to copy content between stages.
  - Use of Git integration and branching strategies for deployment and release.
  - Use of notebooks to orchestrate or automate certain tasks during the content lifecycle.
- Prevention of disrupting content in production stages used by consumers.
- Better access control for content.

The disadvantages for separating workspaces by development stage include:

- More workspaces, which can create more overhead to manage and govern them.
- Consideration of new deployment and post-deployment activities.
- Use of other tools or features to deploy (or promote) content through the development stages.
- More sophisticated workspace access policies are required to prevent creators from publishing to and using the wrong stage.

### Intra-workspace organization

In addition to organizing your workspace structure, you also have to organize content _within_ a single workspace.

To better organize content in a workspace, consider the following guidelines:

- Use clear naming conventions to easily identify different content. Consider using numerical prefixes (like _01 - Daily Sales_ to order content alphabetically, if needed).
- Use _task flows_ to group content by its purpose in your workflow into tasks. Using task flows helps you quickly identify and select similar content (by selecting the task in the task flow). It's important if you decide to include many item types with different purposes in the same workspace.
- Use workspace folders to organize similar content into groups. Workspace folders can be used instead of or in addition to tasks in task flows.
- Use endorsement and sensitivity labels to label content appropriately based on their endorsement and sensitivity status.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider the item types to store in a workspace, key decisions and actions include:

> [!div class="checklist"]
> - **Determine your objectives for data reuse**: Decide how to achieve data reuse as part of a managed self-service BI strategy.
> - **Update the tenant setting for who can use semantic models across workspaces**: Determine whether this capability can be granted to all users. If you decide to limit who can use semantic models across workspaces, consider using a group such as _Fabric approved report creators_.

## Workspace access

Since the primary purpose of a workspace is collaboration, workspace access is mostly applicable to users who create and manage its content. It can also be relevant when the workspace is used for viewing content (a secondary purpose for workspaces, as described earlier in this article).

When you begin to plan for [workspace roles](/fabric/get-started/roles-workspaces#workspace-roles), it's helpful to ask yourself the following questions.

- What are the expectations for how collaboration will occur in the workspace?
- Will the workspace be used directly for viewing content by consumers?
- Who will be responsible for managing the content in the workspace?
- Who will view content that's stored in the workspace?
- Is the intention to assign individual users or groups to workspace roles?

It's a best practice to use groups for assigning workspace roles whenever practical. You can assign different types of groups. Security groups, mail-enabled security groups, distribution groups, and Microsoft 365 groups are all supported for workspace roles. For more information about using groups, see [Tenant-level security planning](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups).

When you plan to use groups, you might consider creating one group per role per workspace. For example, to support the _Quarterly Financials_ workspace, you could create the following groups:

- _Fabric workspace **admins** – Quarterly Financials_
- _Fabric workspace **members** – Quarterly Financials_
- _Fabric workspace **contributors** – Quarterly Financials_
- _Fabric workspace **viewers** – Quarterly Financials_
- _Power BI **app viewers** – Quarterly Financials_

> [!TIP]
> Creating the groups listed here provides flexibility. However, it involves creating and managing many groups. Also, managing a large number of groups can be challenging when only IT creates and maintains groups. This challenge can be mitigated by enabling [self-service group management](/azure/active-directory/enterprise-users/groups-self-service-management#self-service-group-management-scenarios) to certain satellite members. These members can include the CoE, champions, or trusted users who are trained in how to manage role memberships for their business unit. For more information, see [Tenant-level security planning](powerbi-implementation-planning-security-tenant-level-planning.md#planning-for-power-bi-groups).

When data workspaces are separated from reporting workspaces, as described earlier in this article, it results in an even larger number of groups. Consider how the number of groups doubles from five to 10 when you separate data and reporting workspaces:

- _Fabric **data** workspace **admins** – Quarterly Financials_
- _Fabric **reporting** workspace **admins** – Quarterly Financials_
- _Fabric **data** workspace **members** – Quarterly Financials_
- _Fabric **reporting** workspace **members** – Quarterly Financials_
- _Fabric **data** workspace **contributors** – Quarterly Financials_
- _Fabric **reporting** workspace **contributors** – Quarterly Financials_
- _Fabric **data** workspace **viewers** – Quarterly Financials_
- _Fabric **reporting** workspace **viewers** – Quarterly Financials_
- _Power BI **app viewers** – Quarterly Financials_

When multiple workspaces exist for development, test, and production, it results in an even larger number of groups. Potentially, the number of groups might triple. For example, for just the data workspace admins, you would create these three groups:

- _Fabric data workspace admins – Quarterly Financials **\[Dev\]**_
- _Fabric data workspace admins – Quarterly Financials **\[Test\]**_
- _Fabric data workspace admins – Quarterly Financials_

The previous examples are intended to convey that the use of groups that map to workspace roles can quickly become unmanageable.

> [!TIP]
> In some scenarios, fewer groups are needed, especially in the area of development. For example, you might not need to specify a workspace viewers group in development. That group is needed only for testing and production. Or you might be able to use the same workspace admins group for development, test, and production. For more information about development, test, and production, see [Workspace lifecycle management](#workspace-lifecycle-management).

The effective use of groups for workspace roles can require considerable planning. Be prepared to encounter scenarios when existing groups (that might be aligned with the organizational chart) don't meet all your needs for managing Fabric content. In this case, we recommend that you create groups specifically for this purpose. The words _Fabric_ or _Power BI_ are included in the group name in the preceding examples for this purpose. If you have multiple business intelligence tools, you can choose to use only _BI_ as the prefix instead. That way, you can use the same groups across multiple tools.

Lastly, the examples show one workspace - _Quarterly Financials_ - but often it's possible to manage a collection of workspaces with one set of groups. For example, multiple workspaces owned and managed by the finance team might be able to use the same groups.

> [!NOTE]
> You'll often plan security more broadly, taking into consideration semantic model [Read](../connect-data/service-datasets-manage-access-permissions.md) and [Build](../connect-data/service-datasets-build-permissions.md) permission requirements, and [row-level security (RLS)](/fabric/security/service-admin-row-level-security) requirements. For more information about what to consider for supporting report consumers and content creators, see the [security planning](powerbi-implementation-planning-security-overview.md) articles. For the purposes of this article, the focus is only on workspace roles as part of the workspace planning process.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider workspace access, key decisions and actions include:

> [!div class="checklist"]
> - **Refer to roles and responsibilities**: Use the roles and responsibilities information prepared earlier to plan for workspace roles.
> - **Identify who'll own and manage the content**: Verify that all the items you expect to store in a single workspace align with the people who are responsible for owning and managing the content. If mismatches occur, consider how the workspaces could be better organized.
> - **Identify who'll view content in the workspace**: Determine whether people will view content directly from the workspace.
> - **Plan for the workspace roles**: Determine which people are suited to the **Admin**, **Member**, **Contributor**, and **Viewer** roles for each workspace.
> - **Decide on group or individual role assignments**: Determine whether you intend to assign individual users or groups to workspace roles. Check whether you can use existing groups for workspace role assignments.
> - **Determine whether new groups need to be created**: Consider carefully whether you need to create a new group per workspace role. Bear in mind that it can result in creating and maintaining many groups. Determine what the process is when a new workspace is created and how related groups will be created.
> - **Configure and test the workspace role assignments**: Verify that users have the appropriate security settings they need to be productive while creating, editing, and viewing content.

## Workspace domain

As described earlier in this article, it's critical to have clarity on workspace ownership. One way to further support workspace ownership in Fabric is with _domains_. A domain is a way to logically group multiple workspaces that have similar characteristics.

For more information about planning for domains in your tenant, see [Workspace domains](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-domains).

## Workspace settings

You can set up several settings for each individual workspace. These settings can significantly influence how collaboration occurs, who is allowed to access the workspace, and the level of data reusability across Fabric workloads.

### Workspace license mode

Each workspace has a [license mode](/fabric/get-started/workspaces#license-mode) setting. You can set a workspace license mode to **Pro**, **Premium per user**, **Premium capacity**, **Embedded**, **Fabric capacity**, or **Trial**.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

The [type of license](/fabric/enterprise/licenses#microsoft-fabric-license-types) is important for workspace planning because it determines:

- **Features**: Different features are supported. PPU includes more features (such as [deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines)) that aren't available in Pro. Many more Fabric features (such as [lakehouses](/fabric/data-engineering/lakehouse-overview)) become available for workspaces assigned to a Fabric capacity.
- **Content access**: The license type determines who can access content in the workspace:
  - Only users who have a PPU license (in addition to being assigned a workspace role) can access a PPU workspace.
  - If you expect to deliver content to content viewers who have a free license, you need a [license of F64 or higher](/fabric/enterprise/licenses#capacity-and-skus).
- **Data storage location**: When you need to store data in a specific geographic region (outside of your home region), that becomes possible with a workspace assigned to a capacity (and, accordingly, the capacity is created in that region). For more information about data storage location, see [Tenant setup](powerbi-implementation-planning-workspaces-tenant-level-planning.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider the workspace license mode, key decisions and actions include:

> [!div class="checklist"]
> - **Consider which features are required for each workspace**: Determine the feature requirements of each workspace. Consider differences in workload and which users you intend to access the workspace.
> - **Set the workspace license mode**: Review and update each workspace license mode according to which features are needed by each workspace.

### Workspace lifecycle management

When content creators collaborate to deliver analytical solutions that are important to the organization, you must make various _lifecycle management_ decisions. The lifecycle management processes are also called _continuous integration/continuous delivery (CI/CD)_, and they're are one aspect of DevOps.

[Lifecycle management](/fabric/cicd/cicd-overview) considerations include:

- How to ensure timely, reliable, and consistent delivery of content
- How to communicate and coordinate activities between multiple content creators who are working on the same project
- How to resolve conflicts when multiple content creators edit the same item in the same project
- How to structure a straightforward and reliable deployment process
- How to roll back deployed content to a previous stable, working version
- How to balance fast releases of new features and bug fixes while safeguarding production content

Fabric has two main components of lifecycle management:

- **Version control of content**: [Git integration](/fabric/cicd/git-integration/intro-to-git-integration) allows content owners and creators to create versions of their work. It can be used with [web-based development in a workspace](/fabric/cicd/git-integration/manage-branches#develop-using-another-workspace), or when teams develop in a [client tool](/fabric/cicd/git-integration/manage-branches#develop-using-client-tools), such as Power BI Desktop. Version control (also known as _source control_) is achieved by tracking all revisions to a project by using _branches_ associated with local and remote _repositories_ in [Azure DevOps](/fabric/cicd/git-integration/git-get-started?tabs=commit-to-git&preserve-view=true). Changes are _[committed](/fabric/cicd/git-integration/git-get-started?tabs=commit-to-git&preserve-view=true)_ at regular intervals to branches in the remote repository. When a content creator completes revisions that are tested and approved, their branch is _merged_ with the latest version of the solution in the main remote repository (after they resolve any merge [conflicts](/fabric/cicd/git-integration/conflict-resolution)). Git integration can be specified for each workspace in the Fabric portal if the feature is enabled in the [tenant settings](/fabric/admin/git-integration-admin-settings).
- **Promoting content**: [Deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) are primarily focused on release management in order to maintain a stable environment for users. You can assign a workspace to a stage (development, test, or production) in a deployment pipeline. Then, you can easily and systematically _promote_, or _deploy_, your content to the next stage.

When you combine the lifecycle management features, during your planning process, cosider using [best practices](/fabric/cicd/best-practices-cicd). For example, you might choose to use Git integration for your development workspace and deployment pipelines to publish to your test and production workspaces. Those types of decisions require using the agreed-upon practice consistently. We recommend that you do a proof of concept to fully test your setup, processes, and [permissions model](/fabric/cicd/best-practices-cicd#plan-your-permission-model).

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you plan for workspace lifecycle management, key decisions and actions include:

> [!div class="checklist"]
> - **Determine how users need to use version control**: Analyze how your self-service and advanced content creators work to determine whether file versioning with OneDrive for Business or SharePoint is appropriate. Introduce Git integration for advanced users who need more capabilities. Prepare to support both types of users.
> - **Determine how users need to promote content**: Analyze how your self-service and advanced content creators work to determine whether deployment pipelines are a good fit for promoting content.
> - **Decide whether Git integration should be enabled**: Consider whether Git integration with workspaces is a good fit for how your content creators work. Set the _Users can synchronize workspace items with their Git repositories_ tenant setting to align with this decision. Review each of the Git integration tenant settings and set them according to your governance guidelines.
> - **Do a proof of concept**: Conduct a technical proof of concept to clarify how you intend for Git workspaces and deployment pipelines to work together.
> - **Decide which workspaces should have Git integration**: Consider how your content creators work, and which workspaces should be assigned to a development, test, or production (release) branch.
> - **Verify licenses**: Confirm that you have a capacity license available to use Git integration. Ensure that each workspace is assigned to a Fabric capacity or Power BI Premium capacity.
> - **Set up Azure DevOps**: Work with your administrator to set up the Azure DevOps projects, repositories, and branches that you need for each workspace. Assign appropriate access to each repository.
> - **Connect workspaces**: Connect each workspace to the appropriate Azure DevOps repository.
> - **Consider who should deploy to production**: Make decisions about who can update production content and how. Ensure that these decisions align with how workspace ownership is handled in your organization.
> - **Educate content creators**: Ensure that all your content creators understand when to use lifecycle management features and practices. Educate them on the workflow and how different workspaces impact lifecycle management processes.

### Workspace integration with Data Lake Storage Gen2

It's possible to connect a workspace to an Azure Data Lake Storage Gen2 account. You might take this approach for two reasons:

- **Storage of Power BI dataflows data**: If you choose to bring-your-own-data-lake, the data for Power BI dataflows (Gen1) could be accessed directly in Azure. Direct access to [dataflow storage in Data Lake Storage Gen2](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md) is helpful when you want other users or processes to view or access the data. It's especially helpful when your goal is to reuse dataflows data beyond Power BI. You have two choices for assigning storage:

  - [Tenant-level storage](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#tenant-level-storage), which is helpful when you want to centralize all data for Power BI dataflows into one Data Lake Storage Gen2 account.
  - [Workspace-level storage](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#workspace-level-storage), which is helpful when business units manage their own data lake or have certain data residency requirements.

- **Backup and restore for Power BI semantic models**: The [Power BI semantic model backup and restore feature](../enterprise/service-premium-backup-restore-dataset.md) is supported for workspaces that are assigned to capacity or PPU. This feature uses the same Data Lake Storage Gen2 account that's used for storing Power BI dataflows data (described in the previous bullet point). Semantic model backups are helpful for:

  - Complying with data retention requirements
  - Storing routine backups as part of a disaster recovery strategy
  - Storing backups in another region
  - Migrating a data model

> [!IMPORTANT]
> Setting [Azure connections](/fabric/admin/service-admin-portal-azure-connections) in the Fabric admin portal doesn't mean that all dataflows for the entire tenant are stored by default to a Data Lake Storage Gen2 account. To use an explicit storage account (instead of internal storage), each workspace must be explicitly connected. It's critical that you set the workspace Azure connections _before you create any Power BI dataflows_ in the workspace.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider workspace integration with Data Lake Storage Gen2, key decisions and actions include:

> [!div class="checklist"]
> - **Decide whether the workspace will be used in ways that require Azure Storage**: Consider whether a bring-your-own-data-lake scenario would be useful for the storage of dataflows and/or whether you have requirements to use the semantic model backup and restore functionality.
> - **Determine which Azure Storage account to use**: Select an Azure Storage account that has the [hierarchical namespace](/azure/storage/blobs/data-lake-storage-namespace) enabled (Data Lake Storage Gen2) for tenant-level (centralized) storage of dataflows data or semantic model backups. Ensure you have the Azure Storage account information readily available.
> - **Configure the tenant-level storage account**: In the Fabric admin portal, set the tenant-level Data Lake Storage Gen2 storage account.
> - **Decide whether workspace administrators can connect a storage account**: Have discussions to understand the needs of decentralized teams, and whether individual teams are currently maintaining their own Azure Storage accounts. Decide whether this capability should be enabled.
> - **Configure the admin setting for workspace-level storage**: In the Fabric admin portal, enable the option that allows workspace administrators to connect their own storage account.
> - **Set the workspace-level Azure Storage connections**: Specify the Azure Storage account for each individual workspace. You must set the storage account prior to creating any Power BI dataflows in the workspace. If you intend to use semantic model backups, ensure the workspace license mode is set to capacity or PPU.
> - **Update your workspace management documentation**: Ensure that your workspace management documentation includes information about how to assign Data Lake Storage Gen2 storage accounts correctly. Make the information available in your centralized portal and training materials.

### Workspace integration with Azure Log Analytics

[Azure Log Analytics](/azure/azure-monitor/logs/log-analytics-overview) is a service within [Azure Monitor](/azure/azure-monitor/#features). You can use Azure Log Analytics to review diagnostic data generated by the Analysis Services engine, which hosts Power BI semantic models. Workspace-level logs are useful for analyzing performance and trends, performing data refresh analysis, analyzing XMLA endpoint operations, and more. Azure Log Analytics is available only for workspaces assigned to capacity or PPU.

> [!NOTE]
> Although the names are similar, the data sent to [Azure Log Analytics](../transform-model/log-analytics/desktop-log-analytics-overview.md) is different from the data captured by the [Power BI activity log](../enterprise/service-admin-auditing.md). The data sent to Azure Log Analytics is concerned with [events](../transform-model/log-analytics/desktop-log-analytics-configure.md#events-and-schema) generated by the Analysis Services engine (for example, _Query begin_ and _Query end_ events). Conversely, the activity log is concerned with tracking [user activities](/fabric/admin/operation-list) (for example, _View report_ or _Edit report_ events).

For more information about semantic model event logs, see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).

For more information about how to set up Azure Log Analytics for use with Power BI, see [Configuring Azure Log Analytics for Power BI](../transform-model/log-analytics/desktop-log-analytics-configure.md). Be sure to understand the prerequisites you must have in place to make the integration work.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider workspace integration with Azure Log Analytics, key decisions and actions include:

> [!div class="checklist"]
> - **Decide whether workspace administrators can connect to Log Analytics**: Determine whether all or some workspace administrators are permitted to use Log Analytics to analyze workspace-level logs. If access is restricted to only certain people, decide which group to use.
> - **Set up the tenant setting for Log Analytics connections**: In the Fabric admin portal, set the tenant setting according to the decision for which workspace administrators set connections.
> - **Set the Log Analytics workspace for each workspace**: In the workspace settings, specify the Log Analytics information for each workspace. To capture workspace-level logs, ensure that the workspace license mode is set to capacity or PPU.
> - **Update your workspace management documentation**: Ensure that your workspace management documentation includes information about how to assign a workspace to Log Analytics.

### Other workspace properties

Several other workspace properties can provide helpful information. For [governed workspaces](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-governance-level), we recommend that you set these properties.

Here are some suggestions for how to set the key settings to improve the experience for your users:

- **Workspace description**: A good workspace description includes a brief but specific explanation of what type of content is in the workspace. You can use up to 4,000 characters to describe:

  - The purpose for the workspace
  - The target audience
  - The type of content published to the workspace
  - Whether the workspace is considered governed
  - Whether the workspace includes development, test, or production data
  - Who to contact if any questions arise (occasionally it's crucial to display this information as prominently as possible, in addition to the contact list that's described next)

- **Workspace contacts**: The workspace contact list includes the workspace administrators by default. If you have technical content owners that are different from the subject matter experts, you might find it helpful to specify other contacts. Other contacts could be groups or individuals who can answer questions about the workspace content.
- **Workspace image**: Consistent use of workspace images can be helpful for users when they scan a list of workspaces. Consider using an image to help users determine:

  - The domain or subject area
  - Which business unit or team owns and manages the content
  - Whether it's a data workspace (one that's dedicated to storing reusable items, such as a lakehouse, warehouse, data pipeline, dataflow, or semantic model)
  - Whether it's a reporting workspace (one that's dedicated to storing analytical items, such as reports, dashboards, or metrics)

- **Data model settings**: Allows workspace members, administrators, and users with Build permission on the semantic models to edit Power BI data models by using the web interface. This setting is used together with the _Users can edit data models in the Power BI service_ tenant setting. This setting should align with your decisions and processes for how content is created, managed, and deployed. Also, consider your method for [version control](#workspace-lifecycle-management) as described earlier in this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider the other workspace properties, key decisions and actions include:

> [!div class="checklist"]
> - **Specify the workspace description**: Ensure that a helpful and thorough description is included in the workspace description.
> - **Use a helpful image for the workspace**: Set a consistent image for the workspace that'll visually help users understand its subject area, who owns and manages content in the workspace, and/or the type of content stored in the workspace.
> - **Identify contacts for the workspace**: Verify whether the workspace administrators should be the workspace contacts, or whether specific users or groups should be specified.
> - **Specify data model settings**: Consider which workspaces can permit web-based data model editing. Set the _Users can edit data models in the Power BI service_ tenant setting according to your preferences for who can edit and manage content.

### Other technical factors

Other technical factors might influence your workspace setup:

- Integrating content with other tools and services might have licensing implications. For example, if you embed a [Power Apps visual](/power-apps/maker/canvas-apps/powerapps-custom-visual) in a Power BI report, you need appropriate Power Apps licenses.
- [Per-workspace storage limits](/fabric/admin/portal-workspaces#workspace-limits) apply to the amount of data you can store in a Pro workspace. If using capacity or PPU isn't an option, consider how to work within the storage limits during the workspace planning process.
- When you install a [template app](../connect-data/service-template-apps-install-distribute.md) from AppSource, it creates a new workspace that has a narrow subject and scope.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you consider other technical factors, key decisions and actions include:

> [!div class="checklist"]
> - **Pay attention to technical factors**: As you work through the planning process, determine whether a technical consideration or limitation (such as per-workspace storage limits) influences your decision-making process.
> - **Reorganize workspace content**: If storage limits might become a problem, create separate workspaces now, and then republish content to these new workspaces.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see:

- [Introduction to Power BI implementation planning](powerbi-implementation-planning-introduction.md)
