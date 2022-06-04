---
title: "Power BI implementation planning: Tenant-level workspace planning"
description: "TODO PBIIP workspaces - tenant-level workspace planning"
author: peter-myers
ms.author: v-petermyers
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 06/30/2022
---

# Power BI implementation planning: Tenant-level workspace planning

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

Since workspaces can be used different ways, most tactical decisions will be at the workspace-level. However, there are a few strategic planning considerations at the tenant-level.

We recommend you handle the tenant-level workspace decisions as early as possible because they'll affect everything else. It's easier to make individual workspace decisions when you have clarity on the overall goals and objectives.

## Workspace creation permissions

The decision on who is allowed to create workspaces in the Power BI service is a [data culture](powerbi-adoption-roadmap-data-culture.md) and a [governance](powerbi-adoption-roadmap-governance.md) decision. Generally, there are two ways to approach this decision:

- **All (or most) users are permitted to create new workspaces:** This approach usually aligns with existing decisions for other applications. For example, if users are permitted to create their own SharePoint sites or Teams channels, chances are Power BI will follow the same policy.
- **Limited to a selective set of users who are permitted to create new workspaces:** This approach usually indicates a governance plan is in place or planned. Managing this process can be fully centralized (for instance, only IT is permitted to create a workspace). A more flexible and practical approach is when it's a combination of centralized and decentralized individuals. In this case, certain satellite members of the Center of Excellence, champions, or trusted users have been trained in how to create and manage workspaces on behalf of their business unit.

