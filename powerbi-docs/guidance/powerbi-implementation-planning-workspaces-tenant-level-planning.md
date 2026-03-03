---
title: "Implementation Planning: Tenant-Level Workspaces"
description: "Review the strategic Power BI planning decisions you make at the tenant level for workspaces in Microsoft Fabric."
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: Workspaces at the tenant level

This article describes strategic implementation planning that you do at the _tenant level_ for [Microsoft Fabric workspaces](/fabric/fundamentals/workspaces), with an emphasis on the Power BI experience inside Fabric.

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

The article primarily is for:

- **Fabric administrators**: Administrators who are responsible for overseeing the Fabric implementation in the organization.
- **Center of Excellence (CoE), IT, and business intelligence (BI) teams**: Teams that are responsible for overseeing the use of data and BI in the organization, and for supporting self-service users throughout the organization.

This article might be helpful for self-service creators who create, publish, and manage content in workspaces.

Because workspaces can be used in different ways, most tactical implementation decisions are made at the [workspace level](powerbi-implementation-planning-workspaces-workspace-level-planning.md). You make some strategic planning decisions at the tenant level.

We recommend that you make tenant-level workspace decisions as early as possible because they affect everything else. Also, it's easier to make individual workspace decisions when you're clear about your overall workspace goals and objectives.

> [!NOTE]
> The concept of a workspace originated in Power BI. In Fabric, the purpose of a workspace broadens. A Fabric workspace can contain items from more than one [Fabric experience](/fabric/get-started/fabric-terminology) (also called a _workload_). Although the content scope is broader than in Power BI, you can apply most of the workspace planning activities described in these articles to planning your Fabric workspaces.

## Workspace creation permissions

The decision of who is allowed to create workspaces in the Power BI service is a [data culture](fabric-adoption-roadmap-data-culture.md) and [governance](fabric-adoption-roadmap-governance.md) decision.

You have two options:

- **All (or most) users can create new workspaces**: This approach usually aligns with existing decisions for other applications. For example, when users are permitted to create their own SharePoint sites or Teams channels, it makes sense that Fabric adopts the same policy.
- **Workspace creation is limited to a select set of users**: This approach usually indicates a governance plan is in place or is planned. Managing this process can be fully centralized (for example, if only IT is permitted to create a workspace). A more flexible and practical approach is when it's a combination of centralized and decentralized individuals. In this case, specific satellite members of the CoE, champions, or trusted users are trained to create and manage workspaces on behalf of their business units.

You should set up the [Create workspaces](/fabric/admin/portal-workspace#create-workspaces) tenant setting in the [Fabric admin portal](/fabric/admin/admin-center) according to your decision on who is allowed to create workspaces. For more information, see [Govern workspaces](powerbi-implementation-planning-tenant-administration.md#govern-workspaces).

:::image type="icon" source="media/common/checklist.svg" border="false":::

_Checklist_ of key decisions and actions when you plan who can create workspaces:

> [!div class="checklist"]
>
> - **Determine and validate user needs**: Schedule collaborative discussions with relevant stakeholders and interested parties to learn how users currently work. The goal is to ensure that you have a clear understanding of user needs.
> - **Decide who is allowed to create workspaces**: Determine whether all users, only a centralized team, or certain centralized and decentralized users can create a new workspace. Ensure that the decision purposefully aligns with your goals for data culture in the organization. Be sure to obtain approval from your executive sponsor.
> - **Create a security group for who is permitted to create workspaces**: If a subset of users can create workspaces, create a security group for these users. Name the group clearly, like **Fabric Workspace Creators**. Add members who are permitted to create workspaces to this security group.
> - **Update the tenant setting**: Add the new security group to the **Create workspaces** tenant setting in the admin portal. In addition to the Fabric Workspace Creators group, other groups that might be assigned this tenant setting are CoE, support, and Fabric administrators.

## Workspace naming conventions

Workspace naming conventions are an agreed-upon pattern for how workspaces are named. Usually, naming conventions are a requirement and not a suggestion.

It can be difficult to strictly enforce naming conventions when many users possess the permission to create workspaces. You can mitigate this concern with user education and training. You can also conduct an auditing process to find workspaces that don't conform to the naming conventions.

The workspace name can convey additional information about the workspace, including:

- **Purpose**: A workspace name should always include a description of its content. For example, _Sales Quarterly Bonus Tracking_.
- **Item types**: A workspace name can include a reference to the types of items it contains. For example, use _Sales Data_ to indicate the workspace stores items like a lakehouse or semantic models. _Sales Analytics_ could indicate that the workspace stores analytical reports and dashboards.
- **Stage (environment)**: A workspace name might include its stage. For example, it's common to have separate workspaces (development, test, and production) for [lifecycle management](/fabric/cicd/cicd-overview).
- **Ownership and responsibility**: A workspace name might include an indication of who's responsible for managing the content. For example, use of an _SLS_ prefix or suffix can indicate that the sales team owns and manages the content.

> [!TIP]
> To keep workspace names short, you can include more detail in the workspace description. However, make sure that the most relevant information is included in the workspace name, particularly if you anticipate that users will search for workspaces. You can also use a workspace image to augment the workspace name. These considerations are described further in the [workspace settings](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-settings) section in the next article.

Having consistent workspace names helps everyone. The user experience is improved because users can find content more easily. Also, administrators can oversee the content more easily when you use predictable naming conventions.

We recommend that you include the workspace naming conventions in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) and [training materials](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training).

