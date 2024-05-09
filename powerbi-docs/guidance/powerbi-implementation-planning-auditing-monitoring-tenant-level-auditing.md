---
title: "Power BI implementation planning: Tenant-level auditing"
description: "Learn about tenant-level auditing planning for Power BI."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat, has-azure-ad-ps-ref, azure-ad-ref-level-one-done
ms.date: 03/06/2024
---

# Power BI implementation planning: Tenant-level auditing

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This tenant-level audit planning article is primarily targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators might need to collaborate with IT, security, internal audit, and other relevant teams.
- **Center of Excellence, IT, and BI team:** The teams that are also responsible for overseeing Power BI. They might need to collaborate with Power BI administrators and other relevant teams.

> [!IMPORTANT]
> We recommend that you closely follow the [Power BI release plan](https://powerbi.microsoft.com/roadmap/) to learn about future enhancements of the auditing and monitoring capabilities.

The purpose of a tenant-level audit solution is to capture and analyze data for all users, activities, and solutions deployed to a Power BI tenant. This tenant-level auditing data is valuable for many purposes, allowing you to analyze adoption efforts, understand usage patterns, educate users, support users, mitigate risk, improve compliance, manage license costs, and monitor performance.

Creating an end-to-end auditing solution that's secure and production-ready is a significant project that takes time. Think of it as building business intelligence on business intelligence (BI on BI). For information about why the auditing data is so valuable, see [Auditing and monitoring overview](powerbi-implementation-planning-auditing-monitoring-overview.md).

For report-level auditing, which is targeted at report creators, see [Report-level auditing](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md).

For auditing data assets, which is targeted at data creators, see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).

The remainder of this article focuses on tenant-level auditing.

> [!TIP]
> The primary focus of this article is to help you plan to create an end-to-end auditing solution. Because the content in this article is organized into four phases, you'll need information across multiple phases. For example, you'll find information in Phase 1 about planning to use a service principal, and information in Phase 2 about prerequisites and setup.
>
> Therefore, we recommend that you read this entire article first so that you'll be familiar with what's involved. Then you should be well-prepared to plan and build your auditing solution in an iterative manner.

When you plan to build a tenant-level auditing solution, plan to spend time on the following four phases.

