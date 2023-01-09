---
title: "Power BI implementation planning: Tenant-level workspace planning"
description: "This article introduces the Power BI workspace strategic planning decisions you should make at the tenant level."
author: kfollis
ms.author: kfollis
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/25/2022
---

# Power BI implementation planning: Tenant-level workspace planning

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This tenant-level workspace planning article is primarily targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization.
- **Center of Excellence, IT, and BI team:** The teams that are also responsible for overseeing Power BI and supporting self-service users throughout the organization.

Secondarily, this article may also be of interest to self-service BI creators who need to create, publish, and manage content in workspaces.

Since workspaces can be used in different ways, most tactical decisions will be made at the workspace level (described in the [next article](powerbi-implementation-planning-workspaces-workspace-level-planning.md)). However, there are some strategic planning decisions to make at the tenant level, too.

We recommend that you make the tenant-level workspace decisions as early as possible because they'll affect everything else. Also, it's easier to make individual workspace decisions when you have clarity on your overall workspace goals and objectives.

## Workspace creation permissions

The decision on who is allowed to create workspaces in the Power BI service is a [data culture](powerbi-adoption-roadmap-data-culture.md) and [governance](powerbi-adoption-roadmap-governance.md) decision. Generally, there are two ways to approach this decision:

- **All (or most) users are permitted to create new workspaces:** This approach usually aligns with existing decisions for other applications. For example, when users are permitted to create their own SharePoint sites or Teams channels, it makes sense that Power BI adopts the same policy.
- **Limited to a selective set of users who are permitted to create new workspaces:** This approach usually indicates a governance plan is in place or is planned. Managing this process can be fully centralized (for instance, only IT is permitted to create a workspace). A more flexible and practical approach is when it's a combination of centralized and decentralized individuals. In this case, certain satellite members of the Center of Excellence (COE), champions, or trusted users have been trained to create and manage workspaces on behalf of their business unit.

