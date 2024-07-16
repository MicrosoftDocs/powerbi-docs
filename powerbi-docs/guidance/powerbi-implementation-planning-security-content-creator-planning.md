---
title: "Power BI implementation planning: Content creator security planning"
description: "Learn about content creator security planning for Power BI."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/12/2022
---

# Power BI implementation planning: Content creator security planning

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This security planning article describes strategies for content creators who are responsible for creating semantic models ([previously known as datasets](../connect-data/service-datasets-rename.md)), dataflows, datamarts, reports, or dashboards. It's primarily targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization.
- **Center of Excellence, IT, and BI team:** The teams that are also responsible for overseeing Power BI. They might need to collaborate with Power BI administrators, information security teams, and other relevant teams.
- **Content creators and owners:** Self-service BI creators who need to create, publish, secure, and manage content that others consume.

The series of articles is intended to expand upon the content in the [Power BI security white paper](whitepaper-powerbi-security.md). While the Power BI security white paper focuses on key technical topics such as authentication, data residency, and network isolation, the primary goal of the series is to provide you with considerations and decisions to help you plan for security and privacy.

In an organization, many users are _content creators_. Content creators produce and publish content that's viewed by others. Content creators are the focus of this article.

> [!TIP]
> We recommend that you review the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article first. It describes strategies for securely providing content to read-only consumers including how to enforce data security.

## Strategy for content creators

The foundation of a well-governed self-service BI system begins with content creators and owners. They create and validate semantic models and reports. In many cases, content creators also set up permissions to manage security for their content.

> [!TIP]
> We recommend that you foster a [data culture](fabric-adoption-roadmap-data-culture.md) that makes security and protection of data a normal part of everyone's role. To achieve that objective, user education, support, and training is essential.