The [**Create workspaces**](../admin/service-admin-portal-workspace.md#create-the-new-workspaces) tenant setting in the admin portal should be configured according to your decision for who is allowed to create workspaces.

When considering permissions for who can create workspaces, the key decisions and actions include:

> [!div class="checklist"]
> - **Determine and validate user needs:** Schedule collaborative discussions with relevant stakeholders and interested people to learn how users currently work. The goal is to ensure there's a clear understanding of user needs.
> -**Decide who is allowed to create workspaces:** Determine if all users, only a centralized team, or certain centralized and decentralized personnel will be permitted to create a new workspace. Ensure this decision is purposefully aligned with your data culture goals. Verify approval with your executive sponsor.
> - **Create a security group for who is permitted to create workspaces:** If a subset of users will be permitted to create workspaces, a security group will be needed. Name the group clearly, such as **Power BI workspace creators**. Add members to this security group who are permitted to create workspaces.
> - **Update the tenant setting:** Include the new security group in the **Create workspaces** tenant setting in the admin portal. In addition to the **Power BI workspace creators** group, other groups that might also be allowed for this tenant setting are the Power BI COE, Power BI support, and Power BI administrators.

## Workspace naming conventions

A workspace naming convention is an agreed-upon pattern for how workspaces should be named. Usually, a naming convention is more of a requirement than a suggestion. However, it's difficult to enforce a strict naming convention if a lot of users possess the permission to create workspaces. This concern can be mitigated with user education and training. It can also be mitigated with an auditing process that locates workspaces that don't conform to the desired naming convention.

The workspace name can indicate several things, such as:

- **Purpose:** A workspace name should always include a description of its contents. For example: Sales Quarterly Bonus Tracking.
- **Artifact types:** A workspace name can include a reference to the types of artifacts contained in it. For example, Sales Data is dedicated to datasets whereas Sales Analytics is dedicated to reports and dashboards.
- **Stage:** A workspace name might include its stage. For example, it's common to have separate workspaces for development, test, and production content.
- **Ownership and responsibility:** A workspace name might include an indication of who is responsible for managing the content. For example, use of an 'SLS' prefix or suffix might indicate that the Sales team owns and manages the content.

> [!TIP]
> To keep workspace names short, additional metadata can be included in the workspace description instead. The most relevant information should be included in the workspace name (particularly if you anticipate the need to use search). It's also useful to use the workspace image to augment the workspace name. These items are discussed further in the [workspace settings](#workspace-settings) section later in this article.

Having consistency in how workspaces are named helps everyone. The user experience is improved because users can find content more easily. Administrators can oversee the content more easily as well.

Additional considerations related to workspace naming include:

- **Use short yet descriptive names:** The name of the workspace should accurately reflect its contents, with the most important part at the beginning of the name. Longer workspace names do appear shorter in the Power BI service (requiring the user to hover their mouse to read the full workspace name). For example: Quarterly Financials.
- **Use a standard prefix:** A standard prefix can sort certain workspaces together. For example: FIN-Quarterly Financials.
- **Use a standard suffix:** A suffix can be used for additional information, such as when separate workspaces are used for development, test, and production. We recommend denoting \[Dev\] and \[Test\] but leaving production as a user-friendly name only without the suffix. For example: FIN-Quarterly Financials \[Dev\].
- **Be consistent with the app name:** The name for the workspace and its app can be different, particularly if it improves usability or understandability for consumers of the app. We recommend keeping the names close to each other to avoid confusion.
- **Omit unnecessary words:** The following items are usually unneeded and can be omitted from a workspace name:
  - The word workspace.
  - The words Power BI.
  - The organization's name. An exception here is when the primary audience will be external users. In that case, including the organization's name can be helpful to the users.

> [!NOTE]
> We suggest notifying users when a workspace name will be changed. For the most part, it's safe to rename a workspace in the Power BI service because the GUID that's assigned to the workspace does not change (the workspace GUID is part of the URL). However, XMLA connections are impacted because they use the workspace name instead of the GUID.

When considering creating workspace naming conventions, the key decisions and actions include:

> [!div class="checklist"]
> - **Determine requirements or preferences for workspace names:** Consider how you want workspaces to be named. Decide if you need firm naming convention requirements versus suggestions and examples.
> - **Review existing workspace names:** Update existing workspace names as appropriate. Be aware that existing workspace names that users see will often become a de facto standard going forward.
> - **Create documentation for workspace naming conventions:** Provide useful reference documentation about workspace naming conventions requirements and preferences. Include a set of good examples, including use of acronyms, suffixes, and prefixes. Make the information available in your centralized portal and training materials.

## Workspace creation process

If you have determined that the best choice is to limit who can create workspaces, then the broader user population will need to know what the process is to request a new workspace. It's important for the request process to be very easy and convenient for users to find and follow.

It's also critical to respond quickly to a request for a new workspace. A service level agreement (SLA) of 2-4 hours is ideal. If the process to request a new workspace is too slow, or too burdensome, people will use what they have so they can keep moving. If they elect to skip creating a new workspace, what they use instead may be sub-optimal. They might choose to reuse an existing workspace that isn't well-suited to the new content, or they might share the content from their personal workspace.

> [!TIP]
> The goal when creating a new process is to make it easy for people to comply with your process. In other words, make it easy for users to do the right thing.

The type of information to be collected in the request for a new workspace includes the following:

| **Information Needed** | **Example** | **Validation Required** |
| --- | --- | --- |
| Workspace name | SLS-Field Sales Analytics | Does the name follow naming conventions? Does another workspace of the same name exist? |
| Stages needed | SLS-Field Sales Analytics \[Dev\]SLS-Field Sales Analytics \[Test\]SLS-Field Sales Analytics | Are multiple workspaces necessary to properly support the content? If so, should a deployment pipeline be created as well? |
| Description | Customer sales and order history for monthly, quarterly, and yearly analysis | Is there an expectation that particularly sensitive data, or regulated data, will be stored here? If so, will that effect how the workspace is governed? |
| Target audience | Global field sales organization | How broad is the content delivery scope? How will that effect how the workspace is governed? |
| License mode assigned to the workspace | Premium capacity for the sales team – needed because a large # of the salespeople are viewers only | Is Premium capacity or PPU required? |
| Data storage requirements | Data residency in Canada | Are there data sovereignty needs that will require Premium capacity? |
| Workspace administrators | PowerBIContentAdmins-Topic@Org.com | Is this (preferably) a group? Or at least 2 administrators? |
| Person submitting the request | Name@Org.com | |

The above includes the minimum amount of information required to set up a workspace initially. However, it doesn't include all configuration items. In most cases, the primary workspace administrator will take responsibility for the remaining setup once the workspace has been created. These [workspace settings](#workspace-settings) are discussed later in this article.

There are a lot of technology options for creating a form to capture the information needed from a user. [Microsoft Power Apps](/power-apps/powerapps-overview) is another tool within [Microsoft Power Platform](https://powerplatform.microsoft.com/) suite of products. It's a low-code software option that's ideal for building simple web-based forms and applications. The technology you choose to use for creating a web-based form depends upon who will be responsible for creating and maintaining the form.

> [!TIP]
> You can obtain the information from a form, then use the [Power BI REST API](/rest/api/power-bi/groups/create-group) to programmatically create and update the new workspace in the Power BI service. Use of this type of automation can improve efficiency and is encouraged. However, we do suggest having someone review the information that was submitted rather than automatically processing all new requests.

When considering the process to request a new workspace, the key decisions and actions include:

> [!div class="checklist"]
> - **Establish a process for requesting a new workspace:** Decide what the specific process is for requesting a new workspace. Consider the information you'll need, how to capture the information, and who will process the request.
> - **Create a standard form for requesting a new workspace:** Decide what information will be included on the form for a new workspace. Consider using a Power App or similar technology for capturing the information from the user. Make links to the form readily available in your centralized portal.
> - **Decide who will respond to submitted requests, and how quickly:** Determine who will process the request. Consider what the expected response time is for handling a request for a new workspace. Verify you can handle requests quickly so that self-service users don't have a major delay.
> - **Conduct a knowledge transfer session:** If another team will be supporting the workspace request process, conduct a knowledge transfer session with them so they have all the information they need.
> - **Create documentation for how to request a workspace:** Create useful documentation about how to request a new workspace (targeted to users who can't create their own). Include what information will be required, and expectations for response. Make the information available in your centralized portal and training materials.

## Workspace governance level

Not all workspaces need the same level of oversight. Certain workspaces might be considered *governed*. Some organizations use the term *managed* instead. A governed workspace means that there are additional requirements and expectations for the content.

There are four key decision criteria (described further in the [governance](powerbi-adoption-roadmap-governance.md#decision-criteria) article of the [Power BI adoption roadmap](powerbi-adoption-roadmap-overview.md)) to determine the level of governance:

- Who owns and manages the BI content?
- What is the scope for delivery of the BI content?
- What is the data subject area?
- Is the data, and/or the BI solution, considered critical?

You might start out with two levels: governed and ungoverned. We recommend that you keep the governance levels as simple as possible. However, depending on your specific circumstances, you might need to subdivide the governed classification. For example, critical content that's managed by the enterprise BI team might have one set of governance requirements. Whereas critical content that's owned and managed directly by business units may be subject to a slightly different set of requirements. In some cases, decisions will be tailored to individual business units.

The following table includes some of the most common requirements when a workspace is considered governed:

| **Category** | **Potential governance requirement** |
| --- | --- |
| Ownership and support | Ownership is assigned, with clear responsibilities for technical content owner and/or subject matter expert.<br />User support team/person is assigned, and users are clear how to request help or submit issues.<br />A mechanism is in place for user feedback, questions, and enhancement requests.<br />A communication plan exists to announce changes. |
| Workspace setup | The workspace is well-organized with a well-defined purpose.<br />A specific naming contention is used. |
| Accuracy | All content is certified.<br />Data quality and validations are automated. |
| Distribution | A Power BI app is used for content distribution. |
| Security and data protection | Azure AD groups are used (instead of individuals) for all security roles and permissions.<br />Sensitivity labels are used for information protection.<br />Only sanctioned (or approved) data sources are permitted.<br />All source files reside in a secure location that's backed up. |
| Change management | Separate development, test, and production workspaces are used.<br />Versioning or source control is used for all original files (development files and data source files).<br />Change management processes, including deployment pipelines and/or DevOps processes are followed.<br /> |
| Premium | The workspace is assigned to Premium capacity or Premium Per User. |
| Gateway | A gateway in standard mode (non-personal) is used.<br />All gateway data source credentials use approved credentials. |
| Auditing and monitoring | Active monitoring is in place for tracking adoption, usage patterns, and performance. |

> [!TIP]
> Governance requirements usually aren't optional. For this reason, timely auditing is important. Enforcement becomes necessary for certain situations. For example, if governed workspaces require all files to be in a secure location, if a C:\ drive location is detected during auditing then action would be taken to update the file location.

When considering the workspace governance level, the key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the governance levels:** Determine on the levels of governance that you'll need. Keep it as simple as possible.
> - **Decide what the governance requirements are:** For each governance level, determine what the specific requirements will be.
> - **Decide how to classify the workspace governance level:** Find the simplest way to be able to identify the governance level for a workspace. This could be part of its naming convention, part of its description, or stored elsewhere (for instance, a SharePoint list that contains additional metadata for all workspaces).
> - **Create documentation for workspace governance requirements:** Create useful documentation, targeted to content creators, that includes what their responsibilities are for managing content in a governed workspace. Make the information available in your centralized portal and training materials.
> - **Create auditing processes:** For workspaces that are considered governed, create an auditing process to identify areas of noncompliance with the most important requirements. Ensure that someone is responsible for contacting the content owner to rectify the situation.

## Next steps

In the [next article](powerbi-implementation-planning-workspaces-workspace-level-planning.md) in this series, learn about workspace-level planning considerations.