You should set up the **[Create workspaces](/power-bi/admin/service-admin-portal-workspace#create-the-new-workspaces)** tenant setting in the admin portal according to your decision on who is allowed to create workspaces.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering permissions for who can create workspaces, key decisions and actions include:

> [!div class="checklist"]
> - **Determine and validate user needs:** Schedule collaborative discussions with relevant stakeholders and interested parties to learn how users currently work. The goal is to ensure there's a clear understanding of user needs.
> - **Decide who is allowed to create workspaces:** Determine whether all users, only a centralized team, or certain centralized and decentralized people will be permitted to create a new workspace. Ensure this decision is purposefully aligned with your data culture goals. Be sure to obtain approval from your executive sponsor.
> - **Create a security group for who is permitted to create workspaces:** If a subset of users will be permitted to create workspaces, a security group is needed. Name the group clearly, like *Power BI workspace creators*. Add members who are permitted to create workspaces to this security group.
> - **Update the tenant setting:** Add the new security group to the **Create workspaces** tenant setting in the admin portal. In addition to the *Power BI workspace creators* group, other groups that might also be allowed for this tenant setting are the Power BI COE, Power BI support, and Power BI administrators.

## Workspace naming conventions

Workspace naming conventions are an agreed-upon pattern for how workspaces are named. Usually, naming conventions are more of a requirement than a suggestion.

It can be difficult to strictly enforce naming conventions when many users possess the permission to create workspaces. You can mitigate this concern with user education and training. You can also conduct an auditing process to find workspaces that don't conform to the naming conventions.

The workspace name can convey additional information about the workspace, including:

- **Purpose:** A workspace name should always include a description of its content. For example, *Sales Quarterly Bonus Tracking*.
- **Item types:** A workspace name can include a reference to the types of items it contains. For example, use *Sales Data* to indicate the workspace stores datasets, or use *Sales Analytics* to indicate the workspace stores reports and dashboards.
- **Stage (environment):** A workspace name might include its stage. For example, it's common to have separate workspaces for development, test, and production content.
- **Ownership and responsibility:** A workspace name might include an indication of who's responsible for managing the content. For example, use of an *SLS* prefix or suffix can indicate that the sales team owns and manages the content.

> [!TIP]
> To keep workspace names short, you can include additional detail in the workspace description. However, make sure that the most relevant information is included in the workspace name, particularly if you anticipate users will search for workspaces. You can also use a workspace image to augment the workspace name. These considerations are described further in the [workspace settings](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-settings) section in the next article.

Having consistent workspace names helps everyone. The user experience is improved because users can find content more easily. Also, administrators can oversee the content more easily.

We recommend that you include the workspace naming conventions in your [centralized portal](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) and [training materials](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#training).

The following list describes more considerations related to workspace naming.

- **Use short yet descriptive names:** The workspace name should accurately reflect its contents, with the most important part at the beginning of the name. In the Power BI service, long workspace names may become truncated in user interfaces, requiring the user to hover the cursor over the workspace name to reveal the full name in a tooltip. Here's an example of a short yet descriptive name: *Quarterly Financials*.
- **Use a standard prefix:** A standard prefix can arrange similar workspaces together when sorted. For example: *FIN-Quarterly Financials*.
- **Use a standard suffix:** You can add a suffix for additional information, such as when you use different workspaces for development, test, and production. We recommend appending *\[Dev\]* or *\[Test\]* but leaving production as a user-friendly name without a suffix. For example: *FIN-Quarterly Financials \[Dev\]*.
- **Be consistent with the app name:** The workspace name and its app can be different, particularly if it improves usability or understandability for app consumers. We recommend keeping the names at least similar to avoid confusion.
- **Omit unnecessary words:** The following words may be redundant, so avoid them in your workspace names:
  - The word *workspace*.
  - The words *Power BI*.
  - The name of the organization. However, when the primary audience is external users, including the organization's name can be helpful.

> [!NOTE]
> We recommend that you notify users when a workspace name will change. For the most part, it's safe to rename a workspace in the Power BI service because the *GroupID*, which is the unique identifier of a workspace, doesn't change (it's found in the workspace URL). However, XMLA connections are impacted because they connect by using the workspace name instead of the GroupID.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering creating workspace naming conventions, key decisions and actions include:

> [!div class="checklist"]
> - **Determine requirements or preferences for workspace names:** Consider how you want to name your workspaces. Decide whether you want strict naming convention requirements or more flexible requirements guided by suggestions and examples.
> - **Review existing workspace names:** Update existing workspace names as appropriate so that they're good examples for users to follow. When users see existing workspace being renamed, they'll interpret that as an implied standard to adopt.
> - **Create documentation for workspace naming conventions:** Provide reference documentation about workspace naming convention requirements and preferences. Be sure to include examples that show the correct use of acronyms, suffixes, and prefixes. Make the information available in your centralized portal and training materials.

## Workspace creation process

If you've decided to limit who can create workspaces, then the broader user population will need to know what the process is to request a new workspace. In this case, it's important to establish a request process that's easy and convenient for users to find and follow.

It's also critical to respond quickly to a request for a new workspace. A service level agreement (SLA) of 2-4 hours is ideal. If the process to request a new workspace is too slow or burdensome, people will use the workspaces they have so they can keep moving. If they elect to skip creating a new workspace, what they use instead may be suboptimal. They might choose to reuse an existing workspace that isn't well-suited to the new content, or they might share content from their personal workspace.

> [!TIP]
> The goal when creating a new process is to make it easy for people to comply with the process. As with all data governance decisions, the point is to make it easy for users to do the right thing.

The following table lists the information to collect in a request for a new workspace.

| **Information needed** | **Example** | **Validation required** |
| --- | --- | --- |
| Workspace name | SLS-Field Sales Analytics | Does the name adhere to naming conventions? </br></br>Does another workspace with the same name exist? |
| Stages needed | SLS-Field Sales Analytics \[Dev\], SLS-Field Sales Analytics \[Test\], and SLS-Field Sales Analytics | Are multiple workspaces necessary to properly support the content? </br></br>If so, should a [deployment pipeline](/power-bi/create-reports/deployment-pipelines-overview) be created too? |
| Description | Customer sales and order history for monthly, quarterly, and yearly analysis. | Is there an expectation that sensitive data, or regulated data, will be stored? </br></br>If so, will that affect how the workspace is governed? |
| Target audience | Global field sales organization | How broad is the content delivery scope? </br></br>How will that affect how the workspace is governed? |
| License mode assigned to the workspace | Premium capacity for the sales team is needed because a large number of the salespeople are viewers only and they have a free license | Is a Premium capacity or Premium Per User (PPU) required? |
| Data storage requirements | Data residency in Canada | Are there data residency needs that will require [Multi-Geo](/power-bi/admin/service-admin-premium-multi-geo)? </br></br>What are the expected data volumes? |
| Workspace administrators | PowerBIContentAdmins-FieldSalesAnalytics | Is the administrator (preferably) a group? </br></br>Are there at least two administrators? |
| Person submitting the request | requestor@contoso.com | Does the person submitting the request work in a role or line of business related to the information provided? |

The above table includes the minimum amount of information required to set up a workspace. However, it doesn't include all possible configurations. In most cases, a workspace administrator will take responsibility for completing the setup once the workspace is created. For more information, see the [Workspace-level settings](powerbi-implementation-planning-workspaces-workspace-level-planning.md) article.

There are many technology options you can use to create an online form for the workspace creation request. Consider using [Microsoft Power Apps](/power-apps/powerapps-overview), which is a low-code software option that's ideal for building simple web-based forms and applications. The technology you choose to use for creating a web-based form depends on who will be responsible for creating and maintaining the form.

> [!TIP]
> To improve efficiency and accuracy, consider automating the process by using the [Power BI REST API](/rest/api/power-bi/groups/create-group) to programmatically create or update a workspace. In this case, we recommend including review and approval processes rather than automatically processing each request.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering the process to request a new workspace, key decisions and actions include:

> [!div class="checklist"]
> - **Establish a process for requesting a new workspace:** Decide what the specific process is for requesting a new workspace. Consider the information you'll need, how to capture the information, and who will process the request.
> - **Create a standard form for requesting a new workspace:** Decide what information will be included on the form for a new workspace. Consider building a Power Apps app to collect the information from the user. Ensure links to the form are broadly available and easy to find in your centralized portal and other common locations. Include a link to the form in ongoing communications too.
> - **Decide who will respond to submitted requests, and how quickly:** Determine who'll process requests. Consider what the expected response time is for handling a request for a new workspace. Verify that you can handle requests quickly so that self-service users don't experience delays.
> - **Conduct a knowledge transfer session:** If another team will be supporting the workspace request process, conduct a knowledge transfer session with them so they have all the information they need.
> - **Create documentation for how to approve or deny a request:** Create documentation about how to approve a request, targeted at those who will review or process requests. Also include reasons why a request might be denied, and what action should be taken.
> - **Create documentation for how to request a workspace:** Create documentation about how to request a new workspace, targeted at users who can't create their own workspaces. Include what information is required, and expectations for a response. Ensure that the information is available in your centralized portal and training materials.

## Workspace governance level

Not all workspaces need the same level of oversight. Certain workspaces might be considered *governed*. A governed workspace means that there are more requirements and expectations for its content. Some organizations use the term *managed* instead of governed.

There are four key decision criteria to determine the level of governance:

- Who owns and manages the BI content?
- What is the scope for delivery of the BI content?
- What is the data subject area?
- Is the data, and/or the BI solution, considered critical?

> [!NOTE]
> For more information about the four key decision criteria, see the [governance](powerbi-adoption-roadmap-governance.md#decision-criteria) article that forms part of the [Power BI adoption roadmap](powerbi-adoption-roadmap-overview.md).

You might start out with two levels of workspaces: governed and ungoverned. We recommend that you keep the governance levels as simple as possible. However, depending on your specific circumstances, you might need to subdivide the governed classification. For example, critical content that's managed by the enterprise BI team might have one set of governance requirements. Whereas critical content that's owned and managed directly by business units may be subject to a slightly different set of requirements. In some cases, decisions will be tailored to individual business units.

The following table lists some of the most common requirements when a workspace is considered governed.

| **Category** | **Potential governance requirement** |
| --- | --- |
| Ownership and support | Ownership is assigned with clear responsibilities for the technical content owner and/or the subject matter expert. </br></br>User support team/person is assigned, and users understand how to request help or submit issues. </br></br>A mechanism is in place for user feedback, questions, and enhancement requests. </br></br>A communication plan exists to announce changes. |
| Workspace setup | The workspace is well-organized with a well-defined purpose. </br></br>A specific naming convention is used. </br></br>Workspace description, image, and contacts are required. |
| Accuracy | All content is certified. </br></br>Data quality and validations are automated. |
| Distribution | A Power BI app is used for content distribution. |
| Security and data protection | Azure AD groups are used (instead of individual accounts) for all security roles and permissions. </br></br>Sensitivity labels are used for information protection. </br></br>Only sanctioned (or approved) data sources are permitted. </br></br>All source files reside in a secure location that's backed up. |
| Change management | Separate development, test, and production workspaces are used. </br></br>Versioning or source control is used for all original files (development files and data source files). </br></br>Change management processes, including deployment pipelines and/or DevOps processes, are followed. |
| Premium | The workspace is assigned to Premium capacity or PPU. |
| Gateway | A gateway in standard mode (non-personal) is used. </br></br>All gateway data source credentials use approved credentials. |
| Auditing and monitoring | Active monitoring is in place for tracking adoption, usage patterns, and performance. |

> [!TIP]
> Governance requirements usually aren't optional. For this reason, timely auditing is important, and enforcement becomes necessary in certain situations. For example, if governed workspaces require all files be in a secure location and an unapproved file location is detected during auditing, then action should be taken to update the file location.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering the workspace governance level, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on the workspace governance levels:** Determine the levels of governance that you'll need. Try to keep it as simple as possible.
> - **Decide on the criteria for how to classify a workspace:** Determine what the decision criteria will be for classifying workspaces to a specific governance level.
> - **Decide what the workspace governance requirements are:** For each governance level, determine what the specific requirements will be.
> - **Decide how to designate the workspace governance level:** Find the simplest way to identify the governance level for a workspace. You could record it as part of its name, part of its description, or stored elsewhere (for example, a SharePoint list that contains more information about each workspace).
> - **Create documentation for workspace governance requirements:** Create useful documentation targeted at content creators that includes what their responsibilities are for managing content in a governed workspace. Make the information available in your centralized portal and training materials.
> - **Create workspace auditing processes:** For workspaces that are considered governed, create an auditing process to identify areas of noncompliance with the most important requirements. Ensure that someone is responsible for contacting content owners to address compliance issues.

## Next steps

In the [next article](powerbi-implementation-planning-workspaces-workspace-level-planning.md) in this series, learn about workspace-level planning.
