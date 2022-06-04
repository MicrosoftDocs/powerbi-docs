---
title: "Power BI implementation planning: Workspace-level workspace planning"
description: "TODO PBIIP workspaces - workspace-level planning"
author: peter-myers
ms.author: v-petermyers
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 06/30/2022
---

# Power BI implementation planning: Workspace-level workspace planning

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

To use workspaces most effectively, there are quite a few tactical decisions to be made. Individual workspace decisions should abide by [tenant-level decisions](powerbi-implementation-planning-workspaces-tenant-level-planning.md) when applicable.

## Workspace purpose

When planning for workspaces, it's important to consider not only the type of content it will store, but also the activities that the workspace is intended to support.

Consider the following two examples of finance-related workspaces. Although they're both dedicated to the same team, each workspace serves a different purpose:

- **Financial month-end workspace:** The *Financial month-end* workspace contains reconciliation and month-end closing reports. This workspace is considered an informal, collaborative, workspace. A Power BI app is not necessary for content viewers, since the primary use of this workspace is collaboration by a small group of people who work closely together. Most team members have permission to edit content in this workspace.
- **Financial reporting workspace:** The *Financial reporting* workspace contains the finalized, presentation-level reports. All reports in this workspace are required to use certified datasets. This workspace contains content that's broadly distributed throughout the organization to many viewers (including executives) using a Power BI app. Publishing content to this workspace involves an approval process. This workspace is closely governed. There will be three workspaces for development, test, and production.

With two examples in mind, the remainder of this section will further describe two specific aspects of purpose: intent for collaboration, and intent for viewing.

### Intent for collaboration