- **Phase 1: Planning and decisions**
  - [Requirements and priorities](#requirements-and-priorities)
  - [Data needs](#data-needs)
  - [Type of auditing solution](#type-of-auditing-solution)
  - [Permissions and responsibilities](#permissions-and-responsibilities)
  - [Technical decisions](#technical-decisions)
  - [Data source decisions](#data-source-decisions)
- **Phase 2: Prerequisites and setup**
  - [Create storage account](#create-storage-account)
  - [Install software and set up services](#install-software-and-set-up-services)
  - [Register a Microsoft Entra application](#register-a-microsoft-entra-application)
  - [Set Power BI tenant settings](#set-power-bi-tenant-settings)
- **Phase 3: Solution development and analytics**
  - [Extract and store the raw data](#extract-and-store-the-raw-data)
  - [Create the curated data](#create-the-curated-data)
  - [Create a data model](#create-a-data-model)
  - [Enhance the data model](#enhance-the-data-model)
  - [Create analytical reports](#create-analytical-reports)
  - [Take action based on the data](#take-action-based-on-the-data)
- **Phase 4: Maintain, enhance, and monitor**
  - [Operationalize and improve](#operationalize-and-improve)
  - [Documentation and support](#documentation-and-support)
  - [Enable alerting](#enable-alerting)
  - [Ongoing management](#ongoing-management)

## Phase 1: Planning and decisions

The first phase focuses on planning and decision-making. There are many requirements and priorities to consider, so we recommend that you spend sufficient time to understand the topics introduced in this section. The goal is to make good upfront decisions so that the downstream phases run smoothly.

:::image type="content" source="media/powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing/tenant-level-auditing-phase-1.svg" alt-text="Flow diagram describing Phase 1, which focuses on planning and decisions for building a tenant-level auditing solution." border="false":::

### Requirements and priorities

In the initial phase, the goal is to identify what's most important. Focus on what matters most, and how you're going to measure impact in your organization. Strive to define business-oriented requirements rather than technology-oriented requirements.

Here are some questions you should answer.

- **What key questions do you need to answer?** There's a large volume of auditing data you can explore. The most effective way to approach auditing is to focus on answering specific questions.
- **What are your [adoption](fabric-adoption-roadmap.md) and [data culture](fabric-adoption-roadmap-data-culture.md) goals?** For example, perhaps you have a goal to increase the number of self-service BI content creators in the organization. In that case, you'll need to measure user activities related to creating, editing, and publishing content.
- **What immediate risks are present?** For example, you might know oversharing of content has occurred in the past. User training has since been enhanced, and you now want to audit security settings and activities on an ongoing basis.
- **Are there current key performance indicators (KPIs) or organizational goals?** For example, perhaps you have an organizational KPI that relates to digital transformation or becoming a more data-driven organization. Tenant-level auditing data can help you measure whether your Power BI implementation is aligned with these goals.

> [!TIP]
> Verify auditing requirements and set priorities with your [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md) and [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md). It's tempting to extract auditing data and start creating reports based on a lot of interesting data. However, it's unlikely that you'll derive high value from your auditing solution when it isn't driven by questions you need to answer and actions you intend to take.

For more ideas about ways that you can use auditing data, see [Auditing and monitoring overview](powerbi-implementation-planning-auditing-monitoring-overview.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When identifying requirements and priorities, key decisions and actions include:

> [!div class="checklist"]
> - **Identify requirements:** Collect and document the key business requirements for auditing your Power BI tenant.
> - **Prioritize requirements:** Set priorities for the requirements, classifying them as immediate, short-term, medium-term, and long-term (backlog).
> - **Make a plan for the immediate priorities:** Put a plan in place to begin collecting data so that it's available when you need it.
> - **Reassess requirements regularly:** Create a plan to reassess requirements on a regular basis (for example, twice per year). Verify whether the auditing and monitoring solution meets the stated requirements. Update action items on your plan as necessary.

### Data needs

Once you've defined the requirements and priorities (described [previously](#requirements-and-priorities)), you're ready to identify the data that you'll need. Four categories of data are covered in this section.

- [User activity data](#user-activity-data)
- [Tenant inventory](#tenant-inventory)
- [Users and groups data](#users-and-groups-data)
- [Security data](#security-data)

Most of the data that you'll need comes from the [admin APIs](/rest/api/power-bi/admin), which provide a wealth of metadata about the Power BI tenant. For more information, see [Choose a user API or admin API](#choose-a-user-api-or-admin-api) later in this article.

#### User activity data

Make it your first priority to obtain data about user activities. The _user activities_, which are also called _events_ or _operations_, are useful for a wide variety of purposes.

Most often, this data is referred to as the _activity log_ or the _event log_. Technically, there are several ways to acquire user activity data (the activity log being one method). For more information about the decisions and activities involved, see [Access user activity data](#access-user-activity-data) later in this article.

Here are some common questions that user activity data can answer.

- **Find top users and top content**
  - What content is viewed most often and by which users?
  - What are the daily, weekly, and monthly trends for viewing content?
  - Are report views trending up or down?
  - How many users are active?
- **Understand user behavior**
  - What type of security is used most often (apps, workspaces, or per-item sharing)?
  - Are users using browsers or mobile apps most often?
  - Which content creators are most actively publishing and updating content?
  - What content is published or updated, when, and by which users?
- **Identify user education and training opportunities**
  - Who is doing (too much) sharing from their personal workspace?
  - Who is doing a significant amount of exporting?
  - Who is regularly downloading content?
  - Who is publishing many new semantic models—[previously known as datasets](../connect-data/service-datasets-rename.md)?
  - Who is using subscriptions heavily?
- **Improve governance and compliance efforts**
  - When are tenant settings changed, and by which Power BI administrator?
  - Who started a Power BI trial?
  - What content is accessed by external users, who, when, and how?
  - Who added or updated a sensitivity label?
  - What percentage of report views are based on certified semantic models?
  - What percentage of semantic models support more than one report?
  - When is a gateway or data source created or updated, and by which user?

For more information about ways to use this data, see [Understand usage patterns](powerbi-implementation-planning-auditing-monitoring-overview.md#understand-usage-patterns).

> [!IMPORTANT]
> If you're not already extracting and storing user activities data, make that an urgent priority. At a minimum, ensure that you extract the raw data and store it in a secure location. That way, the data will be available when you're ready to analyze it. History is available for 30 days or 90 days, depending on the source you use.

For more information, see [Access user activity data](#access-user-activity-data) later in this article.

#### Tenant inventory

Often, the second priority is to retrieve the data to create a _tenant inventory_. Sometimes it's referred to as _workspace inventory_, _workspace metadata_, or _tenant metadata_.

A tenant inventory is a snapshot at a given point in time. It describes what's published in the tenant. The tenant inventory doesn't include the actual data or the actual reports. Rather, it's metadata that describes all workspaces and their items (such as semantic models and reports).

Here are some common questions that the tenant inventory can answer.

- **Understand how much content you have and where**
  - Which workspaces have the most content?
  - What type of content is published in each workspace (particularly when you're separating reporting workspaces and data workspaces)?
  - What dependencies exist between items (such as dataflows that support many semantic models, or a semantic model that's a source for other composite models)?
  - What is the data lineage (dependencies between Power BI items, including external data sources)?
  - Are there orphaned reports (which are disconnected from their semantic model)?
- **Understand the ratio of semantic models to reports**
  - How much semantic model reuse is occurring?
  - Are there duplicate, or highly similar, semantic models?
  - Are there opportunities to consolidate semantic models?
- **Understand trends between points in time**
  - Is the number of reports increasing over time?
  - Is the number of semantic models increasing over time?
- **Find unused content**
  - Which reports are unused (or under-utilized)?
  - Which semantic models are unused (or under-utilized)?
  - Are there opportunities to retire content?

A tenant inventory helps you to use current names when analyzing historical activities. The snapshot of the items in your tenant contains the names of all items _at that point in time_. It's helpful to use current item names for historical reporting. For example, if a report was renamed three months ago, the activity log at that time records the old report name. With a properly defined data model, you can use the latest tenant inventory to locate an item by its current name (rather than its former name). For more information, see [Create a data model](#create-a-data-model) later in this article.

For more information about ways to use a tenant inventory, see [Understand published content](powerbi-implementation-planning-auditing-monitoring-overview.md#understand-published-items).

> [!TIP]
> You'll often use combine the user activity events (described in the [previous section](#user-activity-data)) and the tenant inventory to produce a complete picture. That way, you enhance the value of all of the data.

Because a tenant inventory is a snapshot at a given point in time, you'll need to decide how often to extract and store the metadata. A weekly snapshot is useful for making comparisons between the two points in time. For example, if you want to investigate security settings for a workspace, you'll need the previous tenant inventory snapshot, the activity log events, and the current tenant inventory snapshot.

There are two main ways to build a tenant inventory. For more information about the decisions and activities involved, see [Access tenant inventory data](#access-tenant-inventory-data) later in this article.

#### Users and groups data

As your analytical needs grow, you'll likely determine that you'd like to include data about users and groups in your end-to-end auditing solution. To retrieve that data, you can use [Microsoft Graph](/graph/overview-major-services), which is the authoritative source for information about Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)) users and groups.

Data that's retrieved from the Power BI REST APIs includes an email address to describe the user, or the name of a security group. This data is a snapshot at a given point in time.

Here are some common questions that Microsoft Graph can answer.

- **Identify users and groups**
  - What's the full username (in addition to the email address), department, or location sourced from their [user profile](/azure/active-directory/fundamentals/active-directory-users-profile-azure-portal)?
  - Who are the members of a [security group](/azure/active-directory/fundamentals/concept-learn-about-groups)?
  - Who's the [owner](/azure/active-directory/fundamentals/how-to-manage-groups#add-or-remove-members-and-owners) of a security group (to manage members)?
- **Obtain additional user information**
  - Which [licenses](/azure/active-directory/fundamentals/license-users-groups)—Power BI Pro or Power BI Premium Per User (PPU)—are assigned to users?
  - Which users [sign in](/azure/active-directory/reports-monitoring/concept-sign-ins) most frequently?
  - Which users haven't signed in to the Power BI service recently?

> [!WARNING]
> Some older methods (which are extensively documented online) for accessing users and groups data are deprecated and shouldn't be used. Whenever possible, use Microsoft Graph as the authoritative source of users and groups data.

For more information and recommendations about how to access data from Microsoft Graph, see [Access user and groups data](#access-user-and-group-data) later in this article.

#### Security data

You might have a requirement to perform regular security audits.

Here are some common questions that the [Power BI REST APIs](/rest/api/power-bi/) can answer.

- **Identify people and applications**
  - Which reports does a user, group, or service principal have access to?
  - Which users, groups, or service principals are subscribers to receive reports with an [email subscription](powerbi-implementation-planning-security-content-creator-planning.md#email-subscriptions)?
- **Understand content permissions**
  - Which [workspace roles](powerbi-implementation-planning-security-content-creator-planning.md#workspace-roles) are assigned to which users and groups?
  - Which users and groups are assigned to each [Power BI app audience](powerbi-implementation-planning-security-report-consumer-planning.md#app-audience)?
  - Which [per-item permissions](powerbi-implementation-planning-security-report-consumer-planning.md#per-item-permissions) are assigned, for which reports, and for which users?
  - Which [per-item permissions](powerbi-implementation-planning-security-report-consumer-planning.md#per-item-permissions) are assigned, for which semantic models, and for which users?
  - Which semantic models and datamarts have [row-level security](powerbi-implementation-planning-security-report-consumer-planning.md#row-level-security) (RLS) defined?
  - Which items are [shared to people in the entire organization](../collaborate-share/service-share-dashboards.md)?
  - Which items are published [publicly on the internet](powerbi-implementation-planning-security-content-creator-planning.md#publish-to-web)?
- **Understand other permissions**
  - Who has permission to publish by using a [deployment pipeline](powerbi-implementation-planning-security-content-creator-planning.md#deployment-pipeline-access)?
  - Who has permission to manage [gateways](/data-integration/gateway/manage-security-roles#gateway-roles) and [data connections](/data-integration/gateway/manage-security-roles#connection-roles)?
  - Who has permission to manage a [Premium capacity](../enterprise/service-admin-premium-manage.md#manage-user-permissions)?

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

> [!TIP]
> For more considerations about security, see the [security planning](powerbi-implementation-planning-security-overview.md) articles.

These common questions aren't an exhaustive list; there are a wide variety of Power BI REST APIs available. For more information, see [Using the Power BI REST APIs](/rest/api/power-bi/).

For more information about using the admin APIs versus user APIs (including how it affects permissions that are required for the user who's extracting the data), see [Choose a user API or admin API](#choose-a-user-api-or-admin-api) later in this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When identifying the data that's needed for auditing, key decisions and actions include:

> [!div class="checklist"]
> - **Identify specific data needs for user activity data:** Validate the requirements you've collected. Identify which auditing data is necessary to meet each requirement for user activity data.
> - **Identify specific data needs for tenant inventory data:** Validate the requirements you've collected. Identify which auditing data is necessary to compile a tenant inventory.
> - **Identify specific data needs for users and groups data:** Validate the requirements you've collected. Identify which auditing data is necessary to meet each requirement for users and groups data.
> - **Identify specific data needs for security data:** Validate the requirements you've collected. Identify which auditing data is necessary to meet each requirement for security data.
> - **Verify priorities:** Verify the order of priorities so you know what to develop first.
> - **Decide how often to capture activities:** Decide how frequently to capture activity events (such as once per day).
> - **Decide how often to capture snapshots:** Decide what interval to capture snapshot data, such as a tenant inventory or the users and groups data.

### Type of auditing solution

Tenant-level auditing is either done manually or with automated processes.

Most new auditing processes start off as a manual process, particularly during development and while testing occurs. A manual auditing process can evolve to become an automated process. However, not every auditing process needs to be fully automated.

#### Manual auditing processes

Manual auditing relies on scripts and processes that are run on-demand by a user (usually a Power BI administrator). When needed, the user runs queries _interactively_ to retrieve auditing data.

Manual auditing is best suited to:

- New scripts that are being developed and tested.
- Occasional, one-off auditing needs.
- Exploratory auditing needs.
- Nonessential auditing processes that don't require full support.

#### Automated auditing processes

Auditing data that's needed on a recurring basis should be automated. It's extracted and processed on a regular schedule, and it's known as an _automated process_. Sometimes it's referred to as an _unattended process_.

The goals of an automated process are to reduce manual effort, reduce risk of error, increase consistency, and eliminate the dependency on an individual user to run it.

Automated auditing is best suited to:

- Auditing processes that run in production.
- Unattended processes that run on a regular schedule.
- Scripts that have been fully tested.
- Essential auditing processes that have other reports (or other processes) that depend on it as a data source.
- Auditing processes that are documented and supported.

The type of process—manual or automated—might impact how you handle authentication. For example, a Power BI administrator might use user authentication for a manual auditing process but use a service principal for an automated process. For more information, see [Determine the authentication method](#determine-the-authentication-method) later in this article.

> [!TIP]
> If there's a regular, recurring, need to obtain auditing data that's currently handled manually, consider investing time to automate it. For example, if a Power BI administrator manually runs a script every day to retrieve data from the Power BI activity log, there's a risk of missing data should that person be ill or away on vacation.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering the type of auditing solution to develop, key decisions and actions include:

> [!div class="checklist"]
> - **Determine the primary purpose for each new auditing requirement:** Decide whether to use a manual or automated process for each new requirement. Consider whether that decision is temporary or permanent.
> - **Create a plan for how to automate:** When it's appropriate for a particular auditing requirement, create a plan for how to automate it, when, and by whom.

### Permissions and responsibilities

At this point, you should have a clear idea of what you want to accomplish and the data you'll initially need. Now's a good time to make decisions about user permissions as well as roles and responsibilities.

#### User permissions

As you plan to build an end-to-end auditing solution, consider user permissions for other users who will need to access the data. Specifically, decide who will be permitted to access and view auditing data.

Here are some considerations to take into account.

##### Direct access to auditing data

You should decide who can access the auditing data directly. There are multiple ways to think about it.

- **Who should be a Power BI administrator?** A Power BI administrator has access to all tenant metadata, including the [admin APIs](/rest/api/power-bi/admin). For more information about deciding who should be a Power BI administrator, see [Tenant-level security planning](powerbi-implementation-planning-security-tenant-level-planning.md#power-bi-administration).
- **Who can use an existing service principal?** To use a service principal (instead of user permissions) to accessing auditing data, a secret must be provided to authorized users so they can perform password-based authentication. Access to secrets (and keys) should be very tightly controlled.
- **Does access need to be tightly controlled?** Certain industries with regulatory and compliance requirements must control access more tightly than other industries.
- **Are there large activity data volumes?** To avoid reaching API throttling limits, you might need to tightly control who's allowed to directly access the APIs that produce auditing data. In this case, it's helpful to ensure that there aren't duplicate or overlapping efforts.

##### Access to extracted raw data

You should decide who can view the raw data that's extracted and written to a storage location. Most commonly, access to raw data is restricted to administrators and auditors. The Center of Excellence (COE) might require access as well. For more information, see [Determine where to store audit data](#determine-where-to-store-audit-data) later in this article.

##### Access to curated analytical data

You should decide who can view the curated and transformed data that's ready for analytics. This data should always be made available to administrators and auditors. Sometimes a data model is made available to other users in the organization, particularly when you create a Power BI semantic model with row-level security. For more information, see [Plan to create curated data](#plan-to-create-curated-data) later in this article.

#### Roles and responsibilities

Once you've decided how user permissions work, you're in a good position to start thinking about roles and responsibilities. We recommend that you involve the right people early on, especially when multiple developers or teams will be involved in building the end-to-end auditing solution.

Decide which users or team will be responsible for the following activities.

| **Role** | **Types of responsibilities** | **Role typically performed by** |
| --- | --- | --- |
| Communicate to stakeholders | Communication activities and requirements gathering. | COE in partnership with IT. Might also include select people from key business units. |
| Decide priorities, and provide direction on requirements | Decision-making activities related to the end-to-end auditing solution, including how to meet requirements. | The team that oversees Power BI in the organization, such as the COE. The executive sponsor or a data governance steering committee could become involved to make critical decisions or escalate issues. |
| Extract and store the raw data | Creation of scripts and processes to access and extract the data. Also involves writing the raw data to storage. | Data engineering staff, usually in IT and in partnership with the COE. |
| Create the curated data | Data cleansing, transformation, and the creation of the curated data in star schema design. | Data engineering staff, usually in IT and in partnership with the COE. |
| Create a data model | Creation of an analytical data model, based on the curated data. | Power BI content creator(s), usually in IT or the COE. |
| Create analytics reports | Creation of reports to analyze the curated data. Ongoing changes to reports based on new requirements and when new auditing data becomes available. | Power BI report creator(s), usually in IT or the COE. |
| Analyze the data and act on the results | Analyze the data and act in response to the audit data. | The team that oversees Power BI in the organization, usually the COE. Might also include other teams depending on the audit results and the action. Other teams can include security, compliance, legal, risk management, or change management. |
| Test and validate | Test to ensure that auditing requirements are met and that the data presented is accurate. | Power BI content creator(s), in partnership with the team that oversees Power BI in the organization. |
| Secure the data | Set and manage security for each storage layer, including the raw data and the curated data. Manage access to semantic models that are created for analyzing the data. | System administrator for the system that stores the data, in partnership with the team that oversees Power BI in the organization. |
| Scheduling and automation | Operationalize a solution and schedule the process with the tool of choice. | Data engineering staff, usually in IT and in partnership with the COE. |
| Support the solution | Monitor the audit solution, including job runs, errors, and support for technical issues. | The team that handles Power BI system support, which is usually IT or the COE. |

Many of the above roles and responsibilities can be consolidated if they're going to be performed by the same team or the same person. For example, your Power BI administrators might perform some of these roles.

It's also possible that different people perform different roles, depending on the circumstance. Actions will be contextual depending on the audit data and the proposed action.

Consider several examples.

- **Example 1:** The audit data shows that some users frequently export data to Excel. _Action taken:_ The COE contacts the specific users to understand their needs and to teach them better alternatives.
- **Example 2:** The audit data shows external user access occurs in an unexpected way. _Actions taken:_ An IT system administrator updates the relevant Microsoft Entra ID settings for external user access. The Power BI administrator updates the tenant setting related to external user access. The COE updates documentation and training for content creators who manage security. For more information, see [Strategy for external users](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-external-users).
- **Example 3:** The audit data shows that several data models define the same measure differently (available from the [metadata scanning APIs](/fabric/governance/metadata-scanning-overview), if allowed by the detailed metadata tenant settings). _Action taken:_ The data governance committee starts a project to define common definitions. The COE updates documentation and training for content creators who create data models. The COE also works with content creators to update their models, as appropriate. For more information about retrieving detailed metadata, see [Access tenant inventory data](#access-tenant-inventory-data) later in this article.

> [!NOTE]
> The setup of data extraction processes is usually a one-time effort with occasional enhancements and troubleshooting. Analyzing and acting on the data is an ongoing effort that requires continual effort on a recurring basis.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering permissions and responsibilities, key decisions and actions include:

> [!div class="checklist"]
> - **Identify which teams are involved:** Determine which teams will be involved with the end-to-end creation and support of the auditing solution.
> - **Decide user permissions:** Determine how user permissions will be set up for accessing audit data. Create documentation of key decisions for later reference.
> - **Decide roles and responsibilities:** Ensure that expectations are clear for who does what, particularly when multiple teams are involved. Create documentation for roles and responsibilities, which includes expected actions.
> - **Assign roles and responsibilities:** Assign specific roles and responsibilities to specific people or teams. Update individual job descriptions with Human Resources, when appropriate.
> - **Create a training plan:** Establish a plan for training personnel when they require new skills.
> - **Create a cross-training plan:** Ensure that cross-training and backups are in place for key roles.

### Technical decisions

When you plan for a tenant-level auditing solution, you'll need to make some important technical decisions. To improve consistency, avoid rework, and improve security, we recommend that you make these decisions as early as possible.

The first planning phase involves making the following decisions.

- [Select a technology to access audit data](#select-a-technology-to-access-audit-data)
- [Determine the authentication method](#determine-the-authentication-method)
- [Choose a user API or admin API](#choose-a-user-api-or-admin-api)
- [Choose APIs or PowerShell cmdlets](#choose-apis-or-powershell-cmdlets)
- [Determine where to store audit data](#determine-where-to-store-audit-data)
- [Plan to create curated data](#plan-to-create-curated-data)

#### Select a technology to access audit data

The first thing you need to decide is _how_ to access the audit data.

The easiest way to get started is to use the pre-built reports available in the [admin monitoring workspace](/fabric/admin/monitoring-workspace).

When you need to access the data directly and build your own solution, you'll use an API (application program interface). APIs are designed to exchange data over the internet. The [Power BI REST APIs](/rest/api/power-bi/) support requests for data by using the HTTP protocol. Any language or tool can invoke Power BI REST APIs when it's capable of sending an HTTP request and receiving a JSON response.

> [!TIP]
> The PowerShell cmdlets use the Power BI REST APIs to access the audit data. For more information, see [Choose APIs or PowerShell cmdlets](#choose-apis-or-powershell-cmdlets) later in this article.

This section focuses on your technology choice. For considerations about the source for accessing _specific types_ of audit data, see [Data source decisions](#data-source-decisions) later in this article.

##### Platform options

There are many different ways to access audit data. Depending on the technology you choose, you might lean toward a preferred language. You might also need to make a specific decision on how to schedule the running of your scripts. Technologies differ widely in their learning curve and ease of getting started.

Here are some technologies you can use to retrieve data by using the Power BI REST APIs.

| **Technology** | **Good choice for manual auditing processes** | **Good choice for automated auditing processes** |
| --- | :-: | :-: |
| Admin monitoring workspace | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Admin monitoring workspace is a good choice for manual auditing processes." border="false"::: | |
| Try-it | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Try-it is a good choice for manual auditing processes." border="false"::: | |
| PowerShell | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="PowerShell is a good choice for manual auditing processes." border="false"::: | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="PowerShell is a good choice for automated auditing processes." border="false"::: |
| Power BI Desktop | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Power BI Desktop is a good choice for manual auditing processes." border="false"::: | |
| Power Automate | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Power Automate is a good choice for automated auditing processes." border="false"::: |
| Preferred Azure service | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Preferred Azure service is a good choice for automated auditing processes." border="false"::: |
| Preferred tool/language | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Preferred tool/language is a good choice for manual auditing processes." border="false"::: | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Preferred tool/language is a good choice for automated auditing processes." border="false"::: |
| Microsoft Purview audit log search | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Microsoft Purview audit log search is a good choice for manual auditing processes." border="false"::: | |
| Defender for Cloud Apps | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Defender for Cloud Apps is a good choice for manual auditing processes." border="false"::: | |
| Microsoft Sentinel | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Microsoft Sentinel is a good choice for automated auditing processes." border="false"::: |

The remainder of this section provides a brief introduction to each of the options presented in the table.

###### Admin monitoring workspace

The [admin monitoring workspace](/fabric/admin/monitoring-workspace) contains pre-defined reports and semantic models in the Power BI service. It's a convenient way for Fabric administrators and global administrators to view recent audit data and help them understand user activities.

###### Try-it in API documentation

[Try-it](https://azure.microsoft.com/updates/power-bi-rest-api-tryit-tool/) is an interactive tool that allows you to experience the Power BI REST API directly in Microsoft documentation. It's an easy way to explore the APIs because it doesn't require other tools or any setup on your machine.

You can use Try-it to:

- Manually send a request to an API to determine whether it returns the information that you want.
- Learn how the URL is constructed before you write a script.
- Check data in an informal way.

> [!NOTE]
> You must be a licensed and authenticated Power BI user to use Try-it. It follows the standard permissions model, meaning that the user APIs rely on user permissions, and the [admin APIs](/rest/api/power-bi/admin) require Power BI administrator permissions. You can't authenticate with Try-it by using a service principal.

Because it's interactive, Try-it is best suited to learning, exploration, and new manual auditing processes.

###### PowerShell and Azure Cloud Shell

You can create and run [PowerShell](/powershell/scripting/overview) scripts in multiple ways.

Here are several common options.

- **[Visual Studio Code](https://code.visualstudio.com/docs):** A modern, lightweight source code editor. It's a freely available open-source tool that's supported on multiple platforms, including Windows, macOS, and Linux. You can use Visual Studio Code with many languages, including [PowerShell](https://code.visualstudio.com/docs/languages/powershell) (by using the PowerShell extension).
- **[Azure Data Studio](/sql/azure-data-studio/):** A tool for creating scripts and notebooks. It's built on top of Visual Studio Code. Azure Data Studio is available independently, or with SQL Server Management Studio (SSMS). There are many extensions, including an extension for [PowerShell](/sql/azure-data-studio/extensions/powershell-extension).
- **[Azure Cloud Shell](/azure/cloud-shell/overview):** An alternative to working with PowerShell locally. You can access [Azure Cloud Shell](/azure/cloud-shell/overview) from a browser.
- **[Azure Functions](/azure/azure-functions/functions-reference-powershell):** An alternative to working with PowerShell locally. Azure Functions is an Azure service that lets you write and run code in a serverless environment. PowerShell is one of several languages that it supports.

> [!IMPORTANT]
> We recommend that you use the [latest version](/powershell/scripting/whats-new/differences-from-windows-powershell) of PowerShell (PowerShell Core) for all new development work. You should discontinue using Windows PowerShell (which can't run PowerShell Core) and instead use one of the modern code editors that support PowerShell Core. Take care when referring to many online examples that use Windows PowerShell (version 5.1) because they might not use the latest (and better) code approaches.

You can use PowerShell in several different ways. For more information about this technical decision, see [Choose APIs or PowerShell cmdlets](#choose-apis-or-powershell-cmdlets) later in this article.

There are many online resources available for using PowerShell, and it's often possible to find experienced developers who can create and manage PowerShell solutions. PowerShell is a good choice for creating both manual and automated auditing processes.

###### Power BI Desktop

Because Power BI Desktop can connect to APIs, you might be tempted to use it to build your auditing solution. However, there are some significant drawbacks and complexities.

- **Accumulating history:** Because the Power BI activity log provides up to 30 days of data, creating your entire auditing solution involves accumulating a set of files over time that store all historical events. Accumulating historical files is simpler to accomplish with other tools.
- **Handling credentials and keys securely:** Many solutions you find online from community bloggers aren't secure because they hard-code credentials and keys in plaintext within Power Query queries. While that approach is easy, it's not recommended because anyone who obtains your Power BI Desktop file can read the values. You can't store the password (when using user authentication) or the secret (when using a service principal) securely in Power BI Desktop unless you:
  - Use a custom connector that was developed with the [Power Query SDK](https://marketplace.visualstudio.com/items?itemName=Dakahn.PowerQuerySDK). For example, a custom connector could read confidential values from [Azure Key Vault](/azure/key-vault/general/basic-concepts) or another service that securely stores the encrypted value. There are also various custom connector options available from the global Power BI community.
  - Use the [ApiKeyName](/powerquery-m/web-contents) option, which works well in Power BI Desktop. However, it isn't possible to store the key value in the Power BI service.
- **Types of requests:** You might run into some limitations for what you can run in Power BI Desktop. For example, Power Query doesn't support every type of API request. For example, only GET and POST requests are supported when using the [Web.Contents](/powerquery-m/web-contents) function. For auditing, you typically send GET requests.
- **Ability to refresh:** You need to follow specific Power Query development patterns to successfully refresh a semantic model in the Power BI service. For example, the `RelativePath` option must be present when using [Web.Contents](/powerquery-m/web-contents) so that Power BI can properly verify the location of a data source without generating an error in the Power BI service.

In most cases, we recommend that you use Power BI Desktop only for two purposes. You should use it to:

- Build your data model based on the existing curated data (rather than using it to initially extract the auditing data).
- Create analytical reports based on your data model.

###### Power Automate

You can use [Power Automate](/power-automate/getting-started) with Power BI in many ways. In relation to auditing, you can use Power Automate to send requests to the Power BI REST APIs and then store the extracted data in the location of your choice.

> [!TIP]
> To send requests to the Power BI REST APIs, you can use a [custom connector](/connectors/custom-connectors/) for Power Automate to securely authenticate and extract the audit data. Alternatively, you can use Azure Key Vault to reference a password or secret. Both options are better than storing passwords and secrets in plaintext within the Power Automate flow.

For other ideas on ways to use Power Automate, search for _Power BI_ in the [Power Automate templates](https://flow.microsoft.com/templates/).

###### Preferred Azure service

There are several Azure services that can send requests to the Power BI REST APIs. You can use your preferred Azure service, such as:

- [Azure Functions](/azure/azure-functions/functions-overview)
- [Azure Automation](/azure/automation/overview)
- [Azure Data Factory](/azure/data-factory/introduction)
- [Azure Synapse Analytics](/azure/synapse-analytics/overview-what-is)

In most cases, you can combine a compute service that handles the logic for the data extraction with a storage service that stores the raw data (and curated data, when appropriate). Considerations for making technical architecture decisions are [described later](#platform-considerations) in this article.

###### Preferred tool and/or language

You can use your preferred tool and your preferred language to send requests to the Power BI REST APIs. It's a good approach when your team has expertise with a specific tool or language, such as:

- Python
- C# on the .NET framework. Optionally, you can use the [Power BI .NET SDK](https://github.com/microsoft/PowerBI-CSharp), which acts as a wrapper on top of the Power BI REST APIs in order to simplify some processes and increase productivity.
- JavaScript

###### Microsoft Purview audit search

The [Microsoft Purview compliance portal](/microsoft-365/compliance/microsoft-365-compliance-center?view=o365-worldwide&preserve-view=true) (formerly the Microsoft 365 compliance center) includes a user interface that allows you to view and search the [audit logs](/microsoft-365/compliance/audit-log-search?view=o365-worldwide&preserve-view=true). The unified audit logs include Power BI, and all other services that support Microsoft 365 unified audit logs.

The data captured in the unified audit log is the exact same data that's contained in the [Power BI activity log](../enterprise/service-admin-auditing.md). When you do an audit log search in the Microsoft Purview compliance portal, it adds your request to the queue. It can take a few minutes (or longer, depending on the volume of data) for the data to be ready.

Here are some common ways to use the audit log search tool. You can:

- Select the Power BI workload to view events for a series of dates.
- Look for one or more specific activities, such as:
  - _Deleted Power BI report_
  - _Added admin access to a personal workspace in Power BI_
- View activities of one or more users.

For administrators with sufficient permissions, the audit log search tool in the Microsoft Purview compliance portal is a good option for manual auditing processes. For more information, see [Microsoft Purview compliance portal](#microsoft-purview-compliance-portal) later in this article.

###### Defender for Cloud Apps user interface

[Defender for Cloud Apps](powerbi-implementation-planning-defender-for-cloud-apps.md) is available to administrators in Microsoft Defender XDR (Microsoft 365 portal). It includes a user interface to view and search activity logs for various cloud services, including Power BI. It displays the same log events that originate in the Microsoft Purview compliance portal, in addition to other events like user sign-in activity from Microsoft Entra ID.

The audit log interface in Defender for Cloud Apps is a good option for manual auditing processes. For more information, see [Defender for Cloud Apps](#defender-for-cloud-apps) later in this article.

###### Microsoft Sentinel and KQL

[Microsoft Sentinel](/azure/sentinel/overview) is an Azure service that allows you to collect, detect, investigate, and respond to security incidents and threats. Power BI can be set up in Microsoft Sentinel as a data connector so that audit logs are streamed from Power BI into Microsoft Sentinel Azure Log Analytics (which is a component of the [Azure Monitor](/azure/azure-monitor/) service). You can use the [Kusto Query Language](/azure/data-explorer/kusto/query/) (KQL) to analyze the activity log events that are stored in Azure Log Analytics.

Using KQL to search the data in Azure Monitor is a good option for viewing part of the audit log. It's a good option for manual auditing processes, too. For more information, see [Microsoft Sentinel](#microsoft-sentinel) later in this article.

##### Platform considerations

Here are some considerations for how you might access audit data.

- **Are you implementing a manual or automated auditing process?** Certain tools align strongly with manual processing or automated processing. For example, a user always runs the Try-it functionality interactively, so it's suited only to manual auditing processes.
- **How will you authenticate?** Not all options support every authentication option. For example, the Try-it functionality only supports user authentication.
- **How will you store credentials securely?** Different technologies have different options for storing credentials. For more information, see [Determine the authentication method](#determine-the-authentication-method) later in this article.
- **Which technology is your team already proficient with?** If there's a tool that your team prefers and is comfortable using, start there.
- **What is your team capable of supporting?** If a different team will support the deployed solution, consider whether that team is able to adequately support it. Also consider that your internal teams might support development that's done by consultants.
- **What tool do you have approval to use?** Certain tools and technologies might require approval. It could be due to the cost. It could also be due to IT security policies.
- **What's your preference for scheduling?** Some technologies make the decision for you. Other times it will be another decision you must make. For example, if you choose to write PowerShell scripts, there are various ways you can schedule running them. Conversely, if you use a cloud service such as Azure Data Factory, scheduling is built in.

We recommend that you review the remainder of this article before choosing a technology to access audit data.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When deciding which technology to use to access audit data, key decisions and actions include:

> [!div class="checklist"]
> - **Discuss with your IT staff:** Talk to your IT teams to find out whether there are certain tools that are approved or preferred.
> - **Explore options with a small proof of concept (POC):** Do some experimentation with a technical POC. Focus initially on learning. Then focus on your decision for what to use going forward.

#### Determine the authentication method

How you plan to set up authentication is a critical decision. It's often one of the most difficult aspects when you get started with auditing and monitoring. You should carefully consider available options to make an informed decision.

> [!IMPORTANT]
> Consult with your IT and security teams on this matter. Take the time to learn the basics of how security in Microsoft Entra ID works.

Not every API on the internet requires authentication. However, all the Power BI REST APIs require authentication. When you access tenant-level auditing data, the authentication process is managed by the [Microsoft identity platform](/azure/active-directory/develop/v2-overview). It's an evolution of the Microsoft Entra identity service that's built on industry standard protocols.

> [!TIP]
> The Microsoft identity platform [glossary of terms](/azure/active-directory/develop/developer-glossary) is a resource that helps you become familiar with the basic concepts.

Before you retrieve audit data, you must first _authenticate_, which is known as _signing in_. The concepts of [authentication and authorization](/azure/active-directory/develop/authentication-vs-authorization) are separate, yet related. An _authentication_ process verifies the identity of _who_ is making the request. An _authorization_ process grants (or denies) access to a system or resource by verifying _what_ the user or service principal has permission to do.

When a user or service principal authenticates, a Microsoft Entra access token is issued to a resource server, such as a Power BI REST API or a Microsoft Graph API. By default, an access token expires after one hour. A refresh token can be requested, if needed.

There are two types of access tokens:

- **User tokens:** Issued on behalf of a user with a known identity.
- **App-only tokens:** Issued on behalf of a Microsoft Entra application (service principal).

For more information, see [Application and service principal objects in Microsoft Entra ID](/azure/active-directory/develop/app-objects-and-service-principals#application-object).

> [!NOTE]
> A Microsoft Entra application is an identity configuration that allows an automated process to integrate with Microsoft Entra ID. In this article, it's referred to as an _app registration_. The term _service principal_ is also used commonly in this article. These terms are described in more detail later in this section.

> [!TIP]
> The easiest way to authenticate is to use the [Connect-PowerBIServiceAccount](/powershell/module/microsoftpowerbimgmt.profile/connect-powerbiserviceaccount) cmdlet from the Power BI Management module. You might see other authentication-related cmdlets in articles and blog posts online. For example, there are the `Login-PowerBI` and `Login-PowerBIServiceAccount` cmdlets, which are aliases for `Connect-PowerBIServiceAccount` cmdlet. There's also the [Disconnect-PowerBIServiceAccount](/powershell/module/microsoftpowerbimgmt.profile/disconnect-powerbiserviceaccount) cmdlet that you can use to explicitly sign out at the end of a process.

The following table describes the two authentication options.

| **Type of authentication** | **Description** | **Intended for** | **Good choice for manual auditing processes** | **Good choice for automated auditing processes** |
| --- | --- | --- | :-: | :-: |
| User authentication | Sign in as a user by using the user principal name (email address) and a password. | Occasional, interactive use | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="User authentication is a good choice for manual auditing processes" border="false"::: | |
| Service principal authentication | Sign in as a service principal by using a secret (key) assigned to an app registration. | Ongoing, scheduled, unattended operations | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Service principal authentication is a good choice for automated auditing processes" border="false"::: |

Each authentication option is described in more detail in the following section.

##### User authentication

User authentication is useful in the following situations.

- **Manual auditing processes:** You want to run a script by using your user permissions. Permissions could be at one of two levels, depending on the type of API request:
  - **Administrator permissions for admin APIs:** You need to use your Power BI administrator permissions to send a request to an _admin API_.
  - **User permissions for user APIs:** You need to use your Power BI user permissions to send a request to a _user API_. For more information, see [Choose a user API or admin API](#choose-a-user-api-or-admin-api).
- **Interactive sign in:** You want to sign in interactively, which requires you to input your email address and password. For example, you must sign in interactively to use the [Try-it](#try-it-in-api-documentation) experience, which is found in Microsoft API documentation.
- **Track who accessed tenant metadata:** When individual users and administrators send API requests, you might want to audit who those individuals are. When you authenticate with a service principal (described [next](#service-principal-authentication)), the user ID captured by the activity log is the Application ID. If multiple administrators authenticate with the same service principal, it might be difficult to know which administrator accessed the data.
- **Shared administrator account:** Some IT teams use a shared administrator account. Depending on how it's implemented and controlled, it might not be a best practice. Instead of a shared account, you should consider using Microsoft Entra [Privileged Identity Management](/azure/active-directory/privileged-identity-management/pim-configure) (PIM), which can grant occasional and temporary Power BI administrator rights for a user.
- **APIs that only support user authentication:** Occasionally, you might need to use an API that doesn't support authentication by a service principal. In documentation, each API notes whether a service principal can call it.

> [!IMPORTANT]
> Whenever possible, we recommend that you use service principal authentication for automated processes.

##### Service principal authentication

Most organizations have one Microsoft Entra tenant, so the terms _app registration_ and _service principal_ tend to be used interchangeably. When you [register](/azure/active-directory/develop/app-objects-and-service-principals#application-registration) a Microsoft Entra app, there are two components.

- **App registration:** An [app registration](/azure/active-directory/develop/app-objects-and-service-principals#application-object) is globally unique. It's the global definition of a registered Microsoft Entra app that can be used by multiple tenants. An app registration is also known as a _client application_ or the _actor_. Typically, the term _client application_ implies a user machine. However, that's not the situation for app registrations. In the Azure portal, Microsoft Entra applications are found on the _App registrations_ page in Microsoft Entra ID.
- **Service principal:** A [service principal](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) is the local representation of the app registration for use in your specific tenant. The service principal is derived from the registered Microsoft Entra app. For organizations with multiple Microsoft Entra tenants, the same app registration can be referenced by more than one service principal. In the Azure portal, service principals can be found on the _Enterprise applications_ page in Microsoft Entra ID.

Because the service principal is the local representation, the term _service principal authentication_ is the most common way to refer to sign-ins.

> [!TIP]
> Your Microsoft Entra administrator can tell you who's allowed to [create](/azure/active-directory/develop/active-directory-how-applications-are-added#who-has-permission-to-add-applications-to-my-azure-ad-instance), and consent to, an app registration in your organization.

Service principal authentication is useful in the following situations.

- **Automated auditing processes:** You want to run an unattended process on a schedule.
- **No need to sign in to the Power BI service:** You only need to connect and extract data. A service principal can't sign in to the Power BI service.
- **Shared access to data:** You (personally) aren't a Power BI administrator, but you're authorized to use a service principal. The service principal has permission to run admin APIs to retrieve tenant-level data (or other specific permissions).
- **Use by multiple administrators:** You want to allow multiple administrators or users to use the same service principal.
- **Technical blockers:** There's a technical blocker that prevents the use of user authentication. Common technical blockers include:
  - **Multi-factor authentication (MFA):** Automated auditing processes (that run unattended) can't authenticate by using a user account when multi-factor authentication is enabled.
  - **Password hash synchronization:** Microsoft Entra ID requires [password hash synchronization](/azure/active-directory/hybrid/whatis-phs) for a user account to authenticate. Sometimes, IT or a cybersecurity team might disable this functionality.

###### App registration purpose and naming convention

Each app registration should have a clear name that describes its purpose and the target audience (who can use the app registration).

Consider implementing a naming convention such as: _&lt;Workload&gt; - &lt;Purpose&gt; - &lt;Target audience&gt; - &lt;Object type&gt;_

Here are the parts of the naming convention.

- **Workload:** Usually equivalent to a data source (for example, Power BI data or Microsoft Graph data).
- **Purpose:** Similar to the level of permissions (for example, Read versus ReadWrite). As described below, the purpose helps you to follow the [principle of least privilege](/azure/active-directory/develop/secure-least-privileged-access) when you create separate app registrations that can only read data.
- **Target audience:** Optional. Depending on the workload and purpose, the target audience allows you to determine the intended users of the app registration.
- **Object type:** _EntraApp_ is included for clarity.

Your naming convention can be more specific when you have multiple tenants or multiple environments (such as development and production).

The following table shows examples of app registrations that could be used to extract tenant-level auditing data:

| **App registration name** | **Purpose** | **Target audience** |
| --- | --- | --- |
| PowerBIData-Read-AdminAPIs-EntraApp | Extract tenant-wide metadata for auditing and administration of Power BI. Admin APIs are always read-only and might not have permissions granted in Microsoft Entra ID (Power BI tenant setting only). | Power BI administrators and the Center of Excellence |
| PowerBIData-ReadWrite-PowerBIAdministrators-EntraApp | Manage the Power BI tenant. Requires read/write permissions to create or update resources. | Power BI administrators and the Center of Excellence |
| GraphData-Read-PowerBIAdministrators-EntraApp | Extract users and groups data for auditing and administration of Power BI. Requires read permissions. | Power BI administrators and the Center of Excellence |

Managing multiple app registrations for different purposes involves more effort. However, you can benefit from several advantages.

- **See what the app registration is _intended_ to be used for and why:** When you see the client ID from the app registration show up in your auditing data, you'll have an idea of what it was used for and why. That's a significant advantage of creating separate app registrations (rather than using only one for all purposes).
- **See who the app registration is _intended_ to be used by:** When you see the client ID from the app registration show up in your auditing data, you'll have an idea of who was using it.
- **Avoid overprovisioning permissions:** You can follow the principle of least privilege by providing separate app registrations to different sets of people who have different needs. You can avoid overprovisioning permissions by using a read-only app registration when write permissions aren't necessary. For example, you might have some highly capable self-service users who want to gather data about their semantic models; they need access to a service principal with _read_ permission. Whereas there might be satellite members of the Center of Excellence working for the Finance team who programmatically manage semantic models; they need access to a service principal with _write_ permission.
- **Know who _should_ be in possession of the secret:** The secret for each app registration should only be shared with the people who need it. When the secret is _rotated_ (described later in this section), the impact is smaller when you use separate app registrations for different needs. That's helpful when you need to rotate the secret because a user leaves the organization or changes roles.

###### App registration permissions

There are two main ways that an app registration can access data and resources. It involves [permissions and consent](/azure/active-directory/develop/permissions-consent-overview).

- **App-only permissions:** Access and authorization are handled by the service principal without a signed-in user. That method of authentication is helpful for automation scenarios. When using app-only permissions, it's critical to understand that permissions are _not_ assigned in Microsoft Entra ID. Rather, permissions are assigned in one of two ways:
  - **For running admin APIs:** Certain Power BI tenant settings allow access to the endpoints for the admin APIs (that return tenant-wide auditing metadata). For more information, see [Set Power BI tenant settings](#set-power-bi-tenant-settings) later in this article.
  - **For running user APIs:** Power BI workspace and item permissions apply. Standard Power BI permissions control what data can be returned to a service principal when running user APIs (that return auditing data based on permissions of the user or service principal that's invoking the API).
- **Delegated permissions:** Scope-based permissions are used. The service principal accesses data on behalf of the user that's currently signed in. It means that the service principal can't access anything beyond what the signed-in user can access. Be aware that this it's a different concept from user-only authentication, described previously. Because a custom application is required to properly handle the combination of user and app permissions, delegated permissions are rarely used for auditing scenarios. This concept is commonly misunderstood, leading to many app registrations that are overprovisioned with permissions.

> [!IMPORTANT]
> In this article, the focus is only on user authentication or app-only authentication. Delegated permissions (with an interactive user and the service principal) could play an important role when programmatically embedding Power BI content. However, we strongly discourage you from setting up delegated permissions for extracting auditing data. Every API limits how frequently it can be run (with throttling in place), so it isn't practical to have different users directly accessing the raw audit data. Instead, we recommend that you extract the raw audit data once (with a centralized process), and then make the curated audit data available to authorized users downstream.

For more information, see [Register a Microsoft Entra app](#register-a-microsoft-entra-application) later in this article.

###### App registration secrets

An app registration often has a _secret_ assigned to it. The secret is used as a key for authentication, and it has an expiration date. Therefore, you need to plan how to rotate the key regularly and how to communicate the new key to authorized users.

You also need to concern yourself with where to securely store the secret. An organizational password vault, such as [Azure Key Vault](/azure/key-vault/general/basic-concepts), is an excellent choice.

> [!TIP]
> As an alternative approach to using a secret, you can use a _[managed identity](/azure/active-directory/managed-identities-azure-resources/overview)_. A managed identity eliminates the need to manage credentials. If you intend to use services like Azure Functions or Azure Data Factory to extract the data, a managed identity is a good option to investigate.

###### Securely manage credentials

Regardless of whether you use user authentication or service principal authentication, one of the biggest challenges is how to securely manage passwords, secrets, and keys.

> [!CAUTION]
> The first rule is one that many people violate: passwords and keys should never appear in plaintext in a script. Many articles, blogs, and examples online do that for simplicity. However, it's a poor practice that should be avoided. Anyone that obtains the script (or the file) can potentially gain access to the same data that the author has access to.

Here are several secure methods you can use to manage passwords, secrets, and keys.

- Integrate with [Azure Key Vault](/azure/key-vault/general/overview) or another organizational password vault system, whenever possible.
- Use [credentials and secure strings](/powershell/scripting/learn/deep-dives/add-credentials-to-powershell-functions) in your PowerShell scripts. A credential works for both user authentication and service principal authentication. However, you can't use a credential when multi-factor authentication is enabled for a user account.
- Prompt for a password in your PowerShell script, or use interactive authentication with a browser.
- Use the [Secret Management](https://www.powershellgallery.com/packages/Microsoft.PowerShell.SecretManagement) module for PowerShell that's published by Microsoft. It can store values by using a local vault. It can also integrate with a remote [Azure Key Vault](/azure/key-vault/general/overview), which is useful when there are multiple administrators in your organization who work with the same scripts.
- Create a [custom connector](../connect-data/desktop-connector-extensibility.md) for Power BI Desktop so that it can securely handle credentials. Some custom connectors are available from community members (usually on GitHub).

> [!TIP]
> We recommend that you consult with your IT and security teams to help choose the best method, or validate that your solution manages credentials in a secure way.

##### Microsoft Authentication Library

Support for Azure AD Authentication Library (ADAL) ended in December 2022. Going forward, you should use [Microsoft Authentication Library](/azure/active-directory/develop/msal-overview) (MSAL). The security team in your organization should be familiar with this significant change.

While it's not important for Power BI professionals to deeply understand the transition to MSAL, you should adhere to the following recommendations.

- Use the latest version of the Power BI Management module when you authenticate with the [Connect-PowerBIServiceAccount](/powershell/module/microsoftpowerbimgmt.profile/connect-powerbiserviceaccount) PowerShell cmdlet. It switched from ADAL to MSAL in version 1.0.946 (February 26, 2021).
- Use the Microsoft Entra V2 endpoint when you authenticate directly in your script. The Microsoft Entra V2 endpoint uses MSAL, whereas the Microsoft Entra V1 endpoint uses ADAL.
- Discontinue the use of APIs and modules that are deprecated. For more information, see [Deprecated APIs and modules](#deprecated-apis-and-modules) later in this article.
- If you find a community solution online, be sure that it's using MSAL for authentication rather than ADAL.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When deciding how to manage authentication, key decisions and actions include:

> [!div class="checklist"]
> - **Decide which type of authentication to use:** Determine whether user authentication or service principal authentication is most suitable, depending on the type of auditing solution you plan to create.
> - **Plan for what app registrations you need:** Consider your requirements, workloads, and target audience (users of each app registration). Plan for how many app registrations you need to create to support these needs.
> - **Create a naming convention for app registrations:** Set up a naming convention that makes it easy to understand the intended purpose and intended users of each app registration.
> - **Plan for how to securely manage credentials:** Consider ways to securely manage passwords, secrets, and keys. Consider what documentation and training might be necessary.
> - **Confirm the use of MSAL:** Determine whether there are any existing manual or automated auditing solutions that rely on ADAL. If necessary, create a plan to rewrite these solutions to use the newer MSAL authentication library.

#### Choose a user API or admin API

When planning to retrieve auditing data, it's important to use the right type of API.

There are two types of APIs to consider.

- **User APIs:** Rely on the permissions of the signed-in user (or service principal) to send requests to the API. For example, one way to return a list of semantic models in a workspace is with a user API. Permission to [read semantic models](../developer/embedded/datasets-permissions.md) can be granted either by workspace role or per-item permissions. There are two ways to run user APIs:
  - **User authentication:** The signed-in user must have permission to access the workspace or item.
  - **Service principal authentication:** The service principal must have permission to access the workspace or item.
- **Admin APIs:** Retrieve metadata from the tenant. It's sometimes referred to as the _organizational scope_. For example, to return a list of all semantic models in the tenant, you use an admin API. There are two ways to run admin APIs:
  - **User authentication:** The signed-in user must be a Power BI administrator to run admin APIs.
  - **Service principal authentication:** The service principal must have permission to run admin APIs (without relying on security permissions like a user API does).

> [!TIP]
> All admin APIs belong to the [Admin operation group](/rest/api/power-bi/#rest-operation-groups). Any API that has the _As Admin_ suffix is an admin API; all remaining APIs are user APIs.

Consider an example where you need to obtain a list of semantic models. The following table shows six API options that you can use to do that. Four options are user APIs, and two options are admin APIs. The scope and number of items that are returned are different, depending on the API you choose.

| **API name** | **Type of API** | **Scope** | **Number of semantic models** |
| --- | --- | --- | --- |
| [Get Dataset](/rest/api/power-bi/datasets/get-dataset) | User | Personal workspace | One |
| [Get Datasets](/rest/api/power-bi/datasets/get-datasets) | User | Personal workspace | All |
| [Get Dataset in Group](/rest/api/power-bi/datasets/get-dataset-in-group) | User | One workspace | One, provided the signed-in user has permission to read the semantic model |
| [Get Datasets in Group](/rest/api/power-bi/datasets/get-datasets-in-group) | User | One workspace | All, provided the signed-in user has permission to read each semantic model |
| [Get Datasets in Group as Admin](/rest/api/power-bi/admin/datasets-get-datasets-in-group-as-admin) | Admin | One workspace | All |
| [Get Datasets as Admin](/rest/api/power-bi/admin/datasets-get-datasets-as-admin) | Admin | Entire tenant | All |

> [!NOTE]
> Some of the API names include the term _Group_ as a reference to a workspace. That term originated from the original Power BI security model, which relied on Microsoft 365 groups. While the Power BI security model has evolved significantly over the years, the existing API names remain unchanged to avoid breaking existing solutions.

For information about tenant settings, see [Set Power BI tenant settings](#set-power-bi-tenant-settings) later in this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When choosing whether to use a user API or an admin API, key decisions and actions include:

> [!div class="checklist"]
> - **Refer to data requirements:** Collect and document the key business requirements for an auditing solution. Based on the type of data that's needed, determine whether a user scope or organizational scope is appropriate.
> - **Test the results:** Do some experimentation. Test the accuracy of the results that are returned by the different APIs.
> - **Review permissions:** For any existing auditing solutions, confirm that permissions are assigned correctly for Power BI administrators and service principals. For new auditing solutions, confirm which method of authentication will be used.

#### Choose APIs or PowerShell cmdlets

A key decision to make is whether to use PowerShell cmdlets when they're available for the specific data that you want to retrieve. This decision is important if you've decided that PowerShell is one of the technologies you'll use to access audit data.

[PowerShell](/powershell/scripting/overview) is a task automation solution. The term _PowerShell_ is a collective term that refers to the scripting language, a command-line shell application, and a configuration management framework. PowerShell Core is the newest version of PowerShell, which runs on Windows, Linux, and macOS.

A PowerShell _cmdlet_ is a command that performs an action. A PowerShell _module_ is a package that contains PowerShell members, such as cmdlets, providers, functions, workflows, variables, and aliases. You download and install modules.

A PowerShell module creates a layer of abstraction over the APIs. For example, the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) cmdlet retrieves (or _gets_) audit events for a Power BI tenant. This PowerShell cmdlet retrieves its data from the [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) REST API. Generally, it's simpler to get started by using the cmdlets because it simplifies access to the underlying APIs.

Only a subset of the APIs are available as PowerShell cmdlets. As you continue to expand your entire auditing solution, it's likely that you'll use a combination of cmdlets and APIs. The remainder of this section helps you to decide which way you'll access the data.

##### PowerShell modules

Microsoft has published two PowerShell modules that contain cmdlets related to Power BI. They're the Power BI Management module and the Data Gateway module. These PowerShell modules act as an _API wrapper_ on top of the underlying Power BI REST APIs. Using these PowerShell modules can make it easier to write scripts.

> [!TIP]
> In addition to the modules published by Microsoft, there are freely available PowerShell modules and scripts published (usually on GitHub) by Power BI community members, partners, and Microsoft Most Valued Professionals (MVPs).
>
> Starting with a community solution can play an important role in building your end-to-end auditing solution. If you choose to use a freely available solution, be sure to fully test it. Become familiar with how it works so you can effectively manage your solution over time. Your IT department might have criteria for using publicly available community solutions.

###### Power BI Management module

The [Power BI Management module](/powershell/power-bi/overview) is a rollup module that contains specific Power BI modules for administration, capacities, workspaces, and more. You can choose to install the rollup module to obtain all of the modules, or you can install specific modules. All of the Power BI Management modules are supported on both Windows PowerShell and PowerShell Core.

> [!IMPORTANT]
> We recommend that you discontinue using Windows PowerShell (which can't run PowerShell Core). Instead, use one of the modern code editors that supports PowerShell Core. The Windows PowerShell ISE (integrated script environment) is only capable of running [PowerShell version 5.1](/powershell/scripting/whats-new/differences-from-windows-powershell), which is no longer updated. Windows PowerShell is now deprecated, so we recommend that you use PowerShell Core for all new development work.

Here are several commonly used cmdlets that you can use to retrieve auditing data.

| **Management module** | **Cmdlet** | **Purpose** |
| --- | --- | --- |
| Profile | [Connect-PowerBIServiceAccount](/powershell/module/microsoftpowerbimgmt.profile/connect-powerbiserviceaccount) | Authenticate a Power BI user or service principal. |
| Admin | [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) | View or extract Power BI activity log events for the tenant. |
| Workspaces | [Get-PowerBIWorkspace](/powershell/module/microsoftpowerbimgmt.workspaces/get-powerbiworkspace) | Compile a list of workspaces. |
| Reports | [Get-PowerBIReport](/powershell/module/microsoftpowerbimgmt.reports/get-powerbireport) | Compile a list of reports for a workspace or the tenant. |
| Data | [Get-PowerBIDataset](/powershell/module/microsoftpowerbimgmt.data/get-powerbidataset) | Compile a list of semantic model for a workspace or the tenant. |
| Profile | [Invoke-PowerBIRestMethod](/powershell/module/microsoftpowerbimgmt.profile/invoke-powerbirestmethod) | Send a REST API request (command). This cmdlet is a good option because it can invoke any of the Power BI REST APIs. It's also a good choice when you want to use the simpler form of authentication by using the `Connect-PowerBIServiceAccount` cmdlet and be able to invoke an API that doesn't have a corresponding PowerShell cmdlet. For more information, see [Considerations for using PowerShell cmdlets](#considerations-for-using-powershell-cmdlets) later in this section. |

> [!TIP]
> There are other cmdlets available for managing and publishing content. However, the focus of this article is on retrieving auditing data.

You can download the Power BI Management module from the [PowerShell Gallery](https://www.powershellgallery.com/packages/MicrosoftPowerBIMgmt). The simplest way to install modules is to use [PowerShellGet](/powershell/scripting/gallery/installing-psget?view=powershellget-2.x&preserve-view=true).

We recommend that you install the Power BI Management rollup module. That way, all the cmdlets you might need are available. At a minimum, you need the Profile module (for authentication) and any specific modules that contain the cmdlets that you want to use.

> [!CAUTION]
> Be sure you keep the modules up to date on every server, user machine, and cloud service (such as Azure Automation) where you use PowerShell. If the modules aren't updated regularly, unpredictable errors or issues could arise. Some tools (like Visual Studio Code) help you keep the modules updated. Also, be aware that PowerShellGet doesn't automatically [uninstall](/powershell/module/powershellget/uninstall-module) older versions of a module when you install or update a newer version. It installs newer versions alongside the older versions. We recommend that you [check](/powershell/module/powershellget/get-installedmodule) for installed versions and periodically uninstall older versions.

###### Data Gateway module

The [Data Gateway module](/powershell/gateway/overview) contains cmdlets that retrieve data from an on-premises data gateway and its data sources. The Data Gateway module is supported only on PowerShell Core. It's not supported on Windows PowerShell.

Unlike the Power BI Management module (previously described), the Data Gateway module doesn't include any admin cmdlets. Many of the cmdlets (and the corresponding [gateway APIs](/rest/api/power-bi/gateways)), require that the user has gateway administrator rights.

> [!WARNING]
> It's not possible to assign a service principal as gateway administrator (even when the service principal is a member of a security group). Therefore, plan to use user credentials when retrieving information about data gateways.

Here are several cmdlets from the Data Gateway module that you can use to retrieve auditing data.

| **Cmdlet** | **Purpose** |
| --- | --- |
| [Connect-DataGatewayServiceAccount](/powershell/module/datagateway.profile/connect-datagatewayserviceaccount) | Authenticate a Power BI user (usually requires that the user belongs to the gateway admin role). |
| [Get-DataGatewayCluster](/powershell/module/datagateway/get-datagatewaycluster) | Compile a list of gateway clusters. |
| [Get-DataGatewayClusterDataSource](/powershell/module/datagateway/get-datagatewayclusterdatasource) | Compile a list of data sources for a gateway cluster. |
| [Get-DataGatewayInstaller](/powershell/module/datagateway/get-datagatewayinstaller) | Verify which users are allowed to install and register gateways in the organization. |

You can download the Data Gateway module from the [PowerShell Gallery](https://www.powershellgallery.com/packages/DataGateway).

##### Techniques to use PowerShell

You can use PowerShell in several different ways. The decision that you make is an important one.

The following table describes three different techniques for using PowerShell.

| **Technique** | **Description** | **Example** |
| --- | --- | --- |
| Use PowerShell cmdlets to simplify authentication, and to call APIs directly. _Recommended approach_ | With this technique, there's a balance of simplicity and flexibility. The [Invoke-PowerBIRestMethod](/powershell/module/microsoftpowerbimgmt.profile/invoke-powerbirestmethod) cmdlet is available from the Power BI Management Profile module. This cmdlet is often referred to as a _Swiss Army Knife_ because you can use it to call any of the Power BI REST APIs. The advantage of using this technique is you can simplify authentication, and then call any of the Power BI REST APIs. We strongly recommend that you use this technique. | After authenticating with the [Connect-PowerBIServiceAccount](/powershell/module/microsoftpowerbimgmt.profile/connect-powerbiserviceaccount) cmdlet, use the [Invoke-PowerBIRestMethod](/powershell/module/microsoftpowerbimgmt.profile/invoke-powerbirestmethod) cmdlet to retrieve data from your preferred API (for example, [Get Pipeline Users As Admin](/rest/api/power-bi/admin/pipelines-get-pipeline-users-as-admin)). |
| Use cmdlets from PowerShell as much as possible, both for authentication and for retrieving data. | With this technique, PowerShell is used extensively. PowerShell is used to coordinate running the script, and PowerShell modules are used whenever possible for accessing the data. This creates a greater dependency on PowerShell from multiple aspects. | After authenticating with the [Connect-PowerBIServiceAccount](/powershell/module/microsoftpowerbimgmt.profile/connect-powerbiserviceaccount) cmdlet, use a cmdlet (for example, [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent)) to retrieve data. |
| Use PowerShell only to coordinate running the process. PowerShell modules are used as little as possible. | With this technique, there's less dependency on PowerShell as a tool since its primary use is to orchestrate invoking API calls. Only one generic PowerShell module is used to access APIs (none of the modules from the Power BI Management modules are used). | After authenticating by using the [Microsoft Authentication Library](/azure/active-directory/develop/msal-overview) (MSAL), call your preferred API (for example, [Get Pipeline Users As Admin](/rest/api/power-bi/admin/pipelines-get-pipeline-users-as-admin)) by using the generic [Invoke-RestMethod](/powershell/module/microsoft.powershell.utility/invoke-restmethod) cmdlet to retrieve data. |

In the above table, the first technique describes an approach that balances ease of use with flexibility. This approach provides the best balance for the needs of most organizations, which is why it's recommended. Some organizations might have existing IT policies and staff preferences that influence how you decide to use PowerShell.

> [!TIP]
> You can use the [Invoke-ASCmd](/powershell/module/sqlserver/invoke-ascmd) PowerShell cmdlet to create and execute [DAX](/dax/dax-overview), [XMLA](/analysis-services/xmla/xml-for-analysis-xmla-reference), and [TMSL](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference) scripts. However, these use cases are out of scope for this article. For more information about querying Dynamic Management Views (DMVs), see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).

Technical users (and administrators) can use the Power BI Management modules to retrieve data or automate certain aspects of content management.

- **For administrators:** Set the `-Scope` parameter to `Organization` to access entities across the entire tenant (for example, to retrieve a list of _all workspaces_).
- **For technical users:** Set the `-Scope` parameter to `Individual` (or omit the parameter) to access entities that belong to the user (for example, to retrieve a list of workspaces _that the user has permission to access_).

Consider a scenario where you need to obtain a list of semantic models. If you choose to work directly with the APIs, you must specify which API to call. However, if you choose to use the [Get-PowerBIDataset](/powershell/module/microsoftpowerbimgmt.data/get-powerbidataset) cmdlet, you can set the `-Scope` parameter to retrieve a user-specific or tenant-wide list of semantic models. The choice you make depends on your decision for how to use PowerShell (covered in the previous table).

The following table describes how the parameters used in the PowerShell cmdlet translate to the API PowerShell calls.

| **Cmdlet parameters** | **API that the cmdlet uses** | **Type of API** | **Scope** | **Retrieved items** |
| --- | --- | --- | --- | --- |
| `-DatasetID {DatasetID}` <br/>`-Scope Individual` | [Get Dataset](/rest/api/power-bi/datasets/get-dataset) | User | Personal workspace | One semantic model |
| `-Scope Individual` | [Get Datasets](/rest/api/power-bi/datasets/get-datasets) | User | Personal workspace | All semantic models |
| `-DatasetID {DatasetID}` <br/>`-GroupID {WorkspaceID}` | [Get Dataset in Group](/rest/api/power-bi/datasets/get-dataset-in-group) | User | One workspace | One semantic model, provided the signed-in user has permission to read the semantic model |
| `-GroupID {WorkspaceID}` | [Get Datasets in Group](/rest/api/power-bi/datasets/get-datasets-in-group) | User | One workspace | All semantic models, provided the signed-in user has permission to access the workspace and read the semantic model |
| `-GroupID {WorkspaceID}` <br/>`-Scope Organization` | [Get Datasets in Group as Admin](/rest/api/power-bi/admin/datasets-get-datasets-in-group-as-admin) | Admin | One workspace | All semantic models |
| `-Scope Organization` | [Get Datasets as Admin](/rest/api/power-bi/admin/datasets-get-datasets-as-admin) | Admin | Entire tenant | All semantic models |

##### Considerations for using PowerShell cmdlets

The Power BI PowerShell cmdlets are simpler to use because they abstract some of the complexity of the REST API calls.

Here are some of the ways that the cmdlets simplify accessing auditing data.

- **Authentication:** The simplest way to authenticate in a PowerShell script is to use the `Connect-PowerBIServiceAccount` cmdlet.
- **Simplicity:** It's simpler to get started because the techniques to retrieve auditing data are straightforward. Consider that when you use the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) cmdlet, you retrieve _one day_ of audit data. However, when you directly call the [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) REST API, you retrieve _one hour_ of audit data. So, when you use the REST API to retrieve one day of audit data you must use a loop to call the API 24 times to extract each hour of the day.
- **Pagination of large result sets:** Large result sets are efficiently retrieved by _pagination_. Pagination involves retrieving one chunk of the results at a time. The cmdlets automatically manage pagination for you. However, when you directly use the REST APIs, your script must check a continuation token to determine whether there are any more results to come. The script should continue retrieving chunks of results until no continuation token is received. For an example of using a continuation token, see [Activity Events REST API](/rest/api/power-bi/admin/get-activity-events#get-the-next-set-of-audit-activity-events-by-sending-the-continuation-token-to-the-api-example).
- **Access token expirations:** Upon authenticating, an access token is returned. By default, it expires after one hour. The cmdlets handle access token expirations for you. That way, you don't need to write logic to request a refresh token.
- **Formatting:** The data returned by a cmdlet is formatted slightly nicer than the data returned by the REST API. The output is more user-friendly. For automated auditing processes, that's not likely to be an issue. However, for manual auditing processes the nicer formatting might be helpful.

##### Considerations for using the REST APIs directly

Sometimes there are advantages to calling the Power BI REST APIs directly.

- **Many more APIs available:** There are more REST APIs available than PowerShell cmdlets. However, don't overlook the flexibility of the [Invoke-PowerBIRestMethod](/powershell/module/microsoftpowerbimgmt.profile/invoke-powerbirestmethod) cmdlet, which you can use to call any of the Power BI REST APIs.
- **Frequency of updates:** Microsoft updates the REST APIs more frequently than it updates the PowerShell modules. For example, if a new attribute is added to the [Get Dataset](/rest/api/power-bi/datasets/get-dataset) API response, it could take some time before it becomes available in the results of the [Get-PowerBIDataset](/powershell/module/microsoftpowerbimgmt.data/get-powerbidataset) cmdlet.
- **Less language/tool dependency:** When you use the REST APIs directly (instead of a cmdlet), you don't need to use PowerShell. Or, you might choose to use PowerShell only to orchestrate calling many APIs in a script. By removing (or avoiding) any dependency on PowerShell, at some time in the future you can rewrite your logic in a different language. When your IT or developer team has strong preferences for tools and languages, less dependency can be an important consideration to take into account.

Regardless of which method you choose to use, the REST APIs can change over time. When a technology evolves, APIs (and PowerShell modules) can be deprecated and replaced. Therefore, we recommend that you purposefully create scripts that are simple to maintain and resilient to change.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When choosing whether to access the REST APIs directly or by using PowerShell cmdlets, key decisions and actions include:

> [!div class="checklist"]
> - **Consult with IT on the use of PowerShell:** Contact the relevant IT team(s) to determine whether there are existing internal requirements or preferences on how PowerShell can be used.
> - **Decide how you want to use PowerShell:** Determine which PowerShell techniques to use, and whether you want to intentionally increase or reduce your dependency on PowerShell. Consider whether internal communication or training is necessary.
> - **Upgrade to PowerShell Core:** Research using PowerShell Core. Determine whether administrator machines need to be updated. Consider which existing scripts need to be tested. Determine whether administrators or developers need additional training to upgrade their skills.
> - **Determine which PowerShell modules to use:** Consider whether the Power BI Management modules and/or the Data Gateway module will be used.
> - **Decide whether community projects are permitted:** Determine whether you're allowed (or even encouraged) to use PowerShell modules available online (versus modules published by Microsoft). Consult with IT to determine whether there are criteria for community projects obtained online.
> - **Clarify how to support community projects:** If PowerShell community projects are permitted, consider who'll be responsible for supporting them once they're used internally.
> - **Complete a small proof of concept (POC):** Experiment with a technical POC. Confirm your preferred client tools and method of accessing data.
> - **Determine how to support advanced users:** Consider how you're going to support technical users who create automation on their own by using the user APIs.

#### Determine where to store audit data

When you plan to build an end-to-end auditing solution, you'll need to decide where to store the raw data (and the curated data, which is covered in the [next section](#plan-to-create-curated-data)). Your decisions about data storage are related to your preferences for how to handle _data integration_.

When you extract raw auditing data, keep it simple. We recommend that you don't select specific attributes, perform transformations, or apply any formatting when you initially extract the data. Instead, extract all available attributes and store the data in its original state.

Here are several reasons why storing the raw data in its original state is a best practice.

- **All data available in history:** New attributes and new event types will become available over time. Storing all the raw data is a good way to ensure that you'll always have access to whatever data was available at the time you extracted it. Even when it takes you time—which could be weeks or months—to realize that new data attributes are available, it's possible to analyze them historically because you captured them in the raw data.
- **Resilient to change:** If the raw data format changes, the process that extracts the data isn't impacted. Because some auditing data is time-sensitive, it's important to make sure that you design a data extraction process that won't fail when a change occurs in the source.
- **Roles and responsibilities:** Different team members (such as data engineers or global administrators) might be responsible for creating the processes to access, extract, and store the raw audit data. Simplifying the data extraction process makes it easier for multiple teams to work together.

Here are some options for storing raw data.

- **Data lake or object storage:** A cloud service such as [OneLake](/fabric/onelake/onelake-overview) that specializes in storing files of any structure. It's an ideal choice for storing the raw audit data. In a data lake architecture, raw data should be stored in the bronze layer.
- **File system:** A file system (such as Windows or Linux) is a common choice for storing the raw audit data.
- **Database:** It's possible to store JSON data in a relational database, like [Azure SQL Database](/azure/azure-sql/database/json-features?view=azuresql&preserve-view=true). However, it's less common than storing the data in a data lake or file system. That's because querying and maintaining JSON data can become challenging and expensive, especially as data volumes grow.

> [!TIP]
> When you use a data lake, object storage, or a file system, we recommend that you store the data in a way that's easy to organize and secure. It's also important to be clear about whether the data comprises events (which are typically appended) or whether it's a point-in-time snapshot (which requires selecting a date to analyze).

Consider an example involving a raw data zone of a data lake. The zone has a folder hierarchy for storing activity log data: Raw \> ActivityLog \> YYYY \> MM. The folders are partitioned by year and month. A file stored in the month folder uses the following format: PBIActivityLog-YYYYMMDD-YYYYMMDDTTTT.json. _YYYYMMDD_ represents the actual data, and _YYYYMMDDTTTT_ represents the extraction time stamp. By including the extraction time stamp, you can determine which file is the latest (in case you need to extract the data again). For example, if you extract data at 9am (UTC) on April 25, 2023 for activity on April 23, 2023, the file name would be PBIActivityLog-20230523-202305250900.

We strongly recommend that you use a technology that allows you to write the raw data to _immutable storage_. Immutable storage guarantees that once the data is written, it can't be overwritten or deleted. That distinction is important to auditors, and it allows you to trust that the raw data is reliable.

You also need to consider how to securely store the raw data. Typically, very few users require access the raw data. Access to raw data is typically provided on a needs-basis, typically for data engineers and system administrators. Your internal auditors might also need access. The team members who are responsible for creating the curated data (described next) also require access to the raw data.

Here are some considerations to help you choose your raw data storage.

- **Is it a manual or automated auditing process?** An automated auditing process typically has stricter requirements for how and where data is stored.
- **Is the subject area particularly sensitive?** Depending on the type of data and how sensitive it is, your organization might have a requirement for how and where it's stored. Power BI audit data contains identifying user information and IP addresses, so it should be stored in a secure area.
- **Is there a preferred storage technology?** There might be an existing storage technology that's in use within the organization, so it's a logical choice.
- **Will users access the storage directly?** The security model is an important consideration. Usually, very few users are granted access to raw data. Access to the curated data is typically made available to Power BI content creators who are responsible for creating the centralized data model (the semantic model that serves as the layer for reporting).
- **Do you have data residency requirements?** Some organizations have legal or regulatory data residency requirements to store data in a specific data region.
- **How will the data be organized?** Use of the [medallion architecture](/fabric/data-engineering/tutorial-lakehouse-introduction) is a common practice, particularly in data lake and lakehouse implementations. The goal is to store your data in bronze, silver, and gold data layers. The bronze layer contains the original raw data. The silver layer contains validated and deduplicated data used for transformations. The gold layer contains the curated, highly refined data that's ready for analysis.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning the location to store raw data, key decisions and actions include:

> [!div class="checklist"]
> - **Consult with IT:** Contact the relevant IT team(s) to determine whether there are existing processes running to extract the raw audit data. If so, find out whether you can access the existing data. If a new data extract process is required, determine whether there are preferences or requirements for where the data should be stored.
> - **Decide where to store raw data:** Determine the best storage location and structure for storing the raw data.
> - **Determine data residency requirements:** Find out whether there are legal or regulatory requirements for where the data can be stored.
> - **Create a folder structure and naming convention:** Determine what naming convention to use for raw data files, including the folder structure. Include these details in your technical documentation.
> - **Consider how security for raw data will work:** While you design the raw data storage location, consider who'll need to access the data and how access will be granted.

#### Plan to create curated data

Curated data supports analysis and is designed to be user-friendly. You need to make some decisions on how and where curated data will be created. The technology you choose to store the curated data might be any of the technologies listed in the [previous section](#determine-where-to-store-audit-data).

The goal of curated data is to transform the data into a more friendly format that's optimized for analysis and reporting. It forms the data source of a Power BI data model, so that means you use a Power BI data model to analyze the usage of Power BI in your organization. Fundamental data model guidance applies: You should adopt a [star schema design](star-schema.md), which is optimized for performance and usability.

You can choose to create curated data in different ways. You need to decide how to do _data integration_ and how far _upstream_ to apply the transformations that prepare the data for loading into a star schema.

##### Data lake

You can apply transformations and create curated data files in a data lake. You should use a gold layer for curated data so that it's logically separate from the raw data that's stored in the bronze layer. Separating the data in layers also simplifies setting different user access permissions.

Use a data lake to transform and curate the data when:

- You expect that there'll be multiple Power BI data models that serve reporting (which justifies the creation of an intermediary silver layer).
- You need to support multiple self-service content creators who need access to tenant-level audit data.
- You have existing tools and processes that you want to use to transform and load data.
- You want to minimize the data preparation that needs to be done (and potentially duplicated) within one or more Power BI data models.

##### Power BI data model

You might be able to complete all the transformation work in Power BI. Use Power Query to access and transform the data from its raw state to the curated format.

Use a Power BI data model when:

- You want to simplify the end-to-end architecture and load the data model directly from the raw data. ([Incremental refresh](../connect-data/incremental-refresh-overview.md) can help reduce refresh durations.)
- Your preference is to do all the transformation work while loading the data model.
- You expect to have one centralized data model for the tenant-level audit data. All reports (or other data models) can use the centralized Power BI semantic model as its source.
- You want to provide user access only to the centralized Power BI semantic model (and not to any of the source data).

> [!TIP]
> When you create the curated data, set it up in a way so you can easily re-run the process for earlier date ranges. For example, if you discover that a new attribute appeared in the audit logs three months ago, you will want to be able to analyze it since it first appeared. The ability to reload the curated data history is one of several reasons why it's important to store the raw data in its original state (described earlier in this article).

For more information about what dimension tables and fact tables you might include in your star schema, see [Create a data model](#create-a-data-model) later in this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning how to create curated data, key decisions and actions include:

> [!div class="checklist"]
> - **Decide where transformations should be done:** Consider how far upstream the transformation work should be done, and where that fits into your plan for the entire architecture.
> - **Decide what tool to use to transform the data into a star schema:** Confirm which tools and services will be used for transforming the raw data into curated data.
> - **Decide where curated data should be stored:** Determine the best choice for storing the raw data that's been transformed into a star schema format. Decide whether an intermediary silver layer is useful in the end-to-end architecture.
> - **Create a naming convention:** Determine what naming convention to use for curated data files and folders (if applicable). Include the details in your technical documentation.
> - **Consider how security for curated data will work:** While designing the curated data storage location, consider who'll need to access the data and how security will be assigned.

### Data source decisions

At this point, you should be clear on requirements, data needs, and permissions. Key technical decisions have been made. You now need to make some decisions about the approach for how you'll obtain certain types of data.

#### Access user activity data

The Power BI user activity data, which is sometimes referred to as the _activity log_ or _audit logs_, includes a wealth of information to help you understand what's happening in your Power BI tenant. For more information about identifying your data needs, see [User activity data](#user-activity-data) earlier in this article.

Power BI integrates its logs with the [Microsoft Purview unified audit log](/microsoft-365/compliance/audit-solutions-overview) (formerly known as the Microsoft 365 unified audit log). This integration is an advantage because it means every service within Microsoft 365 doesn't have to implement its own unique way of logging. It's enabled by default.

> [!IMPORTANT]
> If you're not already extracting user activity data, make that an urgent priority. The user activity data is available for the most recent 30 or 90 days (depending on the source). Even when you're not ready to do in-depth analytics, it's important to begin extracting and storing the data as soon as possible. That way, valuable history will be available to analyze.

You have several options to retrieve user activity data.

| **Technique** | **Description** | **Default days of history available** | **Good choice for manual auditing processes** | **Good choice for automated auditing processes** | **Good choice to set up alerting** | **Good choice to get started quickly** |
| --- | --- | :-: | :-: | :-: | :-: | :-: |
| Manual (user interface) | Microsoft Purview compliance portal | 90 | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Microsoft Purview compliance portal is a good choice for manual auditing processes." border="false"::: | | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Microsoft Purview compliance portal is a good choice to get started quickly." border="false"::: |
| Manual (user interface) | Defender for Cloud Apps | 30 | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Defender for Cloud Apps is a good choice for manual auditing processes." border="false"::: | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Defender for Cloud Apps is a good choice to set up alerting." border="false"::: | |
| Programmatic | Power BI activity log (API or PowerShell cmdlet) | 30 | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Power BI activity log (API or PowerShell cmdlet) is a good choice for automated auditing processes." border="false"::: | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Power BI activity log (API or PowerShell cmdlet) is a good choice to get started quickly." border="false"::: |
| Programmatic | Office 365 Management Activity API | 7 | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Office 365 Management Activity API is a good choice for automated auditing processes." border="false"::: | | |
| Programmatic | Microsoft Sentinel (Azure Monitor) | 30 | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Microsoft Sentinel (Azure Monitor) is a good choice for automated auditing processes." border="false"::: | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Microsoft Sentinel (Azure Monitor) is a good choice to set up alerting." border="false"::: | |

The remainder of this section introduces each of the techniques presented in the table.

##### Microsoft Purview compliance portal

The [audit search tool](/microsoft-365/compliance/audit-new-search) in the Microsoft Purview compliance portal (formerly known as the Microsoft 365 compliance center) is a convenient place to view activities and alerts. This tool doesn't require you to create a script to extract and download the data. You can choose a Power BI workload to view all the audit log records for a range of time. You can also narrow down the results by selecting specific activities and users. For example, a manager asks you to find out who deleted a workspace earlier that day so they can quickly contact the person to discuss the situation.

The most recent 90 days of history are available with [Audit (Standard)](/microsoft-365/compliance/audit-standard-setup). With [Audit (Premium)](/microsoft-365/compliance/audit-premium), [long-term retention](/microsoft-365/compliance/audit-premium#long-term-retention-of-audit-logs) allows you to (optionally) retain audit logs longer. Since long-term retention only applies to [licensed E5 users](/microsoft-365/compliance/audit-log-retention-policies#default-audit-log-retention-policy), it excludes audit records for non-E5 users and guest users. Therefore, we recommend that you only rely on the default 90-day history to ensure that all activity is captured.

There are [licensing requirements](/microsoft-365/compliance/audit-solutions-overview#licensing-requirements) to access the audit logs in the Microsoft Purview compliance portal. Elevated [Exchange Online permissions](/microsoft-365/compliance/audit-log-search#before-you-search-the-audit-log) are also required in order to access the audit logs.

> [!TIP]
> By default, Power BI administrators don't have permission to access the unified audit log search in the Microsoft Purview compliance portal. Because it contains data for many Microsoft 365 services, it's a high-privilege role. In most organizations, those permissions are reserved for a small number of IT administrators. There are other options available to Power BI administrators, which are described later in this section.

The user interface in the Microsoft Purview compliance portal is useful for manual auditing processes and occasional investigations of user activities.

##### Defender for Cloud Apps

The portal in [Defender for Cloud Apps](powerbi-implementation-planning-defender-for-cloud-apps.md) is a convenient place to view activities and alerts without the need to create a script to extract and download the data. It also allows you to view data from the Power BI activity log and user sign-ins.

Defender for Cloud Apps includes a user interface to view and search activity logs for various cloud services, including Power BI. It displays the same log events that originate in the Microsoft Purview unified audit log, and it includes other events like user sign-in activity from Microsoft Entra ID.

Like the Microsoft Purview compliance portal (described in the previous section), Defender for Cloud Apps has a searchable user interface. However, the filter options are different. In addition to the standard 30-day history, you can use Defender for Cloud Apps to view up to six months of activity log history (in seven-day increments).

There are [licensing requirements](/defender-cloud-apps/get-started#prerequisites) to access Defender for Cloud Apps. Separate [permissions](/defender-cloud-apps/manage-admins) are also required.

> [!TIP]
> By default, Power BI administrators don't have permission to access Defender for Cloud Apps. There's a [Power BI role](/fabric/governance/service-security-using-defender-for-cloud-apps-controls#power-bi-admin-role-in-defender-for-cloud-apps) in Defender for Cloud Apps. Adding Power BI administrators to this role is a good way to grant them access to a limited set of data.

The user interface in Defender for Cloud Apps is useful for manual auditing processes and one-off investigations of user activities.

##### Power BI activity log

The Power BI activity log originates from the unified audit log. It contains only user activities related to the Power BI service.

> [!TIP]
> For organizations that are planning to extract user activities, we recommend they start with the Power BI activity log. It's the simplest source to programmatically access.

You have two options to access the Power BI activity log.

- Call the [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) REST API by using the [tool of your choice](#select-a-technology-to-access-audit-data).
- Use the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) PowerShell cmdlet. It's available from the Power BI Management Admin module.

For information about which option to use, see [Choose APIs or PowerShell cmdlets](#choose-apis-or-powershell-cmdlets) earlier in this article.

> [!TIP]
> For examples of how to access the Power BI activity log with PowerShell, see [Access the Power BI activity log](admin-activity-log.md).

Power BI activity log data is available to all Power BI administrators, Power Platform administrators, and global administrators. The data can be accessed from the unified audit log, available to certain Exchange Online roles. For more information, see [Track user activities in Power BI](../enterprise/service-admin-auditing.md).

We recommend that you use the Power BI activity log when your intention is to only retrieve Power BI audit log records.

> [!NOTE]
> In the audit log data, workspaces are referred to as _folders_. In the Power BI REST API, workspaces are referred to as _groups_.

##### Office 365 Management Activity API

You can extract data from the unified audit log for other services, such as SharePoint Online, Teams, Exchange Online, Dynamics 365, and Power BI. When your goal is to implement an auditing and monitoring solution for multiple services, we recommend that you use the [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference). Because this API returns data from many services, it's known as the _Unified Auditing API_ (or the _unified audit log_). It's one of the [Office 365 Management APIs](/office/office-365-management-api/office-365-management-apis-overview).

Before you build a new solution, we recommend that you contact your IT department to determine whether existing Power BI audit records are available. It's possible that a process already extracts and stores the data. It's also possible that you might obtain permission to access this data rather than build a new solution.

You can access the data one of two ways.

- Call the [Office 365 Management Activity](/office/office-365-management-api/office-365-management-activity-api-reference) API directly by using the [tool of your choice](#select-a-technology-to-access-audit-data). By default, the API returns 24 hours of data. You can retrieve a maximum of seven days of history.
- Use the [Search-UnifiedAuditLog](/powershell/module/exchange/search-unifiedauditlog) PowerShell cmdlet. It's an Exchange Online PowerShell cmdlet. You can retrieve a maximum of 90 days of history.

> [!IMPORTANT]
> The `Search-UnifiedAuditLog` cmdlet doesn't scale well and it requires you to implement a looping strategy to overcome its 5,000-row limit. For these reasons, it's suited to occasional queries, or for small organizations that experience low activity. When you only need Power BI data, we recommend that you use the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent) cmdlet instead.

In general, [getting started](/office/office-365-management-api/get-started-with-office-365-management-apis) with the Office 365 Management Activity API is more challenging than using the Power BI activity log (described previously). That's because the API returns content blobs, and each content blob contains individual audit records. For large organizations, there could be thousands of content blobs per day. Because customers and third-party applications heavily use this API, Microsoft implements throttling to ensure that their use of the service doesn't negatively impact others (known as the _noisy neighbor_ problem). Therefore, retrieving large volumes of history can be a challenge in larger organizations. For more information, see this [troubleshooting article](/office/office-365-management-api/troubleshooting-the-office-365-management-activity-api).

To use this API, you must authenticate with a service principal that's been granted [permission](/office/office-365-management-api/get-started-with-office-365-management-apis#specify-the-permissions-your-app-requires-to-access-the-office-365-management-apis) to retrieve data from the Office 365 Management Activity API.

> [!TIP]
> By default, Power BI administrators don't have permission to access the Office 365 Management Activity API. Because it contains data for many Microsoft 365 services, access requires the high-privilege administrator or audit roles. In most organizations, these roles are reserved for a small number of IT administrators. The Power BI activity log is intended for use by Power BI administrators.

Retrieving the audit data programmatically from the Office 365 Management Activity API is a good choice when IT needs to extract and store audit logs from various services (beyond Power BI).

##### Microsoft Sentinel

[Microsoft Sentinel](/azure/sentinel/overview) is an Azure service that allows you to collect, detect, investigate, and respond to security incidents and threats. You can set up Power BI in Microsoft Sentinel as a _data connector_. When connected, audit logs (that contain a subset of data) are streamed from Power BI into Azure Log Analytics, which is a capability of [Azure Monitor](/azure/azure-monitor/).

> [!TIP]
> Azure Log Analytics is based on the same architecture used by the workspace-level semantic model event logs. For more information about semantic model events logs, see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md#semantic-model-event-logs).

Because it's a separate Azure service, any administrator or user that you want to run [Kusto Query Language](/azure/data-explorer/kusto/query/) (KQL) queries must be granted permissions in Azure Log Analytics (Azure Monitor). When they have permission, they can query the audit data stored in the _PowerBIActivity_ table. However, keep in mind that in most cases you'll grant users access to the curated data in the gold layer rather than the raw data in the bronze layer.

You use KQL to analyze the activity log events that are stored in Azure Log Analytics. If you have SQL experience, you'll find many similarities with KQL.

There are several ways to access the events stored to Azure Log Analytics. You can use:

- The prebuilt _Log Analytics for Power BI Semantic Models_ template app.
- Power BI Desktop [connector](/azure/data-explorer/power-bi-connector) for Azure Data Explorer (Kusto).
- [Web-based query](/azure/data-explorer/web-query-data) experience in Azure Data Explorer.
- Any query tool that can send KQL queries.

> [!CAUTION]
> Be aware that only a [subset](/azure/azure-monitor/reference/tables/powerbiactivity) of the Power BI activity log data is stored in Azure Monitor. When you plan to do comprehensive analysis of Power BI usage and adoption in the organization, we recommend that you use other options (described earlier in this section) to retrieve activity data.

The period of history that you can retrieve depends on the [data retention](/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2#configure-the-default-workspace-retention-policy) policy for the Azure Log Analytics workspace. Consider cost and access to raw data when deciding on how much data to retain.

Microsoft Sentinel and Azure Monitor are good options when IT has already made an investment with Microsoft Sentinel, the level of detail captured meets your needs, and activities such as [threat detection](/azure/sentinel/detect-threats-built-in) are a priority. However, because Microsoft Sentinel doesn't capture all Power BI activity data, it doesn't support performing comprehensive analysis of Power BI usage and adoption.

##### User activity data considerations

Here are some considerations to help you choose your source for user activity data.

- **Will it be a manual or automated auditing process?** The user interface options work well for manual auditing processes and occasional one-off queries, especially when you need to investigate a specific activity. An automated auditing process that extracts the user activity data on a schedule will also be necessary to support historical data analysis.
- **How often do you need the user activity data?** For automated auditing processes, plan to extract data that's at least one day before the current date by using Coordinated Universal Time (UTC), rather than your local time. For example, if your process runs on Friday morning (UTC time), you should extract data from Wednesday. There are several reasons why you should extract data with one day latency.
  - Your files will be simpler to work with when you always extract a full 24 hours at a time, which avoids partial day results.
  - You'll minimize the risk of missing some audit events. Usually, audit events arrive within 30 minutes. Occasionally some events can take up to 24 hours to arrive in the unified audit log.
- **Do you need more than Power BI data?** Consider the most efficient way to access what you need.
  - When you only need Power BI user activity data, use the [Power BI activity log](../enterprise/service-admin-auditing.md).
  - When you need audit logs from multiple services, use the [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference) to access the unified audit log.
- **Who will develop the solution?** Plan to invest some time to build out the solution. It can take significant effort to produce a production-ready script.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning how to access user activity data, key decisions and actions include:

> [!div class="checklist"]
> - **Clarify scope of needs:** Determine whether you need to access only Power BI audit records, or audit data for multiple services.
> - **Consult with IT:** Find out whether IT currently extracts audit logs, and whether it's possible to obtain access to the raw data so that you don't need to build a new solution.
> - **Decide on a data source:** Determine the best source to use to access user activity data.
> - **Complete a proof of concept:** Plan to complete a small technical proof of concept (POC). Use it to validate your decisions about how the final solution will be built.
> - **Track additional data needs:** You can correlate activity log data with other sources to enhance the value of the data. Keep track of these opportunities as they arise so they can added to the scope of your project.

#### Access tenant inventory data

A tenant inventory is an invaluable, and necessary, part of a mature auditing and monitoring solution. It helps you understand what workspaces and content (semantic models, reports, and other items) exist in Power BI, and it's an excellent complement to the user activity data (described in the previous section). For more information about identifying your data needs, see [Tenant inventory](#tenant-inventory) earlier in this article.

User activities (previously described) are audited events; they're a record of actions that a user took at a specific date and time. However, the tenant inventory is different. The tenant inventory is a _snapshot_ at a given point in time. It describes the current state of all published items in the Power BI service at the time you extracted it.
> [!NOTE]
> Power BI REST API documentation refers to published items as _artifacts_.

> [!TIP]
> Many organizations find it helpful to extract the tenant inventory at the same time of day every week.

To properly analyze what's happening in your Power BI tenant, you need both the user activity data and the tenant inventory. Combining them allows you to understand how much content you have and where it's located. It also allows you to find unused or under-utilized content (because there won't be any events for it in the activity log). The tenant inventory also helps you compile a list of current names for all items, which is helpful when item names change.

For more information about the value of the tenant inventory, see [Tenant inventory](#tenant-inventory) earlier in this article.

> [!TIP]
> You can use the [Get Unused Artifacts as Admin](/rest/api/power-bi/admin/groups-get-unused-artifacts-as-admin) API to search for items that don't have any user activity in that last 30 days. However, you can't customize that time period. For example, you might have critical content that's only used quarterly. By combining your tenant inventory with the user activity data, you can find unused items in ways that you can customize.

You can obtain tenant inventory data in two different ways.

| **Technique** | **Description** | **Most suited to** | **Good choice for manual auditing processes** | **Good choice for automated auditing processes** |
| --- | --- | --- | :-: | :-: |
| Programmatic | The `Get Groups as Admin` API or the `Get-PowerBIWorkspace` PowerShell cmdlet can provide a list of workspaces for the entire tenant. Optionally, individual items (like semantic models and reports) per workspace can be included. | Smaller organizations or low data volume | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="The Get Groups as Admin API or the Get-PowerBIWorkspace PowerShell cmdlet is a good choice for manual auditing processes." border="false"::: | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="The Get Groups as Admin API or the Get-PowerBIWorkspace PowerShell cmdlet is a good choice for automated auditing processes." border="false"::: |
| Programmatic | A set of asynchronous admin APIs, collectively known as the _metadata scanning APIs_ or _scanner APIs_, can return a list of workspaces and individual items. Optionally, detailed metadata (like tables, columns, and measure expressions) can be included as well. | Organizations with high data volume and/or a need to obtain detailed results | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="The metadata scanning APIs are a good choice for automated auditing processes." border="false"::: |

The remainder of this section introduces each of the techniques presented in the table.

##### Groups APIs or workspaces cmdlet

To retrieve a list of workspaces, you can use one of several REST APIs, such as the [Get Groups as Admin](/rest/api/power-bi/admin/groups-get-groups-as-admin) API (using the [tool of your choice](#select-a-technology-to-access-audit-data)). The results include extra metadata such as the description and whether the workspace is stored in a Premium capacity.

> [!NOTE]
> The API named includes the term _group_ as a reference to a workspace. That term originated from the original Power BI security model, which relied on Microsoft 365 groups. While the Power BI security model has evolved significantly over the years, the existing API names remain unchanged to avoid breaking existing solutions.

The `Get Groups as Admin` REST API includes the helpful `$expand` parameter. This parameter allows you to optionally expand the results so that they include a list of items published to the workspace (such as semantic models and reports). You can also pass the `users` data type to the `$expand` parameter to include the users who are assigned to a workspace role.

You can also use the [Get-PowerBIWorkspace](/powershell/module/microsoftpowerbimgmt.workspaces/get-powerbiworkspace) PowerShell cmdlet. It's from the Power BI Management Workspaces module. When you set the `-Scope` parameter `organization`, it functions like the `Get Groups as Admin` API. The cmdlet also accepts the `-Include` parameter (which is the equivalent of the `$expand` parameter in the REST API) to include items published in the workspace (such as semantic models and reports).

> [!TIP]
> By passing in parameters, you can use the cmdlet in different ways. This section focuses on retrieving a tenant-wide inventory. For more information about using the `-Scope` parameter, see [Choose a user API or admin API](#choose-a-user-api-or-admin-api) earlier in this article.

To help you choose which option to use, see [Choose APIs or PowerShell cmdlets](#choose-apis-or-powershell-cmdlets) earlier in this article.

The `Get Groups as Admin` REST API or the `Get-PowerBIWorkspace` PowerShell cmdlet is best suited to manual auditing processes and one-off investigations. Larger organizations with high data volume typically find these options challenging to use. The REST API and cmdlet always extract a full set of data, so they can take a long time to run. So, it's also likely that larger organizations will run into limitations on the number of requests allowed per hour (known as _throttling_, which is done to protect the health of the service). The metadata scanning APIs (described next) provide a more reliable and scalable alternative.

##### Metadata scanning APIs

The [metadata scanning APIs](/fabric/governance/metadata-scanning-overview), commonly called the _scanner APIs_, are a set of APIs that return a list of workspaces and their Power BI items (semantic models, reports, and other items). Conceptually, they provide the same data (and more) as the Groups APIs or the workspace cmdlet, which are described in the previous section. However, the method you use to retrieve the data is different and better suited to extracting the tenant inventory.

> [!NOTE]
> Take notice of how some people use the term _scanner APIs_ or the phrase _scanning the tenant_. They often use those terms to mean _compiling a tenant inventory_, distinguishing it from the user activity events. They might, or might not, be literally referring to the use of the metadata scanning APIs.

There are two primary reasons why you should consider using the metadata scanning APIs instead of the `Get Groups as Admin` REST API or the `Get-PowerBIWorkspace` cmdlet (described previously).

- **Incremental data extract:** The scanner APIs only extract data that's changed since the last time it was run. Conversely, the `Get Groups as Admin` REST API and the `Get-PowerBIWorkspace` cmdlet are synchronous operations that extract the full set of data every time they run.
- **More granular level of detail:** The scanner APIs can retrieve granular detail (like tables, columns, and measure expressions), providing permission is granted by the two tenant settings for detailed metadata. Conversely, the lowest level of detail available with the `Get Groups as Admin` REST API and the `Get-PowerBIWorkspace` cmdlet is by item type (for example, a list of reports in a workspace).

Using the scanner APIs involves more effort because you need to call a series of APIs. Also, they run as an _asynchronous_ process. An asynchronous process runs in the background, and so you don't have to wait for it to finish. You might need to collaborate with IT, or a developer, when it's time to create a production-ready script that will be scheduled.

Here's the sequence of steps your process should follow when using the scanner APIs.

1. **Sign in:** Sign in to the Power BI service by using a Power BI administrator account or a service principal that has permission to run admin APIs. For more information, see [Determine the authentication method](#determine-the-authentication-method) earlier in this article.
2. **Get the workspace IDs:** Send a request to retrieve a [list of workspace IDs](/rest/api/power-bi/admin/workspace-info-get-modified-workspaces). The first time it's run, you won't have a modified date, so it will return a complete list of workspaces. Usually, you'll pass the modified date to retrieve only workspaces that have changed since that point in time. The modified date must be within the last 30 days.
3. **Initiate a metadata scan:** Initiate a call to [request a scan of workspace information](/rest/api/power-bi/admin/workspace-info-post-workspace-info) by passing in the workspace IDs retrieved in Step 2. Note that this is a _POST_ API (instead of a _GET_ API, which is more common when retrieving audit data). A POST API is an HTTP request that creates or writes data for a specified resource. This query specifies the level of detail that will be extracted, such as data source details, semantic model schema, semantic model expressions, or users. When submitted, an ID for the scan is returned by the API. It also returns the date and time of the scan, which you should record as the snapshot date.
4. **Check the scan status:** Use the scan ID obtained in Step 3 to get the [scan status](/rest/api/power-bi/admin/workspace-info-get-scan-status). You might need to call this API more than once. When the returned status is _Succeeded_, can proceed to the next step. The time it takes to scan depends on how much data you request.
5. **Get the results:** Use the scan ID obtained in Step 3 to get the [scan result](/rest/api/power-bi/admin/workspace-info-get-scan-result) and extract the data. You must do this step within 24 hours of completing Step 4. Keep in mind that the snapshot time stamp should be correlated with Step 3 rather than Step 5 (when there's a significant delay). That way, you'll have an accurate snapshot time stamp. Save the results in your [preferred data storage location](#determine-where-to-store-audit-data). As already described in this article, we recommend that you store the raw data in its original state.
6. **Prepare for the next process:** Record the time stamp of the scan from Step 3 so you can use it in Step 2 the next time you run the process. That way, you'll only extract data that's changed since that point in time. Moving forward, all subsequent data extracts will be incremental changes rather than full snapshots.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for access to the tenant inventory data, key decisions and actions include:

> [!div class="checklist"]
> - **Confirm requirements:** Clarify needs for compiling a tenant inventory and the analytical requirements for the data.
> - **Decide on the frequency for extracting tenant inventory:** Confirm how often you'll need a new tenant inventory (such as every week).
> - **Decide how to extract the tenant inventory:** Confirm which method you will use to obtain the tenant inventory data (API, cmdlet, or metadata scanning APIs).
> - **Complete a proof of concept:** Plan to complete a small technical proof of concept (POC). Use it to validate your decisions about how the final solution will be built.

#### Access user and group data

In addition to the identifying information (like an email address) that's included in the user activity data, it's valuable to retrieve additional information such as location or organizational details. You can use [Microsoft Graph](/graph/overview) to retrieve data about users, groups, service principals, and licenses. Microsoft Graph comprises a set of APIs and client libraries that allow you to retrieve audit data from a wide variety of services.

Here are some details about the Microsoft Entra objects that you can access.

- **[User](/azure/active-directory/fundamentals/add-users-azure-active-directory):** An identity that exists in Microsoft Entra ID as a work, school, or Microsoft account. The term _domain user_ is often used to describe organizational users, while the formal term is _user principal name_ (UPN). A UPN is usually the same value as the user's email address (however, if an email address changes, the UPN doesn't change because it's immutable). There's also a unique Microsoft Graph ID for each user. Often, a user account is associated with one person. Some organizations create users that are _service accounts_ that are used for automated activities or for administrative tasks.
- **[Service principal](/azure/active-directory/develop/app-objects-and-service-principals):** A different type of identity, that's provisioned when you create an [app registration](/azure/active-directory/develop/quickstart-register-app). A service principal is intended for unattended, automated activities. For more information, see [Determine the authentication method](#determine-the-authentication-method) earlier in this article.
- **[Group](/azure/active-directory/fundamentals/concept-learn-about-groups):** A collection of users and service principals. There are several [types of groups](powerbi-implementation-planning-security-tenant-level-planning.md#type-of-group) that you can use to simplify permissions management. For more information, see [Strategy for using groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups).

> [!NOTE]
> When this article refers to _users and groups_, this term includes service principals as well. This shorter term is used for brevity.

The users and groups data that you retrieve is a _snapshot_ that describes the current state at a given point in time.

> [!TIP]
> For more information about users, service principals, and groups, see [Integration with Microsoft Entra ID](powerbi-implementation-planning-security-tenant-level-planning.md#integration-with-microsoft-entra-id).

##### Analytical attributes

For Power BI tenant-level auditing, you might extract and store the following attributes from Microsoft Graph.

- **Full name of users:** Many data sources only include the email address of the user that performed an activity or who's assigned to a role. Use this attribute when you want to display the full name (display name) in analytical reports. Using the full name makes reports more user-friendly.
- **Other user properties:** Other descriptive attributes about users might be available in Microsoft Entra ID. Some examples of built-in [user profile attributes](/azure/active-directory/fundamentals/active-directory-users-profile-azure-portal) that have analytical value include job title, department, manager, region, and office location.
- **Members of a security group:** Most data sources provide the name of a group (for example, the Power BI activity log records that a security group was assigned to a workspace role). Retrieving the group membership improves your ability to fully analyze what an individual user is doing or has access to.
- **User licenses:** It's useful to analyze which [user licenses](../fundamentals/service-features-license-type.md)—free, Power BI Pro, or Power BI Premium Per User (PPU)—are assigned to users. This data can help you to identify who's not using their license. It also helps you to analyze all users (distinct users with a license) versus active users (with recent activities). If you're considering adding or expanding your Power BI Premium licenses, we recommend that you analyze the user license data together with user activity data to perform a cost analysis.
- **Members of the administrator roles:** You can compile a list of your Power BI administrators are (which includes Power Platform administrators and global administrators).

For the authoritative reference of Power BI license information that you can find in the audit data from Microsoft Graph, see [Product names and service plan identifiers for licensing](/azure/active-directory/enterprise-users/licensing-service-plan-reference).

> [!TIP]
> Retrieving members from groups can be one of the most challenging aspects of obtaining audit data. You will need to do a _transitive search_ to flatten out all nested members and nested groups. You can do a transitive search for [group members](/graph/api/group-list-transitivemembers). This type of search is especially challenging when there are thousands of groups in your organization. In that case, there might consider better alternatives to retrieve the data. One option is to extract all groups and group members from Microsoft Graph. However, that might not be practical when only a small number of groups is used for Power BI security. Another option is to pre-build a reference list of groups that are used by any type of Power BI security (workspace roles, app permissions, per-item sharing, row-level security, and others). You can then loop through the reference list to retrieve [group members](/graph/api/group-list-transitivemembers) from Microsoft Graph.

Here are some other attributes you might extract and store.

- **User type:** Users are either [members or guests](/azure/active-directory/external-identities/user-properties). Most commonly, members are internal users and guests are external (B2B) users. Storing user type is useful when you need to analyze the activities of external users.
- **Role changes:** When you perform a security audit, it's useful to understand when a user changed roles in the organization (for example, when they transfer to a different department). That way, you can verify whether their Power BI security settings have been—or should be—updated.
- **Disabled users:** When a user leaves the organization, usually an administrator disables their account. You can create a process to check whether disabled users are workspace administrators or semantic model owners.

> [!TIP]
> The Power BI [activity log](../enterprise/service-admin-auditing.md) includes an event that records when a user signs up for a [trial license](../fundamentals/service-self-service-signup-purchase-for-power-bi.md#free-sign-ups-and-trials). You can combine that event with the user license data (sourced from Microsoft Entra ID) to produce a complete picture.

##### Retrieve users and groups data

You can retrieve data about users and groups in different ways.

| **Technique** | **Description** | **Good choice for manual auditing processes** | **Good choice for automated auditing processes** |
| --- | --- | :-: | :-: |
| Manual | Graph Explorer | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Graph Explorer is a good choice for manual auditing processes." border="false"::: | |
| Programmatic | Microsoft Graph APIs and SDKs | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Microsoft Graph APIs and SDKs are good choices for automated auditing processes." border="false"::: |
| Programmatic | Az PowerShell module | | :::image type="content" source="../includes/media/yes-icon.svg" alt-text="Az PowerShell module is a good choice for automated auditing processes." border="false"::: |

The remainder of this section introduces each of the techniques presented in the table. Other techniques, which are deprecated and shouldn't be used for new solutions, are described at the end of this section.

> [!NOTE]
> Be careful when you read information online because many tool names are similar. Some tools in the Microsoft ecosystem include the term _Graph_ in their name, like Azure Resource Graph, GraphQL, and the Microsoft Security Graph API. Those tools aren't related to Microsoft Graph, and they're out of scope for this article.

###### Microsoft Graph Explorer

[Microsoft Graph Explorer](/graph/graph-explorer/graph-explorer-overview) is a developer tool that lets you learn about [Microsoft Graph APIs](/graph/use-the-api). It's a simple way to get started because it requires no other tools or setup on your machine. You can sign in to retrieve data from your tenant, or retrieve sample data from a default tenant.

You can use Graph Explorer to:

- Manually send a request to a Microsoft Graph API to check whether it returns the information that you want.
- See how to construct the URL, headers, and body before you write a script.
- Check data in an informal way.
- Determine which permissions are required for each API. You can also provide [consent](/graph/graph-explorer/graph-explorer-features#consent-to-permissions) for new permissions.
- Obtain code snippets to use when you create scripts.

Use [this link](https://developer.microsoft.com/graph/graph-explorer) to open Graph Explorer.

###### Microsoft Graph APIs and SDKs

Use the [Microsoft Graph APIs](/graph/api/overview) to retrieve users and groups data. You can also use it to retrieve data from services such as Microsoft Entra ID, SharePoint Online, Teams, Exchange, Outlook, and more.

The [Microsoft Graph SDKs](/graph/sdks/sdks-overview) act as an _API wrapper_ on top of the underlying Microsoft Graph APIs. An SDK is a _software development kit_ that bundles tools and functionality together. The Microsoft Graph SDKs expose the entire set of Microsoft Graph APIs.

You can choose to send requests directly to the APIs. Alternatively, you can add a layer of simplification by using your preferred language and one of the SDKs. For more information, see [Choose APIs or PowerShell cmdlets](#choose-apis-or-powershell-cmdlets) earlier in this article.

The Microsoft Graph SDKs [support several languages](/graph/sdks/sdks-overview#supported-languages), and there's also the [Microsoft Graph PowerShell](/powershell/microsoftgraph/overview) modules. Other SDKs are available for Python, C#, and other languages.

> [!IMPORTANT]
> The Microsoft Graph PowerShell module replaces the Azure AD PowerShell modules and MSOnline (MSOL) modules, which are both deprecated. You shouldn't create new solutions with deprecated modules. The Microsoft Graph PowerShell module has many [features and benefits](/powershell/microsoftgraph/overview). For more information, see [Upgrade from Azure AD PowerShell to Microsoft Graph PowerShell](/powershell/microsoftgraph/migration-steps).

You can install the Microsoft Graph PowerShell modules from the [PowerShell Gallery](https://www.powershellgallery.com/packages/Microsoft.Graph). Because Microsoft Graph works with many Microsoft 365 services, there are many PowerShell [modules](https://github.com/microsoftgraph/msgraph-sdk-powershell/wiki/MS-Graph-PowerShell-Modules) that you install.

For Power BI tenant-level auditing, here are the most common PowerShell modules you'll need to install.

- [Authentication](https://www.powershellgallery.com/packages/Microsoft.Graph.Authentication) (for signing in)
- [Users](https://www.powershellgallery.com/packages/Microsoft.Graph.Users)
- [Groups](https://www.powershellgallery.com/packages/Microsoft.Graph.Groups)
- [Applications](https://www.powershellgallery.com/packages/Microsoft.Graph.Applications) (and service principals)
- [Directory objects](https://www.powershellgallery.com/packages/Microsoft.Graph.DirectoryObjects) (and license details)

> [!TIP]
> Microsoft updates the Microsoft Graph PowerShell modules regularly. Sometimes, preview modules are made available on a pre-release basis or a beta endpoint. You might want to specify the version you're interested in when you install and update the modules. Also, when you review online documentation, note that the current version number is automatically appended to the end of the URL (so be careful when saving or sharing URLs).

###### Az PowerShell module

You can also use the [Az PowerShell module](/powershell/azure/new-azureps-module-az) to retrieve users and groups data. It focuses on Azure resources.

> [!IMPORTANT]
> The Az PowerShell module replaces the AzureRM PowerShell modules, which are deprecated. You shouldn't create new solutions with deprecated modules.

You can use the [Invoke-AzRestMethod](/powershell/module/az.accounts/invoke-azrestmethod) cmdlet when there isn't a corresponding cmdlet for an API. It's a flexible approach that allows you to send a request to any Microsoft Graph API by using the Az PowerShell module.

Beginning with Az version 7, the Az cmdlets now reference the Microsoft Graph API. Therefore, the Az module acts as an _API wrapper_ on top of Microsoft Graph. The Az modules have a subset of functionality that's contained in the Microsoft Graph APIs and PowerShell modules. For new solutions, we recommend that you use the Microsoft Graph PowerShell SDK.

##### Deprecated APIs and modules

You might find articles and blog posts online that suggest alternative options that aren't presented in this section. We strongly recommend that you _**do not**_ create new solutions (and/or migrate your existing solutions) by using any of the following APIs or modules.

- **AzureRM PowerShell modules:** Deprecated and will be retired. They've been replaced with the Az PowerShell module.
- **Azure AD Graph API and Azure AD PowerShell module:** Deprecated and will be retired. This change is the result of the migration from Azure AD Graph to Microsoft Graph (note that Graph appears in both names, but _Microsoft Graph_ is the future direction). All future PowerShell investments will be made in the Microsoft Graph PowerShell SDK. (Microsoft Entra ID is [now known as Microsoft Entra ID](/azure/active-directory/fundamentals/new-name).)
- **MS Online (MSOL) PowerShell module:** Deprecated and will be retired. All future PowerShell investments will be made in the Microsoft Graph PowerShell SDK.

> [!CAUTION]
> Be sure to confirm the status of any deprecated API or module that you're currently using. For more information about the retirement of AzureRM, see [this announcement](https://azure.microsoft.com/updates/update-your-scripts-to-use-az-powershell-modules-by-29-february-2024/).
>
> For more information about Microsoft Entra ID and MSOL, see [this retirement announcement post](https://techcommunity.microsoft.com/t5/microsoft-entra-azure-ad-blog/microsoft-entra-change-announcements-september-2022-train/ba-p/2967454).
>
> If you have questions or require clarification on the future direction of programmatic data access, contact your Microsoft account team.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to access users and groups data, key decisions and actions include:

> [!div class="checklist"]
> - **Confirm requirements:** Clarify needs for compiling data related to users, groups, and licenses.
> - **Prioritize requirements:** Confirm what the top priorities are so you know what to spend time on first.
> - **Decide on the frequency for extracting data:** Determine how often you'll need a new snapshot of the users and groups data (such as every week or every month).
> - **Decide how to extract data with Microsoft Graph:** Determine which method you'll use to retrieve the data.
> - **Complete a proof of concept:** Plan to complete a small technical proof of concept (POC) to extract users and groups data. Use it to validate your decisions about how the final solution will be built.

#### Access data from Power BI REST APIs

Perhaps as a lower priority, you can also retrieve other data by using the Power BI REST APIs.

For example, you can retrieve data about:

- All [apps](/rest/api/power-bi/admin/apps-get-apps-as-admin) in the organization.
- All [imported semantic models](/rest/api/power-bi/admin/imports-get-imports-as-admin) in the organization.
- All [deployment pipelines](/rest/api/power-bi/admin/pipelines-get-pipelines-as-admin) in the organization.
- All Premium [capacities](/rest/api/power-bi/admin/get-capacities-as-admin) in the organization.

During a security audit, you might want to identify:

- Items that have been [widely shared](/rest/api/power-bi/admin/widely-shared-artifacts-links-shared-to-whole-organization) with the entire organization.
- Items that are available on the public internet by using [publish to the web](/rest/api/power-bi/admin/widely-shared-artifacts-published-to-web).

For more information about the other types of APIs, see [Choose a user API or admin API](#choose-a-user-api-or-admin-api) earlier in this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for accessing data from the Power BI APIs, key decisions and actions include:

> [!div class="checklist"]
> - **Obtain requirements:** Compile analytical requirements as they arise. Keep track of them in your backlog.
> - **Prioritize requirements:** Set priorities for the new requirements that arise.

## Phase 2: Prerequisites and setup

The second phase of planning and implementing a tenant-level auditing solution focuses on prerequisites and setup that must be done before you begin solution development.

:::image type="content" source="media/powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing/tenant-level-auditing-phase-2.svg" alt-text="Flow diagram describing Phase 2, which focuses on prerequisites and setup for building a tenant-level auditing solution." border="false":::

### Create storage account

At this point, you've decided on a [location to store raw data](#determine-where-to-store-audit-data) and [how to create curated data](#plan-to-create-curated-data). Based on those decisions, you're now ready to create a storage account. Depending on your organization's processes, it might involve submitting a request to IT.

As described earlier, we recommend using a technology that allows you to write the raw data to immutable storage. Once the data is written, it can't be changed or deleted. You can then have confidence in the raw data because you know that an administrator with access can't alter it in any way. The curated data, however, doesn't (usually) need to be stored in immutable storage. Curated data might change or it can be regenerated.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When creating a storage account, key decisions and actions include:

> [!div class="checklist"]
> - **Create a storage account:** Create, or submit a request, for creating a storage account. Use immutable storage settings for the raw data, whenever possible.
> - **Set permissions:** Determine which permissions should be set for the storage account.
> - **Test access:** Do a small test to ensure that you can read and write to the storage account.
> - **Confirm responsibilities:** Ensure that you're clear on who'll manage the storage account on an ongoing basis.

### Install software and set up services

At this point, you've made your decisions about which [technology to use for access audit data](#data-source-decisions). Based on those decisions, you're now ready to install software and set up services.

Set up the preferred development environment for each administrator. The development environment will allow them to write and test scripts. [Visual Studio Code](https://code.visualstudio.com/) is a modern tool for developing scripts, so it's a good option. Also, many extensions are available to work with Visual Studio Code.

If you've made the decision (previous described) to use PowerShell, you should install PowerShell Core and the necessary PowerShell modules on:

- The machine of each administrator/developer who will write or test auditing scripts.
- Each virtual machine or server that will run scheduled scripts.
- Each online service (such as Azure Functions or Azure Automation).

If you've chosen to use any Azure services (such as Azure Functions, Azure Automation, Azure Data Factory, or Azure Synapse Analytics), you should provision and set them up as well.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When installing software and setting up services, key decisions and actions include:

> [!div class="checklist"]
> - **Set up administrator/developer machines:** If applicable, install the necessary tools that will be used for development.
> - **Set up servers:** If applicable, install the necessary tools on any servers or virtual machines that are present in your architecture.
> - **Set up Azure services:** If applicable, provision and set up each Azure service. Assign permissions for each administrator/developer who'll be doing development work.

### Register a Microsoft Entra application

At this point, you've decided [how to authenticate](#determine-the-authentication-method). We recommend that you register a Microsoft Entra application (service principal). Commonly referred to as an _app registration_, it should be used for unattended operations that you'll automate.

For more information about how to create an app registration to retrieve tenant-level auditing data, see [Enable service principal authentication for read-only admin APIs](/fabric/admin/metadata-scanning-enable-read-only-apis).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When registering a Microsoft Entra application, key decisions and actions include:

> [!div class="checklist"]
> - **Check whether an existing app registration exists:** Verify with IT whether an existing app registration is available for the purpose of running admin APIs. If so, determine whether the existing one should be used, or whether a new one should be created.
> - **Create a new app registration:** Create an app registration when appropriate. Consider using an app name such as _PowerBI-AdminAPIs-EntraApp_, which clearly describes its purpose.
> - **Create a secret for the app registration:** Once the app registration exists, create a secret for it. Set the expiration date based on how often you intend to rotate the secret.
> - **Securely save the values:** Store the secret, app ID (client ID), and the tenant ID because you'll need them to authenticate with the service principal. Use a location that's secure, such as an organizational password vault. (If you need to request creation of an app registration from IT, specify that you need these values returned to you.)
> - **Create a security group:** Create (or request) a security group that will be used for Power BI. Consider using group name such as _Power BI admin service principals_, which signifies that the group will be used to access tenant-wide metadata.
> - **Add the service principal as a member of the security group:** Use the app ID (client ID) to add the new (or existing) service principal as a member of the new security group.
> - **Update admin API tenant setting in Power BI:** In the Power BI admin portal, add the security group to the _Allow service principals to use read-only Power BI admin APIs_ tenant setting.
> - **Skip assigning permissions in Azure:** Don't delegate any permissions to the app registration (it'll gain access to the Power BI tenant-level audit data by way of the Power BI _Allow service principals to use read-only Power BI admin APIs_ tenant setting).
> - **Decide whether the app registration should access detailed metadata:** Determine whether you want to extract detailed information about semantic model tables, columns, and measure expressions when you build your tenant inventory.
> - **Update the detailed metadata tenant settings in Power BI:** Optionally, in the Power BI admin portal, add the security group to the _Enhance admin API responses with detailed metadata_ tenant setting and also the _Enhance admin API responses with DAX and mashup expressions_ tenant setting.
> - **Test the service principal:** Create a simple script to sign in by using the service principal and test that it can retrieve data from an admin API.
> - **Create a process to manage app registration secrets:** Create documentation and a process to regularly rotate secrets. Determine how you'll securely communicate a new secret to any administrators and developers who need it.

### Set Power BI tenant settings

There are several tenant settings in the Power BI admin portal that are relevant for extracting tenant-level auditing data.

#### Admin APIs

There are three tenant settings that are relevant for running admin APIs.

> [!IMPORTANT]
> Because these settings grant metadata access for the entire tenant (without assigning direct Power BI permissions), you should control them tightly.

The _Allow service principals to use read-only Power BI admin APIs_ tenant setting allows you to set which service principals can call admin APIs. This setting also allows Microsoft Purview to scan the entire Power BI tenant so that it can populate the data catalog.

> [!NOTE]
> You don't need to explicitly assign other Power BI administrators to the _Allow service principals to use read-only Power BI admin APIs_ tenant setting because they already have access to tenant-wide metadata.

The _Enhance admin API responses with detailed metadata_ tenant setting allows you to set which users and service principals can retrieve detailed metadata. Metadata is retrieved by using the metadata scanning APIs, and it includes tables, columns, and more. This setting also allows Microsoft Purview to access schema-level information about Power BI semantic models so that it can store it in the data catalog.

The _Enhance admin API responses with DAX and mashup expressions_ tenant setting allows you to set which users and service principals can retrieve detailed metadata. Metadata is retrieved from the metadata scanning APIs, and it can include queries and semantic model measure expressions.

> [!NOTE]
> The _Allow service principals to use read-only Power BI admin APIs_ tenant setting is specifically about accessing _admin APIs_. Its name is very similarly to the tenant setting that's intended for accessing _user APIs_ (described next). For more information about the difference between admin APIs and user APIs, see [Choose a user API or admin API](#choose-a-user-api-or-admin-api) earlier in this article.

#### User APIs

There's one tenant setting that applies to calling user APIs. In this situation, Power BI permissions are also required for the service principal (for example, a workspace role).

The _Allow service principals to use Power BI APIs_ tenant setting allows you to set which service principals have access to run REST APIs (excluding the admin APIs, which are granted by a different tenant setting, described above).

There are other tenant settings related to APIs, which allow access to the embedding APIs, streaming APIs, export APIs, and the _execute queries_ API. However, these APIs are out of scope for this article.

For more information about the tenant settings for usage metrics, see [Report-level auditing](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When setting up the Power BI tenant settings, key decisions and actions include:

> [!div class="checklist"]
> - **Verify that each service principal is in the correct group:** Confirm that the _Power BI admin service principals_ group includes the correct service principals.
> - **Update the admin API tenant setting in Power BI:** Add the security group to the _Allow service principals to use read-only Power BI admin APIs_ tenant setting, which allows using the admin APIs to retrieve tenant-wide metadata.
> - **Update the detailed metadata tenant settings in Power BI:** If necessary, add the security group to the _Enhance admin API responses with detailed metadata_ tenant setting and the _Enhance admin API responses with DAX and mashup expressions_ tenant setting.
> - **Confirm which user APIs will be accessed:** Verify whether one or more user APIs will be needed (in addition using the admin APIs).
> - **Update the user API tenant setting in Power BI:** Add the security group to the _Allow service principals to use Power BI APIs_ tenant setting, which is intended for user APIs.

## Phase 3: Solution development and analytics

The third phase of planning and implementing a tenant-level auditing solution focuses on solution development and analytics. At this point, all the planning and decision-making has occurred, and you've met prerequisites and completed the setup. You're now ready to begin solution development so that you can perform analytics and gain insights from your auditing data.

:::image type="content" source="media/powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing/tenant-level-auditing-phase-3.svg" alt-text="Flow diagram describing Phase 3, which focuses on solution development and analytics of a tenant-level auditing solution." border="false":::

### Extract and store the raw data

At this point, your requirements and priorities should be clear. The key technical decisions have been made about [how to access audit data](#data-source-decisions) and the [location to store audit data](#determine-where-to-store-audit-data). Preferred tools have been selected, and the prerequisites and settings have been set up. During the previous two phases, you might have completed one or more small projects (proofs of concept) to prove feasibility. The next step is to set up a process to extract and store the raw auditing data.

Like with data returned by most Microsoft APIs, auditing data is formatted as JSON. JSON-formatted data is self-describing because it's human-readable text that contains structure and data.

JSON represents data objects that consist of attribute-value pairs and arrays. For example, `"state": "Active"` is an example where the _state_ attribute value is _Active_. A JSON array contains an ordered list of elements separated by a comma and which are enclosed within brackets (\[ \]). It's common to find nested arrays in JSON results. Once you become familiar with the hierarchical structure of a JSON result, it's straightforward to understand the data structure, like a list (array) of semantic models in a workspace.

Here are some considerations for when you extract and store the raw data retrieved from the APIs.

- **What naming convention will be used?** For a file-based system, a naming convention is necessary for files, folders, and data lake zones. For a database, a naming convention is necessary for tables and columns.
- **What format will be used to store the raw data?** As Power BI continues to introduce new features, new [activities](/fabric/admin/operation-list) will appear that don't exist today. For this reason, we recommend that you extract and retain the original JSON results. Don't parse, filter, or format the data while it's extracted. That way, you can use the original raw data to regenerate your curated audit data.
- **What storage location will be used?** A data lake or blob storage is commonly used to store raw data. For more information, see [Determine where to store audit data](#determine-where-to-store-audit-data) earlier in this article.
- **How much history will you store?** Export the audit data to a location where you can store the history. Plan to accumulate at least two years of history. That way, you can analyze trends and changes beyond the default 30-day retention period. You might choose to store the data indefinitely, or you might decide on a shorter period, depending on the data retention policies for your organization.
- **How will you track when the process last ran?** Set up a configuration file, or the equivalent, to record the time stamps when a process starts and finishes. The next time the process runs, it can retrieve these time stamps. It's especially important that you store time stamps when you extract data by using the [metadata scanning APIs](#metadata-scanning-apis).
- **How will you handle throttling?** Some Power BI REST APIs and the Microsoft Graph API implement throttling. You'll receive a 429 error (too many requests) if your API request is throttled. Throttling can be a common problem for larger organizations that need to retrieve a large volume of data. How you avoid failed attempts due to throttling depends on the technology you use to access and extract the data. One option is to develop logic in your scripts that responds to a 429 "Too many requests" error by retrying after a wait period.
- **Is the audit data needed for compliance?** Many organizations use the raw audit log records to do compliance audits or to respond to security investigations. In these cases, we strongly recommend that you store the raw data in immutable storage. That way, once the data is written, it can't be changed or deleted by an administrator or other user.
- **What storage layers are necessary to support your requirements?** The best places to store raw data are a data lake (like Azure Data Lake Storage Gen2) or object storage (like Azure Blob Storage). A file system can also be used if cloud services aren't an option.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When extracting and storing the raw data, key decisions and actions include:

> [!div class="checklist"]
> - **Confirm requirements and priorities:** Clarify the requirements and priorities for the data that you'll extract first.
> - **Confirm the source of data to be extracted:** Verify the source for each type of data you need.
> - **Set up a process to extract the data and load it to the raw data zone:** Create the initial process to extract and load the raw data in its original state, without any transformations. Test that the process works as intended.
> - **Create a schedule to run the processes:** Set up a recurring schedule to run the extract, load, and transform processes.
> - **Verify that credentials are managed securely:** Confirm that passwords, secrets, and keys are stored and communicated in secure ways.
> - **Confirm security is set up correctly:** Verify that access permissions are set up correctly for the raw data. Ensure that administrators and auditors can access the raw data.

For more information about how an auditing and monitoring solution grows over time, see [Operationalize and improve](#operationalize-and-improve) later in this article.

### Create the curated data

At this point, the raw data is extracted and stored. The next step is to create a separate gold data layer for the curated data. Its goal is to transform and store the data files in a [star schema](star-schema.md). A star schema comprises dimension tables and fact tables, and it's intentionally optimized for analysis and reporting. The files in the curated data layer become the source of a Power BI data model (described in the next topic).

> [!TIP]
> When you expect there to be more than one data model, investing in a centralized curated data layer is particularly useful.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When creating the curated data layer, key decisions and actions include:

> [!div class="checklist"]
> - **Confirm requirements and priorities:** If you intend to use an intermediary silver layer for the transformed data, clarify the requirements and objectives for what you need to accomplish.
> - **Set up a process to transform the raw data and load it into the curated data zone:** Create a process to transform and load the data into a [star schema](star-schema.md). Test that the process works as intended.
> - **Create a schedule to run the processes:** Set up a recurring schedule to populate the curated data layer.
> - **Confirm security is set up correctly:** Verify that access permissions are set up correctly for the curated data. Ensure that developers of the data model can access the curated data.

### Create a data model

The topic is about setting up an analytical _data model_. A data model is query-able data resource optimized for analytics. Sometimes it's referred to as a _semantic model_, or simply a _model_. For your auditing and monitoring solution, the data model will likely be implemented as a Power BI semantic model.

In the context of auditing and monitoring, a data model sources data from the curated (gold) data layer. If you choose not to create a curated data layer, the data model sources its data directly from the raw data.

We recommend that your Power BI data model implements a star schema design. When the source data is the curated data layer, the Power BI data model star schema should mirror the curated data layer star schema.

> [!TIP]
> For an overview of star schema design, see [Understand star schema and the importance for Power BI](star-schema.md).

As with any Power BI project, creating a data model is an iterative process. You can add new measures as needed. You can also add new tables and columns as new audit events become available. In time, you might even integrate new data sources.

Here are some useful dimension tables that you can include in the data model.

- **Date:** A set of date attributes to enable analysis (slicing and dicing) of data by day, week, month, quarter, year, and other relevant time periods.
- **Time:** If you need to analyze by time of day and you have a very large volume of audit data, consider storing the time part separately from the date. This approach can help to improve query performance.
- **Users:** Attributes that describe users (such as department and geographic region) that can filter many subjects of auditing data. The goal is to remove all user details from the fact tables and store them in this dimension table so that they can filter many fact tables. You can also store service principals in this table.
- **Activity events:** Attributes that group and describe the activity events (operations). To enhance your reporting, you might create a data dictionary that describes each activity event. You might also create a hierarchy that groups and classifies similar activity events. For example, you might group all item creation events, delete events, and so on.
- **Workspaces:** A list of workspaces in the tenant and workspace properties, such as type (personal or standard) and description. Some organizations record more details about workspaces (possibly using a SharePoint list). You can integrate these details into this dimension table. You need to decide whether this dimension table stores only the current state of workspace, or whether it stores versioned data that reflects significant workspace changes over time. For example, when a workspace name changes, does historical reporting show the current workspace name or the workspace name that was current at that time? For more information about versioning, see [Slowly changing dimensions](star-schema.md#slowly-changing-dimensions).
- **Item types:** A list of Power BI item types (semantic models, reports, and others).
- **Capacities:** A list of Premium capacities in the tenant.
- **Gateways:** A list of data gateways in the tenant.
- **Data sources:** A list of data sources that are used by any semantic model, dataflow, or datamart.

Here are some useful fact tables (subjects) that you can include in the data model.

- **User activities:** The fact data that's sourced from the original JSON data. Any attributes that have no analytical value are removed. Any attributes that belong in the dimension tables (above) are removed too.
- **Tenant inventory:** A point-in-time snapshot of all items published in the tenant. For more information, see [Tenant inventory](#tenant-inventory) earlier in this article.
- **Semantic models:** Includes user activity involving semantic models (like semantic model changes), or related data sources.
- **Semantic model refreshes:** Stores data refresh operations, including details about type (scheduled or on-demand), duration, status, and which user initiated the operation.
- **Workspace roles:** A point-in-time snapshot of workspace role assignments.
- **User licenses:** A point-in-time snapshot of user licenses. While you might be tempted to store the user license in the **Users** dimension table, that approach won't support the analysis of license changes and trends over time.
- **User group memberships:** A point-in-time snapshot of users (and service principals) assigned to a security group.
- **Community activities:** Includes community-related facts such as training events. For example, you could analyze Power BI user activities compared to training attendance. This data could help the Center of Excellence identify potential new [champions](fabric-adoption-roadmap-community-of-practice.md#champions-network).

Fact tables shouldn't include columns that report creators will filter. Instead, those columns belong to related dimension tables. Not only is this design more efficient for queries, but it also promotes reuse of dimension tables by multiple facts (known as _drill across_). That last point is important to produce a useful and user-friendly data model that's extensible when you add new fact tables (subjects).

For example, the **Users** dimension table will be related to every fact table. It should be related to the **User activities** fact table (who performed the activity), **Tenant inventory** fact table (who created the published item), and all other fact tables. When a report filters by a user in the **Users** dimension table, visuals in that report can show facts for that user from any related fact table.

When you design your model, ensure that an attribute is visible once, and only once, in the model. For example, the user email address should only be visible in the **Users** dimension table. It will exist in other fact tables too (as a dimension key to support a model relationship). However, you should hide it in each fact table.

We recommend that you create your data model separate from reports. The decoupling of a semantic model and its reports results in a centralized semantic model that can serve many reports. For more information about using a shared semantic model, see the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario.

Consider setting up [row-level security](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity) (RLS) so that other users—beyond the Center of Excellence, auditors, and administrators—can analyze and report on auditing data. For example, you could use RLS rules to allow content creators and consumers to report on their own user activities or development efforts.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When creating the data model, key decisions and actions include:

> [!div class="checklist"]
> - **Plan and create the data model:** Design the data model as a [star schema](star-schema.md). Validate relationships work as intended. As you develop the model, iteratively create measures and add additional data based on analytical requirements. Include future improvements on a backlog, when necessary.
> - **Set up RLS:** If you intend to make the data model available to other general users, set up row-level security to restrict data access. Validate that the RLS roles return the correct data.

### Enhance the data model

To effectively analyze content usage and user activities, we recommend that you enrich your data model. Data model enhancements can be done gradually and iteratively over time as you discover opportunities and new requirements.

#### Create classifications

One way to enhance the model and increase the value of your data is to add classifications to the data model. Ensure that these classifications are used consistently by your reports.

You might choose to classify _users_ based on their level of usage, or to classify _content_ based on its level of usage.

##### User usage classification

Consider the following classifications for _user usage_.

- **Frequent user:** Activity recorded in the last week, and in nine of the last 12 months.
- **Active user:** Activity recorded in the past month.
- **Occasional user:** Activity recorded in the last nine months, but without activity in the past one month.
- **Inactive user:** No activity recorded in the last nine months.

> [!TIP]
> It's helpful to know who your occasional or inactive users are, especially when they have Pro or PPU licenses (which involve cost). It's also helpful to know who your frequent and most active users are. Consider inviting them to join [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours) or attend [training](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training). Your most active content creators might be candidates to join your [champions network](fabric-adoption-roadmap-community-of-practice.md#champions-network).

##### Content usage classification

Consider the following classifications for _content usage_.

- **Frequently used content:** Activity recorded in the last week, and in nine of the last 12 months.
- **Actively used content:** Activity recorded in the past month.
- **Occasionally used content:** Activity recorded in the last nine months, but without activity in the past one month.
- **Unused content:** No activity recorded in the last nine months.

##### User type classification

Consider the following classifications for _user type_.

- **Content creator:** Activity recorded in the past six months that created, published, or edited content.
- **Content viewer:** Activity recorded in the past six months that viewed content, but without any content creation activity.

#### Consider recency vs. trends

You should decide whether the usage classifications for users or content should be based only on how _recently_ an activity occurred. You might want to also consider factoring in _average_ or _trending_ usage over time.

Consider some examples that demonstrate how simple classification logic might misrepresent reality.

- A manager viewed one report this week. However, prior to that week, the manager hadn't viewed any reports in the last six months. You shouldn't consider this manager to be a frequent user based on recent usage alone.
- A report creator publishes a new report every week. When you analyze usage by frequent users, the report creator's regular activity appears to be positive. However, upon further investigation you discover that this user has been republishing a new report (with a new report name) every time they edit the report. It would be useful for the report creator to have more training.
- An executive views a report sporadically, and so their usage classification changes frequently. You might need to analyze certain types of users, such as executives, differently.
- An internal auditor views critical reports once per year. The internal auditor might appear to be an inactive user because of their infrequent usage. Someone might take steps to remove their Pro or PPU license. Or, someone might believe that a report should be retired since it's used infrequently.

> [!TIP]
> You can calculate averages and trends by using the DAX time intelligence functions. To learn how to use these functions, work through the [Use DAX time intelligence functions in Power BI Desktop models](/training/modules/dax-power-bi-time-intelligence/) learning module.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When creating classifying usage data, key decisions and actions include:

> [!div class="checklist"]
> - **Get consensus on classification definitions:** Discuss classification definitions with the relevant stakeholders. Make sure there's agreement when making the decisions.
> - **Create documentation:** Ensure that the classification definitions are included in documentation for content creators and consumers.
> - **Create a feedback loop:** Make sure there's a way for users to ask questions or propose changes to the classification definitions.

### Create analytical reports

At this point, the auditing data has been extracted and stored, and you've published a data model. The next step is to create analytical reports.

Focus on the key information that's most relevant for each audience. You might have several audiences for your auditing reports. Each audience will be interested in different information, and for different purposes. The audiences you might serve with your reports include:

- Executive sponsor
- Center of Excellence
- Power BI administrators
- Workspace administrators
- Premium capacity administrators
- Gateway administrators
- Power BI developers and content creators
- Auditors

Here are some of the most common analytical requirements that you might want to start with when you create your auditing reports.

- **Top content views:** Your executive sponsor and leadership teams might predominantly be interested in summary information and trends over time. Your workspace administrators, developers, and content creators will be more interested in the details.
- **Top user activities:** Your Center of Excellence will be interested in who's using Power BI, how, and when. Your Premium capacity administrators will be interested in who's using the capacity to ensure its health and stability.
- **Tenant inventory:** Your Power BI administrators, workspace administrators, and auditors will be interested in understanding what content exists, where, lineage, and its security settings.

This list isn't all-inclusive. It's intended to provide you with ideas about how to create analytical reports that target specific needs. For more considerations, see [Data needs](#data-needs) earlier in this article, and [Auditing and monitoring overview](powerbi-implementation-planning-auditing-monitoring-overview.md). These resources include many ideas for how you can use auditing data, and the types of information you might choose to present in your reports.

> [!TIP]
> While it's tempting to present a lot of data, only include information that you're prepared to act on. Ensure that every report page is clear about its purpose, what action should be taken, and by whom.
>
> To learn how to create analytical reports, work through the [Design effective reports in Power BI](/training/paths/power-bi-effective/) learning path.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for analytical auditing reports, key decisions and actions include:

> [!div class="checklist"]
> - **Review requirements:** Prioritize creating reports based on known needs and specific questions that should be answered.
> - **Confirm your audience(s):** Clarify who'll use the auditing reports, and what their intended purpose will be.
> - **Create and deploy reports:** Develop the first set of core reports. Extend and enhance them gradually over time.
> - **Distribute reports in an app:** Consider creating an app that includes all your auditing and monitoring reports.
> - **Verify who has access to reports:** Ensure that the reports (or the app) are made available to the correct set of users.
> - **Create a feedback loop:** Make sure there's a way for report consumers to provide feedback or suggestions, or report issues.

### Take action based on the data

Auditing data is valuable because it helps you to understand what's happening in your Power BI tenant. While it might seem obvious, explicitly acting on what you learn from the audit data can be easily overlooked. For that reason, we recommend that you assign someone who's responsible for tracking measurable improvements, rather than just reviewing auditing reports. That way, you can make gradual, measurable advances in your adoption and [level of maturity](fabric-adoption-roadmap-maturity-levels.md) with Power BI.

You can take many different actions based on your goals and what you learn from the auditing data. The remainder of this section provides you with several ideas.

#### Content usage

Here are some actions you might take based on how content is used.

- **Content is frequently used (daily or weekly):** Verify that any critical content is certified. Confirm that ownership is clear, and the solution is adequately supported.
- **High number of workspace views:** When a high number of workspace views occur, investigate why Power BI apps aren't in use.
- **Content is rarely used:** Contact the target users to determine whether the solution meets their needs, or whether their requirements have changed.
- **Refresh activity occurs more frequently than views:** Contact the content owner to understand why a semantic model is refreshed regularly without any recent use of the semantic model or related reports.

#### User activities

Here are some actions you might take based on user activities.

- **First publishing action by a new user:** Identify when a user type changes from consumer to creator, which you can identify when they publish content for the first time. It's a great opportunity to send them a standard email that provides guidance and links to useful resources.
- **Engagement with the most frequent content creators:** Invite your most active creators to join your [champions network](fabric-adoption-roadmap-community-of-practice.md#champions-network), or to get involved with your [community of practice](fabric-adoption-roadmap-community-of-practice.md).
- **License management:** Verify whether inactive creators still need a Pro or PPU license.
- **User trial activation:** A trial license activation can prompt you to assign a permanent license to the user before their trial ends.

#### User training opportunities

Here are some user training opportunities that you might identify from the auditing data.

- **Large number of semantic models published by the same content creator:** Teach users about shared semantic models and why it's important to avoid creating duplicate semantic models.
- **Excessive sharing from a personal workspace:** Contact a user who's doing a lot of sharing from their personal workspace. Teach them about standard workspaces.
- **Significant report views from a personal workspace:** Contact a user who owns content that has a high number of report views. Teach them how standard workspaces are better than personal workspaces.

> [!TIP]
> You can also improve your training content or documentation by reviewing questions answered by your [internal Power BI community](fabric-adoption-roadmap-user-support.md#internal-community-support) and issues submitted to the [help desk](fabric-adoption-roadmap-user-support.md#help-desk-support).

#### Security

Here are some security situations you might want to actively monitor.

- Too many users assigned to the high-privilege [Fabric administrator role](powerbi-implementation-planning-security-tenant-level-planning.md#power-bi-administration).
- Too many workspace administrators (when the Member, Contributor, or Viewer [workspace role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles) would be sufficient).
- Excessive [Build permissions](powerbi-implementation-planning-security-content-creator-planning.md#read-and-build-permissions-for-underlying-semantic-model) assigned to semantic models (when Read permission would be sufficient).
- High use of [per-item permissions](powerbi-implementation-planning-security-report-consumer-planning.md#per-item-permissions), when [Power BI app permissions](powerbi-implementation-planning-security-report-consumer-planning.md#power-bi-app-permissions) or the [workspace Viewer role](powerbi-implementation-planning-security-report-consumer-planning.md#workspace-viewer-role) would be a better choice for content consumers.
- How content is shared with [external users](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-external-users).

For more information, see the [Security planning](powerbi-implementation-planning-security-overview.md) articles.

#### Governance and risk mitigation

Here are some situations that you might encounter. Consider explicitly looking for these types of situations in your auditing reports, so you're prepared to act quickly.

- High number of views for reports (and underlying semantic models) that aren't [endorsed](../collaborate-share/service-endorse-content.md).
- Significant use of unknown or unsanctioned data sources.
- File locations that don't align with governance guidelines for where source files should be located.
- [Workspace names](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-naming-conventions) don't align with governance requirements.
- Sensitivity labels are used for [information protection](powerbi-implementation-planning-info-protection.md).
- Consistent data refresh failures.
- Significant and recurring use of printing.
- Unexpected or excessive use of subscriptions.
- Unexpected use of [personal gateways](../connect-data/service-gateway-personal-mode.md).

The specific actions to be taken in each situation will depend on your governance policies. For more information, see [Governance](fabric-adoption-roadmap-governance.md) in the Fabric adoption roadmap.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for potential actions based on the auditing data, key decisions and actions include:

> [!div class="checklist"]
> - **Clarify expectations:** Create auditing reports with a clear set of expectations for what actions are expected.
> - **Clarify who'll be responsible for actions:** Ensure that roles and responsibilities are assigned.
> - **Create automation:** When possible, automate known actions that are repeatable.
> - **Use a tracking system:** Use a system to track an observed situation, including contact made, next planned action, who's responsible, resolution, and status.

## Phase 4: Maintain, enhance, and monitor

The fourth phase of planning and implementing a tenant-level auditing solution focuses on maintenance, enhancements, and monitoring. At this point, your auditing solution is in production use. You're now primarily concerned with maintaining, enhancing, and monitoring the solution.

:::image type="content" source="media/powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing/tenant-level-auditing-phase-4.svg" alt-text="Flow diagram describing Phase 4, which focuses on maintaining, enhancing, and monitoring a tenant-level auditing solution." border="false":::

### Operationalize and improve

Auditing processes are typically considered to be running _in production_ when initial development and testing are complete and you've automated the process. Automated auditing processes running in production have greater expectations (than manual processes) for quality, reliability, stability, and support.

A production-level auditing process has been _operationalized_. An operationalized solution commonly includes many of the following characteristics.

- **Secure:** Credentials are stored and managed securely. Scripts don't contain passwords or keys in plaintext.
- **Scheduling:** A reliable scheduling system is in place.
- **Change management:** Use of change management practices and multiple environments are used to ensure that the production environment is safeguarded. You might also work with development and test environments, or just a development environment.
- **Support:** The team that supports the solution is clearly defined. Team members have been trained, and they understand the operational expectations. Backup members have been identified and cross-training happens when appropriate.
- **Alerting:** When something goes wrong, alerts notify the support team automatically. Preferably, alerting includes both logs and email (rather than email only). A log is useful for analyzing logged errors and warnings.
- **Logging:** Processes are logged so there's a history of when the auditing data was updated. Logged information should record start time, end time, and the identity of user or app that ran the process.
- **Error handling:** Scripts and processes gracefully handle and log errors (such as whether to exit immediately, continue, or wait and try again). Alert notifications are sent to the support team when an error occurs.
- **Coding standards:** Good coding techniques that perform well are used. For example, loops are purposefully avoided except when necessary. Consistent coding standards, comments, formatting, and syntax are used so that the solution is easier to maintain and support.
- **Reuse and modularization:** To minimize duplication, code and configuration values (like connection strings or email addresses for notifications) are modularized so that other scripts and processes can reuse them.

> [!TIP]
> You don't have to do everything listed above all at once. As you gain experience, you can incrementally improve the solution so that it becomes complete and robust. Be aware that most examples you find online are simple, one-off script snippets that might not be production quality.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning to operationalize and improve an auditing solution, key decisions and actions include:

> [!div class="checklist"]
> - **Assess the level of existing solutions:** Determine whether there are opportunities to improve and stabilize existing auditing solutions that are automated.
> - **Establish production-level standards:** Decide what standards you want to have for your automated auditing processes. Factor in improvements that you can realistically add over time.
> - **Create a plan for improvement:** Plan to improve the quality and stability of production auditing solutions.
> - **Determine whether a separate development environment is necessary:** Assess the level of risk and reliance on the production data. Decide when to create separate development and production (and test) environments.
> - **Consider a data retention strategy:** Determine whether you need to implement a data retention process that purges data after a certain period of time, or upon request.

### Documentation and support

Documentation and support are critical for any production-level solution. It's helpful to create several types of documentation, depending on the target audience and purpose.

#### Technical documentation

Technical documentation is targeted at the technical team who built the solution and who will gradually improve and expand the solution over time. It's also a useful resource for the support team.

Technical documentation should include:

- A summary of architecture components and prerequisites.
- Who owns and manages the solution.
- Who supports the solution.
- An architecture diagram.
- Design decisions, including goals, reasons why certain technical choices were made, and constraints (such as cost or skills).
- Security decisions and choices.
- Naming conventions used.
- Coding and technical standards and guidelines.
- Change management requirements.
- Deployment, setup, and installation instructions.
- Known areas of technical debt (areas that can be improved if there's opportunity to do so).

#### Support documentation

Depending on the level of criticality for your auditing solution, you might have a help desk or support team should urgent issues arise. They might be available all day, every day.

Support documentation is sometimes referred to as a _knowledge base_ or a _runbook_. This documentation is targeted at your help desk or support team, and it should include:

- Troubleshooting guidance for when something goes wrong. For example, when there's a data refresh failure.
- Actions to take on an ongoing basis. For example, there could be some manual steps that someone needs to do regularly until an issue is resolved.

#### Content creator documentation

You derive more value from your auditing solution by providing usage and adoption analytics to other teams throughout the organization (with row-level security enforced, if necessary).

Content creator documentation is targeted at self-service content creators who create reports and data models that source the curated auditing data. It includes information about the data model, including common data definitions.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When planning for documentation and support for your auditing solution, key decisions and actions include:

> [!div class="checklist"]
> - **Confirm who's expected to support the solution:** Determine who'll support auditing solutions that are considered production-level (or have downstream report dependencies).
> - **Ensure support team readiness:** Verify that the support team is prepared to support the auditing solution. Identify whether there are any readiness gaps that need addressing.
> - **Arrange for cross-training:** Conduct knowledge transfer sessions or cross-training sessions for the support team.
> - **Clarify support team expectations:** Ensure that expectations for response and resolution are clearly documented and communicated. Decide whether anyone needs to be on call to quickly resolve issues related to the auditing solution.
> - **Create technical documentation:** Create documentation about the technical architecture and design decisions.
> - **Create support documentation:** Update the help desk knowledgebase to include information about how to support the solution.
> - **Create documentation for content creators:** Create documentation to help self-service creators use the data model. Describe common data definitions to improve consistency of their use.

### Enable alerting

You might want to raise alerts based on specific conditions in the auditing data. For example, you can raise an alert when someone deletes a gateway or when a Power BI administrator changes a tenant setting.

For more information, see [Tenant-level monitoring](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md).

### Ongoing management

You need to perform ongoing management of the entire auditing solution. You might need to extend or change your auditing solution when:

- The organization discovers new data requirements.
- New audit events appear in the raw data you exact from the Power BI REST APIs.
- Microsoft makes changes to the Power BI REST APIs.
- Employees identify ways to improve the solution.

> [!IMPORTANT]
> Breaking changes are rare, but they can occur. It's important that you have someone available who can quickly troubleshoot issues or update the auditing solution when necessary.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for ongoing management of the auditing solution, key decisions and actions include:

> [!div class="checklist"]
> - **Assign a technical owner:** Ensure that there's clear ownership and responsibility for the entire auditing solution.
> - **Verify that a backup exists:** Make sure there's a backup technical owner who can get involved should an urgent issue arise that support can't solve.
> - **Keep a tracking system:** Ensure that you have a way to capture new requests and a way to prioritize immediate priorities, and also short-term, medium-term, and long-term (backlog) priorities.

## Related content

In the [next article in this series](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md), learn about tenant-level monitoring.