For purposes of security and permissions, consider that there are two types of content creators: data creators and report creators. They can be responsible for creating and managing [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) or [self-service BI](powerbi-implementation-planning-usage-scenario-overview.md#self-service-bi-scenarios) content.

### Data creators

A data creator is any Power BI user who creates semantic models, dataflows, or datamarts.

Here are some common data creator scenarios.

- **Create a new semantic model:** Create and test a new data model in Power BI Desktop. It's then published to the Power BI service so that it can be used as a shared semantic model for many reports. For more information about reusing shared semantic models, see the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario.
- **Extend and customize a semantic model:** Create a [live connection](/power-bi/connect-data/desktop-report-lifecycle-datasets) to an existing shared semantic model in Power BI Desktop. Convert the live connection to a local model, which allows extending the model design with new tables or columns. For more information about extending and customizing shared semantic models, see the [customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) usage scenario.
- **Create a new dataflow:** In the Power BI service, create a new [dataflow](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) so that it can be used as a source by many semantic models. For more information about reusing data preparation activities, see the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario.
- **Create a new datamart**. In the Power BI service, create a new [datamart](/power-bi/transform-model/datamarts/datamarts-overview).

Data creators are often found in enterprise BI teams and in the Center of Excellence (COE). They also have a key role to play in decentralized business units and departments that maintain and manage their own data.

For other considerations about business-led BI, managed self-service BI, and enterprise BI, see the [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article.

### Report creators

Report creators create reports and dashboards to visualize data that's sourced from existing semantic models.

Here are some common report creator scenarios.

- **Create a new report including a data model:** Create and test a new report and data model in Power BI Desktop. The Power BI Desktop file that contains one or more report pages and includes a data model is published to the Power BI service. New content creators commonly use this method before they're aware of using shared semantic models. It's also appropriate for narrow use cases that have no need for data reuse.
- **Create a live connection report:** Create a new Power BI report that connects to a shared semantic model in the Power BI service. For more information about reusing shared semantic models, see the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario.
- **Create a connected Excel workbook:** Create a new Excel report that connects to a shared semantic model in the Power BI service. Connected Excel experiences, rather than downloads of data, are highly encouraged.
- **Create a DirectQuery report:** Create a new Power BI report that connects to a supported data source in DirectQuery mode. One situation when this method is useful is when you want to take advantage of user security that's implemented by the source system.

Report creators are found throughout every business unit in the organization. There are usually many more report creators in an organization than data creators.

> [!TIP]
> While not every semantic model is a shared semantic model, it's still worth adopting a [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) strategy. This strategy reuses shared semantic models whenever possible. In that way, report creation and data creation are _decoupled_. Any content creator from any business unit can effectively use this strategy.

### Permissions for creators

This section describes the most common permissions for data creators and report creators.

This section isn't intended to be an all-inclusive list of every possible permission. Rather, it's intended to help with planning your strategy for supporting different types of content creators. Your goal should be to follow the [principle of least privilege](/azure/active-directory/develop/secure-least-privileged-access). This principle allows enough permissions for users to be productive, without over-provisioning permissions.

#### Creating new content

The following permissions are commonly required for creating new content.

| **Permission** | **Report creator** | **Semantic model creator** | **Dataflow creator** | **Datamart creator** |
|:--|:-:|:-:|:-:|:-:|
| **Access to the underlying data source** | | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |
| **Semantic model Read and Build permissions** | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | | | |
| **Dataflow Read permission (when a dataflow is used as a source, via the workspace Viewer role)**  | | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |
| **Access where original Power BI Desktop file is stored** | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | | |
| **Permission to use custom visuals** | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | | | |

#### Publishing content permissions

The following permissions are commonly required for publishing content.

| **Permission** | **Report creator** | **Semantic model creator** | **Dataflow creator** | **Datamart creator** |
|:--|:-:|:-:|:-:|:-:|
| **Workspace role: Contributor, Member, or Admin** | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |
| **Semantic model Write permission (when the user doesn't belong to a workspace role)** | | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | | |
| **Deployment pipeline role to publish items (optional)** | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |

#### Refreshing data

The following permissions are commonly required for refreshing data.

| **Permission** | **Report creator** | **Semantic model creator** | **Dataflow creator** | **Datamart creator** |
|:--|:-:|:-:|:-:|:-:|
| **Owner assigned (who has set up settings or taken over the item)** | | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |
| **Access to the underlying data source (when a gateway isn't used)** | | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |
| **Access to the data source in a gateway (when the source is on-premises or in a virtual network)** | | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: | :::image type="icon" source="../includes/media/yes-icon.svg" border="false"::: |

The remainder of this article describes considerations for content creator permissions.

> [!TIP]
> For permissions related to viewing content, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning your security strategy for content creators, key decisions and actions include:

> [!div class="checklist"]
> - **Determine who your data creators are:** Ensure that you're familiar with who's creating semantic models, dataflows, and datamarts. Verify that you understand what their needs are before starting your security planning activities.
> - **Determine who your report creators are:** Ensure that you're familiar with who's creating reports, dashboards, workbooks, and scorecards. Verify that you understand what their needs are before starting your security planning activities.

## Discover content for creators

Users can rely on _[data discovery](fabric-adoption-roadmap-data-culture.md#data-discovery)_ to find semantic models and datamarts. Data discovery is a Power BI feature that allows content creators to locate existing data assets—even when they don't have any permissions for that content.

Discovery of existing data is useful for:

- Report creators who want to use an existing semantic model for a new report.
- Report creators who want to query data from an existing datamart.
- Semantic model creators who want to use an existing semantic model for a new composite model.

> [!NOTE]
> [Data discovery](/power-bi/collaborate-share/service-discovery) in Power BI isn't a data security permission. It's a setting that allows report creators to read metadata, helping them to discover data and request access to it.

You can set up a semantic model or datamart as discoverable when it's been [endorsed](/power-bi/collaborate-share/service-endorsement-overview) (certified or promoted). When it's discoverable, content creators can find it in the [data hub](/power-bi/connect-data/service-data-hub).

A content creator can also request access to the semantic model or datamart. Essentially, an access request asks for [Build permission](#read-and-build-permissions-for-underlying-semantic-model), which is required to create new content based on it. When responding to requests for access, consider using groups instead of individual users. For more information about how to use groups for this purpose, see [Request access workflow for consumers](powerbi-implementation-planning-security-report-consumer-planning.md#request-access-workflow-for-consumers).

Consider the following three examples.

- The **Sales Summary** semantic model is certified. It's the trusted and authoritative source for sales tracking. Many self-service report creators throughout the organization use this semantic model. So, there are many existing reports and composite models based on the semantic model. To encourage other creators to find and use the semantic model, it's set as discoverable.
- The **Inventory Stats** semantic model is certified. It's a trusted and authoritative source for inventory analysis. The semantic model and related reports are maintained and distributed by the enterprise BI team. Due to the complex design of the semantic model, only the enterprise BI team is allowed to create and maintain inventory content. Since the goal is to discourage report creators from using the semantic model, it isn't set as discoverable.
- The **Executive Bonuses** semantic model contains highly confidential information. Permissions to view or update this semantic model are restricted to a few users. This semantic model isn't set as discoverable.

The following screenshot shows a semantic model in the data hub in the Power BI service. Specifically, it shows an example of a _Request access_ message for a discoverable semantic model. This message is shown when the user doesn't currently have access. The _Request access_ message has been customized in the semantic model settings.

The _Request access_ message reads: _For standard sales reporting of MTD/QTD/YTD, this semantic model is the authoritative and certified source. Please request access to the semantic model by completing the form located at `https://COE.contoso.com/RequestAccess`. You will be asked for a brief business justification, and the manager of the Center of Excellence will be required to approve the request as well. Access will be audited every six months._

:::image type="content" source="media/powerbi-implementation-planning-security-content-creator-planning/request-semantic-model-access.png" alt-text="Screenshot of the request access message in the data hub, for a semantic model that's set to be discoverable." border="false":::

> [!NOTE]
> Your [data culture](fabric-adoption-roadmap-data-culture.md) and your stance on [data democratization](fabric-adoption-roadmap-data-culture.md#data-democratization) should strongly influence whether you enable data discovery. For more information about data discovery, see the [customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) usage scenario.

There are three tenant settings related to discovery.

- The _Discover content_ tenant setting allows Power BI administrators to set which groups of users are allowed to discover data. It's primarily targeted at report creators who might need to locate existing semantic models when creating reports. It's also useful for semantic model creators who might look for existing data that they can use in their composite model development. While it's possible to set it for specific security groups, it's a good idea to enable the setting for the entire organization. The discovery setting on individual semantic models and dataflows will control what's discoverable. Less commonly, you might consider restricting this capability only to approved content creators.
- The _Make certified content discoverable_ tenant setting allows Power BI administrators to set which groups can set content to be discoverable (when they also have permission to edit the item as well as permission to certify content, which is granted by the _Certification_ tenant setting). The ability to certify content should be tightly controlled. In most cases, the same users who are allowed to certify content should be allowed to set it as discoverable. In some situations, you might want to restrict this capability only to approved data creators.
- The _Make promoted content discoverable_ tenant setting allows Power BI administrators to set which groups can set the content as discoverable (when they also have permissions to edit the data). Because the ability to promote content is open to all content creators, in most cases, this capability should be available to all users. Less commonly, you might consider restricting this capability to only approved content creators.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning data discovery for your content creators, key decisions and actions include:

> [!div class="checklist"]
> - **Clarify needs for data discovery:** Consider what your organization's position is on encouraging content creators to find existing semantic models and datamarts. When appropriate, create a governance policy about how data discovery should be used.
> - **Decide who can discover content:** Decide whether any Power BI user is allowed to discover content, or whether discovery should be limited to certain groups of users (for example, a group of approved content creators). Set the _Discover content_ tenant setting to align with this decision.
> - **Decide who can set certified content to be discoverable:** Decide whether any Power BI user (who has permission to edit the semantic model or datamart, as well as permission to certify it) can set it as discoverable. Set the _Make certified content discoverable_ tenant setting to align with this decision.
> - **Decide who can set promoted content to be discoverable:** Decide whether any Power BI user (who has permission to edit the semantic model or datamart) can set it as discoverable. Set the _Make promoted content discoverable_ tenant setting to align with this decision.
> - **Include in documentation and training for semantic model creators:** Include guidance for your semantic model creators about when it's appropriate to use data discovery for the semantic models and datamarts they own and manage.
> - **Include in documentation and training for report creators:** Include guidance for your content creators about how data discovery works, and what they can expect.

## Request access workflow for creators

A user can request access to content in two ways.

- **For content consumers:** A user receives a link to an existing report or app in the Power BI service. To view the item, the consumer can select the _Request access_ button. For more information, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#request-access-workflow-for-consumers) article.
- **For content creators:** The user discovers a semantic model or datamart in the data hub. To create a new report or composite model based on the existing data, the content creator can select the _Request access_ button. This experience is the focus of this section.

By default, a request for access to a semantic model or a datamart goes to the [owner](/power-bi/connect-data/service-datasets-build-permissions#configure-how-users-request-build-permission). The owner is the user who last scheduled data refresh or input credentials. Relying on one user to process access requests might be acceptable for team semantic models. However, that might not be practical or reliable.

Instead of relying on one owner, you can define [custom instructions](/power-bi/connect-data/service-datasets-build-permissions#changing-the-access-request-behavior) that are presented to users when they request access to a semantic model or datamart. Custom instructions are helpful when:

- The semantic model is set as [discoverable](#discover-content-for-creators).
- Approval of the access request will be done by someone other than the data owner.
- There's an existing process in place that needs to be followed for access requests.
- Tracking of who requested access, when, and why is necessary for auditing or compliance reasons.
- Explanation is necessary for how to request access, and to set expectations.

The following screenshot shows an example of setting up custom instructions that a user sees when they request the Build permission. The custom instructions read: _For standard sales reporting of MTD/QTD/YTD, this semantic model is the authoritative and certified source. Please request access to the semantic model by completing the form located at `https://COE.contoso.com/RequestAccess`. You will be asked for a brief business justification, and the manager of the Center of Excellence will be required to approve the request as well. Access will be audited every six months._

:::image type="content" source="media/powerbi-implementation-planning-security-content-creator-planning/request-access-instructions.png" alt-text="Screenshot of the request access setting for a semantic model in the Power BI service." border="false":::

There are many options to create a form. [Power Apps](/power-apps/powerapps-overview) and [Microsoft Forms](/microsoft-forms/set-up-microsoft-forms) are both low-code, easy-to-use options. We recommend that you create a form in a way that's independent of a single user. It's crucial that your form is created, managed, and monitored by the proper team.

We recommend that you create helpful information for:

- Content creators so they know what to expect when they request access.
- Content owners and administrators so they know how to manage requests that are submitted.

> [!TIP]
> For more information about responding to requests for read access from consumers, see [Request access workflow for consumers](#request-access-workflow-for-creators). It also includes information about using groups (instead of individual users).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning the _Request access_ workflow, key decisions and actions include:

> [!div class="checklist"]
> - **Clarify preferences for how to handle access requests:** Determine for which situations it's acceptable for owner approval, and when a different process should be used. When appropriate, create a governance policy about how access requests should be handled.
> - **Include in documentation and training for semantic model and datamart creators:** Include guidance for your semantic model and datamart creators about how and when to set custom instructions for access requests.
> - **Include in documentation and training for report creators:** Include guidance for your report creators about what they can expect when requesting Build permissions for semantic models and datamarts.

## Create and publish content

This section includes security aspects that apply to content creators.

> [!NOTE]
> For consumers who view reports, dashboards, and scorecards, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article. Considerations related to app permissions are covered in that article, too.

### Workspace roles

You grant workspace access by adding users or groups (including security groups, Microsoft 365 groups, and distribution lists) to [workspace roles](/power-bi/collaborate-share/service-roles-new-workspaces#workspace-roles). Assigning users to workspace roles allows you to specify what they can do with the workspace and its content.

> [!NOTE]
> For more information about workspace planning considerations, see the [workspace planning](powerbi-implementation-planning-workspaces-overview.md) articles. For more information about groups, see the [Tenant-level security planning](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups) article.

Because the primary purpose of a workspace is collaboration, workspace access is mostly relevant for the users who own and manage its content. When starting to plan for workspace roles, it's helpful to ask yourself the following questions.

- What are the expectations for how collaboration will occur in the workspace?
- Who will be responsible for managing the content in the workspace?
- Is the intention to assign individual users or groups to workspace roles?

There are four Power BI workspace roles: Admin, Member, Contributor, and Viewer. The first three roles are relevant to content creators, who create and publish content. The Viewer role is relevant to read-only consumers.

The four workspace role permissions are nested. That means that workspace administrators have all the capabilities available to members, contributors, and viewers. Likewise, members have all the capabilities available to contributors and viewers. Contributors have all the capabilities available to viewers.

> [!TIP]
> See the [workspace roles](/power-bi/collaborate-share/service-roles-new-workspaces#workspace-roles) documentation for the authoritative reference for each of the four roles.

#### Workspace administrator

Users assigned to the Admin role become the workspace administrators. They can manage all settings and perform all actions, including adding or removing users (including other workspace administrators).

Workspace administrators can update or delete the Power BI app (if one exists). They can, optionally, allow contributors to update the app for the workspace. For more information, see [Variations to workspace roles](#variations-to-workspace-roles) later in this article.

> [!TIP]
> When referring to an administrator, be sure to clarify whether you're speaking about a workspace administrator or a Power BI tenant-level administrator.

Take care to ensure that only trusted and reliable individuals are workspace administrators. A workspace administrator has high privileges. They have access to view and manage all content in the workspace. They can add and remove users (including other administrators) to any workspace role. They can also delete the workspace.

We recommend that there are at least two administrators so that one serves as a backup should the primary administrator be unavailable. A workspace that doesn't have an administrator is known as an _orphaned workspace_. The orphaned status occurs when a user leaves the organization and there's no alternative administrator assigned to the workspace. For more information about how to detect and rectify orphaned workspaces, see the [View workspaces](/power-bi/admin/service-admin-portal-workspaces) article.

Ideally, you should be able to determine who's responsible for the workspace content by who the workspace administrators and members are (and the contacts specified for the workspace). However, some organizations adopt a [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) strategy that restricts workspace creation to specific users or groups. They typically have an established [workspace creation process](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-creation-process) that is managed by the IT department. In this case, the workspace administrators would be the IT department rather than the users who directly create and publish the content.

#### Workspace member

Users assigned to the Member role can add other workspace users (but not administrators). They can also manage permissions for all content in the workspace.

Workspace members can publish or unpublish the app for the workspace, share a workspace item or the app, and allow other users to share workspace items of the app.

Workspace members should be limited to the users who need to manage the workspace content creation and publish the app. In some cases, the workspace administrators fulfill that purpose, so you might not need to assign any users or groups to the Member role. When the workspace administrators aren't directly related to the workspace content (for example, because IT manages the workspace creation process), the workspace members might be the true owners responsible for the workspace content.

#### Workspace contributor

Users assigned to the Contributor role can create, edit, or delete workspace content.

Contributors can't update the Power BI app (when one exists for the workspace) unless that's been allowed by the workspace setting. For more information, see [Variations to workspace roles](#variations-to-workspace-roles) later in this article.

Most content creators in the organization are workspace contributors.

#### Workspace viewer

Users assigned to the Viewer role can view and interact with all workspace content.

The Viewer role is relevant to read-only consumers for small teams and informal scenarios. It's fully described in the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#workspace-viewer-role) article.

#### Workspace ownership considerations

Consider an example where the following actions are taken to set up a new workspace.

1. Specific Power BI champions and satellite members of the Center of Excellence (COE) have been granted permission in the tenant settings to create new workspaces. They've been trained in content organization strategies and naming standards.
1. You (a content creator) submit a request to create a workspace for a new project that you'll manage. The workspace will include reports that track the progress of your project.
1. A Power BI champion for your business unit receives the request. They determine that a new workspace is justified. They then create a workspace and assign the Power BI champions security group (for their business unit) to the workspace Admin role.
1. The Power BI champion assigns you (the content creator) to the workspace Member role.
1. You assign a trusted colleague to the workspace Member role to ensure there's a backup should you be away.
1. You assign other colleagues to the workspace Contributor role because they'll be responsible for creating the workspace content, including semantic models and reports.
1. You assign your manager to the workspace Viewer role because they've requested access to monitor the progress of the project. Your manager would like to review content in the workspace before you publish an app.
1. You take responsibility for managing other workspace properties such as description and contacts. You also take responsibility for managing workspace access on an ongoing basis.

The previous example shows an effective way to allow a decentralized business unit the ability to act independently. It also shows the [principle of least privilege](/azure/active-directory/develop/secure-least-privileged-access).

For governed content, or critical content that's more tightly managed, it's a best practice to assign groups rather than individual user accounts to workspace roles. That way, you can manage the group membership separately from the workspace. However, when you assign groups to roles, it's possible that users become assigned to multiple workspace roles (because the user belongs to multiple groups). In that case, their effective permissions are based on the highest role that they're assigned to. For more considerations, see [Strategy for using groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups).

When a workspace is co-owned by multiple individuals or teams, it can make management of the content complicated. Try to avoid multi-team ownership scenarios by separating out workspaces. That way, responsibilities are clear and role assignments are straightforward to set up.

#### Variations to workspace roles

There are two variations to the four workspace roles (described previously).

- By default, only workspace administrators and members can create, publish, and update the app for the workspace. The _[Allow contributors to update the app option for this workspace](/power-bi/collaborate-share/service-create-the-new-workspaces#allow-contributors-to-update-the-app)_ setting is a workspace-level setting, which lets workspace administrators delegate the ability to update the app for the workspace to contributors. However, contributors can't publish a new app or change who has permission to edit it. This setting is useful when you want contributors to be able to update the app (when one exists for the workspace), yet not grant the other permissions available to members.
- The _[Block republish and disable package refresh](/fabric/admin/service-admin-portal-dataset-security#block-republish-and-disable-package-refresh)_ tenant setting only allows semantic model owners to publish updates. When enabled, workspace administrators, members, and contributors can't publish changes unless they first take over the semantic model as its owner. Because this setting applies to the entire organization, enable it with a measure of caution because it affects all semantic models for the tenant. Be sure to communicate to your semantic model creators what to expect because it changes the normal behavior of workspace roles.

> [!IMPORTANT]
> Per-item permissions can also be thought of as an override of the standard workspace roles. For more information about per-item permissions, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#per-item-permissions) article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for workspace roles, key decisions and actions include:

> [!div class="checklist"]
> - **Create a responsibility matrix:** Map out who is expected to handle each function when creating, maintaining, publishing, securing, and supporting content. Use this information when planning your workspace roles.
> - **Decide on your strategy for assigning workspace roles for content creators:** Determine which users should be an administrator, member, or contributor, and in what circumstances (such as job role or subject area). If there are mismatches that cause a security concern, reconsider how your workspaces could be better organized.
> - **Determine how security groups versus individuals should be used for workspace roles:** Determine the use cases and purposes you'll need to use groups. Be specific about when security should be applied by using user accounts versus when a group is required or preferred.
> - **Provide guidance for content creators about managing workspace roles:** Include documentation for content creators about how to manage workspace roles. Publish this information to your centralized portal and training materials.
> - **Set up and test workspace role assignments:** Verify that content creators have the functionality they need for editing and publishing content.

### App creator permissions

Content creators who are workspace administrators or members can create and publish a Power BI app.

A workspace administrator can also specify a setting in the workspace which [allows workspace contributors to update the app](/power-bi/collaborate-share/service-create-the-new-workspaces#allow-contributors-to-update-the-app). It's a variation to workspace role security because it grants contributors one other permission they wouldn't normally have. This setting is set on a per-workspace basis.

> [!TIP]
> For more information about delivering content to read-only consumers, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article. This article includes information about app permissions for app consumers, including audiences for the app.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for app creator permissions, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on your strategy for who can create and publish Power BI apps:** Clarify who should be permitted to create and publish Power BI apps.
> - **Determine when contributors can update Power BI apps:** Clarify the situations when a contributor should be permitted to update Power BI apps. Update the workspace setting when this capability is required.

### Data source permissions

When a data creator starts a new project, permissions required to access external data sources are one of their first security-related considerations. They might also need guidance on other data source related matters, including privacy levels, native database queries, and custom connectors.

#### Access to data source

When a data creator creates a semantic model, dataflow, or datamart, they must authenticate with data sources to retrieve data. Usually, authentication involves user credentials (account and password), which could be for a service account.

Sometimes it's useful to create specific service accounts for accessing data sources. Check with your IT department for guidance on how service accounts should be used in your organization. When they're permitted, the use of service accounts can:

- Centralize permissions needed for data sources.
- Reduce the number of individual users that need permissions to a data source.
- Avoid data refresh failures when a user leaves the organization.

> [!TIP]
> If you choose to use service accounts, we recommend that you tightly control who has access to the credentials. Rotate passwords on a regular basis (such as every three months) or when someone that has access leaves the organization.

When accessing data sources, apply the [principle of least privilege](/azure/active-directory/develop/secure-least-privileged-access) to ensure that users (or service accounts) have permission to read _only_ the data they need. They should never have permission to perform data modifications. Database administrators who create these service accounts should inquire about expected queries and workloads and take steps to ensure adequate optimizations (like indexes) and resources are in place.

> [!TIP]
> If it's difficult to provide direct data source access to self-service data creators, consider using an indirect approach. You can create dataflows in the Power BI service and allow self-service data creators to source data from them. This approach has the added benefits of reducing the query load on the data source and delivering a consistent snapshot of data. For more information, see the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) and [advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenarios.

The credentials (account and password) can be applied in one of two ways.

- **Power BI Desktop:** Credentials are encrypted and stored locally on the user machine.
- **Power BI service:** Credentials are encrypted and securely stored for either:
  - The semantic model (when a data gateway isn't in use to reach the data source).
  - The gateway data source (when a [standard gateway](/power-bi/connect-data/service-gateway-onprem) or a [virtual network gateway service](/data-integration/vnet/use-data-gateways-sources-power-bi) is in use to reach the data source).

> [!TIP]
> When you've already entered credentials for a semantic model data source, the Power BI service will automatically bind those credentials to other semantic model data sources when there's an exact match of connection string and database name. Both the Power BI service and Power BI Desktop make it look like you're entering credentials for each data source. However, it can apply the same credentials to matching data sources that have the same owner. In that respect, semantic model credentials are _scoped_ to the owner.

Credentials are encrypted and stored separately from the data model in both Power BI Desktop and the Power BI service. This data separation has the following security advantages.

- It facilitates the reuse of credentials for multiple semantic models, dataflows, and datamarts.
- When someone parses the metadata of a semantic model, they can't extract the credentials.
- In Power BI Desktop, another user can't connect to the original data source to refresh data without first applying the credentials.

Some data sources support [single-sign on (SSO)](/power-bi/connect-data/service-gateway-sso-overview), which can be set when entering credentials in the Power BI service (for semantic model or gateway data sources). When you enable SSO, Power BI sends the authenticated user's credentials to the data source. This option enables Power BI to honor the security settings that are set up in the data source, such as row-level security. SSO is especially useful when tables in the data model use [DirectQuery storage mode](/power-bi/connect-data/service-dataset-modes-understand#directquery-mode).

#### Privacy levels

[Data privacy levels](/power-bi/enterprise/desktop-privacy-levels) specify isolation levels that define the degree that one data source is isolated from other data sources. When appropriately set, they ensure that Power Query only transmits compatible data between sources. When Power Query can transmit data between data sources, it can result in more efficient queries that reduce the volume of data that's sent to Power BI. When it can't transmit data between data sources, it can result in slower performance.

There are three privacy levels.

- **Private:** Includes sensitive or confidential data that must be isolated from all other data sources. This level is the most restrictive. Private data source data can't be shared with any other data sources. For example, a human resources database that contains employee salary values should be set to the Private privacy level.
- **Organizational:** Isolated from public data sources but is visible to other organizational data sources. This level is the most common. Organizational data source data can be shared with private data sources or other organizational data sources. Most internal operational databases can be set with the Organizational privacy level.
- **Public:** Non-sensitive data that could be made visible to any data source. This level is the least restrictive. Public data source data can be shared with any other data source. For example, a census report obtained from a government website can be set to the Public privacy level.

When combining queries from different data sources, it's important that you set the correct privacy levels. When privacy levels are set correctly, there's the potential for data from one data source to be transmitted to another data source to efficiently query data.

Consider a scenario where a semantic model creator has two data sources: an Excel workbook and a table in an Azure SQL Database. They want to filter the data in the Azure SQL Database table by using a value sourced from the Excel workbook. The most efficient way for Power Query to generate a SQL statement for the Azure SQL Database is to apply a WHERE clause to perform the necessary filtering. However, that SQL Statement will contain a WHERE clause predicate with a value sourced from the Excel workbook. If the Excel workbook contains sensitive data, it could represent a security breach because the database administrator could view the SQL statement by using a tracing tool. While less efficient, the alternative is for the Power Query mashup engine to download the entire result set of the database table and perform the filtering itself in the Power BI service. This approach will be less efficient and slow, but secure.

Privacy levels can be set for each data source:

- By data modelers in Power BI Desktop.
- By semantic model owners in the Power BI service (for cloud data sources, which don't require a gateway).
- By gateway [data source creators and owners](/data-integration/gateway/manage-security-roles) in the Power BI service (for gateway data sources).

> [!IMPORTANT]
> The privacy levels that you set in Power BI Desktop aren't transferred to the Power BI service.

There's a Power BI Desktop security option that allows ignoring privacy levels to improve performance. You might use this option to improve query performance while developing a data model when there's no risk of breaching data security (because you're working with development or test data that isn't sensitive). However, this setting isn't honored by the Power BI service.

For more information, see [Power BI Desktop privacy levels](/power-bi/enterprise/desktop-privacy-levels).

#### Native database queries

To create efficient Power Query queries, you can use a _[native query](/power-query/native-database-query)_ to access data. A native query is a statement written in a language supported by the data source. Native queries are only supported by [specific data sources](/power-query/native-database-query#connectors-that-support-native-database-queries), which are typically relational databases like Azure SQL Database.

Native queries can pose a security risk because they could run a malicious SQL statement. A malicious statement could perform data modifications or delete database records (when the user has the required permissions in the data source). For this reason, by default, native queries require user approval to run in Power BI Desktop.

There's a Power BI Desktop security option that allows you to disable the requirement for pre-approval. We recommend that you leave the default setting that requires user approval, especially when you anticipate that the Power BI Desktop file could be refreshed by other users.

#### Custom connectors

Developers can use the [Power Query SDK](/power-query/installingsdk) to create _custom connectors_. Custom connectors allow access to proprietary data sources or implement specific authentication with custom data extensions. Some custom connectors are certified and distributed by Microsoft as _certified connectors_. Certified connectors have been audited and reviewed to ensure that they meet certain specified code requirements that Microsoft has tested and approved.

There's a Power BI Desktop [data extension security option](/power-bi/connect-data/desktop-connector-extensibility) that restricts the use of non-certified connectors. By default, an error is raised when an attempt is made to load a non-certified connector. By setting this option to allow non-certified connectors, custom connectors will load without validation or warning.

We recommend that you keep your data extension security level at the higher level, which prevents loading of non-certified code. However, there might be cases where you want to load specific connectors, perhaps connectors that you've developed, or connectors provided to you by a trusted consultant or vendor outside the Microsoft certification path.

> [!NOTE]
> Developers of in-house-developed connectors can take steps to sign a connector with a certificate, allowing you to use the connector without the need to change your security settings. For more information, see [Trusted third-party connectors](/power-bi/connect-data/desktop-trusted-third-party-connectors).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning data source permissions, key decisions and actions include:

> [!div class="checklist"]
> - **Decide who can directly access each data source:** Determine which data creators are permitted to access a data source directly. If there's a strategy to reduce the number of people with direct access, clarify what the preferred alternative is (perhaps by using dataflows).
> - **Decide how data sources should be accessed:** Determine whether individual user credentials will be used for accessing a data source, or whether a service account should be created for that purpose. Determine when single sign-on is appropriate.
> - **Provide guidance for semantic model creators about accessing data sources:** Include documentation for content creators about how to access organizational data sources. Publish the information to your centralized portal and training materials.
> - **Provide guidance for semantic model creators about privacy levels:** Provide guidance to semantic model creators to make them aware of privacy levels, and their implications when working with sensitive or confidential data. Publish this information to your centralized portal and training materials.
> - **Provide guidance for gateway connection creators about privacy levels:** Provide guidance to semantic model creators to make them aware of privacy levels and their implications when working with sensitive or confidential data. Publish this information to your centralized portal and training materials.
> - **Decide on the strategy for using native database queries:** Consider your strategy for using native database queries. Educate semantic model creators on how and when to set the Power BI Desktop native database queries option to disable pre-approval when Power Query runs native queries.
> - **Decide on the strategy for using custom connectors:** Consider your strategy for using custom connectors. Determine whether the use of non-certified connectors is justified, in which case educate semantic model creators on how and when to set the Power BI Desktop data extension option.

### Semantic model creator permissions

You can assign permission to edit a semantic model to a user or group in different ways.

- **Workspace role:** Assignment to any of the workspace roles provides access to all semantic models in the workspace. The ability to view or edit an existing semantic model depends on the [workspace role](/power-bi/connect-data/service-datasets-permissions#permissions-acquired-implicitly-via-workspace-role) that you assign. Administrators, members, and contributors can publish or edit content within a workspace.
- **Per-item permission links:** If a [sharing link](/power-bi/collaborate-share/service-share-dashboards) was created for a report, permission to read the semantic model (and optionally, build, write, and/or reshare) is also indirectly granted by the link.
- **Per-item direct access permissions:** You can assign the [direct access](/power-bi/connect-data/service-datasets-manage-access-permissions#manage-direct-access) permission to a specific semantic model.

In the following screenshot, notice the permissions assigned to the **Call Center Data** semantic model. One user has Read permission, which was granted by using per-item direct access permissions. The remaining users and groups have permissions because they're assigned to workspace roles.

:::image type="content" source="media/powerbi-implementation-planning-security-content-creator-planning/semantic-model-permissions.png" alt-text="Screenshot from the Power BI service showing direct access permissions for a semantic model for users and groups." border="false":::

> [!TIP]
> Using per-item permissions (links or direct access) works best when the intention is for a user or group to view or edit one specific item in the workspace. It's best suited when the user isn't permitted to access all items in the workspace. In most cases, we recommend that you design your workspaces so that security is simpler to manage with workspace roles. Avoid setting per-item permissions whenever possible.

#### Semantic model permissions

You can assign the following [semantic model permissions](/power-bi/connect-data/service-datasets-permissions).

- **Read:** Targeted primarily at report consumers, this permission allows a report to query data in the semantic model. For more information about permissions for viewing read-only content, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article.
- **Build:** Targeted at report creators, this permission allows users to create new reports based on the shared semantic model. For more information, see the [Report creator permissions](#report-creator-permissions) section later in this article.
- **Write:** Targeted at semantic model creators who create, publish, and manage semantic models, this permission allows users to edit the semantic model. It's described later in this section.
- **Reshare:** Targeted at anyone with existing permission to the semantic model, this permission allows users to share the semantic model with another user. It's described later in this section.

A workspace administrator or member can edit the permissions for a semantic model.

#### Semantic model Read permission

The semantic model Read permission is primarily targeted at consumers. This permission is required for users to be able to view data that's displayed in reports. Be aware that reports based on the semantic model must also have Read permission; otherwise, the report will fail to load. For more information about setting report Read permissions, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article.

#### Semantic model Build permission

In addition to semantic model Read permission, content creators also need the semantic model [Build permission](/power-bi/connect-data/service-datasets-build-permissions). Specifically, the Build permission allows report creators to:

- Create new Power BI reports based on the semantic model.
- Connect to the semantic model by using [Analyze in Excel](/power-bi/collaborate-share/service-analyze-in-excel).
- Query the semantic model by using the [XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools).
- Export Power BI report visual underlying data (instead of the summarized data retrieved by the visual).
- Create a [DirectQuery connection to a Power BI semantic model](/power-bi/connect-data/desktop-directquery-datasets-azure-analysis-services). In this case, the new semantic model connects to one or more existing Power BI semantic models (known as _chaining_). To query chained semantic models, the semantic model creator will need Build permission for all upstream semantic models. For more information, see [Chained semantic models](#chained-semantic-models) later in this article.

You can grant Build permission to a user or group, directly or indirectly, in different ways.

- Grant Build directly by:
  - Setting semantic model permissions on the [semantic model settings](/power-bi/connect-data/service-datasets-manage-access-permissions#manage-direct-access) page in the Power BI service.
  - Setting semantic model permissions by using the [Power BI REST API](/power-bi/developer/embedded/datasets-permissions).
- Grant Build indirectly by:
  - [Sharing](/power-bi/connect-data/service-datasets-manage-access-permissions#manage-links-generated-for-report-sharing) a report or dashboard and setting the option to grant semantic model Build permission.
  - Publishing a [Power BI app](/power-bi/connect-data/service-datasets-manage-access-permissions#managing-permissions-granted-through-an-app) and setting the advanced option (for an audience) to grant Build permission on the related semantic models.
  - Assigning users to the Admin, Member, or Contributor [workspace roles](/power-bi/connect-data/service-datasets-permissions#permissions-acquired-implicitly-via-workspace-role).

Setting Build permission directly for a semantic model is appropriate when you want to manage security on a granular, per-item basis. Setting Build permission indirectly is appropriate when the users who will view or use the content through one of the indirect methods will also create new content.

> [!TIP]
> Frequently, the users who view a report or a Power BI app are different from the users who create new content by using the underlying semantic model(s). Most consumers are viewers only, so they don't need to create new content. We recommend that you educate your content creators to grant the least number of permissions that are required.

#### Semantic model Write permission

Usually, setting permissions for who can edit and manage semantic models will be done by assigning users to either the Admin, Member, or Contributor workspace role. However, it's also possible to set Write permission for a specific semantic model.

We recommend that you use workspace roles whenever possible because it's the simplest way to manage and audit permissions. Use the semantic model Write permissions on a per-item basis when you've chosen to create fewer workspaces, and a workspace contains semantic models for different subject areas that require different permissions management.

> [!TIP]
> For guidance on how to organize workspaces, see the [workspace planning](powerbi-implementation-planning-workspaces-overview.md) articles.

#### Semantic model Reshare permission

The semantic model Reshare permission allows a user with existing permission to share the semantic model with other users. You can grant this permission when content in the semantic model can be freely shared, based on user discretion.

In many cases, we recommend limiting the use of the Reshare permission to ensure that semantic model permissions are carefully controlled. Get approval from the semantic model owner(s) before granting the Reshare permission.

#### Semantic model data security

You can plan to create fewer semantic models and reports by enforcing data security. The objective is to enforce data security based on the identity of the user who's viewing the content.

A semantic model creator can enforce data security in two ways.

- [Row-level security (RLS)](/fabric/security/service-admin-row-level-security) allows a data modeler to restrict access to a subset of data.
- [Object-level security (OLS)](/fabric/security/service-admin-object-level-security) allows a data modeler to restrict access to specific tables and columns, and their metadata.

The implementation of RLS and OLS are targeted at report consumers. For more information, see [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity) article. It describes how and when RLS and OLS are enforced for consumers who have view-only permission to the semantic model.

For RLS and OLS targeted at other report creators, see data security in the [Report creator permissions](#report-creator-permissions) section later in this article.

#### Chained semantic models

Power BI semantic models can connect to other semantic models in a process known as _chaining_, which are connections to upstream semantic models. For more information, see [Using DirectQuery for Power BI semantic models and Analysis Services](/power-bi/connect-data/desktop-directquery-datasets-azure-analysis-services#chaining).

The _Allow DirectQuery connections to Power BI semantic models_ tenant setting allows Power BI administrators to set up which groups of content creators can create chained semantic models. If you don't want to restrict semantic model creators from chaining semantic models, you can leave this setting enabled for the entire organization and rely on workspace access and semantic model permissions. In some cases, you might consider restricting this capability to approved content creators.

> [!NOTE]
> As a semantic model creator, you can restrict chaining to your semantic model. It's done by enabling the _Discourage DirectQuery connection to this semantic model_ option in Power BI Desktop. For more information, see [Manage DirectQuery connections to a published semantic model](/power-bi/connect-data/desktop-discourage-directquery-connections-to-dataset#discourage-directquery-connections-to-a-semantic-model-using-power-bi-desktop).

#### Semantic model API queries

In some situations, you might want to execute a DAX query by using the Power BI REST API. For example, you might want to perform data quality validations. For more information, see [Datasets - Execute Queries](/rest/api/power-bi/datasets/execute-queries).

The _Dataset Execute Queries REST API_ tenant setting allows Power BI administrators to set which groups of users can send DAX queries by using the Power BI REST API. In most cases, you can leave this setting enabled for the entire organization and rely on workspace access and semantic model permissions. In some cases, you might consider restricting this capability to approved content creators.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for semantic model creator permissions, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the strategy for semantic model creator permissions:** Determine what preferences and requirements exist for managing security for semantic model creators. Consider the subject area and level of data sensitivity. Also consider who's allowed to take responsibility for managing data and permissions in centralized and decentralized business units.
> - **Review how workspace roles are handled for semantic model creators:** Determine what the impact is on your workspace design process. Create separate data workspaces for each subject area so that you can more easily manage the workspace roles and semantic model security for each subject area.
> - **Provide guidance for semantic model creators about managing permissions:** Include documentation for semantic model creators about how to manage semantic model permissions. Publish this information to your centralized portal and training materials.
> - **Decide who can use DirectQuery connections for Power BI semantic models:** Decide whether there should be any limitations for which Power BI semantic model creators (with existing Build permission for a semantic model) can create a connection to a Power BI semantic model. Set the _Allow DirectQuery connections to Power BI semantic models_ tenant setting to align with this decision. If you decide to limit this capability, consider using a group such as _Power BI approved semantic model creators_.
> - **Decide who can query Power BI semantic models by using the REST API:** Decide whether to restrict Power BI content creators from querying Power BI semantic models by using the Power BI REST API. Set the _Dataset Execute Queries REST API_ tenant setting to align with this decision. If you decide to limit this capability, consider using a group such as _Power BI approved report creators_.
> - **Decide on the strategy for the use of RLS or OLS for semantic model creators:** Consider which use cases and purposes you intend to use RLS or OLS. Factor in the workspace design strategy, and who has read versus edit permissions, when you want to enforce RLS or OLS for semantic model creators.

### Report creator permissions

Report creators need workspace access to create reports in the Power BI service or publish them from Power BI Desktop. They must be either an administrator, member, or contributor in the target workspace.

Whenever possible, report creators should use an existing shared semantic model (via a live connection or DirectQuery). That way, the report creation process is _decoupled_ from the semantic model creation process. This type of separation provides many benefits for security and team development scenarios.

A report creator needs to be a workspace administrator, member, or contributor.

Unlike semantic models, there isn't a Write permission for reports. To support report creators, workspace roles must be used. For this reason, optimal workspace design is important to balance content organization and security needs.

> [!TIP]
> For permissions to support report consumers (including the Read and Reshare per-item permissions), see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article.

#### Read and Build permissions for underlying semantic model

Report creators must have Read and Build permissions on the semantic models that their reports will use, which includes [chained semantic models](#chained-semantic-models). That permission can be granted explicitly on the individual semantic models, or it can be granted implicitly for workspace semantic models when the report creator is a workspace administrator, member, or contributor.

The _Use semantic models across workspaces_ tenant setting allows Power BI administrators to set up which groups of users can create reports that use semantic models located in other workspaces. This setting is targeted at semantic model and report creators. Usually, we recommend that you leave this setting enabled for the entire organization and relying on workspace access settings and semantic model permissions. That way, you can encourage the use of existing semantic models. In some cases, you might consider restricting this capability only to approved content creators.

There's also the _Allow live connections_ tenant setting, which allows Power BI administrators to set up which groups of users can create live connections to semantic models in Power BI Desktop or Excel. It's targeted specifically at report creators, and it also requires that they're granted Read and Build permission on the semantic model that the report will use. We recommend that you leave this setting enabled for the entire organization and rely on workspace access and semantic model permissions. That way, you can encourage the use of existing semantic models. In some cases, you might consider restricting this capability only to approved content creators.

#### Data security for underlying semantic model

RLS and OLS (described previously in this article) are targeted at report consumers. However, sometimes it also needs to be enforced for report creators. Creating separate workspaces is justified when RLS needs to be enforced for report creators and also report consumers.

Consider the following scenario.

- **Centralized shared semantic models with RLS:** The enterprise BI team published sales semantic models to the _Sales Data_ workspace. These semantic models enforce RLS to show sales data for the assigned sales region of the report consumer.
- **Decentralized self-service report creators:** The sales and marketing business unit has many capable analysts who create their own reports. They publish their reports to the _Sales Analytics_ workspace.
- **Read and Build permissions for semantic models:** Whenever possible, the analysts use the semantic models from the _Sales Data_ workspace to avoid the unnecessary duplication of data. Because the analysts only have Read and Build permissions on these semantic models (with no write or edit permissions), RLS is enforced for the report creators (and also the report consumers).
- **Edit permissions for reporting workspace:** The analysts have more rights in the _Sales Analytics_ workspace. The administrator, member, or contributor workspace roles allow them to publish and manage their reports.

For more information about RLS and OLS, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity) article. It describes how and when RLS and OLS are enforced for consumers who have view-only permission to the semantic model.

#### Connecting to external semantic models

When a report creator connects to a shared semantic model for their report, they usually connect to a shared semantic model that's been published in their own Power BI tenant. When permission has been granted, it's also possible to connect to a shared semantic model in another tenant. The other tenant could be a partner, customer, or vendor.

This functionality is known as [in-place semantic model sharing](/power-bi/collaborate-share/service-dataset-external-org-share-about) (also known as _cross-tenant semantic model sharing_). The reports created by the report creator (or new composite models created by a semantic model creator) are stored and secured in your Power BI tenant by using your normal process. The original shared semantic model remains in its original Power BI tenant, and all permissions are managed there.

For more information, see the [Tenant-level security planning](powerbi-implementation-planning-security-tenant-level-planning.md) article. It includes information about the tenant settings and semantic model settings that make external sharing work.

#### Featured tables

In Power BI Desktop, semantic model creators can set a model table to become a _[featured table](/power-bi/collaborate-share/service-create-excel-featured-tables)_. When the semantic model is published to the Power BI service, report creators can use the Data Types Gallery in Excel to find the featured table, allowing them to add featured table data to augment their Excel worksheets.

The _Allow connections to featured tables_ tenant setting allows Power BI administrators to set up which groups of users can access featured tables. It's targeted at Excel users who want to [access Power BI featured tables in Excel organization data types](/power-bi/collaborate-share/service-excel-featured-tables). We recommend that you leave this setting enabled for the entire organization and rely on workspace access and semantic model permissions. That way, you can encourage the use of featured tables.

#### Custom visual permissions

In addition to core visuals, Power BI report creators can use _custom visuals_. In Power BI Desktop, custom visuals can be download from [Microsoft AppSource](https://appsource.microsoft.com/en-us/marketplace/apps?page=1&product=power-bi-visuals). They can also be developed in-house by using the [Power BI SDK](/power-bi/developer/visuals/environment-setup), and installed by opening the visual file (.pbviz).

Some visuals available for download from AppSource are _certified visuals_. Certified visuals meet certain specified code requirements that the Power BI team has tested and approved. The tests check that visuals don't access external services or resources.

The _Allow visuals created by the Power BI SDK_ tenant setting allows Power BI administrators to control which groups of users can use custom visuals.

There's also the _Add and use certified visuals only_ tenant setting, which allows Power BI administrators to block the use of non-certified visuals in the Power BI service. This setting can be enabled or disabled for the entire organization.

> [!NOTE]
> If you block the use of non-certified visuals, it only applies to the Power BI service. If you want to restrict their use in Power BI Desktop, ask your system administrators to use a [group policy setting](/power-bi/admin/organizational-visuals#certified-power-bi-visuals) to block their use in Power BI Desktop. Taking this step will ensure that report creators don't waste time and effort creating a report that won't work when published to the Power BI service. We highly recommend that you set up your users to have consistent experiences in the Power BI service (with the tenant setting) and Power BI Desktop (with group policy).

Power BI Desktop has an option to show a security warning when a report creator adds a custom visual to the report. Report creators can disable this option. This option doesn't test whether the visual is certified.

Power BI administrators can approve and deploy custom visuals for their organization. Report creators can then easily discover, update, and use these visuals. Administrators can then manage these visuals by updating versions or disabling and enabling specific custom visuals. This approach is useful when you want to make an in-house-developed visual available to your report creators, or when you acquire a custom visual from a vendor that isn't in AppSource. For more information, see [Power BI organizational visuals](/power-bi/developer/visuals/power-bi-custom-visuals-organization).

Consider a balanced strategy of enabling only certified custom visuals in your organization (with the tenant setting and group policy previously described), while deploying organizational visuals to handle any exceptions.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for report creator permissions, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the strategy for report creator permissions:** Determine what preferences and requirements exist for managing security for report creators. Consider the subject area and level of data sensitivity. Also, consider who's allowed to take responsibility for creating and managing reports in centralized and decentralized business units.
> - **Review how workspace roles are handled for report creators:** Determine what the impact is on your workspace design process. Create separate data workspaces and reporting workspaces for each subject area, so the workspace roles (and underlying semantic model security) are simplified for the subject area.
> - **Provide guidance for report creators about managing permissions:** Include documentation for report creators about how to manage permissions for report consumers. Publish this information to your centralized portal and training materials.
> - **Decide who can use shared semantic models:** Decide whether there should be any limitations for which Power BI report creators (who already have Read and Build permissions for a semantic model) can use semantic models across workspaces. Set the _Use semantic models across workspaces_ tenant setting to align with this decision. If you decide to limit this capability, consider using a group such as _Power BI approved report creators_.
> - **Decide who can use live connections:** Decide whether there should be any limitations for which Power BI report creators (who already have Read and Build permission for a semantic model) can use live connections. Set the _Allow live connections_ tenant setting to align with this decision. If you decide to limit this capability, consider using a group such as _Power BI approved report creators_.
> - **Decide on the strategy for use of RLS for report creators:** Consider which use cases and purposes you intend to use row-level security. Factor in the workspace design strategy to ensure that RLS is enforced for report creators.
> - **Decide on the strategy for use of custom visuals:** Consider your strategy for which report creators can use custom visuals. Set the _Allow visuals created by the Power BI SDK_ tenant setting to align with this decision. Create a process for using organizational visuals, when appropriate.

### Dataflow creator permissions

[Dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) are helpful for centralizing data preparation so that the work done in Power Query isn't repeated across many semantic models. They're a building block for achieving a _single source of truth_, preventing analysts from requiring direct access to sources, and for helping to perform extract, transform, and load (ETL) operations at scale.

A dataflow creator needs to be a workspace administrator, member, or contributor.

To consume a dataflow (for instance, from a new data model created in Power BI Desktop or in another workspace), a semantic model creator can belong to any workspace role, including the Viewer role. There's no concept of RLS for dataflows.

In addition to workspace roles, the _Create and use dataflows_ tenant setting must be enabled. This tenant setting applies to the entire organization.

Consider the following scenario.

- Many semantic models in the organization need to enforce dynamic RLS. It requires that user principal names (UPNs) be stored in the semantic model (to filter by the identity of the report consumer).
- A dataflow creator, who belongs to the Human Resources department, creates a dataflow of current employee details including their UPNs. They set up the dataflow to refresh daily.
- Semantic model creators then consume the dataflow in their model designs to set up RLS.

For more information about using dataflows, see the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) and [advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) usage scenarios.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for dataflow creator permissions, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the strategy for dataflow creator permissions:** Determine what preferences and requirements exist for managing security for dataflow creators. Consider who's allowed, or encouraged, to take responsibility for managing data preparation activities in centralized and decentralized business units.
> - **Decide who can create dataflows:** Decide whether there should be any limitations for which Power BI data creators can create dataflows. Set the _Create and use dataflows_ tenant setting to align with this decision.
> - **Review how workspace roles are handled for dataflow creators:** Determine what the impact is on your workspace design process. Create separate dataflow workspaces per subject area so that you can handle workspace roles and permissions separately for each the subject area, when appropriate.

### Datamart creator permissions

A [datamart](/power-bi/transform-model/datamarts/datamarts-overview) is a self-service analytics solution that enables users to store and explore data that's loaded in a fully managed relational database. It also comprises an auto-generated semantic model.

Datamarts provide a simple low-code experience to ingest data from different data sources, and to extract, transform, and load (ETL) the data by using Power Query Online. The data is loaded into an Azure SQL Database that's fully managed and requires no tuning or optimization. The auto-generated semantic model is always synchronized with the managed database because it's in DirectQuery mode.

You can create a datamart when you're either a workspace administrator, member, or contributor. Workspace roles also get mapped to database-level roles in the Azure SQL Database (however, because the database is fully managed, user permissions can't be edited or managed in the relational database).

The _Create datamarts_ tenant setting allows Power BI administrators to set up which groups of users can create datamarts.

#### Datamart sharing

For datamarts, the term _sharing_ takes on a meaning that's different to other Power BI content types. Usually, a sharing operation is targeted at a consumer because it provides read-only permission to one item, like a report.

Sharing a datamart is targeted at content creators (rather than consumers). It grants the Read and Build permissions, which allows users to query either the semantic model or the relational database, whichever they prefer.

Sharing a datamart allows content creators to:

- **Build content by using the auto-generated semantic model:** The semantic model is the semantic layer on which Power BI reports can be built. Most report creators should use the semantic model.
- **Connect to and query the Azure SQL Database:** The relational database is useful for content creators who want to create new semantic models or paginated reports. They can write structured query language (SQL) queries to retrieve data by using the SQL endpoint.

#### Datamart row-level security

You can define [RLS for datamarts](/power-bi/transform-model/datamarts/datamarts-access-control#row-level-security) to restrict data access for specified users. RLS is set up in the datamart editor in the Power BI service, and it's automatically applied to the auto-generated semantic model and the Azure SQL Database (as security rules).

Regardless of how a user chooses to connect to the datamart (to the semantic model or the database), identical RLS permissions are enforced.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for datamart creator permissions, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the strategy for datamart creator permissions:** Determine what preferences and requirements exist for managing security for datamart creators. Consider who's allowed, or encouraged, to take responsibility for managing data in centralized and decentralized business units.
> - **Decide who can create datamarts:** Decide whether there should be any limitations for which Power BI data creators can create a datamart. Set the _Create datamarts_ tenant setting to align with this decision. If you decide to limit who can create datamarts, consider using a group such as _Power BI approved datamart creators_.
> - **Review how workspace roles are handled for datamart creators:** Determine what the impact is on your workspace design process. Create separate data workspaces per subject area so the workspace roles and semantic model security can be simplified for the subject area.
> - **Provide guidance for datamart creators about managing permissions:** Include documentation for datamart creators about how to manage datamart permissions. Publish this information to your centralized portal and training materials.
> - **Decide on the strategy for using RLS in datamarts:** Consider which use cases and purposes you intend to use RLS within a datamart.

### Scorecard creator permissions

[Metrics](/power-bi/create-reports/service-goals-introduction) in Power BI let you curate specific metrics and track them against key business objectives. Metrics are added to scorecards, which can be shared with other users and viewed in a single pane.

Scorecards can be secured with three levels of permissions:

- Workspace.
- Scorecard (per-item) permissions.
- Metrics (within the scorecard).

A user who creates, or fully manages, a scorecard needs to be a workspace administrator, member, or contributor.

Because metrics often span multiple subject areas, we recommend that you create a separate workspace so that you can independently manage permissions for creators and consumers.

The _Create and use metrics_ tenant setting allows Power BI administrators to set up which groups of users can create scorecard metrics.

#### Scorecard permissions

You can assign the following scorecard permissions.

- **Read:** This permission allows a user to view the scorecard.
- **Reshare:** Targeted at anyone with existing permission to the scorecard, this permission allows users to share the scorecard with another user.

Consistent with other content types in the Power BI service, the per-item permissions are useful when the intention is to share one item with another user. We recommend using workspace roles and app permissions whenever possible.

#### Metric-level permissions

Each scorecard has a set of [metric-level permissions](/power-bi/create-reports/service-goals-set-permissions) that you can set up in the scorecard settings. The metric-level permissions (within a scorecard) can be granted differently from the workspace or the scorecard (per-item) permissions.

The metric-level roles allow you to set:

- Who can view individual metrics on a scorecard.
- Who can update individual metrics by:
  - Updating the status during a check-in.
  - Adding notes during a check-in.
  - Updating the current value during a check-in.

To reduce the level of future maintenance, it's possible to set default permissions that will be inherited by submetrics you create in the future.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for metric creator permissions, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the strategy for scorecard creator permissions:** Determine what preferences and requirements exist for managing security for scorecard creators. Consider who's allowed, or encouraged, to take responsibility for managing data in centralized and decentralized business units.
> - **Decide who can create scorecards:** Decide whether there should be any limitations for which Power BI data creators can create scorecards. Set the _Create and use Metrics_ tenant setting to align with this decision. If you decide to limit who can create scorecards, consider using a group such as _Power BI approved scorecard creators_.
> - **Review how workspace roles are handled for scorecard creators:** Determine what the impact is on your workspace design process. Consider creating separate workspaces for scorecards when the content spans subject areas.
> - **Provide guidance for scorecard creators about managing permissions:** Include documentation for scorecard creators about how to manage metric-level permissions. Publish this information to your centralized portal and training materials.

### Publishing content

This section includes topics related to publishing content that are relevant to content creators.

#### Workspaces

Content creators will need administrator, member, or contributor role access to publish content to a workspace. For more information, see the [workspace roles](#workspace-roles) described earlier in this article.

Except for [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md), content creators should be encouraged to publish content to standard workspaces, instead of their personal workspace.

The _[Block republish and disable package refresh](/fabric/admin/service-admin-portal-dataset-security#block-republish-and-disable-package-refresh)_ tenant setting changes the behavior for publishing semantic models. When enabled, workspace administrators, members, or contributors can't publish changes to a semantic model. Only the semantic model owner is permitted to publish an update (forcing the takeover of a semantic model before publishing an updated semantic model). Because this tenant setting applies to the entire organization, enable it with a measure of caution because it affects all semantic models for the entire tenant. Be sure to communicate to your semantic model creators what to expect because it changes the normal behavior of workspace roles.

#### Power Apps synchronization

It's possible to create a Power Apps solution that includes embedded [Power BI reports](/power-apps/maker/model-driven-apps/customize-manage-powerbi-components). The Power Apps process will automatically create a dedicated Power BI workspace for storing and securing the Power BI reports and semantic models. To manage items that exist in both Power Apps and Power BI, there's a synchronization process.

The process synchronizes security roles to ensure that Power BI inherits the same roles that were initially set up in Power Apps. It also allows the content creator to manage permissions for who can view the Power BI reports (and related semantic models) that are embedded in a Power App.

For more information about synchronizing Power Apps roles with Power BI workspace roles, see [Permission sync between Power Apps environment and Power BI workspace](/power-apps/maker/model-driven-apps/customize-manage-powerbi-components#permission-sync-between-power-apps-environment-and-power-bi-workspace).

#### Deployment pipeline access

Content creators and owners can use Power BI [deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) for self-service content publishing. Deployment pipelines simplify the publication process and improve the level of control when releasing new content.

You manage pipeline permissions (for users who can deploy content with a deployment pipeline) separately from the workspace roles. [Access to both the workspace and the deployment pipeline](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#permissions) are required for the users conducting a deployment.

Content creators might also need:

- Workspace creation permissions (when workspaces need to be created by the pipeline).
- [Premium or Fabric capacity permissions](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#create-a-workspace) (when workspaces are assigned by the pipeline).

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

For more information, see [Deployment pipeline access](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md#access-for-deployment-pipeline).

#### XMLA endpoint

The XMLA endpoint uses the XMLA protocol to expose all features of a tabular data model, including some [data modeling operations](/power-bi/transform-model/desktop-external-tools#data-modeling-operations) that aren't supported by Power BI Desktop. You can use the [Tabular Object Model (TOM) API](/analysis-services/tom/tom-pbi-datasets) to make programmatic changes to a data model.

The XMLA endpoint also provides connectivity. You can only connect to a semantic model when the workspace has its license mode set to **Premium per user**, **Premium per capacity**, or **Embedded**. Once a connection is made, an XMLA-compliant tool can operate on the data model to read or write data. For more information about how you can use the XMLA endpoint for managing a semantic model, see the [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) usage scenario.

Access through the XMLA endpoint will honor existing permissions. Workspace administrators, members, and contributors implicitly have semantic model Write permission, which means they can deploy new semantic models from Visual Studio and execute [Tabular Modeling Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=asallproducts-allversions&preserve-view=true) scripts in SQL Server Management Studio (SSMS).

Users with the semantic model Build permission can use the XMLA endpoint to connect to and browse semantic models for data consumption and visualization. RLS rules are honored, and users can't see internal semantic model metadata.

The _Allow XMLA endpoints and Analyze in Excel with on-premises semantic models_ tenant setting refers to two capabilities: It controls which groups of users can use the XMLA endpoint to query and/or maintain semantic models in the Power BI service. It also determines whether Analyze in Excel can be used with on-premises SQL Server Analysis Services (SSAS) models.

> [!NOTE]
> The Analyze in Excel aspect of that tenant setting only applies to on-premises SQL Server Analysis Services (SSAS) models. The standard Analyze in Excel functionality, which connects to a Power BI semantic model in the Power BI service, is controlled by the _Allow Live Connections_ tenant setting.

#### Publish to web

[Publish to web](/power-bi/collaborate-share/service-publish-to-web) is a feature that provides access to Power BI reports to anyone on the internet. It doesn't require authentication and access isn't logged for auditing purposes. Because report consumers don't need to belong to the organization or have a Power BI license, this technique is well suited to data journalism, a process where reports are embedded in blog posts, websites, emails, or social media.

> [!CAUTION]
> Publish to web has the potential to expose sensitive or confidential data, whether accidentally or intentionally. For this reason, this feature is disabled by default. Publish to web should only be used for reports that contain data that can be viewed by the public.

The _Publish to web_ tenant setting allows Power BI administrators to control which groups of users can publish reports to the web. To maintain a higher level of control, we recommend that you don't include other groups in this tenant setting (like Power BI administrators or other types of content creators). Instead, enforce specific user access by using a security group such as _Power BI public publishing_. Ensure that the security group is well managed.

#### Embedding in custom apps

The _Embed content in apps_ tenant setting allows Power BI administrators to control which users can embed Power BI content outside of the Power BI service. When you plan to embed Power BI content in custom applications, enable this setting for specific groups, such as app developers.

#### Embedding in PowerPoint

The _Enable Power BI add-in for PowerPoint_ tenant setting allows Power BI administrators to control which users can [embed Power BI report pages in PowerPoint presentations](/power-bi/collaborate-share/service-power-bi-powerpoint-add-in-about). When appropriate, enable this setting for specific groups, such as report creators.

> [!NOTE]
> For this capability to work, users must install the Power BI add-in for PowerPoint. To use the add-in, users must either have access to the Office add-in store, or the add-in must be made available to them as an [admin managed add-in](/microsoft-365/admin/manage/centralized-deployment-of-add-ins). For more information, see [Power BI add-in for PowerPoint](/power-bi/collaborate-share/service-power-bi-powerpoint-add-in-about).

Educate report creators to be cautious about where they save their PowerPoint presentations and who they share them with. That's because an image of the Power BI report visuals is shown to users when they open the presentation. That image is captured from the last time the PowerPoint file was connected. However, the image could inadvertently reveal data that the receiving user doesn't have permission to see.

> [!NOTE]
> The image can be useful when the receiving user doesn't yet have the add-in, or until the add-in connects to the Power BI service to retrieve data. Once the user connects, only data the user can see (enforcing any RLS) is retrieved from Power BI.

#### Template apps

[Template apps](/power-bi/connect-data/service-template-apps-overview) enable Power BI partners and software vendors to build Power BI apps with little or no coding, and deploy them to any Power BI customer.

The _Publish template apps_ tenant setting allows Power BI administrators to control which users can publish template apps outside of the organization, such as through Microsoft AppSource. For most organizations, this tenant setting should be disabled or tightly controlled. Consider using a security group such as _Power BI external template app creators_.

#### Email subscriptions

You can subscribe yourself and others to Power BI reports, dashboards, and paginated reports. Power BI will then send an email on a schedule you set. The email will contain a snapshot and link to the report or dashboard.

You can create a subscription that includes other users when you're a workspace administrator, member, or contributor. If the report is in a Premium workspace, you can subscribe groups (whether they're in your domain or not) and external users. When setting up the subscription, there's also the option to grant permissions to the item. Per-item direct access permissions are used for this purpose, which are described in the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article.

> [!CAUTION]
> The email subscription feature has the potential to share content to internal and external audiences. Also, when RLS is enforced on the underlying semantic model, attachments and images are generated by using the security context of the subscribing user.

The _Email subscriptions_ tenant setting allows Power BI administrators to control whether this feature is enabled or disabled for the entire organization.

There are some limitations concerning attachments related to licensing and tenant setting restrictions. For more information, see [Email subscriptions for reports and dashboards in the Power BI service](/power-bi/consumer/end-user-subscribe#considerations-and-limitations).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for publishing content, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the strategy for where content should be published, how, and by whom:** Determine what preferences and requirements exist for where content gets published.
> - **Verify workspace access:** Confirm the workspace design approach. Verify how to use the workspace access roles to support your strategy for where content should be published.
> - **Determine how to handle deployment pipeline permissions:** Decide which users are permitted to publish content by using a deployment pipeline. Set the deployment pipeline permissions accordingly. Ensure that workspace access is also provided as well.
> - **Decide who can connect to semantic models by using the XMLA endpoint:** Decide which users are permitted to query or manage semantic models by using the XMLA endpoint. Set the _Allow XMLA endpoints and Analyze in Excel with on-premises semantic models_ tenant setting to align with this decision. When you decide to limit this capability, consider using a group such as _Power BI approved content creators_.
> - **Decide who can publish reports publicly:** Decide which users are permitted to publish Power BI reports publicly, if any. Set the _Publish to web_ tenant setting to align with this decision. Use a group such as _Power BI public publishing_.
> - **Decide who can embed content in custom apps:** Determine who should be allowed to embed content outside of the Power BI service. Set the _Embed content in apps_ tenant setting to align with this decision.
> - **Decide who can embed content in PowerPoint:** Determine who should be allowed to embed content in PowerPoint. Set the _Enable Power BI add-in for PowerPoint_ tenant setting to align with this decision.
> - **Decide who can publish template apps:** Determine what your strategy is for using template apps outside of the organization. Set the _Publish template apps_ tenant setting to align with this decision.
> - **Decide whether to enable subscriptions:** Confirm what your strategy is for using subscriptions. Set the _Email Subscriptions_ tenant setting to align with this decision.

## Refresh data

Once published, data creators should ensure that their semantic models and dataflows (that contain imported data) are periodically refreshed. You should also decide on appropriate strategies for the semantic model and dataflow owners.

### Semantic model owner

Each semantic model has an owner, which is a single user account. The semantic model owner is required to set up semantic model refresh and set semantic model parameters.

By default, the semantic model owner also receives access requests from report creators who want Build permissions (unless the _Request access settings_ for the semantic model are set to provide custom instructions). For more information, see the [Request access workflow for creators](#request-access-workflow-for-creators) section in this article.

There are two ways that Power BI can obtain credentials to refresh a semantic model.

- The semantic model owner stores credentials in the semantic model settings.
- The semantic model owner references a gateway in the semantic model settings (that contains a data source with stored credentials).

If a different user needs to set up refresh or set semantic model parameters, they must take ownership of the semantic model. semantic model ownership can be taken over by a workspace administrator, member, or contributor.

> [!CAUTION]
> Taking semantic model ownership permanently removes any stored credentials for the semantic model. Credentials must be re-entered to allow data refresh operations to resume.

Ideally, the semantic model owner is the user who's responsible for the semantic model. You should update the semantic model owner when they leave the organization or change roles. Also, be aware that when the semantic model owner's user account is disabled in Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)), data refresh is automatically disabled. In this case, another user must take ownership of the semantic model to allow data refresh operations to resume.

### Dataflow owner

Like semantic models, dataflows also have an owner, which is a single user account. The information and guidance provided in the previous topic about [semantic model owners](#semantic-model-owner) also applies to dataflow owners.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for security related to data refresh processes, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the strategy for semantic model owners:** Determine what preferences and requirements exist for managing semantic model owners.
> - **Decide on the strategy for dataflow owners:** Determine what preferences and requirements exist for managing dataflow owners.
> - **Include in documentation and training for semantic model creators:** Include guidance for your data creators about how to manage owners for each type of item.

## Related content

For other considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see the [subject areas](powerbi-implementation-planning-introduction.md#subject-areas) to consider.