The primary objective for a workspace in the Power BI service is to facilitate [collaboration](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md#collaborate-in-a-workspace) among multiple people. Beyond Power BI Desktop, there are many ways that collaboration can happen in a workspace:

- **Team-based development:** Multiple people can work together to build, test, and publish content. One user may work on the design of an imported dataset, while other users build reports from that dataset using a Power BI live connection.
- **Testing and validations:** Users may need to perform data validations for a new report. Subject matter experts from the business unit may need to perform user acceptance testing, or a data quality team may need to validate the accuracy of a new data model.
- **Enhancements:** Stakeholders and consumers of the content may suggest enhancements to the content as circumstances change.
- **Ownership transfer:** Another person or team may [take over responsibility](powerbi-adoption-roadmap-content-ownership-and-management.md#ownership-transfers) for content that was started by someone else.

One of the key areas of the Power BI adoption roadmap is [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md). The type of collaboration that will occur in a workspace will differ based on the approach used for content ownership and management:

- **Business-led self-service BI:** Content is owned and managed by the content creators within a business unit or department. In this situation, most collaboration in the workspace is occurring among users within that business unit.
- **Managed self-service BI:** Data is owned and managed by a centralized team, whereas various content creators from business units take responsibility for reports and dashboards. In this situation, it's highly likely that multiple workspaces will be needed to securely facilitate collaboration by multiple teams of people.
- **Enterprise BI:** Content is owned and managed by a centralized team (such as IT, enterprise BI, or the Center of Excellence). In this situation, collaboration efforts in the workspace are occurring among users in the centralized team.

When considering your intentions for collaboration in a workspace, the key decisions and actions include:

> [!div class="checklist"]
> - **Consider expectations for collaboration:** Determine how workspace collaboration needs to occur and who is involved within a single team, or across organizational boundaries.
> - **Consider expectations for content ownership and management:** Consider how the different content ownership and management approaches (business-led self-service BI, managed self-service BI, and enterprise BI) will influence how you design and use workspaces.

> [!TIP]
> Be prepared to be flexible and use a different collaboration strategy for different workspaces, based on the situation as well as the team members that are involved. Also, expect to use different [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) approaches for different workspaces.

### Intent for content viewing

A secondary objective for a Power BI workspace is to distribute content to consumers who need to view the content. There are a few different ways to approach content distribution in the Power BI service:

- **Reports can be viewed using a Power BI app:** Every Power BI workspace can, optionally, have a Power BI app. A Power BI app is a more user-friendly experience than the workspace. In most situations, using a Power BI app is the best approach for distributing content to consumers.
- **Reports can be viewed directly in the workspace:** This is most appropriate for informal, collaborative, workspaces. Workspace roles define who can view or edit all the content contained in a workspace.
- **Reports can be shared:** Use of sharing (links or direct access) is useful for providing read-only access to one item within a workspace. Sharing can be thought of as an exception to workspace roles. Therefore, we recommend you use sharing as infrequently as possible.
- **Reports can be embedded into another application and viewed there:** Sometimes the intention is for consumers to view Power BI content that's been embedded into another application. Embedding is most useful when staying in the same application is helpful from a workflow perspective.

> [!NOTE]
> See the [content distribution and sharing](http://ToDo-NewPBIIPArticleOnContentDistAndSharing/) article for more information about deciding how to distribute content to users. For purposes of this article, we are focusing on content consumers as part of the workspace planning process.

One of the key areas of the Power BI adoption roadmap is [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md). The ways that a workspace will support content distribution will differ based on the content delivery scope:

- **Personal BI:** Intended for use by the creator. Since sharing content with others isn't an objective, personal BI is usually done within a personal workspace (discussed next).
- **Team BI:** Shares content with a relatively small number of colleagues who work closely together. In this situation, most workspaces are informal, collaborative workspaces.
- **Departmental BI:** Delivers content to a large number of consumers, who can belong to a department or business unit. In this situation, the workspace is primarily for collaboration efforts since content consumers rarely view content directly in the workspace.
- **Enterprise BI:** Delivers content broadly across organizational boundaries to the largest number of target consumers. In this situation, the workspace is primarily for collaboration efforts since content consumers rarely view content directly in the workspace.

When considering your expectations for how content viewing in a workspace, the key decisions and actions include:

> [!div class="checklist"]
> - **Consider expectations for viewing content:** Determine how you expect consumers to view content that's been published to a workspace. Consider if viewing will happen directly in the workspace directly or via another method.
> - **Determine who the content will be delivered to:** Consider who the target audience is. This information will be useful when you begin workspace role planning, including workspace license type (if you expect for there to be a significant number of content viewers).
> - **Evaluate needs for a Power BI app:** Consider what the workspace purpose is as it relates to what the content distribution needs are. If a Power BI app is required, that can influence decisions about creating a workspace.
> - **Consider expectations for content delivery scope:** Consider how the different content delivery scopes (personal BI, team BI, departmental BI, and enterprise BI) will influence how you design and use workspaces.

> [!TIP]
> Be prepared to be flexible and use a different content viewing strategy for different workspaces, based on the situation as well as the team members that are involved. Also, expect to use different [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md) approaches for different workspaces.

### Appropriate use of personal workspaces

There are two types of workspaces:

- **Personal workspaces:** Every Power BI user has a personal workspace. A personal workspace may be used for publishing content to the Power BI service. Its primary purpose is [personal BI scenarios](powerbi-implementation-planning-usage-scenario-personal-bi.md).
- **Workspaces:** The primary purpose of a [workspace](../collaborate-share/service-new-workspaces.md) is for multiple users to collaborate on [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md), [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md), and [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) scenarios. Secondarily, a workspace can also be used for viewing content.

Using a personal workspace for anything other than [personal BI](powerbi-adoption-roadmap-content-delivery-scope.md#personal-bi), temporary content, or testing purposes can be risky because content in a personal workspace is managed and maintained by one person. A personal workspace is, by its nature, not set up to collaborate with others.

Also, a personal workspace is limited in its options to share content with others. You may not publish an app from a personal workspace (and Power BI apps are a key element of distributing content to others in the organization). Sharing (links or direct access) is the only way to share content with others from a personal workspace. Extensive use of sharing involves additional maintenance to set permissions per individual artifact and increase the risk of permissions being improperly set.

When considering your expectations for how personal workspaces should be used, the key decisions and actions include:

> [!div class="checklist"]
> - **Understand current use of personal workspaces:** Have conversations with your users and review the activity log to ensure you have clarity on what users are currently doing with personal workspaces.
> - **Decide how personal workspaces should be used:** Decide how personal workspaces should (and should not) be used in your organization. Focus on balancing risk and ease of use with needs for content collaboration and viewing.
> - **Relocate content out of personal workspaces when appropriate:** For critical content, move content from personal workspaces to standard workspaces when appropriate.
> - **Create and publish documentation about personal workspaces:** Create useful documentation or FAQs for your users about how to effectively use personal workspaces. Make the information available in your centralized portal and training materials.

> [!NOTE]
> More information about activities such as creating a [centralized portal](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal), [training](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#training), and [documentation](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#documentation) can be found in the Power BI adoption roadmap.

## Workspace ownership

Understanding who will take responsibility for owning and managing content in a workspace is an important part of the planning process.

One of the most important things to consider when planning workspaces is what the [ownership and stewardship](powerbi-adoption-roadmap-content-ownership-and-management.md#ownership-and-stewardship) roles and responsibilities are. The goal is to have clarity on exactly who is accountable for creating, maintaining, publishing, securing, and supporting the content in each workspace.

When the intent for collaboration involves multiple teams beyond a single business unit, it can get more complicated to manage workspaces. Sometimes it's very helpful to create separate workspaces to clearly delineate which team is responsible for which content. Use of multiple workspaces allows you to be specific as to ownership and management responsibilities; it also helps set security according to the principle of least privilege.

> [!TIP]
> Your decisions related to accountability and responsibility will directly correlate with your actions related to defining [workspace access](#workspace-access) which is discussed later in this article.

When considering workspace ownership responsibilities, the key decisions and actions include:

> [!div class="checklist"]
> - **Define and document roles and responsibilities:** Ensure you have clear roles and responsibilities defined, and documented, for people who collaborate in workspaces. Make this information available in onboarding activities, training materials, and your centralized portal.
> - **Create a responsibility matrix:** Map out who is expected to handle what when creating, maintaining, publishing, securing, and supporting content. Have this information ready when you start planning for workspace access roles.
> - **Consider co-ownership or multi-team ownership situations:** Identify when a situation exists where it would be helpful to separate out workspaces so that responsibilities are clear.
> - **Create workspace management documentation:** Educate the workspace admins and members about how to manage workspace settings and access. Include responsibilities for workspace admins, members, and contributors. Make the information available in your centralized portal and training materials.

## Workspace organization

How to organize workspaces is one of the most important aspects of workspace planning.

### Workspace subject and scope

Different organizations will use workspaces in different ways depending on their requirements for collaboration. Different business units and departments may use workspaces slightly differently. It's important to have clear and consistent guidance for users on how workspaces should be used and what they contain.

The following are a few ideas on how workspaces can be organized by subject and scope.

#### Option 1: Workspace per subject area or project

Examples: Quarterly Financials or Product Launch Analysis

Creating one workspace for each subject area or project allows you to focus on the topical area. It's usually a balanced approach.

Pros:

- Managing user access for who is allowed to edit or view content is usually straightforward since it's scoped per subject area.
- When content will be utilized by users across organizational boundaries, structuring workspaces by subject area is usually more flexible and easier to manage (versus option 2 discussed next).
- Using a scope per subject area is a good compromise between workspaces that contain too many artifacts and workspaces that contain too few artifacts.

Cons:

- Depending on how narrow or wide workspaces are defined, there's still risk that many workspaces will be created. Finding the right content in the right workspace can be challenging for users if content is spread across many workspaces.

> [!TIP]
> When well-planned and managed, a workspace per subject area or project usually results in a manageable number of workspaces.

#### Option 2: Workspace per department or team

Examples: Finance Reporting or Sales Analytics

Creating one workspace per department (or team or business unit) is a frequently used technique. In fact, aligning with the organizational chart is the most common way people start with workspace planning. However, it's not ideal for all needs.

Pros:

- Getting started with planning is simple. All content needed by the people that work in that department will reside in one workspace.
- It's easy for users to know which workspace to use since all (or most) of their content is published to a specific workspace.
- Managing security roles can be simplified, particularly when Azure AD groups are used for workspace role assignments (which is a best practice).

Cons:

- The result is often an extremely broad workspace that contains many artifacts. A broadly defined workspace scope makes it more difficult for users to locate specific items.
- Since there is a 1:1 relationship between a workspace and a Power BI app, a broadly defined workspace will result in apps for users which have a lot of content to navigate. This can be mitigated with the use of menus in the app.
- If users from other departments need to view certain artifacts in the workspace, then managing permissions becomes more complex. There's a risk that people will assume that everything in the departmental workspace is for their eyes only. There's also a risk that use of sharing of individual artifacts will become overused to accomplish more flexible permissions per artifact within a single workspace.
- If some content creators need permission to edit some artifacts, but not all artifacts, that cannot be accomplished in a single workspace. Workspace roles (that define edit vs. view permissions) are defined at the workspace level.
- If you have a significant number of artifacts in a workspace, this often means you'll need to use strict naming conventions for artifacts so that users are able to find what they need.

> [!TIP]
> When creating workspaces in alignment with your org chart, you often end up with fewer workspaces. However, the workspaces can end up being very broad and contain a lot of content. Aligning workspaces per department or team is not usually recommended for large departments that expect to have a significant number of artifacts and/or many users.

#### Option 3: Workspace for a specific report or app

Examples: Daily Sales Summary or Executive Bonuses

Creating one workspace for each report or type of analysis is not recommended except for very specific circumstances.

Pros:

- The purpose for a narrowly defined workspace is very clear.
- Ultra-sensitive content can, and often should, be segregated into its own workspace so that it can be managed and governed explicitly.
- Fine-grained workspace permissions are applicable to a small number of artifacts. This is useful when, for instance, a user is permitted to edit one report but not another.

Cons:

- If overused, using narrowly defined workspaces results in an exceedingly large number of workspaces.
- Having a long list of workspaces to navigate through reduces the user experience. Although users can rely on search, finding the right content in the right workspace can be difficult and frustrating.
- When a larger number of workspaces exist, there's more work from an auditing and monitoring perspective.

> [!TIP]
> Creating a workspace for a narrow scope, such as an individual report, should be used for specific circumstances only. In other words, it should be the exception rather than the rule.

When considering the subject area and scope of workspace content, the key decisions and actions include:

> [!div class="checklist"]
> - **Assess how workspaces are currently set up:** Review how workspaces are being used currently. Identify what works well, what doesn't work well. Plan for potential changes and user education opportunities.
> - **Consider the best workspace scope:** Identify how you want workspaces to be used based on purpose, subject area, scope, and who is responsible for managing the content.
> - **Identify where highly sensitive content resides:** Consider when creating a specific workspace for highly sensitive content will be justified.
> - **Create and publish documentation about using workspaces:** Create useful documentation or FAQs for your users about how workspaces can be organized and used. Make this information available in training materials and your centralized portal.

### Workspace artifact types

Shared datasets, which are reused by many reports, can reside in separate workspaces from the reports. The advantages of decoupling datasets and reports are described in the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario.

Similarly, dataflows (which are reused by many datasets) can reside in a separate workspace from the datasets. The advantages of centralizing data preparation activities with dataflows are described in the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) scenario. The [advanced self-service data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) scenario builds further upon those concepts and introduces additional ways that workspaces can contribute to a modular structure for data reuse and enterprise scale.

Separating *data workspaces* from *reporting workspaces* is a common practice for supporting [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md).

Pros:

- Critical organizational data, including endorsed datasets, can reside in a specific workspace for that purpose. Report creators can then locate trustworthy datasets more easily.
- Access management can be centralized for critical organizational data. Managing access separately for the data workspace versus reporting workspace(s) is particularly useful when separate people are responsible for data versus visuals and reports. With managed self-service BI, it's common to have many more report creators (and very few dataset and dataflow creators).
- Limiting who can edit and manage datasets minimizes the risk of unintentional changes to a critical dataset. The physical separation reduces the chances of inadvertent, or unapproved, changes. This additional layer of protection is particularly helpful for certified datasets which have additional expectations as to quality and trustworthiness.
- Co-ownership scenarios are clarified. When shared datasets are delivered from a centralized BI or IT team, while reports are published by self-service content creators (in business units), it becomes extremely helpful to segregate the datasets into a separate workspace. This avoids the ambiguity of co-ownership scenarios because ownership and responsibility per workspace is more clearly defined.
- Row-level security is enforced, which is a significant advantage. Since most creators will work in different workspaces, and will not have edit permission to the dataset, that allows row-level security and/or object-level security to work.

Cons:

- A workspace naming convention is required to be able to distinguish a *data workspace* from a *reporting workspace*.
- Additional user education is required to ensure that content authors and consumers know where to publish and find content.
- Use of separate workspaces results in a larger number of workspaces to be managed and audited. As you plan for purpose, scope, and other considerations (such as the separation of development, test, and production content) the approach to workspace design can get more complicated.
- Additional change management processes may be required to track and prioritize requested changes to centralized datasets or dataflows. This is particularly true if report creators have requirements beyond what can be handled by composite models and report measures.

Separating [scorecards](../create-reports/service-goals-create.md) into their own workspace is also a useful technique. Using a separate workspace is particularly helpful when the scorecard presents goals that span multiple subject areas. It's also helpful to configure a distinct set of permissions for managing and viewing the scorecard.

When considering the types of artifacts to store in a workspace, the key decisions and actions include:

> [!div class="checklist"]
> - **Determine your objectives for data reuse:** Decide how to achieve dataset and dataflow reuse as part of a managed self-service BI strategy.
> - **Update the tenant setting for who may use datasets across workspaces:** Determine if this capability can be open to all users. If you decide to limit who can use datasets across workspaces, consider using a group such as *Power BI approved report creators*.

## Workspace access

Since the primary purpose of a workspace is collaboration, workspace access is mostly relevant for the people who own and manage the content in a workspace. It can also be relevant when the workspace is used for viewing content (a secondary purpose for workspaces, as described earlier in this article).

When starting to plan for workspace roles, it's helpful to be aware of the following:

- What are the expectations for how collaboration will occur in the workspace?
- Will the workspace be used directly for viewing content by consumers?
- Who will be responsible for managing the content in the workspace?
- Who will view content that's stored in the workspace?
- Is the intention to assign workspace roles based on individual or group?

It's a best practice to use groups for assigning workspace roles whenever practical. Security groups, mail-enabled security groups, distribution groups, and Microsoft 365 groups are all supported for workspace roles.

When planning for the use of groups, you might consider creating one group, per role, per workspace. For example, the groups for a Quarterly Financials workspace would include:

- Power BI workspace *admins* – Quarterly Financials
- Power BI workspace *members* – Quarterly Financials
- Power BI workspace *contributors* – Quarterly Financials
- Power BI workspace *viewers* – Quarterly Financials
- Power BI *app viewers* – Quarterly Financials

> [!TIP]
> Using the above technique provides flexibility. However, it does result in a great many groups to create and manage. A large volume of groups can be challenging if groups are only created and maintained by IT. This concern can be mitigated by allowing [self-service group management](/azure/active-directory/enterprise-users/groups-self-service-management#self-service-group-management-scenarios) to certain satellite members of the Center of Excellence, champions, or trusted users who have been trained in how to manage role memberships for their business unit.

If data workspaces are separated from reporting workspaces, as discussed earlier in this article, this results in an even larger number of groups. Our example above could be expanded to:

- Power BI *data workspace admins* – Quarterly Financials
- Power BI *reporting workspace admins* – Quarterly Financials
- Power BI *data workspace members* – Quarterly Financials
- Power BI *reporting workspace members* – Quarterly Financials
- Power BI *data workspace contributors* – Quarterly Financials
- Power BI *reporting workspace contributors* – Quarterly Financials
- Power BI *data workspace viewers* – Quarterly Financials
- Power BI *reporting workspace viewers* – Quarterly Financials
- Power BI *app viewers* – Quarterly Financials

If multiple workspaces exist for development, test, and production, this results in an even larger number of groups. Using just one example from above (workspace admins), the groups would be expanded to:

- Power BI data workspace admins – Quarterly Financials *\[Dev\]*
- Power BI data workspace admins – Quarterly Financials *\[Test\]*
- Power BI data workspace admins – Quarterly Financials

The previous examples are intended to convey that the use of groups, in conjunction with workspace roles, can get out of control quickly.

The effective use of groups for workspace roles requires quite a bit of consideration and planning. Be prepared to encounter situations when existing groups (that are usually aligned with the org chart) don't meet all your needs for managing Power BI content. In this case, we recommend creating groups specifically for this purpose. That's why Power BI is included in the group name examples shown above.

The above examples showed one workspace (Quarterly Financials) but oftentimes it is possible to manage a collection of workspaces with one set of groups. For example, multiple workspaces owned and managed by the finance team might be able to use the same groups.

> [!NOTE]
> You'll often do security planning more broadly. This can also include dataset read and build permissions, row-level security. See the [security and data protection](http://todo-newpbiiparticle/) article for more information about what to consider for security planning. For purposes of this article, we are focusing on workspace roles as part of the workspace planning process.

When considering workspace access, the key decisions and actions include:

> [!div class="checklist"]
> - **Refer to roles and responsibilities:** Use the roles and responsibilities information prepared earlier to plan for workspace roles.
> - **Identify who will own and manage the content:** Verify that all the artifacts you expect to store in a single workspace aligns with the people who will take responsibility for owning and managing the content. If there are mismatches, reconsider how the workspaces are organized.
> - **Identify who will view content in the workspace:** Determine if there will be any content viewing occurring directly from the workspace.
> - **Plan for the workspace roles:** Determine which people are suited to the admin, member, contributor, and viewer roles for each workspace.
> - **Decide on group or individual role assignments:** Determine if you intend to manage workspace role assignments by individual person, or with groups. Check if there are existing groups that can be used for workspace role assignments.
> - **Determine if new groups need to be created:** Consider if you need to create a new group per workspace role. Carefully evaluate this, as it can result in many groups to be created and maintained. Determine what the process is when a new workspace is created, and related groups also need to be created.
> - **Configure and test the workspace role assignments:** Verify that the different types of users have the functionality they need.

## Workspace settings

There are several settings that need to be specified for each individual workspace. The settings can significantly influence how collaboration occurs, who is allowed to access the workspace, and the level of data reusability outside of Power BI.

### Workspace license type

Each workspace has a [license type](../collaborate-share/service-create-the-new-workspaces.md#premium-capacity-settings) of Power BI Pro, Premium per user (PPU), Premium per capacity, or Embedded. The license type is very important for workspace planning because:

- **Features:** Certain features, such as deployment pipelines and paginated reports, aren't supported in a Pro workspace.
- **License type:** The license type has a direct correlation on who can access content in the workspace:
  - A PPU workspace can only be accessed by users who have a PPU license (in addition to being assigned a workspace role).
  - If you expect to deliver content to many content viewers who have a free Power BI license, you'll need Premium per capacity. This is commonly referred to as a P SKU.
- **Data storage location:** If you need to store data in a specific geographic region, that's a feature supported by Premium per capacity (and not available with PPU licensing). If you need to store data in a specific geographic region, that's a feature supported by Premium per capacity (and not available with PPU licensing). See the [tenant-level planning](powerbi-implementation-planning-workspaces-tenant-level-planning.md) article for more details about data storage location.

When considering the workspace license type, the key decisions and actions include:

> [!div class="checklist"]
> - **Consider which Premium features are required for each workspace:** Analyze each workspace, including which features require use or Power BI Premium or PPU.
> - **Update workspace type:** Set each workspace license type according to which features are needed by the workspace, and which users you intend to access the workspace.

### Workspace properties

There are a several workspace properties to set up. Here are a few suggestions for how to set the properties to improve your users' experience:

- **Workspace description:** A great workspace description includes a brief, yet specific, explanation of what type of content can be found in the workspace. It's an excellent place to include things like:
  - Purpose for the workspace.
  - Target audience.
  - Who to contact with questions.
  - The type of content published to the workspace.
  - If the workspace is considered governed.
  - If the workspace includes development, test, or production data.
- **Workspace image:** Consistent use of workspace images are very helpful to users when they are scanning a workspace list. Ways you can use an image include identifying:
  - The domain or subject area.
  - Which business unit or team owns and manages the content.
  - If it's a *data workspace* (one that's devoted to storing datasets and dataflows).
  - If it's a *reporting workspace* (one that's devoted to storing reports and dashboards).
- **Workspace contacts:** The contact list includes the workspace admins by default. If you have technical content owners that are separate from subject matter experts, you may find it helpful to specify different contacts. This can be a separate list of groups or individuals who can answer questions about the content in the workspace.

When considering the workspace settings, the key decisions and actions include:

> [!div class="checklist"]
> - **Specify the workspace description:** Ensure there's a helpful and thorough description included in the workspace description.
> - **Use a helpful image for the workspace:** Set a consistent image for the workspace that'll visually help users understand its subject area, who owns and manages content in the workspace, and/or the type of content in the workspace.
> - **Identify contacts for the workspace:** Verify if the workspace admins should be set in the contact list, or if specific users and groups should be specified.

### Workspace integration with ADLS Gen2

It's possible to connect a Power BI workspace to an Azure Data Lake Storage Gen2 (ADLS Gen2) account. There are two main reasons you may consider doing this:

- **Storage of dataflows data:** If you choose to *bring-your-own-data-lake*, the data for Power BI dataflows could be accessed directly in Azure. Direct access to [dataflow storage in ADLS Gen2](../transform-model/dataflows/dataflows-azure-data-lake-storage-integration.md) is helpful if you want other users or processes to view or access the data. That's helpful when your goal is to reuse the dataflows data beyond Power BI alone. There are two choices for assigning storage:
  - [Tenant-level storage](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#tenant-level-storage) can be used. It's helpful when centralizing all data for the dataflows into one ADLS Gen2 account is desired.
  - [Workspace-level storage](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md#workspace-level-storage) can be used. That's helpful if business units manage their own data lake or have certain data residency requirements.
- **Dataset backup and restore:** For workspaces that are assigned to Premium capacity or PPU, the [dataset backup and restore](../enterprise/service-premium-backup-restore-dataset.md) feature is available. This functionality uses same ADLS Gen2 account that's used for storage of dataflows data (described in the previous bullet point). Dataset backups are helpful for:
  - Complying with data retention requirements.
  - Storing routine backups as part of a disaster recovery strategy.
  - Storing backups in another region.
  - Migrating a data model.

> [!IMPORTANT]
> Setting [Azure connections](../admin/service-admin-portal-azure-connections.md) in the Power BI admin portal does not mean that all dataflows throughout the entire Power BI tenant are stored to an ADLS Gen2 account by default. To use an explicit storage account (instead of internal Power BI storage), each workspace must be specifically connected. It's critical to set the workspace Azure connections *prior to creating any dataflows* in the workspace.

When considering the workspace integration with Azure Data Lake Storage Gen2, the key decisions and actions include:

> [!div class="checklist"]
> - **Decide if a specific Azure storage account is useful:** Consider if a bring-your-own-data-lake scenario would be useful for the storage of dataflow and/or if you have requirements to use the dataset backup and restore functionality.
> - **Determine which Azure storage account will be used:** Select an Azure Storage account that has the hierarchical namespace enabled (ADLS Gen2) to be used for tenant-level (centralized) storage of dataflows data or dataset backups. Ensure you have the Azure storage account information readily available.
> - **Configure the tenant-level storage account:** In the Power BI service admin portal, set the tenant-level ADLS Gen2 storage account.
> - **Decide if workspace admins may connect a storage account:** Have discussions to understand the needs of decentralized teams, and if individual teams are currently maintaining their own Azure Storage accounts. Decide if this capability may be enabled.
> - **Configure the admin setting for workspace-level storage:** In the Power BI service admin portal, enable the option for workspace admins to connect their own storage account.
> - **Set the workspace-level Azure Storage connections:** Specify the Azure Storage account for each individual workspace. This needs to be done prior to creating any dataflows in the workspace. If you intend to use dataset backups, ensure the workspace type is set to Premium capacity or PPU.
> - **Include in your workspace management documentation:** Ensure that your workspace management documentation includes information about how to assign ADLS Gen2 storage accounts correctly. Make the information available in your centralized portal and training materials.

### Workspace integration with Azure Log Analytics

Azure Log Analytics is a service within [Azure Monitor](/azure/azure-monitor/overview). Azure Log Analytics can be used to review diagnostic data generated by the Analysis Services engine that powers datasets. Use of Azure Log Analytics is available for workspaces assigned to a Premium or PPU license type. Workspace-level logs are useful for things like analyzing performance and trends, doing data refresh analysis, and analyzing XMLA endpoint operations.

> [!NOTE]
> Although the names are similar, the data sent to [Azure Log Analytics](../transform-model/log-analytics/desktop-log-analytics-overview.md) is a little different from the data captured by the [Power BI activity log](../admin/service-admin-auditing.md). The data sent to Azure Log Analytics is focused on [events](../transform-model/log-analytics/desktop-log-analytics-configure.md#events-and-schema) generated by the Analysis Services engine (for example, query begin and query end). Whereas the activity log is focused on tracking [user activities](../admin/service-admin-auditing.md#operations-available-in-the-audit-and-activity-logs) (for example, view report or edit report).

Refer to [this article](../transform-model/log-analytics/desktop-log-analytics-configure.md) for how to configure Azure Log Analytics for use with Power BI. Note there are several prerequisites to make the integration work.

> [!TIP]
> The use of Azure Log Analytics for a Power BI workspace is a Premium feature. Therefore, Azure Log Analytics will only appear in the Azure Connections settings for a workspace if the workspace has been assigned to Premium capacity or PPU.

When considering the workspace integration with Azure Log Analytics, the key decisions and actions include:

> [!div class="checklist"]
> - **Decide if workspace administrators may connect to Log Analytics:** Determine if all, or some, workspace admins will be permitted to use Azure Log Analytics for analyzing workspace-level logs. If restricted to only certain people, decide which group to use.
> - **Configure the tenant setting for Log Analytics connections:** Set the tenant setting in the admin portal according to the decision for which workspace admins may use this capability.
> - **Set the Log Analytics workspace for each Power BI workspace:** Specify the Azure Log Analytics information for each individual workspace in the Power BI service. Ensure the workspace type is set to Premium capacity or PPU to be able to capture workspace-level logs.
> - **Include in your workspace management documentation:** Ensure that your workspace management documentation includes information about assign a workspace to Azure Log Analytics.

### Other technical factors

There are also various technical factors that influence your decisions about workspace design. Examples include:

- If you integrate Power BI with other tools and services, there may be licensing implications. For example, if you embed a [Power Apps visual](/power-apps/maker/canvas-apps/powerapps-custom-visual) within a Power BI report then you'll need to factor in Power Apps licensing.
- There are [per-workspace storage limits](../admin/service-admin-manage-your-data-storage-in-power-bi.md#shared-capacity-limits) that apply to the amount of data that can be stored in a Pro workspace. If using Power BI Premium or PPU isn't a viable option, storage limits can influence your workspace planning process.
- When you install a [template app](../connect-data/service-template-apps-install-distribute.md) from AppSource, it will create a new workspace. The result is a new workspace for a narrow subject and scope.

When considering other technical factors, the key decisions and actions include:

> [!div class="checklist"]
> - **Pay attention to technical factors:** As you go through the planning process, determine if there's a technical reason (such as per-workspace storage limits) that influence your decision-making process.
> - **Reorganize workspace content:** If applicable, create separate workspaces and republish content to the new workspaces.

## Next steps

In the [next article](powerbi-implementation-planning-workspaces-auditing.md) in this series, learn about workspace auditing.