The following list describes more considerations related to workspace naming.

- **Use short yet descriptive names**: The workspace name should accurately reflect its contents, with the most important part at the beginning of the name. In the Fabric portal, long workspace names can become truncated in user interfaces, requiring the user to hover the cursor over the workspace name to reveal the full name in a tooltip. Here's an example of a short yet descriptive name: _Quarterly Financials_.
- **Use a standard prefix**: A standard prefix can arrange similar workspaces together that are sorted. For example: _FIN-Quarterly Financials_.
- **Use a standard suffix**: You can add a suffix for additional information, such as when you use different workspaces for development, test, and production. We recommend appending _\[Dev\]_ or _\[Test\]_ suffixes but leaving production as a user-friendly name without a suffix. For example: _FIN-Quarterly Financials \[Dev\]_.
- **Be consistent with the Power BI app name**: The workspace name and its Power BI app can be different, particularly if it improves usability or understandability for app consumers. We recommend keeping the names similar to avoid confusion.
- **Omit unnecessary words**: The following words might be redundant, so avoid them in your workspace names:

  - The word _workspace_.
  - The words _Fabric_ or _Power BI_. Many Fabric workspaces contain items from various workloads. However, you might create a workspace intended to target only a specific workload (such as Power BI, Data Factory, or Synapse Data Engineering). In that case, you might choose a short suffix so that the workspace purpose is made clear.
  - The name of the organization. However, when the primary audience is external users, including the organization's name can be helpful.

> [!NOTE]
> We recommend that you notify users when a workspace name is scheduled to change. In most scenarios, it's safe to rename a workspace in the Fabric portal. The **GroupID** value, the unique identifier of a workspace, doesn't change and is part of the workspace URL. However, [XMLA connections](../enterprise/service-premium-connect-tools.md) are affected because they connect by using the workspace name instead of the **GroupID** value.

:::image type="icon" source="media/common/checklist.svg" border="false":::

_Checklist_ of key decisions and actions when you plan workspace naming conventions:

> [!div class="checklist"]
>
> - **Determine requirements or preferences for workspace names**: Consider how you want to name workspaces. Decide whether to create strict naming convention requirements or allow more flexible requirements guided by suggestions and examples.
> - **Review existing workspace names**: Update existing workspace names as appropriate so that they're good examples for users to follow. When users see an existing workspace renamed, they interpret that as an implied standard to adopt.
> - **Create documentation for workspace naming conventions**: Provide reference documentation about workspace naming convention requirements and guidelines. Be sure to include examples that show the correct use of acronyms, prefixes, and suffixes. Make the information available in your centralized portal and in training materials.

## Workspace domains

Essential to the planning and implementation process is being clear about how you want content owned and managed. Clarity is especially critical when responsibilities for creating and managing data assets are decentralized among many departments or business units. Sometimes this approach is called a _distributed_, _federated_, or _data mesh_ architecture.

One way to support workspace ownership and management in Fabric is by using domains. A _domain_ provides a way to logically group multiple workspaces that have similar characteristics. For example, you might create a domain to group all your sales workspaces together, and create another domain to hold your finance workspaces.

Here are the key advantages of using domains:

- Domains group similar workspaces into a single management boundary.
- Domains permit certain tenant settings to be managed at the domain level. For more information, see [Override tenant-level settings](/fabric/governance/domains#override-tenant-level-settings).
- Domains help users find relevant data. For example, they can use filters in the [OneLake catalog](/fabric/governance/onelake-catalog#scope-the-catalog-to-a-particular-domain).

The following table lists different ways you can organize related workspaces:

| Method for organizing workspaces | Example domain |
|---|---|
| By subject area, domain, or content type | The _Finance_ domain includes all workspaces related to finance content. |
| By the team or department that owns and manages the content | The _Enterprise BI_ domain includes all workspaces that the team is directly responsible for managing. |
| By organizational business unit or segment | The _European division_ domain includes all workspaces that are directly related to operations in Europe. |
| By project | The _Subsidiary acquisition_ domain includes all workspaces that support a highly sensitive project. |

Here are some questions to consider when you plan for Fabric domains in your tenant:

- **How does each workspace map to a domain?** Each workspace can be assigned to only one domain, so be prepared to do some detailed planning. Consider creating a matrix diagram that lists workspaces in the rows and domains in the columns to help you plan how they're assigned. If you discover that you need to reorganize workspaces, you can reassign the domain in the workspace settings or in the admin portal.
- **Who is authorized to manage a domain?** Users assigned the Domain Administrator role are authorized to manage an existing domain. When possible, assign domain administrators who directly own and manage the content for the domain. Domain administrators should be experts who are familiar with internal, regional, and governmental regulations for the subject area. They should also be familiar with all internal governance and security requirements. For more information, see [Domain roles](/fabric/governance/domains#domain-roles).
- **Who is allowed to assign workspaces to a domain?** Users assigned the Domain Contributor role define which workspace administrators can assign a workspace to a domain. If you allow more users to assign workspaces to a domain, you should frequently audit the accuracy of the assigned groupings. If you allow only specific groups of users or Fabric admins and domain admins, you have more control over how domains are assigned. For more information, see [Domain roles](/fabric/governance/domains#domain-roles).
- **Do you have specific compliance needs or restrictions, such as geographic area?** Keep in mind that the geographic area for data storage is set for each capacity rather than for the domain. Consider how assigning a workspace to a domain and to a capacity affects your planning process.

For more information, see [Govern domains](powerbi-implementation-planning-tenant-administration.md#govern-domains).

:::image type="icon" source="media/common/checklist.svg" border="false":::

_Checklist_ of key decisions and actions when you plan for workspace domains:

When you plan for workspace domains, key decisions and actions include:

> [!div class="checklist"]
>
> - **Validate how content ownership works**: Ensure that you deeply understand how content ownership and management is happening throughout the organization. Factor that information into your plans to organize workspaces into domains.
> - **Plan workspace domains**: Have discussions to plan how to best organize workspaces into domains. Confirm all key decisions with the CoE and your executive sponsor.
> - **Educate Fabric administrators**: Ensure that your tenant administrators are familiar with how to create a domain, and how to assign and manage domain administrators.
> - **Educate domain administrators**: Ensure that your domain administrators understand the expectations for this role in managing a domain.
> - **Decide how to handle domain contributors**: Consider which users should have permission to assign workspaces to a domain.
> - **Create an auditing process**: On a regular basis, validate that the assigned domain groupings are correct.

## Workspace creation process

If you decide to limit who can create workspaces, the broader user population needs to know what the process is to request a new workspace. In this case, it's important to establish a request process that's easy and convenient for users to find and follow.

It's also critical to respond quickly to a request for a new workspace. A service-level agreement (SLA) of 2 to 4 hours is ideal. If the process to request a new workspace is too slow or burdensome, people will use the workspaces they have, so they can keep moving. If they elect to skip creating a new workspace, what they use instead could be suboptimal. They might choose to reuse an existing workspace that isn't well-suited to the new content, or they might share content from their personal workspace.

> [!TIP]
> When you create a new process, the goal  is to make it easy for people to comply with the process. Like with all data governance decisions, the point is to make it easy for users to follow documented processes.

The following table lists the information to collect in a request for a new workspace:

| Information needed | Example | Validation required |
| --- | --- | --- |
| Workspace name | SLS-Field Sales Analytics | &bull;&nbsp;Does the name follow naming conventions? <br/><br/>&bull;&nbsp;Does another workspace with the same name exist? |
| Stages needed | SLS-Field Sales Analytics \[Dev\], SLS-Field Sales Analytics \[Test\], and SLS-Field Sales Analytics | &bull;&nbsp;Are multiple workspaces necessary to properly support the content? <br/><br/>&bull;&nbsp;If so, should a [deployment pipeline](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) be created too? |
| Description | Customer sales and order history for monthly, quarterly, and yearly analysis. | &bull;&nbsp;Is there an expectation that sensitive data or regulated data will be stored? <br/><br/>&bull;&nbsp;If so, will that affect how the workspace is governed? |
| Target audience | Global field sales organization | &bull;&nbsp;How broad is the content delivery scope? <br/><br/>&bull;&nbsp;How will that scope affect how the workspace is governed? |
| Workspace type assigned to the workspace | A Fabric capacity for the sales team is needed because a large number of the salespeople are viewers only and they have a free license | &bull;&nbsp;What level of [Fabric capacity](/fabric/enterprise/licenses#capacity-and-skus) is required? |
| Data storage requirements | Data residency in Canada | &bull;&nbsp;Do data residency needs require [Multi-Geo](/fabric/admin/service-admin-premium-multi-geo?tabs=power-bi-premium)? <br/><br/>&bull;&nbsp;What quantity of data do you expect to process and store? |
| Workspace administrators | FabricContentAdmins-FieldSalesAnalytics | &bull;&nbsp;Is the administrator (preferably) a group? <br/><br/>&bull;&nbsp;Are at least two administrators assigned? |
| Person submitting the request | <requestor@contoso.com> | &bull;&nbsp;Does the person submitting the request work in a role or line of business related to the information provided? |

This table includes the minimum amount of information required to set up a workspace. However, it doesn't include all possible configurations. In most cases, a workspace administrator takes responsibility for completing the setup after the workspace is created. For more information, see [Workspace-level settings](powerbi-implementation-planning-workspaces-workspace-level-planning.md).

You can choose from many technology options to create an online form for the workspace creation request. Consider using [Microsoft Power Apps](/power-apps/powerapps-overview), a low-code software option that's ideal for building simple web-based forms and applications. The technology you choose to use for creating a web-based form depends on who is responsible for creating and maintaining the form.

> [!TIP]
> To improve efficiency and accuracy, consider automating the process by using the [Power BI REST API](/rest/api/power-bi/groups/create-group) to programmatically create or update a workspace. In this case, we recommend including review and approval processes rather than automatically processing each request.

:::image type="icon" source="media/common/checklist.svg" border="false":::

_Checklist_ of key decisions and actions when you plan the process to request a new workspace:

> [!div class="checklist"]
>
> - **Establish a process for requesting a new workspace**: Decide what the specific process is for requesting a new workspace. Consider the information you'll need, how to capture the information, and who processes the request.
> - **Create a standard form for requesting a new workspace**: Decide what information to include on the form for a new workspace. Consider building a Power Apps app to collect the information from the user. Ensure links to the form are broadly available and easy to find in your centralized portal and other common locations. Include a link to the form in ongoing communications too.
> - **Decide who will respond to submitted requests and how quickly**: Determine who'll process requests. Consider what the expected response time is for handling a request for a new workspace. Verify that you can handle requests quickly so that self-service users don't experience delays.
> - **Conduct a knowledge transfer session**: If another team will support the workspace request process, conduct a knowledge transfer session with them so they have all the information they need.
> - **Create documentation for how to approve or deny a request**: Create documentation about how to approve a request, targeted at those who will review or process requests. Also include reasons why a request might be denied, and what action should be taken.
> - **Create documentation for how to request a workspace**: Create documentation about how to request a new workspace, targeted at users who can't create their own workspaces. Include what information is required, and expectations for a response. Ensure that the information is available in your centralized portal and in training materials.

## Workspace governance level

Not all workspaces need the same level of oversight. Certain workspaces might be considered _governed_. A governed workspace results in more requirements and expectations for its content. Some organizations use the term _managed_ instead of governed.

Four key decision criteria determine the level of governance required:

- Who owns and manages the BI content?
- What is the scope for delivery of the BI content?
- What is the data subject area?
- Is the data or the BI solution considered critical?

> [!NOTE]
> For more information about the four key decision criteria, see the [governance](fabric-adoption-roadmap-governance.md#decision-criteria) article in the [Fabric adoption roadmap](fabric-adoption-roadmap.md).

You might start out with two levels of workspaces: governed and ungoverned. We recommend that you keep the governance levels as simple as possible. However, depending on your specific circumstances, you might need to subdivide the governed classification. For example, critical content that the enterprise Power BI team manages might have a unique set of governance requirements. Critical content that business units own and manage might be subject to a slightly different set of requirements. In some cases, decisions are tailored to individual business units.

The following table lists some of the most common requirements when a workspace is considered governed.

| Category | Potential governance requirement |
| --- | --- |
| Ownership and support | &bull;&nbsp;[Ownership](fabric-adoption-roadmap-content-ownership-and-management.md) is assigned, with clear responsibilities for the technical content owner or subject matter expert. <br/><br/>&bull;&nbsp;[User support](fabric-adoption-roadmap-user-support.md) team/person is assigned, and users understand how to request help or submit issues. <br/><br/>&bull;&nbsp;A mechanism is in place for user feedback, questions, and enhancement requests. <br/><br/>&bull;&nbsp;A [communication plan](fabric-adoption-roadmap-community-of-practice.md#communication-plan) exists to announce important changes to content in the workspace. |
| Workspace setup | &bull;&nbsp;The workspace is well-organized with a well-defined purpose. <br/><br/>&bull;&nbsp;A specific naming convention is used. <br/><br/>&bull;&nbsp;The workspace is assigned to a specific [domain](/fabric/governance/domains). <br/><br/>&bull;&nbsp;Workspace description, image, and contacts are required. |
| Accuracy | &bull;&nbsp;All content is [certified](../collaborate-share/service-endorse-content.md). <br/><br/>&bull;&nbsp;Data validations are automated so that content owners become aware of data quality issues on a timely basis. |
| Distribution | &bull;&nbsp;A [Power BI app](../collaborate-share/service-create-distribute-apps.md) is used for distributing reports and dashboards. |
| Security and data protection | &bull;&nbsp;[Security groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups) are used (instead of individual accounts) for managing [workspace roles](/fabric/get-started/roles-workspaces#workspace-roles). <br/><br/>&bull;&nbsp;Sensitivity labels are used for [information protection](powerbi-implementation-planning-info-protection.md). <br/><br/>&bull;&nbsp;Only sanctioned (or approved) data sources are permitted. <br/><br/>&bull;&nbsp;All source files reside in a secure, backed-up location. |
| Change management | &bull;&nbsp;Separate development, test, and production workspaces are used. <br/><br/>&bull;&nbsp;Source control (such as [Git integration](/fabric/cicd/git-integration/intro-to-git-integration)) is used for all Power BI Desktop files and items in the Fabric portal. <br/><br/>&bull;&nbsp;Versioning or source control is used for all data source files. <br/><br/>&bull;&nbsp;[Lifecycle management](/fabric/cicd/best-practices-cicd) and change management processes, including deployment pipelines or DevOps processes, are followed. |
| Capacity | &bull;&nbsp;The workspace is assigned to an appropriate [Fabric capacity](/fabric/enterprise/licenses#capacity-and-skus) level. <br/><br/>&bull;&nbsp; The Fabric capacity is managed and monitored. |
| Gateway | &bull;&nbsp;A [data gateway](fabric-adoption-roadmap-system-oversight.md#data-gateway-architecture-and-management) in standard mode (nonpersonal) is used. <br/><br/>&bull;&nbsp;All gateway data source credentials use approved credentials. |
| Auditing and monitoring | &bull;&nbsp;Active [auditing and monitoring](powerbi-implementation-planning-auditing-monitoring-overview.md) processes are in place for tracking adoption, usage patterns, and performance. |

> [!TIP]
> Governance requirements usually aren't optional. For this reason, timely auditing is important, and enforcement becomes necessary in certain situations. For example, if governed workspaces require all files to be in a secure location and an unapproved file location is detected during an audit, a required action is to update the file location.

:::image type="icon" source="media/common/checklist.svg" border="false":::

_Checklist_ of key decisions and actions when you plan workspace governance level:

> [!div class="checklist"]
>
> - **Decide on the workspace governance levels**: Determine the levels of governance that you'll need. Keep it as simple as possible.
> - **Decide on the criteria for how to classify a workspace**: Determine what the decision criteria to use to classify workspaces to a specific governance level.
> - **Decide what the workspace governance requirements are**: For each governance level, determine what the specific requirements.
> - **Decide how to designate the workspace governance level**: Find the simplest way to identify the governance level for a workspace. You could record it as part of its name, part of its description, or stored elsewhere (for example, a SharePoint list that contains more information about each workspace).
> - **Create documentation for workspace governance requirements**: Create useful documentation targeted at content creators that includes what their responsibilities are for managing content in a governed workspace. Make the information available in your centralized portal and in training materials.
> - **Create workspace auditing processes**: For workspaces that are considered governed, create an auditing process to identify areas of noncompliance with the most important requirements. Ensure that someone is responsible for contacting content owners to address compliance issues.

## Next step

> [!div class="nextstepaction"]
> [Power BI implementation planning: Workspaces at the workspace level](powerbi-implementation-planning-workspaces-workspace-level-planning.md)
