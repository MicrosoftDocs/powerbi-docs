---
title: "Power BI implementation planning: Workspace-level workspace planning"
description: "This article introduces the Power BI workspace tactical planning decisions you should make at the workspace level."
author: kfollis
ms.author: kfollis
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 12/12/2022
---

# Power BI implementation planning: Workspace-level workspace planning

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This workspace-level planning article is targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization.
- **Center of Excellence, IT, and BI team:** The teams who are also responsible for overseeing Power BI and supporting self-service users throughout the organization.
- **Content creators and owners:** Self-service BI creators who need to create, publish, and manage content in workspaces.

To use workspaces effectively, there are many tactical decisions to be made. Whenever possible, individual workspace-level decisions should align with your [tenant-level decisions](powerbi-implementation-planning-workspaces-tenant-level-planning.md).

## Workspace purpose

When planning for workspaces, it's important to consider not only the type of content it will store, but also the activities that the workspace is intended to support.

Consider the following two examples of finance-related workspaces. Although they're both dedicated to the same team, each workspace serves a different purpose:

- **Financial month-end workspace:** The *Financial month-end workspace* contains reconciliation and month-end closing reports. This workspace is considered an informal workspace to support collaborative efforts. A Power BI app isn't necessary for content viewers because the primary use of this workspace is collaboration by a small group of people who work closely together. Most team members have permission to edit content in this workspace.
- **Financial reporting workspace:** The *Financial reporting workspace* contains the finalized, presentation-level reports. All reports in this workspace are required to use certified datasets. This workspace contains content that's broadly distributed throughout the organization to many viewers (including executives) by using a Power BI app. The workspace is closely governed, and publishing content to it involves an approval process. There are three related workspaces for development, test, and production stages.

With these two examples in mind, consider two specific aspects of workspace purpose: *intent for collaboration*, and *intent for viewing*.

### Intent for collaboration

