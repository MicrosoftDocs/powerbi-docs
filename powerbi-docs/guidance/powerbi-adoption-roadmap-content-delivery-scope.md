---
title: "Power BI adoption roadmap: Content delivery scope"
description: Develop scopes for how BI content is owned and managed to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi
ms.topic: reference
ms.date: 06/30/2021
---

# Power BI adoption roadmap: Content delivery scope

The four delivery scopes discussed in this article include personal BI, team BI, departmental BI, and enterprise BI. Focusing on the scope of a delivered BI solution does refer to the number of people who may view the solution, though the impact is much more than that. The scope strongly influences best practices for content distribution, sharing, security, and information protection. The scope has a direct correlation on the level of [governance](powerbi-adoption-roadmap-governance.md) (such as requirements for change management, support, or documentation), the extent of [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md), and needs for [user support](powerbi-adoption-roadmap-user-support.md). It also has a big effect on [user licensing](../admin/service-admin-licensing-organization.md) decisions.

The related [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article makes similar points. Whereas the focus of that article was on the content creator, this article is focused on the target usage of the content. Both inter-related aspects need to be considered to arrive at governance decisions and the Center of Excellence operating model.

> [!IMPORTANT]
> All data and all solutions are not equal. Be prepared to apply different levels of data management and governance to different teams and various types of content. Standardized rules are easier to maintain, but flexibility or customization is often necessary to apply the appropriate level of oversight based on circumstances. Your [executive sponsor](powerbi-adoption-roadmap-executive-sponsorship.md) can be invaluable in decision-making and reaching consensus across stakeholder groups when tricky situations come up.

## Scope of content delivery

The following visual focuses on the number of target users who will consume the content:

:::image type="content" source="media/powerbi-adoption-roadmap-content-delivery-scope/powerbi-adoption-roadmap-target-consumers.png" alt-text="Image shows the four scopes of target consumers, which are described next.":::

The four scopes of content delivery shown in the above visual include:

- **Personal BI:** Personal BI solutions are, as the name implies, intended for usage by the creator. Sharing the content with others is not an objective. Therefore, personal BI has the fewest number of target consumers.
- **Team BI:** Collaborating and sharing content with a relatively small number of colleagues who work closely together is the primary objective for team BI.
- **Departmental BI:** Content is delivered to members of a department or business unit. Delivery of content to a larger number of consumers is a priority for departmental BI.
- **Enterprise BI:** Content is delivered broadly across organizational boundaries. Enterprise content is most often managed by a centralized team and is subject to additional governance requirements. Enterprise BI usually has the largest number of target consumers of the content.

Contrast the above with the following visual which has an inverse relationship with respect to the number of content creators:

:::image type="content" source="media/powerbi-adoption-roadmap-content-delivery-scope/powerbi-adoption-roadmap-content-creators.png" alt-text="Image shows the four scopes of content creators, which are described next.":::

The four scopes of content creators shown in the above visual include:

- **Personal BI:** Personal BI content creators represent the largest number of creators because any user can work with data using business-led self-service BI methods. Although managed self-service BI methods can be used, it's less common with personal BI.
- **Team BI:** Team BI content creators are the next largest number of creators in the organization because many colleagues collaborate and share with each other using business-led self-service BI patterns. Managed self-service BI patterns may also begin to emerge as skill levels advance.
- **Departmental BI:** Departmental BI content creators are a smaller population of creators, and they are more likely to be considered power users who are using more sophisticated tools to create more sophisticated solutions. Managed self-service BI practices are very common and highly encouraged.
- **Enterprise BI:** Enterprise BI involves the smallest number of content creators because this typically includes only professional BI developers who work on the BI team, the Center of Excellence, or in IT.

The [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article introduced the concepts of business-led self-service BI, managed self-service BI, and enterprise BI. The most common alignment between ownership and delivery scope is:

- **Business-led self-service BI ownership** : commonly deployed as personal and team BI solutions
- **Managed self-service BI ownership** : can be deployed as personal, team, or departmental BI solutions
- **Enterprise BI ownership:** deployed as enterprise BI-scoped solutions

Some organizations also equate self-service content with community-based support (i.e., self-service content creators and owners are responsible for supporting the content they publish). The [user support](powerbi-adoption-roadmap-user-support.md) article discusses multiple informal and formal levels for support.

> [!WARNING]
> The term "sharing" can be interpreted two ways. It's often used in a general way related to sharing content with colleagues (which could be implemented multiple ways). It can also reference a [specific feature in Power BI](../collaborate-share/service-share-dashboards.md) (which is a specific implementation in which a user or group is granted view-only access to a single report or dashboard). In this article we primarily use the term in a general way to discuss sharing content with colleagues. When the specific sharing feature is intended, this article will make a clear reference to that feature.

## Personal BI

The intention with personal BI is for an individual person to gain analytical value, and more efficiently perform business tasks through the effective personal use of data, information, and analytics. This could be any type of information worker in the organization, not just data analysts and developers.

No sharing of the content with others is intended. Personal content can reside in Power BI Desktop or in a personal workspace in the Power BI service. Usage of "my workspace" is permitted with a free Power BI license.

Characteristics of personal BI:

- The creator's primary intention is data exploration and analysis (rather than report delivery).
- The content is intended to be analyzed and consumed by one person: the creator.
- The content may be an exploratory proof of concept that may or may not evolve into a project.

Guidelines for being successful with personal BI:

- Consider personal BI solutions akin to an "analytical sandbox" which has little formal governance and oversight from the governance team or COE. However, it's still appropriate to educate content creators that some general governance guidelines may still apply to personal content. Examples: Is a personal report allowed to be exported and emailed to others? May a personal report reside on a non-organizational laptop or device? What limitations or requirements exist for content which contains sensitive data?
- See the techniques discussed for business-led self-service BI and managed self-service BI in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article which are highly relevant to help content creators be efficient and effective with their personal BI solutions.
- Analyze data from the [activity log](../admin/service-admin-auditing.md) to reveal situations where personal BI solutions appear to have expanded beyond the original intended usage. This is usually discovered by detecting significant usage of the sharing feature for content in a personal workspace.

> [!TIP]
> See the [adoption maturity levels](powerbi-adoption-roadmap-maturity-levels.md) article for a discussion about how users progress through the stages of user adoption. See the [system oversight](powerbi-adoption-roadmap-system-oversight.md) article for discussion about usage tracking via the activity log.

## Team BI

Team BI is focused on a team of people who work closely together, and who are tasked with solving closely related problems using the same data. Collaborating and sharing content with each other in a workspace is usually the primary objective. Due to this work style, team members will typically each have a [Power BI Pro](../admin/service-admin-purchasing-power-bi-pro.md) or [Premium Per User](../admin/service-premium-per-user-faq.yml) license.

Content is often shared among the team more informally than departmental or enterprise BI. For instance, a workspace is often sufficient for consuming content when the additional layer of a Power BI app isn't necessary for a small team. There's not a specific size or number of people where team-based delivery is too informal and departmental delivery starts to make sense; each organization and each team will find their own balance.

Characteristics of team BI:

- Content is created, managed, and viewed among a group of colleagues who work closely together.
- Collaboration and co-management of content is the highest priority.
- Formal delivery of reports may occur by report viewers (especially for managers of the team), but this is usually a secondary priority.
- Reports are not always highly sophisticated or attractive; functionality and obtaining the information is what's most important.

Guidelines for being successful with team BI:

- Ensure the COE is prepared to support the efforts of self-service creators publishing content for their team.
- Make purposeful decisions about how [workspace](../collaborate-share/service-create-the-new-workspaces.md) management will be handled. The workspace is a place to organize related content, a permissions boundary, and the scope for an app. It's tempting to start with one workspace per team, but that may not be flexible enough to satisfy all needs.
- See the techniques discussed for business-led self-service BI and managed self-service BI in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article, which are highly relevant to help content creators be efficient and effective when creating team BI solutions.

## Departmental BI

Content is delivered to members of a department or business unit. Content distribution to a larger number of consumers is a priority for departmental BI.

Usually there's a much larger number of consumers who are content viewers (versus a much smaller number of content creators). Therefore, a combination of [Power BI Pro](../admin/service-admin-purchasing-power-bi-pro.md) licenses, [Premium Per User](../admin/service-premium-per-user-faq.yml) licenses, and/or [Premium capacity](../admin/service-premium-faq.yml) licenses may be used.

Characteristics of departmental BI delivery:

- A few content creators typically publish content for colleagues to consume.
- Formal delivery of reports and apps is a high priority to ensure consumers have the best experience.
- Additional effort is made in the sophistication level of reports. Following best practices for data preparation and higher quality data modeling is also expected.
- Needs for change management and application lifecycle management (ALM) begin to emerge to ensure stability and a consistent experience for consumers.

Guidelines for being successful with departmental BI delivery:

- Ensure the COE is prepared to support the efforts of self-service creators. The creators who publish content used throughout their department or business unit may emerge as candidates to be champions or may be candidates to get involved with the COE as a satellite member.
- Make purposeful decisions about how [workspace](../collaborate-share/service-create-the-new-workspaces.md) management will be handled. The workspace is (a) a place to organize related content, (b) a permissions boundary, and (c) the scope for an app. Several workspaces will likely be required to meet all the needs of a large department or business unit.
- Plan for how [apps](../consumer/end-user-apps.md) will be used for enterprise BI content delivery. An app can provide a significantly better experience for delivering content. In many cases, content consumers can be granted permissions to view content via the app only, reserving workspace permissions management for content creators only.
- Educate content creators on useful techniques for handling data quality validations. As the scope of criticality grows, expectations for trustworthiness grow as well.
- Ensure that adequate training, mentoring, and documentation is available to support content creators. Best practices for data preparation, data modeling, and data presentation will increase quality and value for solutions.

- Provide guidance on the best way to use the promoted [endorsement](../collaborate-share/service-endorse-content.md), and when the certified endorsement may be permitted for departmental BI solutions.

- Ensure that an owner is identified for all departmental content. Clarity on ownership is helpful for: who to contact with questions, feedback, enhancement requests, or support requests. In the Power BI service, the [contact list property](../create-reports/service-item-contact.md) can be set on most types of artifacts. The contact is also used in security workflows (for instance, when a user was sent a URL, doesn't have access, and clicks the request access button).
- Consider using [deployment pipelines](../create-reports/deployment-pipelines-overview.md) in conjunction with separate [workspaces](../collaborate-share/service-create-the-new-workspaces.md) for development, test, and production to provide more stability for consumers.
- Consider requiring use of [sensitivity labels](../admin/service-security-data-protection-overview.md) to implement information protection on all content.
- Include consistent branding on reports to align with departmental colors and styling and to indicate who the content was produced by (see the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article for a discuss about ownership). A small icon or label in the report footer is valuable when the report is exported out of the Power BI service. A standard template (discussed in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article) can encourage and simplify the consistent use of branding.
- See the techniques discussed for business-led self-service BI and managed self-service BI in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article which are highly relevant to help content creators be efficient and effective when creating departmental BI solutions.

## Enterprise BI

Content is delivered broadly across organizational boundaries. Enterprise content is typically managed by a centralized team and is subject to additional governance requirements.

Enterprise BI usually has a significantly larger number of consumers versus content creators. Therefore, a combination of [Power BI Pro](../admin/service-admin-purchasing-power-bi-pro.md) licenses, [Premium Per User](../admin/service-premium-per-user-faq.yml) licenses, and/or [Premium capacity](../admin/service-premium-faq.yml) licenses may be used.

Characteristics of enterprise BI delivery:

- A centralized team of BI experts manages the content end-to-end and publishes it for others to consume.
- Formal delivery of reports and apps is a high priority to ensure consumers have the best experience.
- The content is highly sensitive, subject to regulatory requirements, or considered extremely critical.
- Published enterprise-level datasets and dataflows may be used as a source for self-service creators, thus creating a chain of dependencies on the original data.
- Stability and a consistent experience for consumers are of high importance. Application lifecycle management (such as [deployment pipelines](../create-reports/deployment-pipelines-overview.md) and [DevOps techniques](https://powerbi.microsoft.com/blog/automate-deployments-with-deployment-pipelines-api-preview/)) is commonly used. Change management processes to review and approve changes before they're deployed are commonly used for enterprise BI content (ex: by a change review board or similar group).
- Processes exist to gather requirements, prioritize efforts, and plan for new projects or enhancements to existing content.
- Integration with other enterprise-level data architecture and management services may exist (for example, other Azure and Power Platform services).

Guidelines for being successful with enterprise BI delivery:

- Governance and oversight techniques discussed in the [governance](powerbi-adoption-roadmap-governance.md) article are relevant for managing enterprise BI solution. This particularly includes change management and application lifecycle management. Plan for how to effectively use [Premium Per User](../admin/service-premium-per-user-faq.yml) or [Premium capacity](../admin/service-premium-faq.yml) licensing per workspace. Align your workspace management strategy (i.e., how [workspaces](../collaborate-share/service-create-the-new-workspaces.md) are organized and secured) to this [licensing](../admin/service-admin-licensing-organization.md) strategy.
- Plan for how Power BI apps will be used for enterprise BI content delivery. An app can provide a significantly better experience for delivering content. Align the app distribution strategy with your workspace management strategy.
- Consider requiring use of [sensitivity labels](../admin/service-security-data-protection-overview.md) to implement information protection on all content.
- Implement a rigorous process for use of the certified [endorsement](../collaborate-share/service-endorse-content.md) for enterprise BI reports and apps (plus datasets and dataflows, when the expectation is that self-service creators will use them as a source). Not all enterprise BI content needs to be certified, but much of it probably will be.
- Make it a common practice to announce when changes will occur. See the [community of practice](powerbi-adoption-roadmap-community-of-practice.md) article for a discussion of the types of communication.
- Include consistent branding on reports to align with enterprise colors and styling requirements, and to indicate who the content was produced by (see the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article for a discuss about ownership). A small icon or label in the report footer is valuable when the report is exported out of the Power BI service. A standard template (discussed in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article) can encourage the consistent use of branding.
- Leverage the [lineage view](../collaborate-share/service-data-lineage.md) to manage dependencies, perform impact analysis, and communicate to downstream content owners when changes will occur.
- See the techniques discussed for enterprise BI in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article which are highly relevant for managing enterprise BI solutions.
- See the techniques discussed in the [system oversight](powerbi-adoption-roadmap-system-oversight.md) article for auditing, governing, and overseeing enterprise BI content.

## Considerations and key actions

Considerations and key actions you can take to strengthen your approach to content delivery:

- Ensure that guidelines, documentation, and other resources align with the strategic goals defined for Power BI adoption.
- Clarify the scopes for content delivery in your organization, who they apply to, and how they align with governance decisions. Ensure this is consistent with how [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) is handled.
- Consider how to handle situations when a smaller team wants to publish content for an enterprise-wide audience. Will this require the content to be owned and managed by a centralized team (considerations are discussed in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article, which is an inter-related concept with content delivery scope)? Will there be an approval process? Governance becomes more complicated when the scope of content delivery is broader than the owner of the content (for example, an app is distributed to the entire organization from a divisional sales team).
- Create helpful documentation for your community of content creators to understand when it's most appropriate to use [workspaces](../collaborate-share/service-create-the-new-workspaces.md), [apps](../collaborate-share/service-create-distribute-apps.md), or [sharing (direct access or link sharing)](https://powerbi.microsoft.com/blog/announcing-the-new-sharing-experience/).
- Ensure you have a specific strategy in place to handle user licensing considerations for [Power BI Pro](../admin/service-admin-purchasing-power-bi-pro.md), [Premium Per User](../admin/service-premium-per-user-faq.yml), and [Premium capacity](../admin/service-premium-faq.yml). Create a process for how workspaces may be assigned each license type, and what prerequisites are for what type of content may be assigned to Premium.

## Maturity levels

The following maturity levels will help you assess the current state of your content delivery:

| **Level** | **State of Power BI content delivery** |
| --- | --- |
| 100: Initial | Content is published by self-service creators in an uncontrolled way, without a specific strategy. |
| 200: Repeatable | Pockets of good practices exist which depend on the knowledge, skills, and habits of the content creator. |
| 300: Defined | Clear guidelines are defined and communicated for what can and cannot occur for each delivery scope. These guidelines are followed by some, but not all, groups across the organization. |
| 400: Capable | Criteria are defined to align governance requirements for self-service vs. enterprise content.</br></br>Guidelines are followed by most, or all, groups across the organization.Change management requirements are in place to approve critical changes to content which is distributed to a larger audience.</br></br>Changes are announced so the downstream effects are known to content consumers, and those creators with a dependency on existing content. |
| 500: Efficient | Proactive measures are taken to communicate with a user when any concerning user activities are detected in the activity log.</br></br>Analysis is conducted regularly to evaluate the business value that's achieved for solutions that are deployed. |

## Next steps

In the [next article in this series](powerbi-adoption-roadmap-center-of-excellence.md), learn more about the Center of Excellence.