The primary objective of a workspace in the Power BI service is to facilitate [collaboration](/power-bi/collaborate-share/service-how-to-collaborate-distribute-dashboards-reports#collaborate-in-a-workspace) among multiple people. There are many ways that collaboration can happen in a workspace:

- **Team-based development:** Multiple people can work together to build, test, and publish content. One user may work on the design of the dataset, while other users build reports that connect to the dataset by using [live connections](/power-bi/connect-data/desktop-report-lifecycle-datasets).
- **Testing and validations:** Users may need to perform data validations for a new report. Subject matter experts from the business unit may need to perform user acceptance testing (UAT), or a data quality team may need to validate the accuracy of the dataset.
- **Enhancements:** Stakeholders and consumers of the content may suggest enhancements to the content as circumstances change.
- **Ownership transfer:** Another person or team may [take over responsibility](powerbi-adoption-roadmap-content-ownership-and-management.md#ownership-transfers) for content that was created by someone else.

One of the key areas of the Power BI adoption roadmap is [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md). The type of collaboration that will occur in a workspace will differ based on the approach used for content ownership and management:

- **Business-led self-service BI:** Content is owned and managed by the content creators within a business unit or department. In this scenario, most collaboration in the workspace occurs among users within that business unit.
- **Managed self-service BI:** Data is owned and managed by a centralized team, whereas various content creators from business units take responsibility for reports and dashboards. In this scenario, it's highly likely that multiple workspaces will be needed to securely facilitate collaboration by multiple teams of people.
- **Enterprise BI:** Content is owned and managed by a centralized team, such as IT, enterprise BI, or the Center of Excellence (COE). In this scenario, collaboration efforts in the workspace are occurring among users in the centralized team.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering your intentions for collaboration in a workspace, key decisions and actions include:

> [!div class="checklist"]
> - **Consider expectations for collaboration:** Determine how workspace collaboration needs to occur and who's involved within a single team or across organizational boundaries.
> - **Consider expectations for content ownership and management:** Think about how the different content ownership and management approaches (business-led self-service BI, managed self-service BI, and enterprise BI) will influence how you design and use workspaces.

> [!TIP]
> When your needs can't be met by a single approach, be prepared to be flexible and use a different collaboration strategy for different workspaces. The strategy can be based on the scenario as well as the team members that are involved. Also, don't be afraid to use different [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) approaches for different workspaces when it can be justified.

### Intent for content viewing

The secondary objective for a Power BI workspace is to distribute content to consumers who need to view the content. There are several different ways to approach content distribution in the Power BI service:

- **Reports can be viewed by using a Power BI app:** Content stored in a non-personal workspace can be published to a Power BI app. A Power BI app is a more user-friendly experience than viewing reports directly in a workspace. For this reason, using a Power BI app is the best approach for distributing content to consumers. Audiences for a Power BI app are very flexible. However, sometimes the goals for how you want to distribute content with an app are a factor in determining how to organize content in or across workspaces. For more information about securing Power BI apps, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#power-bi-app-permissions) article.
- **Reports can be viewed directly in the workspace:** This approach is often appropriate for informal, collaborative workspaces. Workspace roles define who can view or edit the content contained in a workspace.
- **Reports can be shared:** Use of [sharing](/power-bi/collaborate-share/service-share-dashboards) (links or direct access) is useful when there's a need to provide read-only access to a single item within a workspace. We recommend that you use app permissions and workspace roles instead of sharing because they're easier to maintain. For more information, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#per-item-permissions) article.
- **Reports can be embedded in another application and viewed there:** Sometimes the intention is for consumers to view Power BI content that's embedded in another application. Embedding content is useful when it makes sense for the user to remain in the application so they stay within its workflow.

Another key area of the Power BI adoption roadmap is content delivery scope. The ways that a workspace will support content distribution will differ based on the content delivery scope:

- **Personal BI:** Content is intended for use by the creator. Since sharing content with others isn't an objective, personal BI is done within a personal workspace (discussed in the next topic).
- **Team BI:** Content is shared with a relatively small number of colleagues who work closely together. In this scenario, most workspaces are informal, collaborative workspaces.
- **Departmental BI:** Content is distributed to a large number of consumers who may belong to a department or business unit. In this scenario, the workspace is primarily for collaboration efforts. In departmental BI scenarios, content is commonly viewed in an app (instead of directly viewed in the workspace).
- **Enterprise BI:** Content is delivered broadly across organizational boundaries to the largest number of target consumers. In this scenario, the workspace is primarily for collaboration efforts. For enterprise BI scenarios, content is commonly viewed in an app (instead of directly viewed in the workspace).

> [!TIP]
> When you plan your workspaces, consider the needs of the audience when determining the workspace [license type](/power-bi/fundamentals/service-features-license-type). The type of license that's assigned to the workspace will impact the features that are available, including who can view or manage workspace content.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering your expectations for how workspace content will be viewed, key decisions and actions include:

> [!div class="checklist"]
> - **Consider expectations for viewing content:** Determine how you expect consumers to view content that's been published to the workspace. Consider whether viewing will happen directly in the workspace directly or by using a different method.
> - **Determine who the content will be delivered to:** Consider who the target audience is. Also consider the workspace license type, especially when you expect a significant number of content viewers.
> - **Evaluate needs for a Power BI app:** Consider what the workspace purpose is as it relates to the content distribution requirements. When a Power BI app is required, it can influence decisions about creating a workspace.
> - **Consider expectations for content delivery scope:** Consider how the different content delivery scopes (personal BI, team BI, departmental BI, and enterprise BI) will influence how you design and use workspaces.

> [!TIP]
> Be prepared to be flexible. You can use a different content viewing strategy for workspaces based on the scenario and also the team members that are involved. Also, don't be afraid to use different [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md) approaches for workspaces when it can be justified.

### Appropriate use of personal workspaces

There are two types of workspaces:

- **Personal workspaces:** Every Power BI user has a personal workspace. A personal workspace may be used for publishing content to the Power BI service. Its primary purpose is to support [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) usage scenarios.
- **Workspaces:** The primary purpose of a [workspace](/power-bi/collaborate-share/service-new-workspaces) is to support collaboration among multiple users for the [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md), [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md), and [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) usage scenarios. Secondarily, a workspace can also be used for viewing content.

Using a personal workspace for anything other than [personal BI](powerbi-adoption-roadmap-content-delivery-scope.md#personal-bi), temporary content, or testing purposes can be risky because content in a personal workspace is managed and maintained by one person. Further, a personal workspace doesn't support collaboration with others.

Also, a personal workspace is limited in its options to share content with others. You can't publish an app from a personal workspace (and Power BI apps are an important mechanism for distributing content to the organization). Sharing (links or direct access) is the only way to share personal workspace content with others. While sharing is possible, extensive use of sharing involves more effort and increases the risk of error.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering your expectations for how personal workspaces should be used, key decisions and actions include:

> [!div class="checklist"]
> - **Understand current use of personal workspaces:** Have conversations with your users and review the [activity log](/power-bi/admin/service-admin-auditing) to ensure you understand what users are doing with their personal workspaces.
> - **Decide how personal workspaces should be used:** Decide how personal workspaces should (and should not) be used in your organization. Focus on balancing risk and ease of use with needs for content collaboration and viewing.
> - **Relocate personal workspace content when appropriate:** For critical content, move content from personal workspaces to standard workspaces when appropriate.
> - **Create and publish documentation about personal workspaces:** Create useful documentation or FAQs for your users about how to effectively use personal workspaces. Make the information available in your centralized portal and training materials.

> [!NOTE]
> For more information, see these Power BI adoption roadmap topics: [centralized portal](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal), [training](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#training), and [documentation](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#documentation).

## Workspace ownership

Understanding who will take responsibility for owning and managing content in a workspace is an important part of the planning process.

One of the most important things to consider when planning workspaces is determining the [ownership and stewardship](powerbi-adoption-roadmap-content-ownership-and-management.md#ownership-and-stewardship) roles and responsibilities. The goal is to have clarity on exactly who is accountable for creating, maintaining, publishing, securing, and supporting the content in each workspace.

When the intent for collaboration involves multiple teams beyond a single business unit, it can become complicated to manage workspaces. Sometimes it's helpful to create separate workspaces to clearly delineate which team is responsible for which content. Use of multiple workspaces allows you to be specific as to ownership and management responsibilities, and it can help you to set security according to the [principle of least privilege](/azure/active-directory/develop/secure-least-privileged-access).

> [!TIP]
> Your decisions related to accountability and responsibility should correlate directly with your actions related to defining [workspace access](#workspace-access), which is described later in this article.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering workspace ownership responsibilities, key decisions and actions include:

> [!div class="checklist"]
> - **Define and document roles and responsibilities:** Ensure that you define and document clear roles and responsibilities for people who collaborate in workspaces. Make this information available in onboarding activities, training materials, and your centralized portal.
> - **Create a responsibility matrix:** Map out who is expected to handle each function when creating, maintaining, publishing, securing, and supporting content. Have this information ready when you start planning for workspace access roles.
> - **Consider co-ownership or multi-team ownership scenarios:** Identify when a scenario exists where it would be helpful to separate out workspaces so that responsibilities are clear.
> - **Create workspace management documentation:** Educate workspace administrators and members about how to manage workspace settings and access. Include responsibilities for workspace administrators, members, and contributors. Make the information available in your centralized portal and training materials.

## Workspace organization

How to organize workspaces is one of the most important aspects of workspace planning.

Different business units and departments may use workspaces slightly differently depending on their collaboration requirements. When you need a new workspace, we recommend that you consider the factors described in this section.

### Workspace subject and scope

The following options present some suggestions about how you can organize workspaces by subject and scope.

In some cases, you may already have some useful [Azure Active Directory (Azure AD) groups](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal) in place. You can then use them to manage access to resources for the defined subject area and scope. However, you might need to create some new groups to suit this purpose. See the [workspace access](#workspace-access) section below for considerations.

#### Option 1: Workspace per subject area or project

Creating a workspace for each subject area or project allows you to focus on its purpose. It allows you to take a balanced approach.

Examples: *Quarterly Financials* or *Product Launch Analysis*

The advantages of option 1 include:

- Managing user access for who is allowed to edit or view content is more straightforward since it's scoped per subject area.
- When content will be accessed by users across organizational boundaries, structuring workspaces by subject area is more flexible and easier to manage (compared to option 2 discussed next).
- Using a scope per subject area is a good compromise between workspaces that contain too many items and workspaces that contain too few items.

A disadvantage of option 1 is that depending on how narrow or wide workspaces are defined, there's still some risk that many workspaces will be created. Finding content can be challenging for users when content is spread across many workspaces.

> [!TIP]
> When well-planned and managed, a workspace per subject area or project usually results in a manageable number of workspaces.

#### Option 2: Workspace per department or team

Creating a workspace per department or team (or business unit) is a common approach. In fact, alignment with the organizational chart is the most common way people start with workspace planning. However, it's not ideal for all scenarios.

Examples: *Finance Reporting* or *Sales Analytics*

The advantages of option 2 include:

- Getting started with planning is simple. All content needed by the people that work in that department will reside in one workspace.
- It's easy for users to know which workspace to use since all of their content is published to the workspace associated with their department or team.
- Managing security roles can be straightforward, especially when Azure AD groups are assigned to workspace roles (which is a best practice).

The disadvantages of option 2 include:

- The result is often a broad-scoped workspace that contains many items. A broadly defined workspace scope can make it challenging for users to locate specific items.
- Since there's a one-to-one relationship between a workspace and a Power BI app, a broadly defined workspace can result in apps for users that contain lots of content. This issue can be mitigated by excluding workspace items from the app, and with good design of the app [navigation experience](/power-bi/collaborate-share/service-create-distribute-apps#design-the-navigation-experience).
- When users from other departments need to view specific workspace items, managing permissions can become more complex. There's a risk that people will assume that everything in the departmental workspace is for their eyes only. There's also a risk that the sharing of individual items will become overused in order to accomplish granular viewing permissions.
- If some content creators need permission to edit some items (but not all items), it's not possible to set those permissions in a single workspace. That's because workspace roles, which determine edit or view permissions, are defined at the workspace level.
- When you have a large number of workspace items, it often means you'll need to use strict naming conventions for items so that users are able to find what they need.

> [!TIP]
> When creating workspaces that align with your organizational chart, you often end up with fewer workspaces. However, it can result in workspaces that contain a lot of content. We don't recommend aligning workspaces per department or team when you expect to have a significant number of items and/or many users.

#### Option 3: Workspace for a specific report or app

Creating a workspace for each report or type of analysis isn't recommended except for specific circumstances.

Examples: *Daily Sales Summary* or *Executive Bonuses*

Advantages of option 3 include:

- The purpose for a narrowly defined workspace is clear.
- Ultra-sensitive content can, and often should, be segregated into its own workspace so that it can be managed and governed explicitly.
- Fine-grained workspace permissions are applicable to a few items. This setup is useful when, for instance, a user is permitted to edit one report but not another.

Disadvantages of option 3 include:

- If overused, creating narrowly defined workspaces results in a large number of workspaces.
- Having a large number of workspaces to work with involves more effort. While users can rely on search, finding the right content in the right workspace can be frustrating.
- When a larger number of workspaces exist, there's more work from an auditing and monitoring perspective.

> [!TIP]
> Creating a workspace with a narrow scope, such as an individual report, should be done for specific reasons only. It should be the exception rather than the rule.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering the subject area and scope of workspace content, key decisions and actions include:

> [!div class="checklist"]
> - **Assess how workspaces are currently set up:** Review how people currently use workspaces. Identify what works well and what doesn't work well. Plan for potential changes and user education opportunities.
> - **Consider the best workspace scope:** Identify how you want people to use workspaces based on purpose, subject area, scope, and who's responsible for managing the content.
> - **Identify where highly sensitive content resides:** Determine when creating a specific workspace for highly sensitive content can be justified.
> - **Create and publish documentation about using workspaces:** Create useful documentation or FAQs for your users about how to organize and use workspaces. Make this information available in training materials and your centralized portal.

### Workspace item types

[Shared datasets](/power-bi/connect-data/service-datasets-across-workspaces), which can be used by multiple reports, reside in different workspaces from the reports. There are many advantages related to decoupling datasets and reports that are described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario.

Similarly, dataflows (which can be used by many datasets) can reside in a different workspace from the datasets. The advantages of centralizing data preparation activities with dataflows are described in the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario. The [advanced self-service data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenario builds further upon those concepts and introduces more ways that workspaces can contribute to a modular structure for data reuse and enterprise scale.

Separating data workspaces from reporting workspaces is a common practice for supporting [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md). The advantages for separating data workspaces from reporting workspaces include:

- Critical organizational data, including [endorsed](/power-bi/collaborate-share/service-endorse-content) datasets, can reside in a specific workspace for that purpose. Report creators can then locate trustworthy datasets more easily. Dataset creators can also locate trustworthy dataflows more easily.
- Access management can be centralized for critical organizational data. Managing access separately for the data workspace compared with reporting workspace(s) is useful when different people are responsible for data and reports. With managed self-service BI, it's common to have many report creators and fewer dataset and dataflow creators.
- Limiting who can edit and manage datasets minimizes the risk of unintentional changes, especially to critical datasets. Physical separation reduces the chances of inadvertent, or unapproved, changes. This extra layer of protection is helpful for [certified](/power-bi/collaborate-share/service-endorse-content#certify-content) datasets, which are relied upon for their quality and trustworthiness.
- Co-ownership scenarios are clarified. When shared datasets are delivered from a centralized BI or IT team, while reports are published by self-service content creators (in business units), it's a good practice to segregate the datasets into a separate workspace. This approach avoids the ambiguity of co-ownership scenarios because ownership and responsibility per workspace is more clearly defined.
- Row-level security (RLS) is enforced. Since most creators will work in different workspaces and won't have edit permission to the dataset, [row-level security](/power-bi/enterprise/service-admin-rls) and/or [object-level security (OLS)](/analysis-services/tabular-models/object-level-security) will be enforced when viewing content.

The disadvantages for separating data workspaces from reporting workspaces include:

- A workspace naming convention is required to be able to distinguish a *data workspace* from a *reporting workspace*.
- Extra user education is required to ensure that content authors and consumers know where to publish and find content.
- Use of separate workspaces results in a larger number of workspaces that you need to manage and audit. As you plan for purpose, scope, and other considerations (such as the separation of development, test, and production content) the approach to workspace design can become more complicated.
- Extra change management processes may be required to track and prioritize requested changes to centralized datasets or dataflows, which is particularly the case when report creators have requirements beyond what can be handled by [composite models](/power-bi/transform-model/desktop-composite-models) and report-level measures.

Separating [scorecards](/power-bi/create-reports/service-goals-create) into their own workspace is also a useful technique. Using a separate workspace is also helpful when a scorecard presents goals that span multiple subject areas. It's also helpful to set up specific permissions for managing and viewing the scorecard.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering the item types to store in a workspace, key decisions and actions include:

> [!div class="checklist"]
> - **Determine your objectives for data reuse:** Decide how to achieve dataset and dataflow reuse as part of a managed self-service BI strategy.
> - **Update the tenant setting for who can use datasets across workspaces:** Determine whether this capability can be granted to all users. If you decide to limit who can use datasets across workspaces, consider using a group named something like *Power BI approved report creators*.

## Workspace access

Since the primary purpose of a workspace is collaboration, workspace access is mostly relevant for the people who own and manage its content. It can also be relevant when the workspace is used for viewing content (a secondary purpose for workspaces, as described earlier in this article).

When starting to plan for workspace roles, it's helpful to ask yourself the following questions.

- What are the expectations for how collaboration will occur in the workspace?
- Will the workspace be used directly for viewing content by consumers?
- Who will be responsible for managing the content in the workspace?
- Who will view content that's stored in the workspace?
- Is the intention to assign individual users or groups to workspace roles?

It's a best practice to use groups for assigning workspace roles whenever practical. There are different types of groups you can assign. Security groups, mail-enabled security groups, distribution groups, and Microsoft 365 groups are all supported for workspace roles.

When planning to use groups, you might consider creating one group per role per workspace. For example, to support the *Quarterly Financials* workspace, you could create the following groups:

- *Power BI workspace **admins** – Quarterly Financials*
- *Power BI workspace **members** – Quarterly Financials*
- *Power BI workspace **contributors** – Quarterly Financials*
- *Power BI workspace **viewers** – Quarterly Financials*
- *Power BI **app viewers** – Quarterly Financials*

> [!TIP]
> Creating the groups listed above provides flexibility. However, it involves creating and managing many groups. Also, managing a large number of groups can be challenging when groups are only created and maintained by IT. This challenge can be mitigated by enabling [self-service group management](/azure/active-directory/enterprise-users/groups-self-service-management#self-service-group-management-scenarios) to certain satellite members. These members can include the Center of Excellence (COE), champions, or trusted users who have been trained in how to manage role memberships for their business unit. For more information, see the [Tenant-level security planning](powerbi-implementation-planning-security-tenant-level-planning.md#planning-for-power-bi-groups) article.

When data workspaces are separated from reporting workspaces, as discussed earlier in this article, it results in an even larger number of groups. Consider how the number of groups doubles from five to 10 when you separate data and reporting roles:

- *Power BI **data** workspace **admins** – Quarterly Financials*
- *Power BI **reporting** workspace **admins** – Quarterly Financials*
- *Power BI **data** workspace **members** – Quarterly Financials*
- *Power BI **reporting** workspace **members** – Quarterly Financials*
- *Power BI **data** workspace **contributors** – Quarterly Financials*
- *Power BI **reporting** workspace **contributors** – Quarterly Financials*
- *Power BI **data** workspace **viewers** – Quarterly Financials*
- *Power BI **reporting** workspace **viewers** – Quarterly Financials*
- *Power BI **app viewers** – Quarterly Financials*

When multiple workspaces exist for development, test, and production, it results in an even larger number of groups. There's the potential for the number of groups to triple. For example, for just the data workspace admins, there would be these three groups:

- *Power BI data workspace admins – Quarterly Financials **\[Dev\]***
- *Power BI data workspace admins – Quarterly Financials **\[Test\]***
- *Power BI data workspace admins – Quarterly Financials*

These examples are intended to convey that the use of groups that map to workspace roles can quickly become unmanageable.

> [!TIP]
> There are times when fewer groups are needed, particularly in development. For example, you may not need to specify a workspace viewers group in development; that group may only be needed for test and production. Or you might be able to use the same workspace admins group for development, test, and production.

The effective use of groups for workspace roles can require considerable planning. Be prepared to encounter scenarios when existing groups (that may be aligned with the organizational chart) don't meet all your needs for managing Power BI content. In this case, we recommend that you create groups specifically for this purpose. That's why the words *Power BI* are included in the group name examples shown above. If you have multiple business intelligence tools, you may choose to use only *BI* as the prefix rather than *Power BI*. That way, you can use the same groups across multiple tools.

Lastly, the examples show one workspace - *Quarterly Financials* - but often it's possible to manage a collection of workspaces with one set of groups. For example, multiple workspaces owned and managed by the finance team could use the same groups.

> [!NOTE]
> You'll often plan security more broadly, taking into consideration dataset [Read](/power-bi/connect-data/service-datasets-manage-access-permissions) and [Build](/power-bi/connect-data/service-datasets-build-permissions) permission requirements, and row-level security (RLS) requirements. For more information about what to consider for security planning, see the [security planning](powerbi-implementation-planning-security-overview.md) articles. For the purposes of this article, the focus is only on workspace roles as part of the workspace planning process.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering workspace access, key decisions and actions include:

> [!div class="checklist"]
> - **Refer to roles and responsibilities:** Use the roles and responsibilities information prepared earlier to plan for workspace roles.
> - **Identify who'll own and manage the content:** Verify that all the items you expect to store in a single workspace align with the people who'll take responsibility for owning and managing the content. If there are mismatches, reconsider how the workspaces could be better organized.
> - **Identify who'll view content in the workspace:** Determine whether people will view content directly from the workspace.
> - **Plan for the workspace roles:** Determine which people are suited to the **Admin**, **Member**, **Contributor**, and **Viewer** roles for each workspace.
> - **Decide on group or individual role assignments:** Determine whether you intend to assign individual users or groups to workspace roles. Check whether there are existing groups that you can use for workspace role assignments.
> - **Determine whether new groups need to be created:** Consider carefully whether you need to create a new group per workspace role. Bear in mind that it can result in creating and maintaining many groups. Determine what the process is when a new workspace is created and how related groups will be created.
> - **Configure and test the workspace role assignments:** Verify that users have the functionality they need for editing and viewing content.

## Workspace settings

There are several settings you can set up for each individual workspace. These settings can significantly influence how collaboration occurs, who is allowed to access the workspace, and the level of data reusability outside of Power BI.

### Workspace license type

Each workspace has a [license type](/power-bi/collaborate-share/service-create-the-new-workspaces#premium-capacity-settings) setting. It can be set to **Power BI Pro**, **Premium per user (PPU)**, **Premium per capacity**, or **Embedded**. This setting is important for workspace planning because it determines:

- **Features:** Certain features, such as deployment pipelines, aren't supported in a Power BI Pro workspace.
- **Content access:** The license type determines who can access content in the workspace:
  - Only users who have a PPU license (in addition to being assigned a workspace role) can access a PPU workspace.
  - If you expect to deliver content to content viewers who have a free Power BI license, you'll need a Premium per capacity workspace.
- **Data storage location:** When you need to store data in a specific geographic region, that's only possible with a Premium per capacity workspace (and the capacity is created in that region). For more information about data storage location, see the [Tenant setup](powerbi-implementation-planning-workspaces-tenant-level-planning.md) article.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering the workspace license type, key decisions and actions include:

> [!div class="checklist"]
> - **Consider which Premium features are required for each workspace:** Determine the feature requirements of each workspace and set the license type to Premium per capacity or PPU when necessary.
> - **Set the workspace license type:** Set each workspace license type according to which features are needed by the workspace, and which users you intend to access the workspace.

### Workspace properties

There are several workspace properties that can provide helpful information. For [governed workspaces](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-governance-level), we recommend that you set these properties.

Here are some suggestions for how to set them to improve the experience for your users.

- **Workspace description:** A good workspace description includes a brief, yet specific, explanation of what type of content can be found in the workspace. You can use up to 4000 characters to describe:
  - The purpose for the workspace
  - The target audience
  - Who to contact should there be any questions
  - The type of content published to the workspace
  - Whether the workspace is considered governed
  - Whether the workspace includes development, test, or production data
- **Workspace image:** Consistent use of workspace images can be helpful for users when they're scanning a list of workspaces. Consider using an image to help users determine:
  - The domain or subject area
  - Which business unit or team owns and manages the content
  - Whether it's a data workspace (one that's devoted to storing datasets and dataflows)
  - Whether it's a reporting workspace (one that's devoted to storing reports and dashboards)
- **Workspace contacts:** The workspace contact list includes the workspace administrators by default. If you have technical content owners that aren't the subject matter experts, you might find it helpful to specify other contacts. Other contacts could be a separate list of groups or individuals who can answer questions about the workspace content.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering the workspace properties, the key decisions and actions include:

> [!div class="checklist"]
> - **Specify the workspace description:** Ensure there's a helpful and thorough description included in the workspace description.
> - **Use a helpful image for the workspace:** Set a consistent image for the workspace that'll visually help users understand its subject area, who owns and manages content in the workspace, and/or the type of content in the workspace.
> - **Identify contacts for the workspace:** Verify whether the workspace administrators should be the workspace contacts, or whether specific users and groups should be specified.

### Workspace integration with ADLS Gen2

It's possible to connect a Power BI workspace to an Azure Data Lake Storage Gen2 (ADLS Gen2) account. There are two reasons you might do that:

- **Storage of dataflows data:** If you choose to bring-your-own-data-lake, the data for Power BI dataflows could be accessed directly in Azure. Direct access to [dataflow storage in ADLS Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) is helpful when you want other users or processes to view or access the data. It's especially helpful when your goal is to reuse dataflows data beyond Power BI. There are two choices for assigning storage:
  - [Tenant-level storage](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#tenant-level-storage), which is helpful when centralizing all data for the dataflows into one ADLS Gen2 account is desired.
  - [Workspace-level storage](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#workspace-level-storage), which is helpful when business units manage their own data lake or have certain data residency requirements.
- **Dataset backup and restore:** The [dataset backup and restore feature](/power-bi/enterprise/service-premium-backup-restore-dataset) is supported for workspaces that are assigned to Premium per capacity or PPU. This feature uses the same ADLS Gen2 account that's used for storing dataflows data (described in the previous bullet point). Dataset backups are helpful for:
  - Complying with data retention requirements
  - Storing routine backups as part of a disaster recovery strategy
  - Storing backups in another region
  - Migrating a data model

> [!IMPORTANT]
> Setting [Azure connections](/power-bi/admin/service-admin-portal-azure-connections) in the Power BI admin portal doesn't mean that all dataflows for the entire Power BI tenant are stored by default to an ADLS Gen2 account. To use an explicit storage account (instead of internal Power BI storage), each workspace must be explicitly connected. It's critical that you set the workspace Azure connections *prior to creating any dataflows* in the workspace.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering workspace integration with ADLS Gen2, key decisions and actions include:

> [!div class="checklist"]
> - **Decide whether the workspace will be used in ways that require Azure storage:** Consider whether a bring-your-own-data-lake scenario would be useful for the storage of dataflows and/or whether you have requirements to use the dataset backup and restore functionality.
> - **Determine which Azure storage account will be used:** Select an Azure Storage account that has the [hierarchical namespace](/azure/storage/blobs/data-lake-storage-namespace) enabled (ADLS Gen2) for tenant-level (centralized) storage of dataflows data or dataset backups. Ensure you have the Azure storage account information readily available.
> - **Configure the tenant-level storage account:** In the Power BI admin portal, set the tenant-level ADLS Gen2 storage account.
> - **Decide whether workspace administrators may connect a storage account:** Have discussions to understand the needs of decentralized teams, and whether individual teams are currently maintaining their own Azure Storage accounts. Decide whether this capability should be enabled.
> - **Configure the admin setting for workspace-level storage:** In the Power BI admin portal, enable the option that allows workspace administrators to connect their own storage account.
> - **Set the workspace-level Azure Storage connections:** Specify the Azure Storage account for each individual workspace. You must set the storage account prior to creating any dataflows in the workspace. If you intend to use dataset backups, ensure the workspace license type is set to Premium per capacity or PPU.
> - **Update your workspace management documentation:** Ensure that your workspace management documentation includes information about how to assign ADLS Gen2 storage accounts correctly. Make the information available in your centralized portal and training materials.

### Workspace integration with Azure Log Analytics

[Azure Log Analytics](/azure/azure-monitor/logs/log-analytics-overview) is a service within [Azure Monitor](/azure/azure-monitor/#features). You can use Azure Log Analytics to review diagnostic data generated by the Analysis Services engine, which hosts Power BI datasets. Azure Log Analytics is available only for Premium per capacity and PPU workspaces. Workspace-level logs are useful for analyzing performance and trends, performing data refresh analysis, analyzing XMLA endpoint operations, and more.

> [!NOTE]
> Although the names are similar, the data sent to [Azure Log Analytics](/power-bi/transform-model/log-analytics/desktop-log-analytics-overview) is slightly different from the data captured by the [Power BI activity log](/power-bi/admin/service-admin-auditing). The data sent to Azure Log Analytics is concerned with [events](/power-bi/transform-model/log-analytics/desktop-log-analytics-configure#events-and-schema) generated by the Analysis Services engine (for example, *Query begin* and *Query end* events). Conversely, the activity log is concerned with tracking [user activities](/power-bi/admin/service-admin-auditing#operations-available-in-the-audit-and-activity-logs) (for example, *View report* or *Edit report* events).

For more information about how to configure Azure Log Analytics for use with Power BI, see [Configuring Azure Log Analytics for Power BI](/power-bi/transform-model/log-analytics/desktop-log-analytics-configure). Be sure to understand the prerequisites you must have in place to make the integration work.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering workspace integration with Azure Log Analytics, key decisions and actions include:

> [!div class="checklist"]
> - **Decide whether workspace administrators can connect to Log Analytics:** Determine whether all, or some, workspace administrators will be permitted to use Azure Log Analytics for analyzing workspace-level logs. If access is to be restricted to only certain people, decide which group to use.
> - **Set up the tenant setting for Log Analytics connections:** In the admin portal, set the tenant setting according to the decision for which workspace administrators set connections.
> - **Set the Log Analytics workspace for each Power BI workspace:** In the Power BI service, specify the Azure Log Analytics information for each workspace. To capture workspace-level logs, ensure that the workspace license type is set to Premium per capacity or PPU.
> - **Update your workspace management documentation:** Ensure that your workspace management documentation includes information about how to assign a workspace to Azure Log Analytics.

### Other technical factors

There are other technical factors that may influence your workspace setup.

- If you integrate Power BI with other tools and services, there may be licensing implications. For example, if you embed a [Power Apps visual](/power-apps/maker/canvas-apps/powerapps-custom-visual) in a Power BI report, you'll need appropriate Power Apps licenses.
- There are [per-workspace storage limits](/power-bi/admin/service-admin-manage-your-data-storage-in-power-bi#shared-capacity-limits) that apply to the amount of data you can store in a Pro workspace. If using Power BI Premium or PPU isn't an option, consider how to work within the storage limits during the workspace planning process.
- When you install a [template app](/power-bi/connect-data/service-template-apps-install-distribute) from AppSource, it will create a new workspace that will have a narrow subject and scope.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering other technical factors, key decisions and actions include:

> [!div class="checklist"]
> - **Pay attention to technical factors:** As you work through the planning process, determine whether there's a technical reason (such as per-workspace storage limits) that could influence your decision-making process.
> - **Reorganize workspace content:** If storage limits could become a problem, create separate workspaces now and republish content to these new workspaces.

## Next steps

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).
